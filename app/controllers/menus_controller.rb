class MenusController < ApplicationController
  load_and_authorize_resource except: [:index]

  def index
    @menus = Menu.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
  end

  def create
    @menu = Menu.new menu_params

    path = if params[:commit] == 'Save Menu'
             menus_path
           elsif params[:commit] == 'Save & Add New'
             new_menu_path
           end

    @menu.save
    respond_with @menu, location: path
  end

  def edit
  end

  def update
    @menu.update_attributes menu_params

    path = if params[:commit] == 'Update Menu'
             menus_path
           elsif params[:commit] == 'Save & Continue'
             edit_menu_path @menu
           end

    @menu.save
    respond_with @menu, location: path
  end

  def destroy
    @menu.destroy

    respond_with @menu, location: [:menus]
  end

  private

  def menu_params
    params.require(:menu).permit(:name, item_ids: [])
  end
end
