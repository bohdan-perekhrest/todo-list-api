module JsonApiHelpers
  def jsonapi_body(id, type, attributes, opts = {})
    b = {}.tap do |body|
      body[type] = {}
      attributes.each_pair do |attr, value|
        body[type][attr] = value
      end
    end.merge(opts).to_json
  end
end
