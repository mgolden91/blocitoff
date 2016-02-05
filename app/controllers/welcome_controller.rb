class WelcomeController < ApplicationController
  def index
  end

  def about
  end

  def random
    @items = Item.all
  end
end
