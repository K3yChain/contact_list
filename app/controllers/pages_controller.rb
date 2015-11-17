class PagesController < ApplicationController

def index
  @contacts = Contact.all
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
  Contact.create(first_name: first_name, middle_name: middle_name, last_name: last_name, email: email, phone_number: phone_number, bio: bio)
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
  contact.update(first_name: first_name, middle_name: middle_name, last_name: last_name, email: email, phone_number: phone_number, bio: bio)
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