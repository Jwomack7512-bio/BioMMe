#This tab corresponds to the "Differential Equations" tab
#-------------------------------------------------------------------------
#  Justin Womack
#  January 5, 2021
#  Last Update: January 5, 2021
#  MCW, Milwaukee, WI, USA
#-------------------------------------------------------------------------

TAB_diffEqs <- tabItem(tabName = "TAB_diffEqs",
                      fluidRow(
                        column(
                          width = 12,
                          box(
                            id = "diffeq_box",
                            title = "System of Differential Equations"
                            ,solidHeader = TRUE
                            ,collapsible = FALSE
                            ,closable = FALSE
                            ,width = 12
                            ,htmlOutput(outputId = "diffeq_display_diffEqs")
                            ,hr()
                            ,fluidRow(
                              column(
                                width = 12,
                                align = "right",
                                actionButton(inputId = "diffeq_generate_equations"
                                             ,label = "Generate")
                              )
                            )
                            ,sidebar = boxSidebar(
                              id = "diffeq_sidebar"
                              ,icon = icon("bars", lib = "font-awesome")
                              ,width = 25
                              ,checkboxInput(inputId = "diffeq_option_simplify"
                                             ,label = "Simplify Equations"
                                             ,value = FALSE)
                              ,checkboxInput(
                                "diffeq_custom_option",
                                "Create Custom Equation",
                                value = FALSE
                              )
                            )
                          )
                        )
                      ),
                      conditionalPanel(
                        condition = "input.diffeq_custom_option",
                        fluidRow(
                          column(
                            width = 12,
                            box(
                              title = "Custom Differential Equations"
                              ,solidHeader = TRUE
                              ,collapsible = FALSE
                              ,closable = FALSE
                              ,width = 12
                              ,fluidRow(
                                column(
                                  width = 3,
                                  pickerInput(
                                    "diffeq_var_to_custom",
                                    "Species For Customization",
                                    choices = c()
                                  )
                                ),
                                column(
                                  width = 7,
                                  textInput(
                                    "diffeq_custom_eqn",
                                    "Custom Equation",
                                    value = "",
                                    placeholder = "k_f1*A-k_r1*B"
                                  )
                                ),
                                column(
                                  width = 2,
                                  div(style = "padding-top:28px",
                                      actionButton(
                                        "diffeq_custom_eqn_button",
                                        "Customize")
                                  )
                                )
                              ),
                              "Note that any custom equation will disable that equation to be solved for by the computer. 
                              You can choose to allow equation to be generated by adding it below",
                              fluidRow(
                                pickerInput(
                                  inputId = "diffeq_multi_custom_eqns",
                                  label = "Custom Equations to Ignore",
                                  choices = c(),
                                  multiple = TRUE
                                )
                              )
                            )
                          )
                        )
                      )
                      
)#end tabItem



