class ChurchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_church, only: [:show, :edit, :update, :destroy]
  layout "admin", only:[:index, :show]

  # GET /churches
  # GET /churches.json
  def index
    @church = current_user.church
    authorize @church
  end

  # GET /churches/1
  # GET /churches/1.json
  def show
    authorize @church
    @members = @church.members
    @givings = @church.givings
    @year_to_date = @givings.where(date_given: Time.now.beginning_of_year..Time.now.end_of_month).
      group_by_month(:date_given).sum(:amount)
    @monthly_givings = @church.givings.where(date_given: Time.now.beginning_of_month..Time.now.end_of_month).
      sum(:amount)
    @giving_types = @church.giving_types
    @groups = @church.groups.joins(:group_members).group("groups.name").count
  end

  # GET /churches/new
  def new
    @church = Church.new
    authorize @church
  end

  # GET /churches/1/edit
  def edit
    authorize @church
  end

  # POST /churches
  # POST /churches.json
  def create
    @church = Church.new(church_params)
    authorize @church
    respond_to do |format|
      if @church.save
        format.html { redirect_to churches_url, notice: 'Church was successfully created.' }
        format.json { render :show, status: :created, location: @church }
      else
        format.html { render :new }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /churches/1
  # PATCH/PUT /churches/1.json
  def update
    authorize @church
    respond_to do |format|
      if @church.update(church_params)
        format.html { redirect_to church_path(@church), notice: 'Church was successfully updated.' }
        format.json { render :show, status: :ok, location: @church }
      else
        format.html { render :edit }
        format.json { render json: @church.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /churches/1
  # DELETE /churches/1.json
  def destroy
    authorize @church
    @church.destroy
    respond_to do |format|
      format.html { redirect_to churches_url, notice: 'Church was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church
      @church = Church.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def church_params
      params.require(:church).permit(:name, :denomination, :church_image)
    end
end
