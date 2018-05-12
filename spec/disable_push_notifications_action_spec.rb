describe Fastlane::Actions::DisablePushNotificationsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The disable_push_notifications plugin is working!")

      Fastlane::Actions::DisablePushNotificationsAction.run(nil)
    end
  end
end
