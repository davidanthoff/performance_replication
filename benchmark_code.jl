using DataFrames, Query, BenchmarkTools

df = DataFrame(a=rand(100_000), b=rand(100_000))

function foo(data)
    return data |> @filter(_.a>0.5) |> @map({A=_.a, B=_.b}) |> DataFrame
end

@benchmark foo($df)
