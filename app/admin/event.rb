ActiveAdmin.register Event do
  permit_params :name, :description, :date, :genre, :price, :country, :city

  index do
    selectable_column
    id_column
    column :name
    column :country
    column :date
    column :created_at
    column :user
    column :price
    actions
  end

  filter :name
  filter :country
  filter :price


  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :country, :input_html => {
                          :onchange => remote_request(:get, dynamic_select_cities_path, { :country_id => "$('#event_country_id').val()" }, :event_city_id)
                      }
      f.input :city, collection: City.where(:country_id => event.country_id)
      f.input :date
      f.input :genres
      f.input :user
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  controller do
    def permitted_params
      params.permit!
    end

    def change_cities
      @cities = City.find_by_id(params[:country_id]).try(:cities)
      render :text => view_context.options_from_collection_for_select(@cities, :id, :name)
    end
  end

end
