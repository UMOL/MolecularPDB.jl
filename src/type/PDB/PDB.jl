"""
**PDB** is an immutable data type that contains all the information stored
in a PDB file. It has the following fields that can be requested using
``obtain(obj,:field)``, where ``obj`` is an object of type PDB 
and ``:field`` is the requested field name (Symbol).

+--------------------+---------------------+-----------------------------------------+
| field              | type                | note                                    |
+====================+=====================+=========================================|
|:molecular_system   | MolecularSystem     | a ``MolecularSystem`` object            |
+--------------------+---------------------+-----------------------------------------+
"""
immutable PDB
    molecular_system::MolecularSystem
end 


# constructor with keyword arguments
include("constructor_0.jl")

# define "==" for type PDB
include("comparison.jl")

# getter
include("obtain.jl")

