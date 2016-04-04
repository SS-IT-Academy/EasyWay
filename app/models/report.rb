class Report < ActiveRecord::Base
	belongs_to :conference

	validates :responsable, presence: true

	def short_report
		title.truncate(18)
	end
end
