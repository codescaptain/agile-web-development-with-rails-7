class StoreController < ApplicationController
  include VisitedCount

  before_action :total_visited_count, only: %i[ index ]
  def index
    @products = Product.order(:title)
  end
end
