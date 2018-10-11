# WeaveAwayNotebooks
NBConverter stuff to convert Jupyter Notebooks in to Literate.jl files (This is the opposite of Literate.jl)



## Demo

 1. We start with this notebook: [ODEIntroduction.ipynb](demo/ODEIntroduction.ipynb)
 2. we run `bash run_nbconvert.sh demo/ODEIntroduction.ipynb` to generate this Literate julia file: [ODEIntroduction.jl](demo/ODEIntroduction.jl)
 3. we run the Literate.jl script to generate the markdown, notebook and script files in [literate_output/](demo/literate_output/):
 ```
 julia> Literate.markdown("demo/ODEIntroduction.jl", "demo/literate_output/")
[ Info: generating markdown page from `~/.julia/environments/WeaveAwayNotebooks/demo/ODEIntroduction.jl`
[ Info: not running on Travis, skipping links will not be correct.
[ Info: writing result to `~/.julia/environments/WeaveAwayNotebooks/demo/literate_output/ODEIntroduction.md`
"/home/wheel/oxinabox/.julia/environments/WeaveAwayNotebooks/demo/literate_output/ODEIntroduction.md"

julia> Literate.notebook("demo/ODEIntroduction.jl", "demo/literate_output/"; execute=false) # executing require packages to be installed
[ Info: generating notebook from `~/.julia/environments/WeaveAwayNotebooks/demo/ODEIntroduction.jl`
[ Info: not running on Travis, skipping links will not be correct.
[ Info: writing result to `~/.julia/environments/WeaveAwayNotebooks/demo/literate_output/ODEIntroduction.ipynb`
"/home/wheel/oxinabox/.julia/environments/WeaveAwayNotebooks/demo/literate_output/ODEIntroduction.ipynb"

julia> Literate.script("demo/ODEIntroduction.jl", "demo/literate_output/"; execute=false)
[ Info: generating plain script file from `~/.julia/environments/WeaveAwayNotebooks/demo/ODEIntroduction.jl`
[ Info: not running on Travis, skipping links will not be correct.
[ Info: writing result to `~/.julia/environments/WeaveAwayNotebooks/demo/literate_output/ODEIntroduction.jl`
"/home/wheel/oxinabox/.julia/environments/WeaveAwayNotebooks/demo/literate_output/ODEIntroduction.jl"
 ```
