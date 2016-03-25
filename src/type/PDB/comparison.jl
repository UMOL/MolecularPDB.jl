import Base.==

"""
Define the behavior of "==" for data type PDB.

Arguments
---------
obj1:PDB
    An instance of PDB

obj2:PDB
    Another instance of PDB
"""
function ==(obj1::PDB, obj2::PDB)
    for field in fieldnames(obj1)
        if getfield(obj1,field) != getfield(obj2,field)
            return false
        end
    end
    return true
end
