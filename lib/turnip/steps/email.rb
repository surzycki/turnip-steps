step 'I open email sent to :recipient' do |recipient|
  send_emails

  open_email(recipient)
end


step 'I open email sent to :recipient with subject :subject' do  |recipient, subject|
  send_emails

  self.current_emails = emails_sent_to(recipient)

  self.current_email = current_emails.find do |e|
    e.subject.include? subject
  end
end


step 'I click :id in the email' do |id|
  current_email.click_link id
end


step 'the email :whether_to contain :content' do |positive, content|
  expectation = positive ?  :to : :not_to

  expect(current_email).send expectation, have_content(content)
end


step 'the email :whether_to have an attachment :attachment' do |positive, attachment|
  expectation = positive ?  :to : :not_to

  expect(current_email.attachments.first.filename).send expectation, eq(attachment)
end


