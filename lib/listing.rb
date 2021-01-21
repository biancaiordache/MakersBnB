require_relative 'database_connection'

class Listing

  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price
  end

  def self.all
    listings = DatabaseConnection.query("SELECT * FROM listings;")
    listings.map do |listing|
      Listing.new(
        name: listing['name'],
        description: listing['description'],
        price: listing['price'],
        id: listing['id']
      )
    end
  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query(
      "INSERT INTO listings (name, description, price)
      VALUES('#{name}', '#{description}', '#{price}')
      RETURNING id, name, description, price;"
    )
    Listing.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price']
    )
  end
end
