class BathsController < ApplicationController
  before_action :set_bath, only: [:show, :edit, :update, :destroy]

  # GET /baths
  # GET /baths.json
  def index
    @baths = Bath.all
  end

  # GET /baths/1
  # GET /baths/1.json
  def show
  end

  # GET /baths/new
  def new
    @bath = Bath.new
  end

  # GET /baths/1/edit
  def edit
  end

  # POST /baths
  # POST /baths.json
  def create
    @bath = Bath.new(bath_params)

    respond_to do |format|
      if @bath.save
        format.html { redirect_to @bath, notice: 'Bath was successfully created.' }
        format.json { render :show, status: :created, location: @bath }
      else
        format.html { render :new }
        format.json { render json: @bath.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baths/1
  # PATCH/PUT /baths/1.json
  def update
    respond_to do |format|
      if @bath.update(bath_params)
        format.html { redirect_to @bath, notice: 'Bath was successfully updated.' }
        format.json { render :show, status: :ok, location: @bath }
      else
        format.html { render :edit }
        format.json { render json: @bath.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baths/1
  # DELETE /baths/1.json
  def destroy
    @bath.destroy
    respond_to do |format|
      format.html { redirect_to baths_url, notice: 'Bath was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bath
      @bath = Bath.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bath_params
      params.require(:bath).permit(:amount_spent, :date, :ideal_amount, :time_spent)
    end
end
