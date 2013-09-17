#!/usr/bin/env ruby

$:.unshift File.expand_path('lib', File.dirname(__FILE__))
BASEDIR = File.dirname(__FILE__)

require 'devtoolscore'
require 'fastimage'
require 'pp'

p = DevToolsCore::PBXProject.open('/Users/psyc/src/ffx/mobile-misc-weatherzone-iphone/Weatherzone.xcodeproj')

def _sort_project_recursively(o)
  if o.kind_of?(DevToolsCore::PBXGroup)
    o.children = o.children.sort{ |a,b| a.name <=> b.name }
    o.children.each do |c|
      _sort_project_recursively(c)
    end
  end
end
def sort_project_recursively(p)
  _sort_project_recursively(p.root_group)
end

def _project_groups_inorder(o, &block)
  if o.kind_of?(DevToolsCore::PBXGroup)
    yield o if block_given?
    o.children.each { |c| _project_groups_inorder(c, &block) }
  end
end
def project_groups_inorder(p, &block)
  _project_groups_inorder(p.root_group, &block)
end


project_groups_inorder(p) do |g|
  children = g.children
  partitioned = []
  curr_partition = []
  children.each do |c|
    if c.kind_of?(DevToolsCore::PBXFileReference)
      curr_partition.push(c)
    else
      partitioned.push(curr_partition)
      curr_partition = [ c ]
    end
  end
  partitioned.push(curr_partition)

  partitioned.each{ |p| p.sort!{ |a, b| a.name <=> b.name } }

  g.children = partitioned.flatten
end

pp p.write

exit 0

target_plus = p.targets.select{ |t| t.name == 'Weatherzone+' }.first
exit 1 if target_plus.nil?
target_free = p.targets.select{ |t| t.name == 'Weatherzone Free' }.first
exit 1 if target_free.nil?


resource_build_files = []

target_plus.build_phases.each do |bp|
  case bp
  when DevToolsCore::PBXResourcesBuildPhase
    resource_build_files.concat(bp.build_files)
  end
end

free_resource_build_files = []
target_free.build_phases.each do |bp|
  case bp
  when DevToolsCore::PBXResourcesBuildPhase
    free_resource_build_files.concat(bp.build_files)
  end
end


png_2x_files = {}
png_non2x_files = {}

resource_build_files.each do |bf|
  n = bf.name
  case n
  when /@2x(?:~.\+)?\.png$/
    ap = bf.absolute_path
    png_2x_files[n] = FastImage.size(ap)
  when /(?:~.\+)?\.png$/
    ap = bf.absolute_path
    png_non2x_files[n] = FastImage.size(ap)
  end
end

missing_2x_files = []
missing_non2x_files = []

png_2x_files.keys.each do |n|
  n_non2x = n.sub(/@2x((?:~.+)?\.png)$/, '\1')
  missing_non2x_files << n_non2x unless png_non2x_files.include?(n_non2x)
end
png_non2x_files.keys.each do |n|
  n_2x = n.sub(/((?:~.+)?\.png)$/, '@2x\1')
  missing_2x_files << n_2x unless png_2x_files.include?(n_2x)
end

incorrect_2x_files = []
png_2x_files.each do |n,i|
  n_non2x = n.sub(/@2x((?:~.+)?\.png)$/, '\1')
  png_non2x_file = png_non2x_files[n_non2x]
  next unless png_non2x_file
  unless (i[0] == png_non2x_file[0]*2 && i[1] == png_non2x_file[1]*2)
    incorrect_2x_files << [ n, i, png_non2x_file ]
  end
end

plus_files_missing_from_free = resource_files
free_files_missing_from_plus = []

puts 'missing @2x files: (%d)' % missing_2x_files.count
pp missing_2x_files
puts ''
puts 'missing non-@2x files: (%d)' % missing_non2x_files.count
pp missing_non2x_files
puts ''
puts 'incorrectly size @2x files: (%d)' % incorrect_2x_files.count
pp incorrect_2x_files

