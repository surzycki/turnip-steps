
step 'I goto the :path page' do |path|
  path = "#{path.downcase.tr(' ', '_')}_path"
  visit route_helpers.send(path)
end


step 'I goto the :path page with :parameter set to :value' do |path, parameter, value|
  path   = "#{path.downcase.tr(' ', '_')}_path"
  params = Hash[parameter, value]

  visit route_helpers.send(path, params)
end


step 'I goto the path: :path' do |path|
  visit path
end


step 'I :whether_to be on the :path page' do |positive, path|
  expectation = positive ? :to : :not_to
  path = "#{path.downcase.tr(' ', '_')}_path"
  url  = route_helpers.send(path)

  expect(current_path).send expectation, eq(url)
end


step 'I click on :id' do |id|
  click_link_or_button id
end


step 'I click on the :element element' do |element|
  find(".#{element}").click
end


step 'I :whether_to see :text' do |positive, text|
  expectation = positive ? :to : :not_to
  expect(page.body).send expectation, have_text(text)
end


step 'the page :whether_to have a(n) :page_element element' do |positive, page_element|
  expectation = positive ? :to : :not_to

  expect(page.body).send expectation, have_css("##{page_element}")
end

step 'I reload the page' do
  path = current_path
  page.reset!

  visit path
end

def route_helpers
  Rails.application.routes.url_helpers
end
