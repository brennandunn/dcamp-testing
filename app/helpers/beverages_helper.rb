module BeveragesHelper

  def display_sellable_message
    if current_beverage.alcoholic?
      'Not sellable to minors'
    else
      'Non-alcoholic'
    end
  end

end
