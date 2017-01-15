class Event < ApplicationRecord
  belongs_to :user
  has_many :endorsements
  has_one :chainpoint
end
