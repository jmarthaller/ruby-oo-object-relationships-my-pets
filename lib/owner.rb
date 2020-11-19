require 'pry'

class Owner
    attr_reader :name, :species

    @@all = []

    def initialize(name, species="human")
      @name = name
      @species = species
      @@all << self
    end

    def say_species  
      return "I am a #{self.species}."
    end

    def self.all
      @@all
    end

    def self.count
      Owner.all.count
    end


    def self.reset_all
      Owner.all.clear
    end

    def cats 
      Cat.all.find_all { |cat| cat.owner == self }
    end

    def dogs 
      Dog.all.find_all { |dog| dog.owner == self }
    end

    def buy_cat(cat)
      Cat.new(cat, self)
    end

    def buy_dog(dog)
      Dog.new(dog, self)
    end


    def walk_dogs
     self.dogs.each do |dog| 
        dog.mood = "happy"
      end
    end


    def feed_cats
      self.cats.each do |cat| 
        cat.mood = "happy" 
      end
    end

    def sell_pets
      pets = cats + dogs

      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
    end



    def list_pets
      return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
end



