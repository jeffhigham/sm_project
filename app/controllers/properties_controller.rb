class PropertiesController < ApplicationController

  #before_filter :authorize, only: [:edit, :update]
  before_filter :authorize

  # GET /properties
  # GET /properties.json
  def index
    #@properties = Property.all
    @properties = current_customer.properties.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = current_customer.properties.find(params[:id])
    @work_orders = @property.work_orders
    @markers = @property.to_gmaps4rails
    #session[:property_id] = @property.id #context for work_orders
    @driveway_type   = DrivewayType.find(@property.driveway_type).name
    @driveway_length = DrivewayLength.find(@property.driveway_length).name
    @sidewalk_length = SidewalkLength.find(@property.sidewalk_length).name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/new
  # GET /properties/new.json
  def new
    @property = current_customer.properties.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_customer.properties.new(params[:property])

    respond_to do |format|
      if @property.save
        format.html { redirect_to customer_path(current_customer), notice: 'Address was successfully added.' }
        format.json { render json: @property, status: :created, location: @property }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to customer_path(current_customer), notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

end
