library(shiny)
library(tabulizer)
library(dplyr)
library(tidyr)
library(tibble)
library(purrr)
library(janitor)
library(wesanderson)

rm(list=ls())

colr = wes_palette("Darjeeling1")
source("/Users/arthurcharpentier/artemis/data_app.R")

simul_mensuel = function(ns = 1e6,
                         ageP = 70,
                         ageC = 4,
                         revenu = 18,
                         chien = "feuille2",
                         baseined = INED,
                         limite = 7,
                         versements = 12,
                         kapital = 1){
  
  A =INED$AGE
  D_chien = TABLE_CHIEN[[chien]]
  x = D_chien$x
  Lx = D_chien$Lx
  idxP = which(A>=ageP) 
  idxC = which(x>=ageC)
  set.seed(123)
  P1 = data.frame(p1 = baseined[idxP,revenu]/max(baseined[idxP,revenu]))
  P1$d1 = c(-diff(P1$p1),P1[nrow(P1),"p1"])
  P0 = data.frame(p0=Lx[idxC]/max(Lx[idxC]))
  P0$d0 = c(-diff(P0$p0),P0[nrow(P0),"p0"])
  
  personne = sample(0:(103-ageP+1),size=ns,prob = P1$d1,replace=TRUE)
  chien = sample(0:(max(x)-ageC),size=ns,prob = P0$d0,replace=TRUE)
  
  personne = personne + sample(0:11,size = ns,replace=TRUE)/12
  chien = chien + sample(0:11,size = ns,replace=TRUE)/12
  
  proba = mean(personne>=chien) 
  idx = which(personne<=chien)
  tableau_1 = data.frame(maitresse = personne[idx],
                         chien = chien[idx])
  T = table(tableau_1)
  Tnorm = T/max(T)
  rv = paste((revenu-2)*5,"-",(revenu-1)*5,"%",sep="")
  
  idx = which(personne>chien)
  tableau_2 = data.frame(maitresse = personne[idx],
                         chien = chien[idx])
  x2 = round(tableau_2$chien*12)
  x2_cut = x2[x2 <= (limite*12)]
  x2a = pmin(tableau_2$maitresse,limite)*12
  x2b = (tableau_2$chien-tableau_2$maitresse)*12 
  x2c = x2b-x2a
  x2z = pmin(tableau_2$chien,limite)*12
  
  idx = which(personne<=chien)
  tableau_1 = data.frame(maitresse = personne[idx],
                         chien = chien[idx])
  x1 = (tableau_1$maitresse*12)
  x1a = pmin(tableau_1$maitresse,limite)*12
  x1b = (tableau_1$chien-tableau_1$maitresse)*12 
  x1c = x1b-x1a
  
  idx = which((personne<=chien)&((chien-personne)<=pmin(personne,limite)))
  tableau_4 = data.frame(maitresse = personne[idx],
                         chien = chien[idx])
  p4 = nrow(tableau_4)/nrow(tableau_1)
  x4a = pmin(tableau_4$maitresse,limite)*12
  x4b = (tableau_4$chien-tableau_4$maitresse)*12
  
  idx = which((personne<=chien)&((chien-personne)>pmin(personne,limite)))
  tableau_5 = data.frame(maitresse = personne[idx],
                         chien = chien[idx])
  p5 = nrow(tableau_5)/nrow(tableau_1)
  x5a = pmin(tableau_5$maitresse,limite)*12
  x5b = (tableau_5$chien-tableau_5$maitresse)*12
  
  # cat("--------------------------------------------------------------------\n")
  # cat("   âge maître = ",ageP," ans\n",sep="")
  # cat("   âge chien  = ",ageC," ans\n",sep="")
  # cat("   espérance de vie résiduelle du maitre = ",round(mean(personne),2)," ans\n",sep="")
  # cat("   espérance de vie résiduelle du chien  = ",round(mean(chien),2)," ans\n",sep="")
  # cat("   probabilité que le chien survive au maître  = ",round(mean(chien>personne)*100,2),"%\n",sep="")
  # cat("   durée maximale de versement = ",limite*12," mois (",limite," années)\n",sep="")
  # cat("   capital versé chaque mois = ",kapital," euros\n",sep="")
  # cat("\n")
  # cat(" Cas 1 : décès prématuré du chien\n")
  # cat("   probabilité que le chien décède avant le maître  = ",round(mean(chien<=personne)*100,2),"%\n",sep="")
  # cat("   capital moyen accumulé (sans limite) = ",round(mean(x2)*kapital)," euros\n",sep="")
  # cat("   capital moyen accumulé (avec limite) = ",round(mean(x2a)*kapital)," euros\n",sep="")
  # cat("\n")
  # cat(" Cas 2 : décès prématuré du maître\n")
  # cat("   probabilité que le chien survive au maître  = ",round(mean(chien>personne)*100,2),"%\n",sep="")
  # cat("   capital moyen accumulé au décès du maître (sans limite) = ",round(mean(x1)*kapital)," euros\n",sep="")
  # cat("   capital moyen accumulé au décès du maître (avec limite) = ",round(mean(x1a)*kapital)," euros\n",sep="")
  # cat("   capital moyen à verser jusqu'au décès du chien          = ",round(mean(x1b)*kapital)," euros\n",sep="")
  # cat(" Cas 2.1 : capital versé suffisant\n")
  # cat("   probabilité que le capital versé suffise = ",round(p4*100,2),"%\n",sep="")
  # cat("   capital moyen accumulé au décès du maître               = ",round(mean(x4a)*kapital)," euros\n",sep="")
  # cat("   capital moyen accumulé à verser jusqu'au décès du chien = ",round(mean(x4b)*kapital)," euros\n",sep="")
  # cat("   surplus de capital moyen                                = ",round(mean(x4a-x4b)*kapital)," euros\n",sep="")
  # cat(" Cas 2.2 : capital versé insuffisant\n")
  # cat("   probabilité que le capital versé ne suffise pas = ",round(p5*100,2),"%\n",sep="")  
  # cat("   capital moyen accumulé au décès du maître               = ",round(mean(x5a)*kapital)," euros\n",sep="")
  # cat("   capital moyen accumulé à verser jusqu'au décès du chien = ",round(mean(x5b)*kapital)," euros\n",sep="")
  # cat("   déficit de capital moyen                                = ",round(mean(x5a-x5b)*kapital)," euros\n",sep="")
  # 
  L = list(age_personne = ageP,
           mean_res_personne = mean(personne),
           age_chien = ageC,
           mean_res_chien = mean(chien),
           classe_revenu = revenu,
           quantiles_revenu = rv,
           table_mortalite_chien = chien,
           table_mortalite_humain = C_INED,
           limite_versement = limite,
           kapital = kapital,
           proba_deces_plus_tot = mean(chien>personne),
           proba_cas_1 = mean(chien<=personne),
           capital_accumule_cas_1=mean(x2a)*kapital,
           capital_accumule_cas_1_dc=mean(x2z)*kapital,
           proba_cas_2 = mean(chien>personne),
           proba_capital_cas_2 = mean(x1a)*kapital,
           capital_a_verser = mean(x1b)*kapital,
           proba_cas_21 = p4,
           capital_21_1 = mean(x4a)*kapital,
           capital_21_2 = mean(x4b)*kapital,
           capital_21_3 = mean(x4a-x4b)*kapital,
           proba_cas_22 = p5, 
           capital_22_1 = mean(x5a)*kapital,
           capital_22_2 = mean(x5b)*kapital,
           capital_22_3 = mean(x5a-x5b)*kapital,
           table = T,
           table_norm = Tnorm)
}

