class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @creator = current_user
    @events = @creator.created_events
  end
end
