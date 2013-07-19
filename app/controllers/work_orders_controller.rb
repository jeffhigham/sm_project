class WorkOrdersController < ApplicationController
  
  #before_filter :authorize, only: [:edit, :update]
  before_filter :authorize

  # GET /work_orders
  # GET /work_orders.json
  def index
    @properties = current_customer.properties.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @work_orders }
    end
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
    @work_order = WorkOrder.find(params[:id])
    @markers = @work_order.property.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @work_order }
    end
  end

  # GET /work_orders/new
  # GET /work_orders/new.json
  def new
    @property = Property.find(params[:property_id])
    @work_order = @property.work_orders.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @work_order }
    end
  end

  # GET /work_orders/1/edit
  def edit
    @work_order = WorkOrder.find(params[:id])
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    property = Property.find(params[:property_id])
    params[:work_order][:due_date] << " #{params[:due_time]}"
    @work_order = property.work_orders.new(params[:work_order])
    #logger.debug @work_order.inspect    
    respond_to do |format|
      if @work_order.save
        format.html { redirect_to property_work_order_path(property,@work_order.id),
          notice: "Please pay using paypal" }
          #notice: "We'll get it done on #{@work_order.due_date_f}!" }
        format.json { render json: @work_order, status: :created, location: @work_order }
      else
        format.html { render action: "new" }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /work_orders/1
  # PUT /work_orders/1.json
  def update
    property = Property.find(params[:property_id])
    @work_order = property.work_orders.new(params[:work_order])

    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        format.html { redirect_to customer_path(property.customer_id), notice: 'Work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy


    respond_to do |format|
      if current_customer.has_work_orders?
        format.html { redirect_to work_orders_url }
      else
        format.html { redirect_to customer_url(current_customer) }
      end
      format.json { head :no_content }
    end
  end
end
