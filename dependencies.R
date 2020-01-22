setRepositories(ind = 1:5)
install.packages(c('shiny', 'shinydashboard'), repos='http://cran.rstudio.com/')
install.packages('BiocManager')
BiocManager::install('BiocInstaller')
list_of_packages <- c("shinyWidgets", "BiocInstaller","DT","shinyWidgets","shinyBS","markdown", "data.table", "DT","dplyr", "Gviz", "Homo.sapiens",
                      "OrganismDbi", "stringr", "shinyjs", "condformat","ggbio", "bedr", "org.Hs.eg.db", "rtracklayer","stats",
                      "Rsamtools", "TxDb.Hsapiens.UCSC.hg19.knownGene","TxDb.Hsapiens.UCSC.hg38.knownGene",
                      "BSgenome.Hsapiens.UCSC.hg19", "BSgenome.Hsapiens.UCSC.hg38",
                      "EnsDb.Hsapiens.v75","EnsDb.Hsapiens.v86")

lst_to_install <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]

n_cores <- parallel::detectCores()
install.packages(lst_to_install, Ncpus = n_cores - 1, clean = TRUE)

not_installed <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]

cheeck= function(not_installed){
if(isEmpty(not_installed))
print('GO! All packages are installed')
else if (not_installed !=0 & not_installed %in% 'Gviz')
return(BiocInstaller::biocLite('Gviz'))
else if(not_installed %in% 'ggbio')
return(BiocInstaller::biocLite('ggbio'))}
cheeck(not_installed)  

not_installed_yet <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]   

if(length(not_installed_yet) == 0) {
  print("Good to go!")
} else {
  print("You need to install these packages!")
  not_installed_yet
}
