Automated Container Remediation with Github Actions

### Local

```
docker build -t vuln-nginx:test .
trivy image --severity CRITICAL --ignore-unfixed vuln-nginx:test
```
