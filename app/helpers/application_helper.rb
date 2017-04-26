module ApplicationHelper

  def add_disabled_unless(condition, input_html)
    if condition
      input_html
    else
      input_html.merge({disabled: true})
    end
  end

end
