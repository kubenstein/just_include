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
I was working on a large app where core functionality was searching.
I decided that methods related with solr so `searchable` and wrapper on solr search are so important in my app, that they deserve to have their own file.
From class point of view, functionality sill belongs to that class.


Installation
-------

	gem 'just_include'


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
	
