class Student
  attr_accessor :courses, :first_name, :last_name

  def initialize(fName, lName)
    @first_name = fName
    @last_name = lName
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(course)
    if self.courses.include?(course)
      return
    end
    raise "course would cause conflict!" if has_conflict?(course)

    self.courses << course
    course.students << self
  end

  def course_load
    hsh = Hash.new(0)
    self.courses.each do |ele|
      hsh[ele.department] += ele.credits
    end

    hsh
  end

  def has_conflict?(new_course)
    self.courses.any? do |ele|
      new_course.conflicts_with?(ele)
    end
  end
end
