class Person

  attr_accessor :entity, :name, :age_range, :type, :best_location

  def initialize(entity)
    @entity = entity
    @name = name
    @type = type
    @age_range = age_range
    @best_location = best_location
  end

  def data
    {
     :name => name,
     :type => type,
     :age_range => age_range
    }
  end

  def best_location
    if entity['best_location']
      entity['best_location']['id']['key']
    else
      entity['locations'].first['id']['key'] unless entity['locations'].blank?
    end
  end

  private

  def name
    entity['name'] || entity['best_name']
  end

  def type
    entity['id']['type']  unless entity['id'].blank?
  end

  def age_range
    entity['age_range']
  end
end
