require("Rpath")
source("rpath_graphs.R")
library('viridis')

Ebase <- "model/ebs_aclim3_74bio_base.csv"  # Base biomass, production, fishing, etc.
Ediet <- "model/ebs_aclim3_74bio_diet.csv"  # Diet matrix
Eped  <- "model/ebs_aclim3_74bio_pedigree.csv"   # Data pedigree = quality of input data
Estz  <- "model/ebs_aclim3_74bio_stanzas.csv"   # Stanzas
Estg  <- "model/ebs_aclim3_74bio_stanza_groups.csv" # Stanza groups

# Setup Base Ecopath and Base Rsim scenario
unbal_params <- read.rpath.params(Ebase, Ediet, Eped, Estg, Estz) # unbalanced
unbal <- rpath.stanzas(unbal_params)
check.rpath.params(unbal)
bal <- rpath(unbal) # balanced
