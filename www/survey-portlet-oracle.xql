<?xml version="1.0"?>

<queryset>

<rdbms><type>oracle</type><version>8.1.6</version></rdbms>

<fullquery name="select_surveys">
	<querytext>

select s.survey_id, s.name, s.editable_p, s.single_response_p,
       s.package_id,
       acs_object.name(apm_package.parent_id(s.package_id)) as parent_name,
       (select site_node.url(site_nodes.node_id)
       from site_nodes
       where site_nodes.object_id = s.package_id) as url,
       (select count(*) from survey_responses_latest srl where srl.survey_id=s.survey_id and initial_user_id=:user_id) as response_count
  from surveys s
 where s.package_id in ([join $list_of_package_ids ,])
   and s.enabled_p='t'
 order by
parent_name,
upper(s.name)

    	</querytext>
</fullquery>

</queryset>