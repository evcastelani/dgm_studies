#function intersection_sphere(x::Array{Float64,1},y::Array{Float64,1},z::Array{Float64,1},r::Array{Float64,1})
#this function works just with R^3 points
function intersection_sphere(x,y,z,r)
    a=zeros(3)
    b=zeros(3)
    c=zeros(3)
    ad=zeros(3)
    bd=zeros(3)
    cd=zeros(3)
    aux=zeros(5)
    P1=zeros(5)
    P2=zeros(5)
    xb=x[1]^2+x[2]^2+x[3]^2;
    yb=y[1]^2+y[2]^2+y[3]^2;
    zb=z[1]^2+z[2]^2+z[3]^2;
    a[1]=0.5*((x[2]*y[3]-x[3]*y[2])*(zb-r[3]^2) +(x[3]*z[2]-x[2]*z[3])*(yb-r[2]^2)+(y[2]*z[3]-y[3]*z[2])*(xb-r[1]^2));
    a[2]=0.5*((x[3]*y[1]-x[1]*y[3])*(zb-r[3]^2) +(x[1]*z[3]-x[3]*z[1])*(yb-r[2]^2)+(y[3]*z[1]-y[1]*z[3])*(xb-r[1]^2));
    a[3]=0.5*((x[1]*y[2]-x[2]*y[1])*(zb-r[3]^2) +(x[2]*z[1]-x[1]*z[2])*(yb-r[2]^2)+(y[1]*z[2]-y[2]*z[1])*(xb-r[1]^2));
    b[1]=(x[2]*y[3])-(x[2]*z[3])-(x[3]*y[2])+(x[3]*z[2])+(y[2]*z[3])-(y[3]*z[2]);
    b[2]=(x[3]*y[1])-(x[3]*z[1])-(x[1]*y[3])+(x[1]*z[3])+(y[3]*z[1])-(y[1]*z[3]);
    b[3]=(x[1]*y[2])-(x[1]*z[2])-(x[2]*y[1])+(x[2]*z[1])+(y[1]*z[2])-(y[2]*z[1]);
    c[1]=0.5*((x[1]-z[1])*(yb-r[2]^2)-(x[1]-y[1])*(zb-r[3]^2)-(y[1]-z[1])*(xb-r[1]^2));
    c[2]=0.5*((x[2]-z[2])*(yb-r[2]^2)-(x[2]-y[2])*(zb-r[3]^2)-(y[2]-z[2])*(xb-r[1]^2));
    c[3]=0.5*((x[3]-z[3])*(yb-r[2]^2)-(x[3]-y[3])*(zb-r[3]^2)-(y[3]-z[3])*(xb-r[1]^2));
    d=(x[1]*y[2]*z[3])-(x[1]*y[3]*z[2])-(x[2]*y[1]*z[3])+(x[2]*y[3]*z[1])+(x[3]*y[1]*z[2])-(x[3]*y[2]*z[1]);
    #programming the dual
    ad[1]=-c[1];
    ad[2]=-c[2];
    ad[3]=-c[3];
    bd[1]=-a[1];
    bd[2]=-a[2];
    bd[3]=-a[3];
    cd[1]=b[1];
    cd[2]=b[2];
    cd[3]=b[3];
    dd=d;
    #compute PP dual ^2 =qpp
    qpp=-(ad[1]^2)-(ad[2]^2)-(ad[3]^2)+ 2.0*bd[1]*cd[1]+2.0*bd[2]*cd[2]+2.0*bd[3]*cd[3]+dd^2;
    #in order to compute e_inf*PP dual we considerer only the 4 last components
    #of PP dual, that is, we consider the vector (cd(1),cd(2),cd(2),dd)
    #now we need to compute the inverse of e_inf*PP dual;
    norma=-(cd[1]^2 +cd[2]^2 +cd[3]^2);
    c[1]=cd[1]/norma;
    c[2]=cd[2]/norma;
    c[3]=cd[3]/norma;
    d=dd/norma;
    qppaux=sqrt(complex(qpp));
    qpp=qppaux.im
    qpp2=-qpp;
    #[c(1) c(2) c(3) d 0]
    P1=qpp*[c[1]; c[2]; c[3]; d; 0.0];
    P2=(qpp2)*[c[1]; c[2]; c[3]; d; 0.0];
    aux[1]=(-ad[2]*c[3]-cd[1]*d +ad[3]*c[2]);
    aux[2]=(ad[1]*c[3] -ad[3]*c[1] -cd[2]*d);
    aux[3]=(-ad[1]*c[2] +ad[2]*c[1] -cd[3]*d);
    aux[4]=(-bd[1]*c[1]-bd[2]*c[2]-bd[3]*c[3]-d*dd);
    aux[5]=(-cd[1]*c[1]-cd[2]*c[2]- cd[3]*c[3]);
    P1=P1+aux;
    P2=P2+aux;
    return P1,P2
end
