class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_church
  before_action :authorize_church?
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authorize_group?, except: [:index, :new, :create]
  helper_method :sort_column, :sort_direction
  layout "admin"

  # GET /groups
  # GET /groups.json
  def index
    @groups = @church.groups.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @groups.to_csv }
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
    def sort_column
      Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    def set_church
      @church = Church.find(params[:church_id])
    end

    def authorize_group?
      authorize @group
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :description, :group_image)
    end
end
