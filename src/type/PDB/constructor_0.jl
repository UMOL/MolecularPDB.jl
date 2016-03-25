"""
Constructor for **PDB** with all keyword arguments.

Arguments
------------
molecular_system=MolecularSystem():MolecularSystem
    a molecular system object
"""
function PDB(;molecular_system::MolecularSystem=MolecularSystem())
    return PDB(molecular_system)
end
