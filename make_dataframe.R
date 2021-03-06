library(Peptides)
library(seqinr)


# get the characteristic of CDS from 


prepared.cds.all.fa


seq <- read.fasta("gene_of_interest.fasta", seqtype = "AA", as.string = TRUE,  set.att = F)
cds_SEQ <- read.fasta("prepared.cds.all.fa", seqtype = "AA", as.string = TRUE,  set.att = F)
cds_loc <- read.fasta("prepared.cds.all.fa", seqtype = "AA", as.string = TRUE,  set.att = T)


GeneID  <- c() 
sizeaa <- c() #how many amino acids the gene sequence has 
MWkDa  <- c() # Molecular Weight (kDa)
PI <- c() # isoelectric point
ORF <- c() #open reading frame base pair
LOC <- c() #location of gene on genome

i<-0
for (var in seq ) {
  i<-i+1
  Gene_ID <- attr(seq[i], "name")
  size_aa <- nchar(var)
  MW_kDa <- mw(var)
  pi<- pI(var)
  GeneID  <- c(GeneID,Gene_ID)
  sizeaa <- c(sizeaa, size_aa)
  MWkDa  <- c(MWkDa, MW_kDa)
  PI <- c(PI, pi)
}

for (var in cds_SEQ ) {
  ORF  <- c(ORF,nchar(var))
}

for (var in cds_loc ) {
  Gene_ID <- attr(var, "Annot")
  loc_s <- sapply(strsplit(Gene_ID, ":"), "[", 4)
  loc_f <- sapply(strsplit(Gene_ID, ":"), "[", 5)
  loc <- paste(loc_s, loc_f, sep="-")
  
  LOC  <- c(LOC,loc)
}  


df <- data.frame ("Gene_ID"  = GeneID,
                  "Location" = LOC,
                  "size_aa" = sizeaa,
                  "ORF_bp"= ORF,
                  "MW_kDa" = MWkDa,
                  "PI"= PI)
#get the table as csv 
write.csv(df,"df2.csv", row.names = FALSE)
