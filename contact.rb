class Contact

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes!!
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name,email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end


  # This method should return all of the existing contacts
  def self.all
    return @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
   @@contacts.each do |contact|
    if contact.id == id 
      return contact
    end 
  end 
  return nil
  end 

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty

  def self.find_by(attribute, value)
    @@contacts.each do |contact|
      if attribute == "A" && contact.first_name == value 
          return contact 
      elsif attribute == "B" && contact.last_name == value 
        return contact
      elsif attribute == "C" && contact.email == value 
        return contact 
      elsif attribute == "D" && contact.note == value 
      return contact 
      end
    end 
end

  # This method should delete all of the contacts
 
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should allow you to specify 
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact

  def update(key, value)
    if key == "A" 
      self.first_name= value
    elsif key == "B" 
      self.last_name= value
    elsif key == "C"
      self.email= value
    elsif key == "D"
      self.note= value 
  else
    "Incorrect entry"
  end 
end 

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end


         
#     if gets.chomp == 1 
#       print "Please enter the contact's new First Name: "
#       contact.first_name = gets.chomp
#     elsif gets.chomp == 2
#       print "Please enter the contact's new Last Name: "
#       conact.last_name = gets.chomp
#     elsif  gets.chomp == 3
#       print "Please enter the contact's new email: " 
#       contact.email = gets.chomp
#     elsif gets.chomp == 4
#       print "Please enter the contact's new note: " 
#       contact.note = gets.chomp
#     end 
#   else 
#     print "That Contact ID doesn't exist. Please enter another Contact ID. "
#   end 
# end 
# end 

#   end 

  # Feel free to add other methods here, if you need them.

  attr_accessor :id, :email, :note

  def first_name
    @first_name
  end

  def first_name=(note)
    @first_name = note
  end 

  def last_name
    @last_name
  end

  def last_name=(note)
    @last_name = note
  end

  ####INSTANCE METHODS GO HERE!


end

ted = Contact.create("Ted", "Small","tsmall@hotmail.com", "confused")

ed = Contact.create("Ed", "Coke", "ecoke@gmail.com", "2nd or 3rd contact")


p Contact.find(2)

# print "Enter the attribute with which you want to search: A = First Name; B = Last Name; C = Email; D = Notes "
# key = gets.chomp 
# print "What is the value of #{key}? "
# value = gets.chomp

# Contact.find_by(key, value)



# Contact.find_by("a", "ted")

print ted.full_name

Contact.delete_all
p Contact.all