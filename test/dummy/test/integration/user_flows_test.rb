require 'test_helper'
 
class UserFlowsTest < ActionDispatch::IntegrationTest
  test '#index shows the hopscotch' do
    get '/people'
    puts @response.body
    assert_tag tag: 'script', parent: { :tag => 'body' }
    assert_response :success
  end

  test '#show loads even though there is no hopscotch' do
    get '/people/1'
    assert_response :success
  end
end