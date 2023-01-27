declare
    v_project_id xitor.xitor_id%type;
    v_project_key xitor.xitor_key%type;
    v_permits_id xitor.xitor_id%type;
    v_permits_key xitor.xitor_key%type;
    v_jurisdiction_id xitor.xitor_id%type;
    v_jurisdiction_key xitor.xitor_key%type;
    v_temp varchar2(4000);
begin

    v_project_id := util.newtrackor(id.project.tt);
    v_project_key := util.autokeygen(v_project_id);
    v_jurisdiction_id := util.newtrackor(id.jurisdiction.tt);
    v_jurisdiction_key := util.autokeygen(v_jurisdiction_id);
    v_permits_id := util.newtrackor(id.permits.tt);
    util.newrelation(v_project_id, v_permits_id);
    util.newrelation(v_jurisdiction_id, v_permits_id);
    v_permits_key := util.autokeygen(v_permits_id);
    v_temp := util.runruletype(pkg_ruleator.c_type_trackor_created, null, v_permits_id);
    v_temp := util.runruletype(pkg_ruleator.c_type_trackor_created_updated, null, v_permits_id);

end;