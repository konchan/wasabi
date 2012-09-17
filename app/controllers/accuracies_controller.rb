class AccuraciesController < ApplicationController
  # GET /accuracies
  # GET /accuracies.json
  def index
    @accuracies = Accuracy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accuracies }
    end
  end

  # GET /accuracies/1
  # GET /accuracies/1.json
  def show
    @accuracy = Accuracy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accuracy }
    end
  end

  # GET /accuracies/new
  # GET /accuracies/new.json
  def new
    @accuracy = Accuracy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accuracy }
    end
  end

  # GET /accuracies/1/edit
  def edit
    @accuracy = Accuracy.find(params[:id])
  end

  # POST /accuracies
  # POST /accuracies.json
  def create
    @accuracy = Accuracy.new(params[:accuracy])

    respond_to do |format|
      if @accuracy.save
        format.html { redirect_to @accuracy, notice: 'Accuracy was successfully created.' }
        format.json { render json: @accuracy, status: :created, location: @accuracy }
      else
        format.html { render action: "new" }
        format.json { render json: @accuracy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accuracies/1
  # PUT /accuracies/1.json
  def update
    @accuracy = Accuracy.find(params[:id])

    respond_to do |format|
      if @accuracy.update_attributes(params[:accuracy])
        format.html { redirect_to @accuracy, notice: 'Accuracy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accuracy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accuracies/1
  # DELETE /accuracies/1.json
  def destroy
    @accuracy = Accuracy.find(params[:id])
    @accuracy.destroy

    respond_to do |format|
      format.html { redirect_to accuracies_url }
      format.json { head :no_content }
    end
  end
end
