require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    #User.countが変わらないことをテスト
    assert_no_difference 'User.count' do  
      #postメソッドを呼び出すだけでユーザー登録ができる
      post signup_path,params:{user:{name:"",
                        email: "user@invalid",
                        password:              "foo",
                        password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'form[action="/signup"]'
  end

  test "valid signup information" do
    get signup_path
    #第2引数はオプションで比較した結果の差異を渡す
    assert_difference "User.count",1 do
      post users_path,params:{user:{name: "Example User",
                          email: "user@example.com",
                          password:              "password",
                          password_confirmation: "password" } }
    end
    #follow_redirect!でリクエスト送信した結果を見て、指定されたリダイレクト先へ飛ぶ
    follow_redirect!
    assert_template 'users/show'
    #テキストに対するエラーは空でないかテストする方が良い
    assert_not flash.empty?
  end
end
