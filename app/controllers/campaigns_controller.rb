# coding: utf-8
class CampaignsController < ApplicationController
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.not_bti.page(params[:page] || 1).per(25)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end
  
  def no_act_for_three_months
    @campaigns = Campaign.not_bti.not_closed.where(:recent_act_at.lte => 3.months.ago).asc(:date).page(params[:page] || 1).per(25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end

  def selective_index
    @campaigns = if Kind.find(params[:id]).name == "全て"
      Campaign.not_bti.page(params[:page] || 1).per(25)
    else
      Campaign.not_bti.where(kind_id: params[:id]).page(params[:page] || 1).per(25)
    end
    
    respond_to do |format|
      puts @campaigns
      format.js { render :partial => 'campaign_list', :locals =>{ :campaigns => @campaigns }, :content_type => 'text/html' }
    end
  end

  def actives
    @campaigns = Campaign.not_bti.actives.page(params[:page] || 1).per(25)
    
    respond_to do |format|
      format.html
      format.json { render json: @campaigns }
    end
  end

  def pendings
    @campaigns = Campaign.not_bti.pendings.page(params[:page] || 1).per(25)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end

  def closed
    @campaigns = Campaign.not_bti.closed.page(params[:page] || 1).per(25)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end


  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @campaign = Campaign.find(params[:id])
    @next_actions = Activity.and({campaign_id: @campaign.id}, {:date.gt => Time.now}).asc(:date)
#    @activities = Activity.and({campaign_id: @campaign.id}, {:date.lte => Time.now}).desc(:updated_at).limit(3)
    @activities = Activity.and({campaign_id: @campaign.id}, {:date.lte => Time.now}).desc(:updated_at)
    @tasks = Task.and({campaign_id: @campaign.id}, {closed_at: nil}) 
#    @comments = @campaign.commented.asc(:updated_at).limit(3)
    @comments = @campaign.commented.asc(:updated_at)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign }
    end
  end

  # GET /campaigns/new
  # GET /campaigns/new.json
  # GET /campaigns/:id/new
  def new
    @campaign = Campaign.new
    @customers = Customer.not_bti
    @contacts = Contact.all
    if params[:id]
      case request.referer
      when /customers/
        @customers = Customer.where(id: params[:id])
        @contacts = Contact.where(name: "未定") + Contact.where(customer_id: @customers[0].id) if @customers
      when /contacts/
        contact = Contact.find(params[:id])
        @contacts = Contact.where(name: "未定") + Contact.where(id: params[:id])
        @customers = Customer.where(id: contact.customer_id)
        @campaign.contact_id = contact.id
      end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campaign }
    end
  end

  # GET /campaigns/1/edit
  def edit
    @campaign = Campaign.find(params[:id])
    @customers = Customer.where(id: @campaign.customer_id)
    @contacts = Contact.where(customer_id: @campaign.customer_id) + Contact.where(id: @campaign.contact_id)
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.customer.counter += 1
    @campaign.code = @campaign.customer.code + sprintf("%0#{3}d", @campaign.customer.counter)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: '案件が作成されました。' }
        format.json { render json: @campaign, status: :created, location: @campaign }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campaigns/1
  # PUT /campaigns/1.json
  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if params[:campaign][:closed_at]
        params[:campaign][:status] = :closed
      end
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to @campaign, notice: '案件が更新されました。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.json { head :no_content }
    end
  end
  
  # POST /campaigns/pending/1
  def pending
    @campaign = Campaign.find(params[:id])
    
    respond_to do |format|
      if @campaign.update_attributes(status: :pending)
        format.html { redirect_to @campaign, notice: '案件が「保留」に設定されました。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /campaigns/proseed/1
  def proseed
    @campaign = Campaign.find(params[:id])
    
    respond_to do |format|
      if @campaign.update_attributes(status: :ongoing)
        format.html { redirect_to @campaign, notice: '案件が「進行中」に設定されました。' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end
end
