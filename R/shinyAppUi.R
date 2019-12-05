####Multi-tab user interface####
shinyAppUi <- navbarPage("RNAseq CNA analysis", id = "tabs",

                 #Input tab

                 tabPanel("Input",

                          fluidPage(

                            titlePanel("Input"),

                            sidebarLayout(

                              sidebarPanel(
                                fileInput("metadata", "metadata files"),
                                htmlOutput("mess_metadata"),
                                br(),
                                fileInput("config", "config file"),
                                htmlOutput("mess_config"),
                                checkboxInput("adjust_in", "Apply diploid adjustement", value = TRUE),
                                br(),
                                checkboxInput("arm_lvl", "Generate arm level figures (increases run-time)", value = TRUE),
                                br(),
                                checkboxInput("estimate", "Plot with estimate labels", value = TRUE),
                                br(),
                                actionButton("preview", "Generate preview figure"),
                                br(),
                                br(),
                                actionButton("analyze", "Analyze all samples")
                              ),
                              mainPanel(
                                plotOutput("arr", width = "100%", height = "auto"),
                                plotOutput("plot_arm")
                              )
                            )

                          )
                 ),
                 tabPanel("Analysis",

                          fluidPage(

                            tags$style(type = "text/css",
                            "label {font-size: 16px;}"
                            ),

                            titlePanel("Manual Analysis"),
                            br(),
                            br(),
                                           fluidRow(
                                             column(3,
                                                      wellPanel(
                                                        h3("Select Figures"),
                                                        br(),
                                                        uiOutput("figure_select"),
                                                        br(),
                                                        uiOutput("chr_sel"),
                                                        br(),
                                                        h3("Estimation correction"),
                                                        br(),
                                                        uiOutput("type_text"),
                                                        br(),
                                                        br(),
                                                        uiOutput("gender_text"),
                                                        br(),
                                                        br(),
                                                        uiOutput("chromn_text"),
                                                        br(),
                                                        br(),
                                                        uiOutput("alt_text"),
                                                        htmlOutput("examp"),
                                                        htmlOutput("war_message"),
                                                        br(),
                                                        br(),
                                                        uiOutput("comments_text"),
                                                        br(),
                                                        br(),
                                                        fluidRow(
                                                          column(6,
                                                                 uiOutput("default")
                                                          ),
                                                          column(3, offset = 3,
                                                                 uiOutput("save_butt")
                                                          )
                                                        ),
                                                        fluidRow(
                                                          column(3, offset = 9,
                                                                 htmlOutput("status"))
                                                        )
                                                      )
                                               ),
                                               column(9,
                                                  fluidRow(
                                                    column(2,
                                                           uiOutput("prev_butt")
                                                      ),
                                                    column(8,
                                                           htmlOutput("sample_num")
                                                    ),
                                                    column(2,
                                                           uiOutput("next_butt"))
                                                  ),
                                                  fluidRow(
                                                    column(12,
                                                           imageOutput("main_fig", width = "100%", height = "auto")
                                                    )
                                                  ),
                                                  conditionalPanel(condition = "output.chr_choices != null",
                                                    fluidRow(
                                                      column(2,
                                                             uiOutput("prev_butt_chr")
                                                        ),
                                                      column(2, offset = 8,
                                                             uiOutput("next_butt_chr"))
                                                    ),
                                                    fluidRow(
                                                      column(12,
                                                             imageOutput("chr_fig", width = "100%", height = "auto")
                                                        )
                                                    )
                                                  )
                                               )
                                             )
                          )
                 ),
                 tabPanel("Export",

                          fluidPage(

                            titlePanel("Export analyzed table"),

                            sidebarLayout(

                              sidebarPanel(

                                uiOutput("columns"),
                                br(),
                                br(),
                                uiOutput("exp_out_dir"),
                                htmlOutput("mess_exp_out"),
                                br(),
                                br(),
                                uiOutput("format"),
                                br(),
                                br(),
                                uiOutput("export"),
                                htmlOutput("export_mess")

                              ),

                              mainPanel(

                                h2("Output preview"),
                                br(),
                                br(),
                                tableOutput("prev_tab")

                              )

                            )
                          ))
)