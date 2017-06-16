class NomadsController < ApplicationController
  def show
  	@nomad = Nomad.find(params[:id])
  	@trips = @nomad.trips	

prepare_meta_tags(title: @nomad.name,
                      description: @nomad.description.truncate(50), 
                      keywords: @nomad.name.split(","),
                      image: @nomad.avatar,
                      og: {
        url: request.original_url,
        site_name: @nomad.name,
        title: @nomad.name,
        image: @nomad.avatar,
        description: @nomad.description,
        type: 'website'
      },
        twitter: {
        site_name: @nomad.name,
        site: '@nomada5',
        card: 'summary',
        description: @nomad.description,
        image: @nomad.avatar,
      }
      )

  end
end
