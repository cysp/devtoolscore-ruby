#!/usr/bin/env ruby

$:.unshift File.expand_path('lib', File.dirname(__FILE__))
BASEDIR = File.dirname(__FILE__)

require 'devtoolscore'
require 'pp'

puts 'a'
p = DevToolsCore::PBXProject.open('/Users/psyc/src/STBase64Encoding/STBase64Encoding.xcodeproj')
puts 'b'
pp p
puts 'c'
pp p.name
puts 'd'
targets = p.targets
t = targets[2]
pp targets
puts 'e'
pp p.available_build_configuration_names
pp p.active_build_configuration_name
puts 'f'

if false then
  pp t.expanded_value_for_string('${BUILD_ROOT}')
  pp t.expanded_value_for_string('${BUILD_ROOT}', 'Debug')
  pp t.expanded_value_for_string('${BUILD_ROOT}', 'Release')

  pp t.expanded_value_for_string('${CONFIGURATION_BUILD_DIR}', 'Release')
  pp t.expanded_value_for_string('${CONFIGURATION_BUILD_DIR}', 'Coverage')

  pp t.expanded_value_for_string('${OBJECT_FILE_DIR}')
  pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Debug')
  pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Release')
  pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Coverage')
end

pp t.expanded_value_for_string('${OBJECT_FILE_DIR}')
pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Debug')
pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Release')
pp t.expanded_value_for_string('${OBJECT_FILE_DIR}', 'Coverage')

pp p.path

#pp p.write
#pp p.write(File.join(BASEDIR, 'foo.xcodeproj'))
#puts p.methods
#puts 'e'
