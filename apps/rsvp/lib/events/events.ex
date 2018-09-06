defmodule Rsvp.Events do

  # Enject Ecto code into  this module
  use Ecto.Schema

  schema "events" do
    field   :title, :string
    field   :location, :string
    field   :date, Ecto.DateTime

    timestamps
  end

end