
#-----------------------------
using DifferentialEquations
f(u,p,t) = 0.98u
u0 = 1.0
tspan = (0.0,1.0)
prob = ODEProblem(f,u0,tspan)
{% endhighlight %}

#-----------------------------
sol = solve(prob)
{% endhighlight %}

#-----------------------------
using Plots; gr()
plot(sol)
{% endhighlight %}

#-----------------------------
plot(sol,linewidth=5,title="Solution to the linear ODE with a thick line",
     xaxis="Time (t)",yaxis="u(t) (in μm)",label="My Thick Line!") # legend=false
{% endhighlight %}

#-----------------------------
plot!(sol.t, t->1.0*exp(0.98t),lw=3,ls=:dash,label="True Solution!")
{% endhighlight %}

#-----------------------------
sol.t
{% endhighlight %}

#-----------------------------
sol.u
{% endhighlight %}

#-----------------------------
[t+u for (u,t) in tuples(sol)]
{% endhighlight %}

#-----------------------------
sol
{% endhighlight %}

#-----------------------------
sol(0.45)
{% endhighlight %}

#-----------------------------
sol = solve(prob,abstol=1e-8,reltol=1e-8)
{% endhighlight %}

#-----------------------------
plot(sol)
plot!(sol.t, t->1.0*exp(0.98t),lw=3,ls=:dash,label="True Solution!")
{% endhighlight %}

#-----------------------------
sol = solve(prob,saveat=0.1)
{% endhighlight %}

#-----------------------------
sol = solve(prob,saveat=[0.2,0.7,0.9])
{% endhighlight %}

#-----------------------------
sol = solve(prob,saveat=[0.2,0.7,0.9],save_start = false, save_end = false)
{% endhighlight %}

#-----------------------------
sol = solve(prob,dense=false)
{% endhighlight %}

#-----------------------------
sol = solve(prob,save_everystep=false)
{% endhighlight %}

#-----------------------------
sol = solve(prob,alg_hints=[:stiff])
{% endhighlight %}

#-----------------------------
sol = solve(prob,Tsit5(),reltol=1e-6)
{% endhighlight %}

#-----------------------------
function lorenz!(du,u,p,t)
    σ,ρ,β = p
    du[1] = σ*(u[2]-u[1])
    du[2] = u[1]*(ρ-u[3]) - u[2]
    du[3] = u[1]*u[2] - β*u[3]    
end
{% endhighlight %}

#-----------------------------
u0 = [1.0,0.0,0.0]
{% endhighlight %}

#-----------------------------
p = (10,28,8/3) # we could also make this an array, or any other type!
{% endhighlight %}

#-----------------------------
tspan = (0.0,100.0)
prob = ODEProblem(lorenz!,u0,tspan,p)
{% endhighlight %}

#-----------------------------
sol = solve(prob)
{% endhighlight %}

#-----------------------------
sol.t[10],sol[10]
{% endhighlight %}

#-----------------------------
sol[2,10]
{% endhighlight %}

#-----------------------------
A = convert(Array,sol)
{% endhighlight %}

#-----------------------------
plot(sol)
{% endhighlight %}

#-----------------------------
plot(sol,vars=(1,2,3))
{% endhighlight %}

#-----------------------------
plot(sol,vars=(1,2,3),denseplot=false)
{% endhighlight %}

#-----------------------------
plot(sol,vars=(0,2))
{% endhighlight %}

#-----------------------------
function lotka_volterra!(du,u,p,t)
  du[1] = p[1]*u[1] - p[2]*u[1]*u[2]
  du[2] = -p[3]*u[2] + p[4]*u[1]*u[2]
end
{% endhighlight %}

#-----------------------------
lv! = @ode_def LotkaVolterra begin
  dx = a*x - b*x*y
  dy = -c*y + d*x*y
end a b c d
{% endhighlight %}

#-----------------------------
u0 = [1.0,1.0]
p = (1.5,1.0,3.0,1.0)
tspan = (0.0,10.0)
prob = ODEProblem(lv!,u0,tspan,p)
sol = solve(prob)
plot(sol)
{% endhighlight %}

#-----------------------------
lv!.Jex
{% endhighlight %}

#-----------------------------
A  = [1. 0  0 -5
      4 -2  4 -3
     -4  0  0  1
      5 -2  2  3]
u0 = rand(4,2)
tspan = (0.0,1.0)
f(u,p,t) = A*u
prob = ODEProblem(f,u0,tspan)
sol = solve(prob)
{% endhighlight %}

#-----------------------------
sol[3]
{% endhighlight %}

#-----------------------------
big_u0 = big.(u0)
{% endhighlight %}

#-----------------------------
prob = ODEProblem(f,big_u0,tspan)
sol = solve(prob)
{% endhighlight %}

#-----------------------------
sol[1,3]
{% endhighlight %}

#-----------------------------
prob = ODEProblem(f,big_u0,big.(tspan))
sol = solve(prob)
{% endhighlight %}

#-----------------------------
using StaticArrays
A  = @SMatrix [ 1.0  0.0 0.0 -5.0
                4.0 -2.0 4.0 -3.0
               -4.0  0.0 0.0  1.0
                5.0 -2.0 2.0  3.0]
u0 = @SMatrix rand(4,2)
tspan = (0.0,1.0)
f(u,p,t) = A*u
prob = ODEProblem(f,u0,tspan)
sol = solve(prob)
{% endhighlight %}

#-----------------------------
sol[3]
{% endhighlight %}
