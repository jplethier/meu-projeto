require 'spec_helper'
require 'factories'

describe UsersController do

    render_views


    describe "GET 'novocadastro'" do
            it "should be successful" do
            get 'novocadastro'
            response.should be_success
        end
    end

    describe "GET 'show'" do

        before(:each) do
            @user = Factory(:user)
        end

        it "should be successful" do
            get :show, :id => @user
            response.should be_success
        end

        it "should find the right user" do
            get :show, :id => @user
            assigns(:user).should == @user
        end

    end

    describe "POST 'create'" do

        describe "blank failure" do

            before(:each) do
                @attr = { :name => "", :email => "", :password => "",
                            :password_confirmation => "" }
            end

            it "should not create a user" do
                lambda do
                    post :create, :user => @attr
                end.should_not change(User, :count)
            end

            it "should render the 'new' page" do
                post :create, :user => @attr
                response.should render_template('novocadastro')
            end

        end

        describe "email error failure" do
            before(:each) do
                @attr = { :name => "teste", :email => "a", :password => "123456",
                            :password_confirmation => "123456" }
            end

            it "should not create a user" do
                lambda do
                    post :create, :user => @attr
                end.should_not change(User, :count)
            end

            it "should render the 'new' page" do
                post :create, :user => @attr
                response.should render_template('novocadastro')
            end

        end
        
        describe "confirmation password error failure" do

            before(:each) do
                @attr = { :name => "teste", :email => "teste@teste.com", :password => "123456",
                            :password_confirmation => "654321" }
            end

            it "should not create a user" do
                lambda do
                    post :create, :user => @attr
                end.should_not change(User, :count)
            end

            it "should render the 'new' page" do
                post :create, :user => @attr
                response.should render_template('novocadastro')
            end
        end

        describe "success" do

            before(:each) do
                @attr = { :name => "New User", :email => "user@example.com",
                            :password => "foobar", :password_confirmation => "foobar" }
            end

            it "should create a user" do
                lambda do
                    post :create, :user => @attr
                end.should change(User, :count).by(1)
            end

            it "should redirect to the user show page" do
                post :create, :user => @attr
                response.should redirect_to(user_path(assigns(:user)))
            end    

            it "should sign the user in" do
                post :create, :user => @attr
                controller.should be_signed_in
            end
        end

    end

end
