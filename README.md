# disable_push_notifications plugin

## About disable_push_notifications

When we build a enterprise release of our app. We use a `Wildcard App ID`, so we need disable the push notifications. This plugig can do that.

## Usage

```ruby
lane :test do
    # just apply to the first *.xcodrproj file and the first target in this proj
    disable_push_notifications
end
```

specific project or target
```ruby
disable_push_notifications(xcodeproj: your.xcodeproj, target: enterprise)
```

# Caution  

 This plug just remove the entitlements config, becareful of this.  

 You can also add a function to modify entitlements file. I'm very glad to see a PR.

# Note

I will not publish this plugin to [rubygems.org](https://rubygems.org/).  
because this is a very rare requirement.


If you wanna use this, There's two options you use this.

---
### A. 👍use as a local action [fastlane doc](https://docs.fastlane.tools/plugins/create-plugin/#local-actions)

1. just get the [disable_push_notifications_action.rb](https://github.com/tgz/fastlane-plugin-disable_push_nogifications/blob/master/lib/fastlane/plugin/disable_push_notifications/actions/disable_push_notifications_action.rb) file.  
2. Put this file in your `Project/fastlane/Actions` folder  
3. Rename set the filename to `disable_push_notifications.rb` 

    eg.  
    *`project_path/fastlane/actions/disable_push_notifications.rb`*
4. use `disable_push_notifications` command in your `Fastfile`

---
### B. use as a local plugin

Add   
    `gem "fastlane-plugin-[plugin_name]", git: "https://github.com/[user]/[plugin_name]"`  
to your Pluginfile

you should use **bundle exec fastlane any_command** because of [this](https://docs.fastlane.tools/plugins/plugins-troubleshooting/#use-bundle-exec)

---

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
