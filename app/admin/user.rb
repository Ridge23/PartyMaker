ActiveAdmin.register User do
  permit_params :email, :name, :password, :password_confirmation, :role, :country, :city
  menu priority: 120
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :role
    column :country
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :role
  filter :country
  filter :genres

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :country, :input_html => {
                          :onchange => remote_request(:get, dynamic_select_cities_path, { :country_id => "$('#user_country_id').val()" }, :user_city_id)
                      }
      f.input :city, collection: City.where(:country_id => user.country_id)
      f.input :genres
    end
    f.actions
  end

  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

    def permitted_params
      params.permit!
    end
  end
end
