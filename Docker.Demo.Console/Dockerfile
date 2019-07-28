FROM mcr.microsoft.com/dotnet/core/runtime:2.2-stretch-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["Docker.Demo.Console/Docker.Demo.Console.csproj", "Docker.Demo.Console/"]
RUN dotnet restore "Docker.Demo.Console/Docker.Demo.Console.csproj"
COPY . .
WORKDIR "/src/Docker.Demo.Console"
RUN dotnet build "Docker.Demo.Console.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Docker.Demo.Console.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Docker.Demo.Console.dll"]