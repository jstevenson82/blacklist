class AjaxController < ApplicationController
  def businesses
  	if params[:term]
      like= "%".concat(params[:term].concat("%"))
      businesses = Business.where("name like ?", like)
    else
      businesses = Business.all
    end
    list = businesses.map {|u| Hash[ id: u.id, label: u.name, name: u.name]}
    render json: list
  end
end
