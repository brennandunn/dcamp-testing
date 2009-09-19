class Beverage < ActiveRecord::Base

  belongs_to :beverage_type

  named_scope :alcoholic, :include => :beverage_type,
                :conditions => { :beverage_types => { :alcoholic => true }}
  

  validates_uniqueness_of :name
  validates_presence_of :beverage_type
  
  def alcoholic?
    beverage_type.alcoholic?
  end
  
  def can_sell_to?(user)
    return true unless alcoholic?
    user.age >= 21
  end
  
  def tool_required
    case beverage_type.name
    when /wine/i then :wine_opener
    when /beer/i then :bottle_opener
    end
  end

end
