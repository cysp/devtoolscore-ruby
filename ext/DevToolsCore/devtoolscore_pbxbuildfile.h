#ifndef DEVTOOLSCORE_PBXBUILDFILE_H
#define DEVTOOLSCORE_PBXBUILDFILE_H

#include "ruby.h"
#include "devtoolscore_pbxobject.h"

#if defined(__OBJC__) && __OBJC__ != 0
@class PBXBuildFile;
#else
# define PBXBuildFile void
#endif


struct dtc_rbcPBXBuildFile_s {
    struct dtc_rbcPBXObject_s super;
	VALUE buildphase;
	VALUE absolute_path_value;
};


extern void dtc_pbxbuildfile_define(void);

extern VALUE dtc_pbxbuildfile_new(PBXBuildFile *buildFile, VALUE parent_value);

extern VALUE dtc_pbxbuildfile_alloc(VALUE klass);
extern VALUE dtc_pbxbuildfile_initialize(VALUE self, PBXBuildFile *buildFile, VALUE parent_value);
extern void dtc_pbxbuildfile_mark(struct dtc_rbcPBXBuildFile_s *s);
extern void dtc_pbxbuildfile_dealloc(struct dtc_rbcPBXBuildFile_s *s);

extern PBXBuildFile *dtc_pbxbuildfile_pbxobject(VALUE object);

#endif
