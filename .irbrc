require 'rubygems'
require 'irb/completion'

class Object
  def interesting_methods
    case self.class
    when Class
      public_methods.sort - Object.public_methods
    when Module
      public_methods.sort - Module.public_methods
    else
      public_methods.sort - Object.new.public_methods
    end
  end
end
