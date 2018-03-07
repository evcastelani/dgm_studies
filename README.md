# DGP Studies

This repository is devoted just for studies in Distance Geometry  problems.

# Goals

- Implement a simple version of the solution proposed by Coope
to solve intersection of spheres (in Julia Language);
- Implement a simple version to solve intersection of spheres (in Julia Language) using AG;
- Implement a simple version of the solution proposed by Coope
to solve intersection of spheres plus least square method (in Julia Language);
- Implement a version of the Coope idea for solving DGP problems in
arbitrary dimension (a branch and prune strategy) (in Julia Language);
- Implement a version of Carlile Branch and prune strategy (in Julia Language);
- Implement a version of AG branch and prune strategy (in Julia Language).

# Done

**1. Implement a simple version of the solution proposed by Coope
to solve intersection of spheres (in Julia Language);**

In 03/03/2018, we finished our first goal. In order to test this implementation,
is necessary to install Julia Language (of course) and using _coope_simple.jl_ file. This file has all functions to make an analysis of error efects in Coope strategy. In Julia REPL just type ```include("coope_simple.jl")``` and after that ```analise_error_efect()```. You must change parameters in this function if you want to test the sensibility of Coope strategy in the example given in
 _coope_simple.jl_.  

**2. Implement a simple version to solve intersection of spheres (in Julia Language) using AG**

In 07/03/2018, we finished our first version of intersection of spheres using AG.
This version depends of inversion of multivector which is not supported in
current version of Liga. So, we implement a version using AG but in R^3 (that is, a
particular case). This function is given _intersection_sphere.jl_ function. If you
are interested in testing this function you need to type in Julia REPL
```include("ag_simple_without_liga.jl")``` and after that ```analise_error_efect()```.
You must change parameters in this function if you want to test the sensibility
of Coope strategy in the example given in _ag_simple_without_liga.jl_ .
