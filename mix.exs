defmodule Valeria.MixProject do
  use Mix.Project

  def project do
    [
      app: :valeria,
      version: "0.1.0",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: [
        valeria_nativenif: [
          path: "native/valeria",
          # if(Mix.env() == :prod, do: :release, else: :debug)
          mode: :release
        ]
      ],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Valeria.Application, []}
    ]
  end

  defp deps do
    [
      {:nostrum, "~> 0.4"},
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.3", only: :dev, runtime: false},
      {:postgrex, "~> 0.15"},
      {:ecto_sql, "~> 3.2"},
      {:rustler, github: "rusterlium/rustler", ref: "e343b8ca", sparse: "rustler_mix"}
    ]
  end
end
