"""
A test for format_ATOM()

Arguments
----------
format:Symbol 
    options: [:vmd, :rcsb]

atom:Atom 
    an object of type Atom 

solution:AbstractString
    answer key
"""
function test_format_ATOM(
    format::Symbol,
    atom::Atom,
    solution::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_ATOM()\n\n")

    answer = format_ATOM(format, atom)

    @test answer == solution

    print_with_color(:green, "\nVERIFIED! format_ATOM()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_ATOM(
    :rcsb,
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
        charge=0),
    "ATOM      1  N   PRO A   7      32.551   1.074  73.319  1.00 95.12           N  "
)

test_format_ATOM(
    :vmd,
    Atom(
        index = 1,
        atom_name = " N  ",
        residue_name = "PRO",
        segment_name="ABC",
        chain_name = "A",
        residue_id = 7,
        coordinate = [32.551, 1.074, 73.319],
        occupancy = 1.00,
        beta = 95.12,
        element = "N",
        charge=0),
    "ATOM      1  N   PRO A   7      32.551   1.074  73.319  1.00 95.12      ABC  N"
)