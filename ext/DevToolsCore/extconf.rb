require 'mkmf'

extension_name = 'devtoolscore'

dir_config extension_name

$CFLAGS << ' -fobjc-arc -O0'
#$DLDFLAGS << ' -framework CoreFoundation'
$DLDFLAGS << ' -framework Foundation'
#$DLDFLAGS << ' -framework CoreServices'
#$DLDFLAGS << ' -rpath /Applications/Xcode5-DP6.app/Contents/Frameworks'
#$DLDFLAGS << ' -rpath /Applications/Xcode5-DP6.app/Contents/SharedFrameworks'
#$DLDFLAGS << ' -rpath /Applications/Xcode5-DP6.app/Contents/OtherFrameworks'
#$DLDFLAGS << ' -rpath /Applications/Xcode5-DP6.app/Contents/PlugIns'
#$DLDFLAGS << ' -rpath /Applications/Xcode5-DP6.app/Contents/PlugIns/Xcode3Core.ideplugin/Contents/Frameworks'
#$DLDFLAGS << ' -F/Applications/Xcode5-DP6.app/Contents/Frameworks'
#$DLDFLAGS << ' -F/Applications/Xcode5-DP6.app/Contents/SharedFrameworks'
#$DLDFLAGS << ' -F/Applications/Xcode5-DP6.app/Contents/OtherFrameworks'
#$DLDFLAGS << ' -framework DVTFoundation'
#$DLDFLAGS << ' -framework DVTKit'
#$DLDFLAGS << ' -framework IDEFoundation'
#$DLDFLAGS << ' -framework IDEKit'
#$DLDFLAGS << ' -framework DevToolsCore'
#$DLDFLAGS << ' -framework DevToolsFoundation'

create_makefile extension_name

system 'mv -f Makefile Makefile.bak'
system 'sed -e \'s/^\.c\.o:$/\.m\.o:/\' Makefile.bak > Makefile'
system 'rm Makefile.bak'
