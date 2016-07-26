class StoresController < ApplicationController

  def index
    stores = Store.all
    render json: stores
  end

  def show
    # store = Store.find(params[:id])
    # render json: store
    render text: 'I am not json'
  end
end
