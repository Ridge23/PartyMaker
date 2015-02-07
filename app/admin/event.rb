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
      f.input :image, :required => false, :as => :file
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :description
      row :price
      row :country
      row :city
      row :date
      row :user
      row :image do
        image_tag(ad.image.url(:thumb), width: '100')
      end
    end
  end

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
