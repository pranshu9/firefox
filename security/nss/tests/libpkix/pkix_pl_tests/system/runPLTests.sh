#!/bin/sh
# 
# ***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is the PKIX-C library.
#
# The Initial Developer of the Original Code is
# Sun Microsystems, Inc.
# Portions created by the Initial Developer are
# Copyright 2004-2007 Sun Microsystems, Inc.  All Rights Reserved.
#
# Contributor(s):
#   Sun Microsystems, Inc.
#
# Alternatively, the contents of this file may be used under the terms of
# either the GNU General Public License Version 2 or later (the "GPL"), or
# the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
# in which case the provisions of the GPL or the LGPL are applicable instead
# of those above. If you wish to allow use of your version of this file only
# under the terms of either the GPL or the LGPL, and not to allow others to
# use your version of this file under the terms of the MPL, indicate your
# decision by deleting the provisions above and replace them with the notice
# and other provisions required by the GPL or the LGPL. If you do not delete
# the provisions above, a recipient may use your version of this file under
# the terms of any one of the MPL, the GPL or the LGPL.
#
# ***** END LICENSE BLOCK *****
#
# runPLTests.sh
#

curdir=`pwd`
cd ../../common
. ./libpkix_init.sh > /dev/null
cd ${curdir}

numtests=0
passed=0
testunit=SYSTEM


##########
# main
##########

ParseArgs $*

RunTests <<EOF
pkixutil test_mem
pkixutil test_object
pkixutil test_string
pkixutil test_bigint
pkixutil test_bytearray
pkixutil test_mutex
pkixutil test_mutex2
pkixutil test_mutex3
pkixutil test_monitorlock
pkixutil test_oid
pkixutil test_hashtable
EOF

totalErrors=$?
html_msg ${totalErrors} 0 "&nbsp;&nbsp;&nbsp;${testunit}: passed ${passed} of ${numtests} tests"
exit ${totalErrors}



