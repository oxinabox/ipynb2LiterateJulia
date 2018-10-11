try:
    from urllib.parse import quote  # Py 3
except ImportError:
    from urllib2 import quote  # Py 2
import os
import sys
import re


c = get_config()
c.NbConvertApp.export_format = 'markdown'
c.Exporter.file_extension = '.md'

def path2url(path):
    return "{{site.url}}/posts_assets/" +  path


def strip_ansi(source):
    # The included strip_ansi is borked, because it doesn't filter strings from
    # nonstrings

    _ANSI_RE = re.compile('\x1b\\[(.*?)([@-~])')
    if type(source)==str:
        return _ANSI_RE.sub('', source)

def escape_comments(source):
    # literate needs comments to be double escaped
    # this is just a simple rule that doesn't check for comments in strings etc
    return source.replace('#', '##')

def format_markdown_block(source):
    return '\n'.join([ '# ' + line for line in source.split('\n')])

c.ScriptExporter.filters = {
    'strip_ansi': strip_ansi,
    'escape_comments': escape_comments,
    'format_markdown_block': format_markdown_block

}
