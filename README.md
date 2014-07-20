# Cinnabar

## Installation

```ruby
gem 'cinnabar'
```

Run the migrations
```shell
rake cinnabar_engine:install:migrations
rake db:migrate
```
config/routes.rb
```ruby
Mount Cinnabar::Engine => '/'
```

app/views/layouts/application.html.slim
```ruby
= render partial: 'cinnabar_edit_link'
```

Inside your application.css.scss
```scss
@import 'cinnabar/cinnabar';
```

## Usage

## License

This project rocks and uses MIT-LICENSE.
