#Pry.config.editor = proc { |file, line| %("vim" "+#{line}" "#{file}") }

#Pry.config.commands.alias_command "sm", "show-method -l"

#Pry.config.prompt = Pry::NAV_PROMPT
#
# require 'awesome_print'
# AwesomePrint.pry!
def json
  JSON.parse response.body
end

def me
  User.find_by(email: "ian@quiqup.com")
end
