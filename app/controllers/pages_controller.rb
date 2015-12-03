class PagesController < ApplicationController

def index
  @contacts = Group.all
  if params[:category]
    @contacts = Category.find_by(name: params[:category]).pages
  else
    @contacts = Contact.all
  end
end

def search
    search_term = params[:search]
    @contacts = Contact.where("first_name LIKE '%#{search_term}%' OR last_name LIKE '%#{search_term}%'")
    render :index
end

def new
end

def create
  first_name = params[:first_name]
  middle_name = params[:middle_name]
  last_name = params[:last_name]
  email = params[:email]
  phone_number = params[:phone_number]
  bio = params[:bio]
  address = params[:address]
  coordinates = Geocoder.coordinates(address)
  latitude = coordinates[0]
  longitude = coordinates[1]
  Contact.create(first_name: first_name, middle_name: middle_name, last_name: last_name, email: email, phone_number: phone_number, bio: bio, address: address, latitude: latitude, longitude: longitude)
  redirect_to "/contacts/#{}"
  flash[:success] = "Contact Created: #{name}"
end

def show
  id = params[:id]
  @contact = Contact.find_by(id: id)
end

def edit
  id = params[:id]
  @contact = Contact.find_by(id: id)
end

def update
  id = params[:id]
  contact = Contact.find_by(id: id)

  first_name = params[:first_name]
  middle_name = params[:middle_name]
  last_name = params[:last_name]
  email = params[:email]
  phone_number = params[:phone_number]
  bio = params[:bio]
  address = params[:address]
  coordinates = Geocoder.coordinates(address)
  latitude = coordinates[0]
  longitude = coordinates[1]
  contact.update(first_name: first_name, middle_name: middle_name, last_name: last_name, email: email, phone_number: phone_number, bio: bio, address: address,latitude: latitude, longitude: longitude)
  flash[:success] = "Contact Updated: #{first_name}"
  redirect_to "/contacts/#{contact.id}"
end

def destroy
  id = params[:id]
  contact = Contact.find_by(id: id)
  contact.destroy
  redirect_to "/contacts"
  flash[:danger] = "Contact Deleted: #{contact.first_name}"
end

end