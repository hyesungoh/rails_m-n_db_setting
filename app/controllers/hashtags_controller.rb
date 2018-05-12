class HashtagsController < ApplicationController
  def index
    @hashtag = Hashtag.find(params[:hashtag_id])
  end
end
