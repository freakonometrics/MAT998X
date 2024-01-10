library(tabulizer)
library(dplyr)
library(tidyr)
library(tibble)
library(purrr)
library(janitor)

library(wesanderson)
colr = wes_palette("Darjeeling1")



# loc = "https://static-content.springer.com/esm/art%3A10.1038%2Fs41598-022-10341-6/MediaObjects/41598_2022_10341_MOESM2_ESM.pdf
loc = "/Users/arthurcharpentier/Downloads/41598_2022_10341_MOESM2_ESM.pdf"
#pdf_data <- system.file("examples", loc, package = "tabulizer")
#https://www.insee.fr/fr/statistiques/3311422?sommaire=3311425
# Table S3. Cohort life table of entire female dogs under primary
# veterinary care in the S3

# Table S2. Cohort life table of male dogs under primary veterinary care in the UK

T2 = extract_tables(loc, pages = 2)[[1]]
x2 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T2[,6]))
Lx2 = Lx*1000/Lx[1]

T3 = extract_tables(loc, pages = 3)[[1]]
x3 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T3[,6]))
Lx3 = Lx*1000/Lx[1]

T4 = extract_tables(loc, pages = 4)[[1]]
x4 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T4[,6]))
Lx4 = Lx*1000/Lx[1]

T6 = extract_tables(loc, pages = 6)[[1]]
x6 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T6[,6]))
Lx6 = Lx*1000/Lx[1]

T7 = extract_tables(loc, pages = 7)[[1]]
x7 = 0:17 # T2[,1]
Lx = as.numeric(as.character(T7[,6]))
Lx7 = Lx*1000/Lx[1]

T8 = extract_tables(loc, pages = 8)[[1]]
x8 = 0:17 # T2[,1]
Lx = as.numeric(as.character(T8[,6]))
Lx8 = Lx*1000/Lx[1]

T9 = extract_tables(loc, pages = 9)[[1]]
x9 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T9[,6]))
Lx9 = Lx*1000/Lx[1]

T10 = extract_tables(loc, pages = 10)[[1]]
x10 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T10[,6]))
Lx10 = Lx*1000/Lx[1]

T11 = extract_tables(loc, pages = 11)[[1]]
x11 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T11[,6]))
Lx11 = Lx*1000/Lx[1]

T14 = extract_tables(loc, pages = 14)[[1]]
x14 = 0:15 # T2[,1]
Lx = as.numeric(as.character(T14[,6]))
Lx14 = Lx*1000/Lx[1]

T15 = extract_tables(loc, pages = 15)[[1]]
x15 = 0:12 # T2[,1]
Lx = as.numeric(as.character(T15[,6]))
Lx15 = Lx*1000/Lx[1]

T16 = extract_tables(loc, pages = 16)[[1]]
x16 = 0:14 # T2[,1]
Lx = as.numeric(as.character(T16[,6]))
Lx16 = Lx*1000/Lx[1]

T17 = extract_tables(loc, pages = 17)[[1]]
x17 = 0:17 # T2[,1]
Lx = as.numeric(as.character(T17[,6]))
Lx17 = Lx*1000/Lx[1]

T18 = extract_tables(loc, pages = 18)[[1]]
x18 = 0:15 # T2[,1]
Lx = as.numeric(as.character(T18[,6]))
Lx18 = Lx*1000/Lx[1]

T19 = extract_tables(loc, pages = 19)[[1]]
x19 = 0:13 # T2[,1]
Lx = as.numeric(as.character(T19[,6]))
Lx19 = Lx*1000/Lx[1]

T21 = extract_tables(loc, pages = 21)[[1]]
x21 = 0:16 # T2[,1]
Lx = as.numeric(as.character(T21[,6]))
Lx21 = Lx*1000/Lx[1]

T22 = extract_tables(loc, pages = 22)[[1]]
x22 = 0:16 # T2[,1]
Lx = as.numeric(as.character(T22[,6]))
Lx22 = Lx*1000/Lx[1]

T23 = extract_tables(loc, pages = 23)[[1]]
x23 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T23[,6]))
Lx23 = Lx*1000/Lx[1]

T24 = extract_tables(loc, pages = 24)[[1]]
x24 = 0:11 # T2[,1]
Lx = as.numeric(as.character(T24[,6]))
Lx24 = Lx*1000/Lx[1]

