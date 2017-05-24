class ScreenshotController < ApplicationController

  def index
    if (params[:screenshot].present?) &&    (params[:screenshot][:date].present?)
      # abort("asd")
      @screenshots = Screenshot.where("created_at::date = ?", params[:screenshot][:date])
    else
      @screenshots = Screenshot.where("created_at::date = ?", Date.today)
    end
  end
end
