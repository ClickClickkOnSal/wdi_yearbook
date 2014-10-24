class StudentsController < ApplicationController

  def index
    @student = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save 
      respond_to do |format|
        format.html { redirect_to @student }
        format.json { render :json, @student }
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

    respond_to do  |format|
      format.html
      format.json { render json: @student }
    end 
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student]) 
      respond_to do |format|
        format.html { redirect_to @student }
        format.json { render json: @student }
      end
    else 
      respond_to do |format|
        format.html { render "edit" }
        format.json { render status: 404 }
      end
    end
  end

  def destroy
    @student = Student.find(params[:id])

    if @student.destroy
      respond_to do |format|
        format.html { redirect_to @students }
        format.json { render json: {} }
      end 
    else
      respond_to do |format|
        format.html { redirect_to @student }
        format.json { render status: 404 }
      end  
    end 
  end

end