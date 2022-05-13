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
    items = Item.all.index_by(&:code)
    total_amount = 0

    list.each do |item|
      price = items[item[:code]].price
      total_amount += price * item[:amount]
    end

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
