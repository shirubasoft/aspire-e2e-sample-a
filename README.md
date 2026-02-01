# aspire-e2e-sample-a

Sample repository demonstrating [Aspire E2E](https://github.com/shirubasoft/aspire-e2e) manifest-based resource declaration for non-.NET repos.

This repo contains a Go HTTP service with an `.aspire-e2e.json` manifest, allowing other repositories to import and run this service as a container via `a2a import`.

## Structure

- `src/` — A minimal Go HTTP server
- `Dockerfile` — Multi-stage build for the Go service
- `.aspire-e2e.json` — Manifest declaring `sample-frontend` as a shared resource

## Usage

Other repos can reference this service by adding a `SharedResourceReference` with a `GitHubRepository` tag pointing to `shirubasoft/aspire-e2e-sample-a`, then running:

```bash
a2a import ./path/to/AppHost.csproj
```

The auto-clone feature will fetch this repo, find the `.aspire-e2e.json` manifest, and enrich the imported resource with the declared metadata. Since this is a non-.NET repo, the service always runs in container mode.
