class EntrySerializer < ActiveModel::Serializer
    attributes :id, :date_time, :title, :entry_text, :user_id, :journal_id
    # belongs_to :user
    # belongs_to :journal
  end