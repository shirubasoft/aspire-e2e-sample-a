# aspire-e2e-sample-a

Sample repository demonstrating [Aspire E2E](https://github.com/shirubasoft/aspire-e2e) cross-repo resource importing.

This repo contains a `SampleFrontend` service and an AppHost that references `sample-api` from [aspire-e2e-sample-b](https://github.com/shirubasoft/aspire-e2e-sample-b) using the `GitHubRepository` tag.

## Structure

- `src/SampleFrontend` — A minimal ASP.NET Core frontend
- `src/SampleA.AppHost` — Aspire AppHost with a `SharedResourceReference` pointing to `shirubasoft/aspire-e2e-sample-b`

## Usage

Install the CLI and import resources from the AppHost:

```bash
dotnet tool install -g Shirubasoft.Aspire.E2E.Cli
a2a import-csproj ./src/SampleA.AppHost/SampleA.AppHost.csproj
```

The auto-clone feature will:
1. Clone `shirubasoft/aspire-e2e-sample-b` one level above this repo
2. Find the matching `sample-api` SharedResourceReference in the cloned repo
3. Enrich the imported resource with metadata (Name, ContainerImage, ContainerTag, etc.)
4. Register it in the global config (`~/.aspire-e2e/resources.json`)
