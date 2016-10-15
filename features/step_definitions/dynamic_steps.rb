
Given /^the user blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'user',
                :password => 'aaaaaaa',
                :email => 'user@snow.com',
                :profile_id => 2,
                :name => 'user',
                :state => 'active'})
end

And /^I am logged into the user panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user'
  fill_in 'user_password', :with => 'aaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
