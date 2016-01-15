require 'csv'
require 'pry'

class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  class << self

    def all
      @contacts = []
      CSV.foreach("contacts.csv") do |contact|
        @contacts << contact
        end
      @contacts
    end

    def create(name, email)
      CSV.open("contacts.csv", "email") do |csv|
        csv << [name, email]
      end
    end

    def find(id)
     i = 0
     listing = ''
     CSV.foreach("contacts.csv") do |line|
      i += 1
      if id == i
        return line
        end
      end
       if listing == ''
        listing = "No contact found."
      end
      listing
    end

    def search(term)
      listing = ''
      CSV.foreach("contacts.csv") do |row|
        line = "#{row[0]}, (#{row[1]})"
        if line.downcase.match (/.*#{term.downcase}.*/)
          listing << "\n#{row[0]}, (#{row[1]})"
        end
      end
        if listing == ''
          listing = "No contact found."
        end
        listing
    end

  end

end
