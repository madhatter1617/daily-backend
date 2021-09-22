class JournalSerializer < ActiveModel::Serializer
    attributes :id, :journal_name
    # has_many :users
    # has_many :entries

end