module OpenSSL
  module X509
    class Certificate
      def self.parse(cert_string)
        # all is well.
        return self.new(cert_string) if cert_string.match(/\n/)
        
        # all is very not well
        cert_string.gsub!(/[-]{5}[A-Z ]*[-]{5}/, '')
        block_lines = []
        while !cert_string.empty?
          block_lines << cert_string.slice!(0..63)
        end
        valid_cert_block = "-----BEGIN CERTIFICATE-----\n"
        valid_cert_block << block_lines.join("\n")
        valid_cert_block << "\n-----END CERTIFICATE-----"
        self.new(valid_cert_block)
      end
    end
  end
end

