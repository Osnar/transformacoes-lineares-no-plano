# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2026 Marcelo Osnar Rodrigues de Abreu e Aline Edlaine de Medeiros

library(shinyBS)
library(shinyWidgets)
library(shinythemes)
library(shinydashboard)
library(shinydashboardPlus)
library(shiny)
library(plotly)
library(shinyMatrix)
library(DT)

shinyUI(tagList(navbarPage('',theme = shinytheme("flatly"),
                                 
                                 # Application title
                                 
                                 tabPanel("Escalonamento",
                                          fluidRow(column(2), column(2, pickerInput(
                                            inputId = "linhas",
                                            label = "Quantidade de linhas", 
                                            choices = list(Linhas = c('1','2','3','4','5')),
                                            selected = '3'
                                            
                                          )
                                          ),
                                          column(2, pickerInput(
                                            inputId = "colunas",
                                            label = "Quantidade de colunas", 
                                            choices = list(Colunas = c('1','2','3','4','5','6','7','8','9','10')),
                                            selected = '6'
                                            
                                          )
                                          )#,
                                          #column(1, style="padding:25px;", actionButton("meu_botao3", "Atualizar matriz")), column(1, style="padding:25px;", actionButton("meu_botao2", "Resetar Matriz"))
                                          ),
                                          fluidRow(column(2), column(6, matrixInput(
                                            inputId = 'matriz',
                                            label = 'Matriz a ser operada',
                                            value = matrix(c(1,2,3,1,0,0,4,5,6,0,1,0,7,8,9,0,0,1), 3, 6, byrow = T),
                                            inputClass = "",
                                            rows = list(names = c('linha 1','linha 2','linha 3')),
                                            cols = list(names = c('coluna 1','coluna 2','coluna 3')),
                                            cells = list(),
                                            class = "numeric",
                                            paste = FALSE,
                                            copy = FALSE,
                                            copyDoubleClick = FALSE,
                                            pagination = FALSE,
                                            lazy = FALSE,
                                            formatCell = NULL  )), column(2, textOutput("text"))),
                                          fluidRow(column(2), column(4, radioGroupButtons(
                                            inputId = "opera",
                                            label = "Operação", 
                                            choices = c("Multiplicar linha por um número", "Trocar linhas de posição", "Somar múltiplo de outra linha"),
                                            status = "primary"
                                          )), column(1, style="padding:25px;", actionButton("meu_botao", "Efetuar operação"))),
                                          fluidRow(column(2),column(3, radioGroupButtons(
                                            inputId = "primeira",
                                            label = "Linha a ser modifica", 
                                            choices = c("Linha 1", "Linha 2", "Linha 3", "Linha 4", "Linha 5"),
                                            status = "primary"
                                          )),column(3, radioGroupButtons(
                                            inputId = "segunda",
                                            label = "Linha auxiliar da operação", 
                                            choices = c("Linha 1", "Linha 2", "Linha 3", "Linha 4", "Linha 5"),
                                            status = "primary"
                                          )), column(2, numericInput(
                                            inputId = 'k',
                                            label = 'Fator multiplicador',
                                            value = 1,
                                            min = NA,
                                            max = NA,
                                            step = 0.01,
                                            width = NULL
                                          ))),br(),br(),
                                          fluidRow(column(2), column(6, DT::DTOutput('table')))
                                          
                                 ),
                                 tabPanel("Transformações lineares no plano",useShinydashboard(),
                                          
                                          # Sidebar with a slider input for number of bins 
                                          sidebarLayout(
                                            sidebarPanel(
                                              withMathJax("Uma transformação linear da forma $$T(x,y)=(a\\cdot x+b\\cdot y, c\\cdot x+d\\cdot y)$$ pode ser escrita na 
                        forma matricial como 
                        $$\\begin{bmatrix}a\\cdot x+b\\cdot y \\\\ c\\cdot x+d\\cdot y \\end{bmatrix}=\\begin{bmatrix}a & b \\\\ c & d \\end{bmatrix}\\cdot
                        \\begin{bmatrix}x \\\\ y \\end{bmatrix}.$$ Para aplicar a transformação na figura ao lado, insira abaixo os
                        coeficientes $$a,b,c \\text{ e } d$$ da transformação."),br(),br(),
                                              numericInput(
                                                inputId = 'a',
                                                label = 'Coeficiente a:',
                                                value = 1,
                                                min = NA,
                                                max = NA,
                                                step = 0.01,
                                                width = NULL
                                              ),
                                              numericInput(
                                                inputId = 'b',
                                                label = 'Coeficiente b:',
                                                value = 0,
                                                min = NA,
                                                max = NA,
                                                step = 0.01,
                                                width = NULL
                                              ),
                                              numericInput(
                                                inputId = 'c',
                                                label = 'Coeficiente c:',
                                                value = 0,
                                                min = NA,
                                                max = NA,
                                                step = 0.01,
                                                width = NULL
                                              ),
                                              numericInput(
                                                inputId = 'd',
                                                label = 'Coeficiente d:',
                                                value = 1,
                                                min = NA,
                                                max = NA,
                                                step = 0.01,
                                                width = NULL
                                              )
                                              # ,
                                              # matrixInput(
                                              #     "sample",
                                              #     value = m,
                                              #     rows = list(names = FALSE),
                                              #     cols = list(names = FALSE)
                                              #     )
                                            ),
                                            
                                            # Show a plot of the generated distribution
                                            mainPanel(
                                              fluidRow(column(6, plotlyOutput("original")), column(6, plotlyOutput("transformado"))), br(),
                                              fluidRow(
                                                column(
                                                  12,
                                                  tags$p(
                                                    style = "text-align: center; margin: 0 0 20px;",
                                                    "A figura utilizada nesta ferramenta foi retirada do artigo ",
                                                    tags$a(
                                                      "Transformações lineares, matrizes e imagens digitais: conexões entre Álgebra Linear e computação gráfica",
                                                      href = "https://jeepema.com.br/index.php/jeepema/pt_BR/article/view/66",
                                                      target = "_blank",
                                                      rel = "noopener noreferrer"
                                                    ),
                                                    " (JEEPEMA, v. 10, n. 1, art. 1)."
                                                  ),
                                                  tags$p(
                                                    style = "text-align: center; margin: -12px 0 20px; font-size: 0.9em;",
                                                    "Software: Transformações lineares no plano, versão 1.0. ",
                                                    tags$a(
                                                      "Código-fonte",
                                                      href = "https://github.com/Osnar/transformacoes-lineares-no-plano",
                                                      target = "_blank",
                                                      rel = "noopener noreferrer"
                                                    ),
                                                    " (GPL-3.0-or-later)."
                                                  )
                                                )
                                              ),
                                              DT::DTOutput('table2')
                                            )
                                          )
                                 ),
)))
