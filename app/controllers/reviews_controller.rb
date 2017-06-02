class ReviewsController < ApplicationController
  def create
    @skit = Skit.find(params[:skit_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.skit = @skit
    if @review.save
      nth_rating = @review.rating
      nb_of_reviews = @skit.reviews.count
      @skit.average_rating = (nth_rating + (@skit.average_rating * (nb_of_reviews - 1))).fdiv(nb_of_reviews)
      @skit_rating_average = rating_average(@skit)

      @skit.save!
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

  def rating_average(skit)
    ratings = []
    skit.reviews.each do |review|
      ratings << review.rating
    end
    return ratings.inject{ |sum, rate| sum + rate }.to_f / ratings.length
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
