
# frozen_string_literal: true
# name: discourse-native-tag-filters
# about: Adds native multi-tag filters to Discourse discovery and category topic lists
# version: 1.0.0
# authors: ban2zai
# url: https://github.com/ban2zai/discourse-native-tag-filters

enabled_site_setting :discourse_native_tag_filters_enabled

module ::DiscourseNativeTagFilters
  PLUGIN_NAME = "discourse-native-tag-filters".freeze
end

register_asset "stylesheets/common/native-tag-filter.scss"

require_relative "lib/discourse_native_tag_filters/engine"

after_initialize do
  reloadable_patch do
    TagsController.prepend(DiscourseNativeTagFilters::TagsControllerExtension)
  end
end
