# Cinnabar

A simple rails backend for: http://jejacks0n.github.io/mercury/

## Installation

```ruby
gem 'cinnabar'
```

install & run migration
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

application.css.scss
```scss
@import 'cinnabar/cinnabar';
```

## Usage

```ruby
= liquid 'title'
```
generates

```html
<span id="controller_action_title" data-mercury="full"></span>
```

tag and mercury editor type can be customized by passing in an options hash

```ruby
= liquid 'title', tag: 'h1', mercury_type: 'markdown'
```

also accepts a block, which will act as the default content until the block is edited

```ruby
= liquid 'title' do
  | default title text here
```

## License

This project rocks and uses MIT-LICENSE.
