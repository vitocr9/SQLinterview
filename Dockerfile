FROM mcr.microsoft.com/mssql/server:2022-latest AS build

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=EPAM1nt3rv13w

WORKDIR /temp
COPY /SetupSQL/*.sql ./SetupSQL/

RUN (/opt/mssql/bin/sqlservr --accept-eula &) | grep -q "Service Broker manager has started" \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/0_CreateDBs.sql \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/1_SampleDataName.sql \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/2_SampleDataLast.sql \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/3_CreateInterviewDB.sql \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/4_InsertEmployees.sql \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/5_InsertSalaries.sql \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/6_InsertDuplicates.sql \
&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "EPAM1nt3rv13w" -i /temp/SetupSQL/7_InsertDepartments.sql \
&& pkill sqlservr 


FROM mcr.microsoft.com/mssql/server:2022-latest AS release
ENV ACCEPT_EULA=Y
COPY --from=build /var/opt/mssql/data /var/opt/mssql/data

