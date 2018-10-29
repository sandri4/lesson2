class Pet
  def initialize(name, age = 0, lifes = 1, mood = 3, hungry = 5,
                 sleep = 5, death = false)
    @name = name.capitalize
    @age = age
    @lifes = lifes
    @mood = mood
    @hungry = hungry
    @sleep = sleep
    @death = death

    puts "Pet #{@name} has been created."
  end

  def eat
    eat = %w(meat milk fish feed mouse)
    puts "#{@name} has eaten #{eat[rand(eat.size)]}"
    @hungry += 3
    @mood += 1
    plus_one_hour
  end

  def drink
    puts "#{@name} has drink"
    @hungry += 1
    plus_one_hour
  end

  def sleep
    puts "#{@name} has slept"
    @sleep += 3
    @hungry -= 1
    plus_one_hour
  end

  def play
    puts "#{@name} has play"
    @mood += 3
    @hungry -= 1
    plus_one_hour
  end

  def age
    puts "#{@name} has #{@age} year old."
  end

  def mood
    case @mood
    when 0..2
      puts 'Not good'
    when 3..5
      puts 'Good'
    when 6..15
      puts 'Very very good'
    end
  end

  def status
    puts 'At this moment your pet has next parameters:'
    puts "Name: #{@name}"
    puts "Age: #{@age}"
    puts "Hungry: #{@hungry}"
    puts "Mood: #{@mood}"
    puts "Sleep: #{@sleep}"
    puts "Death: #{@death}"
  end

  def hungry?
    puts @hungry <= 3 ? 'Pet wants to eat' : "Pet don't want to eat"
  end

  def help
    puts 'Select '
    puts "	'eat' if you want to feed your pet"
    puts "	'sleep' if you want to put your pet in bed"
    puts "	'play' if you want to play with your pet"
    puts "	'age' if you want to see age of your pet"
    puts "	'mood' if you want to see mood of your pet"
    puts "	'hungry?' if you want to see hunger level of your pet"
    puts "	'status' if you want to see current perameters"
  end

  private

  def plus_one_hour
    @hungry -= 1
    @mood -= 1
    @sleep -= 1

    death if @hungry < 0
  end

  def death
    @lifes -= 1
    @death = true
    puts 'Your pet is dead. Sorry :( '
    exit
  end
end

puts 'Type name of your new pet'
pet = Pet.new(gets.chomp)

loop do
  command = gets.chomp
  case command
  when 'eat'
    pet.eat
  when 'drink'
    pet.drink
  when 'sleep'
    pet.sleep
  when 'play'
    pet.play
  when 'mood'
    pet.mood
  when 'age'
    pet.age
  when 'hungry?'
    pet.hungry?
  when 'status'
    pet.status
  when 'help'
    pet.help
  when 'exit'
    exit
  else puts 'Something wrong.'
  end
end
