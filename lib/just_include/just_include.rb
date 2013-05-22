# JustInclude
# https://github.com/kubenstein/just_include
#
#
# JustInclude simply wraps included { class_eval { ... } } combo
# class_eval is better then normal method ClassMethods because you can include all kind of things
# you normally type inside a class. Such as:
# - methods
# - class methods
# - callbacks
# - relation definitions
# - act_as_*
# - constans
# - extends / includes
# etc...
#
# example:
#   module Abc
#     include JustInclude
#     just_include do
#
#       extend FriendlyId
#
#       acts_as_taggable_on :skills
#
#       searchable do
#       end
#
#       def method
#       end
#
#       def self.class_method
#       end
#
#     end
#   end

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
