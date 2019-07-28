FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["Docker.Demo.Api/Docker.Demo.Api.csproj", "Docker.Demo.Api/"]
RUN dotnet restore "Docker.Demo.Api/Docker.Demo.Api.csproj"
COPY . .
WORKDIR "/src/Docker.Demo.Api"
RUN dotnet build "Docker.Demo.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Docker.Demo.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Docker.Demo.Api.dll"]