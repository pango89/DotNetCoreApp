FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /app

# copy .csproj for different projects under the solution
COPY simpleapp/*.csproj ./simpleapp/
WORKDIR /app/simpleapp
RUN dotnet restore

# copy and publish app
WORKDIR /app/
COPY simpleapp/. ./simpleapp/
WORKDIR /app/simpleapp
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.1-runtime AS runtime
WORKDIR /app
COPY --from=build /app/simpleapp/out ./
ENTRYPOINT ["dotnet", "simpleapp.dll"]