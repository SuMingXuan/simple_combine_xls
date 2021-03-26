class SimpleCombineXls
  module Config
    class << self
      attr_accessor :placeholder
      def setup
        yield(self)
      end
    end
    @placeholder = " "
  end
end