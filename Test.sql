DELETE T
FROM GHRD2019_Compensation_Hierarchy T
JOIN #duplicados D ON
    ISNULL(T.Date_loaded, '') = ISNULL(D.Date_loaded, '') AND
    ISNULL(T.[internal_id], '') = ISNULL(D.[internal_id], '') AND
    ISNULL(T.[userid], '') = ISNULL(D.[userid], '') AND
    ISNULL(T.[IPI_Code], '') = ISNULL(D.[IPI_Code], '') AND
    ISNULL(T.[Manager_id], '') = ISNULL(D.[Manager_id], '') AND
    ISNULL(T.Comp_Planner_Mgr_Internal_id, '') = ISNULL(D.Comp_Planner_Mgr_Internal_id, '') AND
    ISNULL(T.Comp_Planner_Mgr_userid, '') = ISNULL(D.Comp_Planner_Mgr_userid, '') AND
    ISNULL(T.[Override_Comp_Planer], '') = ISNULL(D.[Override_Comp_Planer], '') AND
    ISNULL(T.[Override_Comments], '') = ISNULL(D.[Override_Comments], '') AND
    ISNULL(T.[Bussines_Validation], '') = ISNULL(D.[Bussines_Validation], '') AND
    ISNULL(T.[First_executive_Internal_id], '') = ISNULL(D.[First_executive_Internal_id], '') AND
    ISNULL(T.[First_executive_userid], '') = ISNULL(D.[First_executive_userid], '') AND
    ISNULL(T.[Senior_Leader1_internal_id], '') = ISNULL(D.[Senior_Leader1_internal_id], '') AND
    ISNULL(T.[Senior_Leader1_userid], '') = ISNULL(D.[Senior_Leader1_userid], '') AND
    ISNULL(T.[Senior_Leader2_internal_id], '') = ISNULL(D.[Senior_Leader2_internal_id], '') AND
    ISNULL(T.[Senior_Leader2_userid], '') = ISNULL(D.[Senior_Leader2_userid], '') AND
    ISNULL(T.[Senior_Leader3_internal_id], '') = ISNULL(D.[Senior_Leader3_internal_id], '') AND
    ISNULL(T.[Senior_Leader3_userid], '') = ISNULL(D.[Senior_Leader3_userid], '') AND
    ISNULL(T.current_record, '') = ISNULL(D.current_record, '')
WHERE D.RN > 1;


WITH Duplicados AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY HASHBYTES('SHA2_256',
                   CONVERT(VARCHAR(MAX), (
                       SELECT 
                           Date_loaded,
                           [internal_id],
                           [userid],
                           [IPI_Code],
                           [Manager_id],
                           Comp_Planner_Mgr_Internal_id,
                           Comp_Planner_Mgr_userid,
                           [Override_Comp_Planer],
                           [Override_Comments],
                           [Bussines_Validation],
                           [First_executive_Internal_id],
                           [First_executive_userid],
                           [Senior_Leader1_internal_id],
                           [Senior_Leader1_userid],
                           [Senior_Leader2_internal_id],
                           [Senior_Leader2_userid],
                           [Senior_Leader3_internal_id],
                           [Senior_Leader3_userid],
                           current_record
                       FOR XML RAW
                   ))
               )
               ORDER BY Date_loaded DESC
           ) AS RN
    FROM GHRD2019_Compensation_Hierarchy
)
DELETE FROM Duplicados
WHERE RN > 1;
