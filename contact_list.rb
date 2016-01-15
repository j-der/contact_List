require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  puts "Here is a list of available commands:"
  puts "new - Create a new contact"
  puts "list - List all contacts"
  puts "show - Show a contact"
  puts "search - Search contacts"

  input = gets.chomp!

  case input
  when "new"
    puts "Enter the full name"
    name = gets.chomp!

    puts "Enter the email address"
    email = gets.chomp!

    Contact.create(name, email)
    puts "#{name}, #{email} has been added."

  when "list"
    puts Contact.all

  when "show"
    puts "Please enter an ID number to find a contact."
    id = gets.chomp.to_i
    puts Contact.find(id)

  when "search"
    puts "Please enter a name or email"
    term = gets.chomp.to_s
    puts Contact.search(term)
  end

end
