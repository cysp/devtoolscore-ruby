#!/usr/bin/env ruby

$:.unshift File.expand_path('lib', File.dirname(__FILE__))
BASEDIR = File.dirname(__FILE__)

require 'devtoolscore'
require 'pp'

puts 'a'
p = DevToolsCore::PBXProject.open(File.absolute_path('t/STBase64Encoding.xcodeproj'))
p.root_group.global_id = '000000000000000000000000'
puts 'b'
pp p
puts 'c'
pp p.name
puts 'd'
pp p.targets
targets = p.targets
pp targets
t = targets[2]
puts 'e'
pp p.available_build_configuration_names
#pp p.active_build_configuration_name
puts 'f'


#pp t.expanded_value_for_string('${OBJECT_FILE_DIR}')
#pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Debug')
#pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Release')
#pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Coverage')

pp p.path

pp p.write
#pp p.write(File.join(BASEDIR, 'foo.xcodeproj'))
#puts p.methods
#puts 'e'
