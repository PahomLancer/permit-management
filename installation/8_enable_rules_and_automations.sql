begin
    update rule
       set is_enabled = 1
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
    );
    update autom
       set enabled = 1
     where autom_name in ('Permit Status Change Date', 'Permit Approved Autofill', 'PRM_PERMIT_STATUS');
    /*'PRM_PERMIT_EXPIRED wtu', 'PRM_PERMIT_EXPIRES_BEFORE_CX_S wtu'*/
end;
