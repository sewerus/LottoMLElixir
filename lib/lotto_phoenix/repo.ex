defmodule LottoPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :lotto_phoenix,
    adapter: Ecto.Adapters.Postgres
end
