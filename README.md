# FMT_Reconstruction
This code performs a sparsity-initialized MLEM algorithm described in __[1]__ for reconstruction of fluorescence molecular tomography.  
To run this algorithm, use the following command:
___FMTrecon(detector,Gorg,truncnum,lambda,tol,niter)___,  
where   
* “__detector__” is a column vector representing detector measurements,  
* “__Gorg__” is is sensitivity matrix. Each column in “Gorg” represents response to a point fluorescence source in object space with all possible combination of detector and illumination source.
* “__truncnum__” refers to the number of largest singular values kept in SVD. This parameter balances noise and stability of sparse recovery algorithm.
* “__lambda__” represents regularization strength for sparse recovery. This parameter influences level of sparsity in sparse recovery algorithm.
* “__tol__” is tolerance used as stopping criteria in sparse recovery,  
* “__niter__” is the number of iteration in MLEM algorithm.  

demo.m provides an example of running this algorithm on a digital cube phantom.

__Reference__:  
[1] Yansong Zhu, Abhinav K. Jha, Dean F. Wong, and Arman Rahmim, "Image reconstruction in fluorescence molecular tomography with sparsity-initialized maximum-likelihood expectation maximization," Biomed. Opt. Express 9, 3106-3121 (2018)   
