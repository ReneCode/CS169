require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  def from_does_not_equal_to
    errors.add(:base, "From cannot be the same as To") if @from == @to
  end

  def initialize(api_key='')
    @api_key = api_key
    # default inititialize
    @to = @from = 'Kevin Bacon'
  end

  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      # convert all of these into a generic OracleOfBacon::NetworkError,
      #  but keep the original error message
      # your code here
      
      # e is the error. 
      raise OracleOfBacon::NetworkError, e.message
    end
    
    @response = Response.new(xml);
    # your code here: create the OracleOfBacon::Response object
  end

  def make_uri_from_arguments
    @uri = 'http://oracleofbacon.org/cgi-bin/xml' + 
      "?" +
      "p=" + CGI::escape(@api_key) + "&" +
      "a=" + CGI::escape(@from) + "&" +
      "b=" + CGI::escape(@to)
#    http://oracleofbacon.cgi/org-bin/xml?p=my_key&a=Kevin+Bacon&b=Laurence+Olivier
  end
      
  class Response
    attr_reader :type, :data
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private
    # folling methods are not visible from outside

    def parse_response
      if ! @doc.xpath('/error').empty?
        parse_error_response
      elsif !@doc.xpath('/link').empty?
        parse_graph_response
      elsif !@doc.xpath('/spellcheck').empty?
        parse_spellcheck_response
      else
        parse_unknown_response
      end
      # your code here: 'elsif' clauses to handle other responses
      # for responses not matching the 3 basic types, the Response
      # object should have type 'unknown' and data 'unknown response'         
    end
    
    
    def parse_graph_response
      @type = :graph
      @data = [];
      @actor = [];
      @movie = [];
      @doc.xpath('/link/actor').each do | item |
         @actor << item.text
      end
      @doc.xpath('/link/movie').each do | item |
         @movie << item.text
      end
      # 1.actor, 1.movie, 2.actor, 2.movie, ....
      # remove the inner arrays, (flatten)
      # remove the nil elements (compact)
      @data = @actor.zip(@movie).flatten.compact
    end
    
    def parse_spellcheck_response
      @type = :spellcheck
      @data = []
      @doc.xpath('/spellcheck/match').each do | item |
        @data << item.text
      end
    end
    
    def parse_unknown_response
      @type = :unknown
      @data = 'unknown response type'
    end
    
    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end
  end
end

