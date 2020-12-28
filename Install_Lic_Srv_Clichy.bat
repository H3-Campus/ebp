@echo off

set repository=D:\Softs\EBP2019\

Set LicenseXml=D:\Softs\EBP2019\

Echo "Installation ...."


echo ********************************************************************

echo "**Copy de License XML**************************"

echo ********************************************************************

Copy %repository%\License.xml %ProgramData%\ebp\License.xml

IF %ERRORLEVEL% NEQ 0 goto Error


echo ********************************************************************

echo "**Copy Connexion MySQL **************************"

echo ********************************************************************

mkdir %LocalAppData%\ebp\Accounting11.0FR40
Copy %repository%\mysqlc.new.xml %LocalAppData%\ebp\Accounting11.0FR40\mysql.new.xml
mkdir %LocalAppData%\ebp\BusinessPlan11.0FR20
Copy %repository%\mysqlc.new.xml %LocalAppData%\ebp\BusinessPlan11.0FR20\mysql.new.xml
mkdir %LocalAppData%\ebp\CapitalAsset11.0FR40
Copy %repository%\mysqlc.new.xml %LocalAppData%\ebp\CapitalAsset11.0FR40\mysql.new.xml
mkdir %LocalAppData%\ebp\CRM11.0FR40
Copy %repository%\mysqlc.new.xml %LocalAppData%\ebp\CRM11.0FR40\mysql.new.xml
mkdir %LocalAppData%\ebp\FinState12.0FR30
Copy %repository%\mysqlc.new.xml %LocalAppData%\ebp\FinState12.0FR30\mysql.new.xml
mkdir %LocalAppData%\ebp\Invoicing11.0FR40
Copy %repository%\mysqlc.new.xml %LocalAppData%\ebp\Invoicing11.0FR40\mysql.new.xml
mkdir %LocalAppData%\ebp\Payroll11.0FR40
Copy %repository%\mysqlc.new.xml %LocalAppData%\ebp\Payroll11.0FR40\mysql.new.xml


Echo "Copie des fichiers terminée !"