module ScreenshotHelper

  def col_size
    html = ''
    if @screenshots.count == 1
      html += '12'
    elsif @screenshots.count == 2
      html += '6'
    else @screenshots.count >= 3
      html+= '4'

    end
  end



end
