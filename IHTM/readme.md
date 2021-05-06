
## Steps of trying out signal  recovery
---
### (1) Run **preprocess.m**
> Command  >> *preprocess('data_noisefree.mat')*
> 
> or >> *preprocess('data_noisy.mat')*
> 
- This function saves large matrices that would be used in Iterative Hard-thresholding M-sparse(IHTM) algorithm in step (2).


- Note: C stands for the circulant matrix $C$(by circshift of $\vec c$), CC stands for matrix $C^HC$, CTX stands for matrix $C^H\vec x$.

---
### (2) Run **random_initialization.m**
> Command  >> *random_initialization*
> 
- **random_initialization.m** randomly initializes signal $\vec x$ and calls function **IHTM** for total_iter times. 

- Pls set parameters sparsity *k*, inverse step-size *L*, total iteration times *total_iter* properly before running (code %%Main Para Setting). 
*k*=6, *L*=10, *total_iter*=hundreds(100,200...) are suggested.
---
### Warm Note
- File */good result*. They are current good results. **sparsity_6.mat** is the result of **data_noisefree.mat**, the approximation residual norm is 2.47(15.6% error from target signal $\vec r$ norm). **noisy_sparsity_6.mat** is the result of **data_noisy.mat**, the approximation residual norm is 5.47(33.2% error from target signal $\vec r$ norm). You may directly set y0 in **IHTM.m** to y0 values in the mat file. and run **random_initialization.m** with *total_iter*=1.
- Trails needed. Results varies with different initial points. You may need to repeat step (2) multiple times to get small residuals. 
  
- Save time. Step (2) would take a long time. You may read and use **mail2me.m** function(which is annotated in the end of **random_initialization.m**) for a email notice. Also, after loading *C, CC, CTX mat*  once, annotating their load lines in **random_initialization.m** saves time.
  
- Reference. We apply **IHTM** mainly refers paper [Iterative Thresholding for Sparse Approximations](https://link.springer.com/article/10.1007/s00041-008-9035-z) Section 3(Algorithm 1), with adjustments to gradient stepsize and initial points. In the code variables are named the same way as the above linked paper.
  