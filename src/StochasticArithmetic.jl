module StochasticArithmetic

using Statistics, Cassette

export UP, DWN, RND, SFloat64, SFloat32, value, @reliable_digits

include("EFT.jl")
include("rounding.jl")
include("sfloat.jl")

end # module
