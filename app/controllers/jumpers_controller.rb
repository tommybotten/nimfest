class JumpersController < ApplicationController
  before_action :set_jumper, only: [:show, :edit, :update, :destroy]

  # GET /jumpers
  # GET /jumpers.json
  def index
    @jumpers = Jumper.order(:name)
  end

  # GET /jumpers/1
  # GET /jumpers/1.json
  def show
  end

  # GET /jumpers/new
  def new
    @jumper = Jumper.new
  end

  # GET /jumpers/1/edit
  def edit
  end

  # POST /jumpers
  # POST /jumpers.json
  def create
    @jumper = Jumper.new(jumper_params)
    respond_to do |format|
      if @jumper.save
        format.html { redirect_to @jumper, notice: 'Jumper was successfully created.' }
        format.json { render action: 'show', status: :created, location: @jumper }
      else
        format.html { render action: 'new' }
        format.json { render json: @jumper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jumpers/1
  # PATCH/PUT /jumpers/1.json
  def update
    respond_to do |format|
      if @jumper.update(jumper_params)
        format.html { redirect_to @jumper, notice: 'Jumper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @jumper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jumpers/1
  # DELETE /jumpers/1.json
  def destroy
    @jumper.destroy
    respond_to do |format|
      format.html { redirect_to jumpers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jumper
      @jumper = Jumper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jumper_params
      params.require(:jumper).permit(:name, :license, :description, :phone, :email, :verified,:nextofkin_address,:nextofkin_relation, :nextofkin_phone,:nextofkin_name, :licensenumber, club_ids:[], rating_ids: [])
    end
end
