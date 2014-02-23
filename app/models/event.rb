class Event < ActiveRecord::Base

  before_update :destroy_children_event_and_children_event_resources

  attr_accessible :recurrence_attributes, :name, :event_type_id, :recurrence_id, :start_at, :duration
  
  belongs_to :parent,	:class_name => "Event"
  has_many 	 :children, :class_name => "Event", :foreign_key=> "parent_id", :dependent => :delete_all
  
  has_many :event_resources, :dependent => :delete_all
  has_many :resources, :through => :event_resources
  belongs_to :event_type
  belongs_to :recurrence, :dependent => :destroy

  accepts_nested_attributes_for :recurrence
  
  validates :name, :start_at, :duration, :event_type_id, :presence => true
  validate :start_at_validation

  private
  	def destroy_children_event_and_children_event_resources
      EventResource.where(:event_id => self.children).delete_all
      Event.where('parent_id = ?', self.id).delete_all
  	end

    def start_at_validation
      if start_at < Time.now
        errors.add(:start_at, "can't be less than time is now" )
      end
    end

end