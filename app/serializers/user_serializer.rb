class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :password
    # has_many :entries
    belongs_to :journal
  end