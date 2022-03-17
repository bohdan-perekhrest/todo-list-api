# frozen_string_literal: true

module Service
  module JsonApi
    class ResourceSerializer
      private_class_method :new

      def self.call(result)
        new(result).call
      end

      def initialize(result)
        render = result[:render]
        @serializer = render.delete(:serializer)
        @options = render
        @object = result[:model]
      end

      def call
        serializer.new(object, options).serializable_hash.to_json
      end

      private

      attr_reader :serializer, :options, :object
    end
  end
end
