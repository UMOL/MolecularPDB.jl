"""
A test for parse_symmetry().

Arguments
------------
str:AbstractString  
    a string representation of the crystal symmetry 

solution:Tuple{Integer, Integer}
    answer key
"""
function test_parse_symmetry(str::AbstractString, solution::Tuple{Integer, Integer})
    println("-------------------------------------")
    print_with_color(:blue, "Test parse_symmetry()\n\n")

    answer = parse_symmetry(str)

    @test answer == solution

    print_with_color(:green, "VERIFIED! parse_symmetry()\n\n")
    println("-------------------------------------")

    return true
end

test_parse_symmetry("1",(1,0))
test_parse_symmetry("21",(2,1))
test_parse_symmetry("",(0,0))