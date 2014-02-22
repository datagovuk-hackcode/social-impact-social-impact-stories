class Organisation < ActiveRecord::Base

  belongs_to :organisation_type

  has_many :stories

end
