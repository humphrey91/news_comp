class ScreenshotController < ApplicationController

  def index

    @domains = Domain.all

    @date =  DateTime.now.strftime('%m/%d/%Y')
    @doms = ''
    # @dom2 = ''

    if params[:screenshot].present?
      @date = params[:screenshot][:date]
      @doms = params[:screenshot][:domain_names]
      # @dom2 = params[:screenshot][:domain_name2]
    end

    @screenshots = Screenshot.search(search_params)

  end

  def search_params
    params.permit(:screenshot => [:date, :domain_names => []])
  end

end
