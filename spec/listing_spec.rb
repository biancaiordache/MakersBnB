require 'listing'
require 'database_helpers'

describe Listing do
  describe '.all' do
    it 'returns all listings' do
      connection = PG.connect(dbname: 'makers_bnb_test')

      listing = Listing.create(name: 'Listing 1', description: 'Elegant Art Deco Home with Garden in Condesa', price: '100')
      Listing.create(name: 'Listing 2', description: 'Unique and Secluded AirShip with Breathtaking Highland Views', price: '200')
      Listing.create(name: 'Listing 3', description: 'Luxury City Center Loft on a Traffic-Free Street', price: '200')

      listings = Listing.all

      expect(listings.length).to eq 3
      expect(listings.first).to be_a Listing
      expect(listings.first.id).to eq listing.id
      expect(listings.first.name).to eq 'Listing 1'
      expect(listings.first.description). to eq 'Elegant Art Deco Home with Garden in Condesa'
      expect(listings.first.price).to eq '100'
    end
  end

  describe '.create' do
    it 'creates a new listing' do
      listing = Listing.create(name: 'Beautiful House', description: 'Elegant Art Deco Home with Garden in Condesa', price: '100')
      persisted_data = persisted_data(id: listing.id, table: 'listings')

      expect(listing).to be_a Listing
      expect(listing.id).to eq persisted_data[0]['id']
      expect(listing.name).to eq 'Beautiful House'
      expect(listing.description).to eq 'Elegant Art Deco Home with Garden in Condesa'
      expect(listing.price).to eq '100'
    end
  end
end
