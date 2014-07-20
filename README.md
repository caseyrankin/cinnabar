# Cinnabar

A simple rails backend for: http://jejacks0n.github.io/mercury/

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

Inside your app/views/*.html.slim
```ruby
= liquid 'title', tag: 'h1' do
  | Default title here
```

This creates a named content section ('title'), an h1 tag, and also contains the default text 'Default title here' until a database record is saved
with new editable content.

## License

This project rocks and uses MIT-LICENSE.
