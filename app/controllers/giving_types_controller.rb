class GivingTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_church
  before_action :authorize_church?
  before_action :set_giving_type, only: [:show, :edit, :update, :destroy]
  before_action :authorize_giving_type?, except: [:index, :new, :create]
  helper_method :sort_column, :sort_direction
  layout "admin"

  # GET /giving_types
  # GET /giving_types.json
  def index
    @giving_types = @church.giving_types.search(params[:search]).order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.csv { send_data @giving_types.to_csv }
      format.js
    end
  end

  # GET /giving_types/1
  # GET /giving_types/1.json
  def show
  end

  # GET /giving_types/new
  def new
    @giving_type = GivingType.new
  end

  # GET /giving_types/1/edit
  def edit
  end

  # POST /giving_types
  # POST /giving_types.json
  def create
    @giving_type = GivingType.new(giving_type_params)
    @giving_type.church_id = @church.id
    respond_to do |format|
      if @giving_type.save
        format.html { redirect_to [@church, @giving_type], notice: 'Giving type was successfully created.' }
        format.json { render :show, status: :created, location: @giving_type }
      else
        format.html { render :new }
        format.json { render json: @giving_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /giving_types/1
  # PATCH/PUT /giving_types/1.json
  def update
    authorize @giving_type
    respond_to do |format|
      if @giving_type.update(giving_type_params)
        format.html { redirect_to [@church, @giving_type], notice: 'Giving type was successfully updated.' }
        format.json { render :show, status: :ok, location: @giving_type }
      else
        format.html { render :edit }
        format.json { render json: @giving_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /giving_types/1
  # DELETE /giving_types/1.json
  def destroy
    @giving_type.destroy
    respond_to do |format|
      format.html { redirect_to church_giving_types_url, notice: 'Giving type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def sort_column
      Member.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_giving_type
      @giving_type = GivingType.find(params[:id])
    end

    def set_church
      @church = Church.find(params[:church_id])
    end

    def authorize_giving_type?
      authorize @giving_type
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def giving_type_params
      params.require(:giving_type).permit(:name, :church_id)
    end
end
