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

url_repositorio <- "https://github.com/Osnar/transformacoes-lineares-no-plano"
url_licenca_codigo <- paste0(url_repositorio, "/blob/main/LICENSE")
url_licenca_figura <- paste0(url_repositorio, "/blob/main/LICENSES/CC-BY-4.0.txt")
url_doi_software <- "https://doi.org/10.5281/zenodo.23082804"
url_doi_artigo <- "https://doi.org/10.4025/jeepema.v10.n1.art1"
estilo_link_secundario <- paste(
  "color: #00695c; text-decoration: underline;",
  "text-underline-offset: 0.12em;"
)

link_externo <- function(texto, url, estilo = NULL) {
  tags$a(
    texto,
    href = url,
    target = "_blank",
    rel = "noopener noreferrer",
    style = estilo
  )
}

grafico_original <- tags$div(
  `aria-describedby` = "nota-fonte-original",
  plotlyOutput("original")
)

nota_fonte_original <- tags$p(
  id = "nota-fonte-original",
  role = "note",
  style = paste(
    "font-size: 0.9em; color: #5f6368;",
    "margin: 0.75em 0 1.25em; line-height: 1.45;",
    "max-width: 90ch; overflow-wrap: anywhere;"
  ),
  tags$span(class = "sr-only", "Nota sobre o gráfico Original: "),
  "Figura original extraída do artigo ",
  link_externo(
    "Transformações lineares, matrizes e imagens digitais: conexões entre Álgebra Linear e computação gráfica",
    url_doi_artigo,
    estilo_link_secundario
  ),
  ", JEEPEMA, v. 10, n. 1, art. 1."
)

rodape <- tags$footer(
  role = "contentinfo",
  class = "container-fluid",
  style = paste(
    "margin-top: 2rem; padding: 0.9rem 1rem;",
    "border-top: 1px solid #ddd; background: #fafafa;",
    "font-size: 0.9em; color: #5f6368;",
    "text-align: center; line-height: 1.6;",
    "overflow-wrap: anywhere;"
  ),
  "Transformações lineares no plano, versão 1.0 — ",
  link_externo("código-fonte", url_repositorio, estilo_link_secundario),
  " (GPL-3.0-or-later) — DOI: ",
  link_externo("10.5281/zenodo.23082804", url_doi_software, estilo_link_secundario)
)

citacao_apa <- paste0(
  "de Abreu, M. O. R., & de Medeiros, A. E. (2026). ",
  "Transformações lineares no plano (Versão 1.0) ",
  "[Software de computador]. Zenodo. ",
  "https://doi.org/10.5281/zenodo.23082804"
)

citacao_bibtex <- paste(
  "@software{de_abreu_medeiros_2026,",
  "  author    = {de Abreu, Marcelo Osnar Rodrigues and de Medeiros, Aline Edlaine},",
  "  title     = {Transformações lineares no plano},",
  "  version   = {1.0},",
  "  year      = {2026},",
  "  publisher = {Zenodo},",
  "  doi       = {10.5281/zenodo.23082804},",
  "  url       = {https://doi.org/10.5281/zenodo.23082804}",
  "}",
  sep = "\n"
)

texto_licencas <- HTML(paste0(
  "A versão 1.0 está preservada no Zenodo sob o DOI ",
  as.character(link_externo("10.5281/zenodo.23082804", url_doi_software)),
  ". O ",
  as.character(link_externo("código-fonte", url_repositorio)),
  " é distribuído sob a ",
  as.character(link_externo(
    "GNU General Public License, versão 3 ou posterior (GPL-3.0-or-later)",
    url_licenca_codigo
  )),
  ". A figura binária proveniente do artigo está licenciada separadamente sob ",
  as.character(link_externo(
    "Creative Commons Atribuição 4.0 Internacional (CC BY 4.0)",
    url_licenca_figura
  )),
  "."
))

aba_sobre <- tabPanel(
  "Sobre",
  fluidRow(
    column(
      width = 10,
      offset = 1,
      tags$div(
        style = "max-width: 900px; margin: 0 auto; padding: 1.5rem 0 2rem;",
        tags$h2("Transformações lineares no plano"),
        tags$p(tags$strong("Versão 1.0")),
        tags$p(
          "Aplicativo web educacional desenvolvido em R e Shiny para explorar ",
          "operações elementares com matrizes e transformações lineares no plano."
        ),
        tags$h3("Autoria"),
        tags$ul(
          tags$li(
            link_externo(
              "Marcelo Osnar Rodrigues de Abreu",
              "https://orcid.org/0000-0001-9103-529X"
            )
          ),
          tags$li(
            link_externo(
              "Aline Edlaine de Medeiros",
              "https://orcid.org/0000-0001-5849-8815"
            )
          )
        ),
        tags$h3("Como citar"),
        tags$p(tags$strong("APA 7")),
        tags$pre(
          style = paste(
            "white-space: pre-wrap; overflow-wrap: anywhere;",
            "background: #f7f7f7; border: 1px solid #ddd;"
          ),
          citacao_apa
        ),
        tags$p(tags$strong("BibTeX")),
        tags$pre(
          style = paste(
            "white-space: pre-wrap; overflow-wrap: anywhere;",
            "background: #f7f7f7; border: 1px solid #ddd;"
          ),
          citacao_bibtex
        ),
        tags$h3("Código, versão e licenças"),
        tags$p(texto_licencas),
        tags$h3("Dependências"),
        tags$p(
          "Desenvolvido e testado com R 4.4.1. As versões de Shiny, Plotly, DT ",
          "e das demais dependências estão declaradas em ",
          link_externo("DESCRIPTION", paste0(url_repositorio, "/blob/main/DESCRIPTION")),
          " e registradas no arquivo ",
          link_externo("renv.lock", paste0(url_repositorio, "/blob/main/renv.lock")),
          " do repositório."
        ),
        tags$h3("Artigo associado"),
        tags$p(
          link_externo(
            "Transformações lineares, matrizes e imagens digitais: conexões entre Álgebra Linear e computação gráfica",
            url_doi_artigo
          ),
          ", JEEPEMA, v. 10, n. 1, art. 1."
        )
      )
    )
  )
)

shinyUI(navbarPage('',theme = shinytheme("flatly"),
                                 
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
                                            label = "Linha a ser modificada",
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
                                               tags$figure(
                                                 style = "margin: 0;",
                                                 fluidRow(column(6, grafico_original), column(6, plotlyOutput("transformado")))
                                               ),
                                              DT::DTOutput('table2'),
                                              nota_fonte_original
                                            )
                                          )
                                  ),
                                  aba_sobre,
                                  footer = rodape
  ))
