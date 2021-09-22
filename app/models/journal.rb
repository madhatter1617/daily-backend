class Journal < ApplicationRecord

has_many :entries
has_many :users
# , through: :entriess

end