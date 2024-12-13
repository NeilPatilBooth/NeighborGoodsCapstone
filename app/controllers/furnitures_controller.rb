class FurnituresController < ApplicationController
  def index
    #matching_furnitures = Furniture.all

    #@list_of_furnitures = matching_furnitures.order({ :created_at => :desc })
    @available_furnitures = Furniture.where(borrower_id: nil)
    @borrowed_furnitures = Furniture.where.not(borrower_id: nil)

    render({ :template => "furnitures/index" })
  end

  def show
    the_id = params.fetch("id")

    matching_furnitures = Furniture.where({ :id => the_id })

    @the_furniture = matching_furnitures.at(0)

    render({ :template => "furnitures/show" })
  end

  def create
    the_furniture = Furniture.new
    the_furniture.furniture_name = params.fetch("query_furniture_name")
    the_furniture.furniture_image = params.fetch("query_furniture_image")
    the_furniture.furniture_description = params.fetch("query_furniture_description")
    the_furniture.owner_id = current_user.id
    #the_furniture.rent_start = params.fetch("query_rent_start")
    #the_furniture.rent_end = params.fetch("query_rent_end")
    #the_furniture.borrower_id = params.fetch("query_borrower_id")
    #the_furniture.comments_count = params.fetch("query_comments_count")

    if the_furniture.valid?
      the_furniture.save
      redirect_to("/furnitures", { :notice => "Furniture created successfully." })
    else
      redirect_to("/furnitures", { :alert => the_furniture.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("id")
    the_furniture = Furniture.where({ :id => the_id }).at(0)

    # Check if a new file is uploaded
    if params.key?("query_furniture_image") && params.fetch("query_furniture_image").present?
      the_furniture.furniture_image = params.fetch("query_furniture_image")
    end

    the_furniture.furniture_name = params.fetch("query_furniture_name")
    the_furniture.furniture_description = params.fetch("query_furniture_description")
    #the_furniture.owner_id = params.fetch("query_owner_id")
    the_furniture.rent_start = params.fetch("query_rent_start")
    the_furniture.rent_end = params.fetch("query_rent_end")
    the_furniture.borrower_id = params.fetch("query_borrower_id")
    #the_furniture.comments_count = params.fetch("query_comments_count")

    if the_furniture.valid?
      the_furniture.save
      redirect_to("/furnitures/#{the_furniture.id}", { :notice => "Furniture updated successfully." })
    else
      redirect_to("/furnitures/#{the_furniture.id}", { :alert => the_furniture.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("id")
    the_furniture = Furniture.where({ :id => the_id }).at(0)

    the_furniture.destroy

    redirect_to("/furnitures", { :notice => "Furniture deleted successfully." })
  end
end
