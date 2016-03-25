"""
Create and return a formatted string of the RCSB atom record.
The format using the Python string formatting convention is expressed 
as follows:
ATOM{:5s}{:>4s}{:1s}{:3s}{:1s}{:4d}{:1s}{:6.3f}{:6.3f}{:6.3f}{:6.2f}{:6.2f}{:>2s}

Arguments
---------
atom:Atom 
    an instance of type Atom
"""
function format_ATOM_RCSB(atom::Atom)
    atom_name = obtain(atom, :raw_atom_name)

    # create a string of spaces of length n
    function space(n::Integer)
        char_list = []
        for i = 1:n
            push!(char_list, ' ')
        end
        return string(char_list...)
    end

    coordinate = obtain(atom, :coordinate)[1]

    return string("ATOM",
        space(2),
        format_atom_index(obtain(atom,:index)),
        space(1),
        format_atom_name(atom_name),
        obtain(atom, :alt_location),
        format_residue_name(obtain(atom, :residue_name)),
        space(1),
        format_chain_name(obtain(atom, :chain_name)),
        format_residue_id(obtain(atom, :residue_id)),
        obtain(atom, :insertion),
        space(3),
        format_atom_coordinate(coordinate[1]),
        format_atom_coordinate(coordinate[2]),
        format_atom_coordinate(coordinate[3]),
        format_atom_occupancy(obtain(atom, :occupancy)),
        format_atom_beta(obtain(atom, :beta)),
        space(6+4),
        format_atom_element(obtain(atom, :element)),
        format_atom_charge(obtain(atom, :charge))
        )  
end