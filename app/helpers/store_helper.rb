module StoreHelper
  def visit_counter_message
    counter = session[:counter]
    "You've visited this page #{ counter } #{ 'time'.pluralize counter }"
  end
end
