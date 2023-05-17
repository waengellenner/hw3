class PostsController < ApplicationController

#  def index
#    @posts = Post.all
#  end

  def show
    @post = Post.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @post["place_id"]})
  end

  def new
    @post = Post.new
    # render contacts/new view with new Contact form
    @post["place_id"] = params["place_id"]
  end

  def create

    @post = Post.new

    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]

    @post["place_id"] = params["post"]["place_id"]

    # save Contact row
    @post.save

    # redirect user
    redirect_to "/places/#{@post["place_id"]}"
  end

end
