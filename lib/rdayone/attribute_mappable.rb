module Rdayone
  module AttributeMappable
    def method_missing(method, *args)
      key = attribute_mappings[method]
      if key
        plist_hash[key]
      else
        super
      end
    end
  end
end
