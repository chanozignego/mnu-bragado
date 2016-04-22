class ApplicationDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper
  
  delegate_all

  class << self
    # Shortcut to define a decorated money-rails attribute.
    #
    #    decorate_money :price
    #
    #    def price
    #      h.humanized_money_with_symbol object.price
    #    end
    #
    def decorate_money(*attrs)
      attrs.each do |attr|
        define_method attr do
          h.humanized_money_with_symbol object.send(attr)
        end
      end
    end

    def decorate_files(*file_attributes)
      file_attributes.each do |attr|
        define_method attr do
          object.send(attr).try :url
        end
      end
    end

    def decorate_enums(*attrs)
      attrs.each(&method(:decorate_enum))
    end

    def decorate_enum(attr, translation_key: get_enum_translation_key(attr))
      define_method attr do
        val = object.public_send(attr)
        return unless val.present?
        I18n.t(translation_key).fetch(val.to_sym)
      end
    end

    private

    def get_enum_translation_key(enum_name)
      [object_class.model_name.i18n_key, enum_name.to_s.pluralize].join(".")
    end
  end

  def label(type, content)
    h.content_tag :div, class: "label label-#{type}" do
      block_given? ? yield : content
    end
  end
end
