# frozen_string_literal: true

module Cell
  class Alive
    class << self
      def to_s
        'A'
      end
    end
  end

  class Dead
    class << self
      def to_s
        'd'
      end
    end
  end
end
