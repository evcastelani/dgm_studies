using Liga
layout(3)


einf=cb(id, true, false, 1.0)
ea123=cb(e123, false, false, 1.0)
eaid=cb(id, true, false, -1.0)
#matrix of center
A=[9.0 9.0 1.0;1.0 2.0 3.0;8.0 6.0 3.0]
#size of A
(m,n)=size(A)
#radius
d=[5.8518,7.0837,8.2641]
S1=conformal(A[:,1])-0.5*(d[1]^2)*einf
S2=conformal(A[:,2])-0.5*(d[2]^2)*einf
S3=conformal(A[:,3])-0.5*(d[3]^2)*einf

X=conformal([3.68949, -0.318224, 10.0747])
S3⋅X
Pp=S1^S2^S3
X⋅Pp
D=dual(Pp)
D.comp

dd=D.comp[2].scl
cd3=D.comp[7].scl
cd2=D.comp[10].scl
cd1=D.comp[11].scl
norma=-(cd1^2+cd2^2+cd3^2)


Δ=D⋅D
typeof(Δ)

parte1=D-(cb(id,false,false,sqrt(Δ.comp[1].scl)))

parte2=-1.0*einf⋅D

?inverse
