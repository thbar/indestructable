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

  @expressions [
    {"gracias", "merci"},
    {"por favor", "s’il vous plait"},
    {"de nada", "de rien"},
    {"lo siento", "je suis désolé"},
    {"perdon por el retraso", "pardon pour le retard"}
  ]

  @vocabulaire [
    {"una imagen", "une image"},
    {"un diálogo", "un dialogue"},
    {"una fotografía", "une photographie"},
    {"un reportaje", "un documentaire"},
    {"un texto", "un texte"},
    {"un dibujo", "un dessin"},
    {"un mapa", "une carte"},
    {"una pintura", "une peinture"}
  ]

  @vocabulaire_2 [
    # {"Le gâteau", "el pastel"},
    # {"Une table", "una mesa"},
    # {"Une nappe", "un mantel"},
    # {"Une fourchette", "un tenedor"},
    # {"Une cuillère", "una cochura"},
    # {"Un couteau", "un cuchillo"},
    # {"Un verre", "un vasa"},

    {"Au dessus de", "arriba de"},
    # {"A gauche de", "a la izquierda"},
    # {"A droite de", "a la derecha"},
    # {"Au milieu de", "en el centro"},
    # {"Sur quelque chose", "sobre"},
    {"En dessous de", "abajo"}
  ]

  @vocabulaire_3 [
    # {"la fête", "la fiesta"},
    # {"le ballon", "el globo"},
    # {"la bougie", "la vela"},
    # {"le cadeau", "el regalo"},
    # {"aujourd'hui", "hoy"},
    {"anniversaire", "el cumpleaños"},
    {"souhaiter", "desear"},
    {"l'âge", "la edad"},
    {"avoir", "tener"}
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
    {"je", "yo me llamo"},
    {"tu", "tú te llamas"},
    {"il/elle", "él/ella/usted se llama"},
    {"nous", "nosotros/nosotras nos llamamos"},
    {"vous", "vosotros/vosotras os llamáis"},
    {"ils/elles", "ellos/ellas/ustedes se llaman"}
  ]

  @tener [
    {"je", "yo tengo"},
    {"tu", "tú tienes"},
    {"elle", "ella tiene"},
    {"nous", "nosotras tenemos"},
    {"vous", "vosotras tenéis"},
    {"elles", "ellas tienen"}
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

  def question_conjugaison({french, answer}) do
    IO.puts(french)

    data = IO.gets("")
    data = data |> String.trim()
    data = String.replace(data, "o,", "ó")
    data = String.replace(data, "u,", "ú")
    data = String.replace(data, "e,", "é")
    data = String.replace(data, "a,", "á")

    if data == answer do
      IO.puts(IO.ANSI.green() <> "OK" <> IO.ANSI.reset() <> "\n")
    else
      IO.puts(IO.ANSI.format([:red, "KO!"]))
      IO.puts("La bonne réponse était: #{answer}\n")
    end

    IO.puts("")
    IO.puts(answer)
    {_, 0} = System.shell(~s(say #{answer} --voice Marisol))
    :timer.sleep(1_000)
  end

  def questions_llamarse() do
    IO.puts(IO.ANSI.clear())
    IO.puts("Conjugaison llamarse\n\n")

    @llamarse
    |> Enum.each(fn x -> question_conjugaison(x) end)
  end

  def questions_expressions() do
    @vocabulaire
    |> Enum.each(fn {a, b} -> question_conjugaison({b, a}) end)
  end

  def q do
    @vocabulaire_2
    |> Enum.each(fn {french, answer} ->
      question_conjugaison({french, answer})
    end)
  end

  def questions_tener() do
    IO.puts(IO.ANSI.clear())
    IO.puts("Conjugaison tener\n\n")

    @tener
    |> Enum.each(fn x -> question_conjugaison(x) end)
  end
end

# Quizz.questions()
# Quizz.quizz_alphabet()
# Quizz.questions_expressions()

Quizz.q()

# Quizz.questions_tener()

# Quizz.questions_llamarse()
