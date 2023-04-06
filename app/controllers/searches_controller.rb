class SearchesController < ApplicationController
    def search
        create_at = params[:create_at]
        @search_book = Book.where('created_at LIKE ? ', "#{create_at}%")
        render "users/search"
    end
end
