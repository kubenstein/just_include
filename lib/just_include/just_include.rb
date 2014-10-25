# JustInclude
# see homepage for more info:
# https://github.com/kubenstein/just_include

module JustInclude

  def self.included(included_module)
    included_module.extend(IncludedModuleClassMethods)
  end

  module IncludedModuleClassMethods
    def just_include(&block)
      class << self; attr_accessor :block; end
      self.block = block
    end

    def included(including_class)
      including_class.class_eval(&self.block)
    end
  end

end
