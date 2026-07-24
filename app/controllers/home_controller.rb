class HomeController < ApplicationController
  def server_time
    render plain: Time.current.to_s
  end
end
