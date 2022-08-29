abstract type Medication end

struct Metformin <: Medication end
struct SGLT2i <: Medication end    # sodium-glucose cotransporter 2 inhibitors
struct GLP1ra <: Medication end    # glucagon-like peptide 1 receptor agonists
struct DPP4i <: Medication end     # dipeptidyl peptidase 4 inhibitors
struct TZD <: Medication end       # thiazolidinediones
struct SU <: Medication end        # sulfonylureas
struct Insulin <: Medication end

const metformin = Metformin()
const sglt2i = SGLT2i()
const glp1ra = GLP1ra()
const dpp4i = DPP4i()
const tzd = TZD()
const su = SU()
const insulin = Insulin()

Base.show(io::IO, x::Metformin) = print(io, "metformin")
Base.show(io::IO, x::SGLT2i) = print(io, "sglt2i")
Base.show(io::IO, x::GLP1ra) = print(io, "glp1ra")
Base.show(io::IO, x::DPP4i) = print(io, "dpp4i")
Base.show(io::IO, x::TZD) = print(io, "tzd")
Base.show(io::IO, x::SU) = print(io, "su")
Base.show(io::IO, x::Insulin) = print(io, "insulin")

Base.show(io::IO, ::MIME"text/plain", x::Metformin) = print(io, "Metformin")
Base.show(io::IO, ::MIME"text/plain", x::SGLT2i) = print(io, get(io, :compact, false) ? "SGLT2i" : "Sodium-Glucose Cotransporter 2 Inhibitor")
Base.show(io::IO, ::MIME"text/plain", x::GLP1ra) = print(io, get(io, :compact, false) ? "GLP-1\u202FRA" : "Glucagon-like Peptide 1 Receptor Agonist")
Base.show(io::IO, ::MIME"text/plain", x::DPP4i) = print(io, get(io, :compact, false) ? "DPP-4i" : "Dipeptidyl Peptidase 4 Inhibitor")
Base.show(io::IO, ::MIME"text/plain", x::TZD) = print(io, get(io, :compact, false) ? "TZD" : "Thiazolidinedione")
Base.show(io::IO, ::MIME"text/plain", x::SU) = print(io, get(io, :compact, false) ? "SU" : "Sulfonylurea")
Base.show(io::IO, ::MIME"text/plain", x::Insulin) = print(io, "Insulin")
