/// Functions for validating arguments to public API
// TODO: Remove once Typst supports type annotations, see https://github.com/typst/typst/issues/317
//   or replace with https://github.com/typst-community/valkyrie ?

#let _format-path(path) = if path.len() == 0 { " " } else {
  (
    " at path "
      + path
        .map(item => if type(item) == int { "[" + str(item) + "]" } else {
          "[\"" + item.replace("\"", "\\\"") + "\"]"
        })
        .join("")
      + " "
  )
}

#let _check-arg(arg, validator, path, errors) = {
  if type(validator) == function {
    // call the validator function
    errors += validator(arg, path)
  } else if type(validator) == array {
    // validate array
    if validator.len() == 1 {
      if type(arg) != array {
        errors.push("expected argument" + _format-path(path) + "to be an array")
        return errors
      }

      let item-validator = validator.at(0)

      for (index, value) in arg.enumerate() {
        let nested-path = array(path)
        nested-path.push(index)
        errors = _check-arg(value, item-validator, nested-path, errors)
      }
    } // validate dict, with custom key validator
    else if validator.len() == 2 {
      if type(arg) != dictionary {
        errors.push("expected argument" + _format-path(path) + "to be a dictionary")
        return errors
      }

      let key-validator = validator.at(0)
      let value-validator = validator.at(1)

      for (key, value) in arg.pairs() {
        let nested-path = array(path)
        nested-path.push(key)
        // TODO: This causes confusing error messages because it refers to the key as "value"
        errors = _check-arg(key, key-validator, nested-path, errors)
        errors = _check-arg(value, value-validator, nested-path, errors)
      }
    } else {
      panic("unsupported validator", validator)
    }
  } // validate dict, with static key names
  else if type(validator) == dictionary {
    if type(arg) != dictionary {
      errors.push("expected argument" + _format-path(path) + "to be a dictionary")
      return errors
    }

    let expected-keys = validator.keys()
    let actual-keys = arg.keys()
    let missing-keys = expected-keys.filter(k => not actual-keys.contains(k))
    let unexpected-keys = actual-keys.filter(k => not expected-keys.contains(k))

    if missing-keys.len() > 0 {
      errors.push("argument" + _format-path(path) + "is missing keys: " + missing-keys.join(", "))
    }
    if unexpected-keys.len() > 0 {
      errors.push("argument" + _format-path(path) + "has unexpected keys: " + unexpected-keys.join(", "))
    }

    for (key, value) in arg.pairs() {
      if unexpected-keys.contains(key) {
        continue
      }

      let value-validator = validator.at(key)
      let nested-path = array(path)
      nested-path.push(key)
      errors = _check-arg(value, value-validator, nested-path, errors)
    }
  } else if type(validator) == type {
    if type(arg) != validator {
      errors.push("expected argument" + _format-path(path) + "to have type: " + str(validator))
    }
  } else {
    if arg != validator {
      errors.push("expected argument" + _format-path(path) + "to have value: " + str(validator))
    }
  }

  return errors
}

#let check-arg(arg, validator) = {
  let errors = _check-arg(arg, validator, (), ())
  if errors.len() > 0 {
    panic(errors.join("; "))
  }
}

/// Validator which allows the argument to match any of the specified choices.
#let arg-choice(..choices) = {
  if choices.pos().len() < 2 {
    panic("must specify at least 2 choices")
  }

  let validate-choice(arg, path) = {
    let all-errors = ()
    for c in choices.pos() {
      let errors = _check-arg(arg, c, (), ())
      if errors.len() == 0 {
        // found matching choice
        return
      }
      all-errors += errors
    }

    // TODO: Better reporting for this?
    return ("expected argument" + _format-path(path) + "to fullfil one of: [" + all-errors.join(" | ") + "]",)
  }
  validate-choice
}

/// Variant of @arg-choice which checks for the type of the arguments, and creates more
/// concise error messages than @arg-choice.
#let arg-type-choice(..choices) = {
  let allowed-types = choices.pos()
  if allowed-types.len() < 2 {
    panic("must specify at least 2 choices")
  }
  if not allowed-types.all(t => type(t) == type) {
    panic("must only specify types")
  }

  let validate-choice(arg, path) = {
    if not allowed-types.contains(type(arg)) {
      ("expected argument" + _format-path(path) + "to have one of those types: " + allowed-types.join(", "),)
    }

    ()
  }
  validate-choice
}

/// Validator which always passes. Useful when not performing validation for a specific argument
/// but instead letting Typst or a third-party package validate it when they use it.
#let arg-any() = {
  let validate-any(arg, path) = ()
  validate-any
}
