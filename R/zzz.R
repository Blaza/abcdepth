#' @import rJava
#' @import jdx
NULL

.onLoad <- function(libname, pkgname) {
  .jpackage(pkgname, lib.loc=libname)
}
