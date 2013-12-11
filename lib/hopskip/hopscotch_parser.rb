module Hopskip
  class HopscotchParser

    require 'yaml'

    attr_reader :yaml_source
    attr_writer :controller

    def initialize(controller)
      @controller = controller
      filename = Rails.root.join('app', 'tours', "#{ @controller.controller_name }_tour.yml")
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

  end
end
