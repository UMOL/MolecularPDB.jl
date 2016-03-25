# UMOL-PDB
A module for reading and writing PDB files.
``read()`` will return a ``PDB`` object which
can be converted to a ``MolecularSystem`` object
by ``obtain(obj, :molecular_system)``.
``save()`` write a ``PDB`` object to a file on disk.
There are two flavors of PDB supported: ``RCSB`` and ``PDB``.
Two abstract types ``RCSB`` and ``PDB`` are defined
which can be used as the first argument for ``save()``
and ``read()`` to signify which PDB file format.

## Supported PDB flavors
* RCSB
* VMD

## Usage
```julia
import MolecularPDB: read, save, RCSB, VMD

obj_alice = read(RCSB, "my_rcsb.pdb", "alice")
obj_bob = read(VMD, "my_vmd.pdb", "bob")
save(RCSB, "new_rcsb.pdb", obj_alice)
save(VMD, "new_rcsb.pdb", obj_bob)

```
## Note
* AUTHOR: YUHANG(STEVEN) WANG
* PROJECT INITIATION DATE: 02-21-2016
* LICENSE: MPL 2.0 (see LICENSE.md)

