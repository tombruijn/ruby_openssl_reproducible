# Ruby OpenSSL issue reproducible example

## Explanation

We're seeing an issue where calling `URI.open` to download a file causes an ArgumentError.

Environment:

- Ruby: 3.1.7 (official Docker image)
- Gems:
  - OpenSSL 3.3.0
  - AppSignal 4.5.16 (we assume most versions are affected)

## The error

```
ArgumentError: wrong number of arguments (given 4, expected 0)
/usr/local/lib/ruby/3.1.0/openssl/ssl.rb:277:in `initialize'
/usr/local/lib/ruby/3.1.0/openssl/ssl.rb:277:in `new'
/usr/local/lib/ruby/3.1.0/openssl/ssl.rb:277:in `decode'
/usr/local/lib/ruby/3.1.0/openssl/ssl.rb:277:in `block in verify_certificate_identity'
/usr/local/lib/ruby/3.1.0/openssl/ssl.rb:275:in `each'
/usr/local/lib/ruby/3.1.0/openssl/ssl.rb:275:in `verify_certificate_identity'
/usr/local/lib/ruby/3.1.0/net/protocol.rb:46:in `connect_nonblock'
/usr/local/lib/ruby/3.1.0/net/protocol.rb:46:in `ssl_socket_connect'
/usr/local/lib/ruby/3.1.0/net/http.rb:1089:in `connect'
/usr/local/lib/ruby/3.1.0/net/http.rb:995:in `do_start'
/usr/local/lib/ruby/3.1.0/net/http.rb:984:in `start'
/usr/local/lib/ruby/3.1.0/open-uri.rb:323:in `open_http'
/usr/local/lib/ruby/3.1.0/open-uri.rb:741:in `buffer_open'
/usr/local/lib/ruby/3.1.0/open-uri.rb:212:in `block in open_loop'
/usr/local/lib/ruby/3.1.0/open-uri.rb:210:in `catch'
/usr/local/lib/ruby/3.1.0/open-uri.rb:210:in `open_loop'
/usr/local/lib/ruby/3.1.0/open-uri.rb:151:in `open_uri'
/usr/local/lib/ruby/3.1.0/open-uri.rb:721:in `open'
/usr/local/lib/ruby/3.1.0/open-uri.rb:29:in `open'
/usr/local/bundle/gems/appsignal-4.5.16/ext/base.rb:143:in `block in download_archive'
/usr/local/bundle/gems/appsignal-4.5.16/ext/base.rb:131:in `each'
/usr/local/bundle/gems/appsignal-4.5.16/ext/base.rb:131:in `download_archive'
extconf.rb:22:in `install'
extconf.rb:93:in `<main>'
```

## Usage

```
script/test
```

Wait.

Check the output.

It should include this output:

> ArgumentError: wrong number of arguments (given 4, expected 0)

## Workarounds

- Upgrade to Ruby 3.2.8.
