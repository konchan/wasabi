# coding: utf-8
class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.where(:date.lte => Time.zone.now).desc(:date).page(params[:page] || 1).per(25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  def planned
    @activities = Array.new
    @activities << Activity.where(:date.gt => Time.now)
                                   .where(:date.lte => 1.week.from_now).asc(:date)
    @activities << Activity.where(:date.gt => 1.week.from_now)
                                   .where(:date.lte => 1.month.from_now).asc(:date)
    @activities << Activity.where(:date.gt => 1.month.from_now).asc(:date)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end


  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    @tasks = Task.where(activity_id: @activity.id).desc(:updated_at)
    @comments = @activity.commented.desc(:updated_at)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  # GET /activities/new/:id
  def new
    @activity = Activity.new
    @campaigns = params[:id]? Campaign.where(id: params[:id]) : Campaign.actives
    @customers = params[:id]? Customer.where(id: @campaigns.first.customer_id) : Customer.not_bti

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
    @campaigns = Campaign.where(id: @activity.campaign_id)
    @customers = params[:id]? Customer.where(id: @campaigns.first.customer_id) : Customer.not_bti
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])
    @activity.campaign.phase_id = @activity.phase_id

    if @activity.date <= Time.now && (@activity.campaign.recent_act_at.nil? || @activity.campaign.recent_act_at < @activity.date)
      @activity.campaign.recent_act_at = @activity.date
    end
    @activity.user_id = current_user.id
    @activity.campaign.counter += 1
    @activity.number = @activity.campaign.counter

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: '活動記録が作成されました。' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render activity: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])
    @campaign = Campaign.find(@activity.campaign_id)

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        if @activity.date <= Time.now && @activity.date > @activity.campaign.recent_act_at
          @campaign.update_attribute(:recent_act_at, @activity.date)
        end
        format.html { redirect_to @activity, notice: '活動記録が更新されました。' }
        format.json { head :no_content }
      else
        format.html { render activity: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  def get_drop_down_options_of_campaigns
    customer_id = params[:id]
    collections = Campaign.where(customer_id: customer_id) + Campaign.where(name: "共通")
    op = Array.new
    collections.inject(op) {|op,x| op << [x.id, x.name] }
    puts op.to_json
    
    respond_to do |format|
      format.json { render json: op }
    end
  end
end
