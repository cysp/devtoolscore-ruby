require 'mkmf'

dir_config 'devtoolscore'

create_makefile 'devtoolscore'

command 'mv -f Makefile Makefile.bak'
command 'sed -e \'s/^\.c\.o:$/\.m\.o:/\' Makefile.bak > Makefile'
command 'rm Makefile.bak'
