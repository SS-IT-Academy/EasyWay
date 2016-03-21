class NotifySchedulersController < ApplicationController
  # GET /notify_schedulers
  # GET /notify_schedulers.json
  def index
    @notify_schedulers = NotifyScheduler.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notify_schedulers }
    end
  end

  # GET /notify_schedulers/1
  # GET /notify_schedulers/1.json
  def show
    @notify_scheduler = NotifyScheduler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notify_scheduler }
    end
  end

  # GET /notify_schedulers/new
  # GET /notify_schedulers/new.json
  def new
    @notify_scheduler = NotifyScheduler.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notify_scheduler }
    end
  end

  # GET /notify_schedulers/1/edit
  def edit
    @notify_scheduler = NotifyScheduler.find(params[:id])
  end

  # POST /notify_schedulers
  # POST /notify_schedulers.json
  def create
    @notify_scheduler = NotifyScheduler.new(params[:notify_scheduler])

    respond_to do |format|
      if @notify_scheduler.save
        format.html { redirect_to @notify_scheduler, notice: 'Notify scheduler was successfully created.' }
        format.json { render json: @notify_scheduler, status: :created, location: @notify_scheduler }
      else
        format.html { render action: "new" }
        format.json { render json: @notify_scheduler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notify_schedulers/1
  # PUT /notify_schedulers/1.json
  def update
    @notify_scheduler = NotifyScheduler.find(params[:id])

    respond_to do |format|
      if @notify_scheduler.update_attributes(params[:notify_scheduler])
        format.html { redirect_to @notify_scheduler, notice: 'Notify scheduler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notify_scheduler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notify_schedulers/1
  # DELETE /notify_schedulers/1.json
  def destroy
    @notify_scheduler = NotifyScheduler.find(params[:id])
    @notify_scheduler.destroy

    respond_to do |format|
      format.html { redirect_to notify_schedulers_url }
      format.json { head :no_content }
    end
  end
end
