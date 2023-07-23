UPDATE 20th INNER JOIN hall ON hall.code=SUBSTRING(20th.student_id, 3,3) SET 20th.hall=hall.name_en WHERE 20th.hall IS NULL OR 20th.hall ="";
UPDATE 21st INNER JOIN hall ON hall.code=SUBSTRING(21st.student_id, 3,3) SET 21st.hall=hall.name_en WHERE 21st.hall IS NULL OR 21st.hall ="";
UPDATE 22nd INNER JOIN hall ON hall.code=SUBSTRING(22nd.student_id, 3,3) SET 22nd.hall=hall.name_en WHERE 22nd.hall IS NULL OR 22nd.hall ="";
UPDATE 23rd INNER JOIN hall ON hall.code=SUBSTRING(23rd.student_id, 3,3) SET 23rd.hall=hall.name_en WHERE 23rd.hall IS NULL OR 23rd.hall ="";
UPDATE 24th INNER JOIN hall ON hall.code=SUBSTRING(24th.student_id, 3,3) SET 24th.hall=hall.name_en WHERE 24th.hall IS NULL OR 24th.hall ="";
UPDATE 19th INNER JOIN hall ON hall.code=SUBSTRING(19th.student_id, 3,3) SET 19th.hall=hall.name_en WHERE 19th.hall IS NULL OR 19th.hall ="";
UPDATE 25th INNER JOIN hall ON hall.code=SUBSTRING(25th.student_id, 3,3) SET 25th.hall=hall.name_en WHERE 25th.hall IS NULL OR 25th.hall ="";


UPDATE 20th INNER JOIN hall ON hall.code=SUBSTRING(20th.student_id, 3,3) SET 20th.hall= concat(hall.name_en,'-',hall.name_bn);
UPDATE 21st INNER JOIN hall ON hall.code=SUBSTRING(21st.student_id, 3,3) SET 21st.hall= concat(hall.name_en,'-',hall.name_bn);
UPDATE 22nd INNER JOIN hall ON hall.code=SUBSTRING(22nd.student_id, 3,3) SET 22nd.hall= concat(hall.name_en,'-',hall.name_bn);
UPDATE 23rd INNER JOIN hall ON hall.code=SUBSTRING(23rd.student_id, 3,3) SET 23rd.hall= concat(hall.name_en,'-',hall.name_bn);
UPDATE 24th INNER JOIN hall ON hall.code=SUBSTRING(24th.student_id, 3,3) SET 24th.hall= concat(hall.name_en,'-',hall.name_bn);
UPDATE 19th INNER JOIN hall ON hall.code=SUBSTRING(19th.student_id, 3,3) SET 19th.hall= concat(hall.name_en,'-',hall.name_bn);
UPDATE 25th INNER JOIN hall ON hall.code=SUBSTRING(25th.student_id, 3,3) SET 25th.hall= concat(hall.name_en,'-',hall.name_bn);