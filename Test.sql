DELETE T
FROM GHRD2019_Compensation_Hierarchy T
JOIN #duplicados D ON
    T.Date_loaded = D.Date_loaded AND
    T.[internal_id] = D.[internal_id] AND
    T.[userid] = D.[userid] AND
    T.[IPI_Code] = D.[IPI_Code] AND
    T.[Manager_id] = D.[Manager_id] AND
    T.Comp_Planner_Mgr_Internal_id = D.Comp_Planner_Mgr_Internal_id AND
    T.Comp_Planner_Mgr_userid = D.Comp_Planner_Mgr_userid AND
    T.[Override_Comp_Planer] = D.[Override_Comp_Planer] AND
    T.[Override_Comments] = D.[Override_Comments] AND
    T.[Bussines_Validation] = D.[Bussines_Validation] AND
    T.[First_executive_Internal_id] = D.[First_executive_Internal_id] AND
    T.[First_executive_userid] = D.[First_executive_userid] AND
    T.[Senior_Leader1_internal_id] = D.[Senior_Leader1_internal_id] AND
    T.[Senior_Leader1_userid] = D.[Senior_Leader1_userid] AND
    T.[Senior_Leader2_internal_id] = D.[Senior_Leader2_internal_id] AND
    T.[Senior_Leader2_userid] = D.[Senior_Leader2_userid] AND
    T.[Senior_Leader3_internal_id] = D.[Senior_Leader3_internal_id] AND
    T.[Senior_Leader3_userid] = D.[Senior_Leader3_userid] AND
    T.current_record = D.current_record
WHERE D.RN > 1;
