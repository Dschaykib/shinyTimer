#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
EasyTimer <- function(seconds = 30,
                      countdown = TRUE,
                      message = "Time has run out!",
                      width = NULL,
                      height = NULL,
                      elementId = NULL) {

  # forward options using x
  x = list(
    seconds = seconds,
    countdown = countdown,
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'EasyTimer',
    x,
    width = width,
    height = height,
    package = 'shinyTimer',
    elementId = elementId
  )
}


# Add custom HTML to wrap the widget to allow for a zoom in/out menu
EasyTimer_html <- function(id, style, class, ...){
  htmltools::tags$div(
    id = id, style = style, class = class,
    htmltools::div(
      class = "EasyTimerTmp2"),
    htmltools::div(
      class = "timer-menu",
      style = "position: absolute;",
      htmltools::tags$button(class = "timer-start", "start"),
      htmltools::tags$button(class = "timer-pause", "pause"),
      htmltools::tags$button(class = "timer-stop", "stop"),
      htmltools::tags$button(class = "timer-reset", "reset")
    )
  )
}

#' Shiny bindings for EasyTimer
#'
#' Output and render functions for using EasyTimer within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a EasyTimer
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name EasyTimer-shiny
#'
#' @export
EasyTimerOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'EasyTimer', width, height, package = 'shinyTimer')
}

#' @rdname EasyTimer-shiny
#' @export
renderEasyTimer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, EasyTimerOutput, env, quoted = TRUE)
}
