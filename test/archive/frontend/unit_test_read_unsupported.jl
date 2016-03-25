# test reading unsupported PDB format
test_read(
    joinpath(TestParams.data_dir(), "RCSB", "1_line_RCSB.pdb"),
    :unsupported,
    function ()
        return false
    end
)