# This file is going to contain the logic behind fetching data from the events table
defmodule Rsvp.EventQueries do

  # Enables you to write elixir style queries that will be run against the database, it then turns those statements into sql
  import Ecto.Query

  alias Rsvp.{Repo, Events}

  # r(Rsvp.EventQueries) or iex -S mix
  # Rsvp.EventQueries.get_all
  def get_all do
    Repo.all(from Events)
  end

  # r(Rsvp.EventQueries) or iex -S mix
  # Rsvp.EventQueries.get_all_for_location("Lincoln")
  def get_all_for_location(location) do
    query = from e in Events,

      # By using a caret before location, you saying you want to use the value represented by location
      where: e.location == ^location

    Repo.all(query)
  end

  # Might be tempted to write a simialar query to get _all_for_location query, it will certainly work
  # But Ecto provides some shortcut functions as well, getting a record by it's primary key is one of those functions
  # r(Rsvp.EventQueries) or iex -S mix
  # Rsvp.EventQueries.get_by_id(1)
  def get_by_id(id) do
    Repo.get(Events, id)
  end

  # Rsvp.Repo.insert %Rsvp.Events{title: "CodeFest", location: "Nairobi"}
  # Rsvp.Repo.insert %Rsvp.Events{location: "Nairobi"}

  # Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{},  %{title : "New Title", location: "New Location"}))
  def create(event) do
    Repo.insert(event)
  end

end
