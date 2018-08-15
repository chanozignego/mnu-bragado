module ApplicationHelper

  def add_disabled_unless(condition, input_html)
    if condition
      input_html
    else
      input_html.merge({disabled: true})
    end
  end

  def get_color_by_index(index)
    remainder = index
    remainder = index % 12 if (remainder >= 12) 
    case remainder
    when 0
      color = "#157C3A"
    when 1
      color = "#2A8CC8"
    when 2
      color = "#EADC27"
    when 3
      color = "#D86313"
    when 4
      color = "#F6D9D9"
    when 5
      color = "#D94F42"
    when 6
      color = "#57B1C8"
    when 7
      color = "#524482"
    when 8
      color = "#A1B550"
    when 9
      color = "#49AC7B"   
    when 10
      color = "#EC985C"   
    when 11
      color = "#1C5886"   
    else
      color = "#157C3A"
    end
    return color
  end

end
