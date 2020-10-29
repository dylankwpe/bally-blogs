require 'rails_helper'

describe "get all posts route", :type => :request do
  
    let!(:posts) { 
        Post.create ({"title":"Title", "body":"Body"})
    }
    
    before {get '/posts'}
    it 'returns all posts' do
        puts response;
    expect(JSON.parse(response.body)["data"].size).to eq(1)
    end

    it 'returns status code 200' do
    expect(response).to have_http_status(:success)
    end


end

describe "get a single post", :type => :request do
    
    before {
        @user = User.create({
            "username":"coolio35", "email":"coolio35@mail.com", 
            "password":"coolio3535", 
            "password_confirmation":"coolio3535"
        })
        @post = Post.create({"title":"Title1", "body":"Body1"})
    }

    it 'gets the post title' do
        get "/posts/#{@post.id}"                          
        expect(JSON.parse(response.body)["data"]).to include({
                            "title"=>"Title1", "body"=>"Body1"
        })
    end
end