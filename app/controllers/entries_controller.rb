class EntriesController < ApplicationController

  def index
    @entry = Entry.all

    respond_to do |format|
      format.html # helps render posts/index.html.erb
      format.json do
        render :json => @entry
      end
    end
  end


  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = @current_user["id"]

    @entry.uploaded_image.attach(params["uploaded_image"])

    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
