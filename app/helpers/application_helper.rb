module ApplicationHelper

  def show_count
    if session[:counter] >= 5
      "Visited: " + pluralize(session[:counter], "time")
    else
      ""
    end
  end
end
