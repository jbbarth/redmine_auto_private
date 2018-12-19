require 'redmine'

#patches for core classes
ActiveSupport::Reloader.to_prepare do
  require_dependency 'redmine_auto_private/hooks'
  require_dependency 'redmine_auto_private/project_patch'
end

Redmine::Plugin.register :redmine_auto_private do
  name 'Redmine Auto Private plugin'
  description 'This plugin forces private issues for the projects you want'
  author 'Jean-Baptiste BARTH'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  requires_redmine :version_or_higher => '2.1.0'
  version '0.0.1'
  url 'https://github.com/jbbarth/redmine_auto_private'
  #doesn't work since redmine evaluates dependencies as it loads, and loads in lexical order
  #TODO: see if it works in Redmine 2.6.x or 3.x when they're released
  # requires_redmine_plugin :redmine_base_rspec, :version_or_higher => '0.0.3' if Rails.env.test?
  # requires_redmine_plugin :redmine_base_deface, :version_or_higher => '0.0.1'
end
