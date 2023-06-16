namespace :chrome do
  desc 'Download Chrome For Testing'
  task download: :environment do
    ChromeTestingDownloader.chrome_path
  end

  desc 'Check Chrome For Testing version'
  task check_version: :environment do
    if ChromeTestingDownloader.latest_version != ChromeTestingDownloader.required_version
      puts 'Chrome For Testing version is old. Please run `rake chrome_testing_downloader:update_version`'
      exit 1
    end
  end

  desc 'Update Chrome For Testing version'
  task update_version: :environment do
    File.write(ChromeTestingDownloader.version_file_path, "#{ChromeTestingDownloader.latest_version}\n")
  end
end
