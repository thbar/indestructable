defmodule Quizz do
  [
    :numbers,
    :expressions,
    :vocabulaire,
    :vocabulaire_2,
    :vocabulaire_3,
    :letters,
    :llamarse,
    :tener,
    :vivir,
    :hablar,
    :aprender,
    :ser,
    :colors,
    :dates,
    :grandir_futur,
    :crier_futur
  ]
  |> Enum.each(fn x -> Module.register_attribute(__MODULE__, x, persist: true) end)

  @dates [
    {"lundi", "lunes"},
    {"mardi", "martes"},
    {"mercredi", "miércoles"},
    {"jeudi", "jueves"},
    {"vendredi", "viernes"},
    {"samedi", "sábado"},
    {"dimanche", "domingo"},
    {"janvier", "enero"},
    {"février", "febrero"},
    {"mars", "marzo"},
    {"avril", "abril"},
    {"mai", "mayo"},
    {"juin", "junio"},
    {"juillet", "julio"},
    {"août", "agosto"},
    {"septembre", "septiembre"},
    {"octobre", "octubre"},
    {"novembre", "noviembre"},
    {"décembre", "diciembre"}
  ]

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
    {"merci", "gracias"},
    {"s’il vous plait", "por favor"},
    {"de rien", "de nada"},
    {"je suis désolé", "lo siento"},
    {"pardon pour le retard", "perdon por el retraso"}
  ]

  @vocabulaire [
    {"une image", "una imagen"},
    {"un dialogue", "un diálogo"},
    {"une photographie", "una fotografía"},
    {"un documentaire", "un reportaje"},
    {"un texte", "un texto"},
    {"un dessin", "un dibujo"},
    {"une carte", "un mapa"},
    {"une peinture", "una pintura"}
  ]

  @vocabulaire_2 [
    {"Le gâteau", "el pastel"},
    {"Une table", "una mesa"},
    {"Une nappe", "un mantel"},
    {"Une fourchette", "un tenedor"},
    {"Une cuillère", "una cochura"},
    {"Un couteau", "un cuchillo"},
    {"Un verre", "un vasa"},
    {"Au dessus de", "arriba de"},
    {"A gauche de", "a la izquierda"},
    {"A droite de", "a la derecha"},
    {"Au milieu de", "en el centro"},
    {"Sur quelque chose", "sobre"},
    {"En dessous de", "abajo"}
  ]

  @vocabulaire_3 [
    {"la fête", "la fiesta"},
    {"le ballon", "el globo"},
    {"la bougie", "la vela"},
    {"le cadeau", "el regalo"},
    {"aujourd'hui", "hoy"},
    {"anniversaire", "el cumpleaños"},
    {"souhaiter", "desear"},
    {"l'âge", "la edad"},
    {"avoir", "tener"}
  ]

  @colors [
    {"rouge", "rojo"},
    {"jaune", "amarillo"},
    {"orange", "naranja"},
    {"rose", "rosa"},
    {"violet", "violeta"},
    {"vert", "verde"},
    {"bleu", "azul"},
    {"noir", "negro"},
    {"blanc", "blanco"},
    {"gris", "gris"},
    {"marron", "marrón"}
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
    {"il/elle", "él se llama"},
    {"nous", "nosotros nos llamamos"},
    {"vous", "vosotros os llamáis"},
    {"ils/elles", "ellos se llaman"}
  ]

  @tener [
    {"je", "yo tengo"},
    {"tu", "tú tienes"},
    {"elle", "ella tiene"},
    {"nous", "nosotros tenemos"},
    {"vous", "vosotros tenéis"},
    {"elles", "ellos tienen"}
  ]

  @vivir [
    {"je", "yo vivo"},
    {"tu", "tú vives"},
    {"il", "él vive"},
    {"nous", "nosotros vivimos"},
    {"vous", "vosotros vivís"},
    {"ils", "ellos viven"}
  ]

  @ser [
    {"je", "yo soy"},
    {"tu", "tú eres"},
    {"il", "él es"},
    {"nous", "nosotros somos"},
    {"vous", "vosotros sois"},
    {"ils", "ellos son"}
  ]

  @hablar [
    {"je", "yo hablo"},
    {"tu", "tú hablas"},
    {"il", "él habla"},
    {"nous", "nosotros hablamos"},
    {"vous", "vosotros habláis"},
    {"ils", "ellos hablan"}
  ]

  @aprender [
    {"je", "yo aprendo"},
    {"tu", "tú aprendes"},
    {"il", "él aprende"},
    {"nous", "nosotros aprendemos"},
    {"vous", "vosotros aprendéis"},
    {"ils", "ellos aprenden"}
  ]

  @grandir_futur [
    {"je", "grandirai"},
    {"tu", "grandiras"},
    {"il/elle/on", "grandira"},
    {"nous", "grandirons"},
    {"vous", "grandirez"},
    {"ils/elles", "grandiront"}
  ]

  @crier_futur [
    {"je", "crierai"},
    {"tu", "crieras"},
    {"il/elle/on", "criera"},
    {"nous", "crierons"},
    {"vous", "crierez"},
    {"ils/elles", "crieront"}
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
    data = String.replace(data, "i,", "í")

    if data == writing do
      IO.puts(IO.ANSI.green() <> "OK" <> IO.ANSI.reset() <> "\n")
    else
      IO.puts(IO.ANSI.format([:red, "KO!"]))
      IO.puts("La bonne réponse était: #{writing}\n")
    end
  end

  def questions(key) do
    #    IO.puts(IO.ANSI.clear())

    get_data(key)
    |> Enum.each(fn number ->
      question_conjugaison(number)
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

    IO.puts(answer)
    {_, 0} = System.shell(~s(say #{answer} --voice Marisol))
    :timer.sleep(1_000)
    IO.puts("")
    IO.puts("")
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

  def get_data(name) do
    __MODULE__.__info__(:attributes)[name]
  end
end

[
  #  :numbers,
  :tener,
  :vivir,
  :llamarse,
  :hablar,
  :aprender,
  :ser
  #  :expressions,
  #  :letters,
  #  :vocabulaire,
  #  :vocabulaire_2
  #  :vocabulaire_3
]
|> Enum.each(fn x ->
  IO.puts("=========================")
  IO.puts(x)
  Quizz.questions(x)
end)
