# Use this: https://shiny.rstudio.com/articles/generating-reports.html
#setwd('/Users/asanchez3/Desktop/Work/reportGenerator360/')
source("global_utils.R", local = TRUE) #global functions available for the whole session
# 
function(input, output, session) {
  # download pre-generated PDF -----------------------------
  
  # observeEvent(input$previewReport,{
  #   output$previewPDF <- renderUI({
  #     #tags$iframe(src=paste0(input$inTopic,"_",.getCountryCode(input$inCountry),".pdf"), width="600", height="400")
  #     a(href=paste0(input$inTopic,"_",.getCountryCode(input$inCountry),".pdf"), target="_blank", "Click here for the results...")
  #   })
  # })
  #   
  observeEvent(input$generateReport,{
  
    do.call(.reportGenerator, args = list(couName = input$inCountry, input_reportID = input$inTopic))
    output$previewPDF <- renderUI({
      #tags$iframe(src=paste0(input$inTopic,"_",.getCountryCode(input$inCountry),".pdf"), width="600", height="400")
      a(href=paste0(input$inTopic,"_",.getCountryCode(input$inCountry),".pdf"), target="_blank", "Click here for the results...")
    })
  })  
    
  # generateThisReport <- eventReactive(input$generateReport,{
  # 
  #   do.call(.reportGenerator, args = list(couName = input$inCountry, input_reportID = input$inTopic))
  # })
  # 
  # output$generateThisReport <- renderUI({
  # 
  #   input$generateReport
  #   isolate({ # Use isolate() to avoid dependency on input values
  # 
  #     .reportGenerator(input$inCountry, input$inTopic)
  #   })
  # })
  # 
  # download on the fly PDF ----------------------------
  # output$downloadReport <- downloadHandler(
  #   
  #   filename = paste0("templates/",input$inTopic,"_final_pdf/",input$inTopic,"_",.getCountryCode(input$inCountry),".pdf"),
  #   content = function(file) file.copy(paste0("templates/",input$inTopic,"_final_pdf/",input$inTopic,"_",.getCountryCode(input$inCountry),".pdf"), file),
  #   contentType = 'application/pdf'
  #   # Set up parameters to pass to Rnw document
  #   #outputArgs = list(couName = input$inCountry, input_reportID = input$inTopic)
  # )
  
}
  
  