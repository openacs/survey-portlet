<%

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

%>

<if @can_read_private_data_p@>

<if @surveys:rowcount@ gt 0>
	<multiple name="surveys">
<if @one_instance_p@ false>@surveys.parent_name@
<ul></if>

<group column="package_id">
    <if @surveys.response_count@ eq 0>
	  <li>
	  <a href="@surveys.url@one-survey?survey_id=@surveys.survey_id@">@surveys.name@</a>
          </li>
    </if>
</group>
</ul>
     <if @one_instance_p@><br /></if><a href="@surveys.url@">view/edit previous responses<if @one_instance_p@ eq 0> for surveys in this group</if></a><br /><br />
    </multiple>
</if>      
      <if @surveys:rowcount@ eq 0>
	<li>No unanswered surveys</li>
      </if>
<else>
</if>
