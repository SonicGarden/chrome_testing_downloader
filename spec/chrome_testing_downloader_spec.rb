# frozen_string_literal: true

RSpec.describe ChromeTestingDownloader do
  it 'has a version number' do
    expect(ChromeTestingDownloader::VERSION).not_to be nil
  end

  it '.latest_version' do
    expect(ChromeTestingDownloader.latest_version).to be_a(String)
  end
end
