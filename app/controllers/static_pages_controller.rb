class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed
                                .order("created_at DESC")
                                .paginate(page: params[:page], per_page: Settings.length.digit_3)
    end
  end

  def help; end
end
