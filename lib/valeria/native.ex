defmodule Valeria.Native do
  use Rustler, otp_app: :valeria, crate: :valeria_nifnative
  def add(_a, _b), do: exit(:nif_not_loaded)
end
