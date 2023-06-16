# chrome_testing_downloader

chrome_testing_downloader is a Ruby gem for downloading test versions of Google Chrome.

## Required

- node(npx)

## Installation

Add the following line to your Gemfile and run bundle install:


```ruby
group :test do
  gem 'chrome_testing_downloader', github: 'SonicGarden/chrome_testing_downloader'
end
```

After installation, run the following command to generate the `.chrome-version` file.

```
bundle exec rake chrome:update_version
```

## Usage

In `spec/rails_helper.rb`
```ruby
Selenium::WebDriver::Chrome.path = ChromeTestingDownloader.chrome_path
```

## Rake Tasks

The gem provides the following Rake tasks:

- `chrome:download`: Downloads the required version of Chrome for Testing.
- `chrome:check_version`: Checks if the installed version of Chrome for Testing is up-to-date.
- `chrome:update_version`: Updates the installed version of Chrome for Testing.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ChromeTestingDownloader project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/chrome_testing_downloader/blob/main/CODE_OF_CONDUCT.md).
