# testing functions, aim to get 100% test coverage on exported code
# testing for envcpt function

#Import the possible options for envcpt function. Similar to changepoint functions so can import the same data
set.seed(1) # Note: new data sets must be added at the end.
singmeandata <- c(rnorm(100,0,1),rnorm(100,10,1))
mulmeandata <- c(rnorm(100,0,1),rnorm(100,10,1),rnorm(100,20,1),rnorm(100,50,1))
nochangedata <- c(rnorm(200,0,1))
singvardata <- c(rnorm(100,10,1),rnorm(100,10,5))
mulvardata <- c(rnorm(100,20,10),rnorm(100,20,15),rnorm(100,20,20),rnorm(100,20,25))
singmeanvardata <- c(rnorm(50,0,1),rnorm(50,3,10))
mulmeanvardata <- c(rnorm(50,0,1),rnorm(50,5,3),rnorm(50,10,1),rnorm(50,3,10))
mulmeanvarexpdata <- c(rexp(50,1), rexp(50,3), rexp(50,5), rexp(50,7)) #rate values correct
mulmeanvarpoisdata <- c(rpois(50,1), rpois(50,2), rpois(50,3), rpois(50,5)) #lambda values correct?
constantdata <- rep(1, 200)
shortdata <- c(2)
negativedata <- jitter(rep(-100, 200) )
characterdata <- rep("ert", 200)
#NAdata - creates 10 random NA within singmeandata
NAdata <- singmeandata
rn <- sample(1:length(singmeandata), 10, replace=F)
for(i in rn){
  NAdata[i] <- NA
}
data <- list(singmeandata,mulmeandata, nochangedata, singvardata, mulvardata, mulmeanvardata, mulmeanvarexpdata, mulmeanvarpoisdata, constantdata, NAdata, shortdata, negativedata, characterdata)
#Now filling the other inputs
models <- c("mean","meancpt","meanar1","meanar2","meanar1cpt","meanar2cpt", "trend","trendcpt","trendar1","trendar2","trendar1cpt","trendar2cpt")
minseglens <- c(1,5,100)

#Now possible inputs have been decided
# testthat now uses its own tolerance settings testthat_tolerance()
# because of this the following tests now fail as the date field in the cpt objects are different
# envcptfull <- envcpt(mulmeandata)
# envcptstore <- list()
# for( i in 1:length(models)){
# 
#  #testdata = as.numeric(as.character(unlist(data[[i]])))
#   #First check that full envcpt produces the exact same results as doing individual models
#  envcptstore[[i]] <- envcpt(mulmeandata, models = models[i])
#  test_that(paste("Test",i),expect_equal(envcptstore[[i]][i+1],envcptfull[i+1],tolerance=))
# }



