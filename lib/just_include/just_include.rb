# JustInclude
# see homepage for more info:
# https://github.com/kubenstein/just_include


module JustInclude

  def self.included(including_module)
    class << including_module;  attr_accessor :just_include_block; end

    def including_module.included(including_class)
      including_class.class_eval(&(self.just_include_block))
    end

    def including_module.this_code(&block)
      self.just_include_block = block
    end
  end

end
Simply = JustInclude
