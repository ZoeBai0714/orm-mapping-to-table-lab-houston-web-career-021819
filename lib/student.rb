class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  attr_accessor :name, :grade
  attr_reader :id
  @@all = []  
  
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.create_table
    DB[:conn].execute(
        "CREATE TABLE students(
          id INTEGER PRIMARY KEY,
          name TEXT,
          grade INTEGER
          );"
      )
  end
  
  def self.drop_table
    DB[:conn].execute(
        "DROP TABLE students;"
      )
  end
  
  def save
     DB[:conn].execute(
        "INSERT INTO students (name, grade) VALUES (?, ?)",
        [self.name, self.grade]
       )
     @id = DB[:conn].last_insert_row_id 
     
  end
  
  def self.create(name:,grade:)
    student = Student.new(name, grade) # @name = name  name is the value you pass in
    student.save
    student
  end
end
