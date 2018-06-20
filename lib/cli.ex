defmodule BigText.CLI do
  @letters ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
"q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

  def main(args \\ []) do
    args
    |> get_chars
    |> convert
    |> IO.puts
  end

  defp get_chars(args) do
    {_, word, _} = OptionParser.parse(args)

    Enum.join(word, " ")
  end

  defp convert(word) do
    word
    |> String.downcase()
    |> String.codepoints()
    |> Enum.map(&emoji/1)
    |> List.to_string()
  end

  defp emoji(char) when char in @letters do
    ":letter_#{char}:"
  end

  defp emoji(char), do: char
end
