require 'rake'

list = Rake::FileList.new(Dir.glob('*'))
p list
list.egrep(/something/)