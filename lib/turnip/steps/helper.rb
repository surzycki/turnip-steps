
step 'I debug' do
  byebug
end

step 'take a screenshot' do
  screenshot_and_save_page
end


step 'I clear cookies' do
  Capybara.reset_sessions!
end


step 'I sleep :value' do |value|
  sleep value.to_i
end
