"""
A test for format_lattice_angles().

Arguments
----------
obj:CrystalSymmetry
    input object 

solution:AbstractString
    answer key
"""
function test_format_lattice_angles(obj::CrystalSymmetry, solution::AbstractString)
    println("---------------------------------------")
    print_with_color(:blue, "Test format_lattice_angles()\n\n")

    answer = format_lattice_angles(obj)

    @test answer == solution

    print_with_color(:green, "VERIFIED! format_lattice_angles()\n\n")
    println("---------------------------------------")
    return true
end

test_format_lattice_angles(
    CrystalSymmetry(lattice="P", symmetries=[(4,1),(2,0),(2,0)],
        angles=[101.042, 101.042, 165.806],
        angles=[90.001, 90.0002, 90.0003]),
    "  90.00  90.00  90.00"
)
