# coding: utf-8
class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Array.new
    @comments = Hash.new
    @tasks << Task.where(closed_at: nil).where(:deadline.lte => Time.now).asc(:deadline)
    @tasks << Task.where(closed_at: nil).where(:deadline.gt => Time.now).where(:deadline.lt => 7.days.from_now).asc(:deadline)
    @tasks << Task.where(closed_at: nil).where(:deadline.gt => 7.days.from_now).asc(:deadline)
    @tasks.each do |tasks|
      tasks.each {|task| @comments[task.id] = task.commented.asc(:updated_at).limit(3) }
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @comments = @task.commented.desc(:updated_at)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def my
    @tasks = Array.new
    @tasks << Task.where(closed_at: nil).where(user_id: current_user.id).where(:deadline.lte => Time.now).asc(:deadline)
    @tasks << Task.where(closed_at: nil).where(user_id: current_user.id).where(:deadline.gt => Time.now).where(:deadline.lt => 7.days.from_now).asc(:deadline)
    @tasks << Task.where(closed_at: nil).where(user_id: current_user.id).where(:deadline.gt => 7.days.from_now).asc(:deadline)
    @comment = Comment.new

    respond_to do |format|
      format.html # my.html.erb
      format.json { render json: @task }
    end
  end


  def finished
#    @tasks = Task.finished
    @tasks = Task.finished.page(params[:page] || 1).per(3)

    respond_to do |format|
      format.html # finished.html.haml
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  # GET /tasks/new/:id
  def new
    @task = Task.new
    @campaigns = Campaign.all
    @activities = Activity.all
    case request.referrer
    when /campaign/
      @task.campaign_id = params[:id]
    when /activities/
      @task.campaign_id = Activity.find(params[:id]).campaign_id
      @task.activity_id = params[:id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'タスクが作成されました。' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'タスクが更新されました。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
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

  def get_drop_down_options_of_activities
    campaign_id = params[:id]
    collections = Activity.where(campaign_id: campaign_id) + Activity.where(name: "共通")
    op = Array.new
    collections.inject(op) {|op,x| op << [x.id, x.name] }
    puts op.to_json
    
    respond_to do |format|
      format.json { render json: op }
    end
  end
end
