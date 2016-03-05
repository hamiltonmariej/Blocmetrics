require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:my_user) { User.create!(name: "Blocmetrics User", email: "user@blocmetrics.com", password: "helloworld") }
  let(:my_registered_application) { RegisteredApplication.create!(name: "Test Application", url: "http://www.testapp.com", user: my_user) }

  context "signed-in user" do
    before do
      create_session(my_user)
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns [my_registered_application] to @registered_applications" do
        get :index
        expect(assigns(:registered_applications)).to eq([my_registered_application])
      end
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, {id: my_registered_application}
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, {id: my_registered_application.id}
        expect(response).to render_template :show
      end

      it "assigns my_registered_application to @registered_application" do
        get :show, {id: my_registered_application.id}
        expect(assigns(:registered_application)).to eq(my_registered_application)
      end
    end

    describe "GET #new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @registered_application" do
        get :new
        expect(assigns(:registered_application)).not_to be_nil
      end
    end

    describe "POST create" do

      it "increases the number of RegisteredApplications by 1" do
        expect{post :create, registered_application: {name: "Test Application", url: "http://www.mytestapp.com"}}.to change(RegisteredApplication,:count).by(1)
      end

      it "assigns the new registered application to @registered_application" do
        post :create, registered_application: {name: "Test Application", url: "http://www.mytestapp.com"}
        expect(assigns(:registered_application)).to eq RegisteredApplication.last
      end

      it "redirects to the new registered application" do
        post :create, registered_application: {name: "Test Application", url: "http://www.testapp.com"}
        expect(response).to redirect_to RegisteredApplication.last
      end
    end

    describe "GET #edit" do
      it "returns http success" do
        get :edit, {id: my_registered_application.id}
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, {id: my_registered_application.id}
        expect(response).to render_template :edit
      end

      it "assigns registered_application to be updated to @registered_application" do
        get :edit, {id: my_registered_application.id}
        registered_application_instance= assigns(:registered_application)

        expect(registered_application_instance.id).to eq my_registered_application.id
        expect(registered_application_instance.name).to eq my_registered_application.name
        expect(registered_application_instance.url).to eq my_registered_application.url
      end
    end

    describe "PUT update" do
      it "updates registered application with expected attributes" do
        new_name = "The Best Test App"
        new_url = "http://www.besttestapp.com"

        put :update, id: my_registered_application.id, registered_application: {name: new_name, url: new_url}

        updated_registered_application = assigns(:registered_application)
        expect(updated_registered_application.id).to eq my_registered_application.id
        expect(updated_registered_application.name).to eq new_name
        expect(updated_registered_application.url).to eq new_url
      end

      it "redirects to the updated post" do
        new_name = "The Best Test App"
        new_url = "http://www.besttestapp.com"

        put :update, id: my_registered_application.id, registered_application: {name: new_name, url: new_url}
        expect(response).to redirect_to my_registered_application
      end
    end

    describe "DELETE destroy" do
      it "deletes the registered application" do
        delete :destroy, {id: my_registered_application.id}
        count = RegisteredApplication.where({id: my_registered_application.id}).size
        expect(count).to eq 0
      end

      it "redirects to registered applications index" do
        delete :destroy, {id: my_registered_application.id}
        expect(response).to redirect_to registered_applications_path
      end
    end
  end
end
