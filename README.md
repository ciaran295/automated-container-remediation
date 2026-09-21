Learn Automated Container Remediation with Github Actions

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
trivy image --severity CRITICAL --ignore-unfixed ghcr.io/ciaran295/vuln-nginx:patched 
```


### Results

Original
```
trivy image --severity CRITICAL --ignore-unfixed ghcr.io/ciaran295/vuln-nginx:latest

...truncated...

Report Summary

┌───────────────────────────────────────────────────┬────────┬─────────────────┬─────────┐
│                      Target                       │  Type  │ Vulnerabilities │ Secrets │
├───────────────────────────────────────────────────┼────────┼─────────────────┼─────────┤
│ ghcr.io/ciaran295/vuln-nginx:latest (debian 11.7) │ debian │       107       │    -    │
└───────────────────────────────────────────────────┴────────┴─────────────────┴─────────┘

```

Patched version
```
trivy image --severity CRITICAL --ignore-unfixed ghcr.io/ciaran295/vuln-nginx:patched

...truncated...

Report Summary

┌──────────────────────────────────────────────────────┬────────┬─────────────────┬─────────┐
│                        Target                        │  Type  │ Vulnerabilities │ Secrets │
├──────────────────────────────────────────────────────┼────────┼─────────────────┼─────────┤
│ ghcr.io/ciaran295/vuln-nginx:patched (alpine 3.17.3) │ alpine │        0        │    -    │
└──────────────────────────────────────────────────────┴────────┴─────────────────┴─────────┘

```

