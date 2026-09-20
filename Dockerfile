# Intentionally vulnerable: old nginx on an old Debian base.
# For scanner/pipeline testing only. Do not deploy.
FROM nginx:1.25.0-alpine3.17-slim

LABEL org.opencontainers.image.source = "https://github.com/ciaran295/automated-container-remediation" 

COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
