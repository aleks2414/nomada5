class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :set_trip
  before_action :authenticate_nomad!, only: [:new, :edit]

  
  def map
    @experiences = Experience.all
  end

  # GET /experiences
  # GET /experiences.json
  def index
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @photos = @experience.photos
    @reviews = @experience.reviews
    @experiences = @trip.experiences


if @photos.present?
    prepare_meta_tags(title: @experience.title,
                      description: @experience.description.truncate(50), 
                      keywords: @experience.title.split(","),
                      image: @experience.photos[0].image,
                      og: {
        url: request.original_url,
        site_name: @experience.title,
        title: @experience.title,
        image: @experience.photos[0].image,
        description: @experience.description,
        type: 'website'
      },
        twitter: {
        site_name: @experience.title,
        site: '@nomada5',
        card: 'summary',
        description: @experience.description,
        image: @experience.photos[0].image,
      }
      )
  end

  end

  # GET /experiences/new
  def new
    @experience = @trip.experiences.new
  end

  # GET /experiences/1/edit
  def edit
@photos = @experience.photos
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.trip_id = @trip.id
    @experience.nomad_id = current_nomad.id

if @experience.save

      if params[:images] 
        params[:images].each do |image|
          @experience.photos.create(image: image)
        end
      end

      @photos = @experience.photos
      redirect_to edit_trip_experience_path(@trip, @experience), notice: "Saved..."
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

      redirect_to edit_trip_experience_path(@trip,@experience), notice: "Updated..."
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

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:title, :description, :vista, :olfato, :gusto, :oido, :tacto, :latitude, :longitude, :expe, :money, :currency, :aprox_time, :gente, :idioma, :is_risky, :is_internet, :is_reservation, :website, :advice, :nomad_id, :address, :pais, :ciudad)
    end
end
