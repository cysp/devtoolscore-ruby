Gem::Specification.new do |s|
	s.name    = 'devtoolscore'
	s.version = '0.0.0'
	s.summary = 'DevToolsCore.framework.rb'
	s.author  = 'Scott Talbot'

	s.files = Dir.glob('ext/**/*.{c,m,rb}') + Dir.glob('lib/**/*.rb')

	s.extensions = %w[ ext/devtoolscore/extconf.rb ]

	s.add_development_dependency 'rake-compiler'
end
