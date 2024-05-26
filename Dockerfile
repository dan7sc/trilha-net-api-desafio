FROM mcr.microsoft.com/dotnet/sdk

WORKDIR /usr/src/app/api

COPY . /usr/src/app/api

RUN dotnet dev-certs https --trust -ep certs/https.crt --format PEM
RUN dotnet dev-certs https --check

RUN dotnet tool install --global dotnet-ef
ENV PATH="$PATH:/root/.dotnet/tools"

RUN dotnet add package Microsoft.EntityFrameworkCore.Design
RUN dotnet add package Microsoft.EntityFrameworkCore.SqlServer

ENTRYPOINT ["dotnet", "run"]
