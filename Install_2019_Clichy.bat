@echo off

set repository=D:\Softs\EBP2019\

Set LicenseXml=D:\Softs\EBP2019\

Echo "Installation ...."

 

echo ********************************************************************

echo "**Installation de la gestion commercial & comptabilité************"

echo ********************************************************************

%repository%\EBPOL_2019_LigneOL_Gestion_11_0_5_4116.exe /s NETWORK=TRUE PERSONALIZED=TRUE WEBCHECKED=FALSE

IF %ERRORLEVEL% NEQ 0 goto Error


echo ********************************************************************

echo "**Installation de EBP Comptabilite ********************************"

echo ********************************************************************

%repository%\EBPOL_2019_LigneOL_Compta_11_0_5_7765.exe /s NETWORK=TRUE PERSONALIZED=TRUE WEBCHECKED=FALSE

IF %ERRORLEVEL% NEQ 0 goto Error 


echo ********************************************************************

echo "**Installation de la gestion Paye********************************"

echo ********************************************************************

%repository%\EBPOL_2019_LigneOL_Paie_11_0_8_9122.exe /s NETWORK=TRUE PERSONALIZED=TRUE WEBCHECKED=FALSE

IF %ERRORLEVEL% NEQ 0 goto Error

 
echo ********************************************************************

echo "**Installation de la gestion CRM*********************************"

echo ********************************************************************

%repository%\EBPOL_2019_LigneOL_CRM_11_0_0_999.exe /s NETWORK=TRUE PERSONALIZED=TRUE WEBCHECKED=FALSE

IF %ERRORLEVEL% NEQ 0 goto Error

 

echo ********************************************************************

echo "**Installation de la gestion IMMO*********************************"

echo ********************************************************************

%repository%\EBPOL_2019_LigneOL_Immos_11_0_0_2540.exe /s NETWORK=TRUE PERSONALIZED=TRUE WEBCHECKED=FALSE

IF %ERRORLEVEL% NEQ 0 goto Error

 

echo ********************************************************************

echo "**Installation de la gestion ETATS FINANCIERS*********************"

echo ********************************************************************

%repository%\EBPOL_2019_PRO_EtatsFiEntreprises_12_0_4_2182.exe /s NETWORK=TRUE PERSONALIZED=TRUE WEBCHECKED=FALSE

REM IF %ERRORLEVEL% NEQ 0 goto Error

 

echo ********************************************************************

echo "**Installation de la gestion BUSINESS PLAN************************"

echo ********************************************************************

%repository%\EBPOL_2019_Classic_BusinessPlan_11_0_0_1713.exe /s NETWORK=TRUE PERSONALIZED=TRUE WEBCHECKED=FALSE

REM IF %ERRORLEVEL% NEQ 0 goto Error

 

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

IF %ERRORLEVEL% NEQ 0 goto Error


 

REM ********************************************************************

REM **Ecriture du fichier de LOG ***************************************

REM ********************************************************************

Echo "Instal OK on :" %COMPUTERNAME% >> %repository%\install.txt

Echo "Fin de l'installation"

  

REM ********************************************************************

REM **Arret Automatique du poste **************************************

REM ********************************************************************

REM Shutdown /s -t 100

  

EXIT

 

:Error

Echo "Install Failled on :" %COMPUTERNAME% >> %repository%\install.txt