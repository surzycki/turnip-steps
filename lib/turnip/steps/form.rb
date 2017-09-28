step 'I fill in :field with :value' do |field, value|
  fill_in field, with: value
end


step 'I select :value from :xpath' do |value, path|
  select value, from: path
end


step 'I attach the file :file to :field' do |file,field|
  attach_file field, "#{Rails.root}/spec/fixtures/#{file}", visible: false
end


step ':field field :whether_to have the value :value' do  |field, positive, value|
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


step ':field :whether_to contain value :value' do |field, positive, value|
  expectation = positive ? :to : :not_to

  type = find_by_id(field).tag_name

  if type =~ /img/
    expect(page).send expectation, have_xpath("//img[contains(@src,'#{value}')]")
  else
    raise StandardError, "element type not supported: #{type}"
  end
end



