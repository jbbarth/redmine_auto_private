Redmine Auto Private plugin
===========================

This plugin forces private issues for the projects you want. It is useful for projects with
multiple users who shouldn't be able to see each other's issues. In such a context, users
may not understand the implications of checking "Private" on their issues, or they could
just forget it, which leads to unnecessary information leaks across the project. This plugin
acts as a safety net for those issues by automatically setting every issue "Private" flag
to "true" on Issue creation and update.

Install
-------

You can first take a look at general instructions for plugins [here](http://www.redmine.org/wiki/redmine/Plugins).

Then :
* install the redmine_base_deface plugin (see [here](https://github.com/jbbarth/redmine_base_deface))
* clone this repository in your "plugins/" directory ; if you have a doubt you put it at the good level, you can check you have a plugins/redmine_auto_private/init.rb file
* install dependencies (gems) by running `bundle install` from the root of your redmine instance
* migrate the database by running `rake redmine:plugins` from the root of your redmine instance
* restart your Redmine instance (depends on how you host it)

## Test status

|Plugin branch| Redmine Version   | Test Status      |
|-------------|-------------------|------------------|
|master       | 4.2.5             | [![4.2.5][1]][5] |  
|master       | 4.1.7             | [![4.1.7][2]][5] | 
|master       | master            | [![master][4]][5]|

[1]: https://github.com/jbbarth/redmine_auto_private/actions/workflows/4_2_5.yml/badge.svg
[2]: https://github.com/jbbarth/redmine_auto_private/actions/workflows/4_1_7.yml/badge.svg
[4]: https://github.com/jbbarth/redmine_auto_private/actions/workflows/master.yml/badge.svg
[5]: https://github.com/jbbarth/redmine_auto_private/actions
