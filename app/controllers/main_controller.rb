class MainController < ApplicationController

  def index
  end

  def geocode
    render :json => CodePoint.where(:postcode => params[:postcode]).pluck(:postcode, :latitude, :longitude).first
  end

  def station_usage
    @data = []
    CSV.foreach('data/station_usage.csv') do |s|
      @data << s
    end
    @data.shift
    render :json => @data
  end

  def yw_incidents
    render :json => Net::HTTP.get('www.ywonline.co.uk', '/web/newincid.nsf/incidentsjson')
  end

  def yw_investments
    render :json => Net::HTTP.get('www.ywonline.co.uk', '/roadworks/roadworks.nsf/roadworksjson')
  end

end
