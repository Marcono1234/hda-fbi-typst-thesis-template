// Central place for third-party package imports, to ensure consistent versions are used
//
// For your thesis project add an additional `package-imports.typ` file in the root directory,
// import from this file here and declare your own imports, for example:
// ```
// #import "/thesis-template/package-imports.typ": *
// #import "@preview/chronos:0.2.1"
// ```

// Note: This approach for managing imports in a single place seems to be the recommended
// one currently, see https://forum.typst.app/t/how-to-manage-package-dependencies-in-a-single-place/5767

#import "@preview/glossarium:0.5.6"
