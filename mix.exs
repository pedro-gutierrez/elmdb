defmodule Exmdb.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exmdb,
      version: "0.0.1",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:erlang, :elixir_make] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      erlc_options: [{:parse_transform}],
      deps: deps()
    ]
  end

  defp description() do
    "Elixir extended EMDB, a wrapper around LMDB. "
  end


  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Exmdb.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false},
      {:mix_erlang_tasks, "0.1.0"},
    ]
  end

  defp package() do
    [
      files: [
        "lib", "priv", "mix.exs", "README*", "LICENSE*", "src", "c_src"
      ],
      maintainers: ["Jaremy Creechley"],
      licenses: ["OpenLDAP License"],
      links: %{"GitHub" => "https://github.com/elcritch/exmdb"}
    ]
  end

end
