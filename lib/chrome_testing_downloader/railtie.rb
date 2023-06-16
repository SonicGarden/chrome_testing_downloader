# frozen_string_literal: true

module ChromeTestingDownloader
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.expand_path('../tasks/chrome_testing_downloader.rake', __dir__)
    end
  end
end
