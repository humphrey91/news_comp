class ScreenshotController < ApplicationController

  def index
    @domains = Domain.all
    form_doms_date
    @screenshots = Screenshot.search(search_params)
  end

  def form_doms_date
    @date =  DateTime.now.strftime('%m/%d/%Y')
    @doms = ''
    if params[:screenshot].present?
      @date = params[:screenshot][:date]
      @doms = params[:screenshot][:domain_names]
    end
  end
 
  def search_params
    params.permit(:screenshot => [:date, :domain_names => []])
  end

end
