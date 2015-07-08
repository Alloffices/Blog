class Post < ActiveRecord::Base

	#validations ensure that valid data is saved into our database
	#for example: every user email that is submitted need to be validated

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

end
