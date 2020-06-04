setRepositories(ind = 1:5)
install.packages(c('shiny', 'shinydashboard'), repos='http://cran.rstudio.com/')
install.packages('BiocManager')
BiocManager::install('BiocInstaller')


BiocManager::install(c('Gviz', 'Homo.sapiens','org.Hs.eg.db', 'TxDb.Hsapiens.UCSC.hg38.knownGene', 
                       'TxDb.Hsapiens.UCSC.hg19.knownGene','EnsDb.Hsapiens.v75', 'EnsDb.Hsapiens.v86', 'OrganismDbi',
                       'BSgenome.Hsapiens.UCSC.hg19', 'Rsamtools', 'GenomicRanges'))

list_of_packages <- c('markdown', 'shiny', 'shinyjs', 'shinyBS', 'shinyWidgets', 'shinycssloaders', 'DT', 
                      'openxlsx', 'condformat', 'stringr', 'bedr',  'rlist', 
                      'processx', 'dplyr', 'Gviz', 'Homo.sapiens','org.Hs.eg.db', 'TxDb.Hsapiens.UCSC.hg38.knownGene', 
                       'TxDb.Hsapiens.UCSC.hg19.knownGene','EnsDb.Hsapiens.v75', 'EnsDb.Hsapiens.v86', 'OrganismDbi',
                       'BSgenome.Hsapiens.UCSC.hg19', 'Rsamtools', 'GenomicRanges')

lst_to_install <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]


n_cores <- parallel::detectCores()
install.packages(lst_to_install, Ncpus = n_cores - 1, clean = TRUE)

not_installed <- list_of_packages[!(list_of_packages %in% installed.packages()[, "Package"])]

if(length(not_installed) == 0) {
    print("Good to go!")
} else {
    print("You need to install these packages!")
    not_installed
}
