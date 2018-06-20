defmodule BigText.CLI do
  @letters [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ]

  def main(args \\ []) do
    args
    |> get_chars
    |> convert
    |> copy
    |> IO.puts()
  end

  defp get_chars(args) do
    {opts, word, _} = OptionParser.parse(args, switches: [jank: :boolean])

    {opts, Enum.join(word, " ")}
  end

  defp convert({opts, word}) do
    word
    |> String.downcase()
    |> String.codepoints()
    |> Enum.map(&emoji/1)
    |> put_jank(opts)
    |> List.to_string()
  end

  defp emoji(char) when char == " ", do: "    "
  defp emoji(char) when char in @letters do
    ":letter_#{char}:"
  end

  defp emoji(char), do: char

  defp put_jank(letters, [{:jank, true}]) do
    Enum.map(letters, &jank_space/1)
  end

  defp put_jank(letters, _), do: letters

  defp jank_space(letter) when letter == "    ", do: ":invisible_parrot"
  defp jank_space(letter), do: letter

  defp copy(text) do
    port = Port.open({:spawn, "pbcopy"}, [:binary])
    send(port, {self(), {:command, text}})
    send(port, {self(), :close})

    text
  rescue
    _ -> text
  end
end
