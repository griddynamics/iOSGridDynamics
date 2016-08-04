require 'calabash-cucumber/operations'
include Calabash::Cucumber::Operations

Given(/^the app has launched$/) do
    wait_for do
        !query("*").empty?
    end
end

And(/^I search for "cats"$/) do
    touch("view marked:'searchBar'")
    keyboard_enter_text("cats")
    tap_keyboard_action_key
end

Then(/^I should see images of cats/) do
    wait_for() {query("view marked:'ImgView'").count > 7}
end

