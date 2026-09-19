# Intentionally vulnerable: old nginx on an old Debian base.
# For scanner/pipeline testing only. Do not deploy.
FROM nginx:1.19.0

COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
