class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "users_templates/index.html.erb" })
  end

  def show
    the_user = params.fetch("user_id")

    matching_users = User.where({ :username => the_user })

    @the_user = matching_users.at(0)

    render({ :template => "users_templates/show.html.erb" })
  end

end