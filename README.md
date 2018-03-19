# DGP Studies

This repository is devoted just for studies in Distance Geometry  problems.

# Goals

- Implement a simple version of the solution proposed by Coope
to solve intersection of spheres (in Julia Language) *DONE*;
- Implement a simple version to solve intersection of spheres (in Julia Language) using AG *DONE*;
- Implement a simple version of the solution proposed by Coope
to solve intersection of spheres plus least square method (in Julia Language);
- Implement a version of the Coope idea for solving DGP problems in
 dimension 3 (a branch and prune strategy) (in Julia Language) *DONE*;
- Implement a version of the Coope idea for solving DGP problems in
arbitrary dimension (a branch and prune strategy) (in Julia Language);
- Implement a version of AG Branch and prune strategy (in Julia Language) for
solving DGP problems in dimension 3 *DONE*;
- Implement a version of AG Branch and Prune strategy (in Julia Language) for
solving DGP problems in arbitrary dimension.
- Implement a version of Carlile's Branch and Prune strategy (in Julia Language);

# Done

**1. Implement a simple version of the solution proposed by Coope
to solve intersection of spheres (in Julia Language)**

In 03/03/2018, we finished our first goal. In order to test this implementation,
is necessary to install Julia Language (of course) and using _coope_simple.jl_ file.
This file has all functions to make an analysis of error efects in Coope strategy.
In Julia REPL just type ```include("coope_simple.jl")``` and after that ```analise_error_effect()```. You must change parameters in this function if you want to test the sensibility of Coope strategy in the example given in
 *coope_simple.jl*.  All files related to this study is inside of **error_effect folder**.

**2. Implement a simple version to solve intersection of spheres (in Julia Language) using AG**

In 07/03/2018, we finished our first version of intersection of spheres using AG.
This version depends of inversion of multivector which is not supported in
current version of Liga. So, we implement a version using AG but in R^3 (that is, a
particular case). This function is given *intersection__sphere.jl* function. If you
are interested in testing this function you need to type in Julia REPL
```include("ag_simple_without_liga.jl")``` and after that ```analise_error_efect()```. You must change parameters in this function if you want to test the sensibility of AG strategy in the example given in
*ag_simple_without_liga.jl*. All files related to this study is inside of **error_effect folder**.

**3. Implement a version of the Coope idea for solving DGP problems in dimension 3 (a branch and prune strategy) (in Julia Language)**

This goal was achieved in 14/03/2018. Inside of **bp_coope folder** we have several files
related to this implementation. Essentially, you need to go to this folder by Julia REPL
and type ```include("run_bp_coope.jl")```. After that just type ```run_bp_coope(probname)```
where ```probname``` is an artificial instance that you can find in **examples folder**.

**4. Implement a version of AG Branch and prune strategy (in Julia Language) for solving DGP problems in dimension 3**
This goal was achieved in 14/03/2018. Inside of **bp_ag folder** we have several files
related to this implementation. Essentially, you need to go to this folder by Julia REPL
and type ```include("run_bp_ag.jl")```. After that just type ```run_bp_ag(probname)```
where ```probname``` is an artificial instance that you can find in **examples folder**. Note that, until now we can't use Liga for this purpose.

**Note ** In each folder (bp_ag and bp_coope) a file called *dataframe_ag.tsv* or *dataframe_coope.tsv* is provided. These files has our partial results in examples given **examples** folder.  
