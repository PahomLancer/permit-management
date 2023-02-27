begin
    for rec in (
        select rule_id, rule, sql_text
          from rule
         where rule in (
             'PRM_PERMIT_AGE cfu', 
             'PRM_PERMIT_CYCLE_TIME', 
             'PRM_PERMIT_COUNTDOWN cfu', 
             'PRM_PERMIT_EXPIRES_BEFORE_CX_S cfu', 
             'PRM_PERMIT_COUNTDOWN nightly', 
             'PRM_PERMIT_AGE nightly', 
             'PRM_PERMIT_AGE wtu', 
             'New Permits', 
             'PRM_PERMIT_EXPIRED cfu', 
             'PRM_PERMIT_EXPIRED nightly',
             'PRM_PERMIT_EXPECTED',
             'PRM_PERMIT_COUNTDOWN wtu'
        )
    ) loop
        dbms_output.put_line('Enabling rule [' ||  rec.rule || ']' || pkg_str.c_lb);
        pkg_ruleator.compile_rule_plsql_block_and_raise(rec.sql_text);
        update rule set is_enabled = 1 where rule_id = rec.rule_id;
        commit;
    end loop;
    dbms_output.put_line('Rules Enabled');

    update autom
       set enabled = 1
     where autom_name in (
         'Permit Status Change Date', 
         'Permit Approved Autofill', 
         'PRM_PERMIT_STATUS'
    );
    dbms_output.put_line('Automations Enabled');
    /*'PRM_PERMIT_EXPIRED wtu', 'PRM_PERMIT_EXPIRES_BEFORE_CX_S wtu'*/
end;