module Apps
  module NewRelic
    module DeepToHash
      def self.to_hash(value)
        case value
        when Hash
          Hash[value.to_hash.map { |key, value| [key, to_hash(value)] }]
        else
          value
        end
      end
    end
  end
end
