class Movie < ActiveRecord::Base
	def self.all_ratings
		#attr_accessible :title, :rating, :description, :release_date
		return ['G', 'PG', 'PG-13', 'R']
	end
end
