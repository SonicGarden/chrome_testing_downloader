# frozen_string_literal: true

require 'fileutils'
require 'open-uri'
require 'rails'

module ChromeTestingDownloader
  class Downloader
    JSON_URL = 'https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json'

    def self.cache_directory
      Rails.root.join('tmp/chrome_testing_downloader')
    end

    def initialize(version, channel = 'Stable')
      @version = version
      @channel = channel
    end

    def chrome_path
      download_path = self.class.cache_directory
      output = `npx -y @puppeteer/browsers install chrome@#{@version} --path #{download_path}`
      output.split(' ', 2).last.chomp
    end

    def warn_if_new_version_exists
      json = JSON.parse(fetch_versions_json)
      last_version = json.dig('channels', @channel, 'version')

      if last_version != @version
        warn "WARNING: The latest version of Chrome for Testing #{@channel} channel is #{last_version}."
      end
    end

    private

    def fetch_versions_json
      cache_directory = self.class.cache_directory
      cache_file = cache_directory.join('last-known-good-versions.json')

      if File.exist?(cache_file) && File.mtime(cache_file) > Time.current - 86400
        return File.read(cache_file)
      end

      content = OpenURI.open_uri(JSON_URL).read
      FileUtils.mkdir_p(cache_directory)
      File.write(cache_file, content)
      content
    end
  end
end
