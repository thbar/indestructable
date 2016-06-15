# encoding: UTF-8
require 'bundler'
Bundler.setup
require 'tty'

# idées à ajouter:
# - emojis: http://apps.timwhitlock.info/emoji/tables/unicode "\u{2b50}"

shell  = TTY::Shell.new

=begin
table = shell.ask "Quelle table veux-tu travailler?" do
  argument :required
  validate /\d+/
  on_error :retry
end.read_int
=end

questions = []

score = 0
games = 0

overall_start_time = Time.now
time_by_question = {}
erreurs = []

def op_label(symbol)
  case symbol
  when :*; '×'
  else symbol.to_s
  end
end

loop do
  if questions.empty?
    # questions = [
    #   [4, 9, :*],
    #   [6, 3, :*],
    #   [8, 3, :*],
    #   [7, 4, :*],
    #   [4, 8, :*],
    #   [4, 6, :*],
    #   [3, 9, :*],
    #   [8, 4, :*]
    # ]
    (2..9).each do |table|
      (1..10).each do |i|
        questions << [table, i, :*]
        questions << [i, table, :*]
      end
    end
    total = questions.size

#    questions = questions.sample(3)
    games += 1
    if games > 1

      puts
      puts "Temps total: %.1f secondes" % (Time.now - overall_start_time)
      puts
      time_by_question = time_by_question.sort_by { |a,b| a <=> b }
      time_by_question.each do |q, time_taken|
        puts "#{q[0]} #{op_label(q[2])} #{q[1]} : " + ("%.1f" % time_taken) + " secondes"
      end

      puts
      puts "Réponses lentes:"
      puts
      time_by_question.each do |q, time_taken|
        if time_taken >= 4
          puts "#{q[0]} #{op_label(q[2])} #{q[1]} : " + ("%.1f" % time_taken) + " secondes"
        end
      end

      puts
      puts "#{erreurs.size} erreurs:"
      puts
      erreurs.each do |a, b ,op|
        puts "#{a} #{op_label(op)} #{b}"
      end
      puts

      abort
    end
  end

  question = questions.sample
  questions.delete(question)

  premier_nombre, deuxieme_nombre, operation = *question

#  Thread.new { `say -v Thomas #{premier_nombre} + #{deuxieme_nombre}`}
  question_start_time = Time.now
  system "clear"
  
  puts "Il reste #{questions.size} questions!"
   reponse = shell.ask("Combien font #{premier_nombre} #{op_label(operation)} #{deuxieme_nombre} ?").read_int rescue retry

  time_taken = Time.now - question_start_time
  time_by_question[question] = time_taken
  reponse_attendue = premier_nombre.send(operation, deuxieme_nombre)
  if reponse == reponse_attendue
    shell.confirm "Gagné!"
    @msg ||= []
    if @msg.empty?
      @msg.push *[
        "Super, trop cool!",
        "C'est super!",
        "Continue comme ça!",
        "Tu déchires!",
        "Tu es aussi fort qu'à Peuzeule Bobeule!",
        "Tu as mangé du lion ma parole?",
        "Impeccable!",
        "Tu es bientôt ceinture noire de Maths!",
        "Comme tu te ballades!",
        "Trop facile pour toi!",
        "C'est bien mon loulou!",
        "Oh la la incroyable!",
        "Bravo, jeune padaouane.",
        "Champion du monde!",
        "Ton cerveau bouillonne!",
        "Je te félicite!",
        "C'est génial!",
        "Bavo bavo, Maël!",
        "Tu as un cerveau super puissant!",
        "Mode nitro!",
        "Tu acharnes!",
        "J'en reste sans voix",
        "Il me faut des lunettes de soleil - je suis ébloui par tes talents"
        ]
    end
    msg = @msg.delete(@msg.sample)
#    Thread.new { `say -v Thomas \"#{msg}\"` }
    score += 1
  else
    erreurs.push([premier_nombre, deuxieme_nombre, operation])
    msg = ["C'est faux! On recommence tout.", "Quelle erreur!", "Je t'envoie dans les prisons de Dark Vador"].sample
#    `say -v Thomas \"#{msg}\"`
    shell.error "Non non non! C'était #{reponse_attendue}."
  end
  puts
end
