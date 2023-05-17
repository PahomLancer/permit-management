begin
    update components_package
       set is_locked = 1
     where name = 'Permit Management';
    dbms_output.put_line('Component Package Locked');
end;