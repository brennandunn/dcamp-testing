require 'test_helper'

class BeverageTest < ActiveSupport::TestCase

  should_belong_to :beverage_type
  
  context 'Tools required' do
    
    should "require a wine opener for a beverage that's wine" do
      merlot = beverages(:merlot)
      assert merlot.id.present?
      assert_equal 'Wine', merlot.beverage_type.name
      assert merlot.alcoholic?
      assert_equal :wine_opener, merlot.tool_required
    end
    
  end
  
  context 'Non-alcholic beverages' do
    
    setup do
      @beverage = beverages(:lemonade)
    end
    
    should 'should be sellable to anyone' do
      assert @beverage.can_sell_to?(User.new(:age => 5))
      assert @beverage.can_sell_to?(User.new(:age => 21))
      assert @beverage.can_sell_to?(User.new(:age => 50))
    end
    
  end

  context 'Alcoholic beverages' do
    
    setup do
      @beverage = beverages(:bloody_mary)
    end
    
    should 'be alcoholic' do
      assert @beverage.alcoholic?, 'Beverage is not alcoholic'
    end
    
    should 'not be able to be sold to minors' do
      user = User.new(:age => 18)
      assert ! @beverage.can_sell_to?(user)
    end
    
  end

end
