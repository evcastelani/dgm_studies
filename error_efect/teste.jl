using Liga
layout(2)
einf=cb(id, true, false, 1.0)
S1=conformal([1.0,1.0])-0.5*(1.0^2)*einf
S2=conformal([2.0,0.0])-0.5*(1.0^2)*einf
Pp=S1^S2
D=dual(Pp)
Δ=D⋅D
parte1=D-(cb(id,false,false,sqrt(Δ.comp[1].scl)))
parte2=-1.0*einf⋅D
