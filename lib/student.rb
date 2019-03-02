class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  attr_accessor :name, :grade
  attr_reader :id
  @@all = []  
  
  def initialize(name, grade)
    @name = name
    @grade = grade
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create_table
    DB[:conn].execute(
      )
  end
end
