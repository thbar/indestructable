defmodule Numbers do
  @numbers [
    {0, "cero"},
    {1, "uno"},
    {2, "dos"},
    {3, "tres"},
    {4, "cuatro"},
    {5, "cinco"},
    {6, "seis"},
    {7, "siete"},
    {8, "ocho"},
    {9, "nueve"},
    {10, "diez"},
    {11, "once"},
    {12, "doce"},
    {13, "trece"},
    {14, "catorce"},
    {15, "quince"},
    {16, "dieciséis"},
    {17, "diecisiete"},
    {18, "dieciocho"},
    {19, "diecinueve"},
    {20, "veinte"},
    {21, "veintiuno"},
    {22, "veintidós"},
    {23, "veintitrés"},
    {26, "veintiséis"},
    {30, "treinta"}
  ]

  def question({number, writing}) do
    IO.puts "Comment écrit-on #{number |> inspect} en espagnol ?"
    {_, 0} = System.shell(~s(say #{number} --voice Marisol))
    data = IO.gets("")
    data = data |> String.trim()
    if data == writing do
      IO.puts(IO.ANSI.green <> "OK" <> IO.ANSI.reset <> "\n")
    else
      IO.puts IO.ANSI.format([:red, "KO!"])
      IO.puts "La bonne réponse était: #{writing}\n"
    end
  end

  def questions() do
    IO.puts IO.ANSI.clear()
    @numbers
    |> Enum.each(fn(number) -> 
      question(number)
    end)
  end
end

Numbers.questions()