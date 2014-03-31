class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render :index
  end

  def show
    @contact = Contact.find(params[:id])
    render :show
  end

  def new
    @contact = Contact.new
    render :new
  end

  def create
    @contact = Contact.create(:name => params[:name],
                              :email => params[:email],
                              :phone => params[:phone])
    if @contact.save
      render :success
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    render :edit
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(:name => params[:name],
                        :email => params[:email],
                        :phone => params[:phone])
      render :success
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render :destroy
  end
end
