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

## Usage

```ruby
# SEE: https://googlechromelabs.github.io/chrome-for-testing/
ChromeTestingDownloader.required_version = '114.0.5735.133'
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ChromeTestingDownloader project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/chrome_testing_downloader/blob/main/CODE_OF_CONDUCT.md).
