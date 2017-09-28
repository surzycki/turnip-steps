step 'I fill in :field with :value' do |field, value|
  fill_in field, with: value
end


step 'I select :value from :xpath' do |value, path|
  select value, from: path
end

step ':field :whether_to contain :value' do  |field, positive, value|
  expectation = positive ? :to : :not_to

  type = find_field(field).tag_name

  if type =~ /input|textarea/
    expect(page).send expectation, have_field(field, exact: value)
  elsif type == 'select'
    expect(page).send expectation, have_select(field, selected: value)
  else
    raise StandardError, "input type not supported: #{type}"
  end
end

