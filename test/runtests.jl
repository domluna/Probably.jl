using Probably
using Base.Test
using Probably: probabilities

@testset "Probably" begin

a = QBool()
@test probabilities(a.bit.state, 1) ≈ [1,0]
hadamard(a)
@test probabilities(a.bit.state, 1) ≈ [0.5,0.5]

b = QBool(false)
cnot(a, b)
@test probabilities(a.bit.state, 1, 2) ≈ [0.5,0,0,0.5]
cnot(a, b)
@test probabilities(a.bit.state, 1, 2) ≈ [0.5,0,0.5,0]

a = QBool(true)
@test probabilities(a.bit.state, 1) ≈ [0,1]
@test measure(a) == true

end
