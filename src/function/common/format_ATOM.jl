"""
Create and return a formatted string of the RCSB atom record.
The format using the Python string formatting convention is expressed 
as follows:

+--------------+--------------------------------------------------------------------------------------------------------------+
| flavor       | format string                                                                                                |
+==============+==============================================================================================================+
| :rcsb        | ATOM{:5s}{:>4s}{:1s}{:3s}{:1s}{:4d}{:1s}{:8.3f}{:8.3f}{:8.3f}{:6.2f}{:6.2f}{:6s}{:<4s}{:>2s}{:<1d}{:<1s}     |
+--------------+--------------------------------------------------------------------------------------------------------------+
| :vmd         | ATOM{:5s}{:>4s}{:1s}{:3s}{:1s}{:4d}{:1s}{:8.3f}{:8.3f}{:8.3f}{:6.2f}{:6.2f}{:6s}{:<4s}{:>2s}                 |
+--------------+--------------------------------------------------------------------------------------------------------------+

The content of the each ``ATOM`` is defined by the PDB standard
(http://deposit.rcsb.org/adit/docs/pdb_atom_format.html#ATOM)
as shown below:

+------------+----------------+-------------------------------------------------+
| columns    | data type      | contents                                        |
+============+==================================================================+
| 1 -  6     |  Record name   | ATOM                                            |                                        
+------------+----------------+-------------------------------------------------+
| 7 - 11     |  Integer       | Atom serial number.                             |                
+------------+----------------+-------------------------------------------------+
| 13 - 16    |  Atom          | Atom name.                                      |
+------------+----------------+-------------------------------------------------+
| 17         |  Character     | Alternate location indicator.                   |        
+------------+----------------+-------------------------------------------------+
| 18 - 20    |  Residue name  | Residue name.                                   |                      
+------------+----------------+-------------------------------------------------+
| 22         |  Character     | Chain identifier.                               |             
+------------+----------------+-------------------------------------------------+
| 23 - 26    |  Integer       | Residue sequence number.                        |            
+------------+----------------+-------------------------------------------------+
| 27         |  AChar         | Code for insertion of residues.                 |    
+------------+----------------+-------------------------------------------------+
| 31 - 38    |  Real(8.3)     | Orthogonal coordinates for X in Angstroms.      |                    
+------------+----------------+-------------------------------------------------+
| 39 - 46    |  Real(8.3)     | Orthogonal coordinates for Y in Angstroms.      |                          
+------------+----------------+-------------------------------------------------+
| 47 - 54    |  Real(8.3)     | Orthogonal coordinates for Z in Angstroms.      |                        
+------------+----------------+-------------------------------------------------+
| 55 - 60    |  Real(6.2)     | Occupancy.                                      |                       
+------------+----------------+-------------------------------------------------+
| 61 - 66    |  Real(6.2)     | Temperature factor (Default = 0.0).             |             
+------------+----------------+-------------------------------------------------+
| 73 - 76    |  LString(4)    | Segment identifier, left-justified.             |
+------------+----------------+-------------------------------------------------+
| 77 - 78    |  LString(2)    | Element symbol, right-justified.                |
+------------+----------------+-------------------------------------------------+
| 79 - 80    |  LString(2)    | Charge on the atom. (only in RCSB PDB)          |      
+------------+----------------+-------------------------------------------------+

RCSB flavored PDB example (http://deposit.rcsb.org/adit/docs/pdb_atom_format.html#ATOM)::

             1         2         3         4         5         6         7         8
    12345678901234567890123456789012345678901234567890123456789012345678901234567890
    ATOM    145  N   VAL A  25      32.433  16.336  57.540  1.00 11.92      A1   N0+

VMD flavored PDB example::

             1         2         3         4         5         6         7         
    123456789012345678901234567890123456789012345678901234567890123456789012345678
    ATOM    145  N   VAL A  25      32.433  16.336  57.540  1.00 11.92      A1   N



Arguments
---------
atom:Atom 
    an instance of type Atom

format:Symbol 
    choices: [:rcsb, :vmd]
"""
function format_ATOM(atom::Atom, format::Symbol)
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

    common_part = string("ATOM",
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
        space(6),
        format_segment_name(obtain(atom, :segment_name)),
        format_atom_element(obtain(atom, :element))
        )
    if format == :rcsb 
        return string(common_part, format_atom_charge(obtain(atom, :charge)))
    elseif format == :vmd 
        return common_part
    else 
        @debug print_with_color(:red, "WARNING! format :$(format) is unsupported by format_ATOM()\n\n")
        return ""
    end
end