Automated Container Remediation with Github Actions

### Local

```
docker build -t vuln-nginx:test .
trivy image --severity CRITICAL --ignore-unfixed vuln-nginx:test

echo $GITHUB_TOKEN | podman login ghcr.io -u USERNAME --password-stdin
podman push vuln-nginx:test ghcr.io/ciaran295/vuln-nginx:latest
```

Verify patched image

```
podman pull ghcr.io/ciaran295/vuln-nginx:patched
```
