# test VMD flavored PDB file reader
include("test_parse_ATOM_VMD.jl")
include("test_get_atoms_VMD.jl")
include("test_read_VMD.jl")

# test VMD flavored PDB file writer
include("test_format_ATOM_VMD.jl")
include("test_save_VMD.jl")