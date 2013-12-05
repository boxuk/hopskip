# Hopskip

Write [hopscotch](https://github.com/linkedin/hopscotch) introductions simply by adding YAML files to your Rails application.

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

Where each file is name `xyz_tour.yml` where `x` is the name of the controller.

The contents of each of these files should look similar to this:

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

For a full list of params, check out the hopscotch docs.