require File.dirname(__FILE__) + '/helper'
require 'haml'
require 'sinatra/formhelpers'

class FormHelpersTest < Test::Unit::TestCase
  
  def test_default
    assert true
  end
    
  describe 'formhelpers link' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= link 'google', 'http://www.google.com'"
        end
      }
    end
    
    it 'renders an achor tag' do
      get '/'
      assert_equal "<a href='http://www.google.com'>google</a>\n", body
    end    
  end


  describe 'formhelpers label' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= label :person, :first_name"
        end
      }
    end
    
    it 'renders an label tag' do
      get '/'
      assert_equal "<label for='person_first_name'>First Name</label>\n", body
    end    
  end
  
  describe 'formhelpers text without @params' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= text :person, :first_name"
        end
      }
    end
    
    it 'renders an input tag type text without @params' do
      get '/'
      assert_equal "<input name='person[first_name]' id='person_first_name' value='' type='text' />\n", body
    end            
  end

  describe 'formhelpers text with single arg' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= text :q"
        end
      }
    end
    
    it 'renders an input tag type text with single arg' do
      get '/'
      assert_equal "<input name='q' id='q' value='' type='text' />\n", body
    end            
  end
  
  describe 'formhelpers text with @params' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          @params = { :person => {"first_name" => "Tom"}}
          haml "= text :person, :first_name"
        end
      }
    end
        
    it 'renders an input tag type text with @params' do
      get '/'
      assert_equal "<input name='person[first_name]' id='person_first_name' value='Tom' type='text' />\n", body
    end        
  end
  
  describe 'formhelpers area without @params' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= area :person, :notes"
        end
      }
    end
    
    it 'renders an textarea tag type text without @params' do
      get '/'
      assert_equal "<textarea name='person[notes]' id='person_notes'></textarea>\n", body
    end            
  end
  
  describe 'formhelpers textarea with @params' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          @params = { :person => {"notes" => "This is a note"}}
          haml "= area :person, :notes"
        end
      }
    end
    
    it 'renders a textarea tag with @params' do
      get '/'
      assert_equal "<textarea name='person[notes]' id='person_notes'>This is a note</textarea>\n", body
    end        
  end
  

  describe 'formhelpers image' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= image '/images/hello.png'"
        end
      }
    end
    
    it 'renders a textarea tag with @params' do
      get '/'
      assert_equal "<img src='/images/hello.png' />\n", body
    end        
  end

  describe 'formhelpers submit' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= submit :person, 'Create'"
        end
      }
    end
    
    it 'renders an input tag with a submit type' do
      get '/'
      assert_equal "<input value='Create' type='submit' />\n", body
    end        
  end
  

  describe 'formhelpers checkbox' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= checkbox :person, :active"
        end
      }
    end
    
    it 'renders an input tag with a checkbox type' do
      get '/'
      assert_equal "<input name='person[active]' id='person_active' type='checkbox' />\n", body
    end        
  end
  

  describe 'formhelpers radio' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= radio :person, :gender, 'Male'"
        end
      }
    end
    
    it 'renders an input tag with a radio type' do
      get '/'
      assert_equal "<input checked='' name='person[gender]' id='person_gender' value='Male' type='radio'>Male</input>\n", body
    end        
  end
  
  describe 'formhelpers select' do
    setup do
      mock_app {
        helpers Sinatra::FormHelpers
        get '/' do
          haml "= select :person, :relationship, ['Friend','CoWorker','Lead']"
        end
      }
    end
    
    it 'renders an select tag' do
      get '/'
      assert_equal "<select><option value='Friend'>Friend</option><option value='CoWorker'>CoWorker</option><option value='Lead'>Lead</option></select>\n", body
    end        
  end
  

end

