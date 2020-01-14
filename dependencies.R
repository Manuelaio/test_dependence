
setRepositories(ind = 1:5)
install.packages(c('shiny', 'shinydashboard'), repos='http://cran.rstudio.com/')
install.packages('BiocManager')
BiocManager::install('BiocInstaller')
list_of_packages <- c("shinyWidgets", "BiocInstaller","shinyWidgets","shinyBS","markdown", "data.table", "DT","dplyr", "Gviz", "Homo.sapiens",
                      "OrganismDbi", "stringr", "shinyjs", "condformat","ggbio", "bedr", "org.Hs.eg.db", "rtracklayer","stats",
                      "Rsamtools", "TxDb.Hsapiens.UCSC.hg19.knownGene","TxDb.Hsapiens.UCSC.hg38.knownGene",
                      "BSgenome.Hsapiens.UCSC.hg19", "BSgenome.Hsapiens.UCSC.hg38",
                      "EnsDb.Hsapiens.v75","EnsDb.Hsapiens.v86")
new.packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
my_packages= installed.packages()[,1]
check_require <- function(package){
  if(eval(parse(text=paste("require(",package,")")))) return(paste0(package, ' works in environment rstudio \n'))
  else(return(paste0(package,' error! No package calls \n')))
  suppressPackageStartupMessages(require(package))
  
}

a=list()

for (i in my_packages){
  
  date=(check_require(i))
  # a= list.append(a, i, date)
  a=append(a,date)
  write.table(a, file='./library.txt', quote=FALSE, row.names = FALSE, col.names = FALSE)
}