LISTE_CHIEN = list("female dogs (1)",
                   "male dogs (2)",
                   "entire female dogs (3)",
                   "neutered female dogs (4)",
                   "entire male dogs (5)",
                   "neutered male dogs (6)",
                   "Gundogs (7)",
                   "Hound dogs (8)",
                   "non−Kennel Club (9)",
                   "Pastoral dogs (10)",
                   "Terriers (11)",
                   "Toy dogs (12)",
                   "Utility dogs (13)",
                   "Working dogs (14)",
                   "American Bulldogs (15)",
                   "Beagles (16)",
                   "Border Collies (17)",
                   "Boxers (18)",
                   "Bulldogs (19)",
                   "Cavalier King Charles Spaniels (20)",
                   "Chihuahuas (21)",
                   "Cocker Spaniels (22)",
                   "Crossbreeds (23)",
                   "French Bulldogs (24)",
                   "German Shepherd Dogs (25)",
                   "Huskies (26)",
                   "Jack Russell Terriers (27)",
                   "Labrador Retrievers (28)",
                   "Pugs (29)",
                   "Shih−tzus (30)",
                   "Springer Spaniels (31)",
                   "Staffordshire Bull Terriers (32)",
                   "Yorkshire Terriers (33)")

library(stringr)

feuille_chien = function(Input){
  NO_race = str_extract(Input$race, '(?<=\\()[0-9-]+(?=\\))')
  return(paste("feuille",NO_race,sep=""))
}

