# ------------------------
# Version: 1.0.0
# Author: Shuichi Sugiura
# Date: 2025-08-07
# Code Name: Cerisier
# Description:
# This Shiny app randomly assigns stimulus durations (e.g., 30,45,55) in a non-repeating order
# to each participant and outputs the result to a UTF-8 BOM encoded CSV.
# Fully compatible with Excel on Windows/macOS (no garbled characters).
# ------------------------

library(shiny)

# ==== UI ====
ui <- fluidPage(
  titlePanel("Experimental Trial Randomizer"),
  sidebarLayout(
    sidebarPanel(
      numericInput("n_sub", "Number of Participants (N)", value = 100, min = 1),
      textInput("durations", "Stimulus Durations (comma-separated)", value = "30, 45, 55"),
      numericInput("seed", "Seed (optional)", value = NA),
      textInput("filename", "CSV Filename (without extension)", value = "trial_order"),
      actionButton("generate", "Generate Random Orders"),
      downloadButton("download", "Download CSV"),
      hr(),
      helpText(strong("App Info")),
      helpText("Version: 1.0.0"),
      helpText("Author: Shuichi Sugiura"),
      helpText("Code Name: Cerisier"),
      helpText("Date: 2025-08-07")
    ),
    mainPanel(
      tableOutput("table")
    )
  )
)

# ==== Server ====
server <- function(input, output) {
  results <- reactiveVal(data.frame())

  observeEvent(input$generate, {
    # Convert input to numeric vector
    dur_vec <- as.numeric(unlist(strsplit(input$durations, ",")))

    # Input validation
    if (any(is.na(dur_vec)) || length(unique(dur_vec)) != length(dur_vec)) {
      showNotification("Please enter distinct numbers separated by commas (e.g., 30,45,55)", type = "error")
      return()
    }

    # Set seed for reproducibility
    if (!is.na(input$seed)) {
      set.seed(input$seed)
    }

    # Generate random orders
    orders <- replicate(input$n_sub, sample(dur_vec), simplify = FALSE)

    df <- data.frame(ID = 1:input$n_sub)
    for (i in seq_along(dur_vec)) {
      df[[paste0("Trial", i)]] <- sapply(orders, `[`, i)
    }

    results(df)
  })

  # Render table
  output$table <- renderTable({
    results()
  })

  # CSV download (UTF-8 BOM)
  output$download <- downloadHandler(
    filename = function() {
      fname <- trimws(input$filename)
      if (nchar(fname) == 0) fname <- paste0("output_", Sys.Date())
      paste0(fname, ".csv")
    },
    content = function(file) {
      # Write BOM
      writeBin(charToRaw('\ufeff'), file)
      # Append CSV
      write.table(results(), file, sep = ",", row.names = FALSE, fileEncoding = "UTF-8", append = TRUE, col.names = TRUE)
    }
  )
}

# ==== Launch App ====
shinyApp(ui = ui, server = server)
