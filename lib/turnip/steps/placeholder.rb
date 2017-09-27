module Turnip
  module Steps
    module Placeholder
      placeholder :whether_to do
        match /should not/i do
          false
        end

        match /should/ do
          true
        end
      end
    end
  end
end