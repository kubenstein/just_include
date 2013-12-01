# JustInclude
# see homepage for more info:
# https://github.com/kubenstein/just_include

module JustInclude

  def self.included(base)
    base.extend(ActiveSupport::Concern)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def just_include(&block)
      included { class_eval(&block) }
    end
  end

end
