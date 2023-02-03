# IdealPostcodesRB

IdealPostcodesRB is a Ruby library for the Ideal-Postcodes.co.uk API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'idealpostcodesrb'
```

## Usage

### Set your API Key

You can find your API Key from the [Ideal Postcodes account](https://account.ideal-postcodes.co.uk/tokens) page, then set it like so:

```ruby
@client = IdealPostcodes::Client.new(api_key: "abc123")
```

### Address

```ruby
# Find an address
# Docs: https://docs.ideal-postcodes.co.uk/api#tag/Address-Search/operation/AddressAutocomplete
@client.addresses.find query: "10 drowning street"
#=> #<IdealPostcodes::Collection...

# Lookup address for a postcode
@client.addresses.lookup postcode: "sw1a 0aa"
#=> #<IdealPostcodes::Collection...

# Resolve an address
# Kind should be GBR or USA
# Address would be the ID of the Address in Ideal Postcodes
@client.addresses.resolve kind: "gbr", address: "paf_22690298"

# Retrieves an address as identified by its Unique Delivery Point Reference Number (UDPRN).
@client.addresses.udprn query: "abc123"

# Retrieves an address as identified by its UMPRN (Multiple Residence Unique ID.
@client.addresses.umprn query: "abc123"
```

### Places

```ruby
# Query places across countries
# Docs: https://docs.ideal-postcodes.co.uk/api#tag/Place-Search/operation/FindPlace
@client.places.find query: "London"
#=> #<IdealPostcodes::Collection

# Resolve a Place
@client.places.resolve place: "geonames_2643743"
#=> #<IdealPostcodes::Place id="geonames_2643743"...
```

### Email Validation

Queries and validates a given email address.

```ruby
@client.emails.validate email: "test-email@example.com"
#=> #<IdealPostcodes::Email result="deliverable"...
```

### Phone Validation

Queries and validates a given phone number. Number should include the country code.

```ruby
@client.phones.validate number: "447123123123"
#=> #<IdealPostcodes::Phone valid=true...
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/idealpostcodes.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
