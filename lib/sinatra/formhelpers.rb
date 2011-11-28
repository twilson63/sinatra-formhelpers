require 'sinatra/base'
require 'active_support/all'

module Sinatra
  module FormHelpers
    # FormHelpers are a suite of helper methods
    # built to make building forms in Sinatra
    # a breeze.
    # 
    # link "jackhq", "http://www.jackhq.com"
    # 
    # label :person, :first_name
    # text :person, :first_name
    # 
    # area :person, :notes
    # 
    # etc.
    
    def link(content, href, options={})
      tag :a, content, options.merge(:href => href)  
    end
    
    def label(obj, field, display = "", options={})
      tag :label, display.blank? ? field.to_s.titleize : display, options.merge(:for => "#{obj}_#{field}")
    end
    
    def text(obj, field="", options={})
      content = @params[obj] ? @params[obj][field.to_s] : ""       
      id = 
      single_tag :input, options.merge(:type => "text", :id => field == "" ? obj : "#{obj}_#{field}", :name => field == "" ? obj : "#{obj}[#{field}]", :value => content)
    end
    
    def area(obj, field, options={})
      content = @params[obj] ? @params[obj][field.to_s] : ""        
      tag :textarea, content, options.merge(:id => "#{obj}_#{field}", :name => "#{obj}[#{field}]")
    end
    
    def image(src, options={})
      single_tag :img, options.merge(:src => src)
    end
    
    def submit(obj, value="", options={})
      single_tag :input, options.merge(:type => "submit", :value => value == "" ? obj : value)
    end
    
    def checkbox(obj, field, options={})
      single_tag :input, options.merge(:type => "checkbox", :id => "#{obj}_#{field}", :name => "#{obj}[#{field}]")
      
    end
    
    def radio(obj, field, value, options={})
      #content = @params[obj] && @params[obj][field.to_s] == value ? "true" : ""    
      # , :checked => content   
      tag :input, "", options.merge(:type => "radio", :id => "#{obj}_#{field}_#{value}", :name => "#{obj}[#{field}]", :value => value)
      
    end
    
    def select(obj, field, items, options={})
      content = ""
      items.each do |i|
        content = content + tag(:option, i, { :value => i })
      end
      tag :select, content, options
    end
    
    def hidden(obj, field="", options={})
      content = @params[obj] && @params[obj][field.to_s] == value ? "true" : ""       
      single_tag :input, options.merge(:type => "hidden", :id => "#{obj}_#{field}", :name => "#{obj}[#{field}]")      
    end
    
    # standard open and close tags
    # EX : tag :h1, "shizam", :title => "shizam"
    # => <h1 title="shizam">shizam</h1>
    def tag(name,content,options={})
      with_opts = "<#{name.to_s} #{options.to_html_attrs}>#{content}</#{name}>"
      no_opts = "<#{name.to_s}>#{content}</#{name}>"
      options.blank? ? no_opts : with_opts
    end
    
    # standard single closing tags
    # single_tag :img, :src => "images/google.jpg"
    # => <img src="images/google.jpg" />
    def single_tag(name,options={})
      options ||= options.stringify_keys
      "<#{name.to_s} #{options.to_html_attrs} />"
    end 
    
  end
  
  helpers FormHelpers
end


class Hash
  
  def to_html_attrs
    html_attrs = ""
    self.stringify_keys.each do |key, val|
      html_attrs << "#{key}='#{val}' "
    end
    html_attrs.chop
  end
  
end
