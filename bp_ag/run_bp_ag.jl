include("bp_ag.jl")

include("ag_intersection_sphere.jl")

#include("visualizar_solucao.jl")

using MAT #pacote para leitura de arquivos do matlab

function run_bp_ag(probname::String)#probname corresponde ao nome do problema que estamos testando
curr_dir=pwd()
cd("../examples/")
vars=matread(probname)
cd(curr_dir)
M=vars["M"]
corte=5.5 #aqui realizamos o corte de algumas distancias da matriz de distancia
(n,)=size(M)
#a matriz Daux será utilizada para testarmos a solucao obtida
#preparacao para execucao do algoritmo
Daux=zeros(n,n)
ndd=0.0
for i=1:n
    for j=1:n
      if (M[i,j]<corte)
          Daux[i,j]=M[i,j]
          Daux[j,i]=Daux[i,j]
          ndd=ndd+1
      end
   end
end
ndd=(ndd-n)/2.0
D=zeros(n,n)
for i=1:n-4
    for j=i+4:n
      if (M[i,j]<corte)
          D[i,j]=M[i,j]
          D[j,i]=D[i,j]
      end
   end
end
#aqui iniciamos a execucao do algoritmo
@time (x,flag)=bp_ag(M,D,n)
#em sequencia imprimimos as informacoes
if flag==0
    print_with_color(:blue,"\n primeira solucao encontrada... \n")
    print_with_color(:blue,"\n gerando a matriz de distancia da solucao encontrada... \n")
    M_sol=zeros(n,n)
    for i=1:n
        for j=1:n
            M_sol[i,j]=norm(x[i,:]-x[j,:])
        end
    end
println("\n -----------------------------------------------------------------------------------------------------------------\n")
LDE=0.0
for i=1:n
  for j=1:n
    if Daux[i,j]>0.0
       LDE=LDE+abs(M_sol[i,j]-Daux[i,j])/Daux[i,j]
    end
  end
end
#LDE=sum(abs((M_sol[find(M_sol)]-Daux[find(M_sol)])./Daux[find(M_sol)]))
LDE=LDE/ndd
print_with_color(:blue,"\n LDE = $LDE \n")
    println("\n -----------------------------------------------------------------------------------------------------------------\n")
    display(x)
    println("\n -----------------------------------------------------------------------------------------------------------------\n")
    display(M_sol)
    print_with_color(:blue,"\n gerando visualização... \n")
end
if flag==1
    print_with_color(:red,"\n problema possivelmente infactivel \n")
end
if flag==2
    print_with_color(:red,"\n numero maximo de repeticoes alcançado \n")
end
#testando a solução M_sol


#calculo da LDE
#for i=1:n

 #       for j=1:n

  #          Mb(i,j)=norm(x(i,:)-x(j,:))

   #     end

#end
#[rvt cvt]=find(Daux>0);
 #   tam_nn=length(rvt);
  #  for i=1:tam_nn
   # aux(i)=abs(Daux(rvt(i),cvt(i))-Mb(rvt(i),cvt(i)))/abs(Daux(rvt(i),cvt(i)));
   # end
   # LDE=sum(aux);
   # LDE=LDE/ndd;
   # %LDE

 #   fprintf('\n E         =%i', ndd);
 #   fprintf('\n LDE       =%5.12f \n', LDE);
 #   fprintf('\n num_atomos=%i \n',n)
# visualizar_solucao(x,flag) #esta rotina é chamada para visualizar a solucao obtida
end
