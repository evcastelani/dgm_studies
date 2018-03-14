function coope_intersection_spheres(A,d,m,n)
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
  z1=sqrt((d[n]^2 -norm(y,2)^2)+10.0^(-9))
  z2=-sqrt((d[n]^2 -norm(y,2)^2)+10.0^(-9))
  #z1=z1cx.im
  #z2=z2cx.im
  #solution 1
  x1=zeros(n)
  x1=Q*[y;z1]+A[:,n]
  x2=zeros(n)
  x2=Q*[y;z2]+A[:,n]
  return x1,x2
end
