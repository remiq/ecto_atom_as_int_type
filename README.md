# Ecto.AtomAsIntType

Allows you to use :atoms as ecto fields, while saving data in db as integers.

## Usage

Alter model:

    defmodule MyApp.MyModel do
      use Ecto.Schema

      defmodule StateType do
        use Ecto.AtomAsIntType,
          new: 1,
          old: 2
        schema "mymodel" do
          field :state, StateType
        end
    end

If you are searching for selected atom, you need to pin it.

    MyModel
    |> where([m], m.state == ^:new)
    |> Repo.all
