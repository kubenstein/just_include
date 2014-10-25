require_relative './spec_helper'


describe JustInclude do

  let(:empty_module) { Module.new }
  let(:empty_class) { Class.new }
  let(:functionality_module) do


    module OtherModule
      def class_method_from_other_module
      end
    end

    Module.new do
      include JustInclude
      just_include do

        extend OtherModule

        def self.class_method
        end

        def instance_method
        end

      end
    end

  end

  it 'allows class to include module using just_include DSL' do
    expect(empty_module).not_to respond_to(:just_include)
    empty_module.send :include, JustInclude
    expect(empty_module).to respond_to(:just_include)
  end

  it 'adds class methods to class' do
    expect(empty_class).not_to respond_to(:class_method)
    empty_class.send :include, functionality_module
    expect(empty_class).to respond_to(:class_method)
  end

  it 'adds instance methods to class' do
    expect(empty_class.new).not_to respond_to(:instance_method)
    empty_class.send :include, functionality_module
    expect(empty_class.new).to respond_to(:instance_method)
  end

  it 'adds class methods to class from other module' do
    expect(empty_class).not_to respond_to(:class_method_from_other_module)
    empty_class.send :include, functionality_module
    expect(empty_class).to respond_to(:class_method_from_other_module)
  end

end