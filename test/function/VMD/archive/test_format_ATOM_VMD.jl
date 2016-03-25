"""
A test for format_ATOM_VMD()

Arguments
----------
atom:Atom 
    an object of type Atom 

key:AbstractString
    answer key
"""
function test_format_ATOM_VMD(
    atom::Atom,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_ATOM_VMD()\n\n")

    answer = format_ATOM_VMD(atom)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_ATOM_VMD()\n")
    println("----------------------------------------\n\n")

    return true
end


test_format_ATOM_VMD(
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
        segment_name="ABCD"),
    "ATOM      1  N   PRO A   7      32.551   1.074  73.319  1.00 95.12      ABCD N",
)