T25 = extract_tables(loc, pages = 25)[[1]]
x25 = 0:15 # T2[,1]
Lx = as.numeric(as.character(T25[,6]))
Lx25 = Lx*1000/Lx[1]

T26 = extract_tables(loc, pages = 26)[[1]]
x26 = 0:14 # T2[,1]
Lx = as.numeric(as.character(T26[,6]))
Lx26 = Lx*1000/Lx[1]

T27 = extract_tables(loc, pages = 27)[[1]]
x27 = 0:19 # T2[,1]
Lx = as.numeric(as.character(T27[,6]))
Lx27 = Lx*1000/Lx[1]

T28 = extract_tables(loc, pages = 28)[[1]]
x28 = 0:16 # T2[,1]
Lx = as.numeric(as.character(T28[,6]))
Lx28 = Lx*1000/Lx[1]

T29 = extract_tables(loc, pages = 29)[[1]]
x29 = 0:13 # T2[,1]
Lx = as.numeric(as.character(T29[,6]))
Lx29 = Lx*1000/Lx[1]

T30 = extract_tables(loc, pages = 30)[[1]]
x30 = 0:17 # T2[,1]
Lx = as.numeric(as.character(T30[,6]))
Lx30 = Lx*1000/Lx[1]

T31 = extract_tables(loc, pages = 31)[[1]]
x31 = 0:16 # T2[,1]
Lx = as.numeric(as.character(T31[,6]))
Lx31 = Lx*1000/Lx[1]

T32 = extract_tables(loc, pages = 32)[[1]]
x32 = 0:18 # T2[,1]
Lx = as.numeric(as.character(T32[,6]))
Lx32 = Lx*1000/Lx[1]

TABLE_CHIEN = list(
  feuille2 = data.frame(x = x2,
                        Lx = Lx2),
  feuille25 = data.frame(x = x25,
                         Lx = Lx25),
  feuille27 = data.frame(x = x27,
                         Lx = Lx27)
)


plot(TABLE_CHIEN[["feuille2"]]$x,TABLE_CHIEN[["feuille2"]]$Lx,type="s",xlab="Age (années)",
     ylab="Table de mortalité de cohorte des chiens mâlesrecevant des soins vétérinaires")

INED=read.csv2("/Users/arthurcharpentier/Dropbox (Télécom SudParis)/DESSIN_MANDASS/fr_tablemort.csv") 
INEDF = read.csv2("/Users/arthurcharpentier/Dropbox (Télécom SudParis)/mortaliteHFrevenu/FEMMES-Tableau.csv")
INEDH = read.csv2("/Users/arthurcharpentier/Dropbox (Télécom SudParis)/mortaliteHFrevenu/HOMMES-Tableau.csv")

INEDF = read.csv2("/Users/arthurcharpentier/morta_niv_2016/F-2012_2016-Tableau 1.csv")
INEDH = read.csv2("/Users/arthurcharpentier/morta_niv_2016/H-2012_2016-Tableau 1.csv")

A =INEDF$AGE
x = 0:19

L_INEDF = INEDF[,c(1,seq(5,ncol(INEDF),by=3))]
L_INEDH = INEDH[,c(1,seq(5,ncol(INEDH),by=3))]

C_INEDF = P_INEDF = L_INEDF
P_INEDF[,2:21] = (1-L_INEDF[,2:21]/100000)
C_INEDF[,2:21] = apply(P_INEDF[,2:21],2,cumprod)
C_INEDH = P_INEDH = L_INEDH
P_INEDH[,2:21] = (1-L_INEDH[,2:21]/100000)
C_INEDH[,2:21] = apply(P_INEDH[,2:21],2,cumprod)

FCQ1 = C_INEDH[,2]
FCQ2 = C_INEDH[,11]
FCQ3 = C_INEDH[,21]

par(mfrow = c(1,2))
plot(A,FCQ1,xlab="Age in years (woman)",
     ylab="Survival probability",type="l",lwd=2,col=colr[1],ylim=0:1)
lines(A,FCQ2,lwd=2,col=colr[3])
lines(A,FCQ3,lwd=2,col=colr[5])

