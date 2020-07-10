class IncidentController < ApplicationController
  # add more pre validation & security
  def index
    @incidents = Incident.joins(:reports)
    respond_to do |format|
      format.html
      format.json { render :json => @incidents.to_json(:include => :reports) }
    end
  end

  def create
    # first assess lat,long from city & state
    # populate incident model & save
    # populate report & save
    # redirict to home
    results = Geocoder.search("#{params[:city]},#{params[:state]}")
    lat = results.first.coordinates[0]
    long = results.first.coordinates[1]
    cop = params[:cop].nil? ? false : true
    date = Date.strptime(params[:date], '%m/%d/%Y')
    @incident = Incident.new(date: date,city: params[:city], state: params[:state], lat: lat, long: long, active: false, cop: cop)
    @incident.save
    @report = Report.new(date: date,incident: @incident, source: params[:source], active: false)
    @report.save
    flash.now[:notice] = "Thanks for submitting an incident. Expect it to appaear soon."
    redirect_to("/")
  end
end
