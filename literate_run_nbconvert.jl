"""
    literate_run_nbconvert(source_dir="."; output_dir=source_dir, config_dir=".")

Convert all Julia ipynb notebooks to jl files, using nbconvert

# Input
- `source_dir`: directory where the ipynb files can be found
- `output_dir::String`:  path to output folder (defaults to `source_dir`)
- `config_dir::String`:  path to where literate_config.py and literate.tpl are

"""
function literate_run_nbconvert(source_dir="."; output_dir=source_dir, config_dir=".")

    files = filter(x->endswith(lowercase(x),".ipynb"), readdir(source_dir))
    files = joinpath.(source_dir, files)

    config = joinpath(config_dir, "literate_config.py")
    template  = joinpath(config_dir, "literate.tpl")

    for file in files
        printstyled("\n\n-------------Converting $files-------------\n", color=:blue)
        run(`jupyter nbconvert  --to script $file --output-dir $output_dir --config $config --template $template --Application.log_level='DEBUG'`)
    end
end

