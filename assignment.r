######### Assignment 3 ###########
######### Martin Gubler ##########

# change working directory
setwd('C:\Users\gublemar\Documents\R\TraMineR Course\Assignments\Solutions')

# 1 - Load biofam
library(TraMineR)
data(biofam)



# 2 - Create a weighted state sequence object named biofam.seq with variables a15 to
# a30, using the following state names and labels
biofam.lab <- c("Parent", "Left", "Married", "Left/Married", "Child", "Left/Child", "Left/Married/Child", "Divorced")
biofam.shortlab <- c("P", "L", "M", "LM", "C", "LC", "LMC", "D")
biofam.seq <- seqdef(biofam[, 10:25], states = biofam.shortlab, labels = biofam.lab, weight = biofam$wp00tbgs)

# 3 - Create a full sequence index plot sorted from the end for each class of the cohort
# variable created in assignment 2.
    
    # Add cohort factor from Assignment 2
    ## Creating the cohort factor
    biofam$cohort <- cut(biofam$birthyr, c(1900,1930,1940,1950,1960),
                         labels=c("1900-1929", "1930-1939", "1940-1949", "1950-1959"), right=FALSE)

seqIplot(biofam.seq, group = biofam$cohort, sortv = "from.start")

# 4 - Print frequencies of first 20 sequences
seqtab(biofam.seq, tlim = 1:20)

# 5 - Create a sequence frequency plot of the 20 most frequent patterns grouped by values
# of the cohort variable and save it as a `jpeg' file.

jpeg(file="biofam-fplot.jpg")
seqfplot(biofam.seq, group=biofam$cohort, tlim=1:20)
dev.off()

# 6 - Transition rate matrix for biofam
seqtrate(biofam.seq)
round(seqtrate(biofam.seq), digits = 3)

# 7 - Transition rate between LM and LMC?
0.184

# 8 - Display the sequence of transversal state distributions by cohort.
seqdplot(biofam.seq, group = biofam$cohort, border = NA)

# 9 - Within each cohort, at what age is the diversity of the transversal state distribution
# at its highest?

### Could not do it myself - but can follow the solution when looking at it. 
### Still, maybe a few words on that would be helpful next Tuesday.

#10 - Display side by side in a same plot area the mean times spent in each of the states
#and the sequence of modal states.

### Tried using the following statement: par(mfrow = c(1, 2))
### Why do we need par(mfrow = c(2, 2)) here? Is it because we have two plots with two columns (plot + legend)?