using Base.Test

include(joinpath("..", "src", "MolecularPDB.jl"))
using MolecularPDB
import MolecularPDB.get_records
import MolecularPDB.format_atom_index
import MolecularPDB.format_atom_name
import MolecularPDB.format_atom_coordinate
import MolecularPDB.format_atom_occupancy
import MolecularPDB.format_atom_beta
import MolecularPDB.format_atom_charge
import MolecularPDB.format_atom_element
import MolecularPDB.format_residue_id
import MolecularPDB.format_residue_name
import MolecularPDB.format_segment_name
import MolecularPDB.parse_ATOM
import MolecularPDB.format_ATOM
import MolecularPDB.convert
import MolecularPDB.read 
import MolecularPDB.save
import MolecularPDB.obtain
import MolecularPDB.parse_CRYST1
import MolecularPDB.CrystalSymmetry
import MolecularPDB.parse_symmetry
import MolecularPDB.create_atoms
import MolecularPDB.create_crystal_symmetry
import MolecularPDB.format_lattice_space_group
import MolecularPDB.format_lattice_lengths
import MolecularPDB.format_lattice_angles
import MolecularPDB.format_lattice_chain_count
import MolecularPDB.format_CRYST1

import MolecularDataType: MolecularSystem, Segment, Residue, Atom
include("params.jl")

include(joinpath("..","..","JuliaTestKit","src","JuliaTestKit.jl"))
using JuliaTestKit

include(joinpath("type","PDB","runtests.jl"))

include(joinpath("function","common","runtests.jl"))
include(joinpath("function","RCSB", "runtests.jl"))
include(joinpath("function", "VMD", "runtests.jl"))
