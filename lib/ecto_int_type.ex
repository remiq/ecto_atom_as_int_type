defmodule Ecto.IntType do
  @moduledoc """
  Allows you to use atoms while you store data in db as int.

  Based on this: http://www.glydergun.com/a-quick-dip-into-ecto-types/
  """

  defmacro __using__(values) do
    quote do
      @behaviour Ecto.Type
      def type, do: :integer
      unquote do
        Enum.map(values, fn {atom, int} ->
          quote do
            def cast(unquote(atom)), do: {:ok, unquote(int)}
            def dump(unquote(atom)), do: {:ok, unquote(int)}
            def load(unquote(int)), do: {:ok, unquote(atom)}
          end
        end)
      end
      def cast(_), do: :error
      def load(_), do: :error
      def dump(_), do: :error
    end
  end
end
