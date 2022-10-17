declare
    c_rel_cardinality_one_many constant number := 2;
    v_jurisdiction_ttid xitor_type.xitor_type_id%type;
    v_permits_ttid xitor_type.xitor_type_id%type;
    v_project_ttid xitor_type.xitor_type_id%type;
    v_market_ttid xitor_type.xitor_type_id%type;
    v_rtid1 relation_type.relation_type_id%type;
    v_rtid2 relation_type.relation_type_id%type;
    v_rtid3 relation_type.relation_type_id%type;
    v_rtid4 relation_type.relation_type_id%type;
    v_rtid5 relation_type.relation_type_id%type;
    v_rtid6 relation_type.relation_type_id%type;
begin
    select xitor_type_id into v_jurisdiction_ttid from xitor_type where xitor_type = 'Jurisdiction';
    select xitor_type_id into v_permits_ttid from xitor_type where xitor_type = 'Permits';
    select xitor_type_id into v_project_ttid from xitor_type where xitor_type = 'Project'; /*General trackor type*/
    select xitor_type_id into v_market_ttid from xitor_type where xitor_type = 'Market'; /*General trackor type*/
    /*NEW_RELATION_TYPE(PID IN NUMBER, CID IN NUMBER, CARDINALITY IN NUMBER, CHILDREQPARENT IN NUMBER, ONDELETECASCADE IN NUMBER, UNIQUEBY IN NUMBER DEFAULT NULL)*/
    v_rtid1 := pkg_relation.new_relation_type(null, v_market_ttid, c_rel_cardinality_one_many, 0, 0);
    v_rtid2 := pkg_relation.new_relation_type(v_market_ttid, v_project_ttid, c_rel_cardinality_one_many, 1, 1);
    v_rtid3 := pkg_relation.new_relation_type(null, v_jurisdiction_ttid, c_rel_cardinality_one_many, 0, 0);
    v_rtid4 := pkg_relation.new_relation_type(null, v_permits_ttid, c_rel_cardinality_one_many, 0, 0);
    v_rtid5 := pkg_relation.new_relation_type(v_jurisdiction_ttid, v_permits_ttid, c_rel_cardinality_one_many, 0, 0);
    v_rtid6 := pkg_relation.new_relation_type(v_project_ttid, v_permits_ttid, c_rel_cardinality_one_many, 1, 0);
end;
