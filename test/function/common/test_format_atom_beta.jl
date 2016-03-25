"""
A test for format_atom_beta().

Arguments
----------
beta:AbstractFloat
    beta
key:AbstractString
    answer key
"""
function test_format_atom_beta(
    beta::AbstractFloat,
    key::AbstractString)

    println("----------------------------------------")
    print_with_color(:blue, "Test format_atom_beta()\n\n")
    
    answer = format_atom_beta(beta)

    @test answer == key

    print_with_color(:green, "\nVERIFIED! format_atom_beta()\n")
    println("----------------------------------------\n\n")

    return true
end

test_format_atom_beta(1., "  1.00")
test_format_atom_beta(1.01, "  1.01")
test_format_atom_beta(1.001, "  1.00")
test_format_atom_beta(100.001, "100.00")
test_format_atom_beta(1234.001, "***.**")