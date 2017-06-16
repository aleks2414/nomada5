class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?


before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Nomada 5"
    title       = site_name
    description = "The new way to share your world trips through experiences"
    image       = options[:image] || "http://www.nomada5.com/assets/logo.png"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[trip journeys experiences travel travelers backpackers backpack vactions world_office],
      twitter: {
        site_name: site_name,
        site: '@nomada5',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
  # ...

  
  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :description, :facebook, :twitter, :instagram, :website, :photo, :pais, :ciudad, :admin, :avatar) }
end


def stored_location_for(resource)
  nil
end

def after_sign_in_path_for(resource)
    edit_nomad_registration_path
end

def after_sign_up_path_for(resource)
    edit_nomad_registration_path
end

end
