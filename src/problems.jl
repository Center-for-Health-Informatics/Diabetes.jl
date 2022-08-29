abstract type Problem end

struct T2D <: Problem end          # Type 2 Diabetes
struct A1C <: Problem end          # A1C above individualized target
struct ASCVD <: Problem end        # established or high-risk of atherosclerotic cardiovascular disease
struct CKD <: Problem end          # chronic kidney disease
struct Albuminuria <: Problem end  # presence of albuminuria
struct Hypoglycemia <: Problem end # compelling need to minimize hypoglycemia
struct Weight <: Problem end       # compelling need to minimize weight gain or promote weight loss
struct Cost <: Problem end         # cost is a major issue
struct HF <: Problem end           # heart failure
struct GIade <: Problem end        # gastrointestinal adverse drug event

const t2d = T2D()
const a1c = A1C()
const ascvd = ASCVD()
const ckd = CKD()
const albuminuria = Albuminuria()
const hypoglycemia = Hypoglycemia()
const weight = Weight()
const cost = Cost()
const hf = HF()
const chf = HF()
const giade = GIade()

Base.show(io::IO, x::T2D) = print(io, "t2d")
Base.show(io::IO, x::A1C) = print(io, "a1c")
Base.show(io::IO, x::ASCVD) = print(io, "ascvd")
Base.show(io::IO, x::CKD) = print(io, "ckd")
Base.show(io::IO, x::Albuminuria) = print(io, "albuminuria")
Base.show(io::IO, x::Hypoglycemia) = print(io, "hypoglycemia")
Base.show(io::IO, x::Weight) = print(io, "weight")
Base.show(io::IO, x::Cost) = print(io, "cost")
Base.show(io::IO, x::HF) = print(io, "hf")
Base.show(io::IO, x::GIade) = print(io, "giade")

Base.show(io::IO, ::MIME"text/plain", x::T2D) = print(io, get(io, :compact, false) ? "T2D" : "Type 2 Diabetes")
Base.show(io::IO, ::MIME"text/plain", x::A1C) = print(io, get(io, :compact, false) ? "A1C" : "A1C above individualized target")
Base.show(io::IO, ::MIME"text/plain", x::ASCVD) = print(io, get(io, :compact, false) ? "ASCVD" : "established or high-risk of atherosclerotic cardiovascular disease")
Base.show(io::IO, ::MIME"text/plain", x::CKD) = print(io, get(io, :compact, false) ? "CKD" : "chronic kidney disease")
Base.show(io::IO, ::MIME"text/plain", x::Albuminuria) = print(io, get(io, :compact, false) ? "Albuminuria" : "presence of albuminuria")
Base.show(io::IO, ::MIME"text/plain", x::Hypoglycemia) = print(io, get(io, :compact, false) ? "Hypoglycemia" : "compelling need to minimize hypoglycemia")
Base.show(io::IO, ::MIME"text/plain", x::Weight) = print(io, get(io, :compact, false) ? "Weight" : "compelling need to minimize weight gain or promote weight loss")
Base.show(io::IO, ::MIME"text/plain", x::Cost) = print(io, get(io, :compact, false) ? "Cost" : "cost is a major issue")
Base.show(io::IO, ::MIME"text/plain", x::HF) = print(io, get(io, :compact, false) ? "HF" : "heart failure")
Base.show(io::IO, ::MIME"text/plain", x::GIade) = print(io, get(io, :compact, false) ? "GI\u202FADE" : "gastrointestinal adverse drug event")
