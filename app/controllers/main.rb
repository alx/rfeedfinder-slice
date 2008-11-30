class RfeedfinderSlice::Main < RfeedfinderSlice::Application
  
  def index
    @feed_requested = params["website_url"]
    if !@feed_requested.empty?
      @feeds = RfeedfinderSlice::Rfeedfinder.feeds(params["website_url"])
    end
    render
  end
end