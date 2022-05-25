defmodule ChatApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :chat_api,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers() ++ [:phoenix_swagger],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      releases: [
        papercups: [
          include_executables_for: [:unix],
          applications: [chat_api: :permanent]
        ]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {ChatApi.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:ex_machina, "~> 2.7", only: [:test]},
      {:mock, "~> 0.3.0", only: :test},
      {:customerio, "~> 0.2"},
      {:ex_aws, "~> 2.0"},
      {:ex_aws_s3, "~> 2.0"},
      {:ex_aws_lambda, "~> 2.0"},
      {:ex_aws_ses, "~> 2.0"},
      {:swoosh, "~> 1.6"},
      {:gen_smtp, "~> 0.13"},
      {:phoenix, "~> 1.6.9"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.8"},
      {:postgrex, ">= 0.16.3"},
      {:phoenix_live_dashboard, "~> 0.5.0"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.19"},
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.3"},
      {:joken, "~> 2.4"},
      {:plug_cowboy, "~> 2.5"},
      {:corsica, "~> 1.2"},
      {:pow, "~> 1.0.27"},
      {:stripity_stripe, "~> 2.13"},
      {:oban, "~> 2.12.0"},
      {:sentry, "8.0.0"},
      {:google_api_gmail, "~> 0.14"},
      {:oauth2, "~> 2.0"},
      {:mail, "~> 0.2"},
      {:phoenix_swagger, "~> 0.8"},
      {:uuid, "~> 1.1"},
      {:ex_json_schema, "~> 0.5"},
      {:pow_postgres_store, "~> 1.0"},
      {:tzdata, "~> 1.0.5"},
      {:scrivener_ecto, "~> 2.0"},
      {:floki, "~> 0.30.1"},
      {:paginator, "~> 1.0.3"},
      {:phoenix_pubsub_redis, "~> 3.0.1"},
      {:appsignal_phoenix, "~> 2.0.14"},
      {:earmark, "~> 1.4.25"},
      {:sweet_xml, "~> 0.7.3"},
      # TODO: just copy code over?
      {:exponent_server_sdk, "~> 0.2.0"},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test --exclude lambda_development"]
    ]
  end
end
