# app/controllers/screenshots_controller.rb

class ScreenshotsController < ApplicationController


  def show 

  end

  def new

  end

  def create
    url = params[:url]
    save_path = Rails.root.join('public', 'screenshot.png')

    ScreenshotCapturer.capture(url, save_path)

    # Handle the response, maybe redirect or show the screenshot to the user
    redirect_to root_path, notice: 'Screenshot taken!'
  end

  private

  def screenshot_params
    params.permit(:name, :url)
  end

end
