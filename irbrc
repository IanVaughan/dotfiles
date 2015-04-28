require 'irb/ext/save-history'
#History configuration
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

def source_for(object, method_sym)
  if object.respond_to?(method_sym, true)
    method = object.method(method_sym)
  elsif object.is_a?(Module)
    method = object.instance_method(method_sym)
  end

  location = method.source_location
  `mvim #{location[0]}:#{location[1]}` if location
  location
rescue
  nil
end
