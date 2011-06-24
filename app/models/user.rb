require 'openssl'

class User < ActiveRecord::Base
  validate :public_key_resolves
  has_many :reports
  
  private
  
  def public_key_resolves
    OpenSSL::X509::Certificate.new(self.public_key)
  rescue OpenSSL::X509::CertificateError => e
    errors.add(:public_key, "Certificate error: #{e.message}")
  end
end
