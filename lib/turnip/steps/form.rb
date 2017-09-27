module Turnip
  module Steps
    module FormSteps
      step 'I fill in :field with :value' do |field, value|
        fill_in field, with: value
      end


      step 'I select :value from :xpath' do |value, path|
        select value, from: path
      end
    end
  end
end

