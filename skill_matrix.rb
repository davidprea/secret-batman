filename = "./skill_matrix.html"
if File.exists?( filename )
  File.delete( filename )
end
file = File.new(filename, "w");

skillz = {"Body" => ["Awe", "Athletics", "Awareness", "Explore", "Song", "Craft" ],
            "Heart" => ["Inspire", "Travel", "Insight", "Healing", "Courtesy", "Battle" ],
            "Wits" => ["Persuade", "Stealth", "Search", "Hunting", "Riddle", "Lore" ]}
          
skillz.keys.each do | key |
  skills = skillz[key]
  
  file.write( "<div class=\"attr_#{key.downcase}_skills_wrapper\">\n")
  skills.each do | skill |
    file.write( "\t<div class=\"attr_skill_wrapper\">\n" )
    file.write( "\t\t<input type='checkbox' class='attr_favoured_skill_checkbox' name=\"attr_#{skill.downcase}_favoured_p\" value=1>\n")
    file.write( "\t\t<label>#{skill}</label>\n")
    file.write( "\t\t\t<div class=\"attr_skill_boxes_wrapper\">\n" )
    6.times do | i |
      file.write( "\t\t\t\t<input type=\"checkbox\" class=\"attr_skill_checkbox\" name=\"attr_#{skill.downcase}#{i+1}\" value=1>\n" )
    end
    file.write( "\t\t\t</div>\n")
    value_string = ""
    6.times do | i |
      value_string += "@{#{skill}#{i + 1}}"
      if( i < 5 )
        value_string += " + "
      end
    end
    file.write( "\t\t<input type=\"hidden\" name=\"attr_#{skill.downcase}\" value=\"#{value_string}\">\n" )
    file.write( "\t</div>\n")
  end
  file.write( "</div>\n" )
end

  
