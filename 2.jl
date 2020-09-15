using JuMP , GLPK

x1 = [90 110 100 90 75 35 65 100 120 65]
x2 = [6 4 2 3 1 0 1 0 0 1]
x3 = [20 48 12 8 30 0 52 250 3 26]
x4 = [3 4 5 6 7 2 1 9 1 3]
x5 = [5 2 3 4 0 0 1 0 0 3]
x6 = [0 2 2 2 5 3 0 4 0 1]
x7 = [0 0 0 0 270 8 0 12 0 0]
x = [0.18 0.22 0.1 0.12 0.1 0.09 0.4 0.16 0.5 0.07]
#y = [y1 y2 y3 y4 y5 y6 y7 y8 y9 y10]

SR = Model(GLPK.Optimizer)

@variable(SR, y[1:10], lower_bound=0)
#@variable(SR, 0 <= y2)
#@variable(SR, 0 <= y3)
# @variable(SR, 0 <= y4)
# @variable(SR, 0 <= y5)
# @variable(SR, 0 <= y6)
# @variable(SR, 0 <= y7)
# @variable(SR, 0 <= y8)
# @variable(SR, 0 <= y9)
# @variable(SR, 0 <= y10)
@objective(SR, Min, sum(x' .* y))
#0.18x1 + 0.22x2 + 0.1x3 + 0.12x4 + 0.1x5 + 0.09x6 + 0.4x7 + 0.16x8 + 0.5x9 + 0.07x10


@constraint(SR, 420 <= sum(x1' .* y))
@constraint(SR, 5 <= sum(x2' .* y))
@constraint(SR, 400 <= sum(x3' .* y))
@constraint(SR, 20 <= sum(x4' .* y))
@constraint(SR, 12 <= sum(x5' .* y))
@constraint(SR, 20 >= sum(x6' .* y))
@constraint(SR, 30 >= sum(x7' .* y))
#@constraint(SR, 0 <= y[1:10])

println(SR)

optimize!(SR)

println("目标函数值：", objective_value(SR))
println("11：",value.(y))
