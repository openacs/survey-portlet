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

<if @surveys:rowcount@ gt 0 and @readable_surveys_p@ eq 1>
	<multiple name="surveys">
<if @one_instance_p@ false>@surveys.parent_name@</if>
<ul>

<group column="package_id">
    <if @surveys.response_count@ eq 0 and @surveys.can_read_private_data_p@>
	  <li>
	  <a href="@surveys.url@one-survey?survey_id=@surveys.survey_id@" title="#survey.goto_surveys_name#">@surveys.name@</a>
          </li>
    </if>
</group>
</ul>
     <if @one_instance_p@><br /></if><if @surveys.can_read_private_data_p@><a href="@surveys.url@" title="#survey.view_edit_previous_responses#">#survey.view_edit_previous_responses#</a><br /></if><br />
    </multiple>
</if>      
<else>
	<small>#survey.No_unanswered_surveys#</small>
</else>
</if>
