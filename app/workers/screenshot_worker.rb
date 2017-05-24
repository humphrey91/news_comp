class ScreenshotWorker
  include Sidekiq::Worker

  def perform
    domains = Domain.all
    domains.each do |domain|
      take_screenshot(domain)
      rename_file(domain)
      upload_shot(domain)
      clean_up(domain)
    end
  end

  def take_screenshot(domain)
    system "cd ~/Sites/news_comp/app/assets/images; google-chrome-beta --headless --disable-gpu --screenshot --window-size=412,732 https://www.#{domain.host}"
  end

  def rename_file(domain)
    system "cd ~/Sites/news_comp/app/assets/images; mv screenshot.png #{domain.host}#{Date.today}.png"
  end

  def upload_shot(domain)
    screenshot = Screenshot.new
    src = File.join(Rails.root, 'app', 'assets', 'images', domain.host + Date.today.to_s + ".png")
    screenshot.filename = File.new(src)
    screenshot.domain_id = domain.id
    screenshot.save
  end

  def clean_up(domain)
    system "cd ~/Sites/news_comp/app/assets/images; rm #{domain.host}#{Date.today}.png"
  end

end
