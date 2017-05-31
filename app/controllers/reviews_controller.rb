class ReviewsController < ApplicationController
  def create
    @skit = Skit.find(params[:skit_id])
    @review = Review.new(review_params)
    @review.skit = @skit
    if @review.save
      redirect_to skit_path(@skit)
    else
      render 'skits/show'
    end

  end

  def update

  end

  def destroy

  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
