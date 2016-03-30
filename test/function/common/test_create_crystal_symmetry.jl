"""
A test for create_crystal_symmetry().

Arguments
-----------
pdb_file:AbstractString
    full path to the input PDB file

solution:CrystalSymmetry
    answer key

msg="":AbstractString
    optional test message
"""
function test_create_crystal_symmetry(pdb_file::AbstractString, solution::CrystalSymmetry, msg::AbstractString="")
    println("--------------------------------")
    print_with_color(:blue, "Test create_crystal_symmetry()\n\n")
    if msg != ""
        print_with_color(:blue, "$(msg)\n\n")
    end

    answer = create_crystal_symmetry(pdb_file)

    @test answer == solution

    print_with_color(:green, "VERIFIED! create_crystal_symmetry()\n\n")
    println("--------------------------------")
    return true
end

test_create_crystal_symmetry(
    joinpath(TestParams.data_dir(),"RCSB","1_line_RCSB.pdb"),
    CrystalSymmetry(lattice="P", symmetries=[(4,1),(2,0),(2,0)],
        lengths=[101.042, 101.042, 165.806],
        angles=[90.0, 90.0, 90.0],
        chain_count=16),
    "RCSB",
)

test_create_crystal_symmetry(
    joinpath(TestParams.data_dir(),"VMD","1_line_VMD.pdb"),
    CrystalSymmetry(lattice="P", symmetries=[(1,0),(0,0),(0,0)],
        lengths=[101.042, 101.042, 165.806],
        angles=[90.0, 90.0, 90.0],
        chain_count=1),
    "VMD",
)

