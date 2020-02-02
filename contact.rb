class Contact

  @@contacts = []
  @@id = 1

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

  def self.all
    return @@contacts
  end

  def self.find(id)
   @@contacts.each do |contact|
    if contact.id == id 
      return contact
    end 
  end 
  return nil
  end 

  def self.find_by(attribute, value)
    @@contacts.each do |contact|
      if attribute == 1 && contact.first_name == value 
          return contact 
      elsif attribute == 2 && contact.last_name == value 
        return contact
      elsif attribute == 3 && contact.email == value 
        return contact 
      elsif attribute == 4 && contact.note == value 
      return contact 
      end
      else return nil 
    end 
end
 
  def self.delete_all
    @@contacts.clear
  end

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

  def update(key, value)
    if key == 1 
      self.first_name= value
    elsif key == 2 
      self.last_name= value
    elsif key == 3
      self.email= value
    elsif key == 4
      self.note= value 
  else
    "Incorrect entry"
  end 
end 

  def delete
    @@contacts.delete(self)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end

ted = Contact.create("Ted", "Small","tsmall@hotmail.com", "confused")

ed = Contact.create("Ed", "Coke", "ecoke@gmail.com", "2nd or 3rd contact")


p Contact.find(2)

# Contact.find_by(key, value)
# Contact.find_by("a", "ted")

print ted.full_name

Contact.delete_all
p Contact.all