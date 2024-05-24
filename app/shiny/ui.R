library(tidyverse)
library(shiny)
library(ggpubr)
library(psych)
library(waiter)


ui <- fluidPage(
  titlePanel(
    HTML("EUD 벽짓고 백만 저글링 막기 3 V0.03 확률 시뮬레이터")
  ),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId="slevel", label="시작 레벨", min=0, max=20, value=0, step=1),
      sliderInput(inputId="elevel", label="목표 레벨", min=0, max=20, value=1, step=1),
      numericInput(inputId="sgas", label="시작 파방 가격", min=1, max=99999, step=1, value=1),
      sliderInput(inputId="suc", label="추가 강화 확률", min=0, max=9, step=1, value=0),
      sliderInput(inputId="des", label="파괴 확률 감소", min=0, max=12, step=3, value=0),
      sliderInput(inputId="sim", label="시뮬레이션 수", min=500, max=10000, step=500, value=10000),
      actionButton(inputId="run", label="시뮬레이션 시작")
    ),
    mainPanel(
      selectInput(inputId="choice", label="선택지", choices=c("총 미네랄 비용", "총 가스 비용", "실패 횟수")),
      uiOutput("resplot"),
      verbatimTextOutput("restext"),
      use_waiter()
    )
  )    
  
)