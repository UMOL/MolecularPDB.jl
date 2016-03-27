"""
TestParams module contains all the parameters
"""
module TestParams
export data_dir, tmp_dir

"""
Define the data directory.
"""
function data_dir()
    return "data"
end

"""
Define the temporary directory for outputs written by tests
"""
function tmp_dir()
    return joinpath("tmp")
end

end