T2 = extract_tables(loc, pages = 2)[[1]]
x = 0:19 # T2[,1]
Lx = as.numeric(as.character(T2[,6]))
Lx = Lx*1/Lx[1]
plot(x,Lx,type="l",
     xlab="Age in years (male dog)",
     ylab="Survival probability",
     lwd=2,col=colr[2])

ageF = 70
ageC = 4
idxF = which(A>=ageF)
idxC = which(x>=ageC)

plot(A[idxF],FCQ1[idxF]/max(FCQ1[idxF]),
     xlab="Age in years (woman)",
     ylab="Survival probability",type="l",lwd=2,col=colr[1],ylim=0:1)
lines(A[idxF],FCQ2[idxF]/max(FCQ2[idxF]),lwd=2,col=colr[3])
lines(A[idxF],FCQ3[idxF]/max(FCQ3[idxF]),lwd=2,col=colr[5])
text(ageF,.75,paste(ageF," years old",sep=""),pos=1,srt=90)
segments(ageF,.85,ageF,1)
plot(x[idxC],Lx[idxC]/max(Lx[idxC]),type="l",
     xlab="Age in years (male dog)",
     ylab="Survival probability",
     lwd=2,col=colr[2])
text(ageC,.75,
     paste(ageC," years old",sep=""),pos=1,srt=90)
segments(ageC,.85,ageC,1)

simul = function(ns = 1e6,
                 ageF = 70,
                 ageC = 4,
                 revenu = 18,
                 chien = "feuille2",
                 baseined = C_INEDF){
  A =INEDF$AGE
  D_chien = TABLE_CHIEN[[chien]]
  x = D_chien$x
  Lx = D_chien$Lx
  idxF = which(A>=ageF)
  idxC = which(x>=ageC)
  
  set.seed(123)
  P1 = data.frame(p1 = baseined[idxF,revenu]/max(baseined[idxF,revenu]))
  P1$d1 = c(-diff(P1$p1),P1[nrow(P1),"p1"])
  P0 = data.frame(p0=Lx[idxC]/max(Lx[idxC]))
  P0$d0 = c(-diff(P0$p0),P0[nrow(P0),"p0"])
  femme = sample(0:(103-ageF+1),size=ns,prob = P1$d1,replace=TRUE)
  chien = sample(0:(max(x)-ageC),size=ns,prob = P0$d0,replace=TRUE)
  
  proba = mean(femme>=chien) # proportion des cas, femme survie a son chien
  idx = which(femme<=chien)
  tableau = data.frame(maitresse = femme[idx],
                       chien = chien[idx])
  T = table(tableau)
  Tnorm = T/max(T)
  rv = paste((revenu-2)*5,"-",(revenu-1)*5,"%",sep="")
  
  par(mfrow=c(1,1))
  plot(0:dim(T)[1],0:dim(T)[2],col="white",
       xlab = paste("Dog's owner ",ageF,"years old (residuals years) ",rv," (quantile)",sep=""),
       ylab = paste("Dog ",ageC," years old (redisual years)",sep=""))
  ok = 0 
  for(i in 1:dim(T)[1]){
    for(j in 1:dim(T)[2]){
      couleur = colr[1]
      if(j<(2*i)){couleur = colr[2]
      ok = ok + T[i,j]}
      points(i-1,j-1,pch=19,cex=3*Tnorm[i,j],col=couleur)
    }
  }
  proba_assez = ok/sum(T)
  legend("bottomright",
         c(paste(round(100-proba_assez*100,2),"%"),
           paste(round(proba_assez*100,2),"%")),
         pch=19,
         col=colr[c(1,2)],
         bty="n")
  legend("topleft",
         paste("Probabilité that dog dies before owner",round(proba*100,2),"%"),
         pch=19,
         col="white",
         bty="n")
  
  return(list(proba_deces_plus_tot = proba,
              proba_assez_capital = proba_assez,
              table = T))
}

simul(ns = 1e6,
      ageF = 80,
      ageC = 4,
      revenu = 18,
      chien = "feuille2",
      baseined = C_INEDH)
# espérances de vie
# regarder plusieurs chiens

par(mfrow= c(1,2))
ageF = 70
ageC = 4
idxF = which(A>=ageF)
idxC = which(x>=ageC)

