class VisitorsController < ApplicationController
  def index
    if current_user
      events = current_user.events
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

end
