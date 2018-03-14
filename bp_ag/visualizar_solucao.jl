using PlotlyJS

function visualizar_solucao(sol,flag)
     
    if flag==0

    (n,) =size(sol) 

    trace1 = scatter3d(;x=sol[:,1],y=sol[:,2], z=sol[:,3], mode="lines",
                        marker=attr(color="#1f77b4", size=12, symbol="circle",
                                    line=attr(color="rgb(0,0,0)", width=0)),
                        line=attr(color="#1f77b4", width=3))
                        
    layout = Layout(autosize=false, width=500, height=500,margin=attr(l=0, r=0, b=0, t=65))
    
    plot([trace1], layout)
    
    end
    
end
