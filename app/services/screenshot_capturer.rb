# app/services/screenshot_capturer.rb

require 'selenium-webdriver'

class ScreenshotCapturer
  def self.capture(url, save_path)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    # options.add_argument('--disable-gpu')  # Uncomment this if you're on Windows.
    options.add_argument('--no-sandbox')
    
    driver = Selenium::WebDriver.for(:chrome, options: options)
    driver.navigate.to(url)

    driver.save_screenshot(save_path)
    
    driver.quit
  end

  private

end


# ScreenshotCapturer.capture("https://www.humbledaisy.com", 'humbledaisy
  .png')