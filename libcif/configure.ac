#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.64])
AC_INIT(libcif, m4_esyscmd_s([git describe --tags]), [ci-framework@googlegroups.com])
AM_INIT_AUTOMAKE

AC_CONFIG_SUBDIRS([protocol])

# Checks for programs.
AC_ARG_VAR([PERL],[Perl interpreter command])
AC_PATH_PROG([PERL], [perl], [not found])
if test "$PERL" = 'not found'; then
    AC_MSG_ERROR([cannot use $PACKAGE_NAME without perl])
fi

dnl Defaults paths for installation
AC_PREFIX_DEFAULT([/opt/cif])

AC_CONFIG_FILES([
	Makefile
])


# Checks for libraries.

# not needed yet
## Google Protocol Buffers
#PKG_CHECK_MODULES([protobuf],[protobuf >= 2.4.1])

## uuid
#PKG_CHECK_MODULES([uuid],[uuid >= 2.17.0])
#this check breaks in CentOS 6.3
# need to do some sort of conditional
# http://www.flameeyes.eu/autotools-mythbuster/pkgconfig/pkg_check_modules.html
# pkg-config --list-all | grep uuid
# ossp-uuid  OSSP uuid - Universally Unique Identifier (UUID) Library

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_OUTPUT
