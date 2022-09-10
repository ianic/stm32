# extend string
class String
  def titlecase()
    self.split('_').collect(&:capitalize).join
  end

  def identifier()
    return "@\"#{self}\"" if ["error", "break"].include?(self)
    self
  end

  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

class Hash
  def to_o
    JSON.parse to_json, object_class: OpenStruct
  end
end

class Array
  def to_o
    JSON.parse to_json, object_class: OpenStruct
  end
end
