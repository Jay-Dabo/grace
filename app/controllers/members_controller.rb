class MembersController < ApplicationController
  before_action :authenticate_user!
  #load_and_authorize_resource
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_church
  layout "admin"

  # GET /members
  # GET /members.json
  def index
    @members = @church.members.search(params[:search]).paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @members.to_csv}
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @member.church_id = @church.id
    respond_to do |format|
      if @member.save
        format.html { redirect_to [@church, @member], notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to [@church, @member], notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to church_members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    def set_church
      @church = current_user.church
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:first_name, :last_name, :gender, :birthday, :email, :phone, :address, :city, :state, :postal_code, :interest, :member_image)
    end
end
