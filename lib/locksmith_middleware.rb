require 'openssl'

class LocksmithMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    require 'pp'
    pp env
    puts "Received client cert: \n#{env['SSL_CLIENT_CERT']}"
    
    env['CLIENT_PUBLIC_KEY'] = extract_public_key(env)
    
    @app.call(env)
  end

  private
  
  def extract_public_key(env)
    cert_string = env["SSL_CLIENT_CERT"].empty? ? anonymous_cert : env["SSL_CLIENT_CERT"]
    return unless cert_string
    certificate = OpenSSL::X509::Certificate.new(cert_string)
    certificate.public_key.to_s if certificate
  end
  
  def anonymous_cert
    return <<-ENDKEY.gsub(/^ */, '')
      -----BEGIN CERTIFICATE-----
      MIIDuzCCAqOgAwIBAgIJAO5E0ZyxhCyRMA0GCSqGSIb3DQEBBQUAMHQxCzAJBgNV
      BAYTAlVTMRcwFQYDVQQIDA5Ob3J0aCBDYXJvbGluYTESMBAGA1UEBwwJQ2hhcmxv
      dHRlMRYwFAYDVQQKDA1SZXRzeW4gQ2xpZW50MSAwHgYJKoZIhvcNAQkBFhFiZW5A
      dmFuZGdyaWZ0LmNvbTAeFw0xMTA0MDExNTQ1MjRaFw0xMjAzMzExNTQ1MjRaMHQx
      CzAJBgNVBAYTAlVTMRcwFQYDVQQIDA5Ob3J0aCBDYXJvbGluYTESMBAGA1UEBwwJ
      Q2hhcmxvdHRlMRYwFAYDVQQKDA1SZXRzeW4gQ2xpZW50MSAwHgYJKoZIhvcNAQkB
      FhFiZW5AdmFuZGdyaWZ0LmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
      ggEBAMpjfTQbsUDZVekIxgm4rWLFjlWDJF7IPB5cDFKc7zUd9n3iByJnm2XkvR0/
      fulIBxolusKxQy0XMF8W6MDMjzmtfu4077zTIUUh5p5brTcfFJ6mWdRVjfl/O0Kx
      XHQgtifEweU33umP9dsMY7lXGqOrMwI+fJSJB8Lj/eTwTPOuz+jaGcwur8TBwn9L
      c+09a26lCnzoVCZyNS+q/1leEcGg3X/dnhJfPVcboFARlPCN1L28DGK4MSSLSPe1
      uNsRBeTkYbugxu2au01IdjZ6JeEreq4DJKSbiq2jlJi1wvNvtWVliQdOuTy5DO5/
      whWeFYPCdc6Oj/PpTaj+GK9DrF0CAwEAAaNQME4wHQYDVR0OBBYEFLwo/EdFrH7G
      I03LUhjInFBFeKHuMB8GA1UdIwQYMBaAFLwo/EdFrH7GI03LUhjInFBFeKHuMAwG
      A1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADggEBADF26UqdxxYKPSn69GpIvTrq
      1lF3wqB+wGhe8iouR11M1NurxfbaHRQA3Z8tzmi9/3MaJQ7FER+i4DXLCh5SrFiF
      2JXqBGJQdgGdO3xnflYiNAk924yik7Ugs2DVdqPhJiarTtCSZgUVPNIeqAyqB2gP
      +imzygBVZq+Gez5trXanaM087GFMExvZw/mGhI/tokruOlG/zahEMIQWN2w0DfR6
      i3B8d5wGCIln6+iQR/rzzXTbqk06fg0494S511eRMU0zSj6GmALt5vdYlSWhcWZq
      0D1/CtHhVA7FyJKAG65itpBBGc4D3mr41ecPI7LGexnGNnwzoaqBguw/mue4M40=
      -----END CERTIFICATE-----    
    ENDKEY
  end
end

