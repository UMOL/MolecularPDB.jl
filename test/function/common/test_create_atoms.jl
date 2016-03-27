"""
A test for create_atoms()

Arguments
----------
format:Symbol
    format of the input PDB file 

file_name:AbstractString
    File name of the input RCSB PDB file.

solution:Array{Atom,1}    
    answer key
"""
function test_create_atoms(format::Symbol, file_name::AbstractString, solution::Array)

    println("----------------------------------------")
    print_with_color(:blue, "Test create_atoms()\n\n")

    answer = create_atoms(format, file_name)

    @test answer == solution
    
    print_with_color(:green, "\nVERIFIED! create_atoms()\n")
    println("----------------------------------------")

    return true
end

test_create_atoms(:rcsb,
    joinpath(TestParams.data_dir(), "RCSB", "1_line_RCSB.pdb"),
    [Atom(
        index = 1,
        atom_name = " N  ",
        residue_name = "PRO",
        chain_name = "A",
        residue_id = 7,
        coordinate = [32.551, 1.074, 73.319],
        occupancy = 1.00,
        beta = 95.12,
        element = "N")]
)

test_create_atoms(:vmd,
    joinpath(TestParams.data_dir(), "VMD", "1_line_VMD.pdb"),
    [Atom(
        index = 1,
        atom_name = " N  ",
        residue_name = "PRO",
        chain_name = "A",
        residue_id = 7,
        coordinate = [32.551, 1.074, 73.319],
        occupancy = 1.00,
        beta = 95.12,
        element = "N",
        segment_name="ABCD")
    ]
)