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

<ul>
<multiple name="surveys">
  <li>
    <a href="@url@admin/one?survey_id=@surveys.survey_id@">@surveys.name@</a>
<if @surveys.enabled_p@ ne t><b style="color: #f00;">(disabled)</b></if>
  </li>
</multiple>
</ul>
<ul>
  <li>
    <a href="@url@admin/survey-create">#survey.New_Survey#</a>
  </li>
</ul>