FCQ3H = C_INEDH[,21]
FCQ3F = C_INEDF[,21]

CLR = c(wes_palette("Darjeeling1"),wes_palette("Darjeeling2")[2])


plot(A[idxF]-ageF,FCQ3F[idxF]/max(FCQ3F[idxF]),
     xlab="Residuals age (in years) - owner 70 years old",
     ylab="Survival probabilities",type="l",lwd=2,
     col="black",ylim=0:1)
lines(A[idxF]-ageF,FCQ3H[idxF]/max(FCQ3H[idxF]))

lines(x32[-(1:4)]-ageC,Lx32[-(1:4)]/(max(Lx32[-(1:4)])),
      col=CLR[1],lwd=2)
lines(x31[-(1:4)]-ageC,Lx31[-(1:4)]/(max(Lx31[-(1:4)])),
      col=CLR[2],lwd=2)
lines(x28[-(1:4)]-ageC,Lx28[-(1:4)]/(max(Lx28[-(1:4)])),
      col=CLR[3],lwd=2)
lines(x27[-(1:4)]-ageC,Lx27[-(1:4)]/(max(Lx27[-(1:4)])),
      col=CLR[4],lwd=2)
lines(x25[-(1:4)]-ageC,Lx25[-(1:4)]/(max(Lx25[-(1:4)])),
      col=CLR[5],lwd=2)
lines(x22[-(1:4)]-ageC,Lx22[-(1:4)]/(max(Lx22[-(1:4)])),
      col=CLR[6],lwd=2)

ageF = 80
ageC = 4
idxF = which(A>=ageF)
idxC = which(x>=ageC)

FCQ3H = C_INEDH[,21]
FCQ3F = C_INEDF[,21]

CLR = c(wes_palette("Darjeeling1"),wes_palette("Darjeeling2")[2])


plot(A[idxF]-ageF,FCQ3F[idxF]/max(FCQ3F[idxF]),
     xlab="Residuals age (in years) - owner 80 years old",
     ylab="Survival probabilities",type="l",lwd=2,
     col="black",ylim=0:1)
lines(A[idxF]-ageF,FCQ3H[idxF]/max(FCQ3H[idxF]))

lines(x32[-(1:4)]-ageC,Lx32[-(1:4)]/(max(Lx32[-(1:4)])),
      col=CLR[1],lwd=2)
lines(x31[-(1:4)]-ageC,Lx31[-(1:4)]/(max(Lx31[-(1:4)])),
      col=CLR[2],lwd=2)
lines(x28[-(1:4)]-ageC,Lx28[-(1:4)]/(max(Lx28[-(1:4)])),
      col=CLR[3],lwd=2)
lines(x27[-(1:4)]-ageC,Lx27[-(1:4)]/(max(Lx27[-(1:4)])),
      col=CLR[4],lwd=2)
lines(x25[-(1:4)]-ageC,Lx25[-(1:4)]/(max(Lx25[-(1:4)])),
      col=CLR[5],lwd=2)
lines(x22[-(1:4)]-ageC,Lx22[-(1:4)]/(max(Lx22[-(1:4)])),
      col=CLR[6],lwd=2)

simul(ns = 1e6,
      ageF = 80,
      ageC = 4,
      revenu = 18,
      chien = "feuille27",
      baseined = C_INEDH)

########