f_graph_L = function(Input){
  if(Input$genderP == "Man") INED = INEDH
  if(Input$genderP == "Woman") INED = INEDF
  L_INED = P_INED = C_INED = INED
  P_INED[,2:22] = (1-L_INED[,2:22]/100000)
  C_INED[,2:22] = apply(P_INED[,2:22],2,cumprod)
  k = floor(Input$revP/5)+1
  FCQ = L_INED[,k]
  T2 = TABLE_CHIEN[[feuille_chien(Input)]]
  Lx = T2$Lx
  Lx = Lx*1/Lx[1]
  AP =INED$AGE
  AC = T2$x
  ageP = Input$ageP
  ageC = Input$ageC
  idxP = which(AP>=ageP)
  idxC = which(AC>=ageC)
  L=list(personne = data.frame(x = AP[idxP],
                               y = FCQ[idxP]/max(FCQ[idxP])),
         chien = data.frame(x = AC[idxC],
                            y = Lx[idxC]/max(Lx[idxC])))
  return(L)
}

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("ARTEMIS: Dogs - 2023"),
    sidebarLayout(
        sidebarPanel(
          selectInput("genderP", "Gender of the owner:",list("Man","Woman")),
            sliderInput("ageP",
                        "Age of policyholder:",
                        min = 40,
                        max = 100,
                        value = 70),
          sliderInput("revP",
                      "Income quantile of policyholder:",
                      min = 00,
                      max = 100,
                      value = 85),
            selectInput("genderC", "Sex of the dog:",list("Male","Female")),
            sliderInput("ageC",
                        "Age of dog:",
                        min = 0,
                        max = 20,
                        value = 4),
            selectInput("race", "Race of the dog:",LISTE_CHIEN),
            sliderInput("kapital",
                      "Monthly payment:",
                      min = 0,
                      max = 500,
                      value = 200),
            sliderInput("duree",
                      "Payment length:",
                      min = 1,
                      max = 10,
                      value = 10000/200/12)
        ),
        # Show a plot of the generated distribution
        mainPanel(
           strong("Remaining life expectancies"),
           plotOutput("figure_life_exp"),
           uiOutput("texte_age_owner2"),
           strong("Scenarios"),
           plotOutput("figure_remb")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
    output$texte_age_owner <- renderText({
      if(input$genderP == "Man") INED = INEDH
      if(input$genderP == "Woman") INED = INEDF
      List_simul = simul_mensuel(ns = 1e6,
                                 ageP = input$ageP,
                                 ageC = input$ageC,
                                 revenu = floor(input$revP/5)+1,
                                 chien = "feuille2",
                                 baseined = INED,
                                 limite = input$duree,
                                 versements = 12,
                                 kapital = input$kapital)
      
      paste("The expected remaining life expectancy of the owner is: ", 
            round(List_simul$mean_res_personne,2),
            " years \n",sep="")
    })
    output$texte_age_owner2 <- renderUI({
      if(input$genderP == "Man") INED = INEDH
      if(input$genderP == "Woman") INED = INEDF
      List_simul = simul_mensuel(ns = 1e6,
                                 ageP = input$ageP,
                                 ageC = input$ageC,
                                 revenu = floor(input$revP/5)+1,
                                 chien = "feuille2",
                                 baseined = INED,
                                 limite = input$duree,
                                 versements = 12,
                                 kapital = input$kapital)
      HTML(paste0(
        as.character(div(style=as.character("color: #5BBCD6;"), 
                            paste("The expected remaining life expectancy of the owner (age ",
                                  List_simul$age_personne,") is: ", 
                            round(List_simul$mean_res_personne,2),
                            " years \n",sep=""))),
        as.character(div(style=as.character("color: #F98400;"), 
                         paste("The expected remaining life expectancy of the dog (age ",
                               List_simul$age_chien ,") is: ", 
                               round(List_simul$mean_res_chien,2),
                               " years \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("The targeted capital is: ", 
                               List_simul$limite_versement *List_simul$kapital*12,
                   " euros \n\n",sep=""))),
        as.character(div(style=as.character("font-weight: bold; color: black;"), 
                         paste("Case 1 : premature death of the dog \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Probability that the dog will die before the owner: ", 
                               round(List_simul$proba_cas_1*100,2),
                               "% \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Average accumulated capital when the dog dies: ", 
                               round(List_simul$capital_accumule_cas_1_dc),
                               " euros \n\n",sep=""))),
        as.character(div(style=as.character("font-weight: bold; color: black;"), 
                         paste("Case 2 : premature death of the owner \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Probability that the owner will die before the dog: ", 
                               round(List_simul$proba_cas_2*100,2),
                               "% \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Average accumulated capital when the owner dies: ", 
                               round(List_simul$proba_capital_cas_2),
                               " euros \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Average capital to pay until the dog dies: ", 
                               round(List_simul$capital_a_verser),
                               " euros \n\n",sep=""))),
        as.character(div(style=as.character("font-weight: bold; color: #00A08A;"), 
                         paste("  Case 2.1 : sufficient capital to pay until the death of the dog \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("    Probability to have sufficient capital: ", 
                               round(List_simul$proba_cas_21*100,2),
                               "% \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Average capital accumulated: ", 
                               round(List_simul$capital_21_1),
                               " euros \n\n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Average capital to pay: ", 
                               round(List_simul$capital_21_2),
                               " euros \n\n",sep=""))),
        as.character(div(style=as.character("color: #00A08A;"), 
                         paste("  Average surplus: ", 
                               round(List_simul$capital_21_3),
                               " euros \n\n",sep=""))),
        as.character(div(style=as.character("font-weight: bold; color: #FF0000;"), 
                         paste("  Case 2.2 : insufficient capital to pay until the death of the dog \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("    Probability to have sufficient capital: ", 
                               round(List_simul$proba_cas_22*100,2),
                               "% \n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Average capital accumulated: ", 
                               round(List_simul$capital_22_1),
                               " euros \n\n",sep=""))),
        as.character(div(style=as.character("color: black;"), 
                         paste("  Average capital to pay: ", 
                               round(List_simul$capital_22_2),
                               " euros \n\n",sep=""))),
        as.character(div(style=as.character("color: #FF0000;"), 
                         paste("  Average surplus: ", 
                               round(List_simul$capital_22_3),
                               " euros \n\n",sep="")))
        ))
      
    })
    output$figure_life_exp <- renderPlot({
      L = f_graph_L(input)
      plot(L$personne$x-L$personne$x[1],L$personne$y,
          xlab="",
           ylab="Survival probability",
           type="l",lwd=2,col=colr[5],ylim=0:1,axes=FALSE)
      lines(L$chien$x-L$chien$x[1],L$chien$y,
            lwd=2,col=colr[4])
      axis(2)
      axis(1,at = L$personne$x-L$personne$x[1],
           labels= L$personne$x,
           col = colr[5],
           col.axis = colr[5])
      mtext("Age in years of the owner", side=1, line=2, col=colr[5], cex=1)
      axis(3,at = L$chien$x-L$chien$x[1],
           labels= L$chien$x,
           col = colr[4],
           col.axis = colr[4])
      mtext(paste("Age in years of the dog - ",input$race), side=3, line=2, col=colr[4], cex=1)
    })
    output$figure_remb <- renderPlot({
      if(input$genderP == "Man") INED = INEDH
      if(input$genderP == "Woman") INED = INEDF
      List_simul = simul_mensuel(ns = 1e6,
                                 ageP = input$ageP,
                                 ageC = input$ageC,
                                 revenu = floor(input$revP/5)+1,
                                 chien = "feuille2",
                                 baseined = INED,
                                 limite = input$duree,
                                 versements = 12,
                                 kapital = input$kapital)
      T = List_simul$table
      Tnorm = List_simul$table_norm
   
      plot(0:dim(T)[1],0:dim(T)[1],col="white",
           xlim=c(0,dim(T)[1])/12,
           ylim=c(0,dim(T)[2])/12,axes=FALSE,
           xlab="",ylab="")
      axis(1,at = seq(0,dim(T)[1]/12,by=1),
           labels= seq(0,dim(T)[1]/12,by=1),
           col = colr[5],
           col.axis = colr[5])
      mtext(paste("Dog's owner ",input$ageP," years old (residuals years)",sep=""),
            side=1, line=2, col=colr[5], cex=1)
      axis(2,at = seq(0,dim(T)[2]/12,by=1),
           labels= seq(0,dim(T)[2]/12,by=1),
           col = colr[4],
           col.axis = colr[4])
      mtext(paste("Dog ",input$ageC," years old (residuals years)",sep=""),
            side=2, line=2, col=colr[4], cex=1)
      ok = 0 
      for(i in 1:dim(T)[1]){
        for(j in 1:dim(T)[2]){
          couleur = colr[1]
          if((j<(2*i))&((j-i)<=(input$duree*12))) {couleur = colr[2]
          ok = ok + T[i,j]}
          points((i-1)/12,(j-1)/12,pch=19,cex=1*Tnorm[i,j],col=couleur)
        }
      }
})
}

# Run the application 
shinyApp(ui = ui, server = server)
