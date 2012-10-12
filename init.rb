require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  require_dependency 'redmine/wiki_formatting'
  unless Redmine::WikiFormatting::LinksHelper.included_modules.
      include?(RedmineAutoLinkFix::LinksHelperPatch)

    Redmine::WikiFormatting::LinksHelper.send :include,
        RedmineAutoLinkFix::LinksHelperPatch
  end
end

Redmine::Plugin.register :redmine_auto_link_fix do
  name 'Redmine Auto Link Fix plugin'
  author 'Danil Tashkinov'
  description 'This is a plugin for Redmine that fix AUTO_LINK_RE (http://www.redmine.org/issues/12077)'
  version '0.0.1'
  url 'https://github.com/nodecarter/redmine_auto_link_fix'
  author_url 'https://github.com/Undev'
end
