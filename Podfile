# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!

def common_pods
	pod 'SwiftEntryKit'
	pod 'IQKeyboardManagerSwift'
	pod 'SwiftKeychainWrapper'
	pod 'SDWebImage'

	pod 'Firebase/Analytics'
	pod 'Firebase/Auth'
	pod 'Firebase/Messaging'
	pod 'Firebase/Storage'
	pod 'Firebase/Crashlytics'
	pod 'Firebase/Database'
end

target 'balliZaOtsilki' do
	common_pods
end

target 'balliZaOtsilkiTests' do
	inherit! :search_paths
	common_pods
end

target 'balliZaOtsilkiUITests' do
	common_pods
end