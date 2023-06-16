# frozen_string_literal: true

require 'fileutils'
require 'open-uri'
require 'rails'

module ChromeTestingDownloader
  class Downloader
    JSON_URL = 'https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json'

    def initialize(version, cache_directory)
      @version = version
      @cache_directory = cache_directory
    end

    def chrome_path
      output = `npx -y @puppeteer/browsers install chrome@#{@version} --path #{@cache_directory}`
      output.split(' ', 2).last.chomp
    end
  end
end
