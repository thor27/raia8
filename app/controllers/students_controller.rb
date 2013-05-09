class StudentsController < ApplicationController
  def index
    if params[:query].present?
      @students = Student.where('name LIKE ?', "%#{params[:query]}%")
    else
      @students = Student
    end
    @students = @students.page(params[:page]).per(4)
    respond_with(@students)
  end

  def show
    @student = Student.find(params[:id])
    respond_with(@student)
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params[:student])
    @student.save
    respond_with(@student)
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attributes(params[:student])
    respond_with(@student)
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    respond_with(@student)
  end
  
  def set_state
    @student = Student.find(params[:id])
    @student.state = params[:state]
    if @student.save
      flash[:notice] = "Student state updated to #{params[:state]}"
    else
      flash[:alert] = @student.errors[:state].join ', '
    end
    respond_with(@student) do |format|
      format.html do
        redirect_to(@student)
      end
    end
  end
end
