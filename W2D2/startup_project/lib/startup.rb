require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return true if @salaries[title]
        false
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title) 
        else
            raise "invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if salary <= @funding
            employee.pay(salary)
            @funding -= salary
        else
            raise "not enough funds"
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

end
