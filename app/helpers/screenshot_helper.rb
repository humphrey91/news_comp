module ScreenshotHelper

  def col_size_xl
    html = ''
    if @screenshots.count == 1
      html += '12'
    elsif @screenshots.count == 2
      html += '6'
    else @screenshots.count >= 3
      html+= '4'

    end
  end

  def col_size_md
    html = ''
    if @screenshots.count == 1
      html += '12'
    else @screenshots.count == 2
      html += '6'
    end
  end

end
