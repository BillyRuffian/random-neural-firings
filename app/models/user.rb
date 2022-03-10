class User < ApplicationRecord
  has_many :notes, -> { order 'updated_at DESC' }
end
