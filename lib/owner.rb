require 'pry'

class Owner
  attr_reader :name, :species
  attr_writer 
  attr_accessor
  

  @@all = []


  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end


  def say_species
    "I am a #{@species}."
  end


  def self.all
    @@all.map {|owner| owner}
    # binding.pry
  end


  def self.count
    @@all.count
    # binding.pry
  end


  def self.reset_all
    @@all.clear
  end


  def cats
    # returnsa a collection of all the cats that belong to the owner
    Cat.all.select do |cat|
      cat.owner == self
      # binding.pry
    end
  end


  def dogs 
    Dog.all.select do |dog|
      dog.owner == self
      # binding.pry
    end
  end


  def buy_cat(name)
    # can buy a cat that is an instance of the Cat class
    # knows about its cats
    Cat.new(name, self)
  end


  def buy_dog(name)
    Dog.new(name, self)
  end

  
  def walk_dogs
    # walks the dogs which makes the dogs' moods happy
    self.dogs.each do |dog|
      dog.mood == "happy" ? nil : dog.mood = "happy"
    end
  end


  def feed_cats
    # feeds cats which makes the cats' moods happy
    self.cats.each do |cat|
      cat.mood == "happy" ? nil : cat.mood = "happy"
    end
  end


  def sell_pets
    # can sell all its pets, which makes them nervous
    # can sell all its pets, which leaves them without an owner
    owned_pets = Cat.all + Dog.all
    owned_pets.each do |pet|
      # binding.pry
    pet.owner = nil
    pet.mood = "nervous"
    end
    
  end


  def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.dogs.count} cat(s)."
  end


end

