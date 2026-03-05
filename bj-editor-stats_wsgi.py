import sys

# PythonAnywhere-friendly WSGI loader
# Adjust this to your PA home if different
project_home = "/home/DeminZhao/bj-editor-stats"
if project_home not in sys.path:
    sys.path.insert(0, project_home)

from app import app as application
