
loc = "/Users/arthurcharpentier/Downloads/41598_2022_10341_MOESM2_ESM.pdf"

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
x10 = 0:17 # T2[,1]
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
DF = data.frame(x = x2,
                Lx = Lx2) # valeur par défaut
TABLE_CHIEN = list(
  feuille1 = DF,
  feuille2 = data.frame(x = x2,
                        Lx = Lx2),
  feuille3 = data.frame(x = x3,
                        Lx = Lx3),
  feuille4 = data.frame(x = x4,
                        Lx = Lx4),
  feuille5 = DF,
  feuille6 = data.frame(x = x6,
                        Lx = Lx6),
  feuille7 = data.frame(x = x7,
                        Lx = Lx7),
  feuille8 = data.frame(x = x8,
                        Lx = Lx8),
  feuille9 = data.frame(x = x9,
                        Lx = Lx9),
  feuille10 = data.frame(x = x10,
                         Lx = Lx10),
  feuille11 = data.frame(x = x11,
                         Lx = Lx11),
  feuille12 = DF,
  feuille13 = DF,
  feuille14 = data.frame(x = x14,
                         Lx = Lx14),
  feuille15 = data.frame(x = x15,
                         Lx = Lx15),
  feuille16 = data.frame(x = x16,
                         Lx = Lx16),
  feuille17 = data.frame(x = x17,
                         Lx = Lx17),
  feuille18 = data.frame(x = x18,
                         Lx = Lx18),
  feuille19 = data.frame(x = x19,
                         Lx = Lx19),
  feuille20 = DF,
  feuille21 = data.frame(x = x21,
                         Lx = Lx21),
  feuille22 = data.frame(x = x22,
                         Lx = Lx22),
  feuille23 = data.frame(x = x23,
                         Lx = Lx23),
  feuille24 = data.frame(x = x24,
                         Lx = Lx24),
  feuille25 = data.frame(x = x25,
                         Lx = Lx25),
  feuille26 = data.frame(x = x26,
                         Lx = Lx26),
  feuille27 = data.frame(x = x27,
                         Lx = Lx27),
  feuille28 = data.frame(x = x28,
                         Lx = Lx28),
  feuille29 = data.frame(x = x29,
                         Lx = Lx29),
  feuille30 = data.frame(x = x30,
                         Lx = Lx30),
  feuille31 = data.frame(x = x31,
                         Lx = Lx31),
  feuille32 = data.frame(x = x32,
                         Lx = Lx32),
  feuille33 = DF
)
INEDF = read.csv2("/Users/arthurcharpentier/morta_niv_2016/F-2012_2016-Tableau 1.csv")
INEDF = INEDF[,c(1,(1:21)*3)]
INEDH = read.csv2("/Users/arthurcharpentier/morta_niv_2016/H-2012_2016-Tableau 1.csv")
INEDH = INEDH[,c(1,(1:21)*3)]
INED = INEDH
