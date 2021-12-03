class StudentsController < ApplicationController
  def index
    @students = Student.all.order(created_at: :desc)
  end

  def onlyWomen
    @students = Student.where("gender LIKE ?", '%female%').order(created_at: :desc)
  end

  def onlyFourthYear
    @students = Student.where("year == ?", 4).order(created_at: :desc)
  end

  def older20
    @students = Student.where("age >= ?", 20).order(created_at: :desc)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to root_path
  end



  private
  def student_params
    params.require(:student).permit(:name, :surname, :middlename, :gender, :age, :year)
  end
end
