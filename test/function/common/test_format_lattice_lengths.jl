"""
A test for format_lattice_lengths().

Arguments
----------
obj:CrystalSymmetry
    input object 

solution:AbstractString
    answer key
"""
function test_format_lattice_lengths(obj::CrystalSymmetry, solution::AbstractString)
    println("---------------------------------------")
    print_with_color(:blue, "Test format_lattice_lengths()\n\n")

    answer = format_lattice_lengths(obj)

    @test answer == solution

    print_with_color(:green, "VERIFIED! format_lattice_lengths()\n\n")
    println("---------------------------------------")
    return true
end

test_format_lattice_lengths(
    CrystalSymmetry(lattice="P", symmetries=[(4,1),(2,0),(2,0)],
        lengths=[101.04201, 101.0420, 165.8060],
        angles=[90.0, 90.0, 90.0]),
    "  101.042  101.042  165.806"
)
