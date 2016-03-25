"""
A test for read(RCSB, ...)

Arguments
----------
file_name:AbstractString
    File name of the input RCSB PDB file

system:AbstractString
    name of the output molecular system

solution:PDB
    answer key
"""
function test_read_RCSB(file_name, system, solution::PDB)
    
    println("----------------------------------------")
    print_with_color(:blue, "Test read(RCSB,...)\n\n")

    answer = read(RCSB, file_name, system)

    for field in fieldnames(solution)
        @test getfield(answer, field) == getfield(solution, field)
    end

    print_with_color(:green, "\nVERIFIED! read(RCSB,...)\n\n")
    println("----------------------------------------")
    
    return true
end


test_read_RCSB(
    joinpath(TestParams.data_dir(), "RCSB", "1_line_RCSB.pdb"),
    "SYS1",
    PDB(molecular_system=MolecularSystem([
        Atom(system_name="SYS1",
            index = 1,
            atom_name = " N  ",
            residue_name = "PRO",
            chain_name = "A",
            residue_id = 7,
            coordinate = [32.551, 1.074, 73.319],
            occupancy = 1.00,
            beta = 95.12,
            element = "N")
        ];
        crystal_symmetry=CrystalSymmetry(lattice="P", symmetries=[(4,1),(2,0),(2,0)],
        lengths=[101.042, 101.042, 165.806],
        angles=[90.0, 90.0, 90.0],
        chain_count=16)
        )
    )
)
    