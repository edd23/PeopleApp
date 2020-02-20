class PeopleController < ApplicationController
  before_action :set_people, only: [:show, :edit, :update, :destroy]
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @people = Person.new
  end

  def create
    @person = Person.new(people_params)

    if @person.save
      redirect_to people_path
    else
      render 'new'
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(people_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def destroy
    @people.destroy
    redirect_to people_path
  end

  def edit
    @person = Person.find(params[:id])
  end

  private
  def set_people
    @people = Person.find(params[:id])
  end


    def people_params
      params.require(:person).permit(:full_name, :age, :hair_color, :eye_color, :gender, :alive)
    end
end
