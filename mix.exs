defmodule FacebookMessenger.Mixfile do
  use Mix.Project

  def project do
    [
      app: :facebook_messenger,
      name: "ExFacebookMessenger",
      source_url: "https://github.com/oarrabi/facebook_messenger",
      version: "0.4.0",
      docs: [ extras: ["README.md"] ],
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      test_coverage: [tool: Coverex.Task, coveralls: true],
      deps: deps(),
      package: package(),
      licenses: ["MIT"],
      description: description()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    d = [
      {:httpoison, "~> 0.10 or ~> 1.0"},
      {:plug, "> 0.0.0"},
      {:inch_ex, "> 0.0.0", only: :dev},
      {:ex_doc, "~> 0.7", only: :dev},
      {:poison, "~> 2.1 or ~> 3.0"}
    ]

    if Mix.env == :test do
      [{:coverex, "~> 1.4", only: :test} | d]
    else
      d
    end
  end

  defp description do
    """
    ExFacebookMessenger is a library that easy the creation of facebook messenger bots.
    """
  end

  defp package do
    [ files: [ "lib", "mix.exs", "README.md",],
      maintainers: [ "Omar Abdelhafith" ],
      links: %{ "GitHub" => "https://github.com/oarrabi/facebook_messenger" } ]
  end
end
