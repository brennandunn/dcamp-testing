require 'test_helper'

class BeveragesControllerTest < ActionController::TestCase

  context 'Listing beverages' do
    
    should 'have as many beverages as available' do
      get :index
      assert_response :ok
      assert_select '.beverage', Beverage.count
    end
    
  end
  
  context 'Creating a new beverage' do
    
    should 'not allow two beverages of the same name to be created' do
      assert_difference 'Beverage.count', 1 do
        post :create, :beverage => { :name => 'Unique drink', :beverage_type => beverage_types(:mixed) }
        assert_redirected_to beverage_path(assigns(:beverage))
      end
      assert_no_difference 'Beverage.count' do
        post :create, :beverage => { :name => 'Unique drink', :beverage_type => beverage_types(:mixed) }
        assert_redirected_to beverages_path
      end
    end
    
  end
  
  context 'Creating a beverage' do
    
    should 'have a new record' do
      assert_difference 'Beverage.count', 1 do
        post :create, :beverage => { :name => 'New drink', :description => 'Tasty', :beverage_type => beverage_types(:mixed) }
        beverage = assigns(:beverage) # @beverage
        assert_redirected_to beverage_path(beverage)
      end
    end
    
  end
  
  context 'Updating a beverage' do
    
    setup do
      @lemonade = beverages(:lemonade)
    end
    
    should 'update the name of a drink' do
      put :update, :id => @lemonade.id, :beverage => { :name => 'Strawberry Lemonade' }
      assert_redirected_to beverage_path(@lemonade)
      @lemonade.reload
      assert_equal 'Strawberry Lemonade', @lemonade.name
    end
    
  end
  
  context 'Delete a beverage' do
    
    setup do
      @lemonade = beverages(:lemonade)
    end
    
    should 'delete lemonade' do
      assert_difference 'Beverage.count', -1 do
        delete :destroy, :id => @lemonade.id
        assert_redirected_to beverages_path
      end
    end
    
  end

end
