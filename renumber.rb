#!/usr/bin/env ruby
# vim: se ft=ruby et sw=2 :

$:.unshift File.expand_path('lib', File.dirname(__FILE__))

require 'devtoolscore'
require 'digest'
require 'pp'

def _renumber_project_recursively(o, path)
  pp path + '/' + o.name
  if o.kind_of?(DevToolsCore::PBXGroup)
    name = o.name
    o.children.each do |c|
      _renumber_project_recursively(c, path + '/' + name)
    end
  end
  o.global_id = Digest::RMD160.hexdigest(path + '/' + o.name).slice(0, 24)
end
def renumber_project_recursively(p)
  #_renumber_project_recursively(p.root_group, '')
  p.targets.each do |t|
    t.global_id = Digest::RMD160.hexdigest('target/%s' % [t.name]).slice(0, 24)
    t.build_phases.each_with_index do |bp, i|
      bp.global_id = Digest::RMD160.hexdigest('buildphase/%s/%d' % [t.name, i]).slice(0, 24)
      bp.build_files.each do |bf|
        #bf.global_id = Digest::RMD160.hexdigest(path + '/' + bf.name).slice(0, 24)
      end
    end
  end
end


project_filename = ARGV.shift
exit 1 if project_filename.nil?

exit 1 unless File.directory?(project_filename) and File.executable?(project_filename)

p = DevToolsCore::PBXProject.open(File.absolute_path(project_filename))
exit 1 if p.nil?


renumber_project_recursively(p)

p.write != true
