module Hopskip

  class Hopskip::InvalidYAMLError < StandardError; end

  class HopscotchParser

    require 'yaml'

    attr_reader :yaml_source
    attr_writer :controller

    def initialize(controller)
      @controller = controller
      filename = Rails.root.join('app', 'tours', "#{ @controller.controller_name }_tour.yml")
      raise Hopskip::InvalidYAMLError unless valid_yaml_string?(File.open(filename).read)

      if File.exists?(filename)
        @yaml_source = YAML::load(File.open("#{ Rails.root }/app/tours/#{ @controller.controller_name }_tour.yml"))
      end
    end

    def show
      if @yaml_source.present? && @yaml_source[@controller.action_name].present?
        steps = @yaml_source[@controller.action_name]['steps']
        locals = { id: "#{ @controller.controller_name }_#{ @controller.action_name }_tour", steps: steps.to_json }
        Erubis::Eruby.new("<script>var tour = {id: \"<%= id %>\",steps: <%= steps %>};hopscotch.startTour(tour);</script>").result(locals).html_safe
      end
    end

    private

    def valid_yaml_string?(yaml)
      !!YAML.load(yaml)
    rescue Exception => e
      return false
    end

  end
end
