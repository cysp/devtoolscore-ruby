module DevToolsCore
  class PBXBuildFile
    def [](namespace, key)
      case namespace
      when 'settings', :settings
        return self.value_for_setting_key(key)
      end

      return Qnil
    end

    def []=(namespace, key, value)
      case namespace
      when 'settings', :settings
        return self.set_value_for_setting_key(key, value)
      end

      return Qnil
    end
  end
end
