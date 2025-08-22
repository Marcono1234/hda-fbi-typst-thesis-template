= Basic formatting

Typst supports basic formatting such as _italic_, *bold* or `code` text.

It also supports footnotes #footnote[which can contain additional information that might disrupt the reading flow].

== Lists

You can create bullet point lists:

- first

- second

Or numbered lists:

+ first

+ second

And also nest those list types:

- first
  + nested
    - super nested


If you don't add blank lines between the list items, the list becomes "tight":
- there is
- less space
- between the items

== Quotes

You can create inline quotes #quote[like this], or block quotes:

#quote(block: true, attribution: [Someone])[
  Don't quote me on this. #lorem(7)
]

== Code blocks

Typst natively supports code blocks -- with syntax highlighting:

```java
class Main {
  public static void main(String... args) {
    System.out.println("hello world");
  }
}
```

== Math

Writing a Math-heavy thesis? How about writing some formulas like $a^2 + b^2 = c^2$, or maybe:

$
  lim_(n->oo) (1 - 1/n)^n = 1/e
$

== Tables

Got some data to visualize? Use tables:

#table(
  columns: 2,
  table.header[Number][Word],
  [1], [one],
  [2], [two],
  [3], [three],
)
