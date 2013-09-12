Gem::Specification.new do |s|
	s.name    = 'devtoolscore'
	s.version = '0.0.0'
	s.summary = 'DevToolsCore.framework.rb'
	s.author  = 'Scott Talbot'

	s.files = Dir.glob('ext/**/*.{h,c,m,rb}') + Dir.glob('lib/**/*.rb') + Dir.glob('bin/*')

	s.platform = Gem::Platform::CURRENT
	s.extensions = %w[ ext/devtoolscore/extconf.rb ]

	s.executables = %w[ pbxproj-sort ]

	s.add_development_dependency 'rake-compiler'
end
