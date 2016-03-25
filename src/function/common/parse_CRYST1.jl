"""
Parse the "CRYST1" record in a PDB file and
return a ``CrystalSymmetry`` object.

Arguments
----------
line:AbstractString
    one line of CRYST1 record
"""
function parse_CRYST1(line::AbstractString)
    line_length = length(line)
    if line_length == 0
        return CrystalSymmetry()
    end

    a = parse(strip(line[7:15]))
    b = parse(strip(line[16:24]))
    c = parse(strip(line[25:33]))
    alpha = parse(strip(line[34:40]))
    beta  = parse(strip(line[41:47]))
    gamma = parse(strip(line[48:54]))
    
    lattice_type = "P" # default
    symmetries = [(1,0), (0,0), (0,0)] # default
    chain_count = 1 # default number of chains in a unit cell
    if line_length >= 56 
        # other information
        others = split(string(line[56:end])) # both space group and number of occurrence of the most populous chain

        if length(others) >= 1
            lattice_type = others[1]
        end

        if length(others) >= 2
            symmetries[1] = parse_symmetry(others[2]) # get lattice type, e.g. "P"
        end

        if length(others) >= 4
            symmetries[2], symmetries[3] = [parse_symmetry(item) for item in others[3:4]]
        end

        if length(others) == 5
            chain_count = parse(others[5])
        end
    end

    return CrystalSymmetry(;lengths=[a,b,c], angles=[alpha, beta, gamma], lattice=lattice_type, symmetries=symmetries, chain_count=chain_count)
end