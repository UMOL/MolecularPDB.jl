"""
A test for parse_ATOM()

Arguments
==========
format:Symbol
    format of the PDB file 

line:AbstractString
    A string that represent one line of ATOM record from a RCSB PDB file.

solution:Atom 
    answer key
"""
function test_parse_ATOM(format::Symbol,line::AbstractString, solution::Atom)

    println("----------------------------------------")
    print_with_color(:blue, "Test parse_ATOM()\n\n")

    answer = parse_ATOM(format, 1, line)

    @test answer == solution

    print_with_color(:green, "\nVERIFIED! parse_ATOM()\n")
    println("----------------------------------------\n\n")

    return true
end


test_parse_ATOM(:rcsb,
    "ATOM      1  N   PRO A   7      32.551   1.074  73.319  1.00 95.12           N  ",
    Atom(
    index = 1,
    atom_name = " N  ",
    residue_name = "PRO",
    chain_name = "A",
    residue_id = 7,
    coordinate = [32.551, 1.074, 73.319],
    occupancy = 1.00,
    beta = 95.12,
    element = "N")
)

test_parse_ATOM(:vmd,
    "ATOM      1  N   PRO A   7      32.551   1.074  73.319  1.00 95.12      ABC  N",
   Atom(
        index = 1,
        atom_name = " N  ",
        residue_name = "PRO",
        chain_name = "A",
        residue_id = 7,
        coordinate = [32.551, 1.074, 73.319],
        occupancy = 1.00,
        beta = 95.12,
        element = "N",
        segment_name="ABC")
)
