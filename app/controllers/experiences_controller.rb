class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_nomad!, only: [:new, :edit]

  
  def map
    @experiences = Experience.all
  end

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @photos = @experience.photos
    @reviews = @experience.reviews
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit

    if current_nomad.id == @experience.nomad.id
      @photos = @experience.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end

  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.nomad_id = current_nomad.id

if @experience.save

      if params[:images] 
        params[:images].each do |image|
          @experience.photos.create(image: image)
        end
      end

      @photos = @experience.photos
      redirect_to edit_experience_path(@experience), notice: "Saved..."
    else
      render :new
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    if @experience.update(experience_params)

      if params[:images] 
        params[:images].each do |image|
          @experience.photos.create(image: image)
        end
      end

      redirect_to edit_experience_path(@experience), notice: "Updated..."
    else
      render :edit
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:title, :description, :vista, :olfato, :gusto, :oido, :tacto, :latitude, :longitude, :expe, :money, :currency, :aprox_time, :gente, :idioma, :is_risky, :is_internet, :is_reservation, :website, :advice, :nomad_id, :address, :pais, :ciudad)
    end
end
