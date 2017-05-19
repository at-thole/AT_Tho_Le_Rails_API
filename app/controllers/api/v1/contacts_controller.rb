class Api::V1::ContactsController < ApplicationController
  def create
    contact = Contact.create! contact_params
    if contact
      success = {success: {message: "Thanks for contact", status: 200}}
      render json: success
    else
      error = {error: {message: "Sorry, can't send contact", status: 400}}
      render json: error
    end
  end

  private
  def contact_params
    params.require(:contact).permit :username, :email, :content
  end
end
