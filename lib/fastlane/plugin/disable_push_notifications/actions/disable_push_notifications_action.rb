module Fastlane
  module Actions
    class DisablePushNotificationsAction < Action
      def self.run(params)
        require 'xcodeproj'

        project_path = params[:xcodeproj]
        project = Xcodeproj::Project.open(project_path)

        specificed_target = params[:target]

				target = project.targets.select{|target| target.name == specificed_target}.first || project.targets.first

				attributes = project.root_object.attributes['TargetAttributes']
				target_attributes = attributes[target.uuid]
        system_capabilities = target_attributes['SystemCapabilities']
        
        if system_capabilities.class == Hash
				  #system_capabilities['com.apple.Push']['enabled']='0'
          system_capabilities.delete('com.apple.Push')
        end

        target.build_configurations.each do |item|
            # just remove the entitlements config from code sign
				    item.build_settings['CODE_SIGN_ENTITLEMENTS'] = ""
				end

        project.save()
        
        UI.success("Push notifications in '#{target.name}' disabled successfully !")
      end

      def self.description
        "disable push notifications in capabilities tab"
      end

      def self.authors
        ["qsc"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "disable push notifications in capabilities tab."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :xcodeproj,
            description: "Path to your Xcode project",
            code_gen_sensitive: true,
            default_value: Dir['*.xcodeproj'].first,
            default_value_dynamic: true,
            verify_block: proc do |value|
              UI.user_error!("Please pass the path to the project, not the workspace") unless value.end_with?(".xcodeproj")
              UI.user_error!("Could not find Xcode project") unless File.exist?(value)
            end
            ),
          FastlaneCore::ConfigItem.new(
            key: :target,
            env_name: "UPDATE_PROVISIONING_PROFILE_SPECIFIER_TARGET",
            description: "The target for which to change the Provisioning Profile Specifier. If unspecified the change will be applied to all targets",
            optional: true
            )
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
