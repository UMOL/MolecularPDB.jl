"""
A test for parse_CRYST1().

Arguments
-----------
line:AbstractString
    a line containing the CRYST1 record

solution:CrystalSymmetry
    answer key
"""
function test_parse_CRYST1(line::AbstractString, solution::CrystalSymmetry)
    println("--------------------------------")
    print_with_color(:blue, "Test parse_CRYST1()\n\n")

    answer = parse_CRYST1(line)

    @test answer == solution

    print_with_color(:green, "VERIFIED! parse_CRYST1()\n\n")
    println("--------------------------------")
    return true
end

test_parse_CRYST1(
    "CRYST1  101.042  101.042  165.806  90.00  90.00  90.00 P 1           1",
    CrystalSymmetry(lattice="P", symmetries=[(1,0),(0,0),(0,0)],
        lengths=[101.042, 101.042, 165.806],
        angles=[90.0, 90.0, 90.0],
        chain_count=1
    )
)

test_parse_CRYST1(
    "CRYST1  101.042  101.042  165.806  90.00  90.00  90.00 P 41 2 2     16 ",
    CrystalSymmetry(lattice="P", symmetries=[(4,1), (2,0), (2,0)],
        lengths=[101.042, 101.042, 165.806],
        angles=[90.0, 90.0, 90.0],
        chain_count=16
    )
)