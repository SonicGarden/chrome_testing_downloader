# frozen_string_literal: true

require_relative 'chrome_testing_downloader/downloader'
require_relative 'chrome_testing_downloader/version'

module ChromeTestingDownloader
  def chrome_path
    Downloader.new(required_version, cache_directory).chrome_path
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

  module_function :chrome_path, :required_version, :version_file_path, :cache_directory
end
