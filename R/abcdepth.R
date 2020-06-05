#' Calculate ABC depth of a point
#'
#' @param data A matrix (or dataframe) with the data within which to calculate depth
#' @param point The point for which to calculate the depth (make sure that ncol(data) == length(point))
#' @return The depth of the point within the given dataset.
#' @export
abcdepth <- function(data, point) {
  ABCDepth <- rJava::.jnew("org.prng.ea.tukey.ABCDepth")

  jmat <- jdx::convertToJava(as.matrix(data))
  jmat <- rJava::.jcast(jmat, "[[D")

  jpt <- jdx::convertToJava(as.numeric(point))
  jpt <- rJava::.jcast(jpt, "[D")

  depth <- rJava::.jcall(ABCDepth, returnSig = "D", "calculateDepth", jmat, jpt)

  return(depth)
}
