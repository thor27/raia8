class PaymentsController < ApplicationController
  before_filter :set_student
  
  def index
    @payments = @student.payments
    respond_with(@payments)
  end

  def show
    @payment = Payment.find(params[:id])
    respond_with(@payment)
  end

  def new
    @payment = @student.payments.new
    respond_with(@payment)
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def create
    @payment = @student.payments.new(params[:payment])
    @payment.save
    respond_with([@student,@payment])
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.update_attributes(params[:payment])
    respond_with([@student,@payment])
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    respond_with([@student,@payment])
  end
  
  private
  def set_student
    @student = Student.find(params[:student_id])
  end
end
