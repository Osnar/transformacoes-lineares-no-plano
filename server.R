# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2026 Marcelo Osnar Rodrigues de Abreu e Aline Edlaine de Medeiros
# A figura binária e suas coordenadas são licenciadas separadamente sob CC BY 4.0.
# Consulte NOTICE.md para os detalhes de atribuição e licenciamento.

library(shinyBS)
library(shinyWidgets)
library(shinythemes)
library(shinydashboard)
library(shinydashboardPlus)
library(shiny)
library(plotly)
library(shinyMatrix)
library(DT)
  
  

# Figura binária 35x35 do JEEPEMA — idêntica à do artigo v.10 n.1, art.1
# por altura y, quais coordenadas x serão pintadas de preto
x34 <- c(6)
x33 <- c(6:8)
x32 <- c(7:9,27)
x31 <- c(7:11,26:28)
x30 <- c(7:12,25:28)
x29 <- c(7:13,24:28)
x28 <- c(7:29)
x27 <- c(7:29)
x26 <- c(8:29)
x25 <- c(8:27)
x24 <- c(8:28)
x23 <- c(7:11,16:21,25:29)
x22 <- c(7:10,17:20,22,26:29)
x21 <- c(6:10,12,13,17:19,21:23,27:30)
x20 <- c(6:14,17:19,21:23,27:30)
x19 <- c(6:14,17:19,21:23,27:30)
x18 <- c(6:10,12,13,17:19,21,22,26:30)
x17 <- c(5:11,16:20,26:31)
x16 <- c(5:12,15:22,24:31)
x15 <- c(6:30)
x14 <- c(6:15,21:30)
x13 <- c(3:12,24:30,33)
x12 <- c(5:11,17:19,25:33)
x11 <- c(7:10,18,26:29)
x10 <- c(3:10,18,26:30)
x9 <- c(8:11,13,18,23,25:28,30:33)
x8 <- c(5:7,10,11,13,14,17:19,22,23,25:27)
x7 <- c(3:6,11:17,19:25)
x6 <- c(12:17,19:24)
x5 <- c(15:21)

x <- c(x34,x33,x32,x31,x30,x29,x28,x27,x26,x25,x24,
  x23,x22,x21,x20,x19,x18,x17,x16,x15,x14,x13,
  x12,x11,x10,x9,x8,x7,x6,x5)

y <- c(rep(34, length(x34)),
  rep(33, length(x33)),
  rep(32, length(x32)),
  rep(31, length(x31)),
  rep(30, length(x30)),
  rep(29, length(x29)),
  rep(28, length(x28)),
  rep(27, length(x27)),
  rep(26, length(x26)),
  rep(25, length(x25)),
  rep(24, length(x24)),
  rep(23, length(x23)),
  rep(22, length(x22)),
  rep(21, length(x21)),
  rep(20, length(x20)),
  rep(19, length(x19)),
  rep(18, length(x18)),
  rep(17, length(x17)),
  rep(16, length(x16)),
  rep(15, length(x15)),
  rep(14, length(x14)),
  rep(13, length(x13)),
  rep(12, length(x12)),
  rep(11, length(x11)),
  rep(10, length(x10)),
  rep(9, length(x9)),
  rep(8, length(x8)),
  rep(7, length(x7)),
  rep(6, length(x6)),
  rep(5, length(x5)))

