class SkitsController < ApplicationController
  def index

  end

  def show

  end

  private
  def skit_params
      params.require(:skit).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end
