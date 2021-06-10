class Book < ApplicationRecord
  belongs_to :author
  # book.author.whatever_column_from_my_author_table
  # self.author

  validates :title, presence: true
  validates :title, uniqueness: { scope: :author }
end