dados <- data.frame(x = x, y = y)

  
  
  
  
  
shinyServer(function(input, output, session) {
  
  observe({
    output$original <- renderPlotly({
      
      
      # fig <- plot_ly(x = x, y = y, type = 'scatter', 
      #                mode = 'markers', name = '',showlegend = FALSE)
      # fig <- fig %>% add_markers(x=p5[1], y=p5[2], name = 'Ponto 1')
      # fig <- fig %>% add_markers(x=p1[1], y=p1[2], name = 'Ponto 2')
      # fig <- fig %>% add_markers(x=p2[1], y=p2[2], name = 'Ponto 3')
      # fig <- fig %>% add_markers(x=p3[1], y=p3[2], name = 'Ponto 4')
      # fig <- fig %>% add_markers(x=p4[1], y=p4[2], name = 'Ponto 5')
      #         fig <- fig %>% layout(yaxis = list(title = 'y', range  = c(-2, 2)),
      #                       xaxis = list(title = 'x', range  = c(-2, 2)),
      #                       title='Original',
      #                       titlefont = list(size = 16),
      #                       hovermode = TRUE)
      # fig
      
      
      fig <- plot_ly(x = x, y = y, type = 'scatter', 
                     mode = 'markers', name = '', showlegend = FALSE) %>% layout(yaxis = list(title = 'y', range  = c(-50, 50)),
                                                                                 xaxis = list(title = 'x', range  = c(-50, 50)),
                                                                                 title='Original',
                                                                                 titlefont = list(size = 16),
                                                                                 hovermode = TRUE)
      fig
      
      
    })
    
    output$transformado <- renderPlotly({
      
      TL <- function(x,y,a,b,c,d){
        return(data.frame('x' = a*x+b*y, 'y' = c*x+d*y))
      }
      
      # dados <- TL(x = x, y = y, a = input$a, b = input$b, c = input$c, d = input$d)
      # p1 <- TL(x = p1[1], y = p1[2], a = input$a, b = input$b, c = input$c, d = input$d)
      # p2 <- TL(x = p2[1], y = p2[2], a = input$a, b = input$b, c = input$c, d = input$d)
      # p3 <- TL(x = p3[1], y = p3[2], a = input$a, b = input$b, c = input$c, d = input$d)
      # p4 <- TL(x = p4[1], y = p4[2], a = input$a, b = input$b, c = input$c, d = input$d)
      # p5 <- TL(x = p5[1], y = p5[2], a = input$a, b = input$b, c = input$c, d = input$d)
      # 
      # 
      # fig <- plot_ly(x = dados$x, y = dados$y, type = 'scatter', 
      #                mode = 'markers', name = '', showlegend = FALSE)
      # fig <- fig %>% add_markers(x=p5[,1], y=p5[,2], name = 'Ponto 1')
      # fig <- fig %>% add_markers(x=p1[,1], y=p1[,2], name = 'Ponto 2')
      # fig <- fig %>% add_markers(x=p2[,1], y=p2[,2], name = 'Ponto 3')
      # fig <- fig %>% add_markers(x=p3[,1], y=p3[,2], name = 'Ponto 4')
      # fig <- fig %>% add_markers(x=p4[,1], y=p4[,2], name = 'Ponto 5')
      # fig <- fig %>% layout(yaxis = list(title = 'y', range  = c(-2, 2)),
      #                       xaxis = list(title = 'x', range  = c(-2, 2)),
      #                       title='Transformado',
      #                       titlefont = list(size = 16),
      #                       hovermode = TRUE)
      # fig
      
      
      
      
      dados <- TL(x = x, y = y, a = input$a, b = input$b, c = input$c, d = input$d)
      
      fig <- plot_ly(x = dados$x, y = dados$y, type = 'scatter', 
                     mode = 'markers', name = '', showlegend = FALSE) %>% layout(yaxis = list(title = 'y', range  = c(-50, 50)),
                                                                                 xaxis = list(title = 'x', range  = c(-50, 50)),
                                                                                 title='Transformado',
                                                                                 titlefont = list(size = 16),
                                                                                 hovermode = TRUE)
      fig
      
      
      
    })
    
    output$table2 <- DT::renderDataTable({
      
      matriz <- data.frame('x' = c(input$a, input$c), 'y' = c(input$b, input$d))
      
      
      datatable(matriz, options = list(dom = 't',
                                       columnDefs = list(list(className = 'dt-center', targets = '_all')),
                                       dom = 'Bfrtip',
                                       buttons = c('copy')),#'pdf',
                rownames= FALSE, 
                caption = htmltools::tags$caption(htmltools::tags$span("Matriz da transformação linear escolhida", style="color:black; align:center;")),
                colnames = '')  %>% 
        formatStyle(c(1,2), `border-right` = "solid 2px") %>% formatStyle(c(1), `border-left` = "solid 2px")
      
    })
    
    
    output$table <- DT::renderDataTable({
      
      #matriz, opera, primeira, segunda, k
      
      #c("Multiplicar linha por um número", "Trocar linhas de posição", "Somar múltiplo de outra linha")
      
      aux <- gsub('Linha ','', input$primeira)
      aux2 <- gsub('Linha ','', input$segunda)
      
      
      if(as.numeric(aux) <= as.numeric(input$linhas) & as.numeric(aux2) <= as.numeric(input$linhas)){
        
        if(input$opera == "Multiplicar linha por um número"){
          linha <- input$matriz[as.numeric(aux),] * input$k
          aux3   <- data.frame('x' = c(input$primeira, linha))
          matriz <- t(aux3)
        }
        
        if(input$opera == "Trocar linhas de posição"){
          linha1 <- input$matriz[as.numeric(aux),]
          linha2 <- input$matriz[as.numeric(aux2),]
          aux3    <- data.frame('x' = c(input$primeira, linha2))
          aux4   <- data.frame('x' = c(input$segunda, linha1))
          matriz <- t(aux3)
          matriz <- rbind(matriz, t(aux4))
        }
        
        if(input$opera == "Somar múltiplo de outra linha"){
          linha1 <- input$matriz[as.numeric(aux),]
          linha2 <- input$matriz[as.numeric(aux2),] * input$k
          aux3    <- data.frame('x' = c(input$primeira, linha1+linha2))
          matriz <- t(aux3)
        }
        
        
        
        
        
        
        datatable(matriz, options = list(dom = 't',
                                         columnDefs = list(list(className = 'dt-center', targets = '_all')),
                                         dom = 'Bfrtip',
                                         buttons = c('copy')),#'pdf',
                  rownames= FALSE, 
                  caption = htmltools::tags$caption(htmltools::tags$span("Nova(s) linha(s)", style="color:black; align:center;")),
                  colnames = '')  %>% 
          formatStyle(c(1,1), `border-right` = "solid 2px") %>% formatStyle(c(1), `border-left` = "solid 2px")
      }
      
      
      
    })
    
    
    
    
    observeEvent(input$meu_botao, {
      
      if (input$meu_botao > 0) {
        
        aux <- gsub('Linha ','', input$primeira)
        aux2 <- gsub('Linha ','', input$segunda)
        
        if(as.numeric(aux) <= as.numeric(input$linhas) & as.numeric(aux2) <= as.numeric(input$linhas) & !any(is.na(input$matriz))){
          
          if(input$opera == "Multiplicar linha por um número"){
            linha <- input$matriz[as.numeric(aux),] * input$k
            aux3   <- data.frame('x' = c(input$primeira, linha))
            matriz <- t(aux3)
          }
          
          if(input$opera == "Trocar linhas de posição"){
            linha1 <- input$matriz[as.numeric(aux),]
            linha2 <- input$matriz[as.numeric(aux2),]
            aux3    <- data.frame('x' = c(input$primeira, linha2))
            aux4   <- data.frame('x' = c(input$segunda, linha1))
            matriz <- t(aux3)
            matriz <- rbind(matriz, t(aux4))
          }
          
          if(input$opera == "Somar múltiplo de outra linha"){
            linha1 <- input$matriz[as.numeric(aux),]
            linha2 <- input$matriz[as.numeric(aux2),] * input$k
            aux3    <- data.frame('x' = c(input$primeira, linha1+linha2))
            matriz <- t(aux3)
          }
          
          
          
          if(nrow(matriz) == 1){
            
            novamatriz <- input$matriz
            
            pos <- gsub('Linha ','', matriz[1,1])
            
            novamatriz[as.numeric(pos),] <- matriz[1,-1]
            
            if(!any(is.na(novamatriz))){
              updateMatrixInput(session, 'matriz', novamatriz)
            }
            
            
            
          } else {
            
            novamatriz <- input$matriz
            
            pos1 <- gsub('Linha ','', matriz[1,1])
            pos2 <- gsub('Linha ','', matriz[2,1])
            
            novamatriz[as.numeric(pos1),] <- matriz[1,-1]
            novamatriz[as.numeric(pos2),] <- matriz[2,-1]
            
            if(!any(is.na(novamatriz))){
              updateMatrixInput(session, 'matriz', novamatriz)
            }
          }
          
          
        }}
      
      
    })
    
    
    
    # observeEvent(input$meu_botao2, {
    #   
    #   if (input$meu_botao2 > 0) {
    #     
    #     updateMatrixInput(session, 'matriz', matrix(c(1,2,3,1,0,0,4,5,6,0,1,0,7,8,9,0,0,1), 3, 6, byrow = T))}})
    # 
    # 
    # 
    # observeEvent(input$meu_botao3, {
    #   
    #   if (input$meu_botao3 > 0) {
    #     
    #     updateMatrixInput(session, 'matriz', matrix('', as.numeric(input$linhas), as.numeric(input$colunas), byrow = T))}})
    
    
    observeEvent(list(input$linhas, input$colunas), {
      
      updateMatrixInput(session, 'matriz', matrix('', as.numeric(input$linhas), as.numeric(input$colunas), byrow = T))
      
    })
    
    
    # output$text <- renderText({
    #   paste("Dados fornecidos:", input$matriz[1,1])
    # })
    
  })
})
