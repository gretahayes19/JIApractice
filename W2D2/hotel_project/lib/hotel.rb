require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |k, v| 
            @rooms[k] = Room.new(v)
        end
        
    end

    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end

    def rooms
       @rooms 
    end

    def room_exists?(name)
        if @rooms[name]
            return true
        end

        false
    end

    def check_in(person, room)
        if room_exists?(room)
            if @rooms[room].add_occupant(person)
                print "check in successful"
            else
                print "sorry, room is full"
            end
        else
            print "sorry, room does not exist"
        end   
    end

    def has_vacancy?
        @rooms.values.any? {|room| !room.full?}
    end

    def list_rooms
        # @rooms.each { |name, room| puts "#{name} : #{room.available_space}"}
        @rooms.each { |name, room| puts name + ':' + room.available_space.to_s}
    end

end

