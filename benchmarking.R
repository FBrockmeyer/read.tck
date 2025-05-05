## read TCK files
# source: https://openneuro.org/datasets/ds001226/versions/00001
f = list.files('./Data/FOD_iFOD2_trackings', pattern='.tck$', full.names=TRUE) 

if (exists('hasRun') == FALSE) {
  library(freesurferformats)
  body(read.dti.tck)[[6]]
  read.dti.tck2 = read.dti.tck
  body(read.dti.tck2)[[6]] = NULL
  hasRun = TRUE 
}

B = 
  microbenchmark::microbenchmark(
  o = lapply(f, read.dti.tck2),
  n = lapply(f, read.tck),
  times = 10L
)
B




