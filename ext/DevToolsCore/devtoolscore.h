#ifndef DEVTOOLSCORE_H
#define DEVTOOLSCORE_H

#include "ruby.h"

extern VALUE dtc_rbmDevToolsCore;

extern VALUE dtc_alloc_raise(VALUE klass);

#define DEVTOOLSCORE_DECLARE_CLASSES(klass) extern Class dtc_c##klass; extern VALUE dtc_rbc##klass;

extern Class dtc_cPBXGlobalID;

DEVTOOLSCORE_DECLARE_CLASSES(PBXObject)
DEVTOOLSCORE_DECLARE_CLASSES(PBXContainer)
DEVTOOLSCORE_DECLARE_CLASSES(PBXProject)

DEVTOOLSCORE_DECLARE_CLASSES(PBXContainerItem)
DEVTOOLSCORE_DECLARE_CLASSES(PBXProjectItem)
DEVTOOLSCORE_DECLARE_CLASSES(PBXReference)
DEVTOOLSCORE_DECLARE_CLASSES(PBXFileReference)

DEVTOOLSCORE_DECLARE_CLASSES(PBXFolder)

DEVTOOLSCORE_DECLARE_CLASSES(PBXGroup)
DEVTOOLSCORE_DECLARE_CLASSES(PBXTargetGroup)
DEVTOOLSCORE_DECLARE_CLASSES(PBXVariantGroup)
DEVTOOLSCORE_DECLARE_CLASSES(XCVersionGroup)

DEVTOOLSCORE_DECLARE_CLASSES(PBXFramework)

DEVTOOLSCORE_DECLARE_CLASSES(PBXFolder)

DEVTOOLSCORE_DECLARE_CLASSES(PBXBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXAppleScriptBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXCopyFilesBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXFrameworksBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXHeadersBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXJavaArchiveBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXResourcesBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXRezBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXShellScriptBuildPhase)
DEVTOOLSCORE_DECLARE_CLASSES(PBXSourcesBuildPhase)

DEVTOOLSCORE_DECLARE_CLASSES(PBXBuildFile)

DEVTOOLSCORE_DECLARE_CLASSES(PBXTarget)

#undef DEVTOOLSCORE_DECLARE_CLASSES

#endif
