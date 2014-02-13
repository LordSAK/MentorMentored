namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(:First_Name => "Administrator",
                         email: "admin@admin.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    create_student = Students.create!(:student_mentor_subjects => " ")
create_student = Students.create!(:student_mentor_subjects => "AP Biology")
create_student = Students.create!(:student_mentor_subjects => "AP Calculus AB")
create_student = Students.create!(:student_mentor_subjects => "AP Calculus BC")
create_student = Students.create!(:student_mentor_subjects =>"AP Chemistry")
create_student = Students.create!(:student_mentor_subjects =>"AP Chinese")
create_student = Students.create!(:student_mentor_subjects =>"AP Comparitive Government and Politics")
create_student = Students.create!(:student_mentor_subjects =>"AP Computer Science")
create_student = Students.create!(:student_mentor_subjects =>"AP English Language")
create_student = Students.create!(:student_mentor_subjects =>"AP English Literature")
create_student = Students.create!(:student_mentor_subjects =>"AP Environmental Science")
create_student = Students.create!(:student_mentor_subjects =>"AP European History")
create_student = Students.create!(:student_mentor_subjects =>"AP French")
create_student = Students.create!(:student_mentor_subjects =>"AP German")
create_student = Students.create!(:student_mentor_subjects =>"AP Human Geography")
create_student = Students.create!(:student_mentor_subjects =>"AP Italian")
create_student = Students.create!(:student_mentor_subjects =>"AP Japanese")
create_student = Students.create!(:student_mentor_subjects =>"AP Latin")
create_student = Students.create!(:student_mentor_subjects =>"AP Microeconomics")
                    
create_student = Students.create!(:student_mentor_subjects =>"AP Music Theory")
create_student = Students.create!(:student_mentor_subjects =>"AP Physics B*")
create_student = Students.create!(:student_mentor_subjects =>"AP Physics C: Electricity and Magnetism*")
create_student = Students.create!(:student_mentor_subjects =>"AP Physics C: Mechanics*")
create_student = Students.create!(:student_mentor_subjects =>"AP Psychology")
create_student = Students.create!(:student_mentor_subjects =>"AP Russian")
create_student = Students.create!(:student_mentor_subjects =>"AP Spanish Language")
create_student = Students.create!(:student_mentor_subjects =>"AP Spanish Literature")
create_student = Students.create!(:student_mentor_subjects =>"AP Statistics")
create_student = Students.create!(:student_mentor_subjects =>"AP Studio Art")
create_student = Students.create!(:student_mentor_subjects =>"AP Art History")
create_student = Students.create!(:student_mentor_subjects =>"AP US History")
create_student = Students.create!(:student_mentor_subjects =>"AP US Government and Politics")
create_student = Students.create!(:student_mentor_subjects =>"AP World History")
                    
create_student = Students.create!(:student_mentor_subjects =>"SAT Biology E/M")
create_student = Students.create!(:student_mentor_subjects => "SAT Chemistry")
create_student = Students.create!(:student_mentor_subjects =>"SAT Physics")
create_student = Students.create!(:student_mentor_subjects =>"SAT French")
create_student = Students.create!(:student_mentor_subjects =>"SAT German")
create_student = Students.create!(:student_mentor_subjects =>"SAT Spanish")
create_student = Students.create!(:student_mentor_subjects =>"SAT Hebrew")
create_student = Students.create!(:student_mentor_subjects =>"SAT Latin");
create_student = Students.create!(:student_mentor_subjects =>"SAT Mandarin Chinese")
create_student = Students.create!(:student_mentor_subjects =>"SAT Korean")
create_student = Students.create!(:student_mentor_subjects =>"SAT English")
create_student = Students.create!(:student_mentor_subjects =>"SAT US History")
create_student = Students.create!(:student_mentor_subjects =>"SAT World History")
                    
create_student = Students.create!(:student_mentor_subjects =>"Mechanical Engineering")
create_student = Students.create!(:student_mentor_subjects =>"Electrical Engineering")
create_student = Students.create!(:student_mentor_subjects =>"Chemical Engineering")
create_student = Students.create!(:student_mentor_subjects =>"Molecular Engineering")
create_student = Students.create!(:student_mentor_subjects =>"Materials Engineering")
create_student = Students.create!(:student_mentor_subjects =>"Civil Engineering")
create_student = Students.create!(:student_mentor_subjects =>"Medicine Studies")
create_student = Students.create!(:student_mentor_subjects =>"Organic Chemistry")
create_student = Students.create!(:student_mentor_subjects =>"Foreign Service")
create_student = Students.create!(:student_mentor_subjects =>"Comparative Literature")
create_student = Students.create!(:student_mentor_subjects =>"Guitar")
create_student = Students.create!(:student_mentor_subjects =>"Flute")
create_student = Students.create!(:student_mentor_subjects =>"Violin")
create_student = Students.create!(:student_mentor_subjects =>"Piano")
create_student = Students.create!(:student_mentor_subjects =>"Voice")
                    












create_entre = Entrepreneurs.create(:entrepreneurs_mentor_subjects => " ")
create_entre = Entrepreneurs.create(:entrepreneurs_mentor_subjects =>"Startup Business")
create_entre = Entrepreneurs.create(:entrepreneurs_mentor_subjects =>"Team Management")
create_entre = Entrepreneurs.create(:entrepreneurs_mentor_subjects =>"Marketing")
create_entre = Entrepreneurs.create(:entrepreneurs_mentor_subjects =>"Resource Allocation")
create_entre = Entrepreneurs.create(:entrepreneurs_mentor_subjects =>"Finance Management")






create_veterans =Veterans.create!(:veteran_mentor_subjects =>" ")
create_veterans =Veterans.create!(:veteran_mentor_subjects =>"Career Advice")
create_veterans =Veterans.create!(:veteran_mentor_subjects =>"Education Advice")
create_veterans =Veterans.create!(:veteran_mentor_subjects =>"Adjusting to civilian Life")
create_veterans =Veterans.create!(:veteran_mentor_subjects =>"Finance Management")
create_veterans =Veterans.create!(:veteran_mentor_subjects =>"Family Management")
create_veterans =Veterans.create!(:veteran_mentor_subjects =>"Post-war psychological aid")


  end
end