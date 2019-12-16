FROM mcr.microsoft.com/dotnet/core/sdk:3.0.101-alpine3.10 AS build-env

WORKDIR /app

COPY app/*.csproj ./
RUN dotnet restore

COPY app/ ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0.1-alpine3.10
WORKDIR /app

COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "dotnet-core-hello-world-web-app.dll"]

