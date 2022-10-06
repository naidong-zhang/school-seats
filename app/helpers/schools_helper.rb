module SchoolsHelper
  def show_grade_students(grade)
    grade.positive? ? grade.to_s : "--"
  end

  def show_primary_students(school)
    total = school.grade1 + school.grade2 + school.grade3 +
            school.grade4 + school.grade5 + school.grade6
    total.positive? ? total.to_s : "--"
  end

  def show_secondary_students(school)
    total = school.grade7 + school.grade8 + school.grade9 +
            school.grade10 + school.grade11 + school.grade12
    total.positive? ? total.to_s : "--"
  end
end
