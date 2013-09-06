require 'mkmf'

extension_name = 'devtoolscore'

dir_config extension_name

$CFLAGS << ' -I./DevToolsCore'
$DLDFLAGS << ' -framework Foundation'

create_makefile extension_name

system 'mv -f Makefile Makefile.bak'
system 'sed -e \'s/^\.c\.o:$/\.m\.o:/\' Makefile.bak > Makefile'
system 'rm Makefile.bak'
