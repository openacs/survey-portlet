--
--  Copyright (C) 2001, 2002 OpenForce, Inc.
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

--
-- packages/survey-portlet/sql/survey-portlets-create.sql
--

-- Creates survey datasources for portal portlets

-- Copyright (C) 2001 OpenForce, Inc.
-- @author Arjun Sanyal (arjun@openforce.net)
-- @creation-date 2001-30-09

-- $Id$

-- This is free software distributed under the terms of the GNU Public
-- License version 2 or higher.  Full text of the license is available
-- from the GNU Project: http://www.fsf.org/copyleft/gpl.html

-- ported to postgres by mohan pakkurti (mohan@pakkurti.com)
-- 2002-07-12

-- \i survey-portlet-sc-create.sql

create function inline_0()
returns integer as '
declare
  ds_id portal_datasources.datasource_id%TYPE;
begin
  ds_id := portal_datasource__new (
    ''survey_portlet'',
    ''Displays the survey''
  );

  -- 4 defaults procs

  -- shadeable_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',	
	''t'',
	''shadeable_p'',
	''t''
  );	

  -- shaded_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''shaded_p'',
	''f''
  );	

  -- hideable_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''hideable_p'',
	''t''
  );	

  -- user_editable_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''user_editable_p'',
	''f''
  );	

  -- link_hideable_p 
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''t'',
	''link_hideable_p'',
	''t''
  );	


  -- survey-specific procs

  -- package_id must be configured
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''f'',
	''package_id'',
	''''
  );	

  -- do we show the community name or not?
  perform portal_datasource__set_def_param (
	ds_id,
	''t'',
	''f'',
	''display_group_name_p'',
	''t''
  );
return 0;

end;' language 'plpgsql';
select inline_0();
drop function inline_0();

create function inline_0()
returns integer as '
declare
	foo integer;
begin
	-- create the implementation
	foo := acs_sc_impl__new (
		''portal_datasource'',
		''survey_portlet'',
		''survey_portlet''
	);

  return 0;

end;' language 'plpgsql';
select inline_0();
drop function inline_0();

create function inline_0()
returns integer as '
declare
	foo integer;
begin

	-- add all the hooks
	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''survey_portlet'',
	       ''GetMyName'',
	       ''survey_portlet::get_my_name'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''survey_portlet'',
	       ''GetPrettyName'',
	       ''survey_portlet::get_pretty_name'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''survey_portlet'',
	       ''Link'',
	       ''survey_portlet::link'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''survey_portlet'',
	       ''AddSelfToPage'',
	       ''survey_portlet::add_self_to_page'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''survey_portlet'',
	       ''Show'',
	       ''survey_portlet::show'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''survey_portlet'',
	       ''Edit'',
	       ''survey_portlet::edit'',
	       ''TCL''
	);

	foo := acs_sc_impl_alias__new (
	       ''portal_datasource'',
	       ''survey_portlet'',
	       ''RemoveSelfFromPage'',
	       ''survey_portlet::remove_self_from_page'',
	       ''TCL''
	);

	return 0;

end;' language 'plpgsql';
select inline_0();
drop function inline_0();

create function inline_0()
returns integer as '
declare
	foo integer;
begin

	-- Add the binding
	perform acs_sc_binding__new (
	    ''portal_datasource'',
	    ''survey_portlet''
	);
	
	return 0;

end;' language 'plpgsql';
select inline_0();
drop function inline_0();

\i survey-admin-portlet-create.sql

