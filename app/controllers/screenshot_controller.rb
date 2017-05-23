class ScreenshotController < ApplicationController

  def index
    @screenshots = Screenshot.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

end
