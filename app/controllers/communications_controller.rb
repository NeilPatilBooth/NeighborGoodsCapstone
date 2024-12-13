class CommunicationsController < ApplicationController
  def index
    matching_communications = Communication.all

    @list_of_communications = matching_communications.order({ :created_at => :desc })

    render({ :template => "communications/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_communications = Communication.where({ :id => the_id })

    @the_communication = matching_communications.at(0)

    render({ :template => "communications/show" })
  end

  def create
    the_communication = Communication.new
    the_communication.comment_body = params.fetch("query_comment_body")
    the_communication.author_id = current_user.id
    the_communication.furniture_id = params.fetch("query_furniture_id")

    if the_communication.valid?
      the_communication.save
      redirect_to("/furnitures/#{the_communication.furniture_id}", { :notice => "Comment posted successfully."} )
    else
      redirect_to("/furnitures/#{the_communication.furniture_id}", { :alert => the_communication.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_communication = Communication.where({ :id => the_id }).at(0)

    the_communication.comment_body = params.fetch("query_comment_body")
    the_communication.author_id = params.fetch("query_author_id")
    the_communication.furniture_id = params.fetch("query_furniture_id")

    if the_communication.valid?
      the_communication.save
      redirect_to("/communications/#{the_communication.id}", { :notice => "Communication updated successfully."} )
    else
      redirect_to("/communications/#{the_communication.id}", { :alert => the_communication.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_communication = Communication.where({ :id => the_id }).at(0)

    the_communication.destroy

    redirect_to("/communications", { :notice => "Communication deleted successfully."} )
  end
end
