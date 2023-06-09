import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :fracomex_synchro, FracomexSynchro.Repo,
  username: "root",
  password: "",
  hostname: "localhost",
  database: "fracomex_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fracomex_synchro, FracomexSynchroWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "GBC37NoluLZNsXVOPq4AavoOBE/2n29lZ+yQzQ5diaF4uBa1bzkf5C7SWHg9vhAv",
  server: false

# In test we don't send emails.
config :fracomex_synchro, FracomexSynchro.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
