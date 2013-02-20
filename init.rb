require 'redmine'
require 'redmine_auto_private/hooks'

#patches for core classes
ActionDispatch::Callbacks.to_prepare do
  require_dependency 'redmine_auto_private/project_patch'
end

# Little hack for using the 'deface' gem in redmine:
# - redmine plugins are not railties nor engines, so deface overrides in app/overrides/ are not detected automatically
# - deface doesn't support direct loading anymore ; it unloads everything at boot so that reload in dev works
# - hack consists in adding "app/overrides" path of the plugin in Redmine's main #paths
# TODO: see if it's complicated to turn a plugin into a Railtie or find something a bit cleaner
Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)

Redmine::Plugin.register :redmine_auto_private do
  name 'Redmine Auto Private plugin'
  description 'This plugin forces private issues for the projects you want'
  author 'Jean-Baptiste BARTH'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  requires_redmine :version_or_higher => '2.1.0'
  version '0.0.1'
  url 'https://github.com/jbbarth/redmine_auto_private'
end
