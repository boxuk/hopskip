class TourGenerator < Rails::Generators::Base

  argument :controller, type: :string
  source_root File.expand_path("../templates", __FILE__)

  def generate_tour
    copy_file "template_tour.yml", "app/tours/#{ controller.downcase }_tour.yml"
  end
end