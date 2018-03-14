
function bp_ag(M::Array{Float64,2},D::Array{Float64,2},n::Int64)
#M é a matriz de distancias, D é matriz de distancias adicionais, n o número de pontos a serem determinados
valeps=10.0^(-3) #precisao do método
#xbar=zeros(3) #necessario se quiser calcular LDE
x=zeros(n,3) #armazena a solucao encontrada
#os valores de x[1,:],x[2,:],x[3,:] podem ser, naturalmente, modificados
x[2,:]=[-M[1,2] 0.0 0.0]
costheta=(-M[1,3]^2 +(M[1,2]^2 +M[2,3]^2))/(2.0*M[1,2]*M[2,3]) #auxilia na determinacao dos 3 primeiros pontos
sentheta=sqrt(1.0- costheta^2) #auxilia na determinacao dos 3 primeiros pontos
x[3,:]=[(M[2,3]*costheta -M[1,2]) (M[2,3]*sentheta) 0.0] #terceiro ponto encontrado
r=[M[1,4], M[2,4], M[3,4]] #r sera sempre o vetor dos raios das esferas
(P1,P2)=ag_intersection_sphere(x[1,:],x[2,:],x[3,:],r)  #P1 e P2 sao os pontos de intersecao obtidos pelas esferas
x[4,:]=P1[1:3]' #x[4,:] representa o quarto ponto encontrado
i=5 #nivel inicial
pos=zeros(1,n+1) #posicao na arvore
itmax=1 #salva-guarda iniciada
flag=0 #corresponde a saida do método (se flag==0 o método encontrou solução)
#inicio do processo
while (i<n+1)
   distancia=zeros(1,n) #este vetor é utilizado para realizar o teste de factibilidade
   r=[M[i-3,i], M[i-2,i], M[i-1,i]] #raios atualizados de acordo com o nível que está
   (P1,P2)=ag_intersection_sphere(x[i-3,:],x[i-2,:],x[i-1,:],r) #calcula a intersecao das três esferas obtendo o par de pontos
   if (pos[i]==0) #if1 #fixamos um lado da arvore, digamos lado esquerdo 0 e direito 1
         x[i,:]=P1[1:3] #escolhemos P1
         for k=1:i-4
             if D[k,i]>0.0 #checamos se existem distancias adicionais
                distancia[k]=(norm(x[i,:]-x[k,:])^2-D[k,i]^2)^2 #calculamos a distancia com o ponto que encontramos e os pontos correspondentes da distancia adicional
             end
         end
         if (maximum(distancia)<valeps) #fazemos o teste de factibilidade
            i=i+1
            pos[i]=0 #se aceito, vou para o proximo nível
         else
            pos[i]=1 #senão, exploro outro lado
         end
  else #if1
         x[i,:]=P2[1:3] #o lado direito sempre explora o ponto P2
         for  k=1:i-4
            if (D[k,i]>0.0) #repito a ideia anteior
               distancia[k]=(norm(x[i,:]-x[k,:])^2-D[k,i]^2)^2
            end
        end
        if (maximum(distancia)<valeps) #faço o teste de factibilidade
            i=i+1
            pos[i]=0
        else #caso não passe no teste de factibilidade do lado direito devemos retornar ao menor nível cujo lado esquerdo ainda não foi explorado
            it_int=1
            while ((pos[i-1]==1)&&(i>6))
                pos[i]=0
                x[i,:]=zeros(1,3)
                i=i-1
                it_int=it_int+1
                #salva guarda
                if it_int==n-4
                    flag=1 #infactivel
                    break
                end
           end
           i=i-1
           pos[i]=1
        end
end
itmax=itmax+1
if (itmax==1000000) #salva-guarda
    flag=2 #numero maximo de passos atingindo sem obter solucao
    break
end
end
#termino do processo
return x,flag #retorno das informações principais
end
