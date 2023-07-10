{% macro clean_na_raw(colname, target_type) %}
CASE WHEN {{ colname }} = 'NA' then null
    ELSE {{ colname }}::{{ target_type }}
    END
{% endmacro %}