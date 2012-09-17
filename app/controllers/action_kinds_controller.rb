class ActionKindsController < ApplicationController
  # GET /action_kinds
  # GET /action_kinds.json
  def index
    @action_kinds = ActionKind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @action_kinds }
    end
  end

  # GET /action_kinds/1
  # GET /action_kinds/1.json
  def show
    @action_kind = ActionKind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @action_kind }
    end
  end

  # GET /action_kinds/new
  # GET /action_kinds/new.json
  def new
    @action_kind = ActionKind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_kind }
    end
  end

  # GET /action_kinds/1/edit
  def edit
    @action_kind = ActionKind.find(params[:id])
  end

  # POST /action_kinds
  # POST /action_kinds.json
  def create
    @action_kind = ActionKind.new(params[:action_kind])

    respond_to do |format|
      if @action_kind.save
        format.html { redirect_to @action_kind, notice: 'Action kind was successfully created.' }
        format.json { render json: @action_kind, status: :created, location: @action_kind }
      else
        format.html { render action: "new" }
        format.json { render json: @action_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /action_kinds/1
  # PUT /action_kinds/1.json
  def update
    @action_kind = ActionKind.find(params[:id])

    respond_to do |format|
      if @action_kind.update_attributes(params[:action_kind])
        format.html { redirect_to @action_kind, notice: 'Action kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @action_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_kinds/1
  # DELETE /action_kinds/1.json
  def destroy
    @action_kind = ActionKind.find(params[:id])
    @action_kind.destroy

    respond_to do |format|
      format.html { redirect_to action_kinds_url }
      format.json { head :no_content }
    end
  end
end
