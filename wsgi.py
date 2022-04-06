"""
WSGI config for app project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/howto/deployment/wsgi/
"""

import os
from skywalking import agent, config
from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'app.settings')
config.init(collector='apm-otel-collector.service.163.org:11800', service='webserver', token='MTQ2LW5zZi1zdG9jaw==##{"node": "nsf-stock", "agentType": "python"}')
agent.start()
application = get_wsgi_application()