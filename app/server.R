# Control Sys.sleep times
times <- c(4, 2, 1)

function(input, output, session) {
  # Sys.sleep
  react1 <- eventReactive(input$run1, {
    out <- system.time(
      Sys.sleep(times[1] + rexp(n = 1, rate = 3))
    )
    
    return(out[3])
  })
  react2 <- eventReactive(input$run2, {
    out <- system.time(
      Sys.sleep(times[2] + rexp(n = 1, rate = 3))
    )
    
    return(out[3])
  })
  react3 <- eventReactive(input$run3, {
    out <- system.time(
      Sys.sleep(times[3] + rexp(n = 1, rate = 3))
    )
    
    return(out[3])
  })
  
  # outputs
  output$out1 <- renderUI({
    tags$span(round(react1()), style = "font-size: 5vw;")
  })
  output$out2 <- renderUI({
    tags$span(round(react2()), style = "font-size: 5vw;")
  })
  output$out3 <- renderUI({
    tags$span(round(react3()), style = "font-size: 5vw;")
  })
}