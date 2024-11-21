using OptTestFunctions
using Documenter

DocMeta.setdocmeta!(OptTestFunctions, :DocTestSetup, :(using OptTestFunctions); recursive=true)

makedocs(;
    modules=[OptTestFunctions],
    authors="Emanuel Queiroz, Samara Vilar, Giselle Lopes, Marcio Bortoloti",
    sitename="OptTestFunctions.jl",
    format=Documenter.HTML(;
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
