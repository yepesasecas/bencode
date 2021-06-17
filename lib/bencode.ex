defmodule Bencode do

  # li10ei15ee

  def parse("le") do
    []
  end
  def parse("i" <> integer) do
    integer
    |> remove_e_from_end()
    |> String.to_integer()
  end
  def parse("l" <> list_items) do
    list_items
    |> remove_e_from_end()
    |> split_list_and_integers()
    |> Enum.map(&(parse(&1)))
  end

  # Private

  defp remove_e_from_end(string) do
    String.slice(string, 0..-2)
  end

  defp add_i_to_beginning(string) do
    "i" <> string
  end

  defp add_l_to_beginning(string) do
    "l" <> string
  end

  defp split_list_and_integers(string) do
    case String.split(string, "l", trim: true) do
      [string] -> 
        string
        |> String.split("i", trim: true)
        |> Enum.map(&(add_i_to_beginning(&1)))
      split ->
        split
        |> Enum.map(&(add_l_to_beginning(&1)))
    end
  end
end
