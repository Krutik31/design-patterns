# Value design pattern states that we don't have to define multiple reusable constants in the class in which we have operational logic.
# We can create another class that handles the definition of constants and we can include them in the multiple classes wherever we want to use it.

# In below example, we haven't use value pattern.
class EmailHandler
    def initialize(emails)
        @emails = emails
    end
    
    def get_data
        emails.map { |email| {
                name: email.match(/([^@]*)/).to_s,
                domain: email.split("@").last
            }
        }
    end
    
    private
    attr_reader :emails
end

puts EmailHandler.new(["abc@xyz.com", "abd@xyx.cd"]).get_data


# Now lets see how we can make use of value pattern in above scenario.
# EmailValue class contains all the methods where constants are defined.
# This way code becomes more handy and manageable.
class EmailValues
    def initialize(email)
        @email = email
    end
    
    def name
        email.match(/([^@]*)/).to_s
    end
    
    def domain
        email.split("@").last
    end
    
    def to_h
        { name: name, domain: domain }
    end
    
    private
    attr_reader :email
end

class EmailHandler
    def initialize(emails)
        @emails = emails
    end
    
    def get_data
        emails.map { |email| EmailValues.new(email).to_h }
    end
    
    private
    attr_reader :emails
end

puts EmailHandler.new(["abc@xyz.com", "abd@xyx.cd"]).get_data
