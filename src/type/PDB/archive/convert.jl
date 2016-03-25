"""
A new method for Julia built-in function ``convert`` that
convert a PdbRecord object to a MolecularSystem object.

Arguments
---------
:Type{MolecularSystem}
    must be ``MolecularSystem``

obj:PdbRecord
    a PdbRecord object 

system:AbstractString
    the name of the new MolecularSystem object
"""
function convert(::Type{MolecularSystem}, obj::PdbRecord; system::AbstractString="")
    atoms_by_segment_dict = find_atoms_by_field(obtain(obj,:atoms), :segment)
    residue_by_segment_dict = Dict(
        map((args)->(args[1], convert_to_residue_array(find_atoms_by_field(args[2], :residue_id); system=args[3])),
            [(k, atoms_by_segment_dict[k], system) for k in keys(atoms_by_segment_dict)]
        )
    )
    return MolecularSystem(name=system,
        segments=convert_to_segment_dict(residue_by_segment_dict; system=system)
    )
end
