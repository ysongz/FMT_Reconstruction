# FMT_Reconstruction
This code performs a sparsity-initialized MLEM algorithm described in __[1]__ for reconstruction of fluorescence molecular tomography.  
To run this code, use the following command:
__FMTrecon(detector,Gorg,truncnum,lambda,tol,niter)__,  
where   
“detector” is a column vector representing detector measurements,  
“Gorg” is system matrix that stores Green’s function,  
“truncnum” is truncation number used in truncated singular value decomposition for preconditioning,  
“lambda” is regularization strength for sparse recovery,  
“tol” is tolerance used as stopping criteria in sparse recovery,  
“niter” is the number of iteration in MLEM algorithm.  

demo.m provides an example of running this algorithm on a digital cube phantom.

__Reference__:  
[1] Yansong Zhu, Abhinav K. Jha, Dean F. Wong, and Arman Rahmim, "Image reconstruction in fluorescence molecular tomography with sparsity-initialized maximum-likelihood expectation maximization," Biomed. Opt. Express 9, 3106-3121 (2018)   
