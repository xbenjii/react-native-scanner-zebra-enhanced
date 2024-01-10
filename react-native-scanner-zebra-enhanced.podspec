require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = { "Crypton" => "info@crypton.nl" }
  s.homepage     = package['homepage']
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/intellidev1991/react-native-scanner-zebra-enhanced.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m,swift}"

  if s.simulator_supported?
    # Settings for iOS simulator
    s.subspec 'Simulator' do |simulator|
      s.ios.vendored_library = 'ios/libs/libZebraSdk_sim.a'
    end
  else
    # Settings for non-simulator iOS
    s.subspec 'NonSimulator' do |non_simulator|
      s.ios.vendored_library = 'ios/libs/libZebraSdk.a'
    end
  end

  s.ios.framework = 'ExternalAccessory', 'CoreBluetooth'
  s.dependency 'React'
end