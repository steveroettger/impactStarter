class Connection

  @@attributes = [:id,
                  :first_name,
                  :last_name,
                  :headline,
                  :location,
                  :picture_url]

  attr_accessor *@@attributes

  def self.convert(connections)
    connections.map do |connection|
      c = Connection.new
      @@attributes.each do |a|
        c.send("#{a}=", connection.send(a))
      end
      c
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
