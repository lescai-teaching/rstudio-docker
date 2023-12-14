
packageurl <- "https://cran.r-project.org/src/contrib/Archive/rvcheck/rvcheck_0.1.8.tar.gz"
install.packages(packageurl, repos=NULL, type="source")
install.packages('ggnewscale', repos = 'https://cloud.r-project.org')

BiocManager::install(c('pheatmap', 'clusterProfiler', 'DOSE', 'org.Hs.eg.db'))
