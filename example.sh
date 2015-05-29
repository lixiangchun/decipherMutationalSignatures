#!/bin/bash

# Mutation types
typesFile=../data/gene.txt

# Mutational categories for mutation types in 'typesFile'
subtypesFile=../data/gene.txt

# Sample names, i.e. column names of input matrix in 'originalGenomesFile'
sampleNamesFile=../data/sample.txt

# Rows represent mutation type and columns sample names. Each cell entry
#+is the number of corresponding mutation types in the sample. Note that
#+the row number of this file must be equal row numbers of both 'typesFile'
#+and 'subtypesFile'.
originalGenomesFile=../data/gexpr.txt

# removes weak mutation types, i.e. reduces the dimmensions, default value
#+in the original code is 0.01, users can set it to 0.0 if they want to use
#+this framework as consensus clustering for gene expression analysis.
removeWeakMutationTypes=0.0

# Algorithm to use, i.e. 1. brunet, 2. mult, 3. als, 4. gdclsNMF, 5. sNMFR
# The original framework uses 'brunet'.
algorithm='sNMFR'

# The min number of signatures
minNumberOfSignature=1

# The max number of signatures
maxNumberOfSignature=16

# Number of iterations to run nmf for each rank.
iterationsPerCore=100

# Number of processes to use, if >1 a matlabpool is open for parallel computing.
numberOfWorkers=1

maxIterPerNmfRun=20000

# The following 2 variables must be set appropriately.
DECIPHER_MUTATIONAL_SIGNATURE_PATH=/ifshk1/BC_CANCER/03user/lixiangchun/iCGA/v0.02/decipherMutationalSignatures
MCRroot=/ifshk1/BC_CANCER/03user/lixiangchun/Software/INSTALL/MCR_R2013a/INSTALL/v81

time -p bash $DECIPHER_MUTATIONAL_SIGNATURE_PATH/run_decipherMutationalSignatures.sh $MCRroot $typesFile $subtypesFile $sampleNamesFile $originalGenomesFile $removeWeakMutationTypes $algorithm $minNumberOfSignature $maxNumberOfSignature $iterationsPerCore $numberOfWorkers $maxIterPerNmfRun


