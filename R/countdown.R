#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
countdown <- function(count = 5*60,
                      format = "ms",
                      width = NULL,
                      height = NULL,
                      elementId = NULL) {

  # parse format
  # TODO adjust for more variety
  days <- grepl(pattern = "d", x = format)
  hours <- grepl(pattern = "h", x = format) | days
  minutes <- grepl(pattern = "m", x = format) | hours
  seconds <- grepl(pattern = "s", x = format) | minutes


  # set inputs for js widgets
  parameter = list(
    count = count,
    days = days,
    hours = hours,
    minutes = minutes,
    seconds = seconds,
    sep = ":",
    format = format
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'countdown',
    x = parameter,
    width = width,
    height = height,
    package = 'shinyTimer',
    elementId = elementId
  )
}

#' Shiny bindings for countdown
#'
#' Output and render functions for using countdown within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a countdown
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name countdown-shiny
#'
#' @export
countdownOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'countdown', width, height, package = 'shinyTimer')
}

#' @rdname countdown-shiny
#' @export
renderCountdown <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, countdownOutput, env, quoted = TRUE)
}
