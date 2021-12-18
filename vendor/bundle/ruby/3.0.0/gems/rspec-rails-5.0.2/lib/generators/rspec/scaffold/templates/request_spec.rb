 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

<% module_namespacing do -%>
RSpec.describe "/<%= name.underscore.pluralize %>", <%= type_metatag(:request) %> do
  <% if mountable_engine? -%>
    include Engine.routes.url_helpers
  <% end -%>

  # <%= class_name %>. As you add validations to <%= class_name %>, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

<% unless options[:singleton] -%>
  describe "GET /index" do
    it "renders a successful response" do
      <%= class_name %>.create! valid_attributes
      get <%= index_helper %>_url
      expect(response).to be_successful
    end
  end
<% end -%>

  describe "GET /show" do
    it "renders a successful response" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get <%= show_helper.tr('@', '') %>
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get <%= new_helper %>
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      get <%= edit_helper.tr('@','') %>
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new <%= class_name %>" do
        expect {
          post <%= index_helper %>_url, params: { <%= ns_file_name %>: valid_attributes }
        }.to change(<%= class_name %>, :count).by(1)
      end

      it "redirects to the created <%= ns_file_name %>" do
        post <%= index_helper %>_url, params: { <%= ns_file_name %>: valid_attributes }
        expect(response).to redirect_to(<%= show_helper.gsub("\@#{file_name}", class_name+".last") %>)
      end
    end

    context "with invalid parameters" do
      it "does not create a new <%= class_name %>" do
        expect {
          post <%= index_helper %>_url, params: { <%= ns_file_name %>: invalid_attributes }
        }.to change(<%= class_name %>, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post <%= index_helper %>_url, params: { <%= ns_file_name %>: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested <%= ns_file_name %>" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        patch <%= show_helper.tr('@', '') %>, params: { <%= singular_table_name %>: new_attributes }
        <%= file_name %>.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the <%= ns_file_name %>" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        patch <%= show_helper.tr('@', '') %>, params: { <%= singular_table_name %>: new_attributes }
        <%= file_name %>.reload
        expect(response).to redirect_to(<%= singular_table_name %>_url(<%= file_name %>))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        <%= file_name %> = <%= class_name %>.create! valid_attributes
        patch <%= show_helper.tr('@', '') %>, params: { <%= singular_table_name %>: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested <%= ns_file_name %>" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      expect {
        delete <%= show_helper.tr('@', '') %>
      }.to change(<%= class_name %>, :count).by(-1)
    end

    it "redirects to the <%= table_name %> list" do
      <%= file_name %> = <%= class_name %>.create! valid_attributes
      delete <%= show_helper.tr('@', '') %>
      expect(response).to redirect_to(<%= index_helper %>_url)
    end
  end
end
<% end -%>
