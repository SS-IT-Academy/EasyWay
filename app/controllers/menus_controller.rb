class MenusController < ApplicationController
  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @bookmark= Bookmark.all
    @menu = Menu.new
    
      @params = request.params
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end
 
  

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
    @bookmark = Bookmark.all
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end
  
  def  delete_menu_item
    @menu = Menu.find(params[:menu_item_id])
    @menu.destroy
    render :json => @menu.to_json
  end
  
  def render_menu
   @role_id=params[:role_id]
   render :partial => 'menus/manage_menu', :locals =>{:menu =>Menu.where('role_id = ?', params[:role_id])}
  end
  
  def render_form_for_menu
      @role=params[:role_id]
      @parent_id=params[:parent_id]
      render :partial => 'menus/formRoles', :locals =>{:@menu =>Menu.new, :@bookmark=> Bookmark.all}
  end
end
   