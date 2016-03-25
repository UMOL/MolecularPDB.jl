"""
A getter function for objects of type PDB.

Arguments
----------
obj:PDB
    a PDB object 

field:Symbol
    the requested field name
"""
function obtain(obj::PDB, field::Symbol)
    if field in fieldnames(obj)
        return getfield(obj, field)
    else
        @debug print_with_color(:red, "ERROR HINT: obtain() cannot find the requested field \"$(field)\"\n\n")
        return nothing
    end
end    