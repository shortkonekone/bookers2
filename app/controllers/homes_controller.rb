class HomesController < ApplicationController
  def top
  end
  
  def edit
    @book = books.all(user[:id])
  end
end
