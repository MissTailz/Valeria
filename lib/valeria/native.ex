defmodule Valeria.Native do
  use Rustler, otp_app: :valeria, crate: :valeria_nifnative

  def draw_reddit_profile(_karma, _username, _avatar_hash, _id),
    do: :erlang.nif_error(:nif_not_loaded)
end
