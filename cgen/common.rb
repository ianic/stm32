# extend string
class String
  INTEGER_REGEX = /\A[+-]?\d+\z/

  HEXADECIMAL_REGEX = /\A[+-]?0[xX]/

  def titlecase()
    self.split('_').collect(&:capitalize).join
  end

  def camelcase
    tc = self.titlecase
    tc[0].downcase + tc[1..]
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

  def fix_hex
    self.sub!("0X", "0x") if self.start_with?("0X")
    self.downcase! if self.start_with?("0x")
    self
  end

  def is_integer?
    INTEGER_REGEX.match?(self)
  end

  def is_hexadecimal_literal?
    HEXADECIMAL_REGEX.match?(self)
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
