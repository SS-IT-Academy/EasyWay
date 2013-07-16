class NotifyObserversController < ApplicationController
  # GET /notify_observers
  # GET /notify_observers.json
  def index
    @notify_observers = NotifyObserver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notify_observers }
    end
  end
  
  # GET /notify_observers/1
  # GET /notify_observers/1.json
  def show
    @notify_observer = NotifyObserver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notify_observer }
    end
  end

  # GET /notify_observers/new
  # GET /notify_observers/new.json
  def new
    @notify_observer = NotifyObserver.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notify_observer }
    end
  end

  # GET /notify_observers/1/edit
  def edit
    @notify_observer = NotifyObserver.find(params[:id])
  end

  # POST /notify_observers
  # POST /notify_observers.json
  def create
    @notify_observer = NotifyObserver.new(params[:notify_observer])
    
    respond_to do |format|
      if @notify_observer.save
        format.html { redirect_to @notify_observer, notice: 'Notify observer was successfully created.' }
        format.json { render json: @notify_observer, status: :created, location: @notify_observer }
      else
        format.html { render action: "new" }
        format.json { render json: @notify_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notify_observers/1
  # PUT /notify_observers/1.json
  def update
    @notify_observer = NotifyObserver.find(params[:id])

    respond_to do |format|
      if @notify_observer.update_attributes(params[:notify_observer])
        format.html { redirect_to @notify_observer, notice: 'Notify observer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notify_observer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notify_observers/1
  # DELETE /notify_observers/1.json
  def destroy
    @notify_observer = NotifyObserver.find(params[:id])
    @notify_observer.destroy

    respond_to do |format|
      format.html { redirect_to notify_observers_url }
      format.json { head :no_content }
    end
  end
end
