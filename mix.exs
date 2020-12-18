defmodule Valeria.MixProject do
  use Mix.Project

  def project do
    [
      app: :valeria,
      version: "0.1.0",
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: [
        valeria_nativenif: [
          path: "native/valeria",
          mode: if(Mix.env() == :prod, do: :release, else: :debug)
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
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:postgrex, "~> 0.15"},
      {:ecto_sql, "~> 3.2"},
      {:rustler, "~> 0.21.1"}
    ]
  end
end
