"""
A test for format_CRYST1()
Argument
--------------
obj:CrystalSymmetry
    input object

format:Symbol
    format of the PDB output

solution:AbstractString
    answer key
"""
function test_format_CRYST1(obj::CrystalSymmetry, format::Symbol, solution::AbstractString)
    println("---------------------------------------")
    print_with_color(:blue, "Test format_CRYST1()\n\n")

    answer = format_CRYST1(obj, format)

    @test answer == solution

    print_with_color(:green, "VERIFIED! format_CRYST1()\n\n")
    println("---------------------------------------")
    return true
end

test_format_CRYST1(
    CrystalSymmetry(lattice="P", symmetries=[(4,1),(2,0),(2,0)],
        lengths=[101.04201, 101.0420, 165.8060],
        angles=[90.0, 90.0, 90.0],
        chain_count=16),
    :rcsb,
    "CRYST1  101.042  101.042  165.806  90.00  90.00  90.00 P 41 2 2     16          "
)

test_format_CRYST1(
    CrystalSymmetry(lattice="P", symmetries=[(1,0),(0,0),(0,0)],
        lengths=[101.04201, 101.0420, 165.8060],
        angles=[90.0, 90.0, 90.0],
        chain_count=1),
    :vmd,
    "CRYST1  101.042  101.042  165.806  90.00  90.00  90.00 P 1           1",
)
