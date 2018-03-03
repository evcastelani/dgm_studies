#We will describe the example given in [Coope]
#using QR factorization
#matrix of center
A=[9.0 9.0 1.0;1.0 2.0 3.0;8.0 6.0 3.0]
#size of A
(m,n)=size(A)
#radius
d=[5.8518,7.0837,8.2641]
function coope(A,d,m,n)
  #shift center of A
  Â=[A[:,1]-A[:,n] A[:,2]-A[:,n]]
  Dec=qrfact(Â)
  Q=Dec[:Q]
  R=Dec[:R]
  c=zeros(n-1)
  for j=1:n-1
    c[j]=0.5*(d[n]^2 -d[j]^2 + norm(R[:,j],2)^2)
  end
  y=zeros(n-1)
  y=R'\c
  z1=sqrt(d[n]^2 -norm(y,2)^2)
  z2=-sqrt(d[n]^2 -norm(y,2)^2)
  #solution 1
  x1=zeros(n)
  x1=Q*[y;z1]+A[:,n]
  x2=zeros(n)
  x2=Q*[y;z2]+A[:,n]
  return x1,x2
end
#testing the quality of solution
function testing_sol(x)
  qlty=zeros(n)
  for k=1:n
    qlty=abs(norm(x-A[:,k],2)^2 - d[k]^2)
  end
  return maximum(qlty)
end
#function for analysis
function analise_error_efect()
  ε1=10.0^(-4)
  ε2=10.0^(-3)
  ε3=10.0^(-4)
  (x1,x2)=coope(A,d+[ε1,ε2,ε3],m,n)
  #d2=[5.0,8.0,8.0]
  #(x1,x2)=coope(A,d2,m,n)
  #(x1,x2)=coope(A,d,m,n)
end
#testing_sol(x1)
#testing_sol(x2)
