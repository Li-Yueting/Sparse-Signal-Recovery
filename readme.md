Sparse Signal Recovery
=
Large-scale (20000*20000) sparse signal recovery with high sparsity in complex domain.
Ax+B=y, x is the target signal to be recovered, A is a circulant measure matrix, B is the noise in the measure process, y is the received signal. The target is to recover signal x from y with known A. Detailed math illustration is in `/sparse_recovery_illustration.pdf`
  
    
    
Methods & Codes (MATLAB)
-

### 1. Orthogonal Matching Pursuit (OMP)

* <u>Reference:</u> 
[Signal Recovery from Random Measurements via Orthogonal Matching Pursuit](https://authors.library.caltech.edu/9490/1/TROieeetit07.pdf)

* <u>Code:</u>
In `/OMP`

   

### 2. Iterative Hard-thresholding M-sparse algorithm (IHTM)
* <u>Reference:</u> 
[Iterative Thresholding for Sparse Approximations](https://link.springer.com/content/pdf/10.1007/s00041-008-9035-z.pdf)

* <u>Code:</u>
In `/IHTM`

Note
-   
You could try out sparse signal recovery using your mat-form data that consists of variable x (target signal), variable a (the first column of circulant matrix A), and variable y (received signal).

---
If any questions, please email me at yueting_li@berkeley.edu :)
