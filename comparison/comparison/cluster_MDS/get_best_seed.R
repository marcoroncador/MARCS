# get the best performing seed and corresponding DAGs + memberships
library(clustNet)
rm(list=ls())

assignprogressList <- list()
# seeds <- which(sapply(1:100, function(x) length(readRDS(paste0("euler_results/memberships_seed_",x,".rds"))$DAGs))==9)
seeds <- c(1:100)
for (i in seeds){
  assignprogressList[[i]] <- readRDS(paste0("euler_results/memberships_seed_",i,".rds"))$assignprogress
}

best_seed <- graphClust:::getBestSeed(assignprogressList)
best_res <- readRDS(paste0("euler_results/memberships_seed_",seeds[best_seed],".rds"))

saveRDS(best_res,"./MDSonly_5clus.rds")
