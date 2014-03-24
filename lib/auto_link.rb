module AutoLink
  extend ActiveSupport::Concern

  REGEX_MAP = {mentions: "@[0-9A-Za-z_]+", hashtags: "#[0-9A-Za-z_]+"}

  included do
    def self.auto_link(target, options={})
      define_method "linked_#{options[:as] || target}" do
        matchers = Array(options[:on])
        regex = Array(options[:on]).map { |matcher| REGEX_MAP[matcher] }.join('|')

        self.send(target).gsub(/#{regex}/) do |capture|
          "<a href='http://twitter.com/#{capture}' target='_blank'>#{capture}</a>"
        end
      end
    end
  end
end
