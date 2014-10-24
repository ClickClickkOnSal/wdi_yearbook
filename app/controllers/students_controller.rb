class StudentsController < ApplicationController

  def index
    @student = Student.all
  end

  def create
    @student = Student.new(params[:student])
    if @student.save 
      respond_to do |format|
        format.html { redirect_to @student}
        format.json { render :json, @student}
      end
    else 
      respond_to do |format|
        format.html { render "new" }
        format.json { render status: 404}
      end
    end
  end

  def show
    @student = Student.find(params[:student])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student]) 
      respond_to do |format|
        format.html { redirect_to @student}
        format.json { render :json, @student}
      end
    else 
      respond_to do |format|
        format.html { render "edit" }
        format.json { render status: 404}
      end
    end
  end

end