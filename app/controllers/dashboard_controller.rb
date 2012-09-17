# coding: utf-8
class DashboardController < ApplicationController
  def index
    @recent_actions =
      Activity.where(:date.lte => Time.now).limit(10).desc(:date)
    @next_actions =
      Activity.where(:date.gte => Time.now).where(:date.lt => 1.week.from_now).asc(:date)
    @tasks = Task.unclosed.asc(:deadline)
    @results = Hash.new 
    @results[:earnings] = Campaign.where(:closed_at.gte => Time.zone.parse("2012-08-01")).has_committed.map(&:amount).map(&:to_i).sum
    @results[:performance] = Campaign.has_committed.count
    @results[:percentile1] = @results[:earnings]*100/105000000
    @results[:percentile2] = @results[:performance]*100/17
    @total = Campaign.not_bti
    @pending_count = Campaign.pendings.count
    @keep_in_touch = Campaign.not_bti.where(:recent_act_at.lte => 3.months.ago).asc(:date)
    @test = nil
      
    respond_to do |format|
      format.html
      format.json { render json: @next_actions }
    end 
  end
  
  def search
    if params[:search]
      @campaigns = Campaign.search(params[:search])
    end
    
    respond_to do |format|
      format.html { render '/dashboard/result' }
      format.json { render json: @next_actions }
    end 
  end
end
