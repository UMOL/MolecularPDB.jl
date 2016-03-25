"""
A test for format_lattice_space_group().

Arguments
----------
obj:CrystalSymmetry
    input object 

solution:AbstractString
    answer key
"""
function test_format_lattice_space_group(obj::CrystalSymmetry, solution::AbstractString)
    println("---------------------------------------")
    print_with_color(:blue, "Test format_lattice_space_group()\n\n")

    answer = format_lattice_space_group(obj)

    @test answer == solution

    print_with_color(:green, "VERIFIED! format_lattice_space_group()\n\n")
    println("---------------------------------------")
    return true
end

test_format_lattice_space_group(
    CrystalSymmetry(lattice="P", symmetries=[(4,1),(2,0),(2,0)],
        lengths=[101.042, 101.042, 165.806],
        angles=[90.0, 90.0, 90.0]),
    "P 41 2 2   "
)
test_format_lattice_space_group(
    CrystalSymmetry(lattice="P", symmetries=[(1,0),(0,0),(0,0)],
        lengths=[101.042, 101.042, 165.806],
        angles=[90.0, 90.0, 90.0]),
    "P 1        "
)