class GroupMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_church
  before_action :authorize_church?
  before_action :set_group
  before_action :set_members
  before_action :set_group_member, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /group_members
  # GET /group_members.json
  def index
    @group_members = @group.group_members
  end

  # GET /group_members/1
  # GET /group_members/1.json
  def show
  end

  # GET /group_members/new
  def new
    @group_member = GroupMember.new
  end

  # GET /group_members/1/edit
  def edit
  end

  # POST /group_members
  # POST /group_members.json
  def create
    @group_member = GroupMember.new(group_member_params)
    @group_member.group_id = @group.id
    respond_to do |format|
      if @group_member.save
        format.html { redirect_to [@church, @group], notice: 'Group member was successfully created.' }
        format.json { render :show, status: :created, location: @group_member }
      else
        format.html { render :new }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_members/1
  # PATCH/PUT /group_members/1.json
  def update
    respond_to do |format|
      if @group_member.update(group_member_params)
        format.html { redirect_to [@church, @group], notice: 'Group member was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_member }
      else
        format.html { render :edit }
        format.json { render json: @group_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_members/1
  # DELETE /group_members/1.json
  def destroy
    @group_member.destroy
    respond_to do |format|
      format.html { redirect_to [@church, @group], notice: 'Group member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_member
      @group_member = GroupMember.find(params[:id])
    end

    def set_church
      @church = Church.find(params[:church_id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_members
      @members = @church.members
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_member_params
      params.require(:group_member).permit(:group_id, :member_id)
    end
end
