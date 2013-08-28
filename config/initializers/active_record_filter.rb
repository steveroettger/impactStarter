module ActiveRecordFilter

  def filter_by(*attributes)
    m = Module.new
    m.send :define_method, :filter_attributes do
      attributes.map &:to_s
    end
    extend m
    extend FilterMethod
  end

  module FilterMethod
    def filter(search='')
      wheres = []
      values = []

      search.to_s.split(' ').each do |v|
        filter_attributes.each do |a|
          wheres << "#{a} LIKE ?"
          values << "#{v}%"
          wheres << "#{a} LIKE ?"
          values << "% #{v}%"
        end
      end

      if wheres.empty?
        where(primary_key => 0)
      else
        where [wheres.join(' OR '), *values]
      end
    end
  end
end

ActiveRecord::Base.extend ActiveRecordFilter
