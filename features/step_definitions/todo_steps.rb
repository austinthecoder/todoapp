Given /^I am on the site$/ do
  visit '/'
end

When /^I add a to\-do$/ do
  fill_in "To-do", :with => 'Do the laundry'
  click_on "Add"
end

Then /^I should see that to\-do in the to\-do list$/ do
  within "#todo_list" do
    page.should have_content("Do the laundry")
  end
end