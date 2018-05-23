require "administrate/fields/base"

module Administrate
  module Field
    class Array < Field::Base
      def to_s
        data
      end
    end
  end
end
