#import <Foundation/Foundation.h>
#import "DevToolsCore.framework.h"

#include "ruby.h"

#include "devtoolscore.h"
#include "devtoolscore_pbxobject.h"

#import <objc/runtime.h>


VALUE dtc_pbxobject_alloc(VALUE klass) {
	struct dtc_rbcPBXObject_s *s = NULL;
	VALUE object_value = Data_Make_Struct(dtc_rbcPBXObject, struct dtc_rbcPBXObject_s, dtc_pbxobject_mark, dtc_pbxobject_dealloc, s);
    return object_value;
}

VALUE dtc_pbxobject_initialize(VALUE self, PBXObject *object) {
	struct dtc_rbcPBXObject_s *s = NULL;
	Data_Get_Struct(self, struct dtc_rbcPBXObject_s, s);
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return Qnil;
	}

	@autoreleasepool {
		s->object = (__bridge_retained CFTypeRef)object;

        PBXGlobalID *objectGlobalID = object.globalID;
        if (objectGlobalID) {
            VALUE object_globalid_value = rb_str_new_cstr(objectGlobalID.hexString.UTF8String);
            rb_ivar_set(self, rb_intern("@global_id"), object_globalid_value);
        }
	}

	return self;
}

void dtc_pbxobject_mark(struct dtc_rbcPBXObject_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}
}

void dtc_pbxobject_dealloc(struct dtc_rbcPBXObject_s *s) {
	if (!s) {
		rb_raise(rb_eArgError, "self is NULL?");
		return;
	}

    @autoreleasepool {
        CFTypeRef o = s->object;
        if (o) {
            CFRelease(o);
        }
    }
}


PBXObject *dtc_pbxobject_pbxobject(VALUE object) {
	struct dtc_rbcPBXObject_s *s = NULL;
	Data_Get_Struct(object, struct dtc_rbcPBXObject_s, s);
	if (!s) {
		return NULL;
	}
	return (__bridge PBXObject *)s->object;
}

static VALUE pbxobject_globalid_set(VALUE self, VALUE globalid_value) {
    Check_Type(globalid_value, T_STRING);

    struct dtc_rbcPBXObject_s *s = NULL;
    Data_Get_Struct(self, struct dtc_rbcPBXObject_s, s);
    if (!s) {
        rb_raise(rb_eArgError, "self is NULL?");
        return Qnil;
    }

    globalid_value = StringValue(globalid_value);

    @autoreleasepool {
        PBXObject * const o = (__bridge PBXObject *)DTC_PBXOBJECT(s)->object;
        if (!o) {
            rb_raise(rb_eArgError, "target is nil?");
            return Qnil;
        }

        NSString * const globalIdString = [[NSString alloc] initWithBytes:RSTRING_PTR(globalid_value) length:RSTRING_LEN(globalid_value) encoding:NSUTF8StringEncoding];
        if (globalIdString.length != 24) {
            rb_raise(rb_eArgError, "globalid length isn't 24");
            return Qnil;
        }

        char globalIdStringBytes[24] = { '\0' };
        [globalIdString getBytes:globalIdStringBytes maxLength:24 usedLength:NULL encoding:NSASCIIStringEncoding options:NSStringEncodingConversionAllowLossy range:(NSRange){ .length = 24 } remainingRange:NULL];
        for (int i = 0 ; i < 12; ++i) {
            char t = 0;
            char h = globalIdStringBytes[i*2];
            char l = globalIdStringBytes[i*2+1];
            switch (h) {
                case '0': case '1': case '2': case '3': case '4':
                case '5': case '6': case '7': case '8': case '9': {
                    t = (h - '0') << 4;
                } break;
                case 'a': case 'b': case 'c': case 'd': case 'e': case 'f': {
                    t = (h - 'a') << 4;
                } break;
                case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': {
                    t = (h - 'A') << 4;
                } break;
                default: {
                    rb_raise(rb_eArgError, "globalid not a hex string");
                    return Qnil;
                } break;
            }
            switch (l) {
                case '0': case '1': case '2': case '3': case '4':
                case '5': case '6': case '7': case '8': case '9': {
                    t += (l - '0');
                } break;
                case 'a': case 'b': case 'c': case 'd': case 'e': case 'f': {
                    t += (l - 'a');
                } break;
                case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': {
                    t += (l - 'A');
                } break;
                default: {
                    rb_raise(rb_eArgError, "globalid not a hex string");
                    return Qnil;
                } break;
            }
            globalIdStringBytes[i] = t;
        }

        PBXGlobalID * const globalID = o.globalID;
        if (!globalID) {
            rb_raise(rb_eArgError, "object.globalID is nil?");
            return Qnil;
        }

        Ivar const bytesIVar = class_getInstanceVariable(dtc_cPBXGlobalID, "_bytes");
        if (!bytesIVar) {
            rb_raise(rb_eRuntimeError, "PBXGlobalID->_bytes doesn't exist?");
            return Qnil;
        }
        ptrdiff_t const bytesIVarOffset = ivar_getOffset(bytesIVar);
        char *globalIDBytes = (((__bridge void *)globalID) + bytesIVarOffset);
        memcpy(globalIDBytes, globalIdStringBytes, 12);

        PBXGlobalID *objectGlobalID = o.globalID;
        if (objectGlobalID) {
            globalid_value = rb_str_new_cstr(objectGlobalID.hexString.UTF8String);
            rb_ivar_set(self, rb_intern("@global_id"), globalid_value);
        }
        
        return globalid_value;
    }
}


void dtc_pbxobject_define(void) {
	if (!dtc_cPBXObject) {
		rb_raise(rb_eLoadError, "Could not find class PBXObject");
		return;
	}

	dtc_rbcPBXObject = rb_define_class_under(dtc_rbmDevToolsCore, "PBXObject", rb_cObject);
	rb_define_alloc_func(dtc_rbcPBXObject, dtc_alloc_raise);
    rb_define_attr(dtc_rbcPBXObject, "global_id", 1, 0);
    rb_define_method(dtc_rbcPBXObject, "global_id=", pbxobject_globalid_set, 1);
}
