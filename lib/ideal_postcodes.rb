require "faraday"
require "json"

require_relative "ideal_postcodes/version"

module IdealPostcodes

  autoload :Client, "ideal_postcodes/client"
  autoload :Collection, "ideal_postcodes/collection"
  autoload :Error, "ideal_postcodes/error"
  autoload :Resource, "ideal_postcodes/resource"
  autoload :Object, "ideal_postcodes/object"
  
  autoload :AddressesResource, "ideal_postcodes/resources/addresses"
  autoload :EmailsResource, "ideal_postcodes/resources/emails"
  autoload :PhonesResource, "ideal_postcodes/resources/phones"
  autoload :PlacesResource, "ideal_postcodes/resources/places"

  autoload :Address, "ideal_postcodes/objects/address"
  autoload :Email, "ideal_postcodes/objects/email"
  autoload :Phone, "ideal_postcodes/objects/phone"
  autoload :Place, "ideal_postcodes/objects/place"

end
