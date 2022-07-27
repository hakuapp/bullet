class Object
  def bullet_key
    "#{self.class}:#{self.primary_key_value}"
  end

  def primary_key_value
    class_primary_key = self.class.primary_key if self.class.respond_to?(:primary_key)

    if self.class.respond_to?(:primary_keys) && self.class.primary_keys
      return self.class.primary_keys.map { |primary_key| self.send primary_key }.join(',')
    end

    if self.class.respond_to?(:primary_key)
      self.class.primary_key ||= class_primary_key
      return self.send(self.class.primary_key) if self.class.primary_key
    end

    self.id
  end
end
