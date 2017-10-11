# Turnip::Steps

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/turnip/steps`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'turnip-steps'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install turnip-steps

## Usage

```:field``` should contain ids only

```gherkin
I fill in 'form_firstname' with 'Bob'
```

### Email Steps
 ```gherkin
I open an email sent to :recipient
I open an email sent to :recipient with subject :subject
I click :id in the email
the email should (not) contain :content
the email should (not) have an attachment :attachment
take a screenshot of the email
 ```

For capybara to be able to click links in the email
you'll need to set:

```ruby
Capybara.server_port  = 3001
Capybara.app_host     = "http://#{ENV['YOUR_HOST']}:3001"
```

**config/environments/test.rb**
```ruby
config.action_mailer.default_url_options = { host: ENV['YOUR_HOST'], port: 3001 }
```

### Form Steps
```gherkin
I fill in :field with :value
I select :value from :xpath
I attach the file :file to :field
:field filed should (not) have the value :value
:field should (not) contain value :value
```

### Job Steps
```gherkin

```

### Model Steps
```gherkin

```

### Page Steps
```gherkin
I goto the :path page
I goto the :path page with :parameter set to :value
I goto the path: :path
I should (not) be on the :path page
I click on :id
I click on the :element element
I should (not) see :text
the page should (not) have a(n) :page_element element
I reload the page
```


### Helper Steps
```gherkin
I debug
take a screenshot
I clear cookies
I wait :value seconds
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/turnip-steps.
