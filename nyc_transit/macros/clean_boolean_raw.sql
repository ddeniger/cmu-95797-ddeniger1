{% macro clean_bool(colname) %}
CASE WHEN {{ colname }} = 'Y' then TRUE
    WHEN {{ colname }} = 'N' then FALSE
    ELSE NULL 
    END
{% endmacro %}
