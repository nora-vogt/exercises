class Mail
  def to_s
    "#{self.class}"
  end
end

class Email < Mail
  attr_accessor :subject, :body

  def initialize(subject, body)
    @subject = subject
    @body = body
  end
end

class Postcard < Mail
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

module Mailing
  def receive(mail, sender)
    mailbox << mail unless reject?(sender)
  end

  # Change if there are sources you want to block.
  def reject?(sender)
    false
  end

  def send_mail(destination, mail)
    "Sending #{mail} from #{name} to: #{destination}"
    # Omitting the actual sending.
  end
end

class CommunicationsProvider
  attr_reader :name, :account_number

  def initialize(name, account_number=nil)
    @name = name
    @account_number = account_number
  end
end

class EmailService < CommunicationsProvider
  include Mailing

  attr_accessor :email_address, :mailbox

  def initialize(name, account_number, email_address)
    super(name, account_number)
    @email_address = email_address
    @mailbox = []
  end

  def empty_inbox
    self.mailbox = []
  end
end

class TelephoneService < CommunicationsProvider
  def initialize(name, account_number, phone_number)
    super(name, account_number)
    @phone_number = phone_number
  end
end

class PostalService < CommunicationsProvider
  include Mailing

  attr_accessor :street_address, :mailbox

  def initialize(name, street_address)
    super(name)
    @street_address = street_address
    @mailbox = []
  end

  def change_address(new_address)
    self.street_address = new_address
  end
end

rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

puts johns_postal_service.send_mail(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
# => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError)

=begin

You've Got Mail!

Can you decipher and fix the error that the following code produces

The error on line 92 is due to the use of `#send`. The method being invoked here is `Object#send`, rather than `PostalService#send`. `Object#send` invokes the method identified by the symbol passed as the first arg. In this case, the return value of `ellens_postal_service.street_address`, which is the string `'860 Blackbird Ln.` is being passed to `Object#send` as the name of the method to invoke. There is no method defined with this name, raising the NoMethodError.

The intended method to invoke here is the `#send` method defined in the `Mailing` module. In order to do this, we need to include the `Mailing` module within the `PostalService` class. Upon doing so, the code will run as expected.

If we don't actually intend to overwrite the `Object#send` method, we can change the name of `Mailing#send` to `#send_mail`. This is a better choice, because this method isn't actually meant to override `Object#send`.

LS Takeaway: Accidental method overriding!
=end