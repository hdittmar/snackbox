class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def choose_box
    code = params[:code]
    if @box = Box.find_by_code(code)
      redirect_to box_path(@box.id)
    else
      flash[:alert] = "Box not found"
      redirect_to root_path
    end
  end
end
