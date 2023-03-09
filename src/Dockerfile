FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-restore-env
WORKDIR /src
COPY api/*.csproj api/
COPY web/*.csproj web/
COPY tests/*.csproj tests/
COPY *.sln .
RUN dotnet restore

FROM build-restore-env AS build-tests
WORKDIR /src
COPY tests/* tests/
COPY api/* api/
COPY web/* web/
WORKDIR /src/tests
RUN dotnet test

FROM build-restore-env AS build-web
WORKDIR /src
COPY web/* web
RUN dotnet publish web -c Release -o /publish

FROM build-restore-env AS build-api
WORKDIR /src
COPY api/* api
RUN dotnet publish api -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime-api
WORKDIR /publish
COPY --from=build-api /publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "api.dll"]

FROM scratch as runtime-api-compressed
COPY --from=runtime-api / /
EXPOSE 80
ENTRYPOINT ["dotnet", "api.dll"]


FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime-web
WORKDIR /publish
COPY --from=build-web /publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "web.dll"]