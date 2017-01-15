class VisitorsController < ApplicationController
  def index
    if current_user
      events = current_user.events
      unless current_user.profile_url
        require 'securerandom'
        current_user.profile_url = SecureRandom.hex
        current_user.save!
      end

      if events
        events.each do |event|
          if !event.chainpoint
            event.make_chainpoint
          end
          if event.chainpoint && !event.chainpoint.merkle_root
            event.finish_chainpoint
          end
        end
      end
    end
  end

  def settings
    unless current_user
      redirect_to root_path
      return
    end
    unless current_user.profile_url
      require 'securerandom'
      current_user.profile_url = SecureRandom.hex
      current_user.save!
    end
  end

  def profile

    p_user = User.where(:profile_url => params[:profile]).first
    unless p_user && p_user.profile_active?
      render :text => 'error'
      return false
    end
  end

end
