class Strand < ActiveRecord::Base
  belongs_to :subject
  has_many :units, :dependent => :destroy
end
