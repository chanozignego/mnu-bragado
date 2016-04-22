class Admin::PartakerDecorator < ApplicationDecorator
  decorates Partaker 
  decorate_enums :rol

end
