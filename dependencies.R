setRepositories(ind = 1:5)
install.packages(c('shiny', 'shinydashboard'), repos='http://cran.rstudio.com/')
install.packages('BiocManager')
#BiocManager::install('BiocInstaller')
list_of_packages <- c("markdown", "shiny", "shinyjs", "shinyBS", "shinyWidgets","shinycssloaders", "DT", 
                      "Gviz","dplyr", "Homo.sapiens", "openxlsx", "condformat", "stringr", "bedr", 
                      "org.Hs.eg.db", "TxDb.Hsapiens.UCSC.hg38.knownGene", 
                      "TxDb.Hsapiens.UCSC.hg19.knownGene", "rlist",
                      "EnsDb.Hsapiens.v75", "EnsDb.Hsapiens.v86", "OrganismDbi",
                      "BSgenome.Hsapiens.UCSC.hg19", "processx", "Rsamtools", "GenomicRanges", "BSgenome.Hsapiens.UCSC.hg38")

lst_to_install <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]

n_cores <- parallel::detectCores()
install.packages(lst_to_install, Ncpus = n_cores - 1, clean = TRUE)
BiocManager::install("Gviz")
BiocManager::install("ggbio")

not_installed <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]

if(length(not_installed) == 0) {
  print("Good to go!")
} else {
  print("You need to install these packages!")
  not_installed
}

my_packages= installed.packages()[,1]
check_require <- function(package){
   if(eval(parse(text=paste("require(",package,")")))) return(paste0(package, ' works in environment rstudio \n'))
   else(return(paste0(package,' error! No package calls \n')))
        suppressPackageStartupMessages(require(package))

}
