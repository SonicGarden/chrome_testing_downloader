# frozen_string_literal: true

require_relative 'chrome_testing_downloader/version'

module ChromeTestingDownloader
  def required_version=(version, channel = 'Stable')
    require_relative 'chrome_testing_downloader/downloader'

    downloder = Downloader.new(version, channel)
    Selenium::WebDriver::Chrome.path = downloder.chrome_path
    downloder.warn_if_new_version_exists
  end

  module_function :required_version=
end
