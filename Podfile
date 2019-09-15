# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

target 'uiTestApp' do
  use_frameworks!
  pod "EasyPeasy", '1.5.1'
  pod 'SBTUITestTunnel/Server'

  target 'uiTestAppTests' do
    inherit! :search_paths
  end

  target 'uiTestAppUITests' do
    inherit! :complete
    pod 'SBTUITestTunnel/Client'
  end

end
