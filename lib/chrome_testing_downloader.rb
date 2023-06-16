# frozen_string_literal: true

require 'rails'
require 'open-uri'
require_relative 'chrome_testing_downloader/railtie'
require_relative 'chrome_testing_downloader/version'

module ChromeTestingDownloader
  JSON_URL = 'https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json'

  def chrome_path
    output = `npx -y @puppeteer/browsers install chrome@#{required_version} --path #{cache_directory}`
    output.split(' ', 2).last.chomp
  end

  def version_file_path
    Rails.root.join('.chrome-version')
  end

  def cache_directory
    Rails.root.join('tmp/chrome_testing_downloader')
  end

  def required_version
    version_file_path.read.chomp
  end

  def latest_version(channel = 'Stable')
    json = JSON.parse(OpenURI.open_uri(JSON_URL).read)
    json.dig('channels', channel, 'version')
  end

  module_function :chrome_path, :required_version, :version_file_path, :cache_directory, :latest_version
end
