include("intersection_sphere.jl")
#matrix of center
A=[9.0 9.0 1.0;1.0 2.0 3.0;8.0 6.0 3.0]
#size of A
(m,n)=size(A)
#radius
d=[5.8518,7.0837,8.2641]

 #x1=zeros(n)
 #x2=zeros(n)
 #x1,x2=intersection_sphere(A[:,1],A[:,2],A[:,3],d)
function testing_sol(x)
  qlty=zeros(n)
  for k=1:n
      qlty=abs(norm(x-A[:,k],2)^2 - d[k]^2)
  end
  return maximum(qlty)
end

function analise_error_efect()
  ε1=10.0^(-4)
  ε2=10.0^(-3)
  ε3=10.0^(-4)
  (x1,x2)=intersection_sphere(A[:,1],A[:,2],A[:,3],d+[ε1,ε2,ε3])
   #d2=[5.0,8.0,8.0]
   #(x1,x2)=coope(A,d2,m,n)
   #(x1,x2)=coope(A,d,m,n)
  println(x1[1:3],x2[1:3])
  println(testing_sol(x1[1:3]))
  println(testing_sol(x2[1:3]))
end

analise_error_efect()
