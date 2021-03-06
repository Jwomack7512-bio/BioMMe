#This tab corresponds to the "Execute Model" under Run Model Tab
#  Justin Womack
#  January 26, 2021
#  Last Update: January 26, 2021
#  MCW, Milwaukee, WI, USA
#-------------------------------------------------------------------------

TAB_RUN_EXECUTE <- tabItem(tabName = "TAB_RUN_EXECUTE",
                           tabBox(
                             id = "box3",
                             title = NULL,
                             width = 12,
                             tabPanel(
                               title = "Options",
                               fluidRow(
                                 column(
                                   width = 8,
                                   fluidRow(
                                     textInput(inputId = "execute_time_start"
                                               ,label = "Starting Time"
                                               ,value = "0")
                                     ,textInput(inputId = "execute_time_end"
                                                ,label = "End Time"
                                                ,value = "10")
                                     ,textInput(inputId = "execute_time_step"
                                                ,label = "Time Step"
                                                ,value = "0.1")
                                   )
                                 ),
                                 column(
                                   width = 4,
                                   align = "right",
                                   div(style = "padding-top: 33px",
                                       awesomeCheckbox(
                                         inputId = "execute_show_advanced_options",
                                         label = "Advanced Options",
                                         value = FALSE)
                                   )
                                 )
                               ),
                               conditionalPanel(
                                 condition = "input.execute_show_advanced_options",
                                 hr(),
                                 h2(tags$u(tags$b("Advanced Options"))),
                                 fluidRow(
                                  column(
                                    width = 2,
                                    div(style = "padding-top: 33px",
                                        checkboxInput(inputId = "execute_turnOn_time_scale_var"
                                                      ,label = "Scale Output"
                                                      ,value = FALSE)
                                    )
                                  ),
                                  column(
                                    width = 4,
                                    align = "left",
                                    conditionalPanel(
                                      condition = "input.execute_turnOn_time_scale_var",
                                        textInput(inputId = "execute_time_scale_var"
                                                  ,label = "Time Scale Variable"
                                                  ,value = "1")
                                      )
                                    )
                                  
                                ),
                               hr(),
                                fluidRow(
                                  column(
                                    width = 4,
                                    pickerInput(inputId = "execute_ode_solver_type"
                                                ,label = "Select ODE solver"
                                                ,choices = c("lsoda"
                                                             ,"lsode"
                                                             ,"lsodes"
                                                             ,"lsodar"
                                                             ,"vode"
                                                             ,"daspk"
                                                             ,"euler"
                                                             ,"rk4"
                                                             ,"ode23"
                                                             ,"ode45"
                                                             ,"radau"))
                                  )
                                )
                              ),
                           fluidRow(
                             column(
                               width = 3,
                               offset = 9,
                               align = "right",
                               actionButton(inputId = "execute_run_model"
                                            ,label = "Run Solver"
                                            ,width = "145px")
                             )
                           )
                             ),
                             tabPanel(
                               title = "Post Processing",
                               fluidRow(
                                 textInput(inputId = "pp_new_var"
                                           ,label = "New Variable Name"
                                           ,value = ""),
                                 div(style = "padding-top:30px;
                                              padding-left:5px;
                                              padding-right:5px;",
                                     "="),
                                 pickerInput(inputId = "pp_add_vars"
                                             ,label = "Variables to Add"
                                             ,choices = c()
                                             ,multiple = TRUE
                                             ,options = list(
                                               title = "Select Variables To Add"
                                             )),
                                 pickerInput(inputId = "pp_sub_vars"
                                             ,label = "Variables to Subtract"
                                             ,choices = c()
                                             ,multiple = TRUE
                                             ,options = list(
                                               title = "Select Variables To Subtract"
                                             ))
                               ),
                               fluidRow(
                                 column(
                                   width = 10,
                                   verbatimTextOutput(outputId = "pp_built_equation"
                                                      ,placeholder = TRUE)
                                 ),
                                 column(
                                   width = 2,
                                   align = "right",
                                   actionBttn(inputId = "pp_submit_new_var"
                                              ,label = "Submit")
                                 )
                               )
                             ),
                           tabPanel(
                             title = "Download",
                             downloadButton(
                               outputId = "download_model_results",
                               label = "Download"
                             )
                           )
                           )
                           # ,shinycssloaders::withSpinner(DTOutput("execute_table_for_model"))
                           ,DTOutput("execute_table_for_model")
                            
                            
)