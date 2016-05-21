class Human
#population class variable for finding amount of humans
  @@population = 0
  #initialize method for humans to give them name and pet as well as count population
  def initialize(name, pet)
    @name = name
    @pet = pet
    @@population += 1
  end
  #class method for getting population
  def self.populationCount
    return @@population
  end
  #make pet make noise method for invoking the make noise method on the humans pet
  def makePetMakeNoise
    @pet.makeNoise(rand(10))
  end
  #feed pet method for invoking eat method on humans pet
  def feedPet
    @pet.eat
  end
end
class Pet
  def initialize(petName, noise, canMakeNoise)
    @petName = petName
    @noise = noise
    @canMakeNoise = canMakeNoise
  end
  def makeNoise(number)
    if @canMakeNoise == true
      while(number > 0)
        puts "#{@petName}: #{@noise}"
	number -= 1
      end
    else
      puts "#{@petName} *remains silent*"
    end
  end
  def eat
    puts "#{@petName} is eating"
  end
end
class Cat < Pet
  def eat
    super
    puts "Im still hungry, meow"
  end
end
class Dog < Pet
end
#create 4 pets (2 cats, 2 dogs)
pet1 = Dog.new("Charlie","Bark",true)
pet2 = Cat.new("Vincent","Meow",true)
pet3 = Dog.new("Buster", "Rooff",false)
pet4 = Cat.new("Lenny","Purr",false)
#create 4 humans (1 for each pet)
human1 = Human.new("John", pet1)
human2 = Human.new("Jennifer", pet2)
human3 = Human.new("Matt", pet3)
human4 = Human.new("Carly", pet4)
#list of humans to iterate through
humans = [human1, human2, human3, human4]
#iterator for humans list (uses 'h' as a variable for any human currently being used)
humans.each do |h|
  #invoke both human methods
  h.makePetMakeNoise
  h.feedPet
end
#puts the total human population ending the program
puts "The total number of humans is #{Human.populationCount}"