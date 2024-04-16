SELECT 
    name AS TriggerName,
    object_id,
    parent_id,
    type_desc AS TriggerType,
    is_disabled AS IsDisabled
FROM 
    sys.triggers