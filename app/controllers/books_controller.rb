class BooksController < ApplicationController
  def index
    # @books = Book.all
    # .all is a class method from active record
    # getting rid of the N+1 queries in the view && the problem of MVC violation.
    @books = Book.includes(:author)
    #here we're loading all the author instance information that belongs to a specific book instance on the controller level.
    # We're not violating the MVC pattern anymore as the controller has athe responsibility of communication with M && V.
     # SELECT "books".* FROM "books"
     # SELECT "authors".* FROM "authors" WHERE "authors"."id" IN ($1, $2, $3, $4, $5)  [["id", 1], ["id", 2], ["id", 3], ["id", 4], ["id", 5]]
     # Book.where(author: book.author)
  end
end
