require 'redmine'
require 'redmine_auto_private/hooks'

Redmine::Plugin.register :redmine_auto_private do
  name 'Redmine Auto Private plugin'
  description 'This plugin forces private issues for the projects you want'
  author 'Jean-Baptiste BARTH'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  requires_redmine :version_or_higher => '2.1.0'
  version '0.0.1'
  url 'https://github.com/jbbarth/redmine_auto_private'
end
