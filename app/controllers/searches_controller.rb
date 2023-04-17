class SearchesController < ApplicationController
    before_action :authenticate_user!

    def search
        @range = params[:range]
        @word = params[:word]
        @search = params[:search]
        if @range == "User"
            @users = User.looks(@search, @word)
        elsif @range == "Book"
            @books = Book.looks(@search, @word)
        else
            @books = Book.tag_looks(@word)
        end
        render :search_result
     end
end
