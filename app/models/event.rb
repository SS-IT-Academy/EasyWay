class Event < ActiveRecord::Base

  include EventModule

  before_update :destroy_children_event_and_children_event_resources

  attr_accessible :recurrence_attributes, :name, :event_type_id, :recurrence_id, :start_at, :end_at
  
  belongs_to :parent, :class_name => "Event"
  has_many   :children, :class_name => "Event", :foreign_key=> "parent_id", :dependent => :delete_all
  
  has_many :event_resources, :dependent => :delete_all
  has_many :resources, :through => :event_resources
  belongs_to :event_type
  belongs_to :recurrence, :dependent => :destroy

  accepts_nested_attributes_for :recurrence
  
  validates :name, :start_at, :end_at, :event_type_id, :presence => true
  validate :date_validation
  validate :children_time_validation, :on => :update

  def next_event
    Event.where('id > ?', self.id).first
  end

  def prev_event
    Event.where('id < ?', self.id).last
  end
  
  private
    def destroy_children_event_and_children_event_resources
      EventResource.where(:event_id => self.children).delete_all
      Event.where('parent_id = ?', self.id).delete_all
    end

    def date_validation
      if start_at < Time.now
        errors.add(:start_at, "can't be less than time is now" )
      end

      if start_at > end_at
        errors.add(:end_at, "can't be less than time is now" )
      end
    end

    def children_time_validation
      unless self.parent_id.nil?
        unless self.prev_event.parent_id.nil?
          if self.start_at < self.prev_event.end_at 
            errors.add(:start_at, "can't be less than the end of the previous event" )
          end
        end

        unless self.next_event.parent_id.nil?
          if self.end_at > self.next_event.start_at
            errors.add(:end_at, "can't be greater than the start of the next event" )
          end
        end

        if self.prev_event.parent_id.nil?
          if self.start_at < self.prev_event.start_at
            errors.add(:start_at, "can't be less than parent event start")
          end
        end

        if self.next_event.parent_id.nil?
          if self.end_at > self.parent.end_at
            errors.add(:end_at, "can't be greater than parent event end")
          end
        end
      end
    end

end