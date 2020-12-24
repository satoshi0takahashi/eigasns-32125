class DmsController < ApplicationController
  def new
    @room = Room.new
  end
end
