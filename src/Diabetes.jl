module Diabetes

export Lab, Labs, Medication, Problem
export Metformin, SGLT2i, GLP1ra, DPP4i, TZD, SU, Insulin
export metformin, sglt2i, glp1ra, dpp4i, tzd, su, insulin
export T2D, A1C, ASCVD, CKD, Albuminuria, Hypoglycemia, Weight, Cost, HF, GIade
export t2d, a1c, ascvd, ckd, albuminuria, hypoglycemia, weight, cost, hf, chf, giade
export hast2d, hasprediabetes

const Lab = Pair{Symbol, <:Real}
const Labs = Dict{Symbol, <:Real}

include("medications.jl")
include("problems.jl")

"""
:fpg  => value where value in mg/dL or mmol/L
:pg2h => value where value in mg/dL or mmol/L
:a1c  => value where value in percentage or mmol/mol
"""
function hast2d(l::Lab...)
    labs = Dict(l)
    haskey(labs, :fpg) || haskey(labs, :pg2h) || haskey(labs, :a1c) || error("must provide value for at least one of { :fpg, :pg2h, :a1c }")
    haskey(labs, :fpg) && labs[:fpg] < 30 && return labs[:fpg] ≥ 7.0       # mmol/L
    haskey(labs, :fpg) && return labs[:fpg] ≥ 126                          # mg/dL
    haskey(labs, :pg2h) && labs[:pg2h] < 100 && return labs[:pg2h] ≥ 11.1  # mmol/L
    haskey(labs, :pg2h) && return labs[:pg2h] ≥ 200                        # mg/dL
    haskey(labs, :a1c) && labs[:a1c] < 1 && return labs[:a1c] ≥ 0.065      # %
    haskey(labs, :a1c) && return labs[:a1c] ≥ 48                           # mmol/mol
    return false
end

function hasprediabetes(l::Lab...)
    labs = Dict(l)
    haskey(labs, :fpg) || haskey(labs, :pg2h) || haskey(labs, :a1c) || error("must provide value for at least one of { :fpg, :pg2h, :a1c }")
    haskey(labs, :fpg) && return 5.6 ≤ labs[:fpg] < 7.0 || 100 ≤ labs[:fpg] < 126
    haskey(labs, :pg2h) && return 7.8 ≤ labs[:pg2h] < 11.1 || 140 ≤ labs[:pg2h] < 200
    haskey(labs, :a1c) && return 0.057 ≤ labs[:a1c] < 0.065 || 39 ≤ labs[:a1c] < 48
    return false
end

end
