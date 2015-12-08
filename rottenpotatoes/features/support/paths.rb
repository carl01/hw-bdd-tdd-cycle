# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    puts ">>> " + page_name.to_s
    case page_name
    
    when /^the edit page for "Alien"/
       '/movies/3/edit/'
    # when /^the movies page$/ then '/movies'
    
    when /^the details page for "Star Wars"/
       '/movies/1/'
       
    when /^the details page for "Alien"/
       '/movies/3/'       
       
    when /^the Similar Movies page for "Star Wars"/
       '/movies/find_with_same_director/1'
    when /^the home\s?page$/
      '/movies'
      

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
  
  def match_rails_path_for(page_name)
    if page_name.match(/the edit page for "Alien"/)
      return send "#{$1.gsub(" ", "_")}_path" rescue nil
    end
  end
  
end

World(NavigationHelpers)
