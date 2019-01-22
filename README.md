# Hopskip

# This repository is unmaintained

| Version | Status | Quality | Coverage |
|:--------:|:------------:|:-----:|:-----:|
| [![Gem Version](https://badge.fury.io/rb/hopskip.png)](http://badge.fury.io/rb/hopskip) | [![Build Status](https://travis-ci.org/boxuk/hopskip.png?branch=master)](https://travis-ci.org/boxuk/hopskip) | [![Code Climate](https://codeclimate.com/github/boxuk/hopskip.png)](https://codeclimate.com/github/boxuk/hopskip) | [![Coverage Status](https://coveralls.io/repos/boxuk/hopskip/badge.png?branch=master)](https://coveralls.io/r/boxuk/hopskip?branch=master) |

Write [hopscotch](https://github.com/linkedin/hopscotch) introductions simply by adding YAML files to your Rails application.

## Requirements

* Rails 3.2+
* Hopscotch `js` and `css` files available. You can use just a standard installation in the asset pipeline or [this gem](https://github.com/ccschmitz/hopscotch-rails).

## Install

Add `hopskip` to your `Gemfile`

    gem 'hopskip'

Add the `hopskip` template to your application layout. It doesn't matter where, as long as `controller` is the controller object currently visible to the user.

    <%= Hopskip::HopscotchParser.new(controller).show %>

## Usage

`hopskip` assumes a file structure like this:

    ├── app
      ├── tours
        ├── dashboards_tour.yml
        └── projects_tour.yml

Where each file is name `xyz_tour.yml` where `xyz` is the name of the controller.

The contents of each of these files should look similar to this:

```YAML
---
index:
  steps:
    - title: Welcome to My App
      content: "Some Text..."
      target: left_util
      placement: right

    - title: Dashboard
      content: "This is your dashboard"
      target: left_util
      placement: bottom
show:
  steps:
    - title: another title...
  #...
```

You can generate an example tour file by using the included generator:

    rails generate tour [controller_name]

For a full list of params, check out the hopscotch docs.

## Advanced Usage

You can also attach methods to the `onClose`, `onEnd` and other callback methods included with hopscotch. Simply define a hopscotch helper in your view:

```JavaScript
<script>
  hopscotch.registerHelper('showError', function() {
    alert("This is an error!");
  });
</script>
```
  In your tour file, you can now ask that this method is called at various points in the tour's lifecycle:

```YAML
---
index:
  steps:
    - title: Welcome to My App
      content: "Some Text..."
      target: left_util
      placement: right
      onNext:
        - showError
```

The `showError` helper will now be executed when next is clicked on the first step. You can pass as many helpers as you like to each callback methods.


## Error Handling

If the YAML file is not correctly formatted, Hopskip will raise a `Hopskip::InvalidYAMLError` exception.

## We use Hopskip

We use Hopskip in [FleetSuite](http://www.boxuk.com/fleetsuite/), a business management system offering a set of collaborative project management tools to optimise processes.
