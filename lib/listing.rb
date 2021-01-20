require_relative 'database_connection'

class Listing

  attr_reader :id, :name, :description

  def initialize(id:, name:, description:)
    @id = id
    @name = name
    @description = description
  end

  def self.all
    listings = DatabaseConnection.query("SELECT * FROM listings;")
    listings.map do |listing|
      Listing.new(
        name: listing['name'],
        description: listing['description'],
        id: listing['id']
      )
    end
  end

  def self.create(name:, description:)
    result = DatabaseConnection.query("INSERT INTO listings (name, description) VALUES('#{name}', '#{description}') RETURNING id, name, description;")
    Listing.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'])
  end
end
