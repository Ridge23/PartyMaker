ActiveAdmin.register Event do
  permit_params :name, :description, :date, :genre, :price, :country, :city

  index do
    selectable_column
    id_column
    column :name
    column :country
    column :city
    column :date
    column :created_at
    column :user
    column :price
    actions
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :country
      f.input :city
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
  end

end
