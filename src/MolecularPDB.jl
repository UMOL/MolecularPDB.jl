"""
Module ``MolecularPDB`` provides a reader and writer for processing many flavored 
PDB data file. The following flavors are supported:

* RCSB
* VMD 

Exported:

* PdbRecord

Usage::

    import MolecularPDB.read 
    import MolecularPDB.save
    import MolecularPDB.obtain
    import MolecularPDB.convert

"""
module MolecularPDB

macro debug(expression)
    return :($expression)
    # return nothing
end

export RCSB, VMD, PDB
export read, save

import SimpleMolecule
import SimpleMolecule: Atom, Molecule

include(joinpath("type","all.jl"))
include(joinpath("function", "all.jl"))
end 