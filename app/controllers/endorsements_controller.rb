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

    from = 'rhett@odenrep.com'
    my_subject = current_user.name + ' would like an endorsement'
    my_to = e.email

    domain = 'odenrep.com'
    if Rails.env.development?
      domain = 'localhost:3000'
    end
    content = "Hello,\n" + current_user.name + ' is asking for an endorsement of '+
      event.body + "\n\n" + ' Please click here to confirm: '+
      'http://' + domain + '/confirm/' + e.code

    gmail = Gmail.connect('rhett@heyrhett.com', Rails.application.secrets.gmail)

    email = gmail.compose do
      to my_to
      subject my_subject
      body content
    end
    email.deliver! # or: gmail.deliver(email)
    gmail.logout

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
