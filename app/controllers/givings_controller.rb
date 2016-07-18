class GivingsController < ApplicationController
  before_action :authenticate_user!
  #load_and_authorize_resource
  before_action :set_church
  before_action :set_members
  before_action :set_giving, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /givings
  # GET /givings.json
  def index
    @givings = @church.givings
  end

  # GET /givings/1
  # GET /givings/1.json
  def show
  end

  # GET /givings/new
  def new
    @giving = Giving.new
  end

  # GET /givings/1/edit
  def edit
  end

  # POST /givings
  # POST /givings.json
  def create
    @giving = Giving.new(giving_params)
    @giving.church_id = @church.id
    respond_to do |format|
      if @giving.save
        format.html { redirect_to [@church, @giving], notice: 'Giving was successfully created.' }
        format.json { render :show, status: :created, location: @giving }
      else
        format.html { render :new }
        format.json { render json: @giving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /givings/1
  # PATCH/PUT /givings/1.json
  def update
    respond_to do |format|
      if @giving.update(giving_params)
        format.html { redirect_to [@church, @giving], notice: 'Giving was successfully updated.' }
        format.json { render :show, status: :ok, location: @giving }
      else
        format.html { render :edit }
        format.json { render json: @giving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /givings/1
  # DELETE /givings/1.json
  def destroy
    @giving.destroy
    respond_to do |format|
      format.html { redirect_to givings_url, notice: 'Giving was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_giving
      @giving = Giving.find(params[:id])
    end

    def set_church
      @church = current_user.church
    end

    def set_members
      @members = current_user.church.members
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def giving_params
      params.require(:giving).permit(:church_id, :member_id, :amount, :date_given, :giving_type)
    end
end