class StudentsController < ApplicationController
  def index
    @students = Student.all.order(created_at: :desc)
  end

  def dormitory
    @students = Student.where(dormitory: 'true').order(created_at: :desc)
  end

  def teachers_with_stand
    @students = Student.where("teaching_experience > ?", 2).order(created_at: :desc)
  end

  def pedagogical_school
    @students = Student.where("school LIKE ?", '%Pedagogical%').order(created_at: :desc)
  end

  def language_groups
    @languages = Student.select(:second_language).distinct
  end

  def language_group
    @students = Student.where('second_language == ?', params[:language])
    @language = params[:language]
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
    params.require(:student).permit(:surname, :dormitory, :experience, :teaching_experience, :school, :second_language)
  end
end
