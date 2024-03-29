#
#  Copyright (C) 2001, 2002 OpenForce, Inc.
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

array set config $cf	

set shaded_p $config(shaded_p)
set list_of_package_ids $config(package_id)

set user_id [ad_conn user_id]
set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]
set readable_surveys_p 0
set count 0
db_multirow -extend {can_read_private_data_p} surveys select_surveys {} {
  set can_read_private_data_p [acs_privacy::user_can_read_private_data_p -object_id $package_id]
  if { $can_read_private_data_p } {
    set readable_surveys_p 1
  }
  incr count
}
