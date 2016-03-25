"""
A test for format_lattice_chain_count().

Arguments
----------
chain_count:Integer
    chain count in a unit cell 

format:Symbol
    format of the PDB file

solution:AbstractString
    answer key
"""
function test_format_lattice_chain_count(chain_count::Integer, format::Symbol, solution::AbstractString)
    println("---------------------------------------")
    print_with_color(:blue, "Test format_lattice_chain_count()\n\n")

    answer = format_lattice_chain_count(chain_count, format)

    @test answer == solution

    print_with_color(:green, "VERIFIED! format_lattice_chain_count()\n\n")
    println("---------------------------------------")
    return true
end

test_format_lattice_chain_count(1,:vmd, "   1")
test_format_lattice_chain_count(1,:rcsb,"   1          ")
test_format_lattice_chain_count(1,:unsupported,"1")