simul_mensuel_init = function(ns = 1e6,
                         ageP = 70,
                         ageC = 4,
                         revenu = 18,
                         chien = "feuille2",
                         baseined = C_INEDF,
                         limite = 10000/200/12,
                         versements = 12,
                         kapital = 200){
  
  A =INEDF$AGE
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
  
  # mensuel
  personne = personne + sample(0:11,size = ns,replace=TRUE)/12
  chien = chien + sample(0:11,size = ns,replace=TRUE)/12
  
  proba = mean(personne>=chien) # proportion des cas, femme survie a son chien
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
  
  par(mfrow=c(1,1))
  plot(0:dim(T)[1],0:dim(T)[1],col="white",
       xlab = paste("Dog's owner ",ageP," years old (residuals years) ",rv," (quantile)",sep=""),
       ylab = paste("Dog ",ageC," years old (redisual years)",sep=""),
       xlim=c(0,dim(T)[1])/12,
       ylim=c(0,dim(T)[2])/12)
  ok = 0 
  for(i in 1:dim(T)[1]){
    for(j in 1:dim(T)[2]){
      couleur = colr[1]
      if((j<(2*i))&((j-i)<=(limite*12))) {couleur = colr[2]
      ok = ok + T[i,j]}
      points((i-1)/12,(j-1)/12,pch=19,cex=1*Tnorm[i,j],col=couleur)
    }
  }
  proba_assez = ok/sum(T)
  legend("bottomright",
         c(paste(round(p5*100,2),"%"),
           paste(round(p4*100,2),"%")),
         pch=19,
         col=colr[c(1,2)],
         bty="n")
  legend("topleft",
         paste("Probability that dog dies before owner",round(proba*100,2),"%"),
         pch=19,
         col="white",
         bty="n")
  
  # en cas de décès du chien avant le maitre
  
  
  cat("--------------------------------------------------------------------\n")
  cat("   âge maître = ",ageP," ans\n",sep="")
  cat("   âge chien  = ",ageC," ans\n",sep="")
  cat("   espérance de vie résiduelle du maitre = ",round(mean(personne),2)," ans\n",sep="")
  cat("   espérance de vie résiduelle du chien  = ",round(mean(chien),2)," ans\n",sep="")
  cat("   probabilité que le chien survive au maître  = ",round(mean(chien>personne)*100,2),"%\n",sep="")
  cat("   durée maximale de versement = ",limite*12," mois (",limite," années)\n",sep="")
  cat("   capital versé chaque mois = ",kapital," euros\n",sep="")
  cat("\n")
  cat(" Cas 1 : décès prématuré du chien\n")
  cat("   probabilité que le chien décède avant le maître  = ",round(mean(chien<=personne)*100,2),"%\n",sep="")
  cat("   capital moyen accumulé (sans limite) = ",round(mean(x2)*kapital)," euros\n",sep="")
  cat("   capital moyen accumulé (avec limite) = ",round(mean(x2a)*kapital)," euros\n",sep="")
  cat("\n")
  cat(" Cas 2 : décès prématuré du maître\n")
  cat("   probabilité que le chien survive au maître  = ",round(mean(chien>personne)*100,2),"%\n",sep="")
  cat("   capital moyen accumulé au décès du maître (sans limite) = ",round(mean(x1)*kapital)," euros\n",sep="")
  cat("   capital moyen accumulé au décès du maître (avec limite) = ",round(mean(x1a)*kapital)," euros\n",sep="")
  cat("   capital moyen à verser jusqu'au décès du chien          = ",round(mean(x1b)*kapital)," euros\n",sep="")
  cat(" Cas 2.1 : capital versé suffisant\n")
  cat("   probabilité que le capital versé suffise = ",round(p4*100,2),"%\n",sep="")
  cat("   capital moyen accumulé au décès du maître               = ",round(mean(x4a)*kapital)," euros\n",sep="")
  cat("   capital moyen accumulé à verser jusqu'au décès du chien = ",round(mean(x4b)*kapital)," euros\n",sep="")
  cat("   surplus de capital moyen                                = ",round(mean(x4a-x4b)*kapital)," euros\n",sep="")
  cat(" Cas 2.2 : capital versé insuffisant\n")
  cat("   probabilité que le capital versé ne suffise pas = ",round(p5*100,2),"%\n",sep="")  
  cat("   capital moyen accumulé au décès du maître               = ",round(mean(x5a)*kapital)," euros\n",sep="")
  cat("   capital moyen accumulé à verser jusqu'au décès du chien = ",round(mean(x5b)*kapital)," euros\n",sep="")
  cat("   déficit de capital moyen                                = ",round(mean(x5a-x5b)*kapital)," euros\n",sep="")
  
  L = list(age_personne = ageP,
           mean_res_personne = mean(personne),
           age_chien = ageC,
           chien = mean(chien),
           classe_revenu = revenu,
           quantiles_revenu = rv,
           table_mortalite_chien = chien,
           table_mortalite_humain = C_INEDF,
           limite_versement = limite,
           proba_deces_plus_tot = proba,
           proba_assez_capital = proba_assez,
           table = T)
}

simul_mensuel_init()
