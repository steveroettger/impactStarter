class Connection

  @@attributes = [:id,
                  :first_name,
                  :last_name,
                  :headline,
                  :location,
                  :picture_url]

  attr_accessor *@@attributes

  attr_accessor :user

  def invited?
    !invitation.nil?
  end

  def invitation
    @invitation ||= user.invitations.detect{ |i| i.linkedin_id == id }
  end

  def self.convert(user, connections)
    unsorted = connections.map do |connection|
      next if connection.id == "private"
      c = Connection.new
      @@attributes.each do |a|
        c.send("#{a}=", connection.send(a))
      end
      c.user = user
      c
    end
    unsorted.compact.sort_by{|c| [c.invited?, c.last_name, c.first_name].join(' ') }
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
