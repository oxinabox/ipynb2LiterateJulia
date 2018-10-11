{% extends 'script.tpl' %}


{% block markdowncell %}
{{ cell.source | format_markdown_block }}
{% endblock markdowncell %}




{% block input %}
{{ cell.source | escape_comments}}
#----------------------------------------------------------------------------
{% endblock input %}

