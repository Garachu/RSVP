defmodule Rsvp.Events do

  # Enject Ecto code into  this module
  use Ecto.Schema

  import Ecto.Changeset

  schema "events" do
    field   :title, :string
    field   :location, :string

    timestamps
  end

  @required_fields ~w(title, location)a
  @optional_fields ~w(description)a

  # Rsvp.Events.changeset(%Rsvp.Events{}, )
  def changeset(event, params \\ %{}) do

    # pipe event to cast function
    event

    # cast is part of ECto.changeset module, the function will cast values to their correct types
    # if you pass in a date string, it will convert it into a datetime for saving it to the database
    # |> cast(params, @required_fields)

    # Pipe the results from the cast function to validate_required function
    # the only parameter you need to pass it is the list of required fields
    # |> validate_required(@required_fields)
  end

end
