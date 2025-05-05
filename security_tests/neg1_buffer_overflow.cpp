#include <cstring>

void vuln_buffer_overflow() {
  char buf[8];
  strcpy(buf, "THIS_IS_WAY_TOO_LONG");  
}
