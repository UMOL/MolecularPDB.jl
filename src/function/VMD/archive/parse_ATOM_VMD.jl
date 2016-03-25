"""
Parse a string the represents one line of the ATOM record in a VMD PDB file.
The file format for ATOM is described here 
(http://www.wwpdb.org/documentation/file-format-content/format33/sect9.html#ATOM).

Arguments
----------
index:Integer 
    sequential index

line:AbstractString
    A string that represents one line of the ATOM record in a PDB file.

system_name="":AbstractString
    name of the output molecular system
"""
function parse_ATOM_VMD(index::Integer, line::AbstractString, system_name::AbstractString="")
    args = []
    push!(args, (:index, index))
    push!(args, (:atom_name, line[13:16]))
    push!(args, (:alt_location, line[17]))
    push!(args, (:residue_name, strip(line[18:20])))
    push!(args, (:chain_name, string(line[22])))
    push!(args, (:residue_id, Int(parse(strip(line[23:26])))))
    push!(args, (:insertion, line[27]))
    x = parse(strip(line[31:38]))
    y = parse(strip(line[39:46]))
    z = parse(strip(line[47:54]))
    push!(args, (:coordinate, [x,y,z]))
    push!(args, (:occupancy, parse(strip(line[55:60]))))
    push!(args, (:beta, parse(strip(line[61:66]))))
    
    #-------------------------------------------
    # VMD cares about the segment field
    push!(args, (:segment_name, line[73:76]))
    #-------------------------------------------
    push!(args, (:element, strip(line[77:78])))

    # charge
    if length(line) >= 80
        charge = strip(line[79:80])
    else
        charge = ""
    end

    if length(charge) > 0
        # e.g. 2+, 1-
        push!(args, (:charge, Int(parse(reverse(charge)))))
    else
        push!(args, (:charge, 0))
    end
    
    return Atom(;args..., system_name=system_name)
end
