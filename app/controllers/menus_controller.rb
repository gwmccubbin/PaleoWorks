class MenusController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    # [@breakfasts, @lunches, @dinners].each { |i| i  = Array.new(3) { @menu.menu_items.build } }
    @breakfasts = Array.new(3) { @menu.menu_items.build }
    
  end

  def create
    binding.pry
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # def menu_params
  #   params.require(:menu).permit(:item)
  # end
end
