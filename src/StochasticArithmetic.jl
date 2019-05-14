module StochasticArithmetic

using Statistics, Cassette

export @reliable_digits

include("EFT.jl")
include("rounding.jl")
include("sfloat.jl")

end # module
