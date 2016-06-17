class BathsController < ApplicationController
  before_filter :require_login
  before_action :set_bath, only: [:index, :show, :edit, :update, :destroy]

  # GET /baths
  # GET /baths.json
  def index
    @baths = Bath.all
    respond_to do |format|
      format.html
      format.json { render json: BathsDatatable.new(view_context, @user) }
    end
  end

  # GET /baths/1
  # GET /baths/1.json
  def show
  end

  # GET /baths/new
  def new
    @user = current_user
    @bath = Bath.new
  end

  # GET /baths/1/edit
  def edit
  end

  # POST /baths
  # POST /baths.json
  def create
    # binding.pry
    banho = params[:Banhos]
    File.open(Rails.root.join('public', banho.original_filename), 'wb') do |file|
      file.write(banho.tempfile.read)
    end
    redirect_to user_baths_path(current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bath
      @user = current_user
      if @user && logged_in?
        @bath = Bath.where(user_id: @user.id)
      else
        redirect_to 'root'
      end
    end
end
