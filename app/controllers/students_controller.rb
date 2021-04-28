require 'pry'

class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    if @student.active
      @message = "This student is currently active." 
    else 
      @message = "This student is currently inactive."
    end
  end

  def activate
    # binding.pry
    @student = Student.find(params[:id])
    # if @student.active
    #   @student.active = false
    # else 
    #   @student.active = true
    # end
    @student.active = !@student.active
    @student.save
    redirect_to action: "show"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    

end