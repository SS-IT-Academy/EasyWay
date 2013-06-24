class ResourcesController < ApplicationController
 def index
   @resources = Resource.all
 end
 def new
   @resource = Resource.new
 end
 def create
   @resource = Resource.create
 end
 def update
   @resource = Resources.find(param[:id])
   Resource.update
 end
 def destroy
   @resource = Resources.find(param[:id]) 
   Resource.destroy
 end
end