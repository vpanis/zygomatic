class ReviewsController < ApplicationController
  def create
    @skit = Skit.find(params[:skit_id])
    @review = Review.new(review_params)
    @review.skit = @skit
    if @review.save
      respond_to do |format|
        format.html { redirect_to skit_path(@review.skit), notice: "Yeah ! Thanks for this rating !" }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to skit_path(@review.skit), alert: "Ooops! Your rating did not work" }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
