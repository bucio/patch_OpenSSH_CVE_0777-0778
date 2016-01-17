#!/bin/bash
#  openSSH Information Leak (CVE-2016-0777)
#  openSSH Buffer Overflow (CVE-2016-0778)
#  All OpenSSH versions between 5.4 and 7.1 are vulnerable.
#  ---------------------
# TPX.MX Security		|
# 	Rafael@Bucio.mx 	|
# 	http://bucio.mx 	|
#-----------------------
function patch_s()
   {
case `uname` in
  Linux )
     LINUX=1
     which yum && { echo "";echo "Patch.. "; echo 'UseRoaming no' | sudo tee -a /etc/ssh/ssh_config; echo 'Patch ok ..'; echo''; return; }
     which apt-get && { echo "";echo "Patch.. "; echo 'UseRoaming no' | sudo tee -a /etc/ssh/ssh_config; echo 'Patch ok ..'; echo''; return; }
     #which pkg && { echo "";echo "Patch.. "; echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config; echo 'Patch ok ..'; echo''; return; }

     ;;
  Darwin )
     DARWIN=1
     echo ""
     echo "Vamos a parchar tu mac"
     echo "UseRoaming no" >> ~/.ssh/config
     echo "Listo"
     echo ""
     ;;
  * )
     echo ""
     #which pkg && { echo "";echo "Patch.. "; echo -e 'Host *\nUseRoaming no' >> /etc/ssh/ssh_config; echo 'Patch ok ..'; echo''; return; }
     echo "Este script, es para debian y centOS, si usas un sistema difernte añade tu distro en la linea 16 :)"
     echo ""
     ;;
esac
   }

function check_version()
   {
case `uname` in
  Linux )
     LINUX=1
     which yum && { echo '##################'; echo 'Checa si estas en el rango de estas versiones 5.4 a 5.7';echo ''; yum list installed openssh\*; echo 'Si estas en ese rango presiona 2 !! '; echo "#####################################"; echo "";return; }
     which apt-get && { echo '##################'; echo 'Checa si estas en el rango de estas versiones 5.4 a 5.7';echo ''; dpkg --list openssh\*; echo 'Si estas en ese rango presiona 2 !! '; echo "#####################################"; echo"";return; }
     
     ;;

#  BSD )
#    BSD=1
#    which yum && { echo '##################'; echo 'Checa si estas en el rango de estas versiones 5.4 a 5.7';echo ''; yum list installed openssh\*; echo 'Si estas en ese rango presiona 2 !! '; echo "#####################################"; echo "";return; }   
#    ;;

  Darwin )
     DARWIN=1
     echo ""
     echo "Checa si estas en el rango de estas versiones 5.4 a 5.7"
          echo ""
     echo "Tu version es:"
     ssh -V
          echo ""
     echo "En caso de estar en el rango presiona 2"
          echo ""
               echo ""
     ;;
  * )
     echo ""
     echo "Que ditro usas? enviame un email para añadirlo"
     ;;
esac


   }


clear

echo '
    ____             __            __     ___   
   / __ \_________  / /____  _____/ /_   ( _ )  
  / /_/ / ___/ __ \/ __/ _ \/ ___/ __/  / __ \/|
 / ____/ /  / /_/ / /_/  __/ /__/ /_   / /_/  < 
/_/   /_/   \____//__/\___//___/\__/   \____/\/ 
    ____  ____ _/ /______/ /_                   
   / __ \/ __ `/ __/ ___/ __ \         Rafael Bucio        
  / /_/ / /_/ / /_/ /__/ / / /         http://tpx.mx         
 / .___/\__,_/\__/\___/_/ /_/          rafael@tpx.mx       
/_/____                  __________ __  __      
  / __ \____  ___  ____ / ___/ ___// / / /      
 / / / / __ \/ _ \/ __ \\__ \\__ \/ /_/ /       
/ /_/ / /_/ /  __/ / / /__/ /__/ / __  /        
\____/ .___/\___/_/ /_/____/____/_/ /_/         
    /_/                                         
'

echo "openSSH Information Leak (CVE-2016-0777)"
echo "openSSH Buffer Overflow (CVE-2016-0778)"
echo "All OpenSSH versions between 5.4 and 7.1 are vulnerable."

echo "Elige una opcion: "
echo " "
menu=("Checar si soy vulnerable" "Parchar" "info" "Salir")
select opt in "${menu[@]}"
do
    case $opt in
    	"Checar si soy vulnerable")
			echo ""
            echo "Si tienes una versión entre 5.4 y la 7.1 eres vulnerable"
			     check_version
            echo ""
            ;;  

        "Parchar")
			echo ""
            echo "Parchando"
            patch_s
            echo ""
			       echo ""
            ;;



        "info")
			echo ""
            echo "Si necesitas más info sobre estos CVE."
            echo "URL: https://www.qualys.com/2016/01/14/cve-2016-0777-cve-2016-0778/openssh-cve-2016-0777-cve-2016-0778.txt"
            echo "URL http://seclists.org/fulldisclosure/2016/Jan/44"
            echo "URL: https://www.cvedetails.com/cve-details.php?t=1&cve_id=CVE-2016-0777"
            echo "URL: https://www.cvedetails.com/cve-details.php?t=1&cve_id=CVE-2016-0778"
            echo ""
            ;;

        "Salir")
          echo "Adios"
            break
            ;;
        *) echo Opcion invalida;;
    esac
done
