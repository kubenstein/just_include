JustInclude
=============

JustInclude simply wraps included { class_eval { ... } } combo.
class_eval is better then normal method ClassMethods because you can include all kind of things you normally type inside a class. Such as:
- methods
- class methods
- callbacks
- relation definitions
- act_as_*
- constans
- extends / includes
etc...


Usecase
-------
Architecture of an application based on mixins is considered a bad practice and there are other ways to refactor models. But there was a case I really
enjoyed putting some functionality out of a ActiveRecord class. I was working on a large app which core functionality was searching.
I decided that methods related with solr so `searchable` and wrapper on solr search are so important in my app, that they deserve to have their own file.


Installation
-------

	gem 'just_include', git: 'git://github.com/kubenstein/just_include.git'


Usage
-----
Create a module with functionality you want to be part of other class

	module FunctionalityA
	   include JustInclude
	   just_include do

	     extend FriendlyId

	     acts_as_taggable_on :skills

	     searchable do
	     end

	     def method
	     end

	     def self.class_method
	     end

	   end
	 end

Then simply include this module inside other class

	class OtherClass < ActiveRecord::Base 
		include FunctionalityA
	end
	
