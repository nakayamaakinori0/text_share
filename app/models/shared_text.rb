class SharedText < ApplicationRecord
  validates :content, presence: true
end
