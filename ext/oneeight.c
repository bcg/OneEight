#include "ruby.h"

int oe_string_to_hash(VALUE, VALUE);

int
oe_string_to_hash(VALUE class, VALUE str)
{
    register long len = RSTRING_LEN(str);
    register char *p = RSTRING_PTR(str);
    register int key = 0;

    while (len--) {
        key = key*65599 + *p;
        p++;
    }
    key = key + (key>>5);

    return INT2FIX(key);
}

VALUE cOneEight;

void 
Init_oneeight()
{
  cOneEight = rb_define_class("OneEight", rb_cObject);
  rb_define_singleton_method(cOneEight, "string_to_hash", 
                              oe_string_to_hash,  1);
  
}
