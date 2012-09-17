class ActionsController < ApplicationController
  # GET /actions
  # GET /actions.json
  def index
    @actions = Action.where(:date.lte => Time.now).desc(:updated_at).page(params[:page] || 1).per(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actions }
    end
  end

  def planned
    @planned_actions = Array.new
    @planned_actions << Action.where(:date.gt => Time.now)
                                   .where(:date.lte => 1.week.from_now).asc(:updated_at)
    @planned_actions << Action.where(:date.gt => 1.week.from_now)
                                   .where(:date.lte => 1.month.from_now).asc(:update_at)
    @planned_actions << Action.where(:date.gt => 1.month.from_now).asc(:update_at)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actions }
    end
  end


  # GET /actions/1
  # GET /actions/1.json
  def show
    @action = Action.find(params[:id])
    @tasks = Task.where(action_id: action.id).desc(:updated_at)
    @comments = action.commented.desc(:updated_at)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @action }
    end
  end

  # GET /actions/new
  # GET /actions/new.json
  def new
    @action = Action.new
    @campaigns = Campaign.actives

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action }
    end
  end

  # GET /actions/1/edit
  def edit
    @action = Action.find(params[:id])
  end

  # POST /actions
  # POST /actions.json
  def create
    require 'pp'
    pp params[:action]
    @action = Action.new(params[:action])
    @action.campaign.phase_id = @action.phase_id
    @action.user_id = current_user.id
    @action.campaign.counter += 1
    @action.number = @action.campaign.counter

    respond_to do |format|
      if @action.save
        format.html { redirect_to @action, notice: 'Action was successfully created.' }
        format.json { render json: @action, status: :created, location: @action }
      else
        format.html { render action: "new" }
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /actions/1
  # PUT /actions/1.json
  def update
    @action = Action.find(params[:id])

    respond_to do |format|
      if @action.update_attributes(params[:action])
        format.html { redirect_to @action, notice: 'Action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actions/1
  # DELETE /actions/1.json
  def destroy
    @action = Action.find(params[:id])
    @action.destroy

    respond_to do |format|
      format.html { redirect_to actions_url }
      format.json { head :no_content }
    end
  end
end
