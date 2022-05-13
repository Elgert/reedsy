class ItemsController < ApplicationController
  def index
    items = Item.all

    render json: items
  end

  def update_price
    item = Item.find_by(code: update_params[:code])

    return not_found unless item

    if item.update(update_params)
      render json: item, status: :ok
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end

  def check_list_price
    list = check_list_params

    total_amount = Item.get_list_price(list)

    render json: { total: total_amount }
  end
end

private

def update_params
  params.require(:item).permit(:code, :price)
end

def check_list_params
  params.require(:list)
end
