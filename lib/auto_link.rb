module AutoLink
  extend ActiveSupport::Concern

  REGEX_MAP = {mentions: "@[0-9A-Za-z_]+", hashtags: "#[0-9A-Za-z_]+", https: "http://t.co/[0-9A-Za-z]+"}

  included do
    def self.auto_link(target, options={})
      define_method "linked_#{options[:as] || target}" do
        regex = Array(options[:on]).map { |matcher| REGEX_MAP[matcher] }.join('|')

        self.send(target).gsub(/#{regex}/) do |capture|
          if capture.include?("http://")
            "<a href='#{capture}' target='_blank'>#{capture}</a>"
          else
            "<a href='http://twitter.com/#{capture}' target='_blank'>#{capture}</a>"
          end
        end
      end
    end
  end
end
