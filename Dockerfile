FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["Computadores/Computadores.csproj", "Computadores/"]
RUN dotnet restore "Computadores/Computadores.csproj"

COPY . .
WORKDIR "/src/Computadores"
RUN dotnet publish "Computadores.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Computadores.dll"]
