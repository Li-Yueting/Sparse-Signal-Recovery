### Sparse Signal Recovery



#### Intro

​	Large-scale (20000*20000) sparse signal recovery with high sparsity in complex domain.

​	Ax+B=y, x is the target signal to be recovered, A is a circulant measure matrix, B is the noise in the measure process.

​	Detailed math formulation is in `/sparse_recovery_illustration.pdf`



#### Methods & Codes (MATLAB)

1. **Orthogonal Matching Pursuit** (OMP)

   ##### <u>reference:</u> 

   Tropp, J. A., & Gilbert, A. C. (2007). Signal recovery from random measurements via orthogonal matching pursuit. *IEEE Transactions on information theory*, *53*(12), 4655-4666.

   ##### <u>code:</u>

   in `/OMP`

   

2. **Iterative Hard-thresholding M-sparse algorithm** (IHTM)

   ##### <u>reference:</u> 

   Blumensath, T., & Davies, M. E. (2008). Iterative thresholding for sparse approximations. *Journal of Fourier analysis and Applications*, *14*(5-6), 629-654.

   ##### <u>code:</u>

   in `/IHTM`

   