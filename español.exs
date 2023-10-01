defmodule Quizz do
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
    {24, "veinticuatro"},
    {25, "veinticinco"},
    {26, "veintiséis"},
    {27, "veintisiete"},
    {28, "veintiocho"},
    {29, "veintinueve"},
    {30, "treinta"},
    {31, "treinta y uno"},
    {40, "cuarenta"},
    {41, "cuarenta y uno"},
    {50, "cincuenta"},
    {60, "sesenta"},
    {70, "setenta"},
    {80, "ochenta"},
    {90, "noventa"},
    {100, "cien"},
    {101, "ciento uno"}
  ]

  @letters [
    {"a", "a"},
    {"b", "be"},
    {"c", "ce"},
    {"ch", "che"},
    {"d", "de"},
    {"e", "e"},
    {"f", "efe"},
    {"g", "ge"},
    {"h", "hache"},
    {"i", "i"},
    {"j", "jota"},
    {"k", "ka"},
    {"l", "ele"},
    {"ll", "ellé"},
    {"m", "eme"},
    {"n", "ene"},
    {"ñ", "eñe"},
    {"o", "o"},
    {"p", "pe"},
    {"q", "cu"},
    {"r", "erre"},
    {"s", "ese"},
    {"t", "te"},
    {"u", "u"},
    {"v", "uve"},
    {"w", "uve doble"},
    {"x", "equis"},
    {"y", "i griega"},
    {"z", "zeta"}
  ]

  @llamarse [
    {"yo", "me llamo"},
    {"tú", "te llamas"},
    {"él", "se llama"},
    {"nosotros", "nos llamamos"},
    {"vosotros", "os llamáis"},
    {"ellos", "se llaman"}
  ]

  def question({number, writing}) do
    IO.puts("Comment écrit-on #{number |> inspect} en espagnol ?")
#    {_, 0} = System.shell(~s(say #{number} --voice Marisol))
    data = IO.gets("")
    data = data |> String.trim()
    data = String.replace(data, "o,", "ó")
    data = String.replace(data, "u,", "ú")
    data = String.replace(data, "e,", "é")
    data = String.replace(data, "a,", "á")

    if data == writing do
      IO.puts(IO.ANSI.green() <> "OK" <> IO.ANSI.reset() <> "\n")
    else
      IO.puts(IO.ANSI.format([:red, "KO!"]))
      IO.puts("La bonne réponse était: #{writing}\n")
    end
  end

  def questions() do
    IO.puts(IO.ANSI.clear())

    @numbers
    |> Enum.each(fn number ->
      question(number)
    end)
  end

  def question_letter({letter, name}) do
    IO.puts("Comment prononce-t-on la lettre #{letter |> inspect} en espagnol ?")
    IO.gets("")
    IO.puts(IO.ANSI.cyan() <> name <> IO.ANSI.reset() <> "\n")
    {_, 0} = System.shell(~s(say #{name} --voice Marisol))
  end

  def quizz_alphabet() do
    IO.puts(IO.ANSI.clear())

    @letters
    |> Enum.each(fn letter ->
      question_letter(letter)
    end)
  end

  def question_conjugaison({pronoun, writing}) do
    IO.puts pronoun
    {_, 0} = System.shell(~s(say #{pronoun} --voice Marisol))

    data = IO.gets("")
    data = data |> String.trim()
    data = String.replace(data, "o,", "ó")
    data = String.replace(data, "u,", "ú")
    data = String.replace(data, "e,", "é")
    data = String.replace(data, "a,", "á")

    if data == writing do
      IO.puts(IO.ANSI.green() <> "OK" <> IO.ANSI.reset() <> "\n")
    else
      IO.puts(IO.ANSI.format([:red, "KO!"]))
      IO.puts("La bonne réponse était: #{writing}\n")
    end

    IO.puts ""
    IO.puts "#{pronoun} #{writing}"
    {_, 0} = System.shell(~s(say #{pronoun} #{writing} --voice Marisol))
    :timer.sleep(1_000)
  end

  def questions_llamarse() do
    IO.puts(IO.ANSI.clear())
    IO.puts "Conjugaison llamarse\n\n"
    @llamarse
    |> Enum.each(fn(x) -> question_conjugaison(x) end)
  end
end

# Quizz.questions()
# Quizz.quizz_alphabet()

Quizz.questions_llamarse()