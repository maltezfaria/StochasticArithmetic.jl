Cassette.@context SFloatCtx
Cassette.overdub(::SFloatCtx, ::typeof(+), a::AbstractFloat,b::AbstractFloat) = +(RND,a,b)
Cassette.overdub(::SFloatCtx, ::typeof(-), a::AbstractFloat,b::AbstractFloat) = -(RND,a,b)
Cassette.overdub(::SFloatCtx, ::typeof(*), a::AbstractFloat,b::AbstractFloat) = *(RND,a,b)
Cassette.overdub(::SFloatCtx, ::typeof(/), a::AbstractFloat,b::AbstractFloat) = /(RND,a,b)
const SFLOATCTX = Cassette.disablehooks(SFloatCtx())

macro reliable_digits(expr,niter=10)
    return quote
        vals  = [Cassette.overdub(SFLOATCTX,()->$(esc(expr))) for _=1:$(esc(niter))]
        mu    = mean(vals)
        sigma = std(vals)
        s     = @. -log10(sigma/abs(mu))
        (mu,s)
    end
end
