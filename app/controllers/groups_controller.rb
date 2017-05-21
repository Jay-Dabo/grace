class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_church
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :church
  load_and_authorize_resource :group, through: :church
  helper_method :sort_column, :sort_direction
  layout "admin"

  # GET /groups
  # GET /groups.json
  def index
    @groups = @church.groups.all
    @partial = params[:view] || "groups_grid"
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group_members = @group.group_members
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.church_id = @church.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to [@church, @group], notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to [@church, @group], notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to church_groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    def set_church
      @church = current_user.church
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description, :group_image)
    end
end
