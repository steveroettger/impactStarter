class ConnectionList < Struct.new(:connections)

  def self.collate(invitations, linkedin_connections)
    invites_by_id = invitations.index_by(&:linkedin_id)
    connections = linkedin_connections.map do |connection|
      next if connection.id == "private"
      c = Connection.new
      Connection.attributes.each do |a|
        c.send("#{a}=", connection.send(a))
      end
      c.invitation = invites_by_id[connection.id]
      c
    end
    new connections.compact.sort
  end

  include Enumerable

  def each(&block)
    connections.each &block
  end

  def uninvited
    ConnectionList.new connections.select{|c| !c.invited? }
  end

  def unaccepted
    ConnectionList.new connections.select{|c| c.invited? and !c.accepted? }
  end

  def accepted
    ConnectionList.new connections.select{|c| c.accepted? }
  end

  def to_a
    connections.dup
  end

  def concat(other)
    connections.concat(other.to_a)
    self
  end
end
