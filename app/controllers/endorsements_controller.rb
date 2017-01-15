require 'sendgrid-ruby'
include SendGrid

class EndorsementsController < ApplicationController

  def create
    e = Endorsement.new
    require 'securerandom'
    code = SecureRandom.hex + SecureRandom.hex
    e.code = code
    e.email = params[:endorsement][:email]
    event = Event.find(params[:endorsement][:event_id])
    e.event = event
    e.save!

    from = Email.new(email: 'rhett@odenrep.com')
    subject = current_user.name + ' would like an endorsement'
    to = Email.new(email: e.email)
    domain = 'odenrep.com'
    if Rails.env.development?
      domain = 'localhost:3000'
    end
    content = Content.new(type: 'text/plain', value: "Hello,\n" + current_user.name + ' is asking for an endorsement of '+
      event.body + "\n\n" + ' Please click here to confirm: '+
      'http://' + domain + '/confirm/' + e.code)
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_key)
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    flash[:message] ="Email sent!"
    redirect_to root_path
  end

  def update
  end

  def confirm
    e = Endorsement.where(:code => params[:code]).first
    if e
      e.confirmed = true
      e.save
    end
    render :text => 'Thank you for confirming the endorsement! --ODEN Rep'
  end

  private

  def endorsement_params
    params.require(:endorsement).permit(:email, :event_id)
  end

end
