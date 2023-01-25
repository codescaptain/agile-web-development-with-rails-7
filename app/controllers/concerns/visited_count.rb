module VisitedCount


  def total_visited_count
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] +=1
    end
  end
end