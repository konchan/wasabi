require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ActionsController do

  # This should return the minimal set of attributes required to create a valid
  # Action. As you add validations to Action, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActionsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all actions as @actions" do
      action = Action.create! valid_attributes
      get :index, {}, valid_session
      assigns(:actions).should eq([action])
    end
  end

  describe "GET show" do
    it "assigns the requested action as @action" do
      action = Action.create! valid_attributes
      get :show, {:id => action.to_param}, valid_session
      assigns(:action).should eq(action)
    end
  end

  describe "GET new" do
    it "assigns a new action as @action" do
      get :new, {}, valid_session
      assigns(:action).should be_a_new(Action)
    end
  end

  describe "GET edit" do
    it "assigns the requested action as @action" do
      action = Action.create! valid_attributes
      get :edit, {:id => action.to_param}, valid_session
      assigns(:action).should eq(action)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Action" do
        expect {
          post :create, {:action => valid_attributes}, valid_session
        }.to change(Action, :count).by(1)
      end

      it "assigns a newly created action as @action" do
        post :create, {:action => valid_attributes}, valid_session
        assigns(:action).should be_a(Action)
        assigns(:action).should be_persisted
      end

      it "redirects to the created action" do
        post :create, {:action => valid_attributes}, valid_session
        response.should redirect_to(Action.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved action as @action" do
        # Trigger the behavior that occurs when invalid params are submitted
        Action.any_instance.stub(:save).and_return(false)
        post :create, {:action => {}}, valid_session
        assigns(:action).should be_a_new(Action)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Action.any_instance.stub(:save).and_return(false)
        post :create, {:action => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested action" do
        action = Action.create! valid_attributes
        # Assuming there are no other actions in the database, this
        # specifies that the Action created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Action.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => action.to_param, :action => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested action as @action" do
        action = Action.create! valid_attributes
        put :update, {:id => action.to_param, :action => valid_attributes}, valid_session
        assigns(:action).should eq(action)
      end

      it "redirects to the action" do
        action = Action.create! valid_attributes
        put :update, {:id => action.to_param, :action => valid_attributes}, valid_session
        response.should redirect_to(action)
      end
    end

    describe "with invalid params" do
      it "assigns the action as @action" do
        action = Action.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Action.any_instance.stub(:save).and_return(false)
        put :update, {:id => action.to_param, :action => {}}, valid_session
        assigns(:action).should eq(action)
      end

      it "re-renders the 'edit' template" do
        action = Action.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Action.any_instance.stub(:save).and_return(false)
        put :update, {:id => action.to_param, :action => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested action" do
      action = Action.create! valid_attributes
      expect {
        delete :destroy, {:id => action.to_param}, valid_session
      }.to change(Action, :count).by(-1)
    end

    it "redirects to the actions list" do
      action = Action.create! valid_attributes
      delete :destroy, {:id => action.to_param}, valid_session
      response.should redirect_to(actions_url)
    end
  end

end
