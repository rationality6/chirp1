defmodule Chirp1.Repo do
  use Ecto.Repo,
    otp_app: :chirp1,
    adapter: Ecto.Adapters.Postgres
end
