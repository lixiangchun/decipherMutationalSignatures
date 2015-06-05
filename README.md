# decipherMutationalSignatures
Deciphering mutational signatures with alternative algorithms

Mutational signature deciphering based on source code from previous publications (Alexandrov L. B. et al.) but provides
simpler command line to run. Besides, it provides several other algorithms. This program is binary code compiled via mcc,
so you can run it with MCR, which is freely available. This proggram is tested with MCR_R2013a.

1. Alexandrov LB, Nik-Zainal S, Wedge DC, et al: Deciphering signatures of mutational processes operative in human cancer. Cell Rep 3:246–59, 2013
2. Alexandrov LB, Nik-Zainal S, Wedge DC, et al: Signatures of mutational processes in human cancer. Nature 500:415–21, 2013

Check 'example.sh' to see how to run this program.

There is an 'output' directory produced when finished running example.sh, all of results are placed in this directory.

Specification of file format in the 'output':

1. parameter_index.txt - this file has three columns recorded stability and reconstruction error corresponding to every rank.
Users can select the optimal rank based on this file. An optimal rank can be identified if it's associated with high stability
and relatively low reconstruction error.

2. Rank_eq_%d.exposure.txt - Text file of matrix normalized H factorized from A for every rank examined (i.e. A ~ W * H).

3. Rank_eq_%d.exposure.txt - Text file of matrix normalized W factorized from A for every rank examined (i.e. A ~ W * H).
 
