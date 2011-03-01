require 'spec_helper'

describe "Users" do
  describe "signup" do

    describe "failure" do

      it "should not make a new user" do
        # check that the failed new user submission does not in fact
        # touch the database
        lambda do
          visit signup_path
          fill_in "Name",         :with => ""
          fill_in "Email",        :with => ""
          fill_in "Password",     :with => ""
          fill_in "Confirmation", :with => ""

          click_button
          response.should render_template('users/new')
          # check whether a div appears on the resulting page with
          # a div tag that has an id of "error_explanation"
          response.should have_selector("div#error_explanation")

        end.should_not change(User, :count)

      end
    end

    describe "success" do

      it "should make a new user" do
        # check that the failed new user submission does not in fact
        # touch the database
        lambda do
          visit signup_path
          fill_in "Name",         :with => "Example User"
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"
          fill_in "Confirmation", :with => "foobar"

          click_button
          # check whether a div appears on the resulting page with
          # a class of "flash.success" or even "flash success"
          response.should have_selector("div.flash.success",
                                        :content => "Welcome")

          response.should render_template('users/show')

        end.should change(User, :count).by(1)

      end
    end
  end
end
