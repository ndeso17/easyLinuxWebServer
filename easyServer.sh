#!/bin/bash

clear
echo "	#################################################################################################"
echo "	##   #    Script ini akan berjalan otomatis                                                #   ##"
echo "	##   #    Edit yang diperlukan seperti yang ada di dalam addip delip dan resolv.conf       #   ##"
echo "	##   #    Jika sudah selesai anda bisa menjalankan perintah :                    	   #   ##"
echo "	##   #        *START* *RESTART* *STOP*                                                     #   ##"
echo "	##   #    WebServer tanpa mengetikan perintah yang panjang dan berulang-ulang              #   ##"
echo "	##   #    Daftar perintah                                                                  #   ##"
echo "	##   #    webserver-start   => untuk memulai apache2 mysql bind9 postfix                   #   ##"
echo "	##   #    webserver-restart => untuk memulai ulang apache2 mysql bind9 postfix             #   ##"
echo "	##   #    webserver-stop    => untuk menghentikan semua yang telah disebutkan diatas       #   ##"
echo "	##   #                                                                  By newbie amatiran #   ##"
echo "	#################################################################################################"
sleep 2

PS3='Please enter your choice: '
options=("Install Webserver" "Uninstall Webserver" "Show Commands" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Webserver")
            echo "Scrip akan berjalan otomatis dan kamu tinggal menggunakannya."
            echo "Kamu tinggal menggunakannya setelah semua berhasil terinstall. Untuk percobaan ketikkan saja di browser larendacs.pc"
            echo "kemudian enter, dan jika mau mengganti tinggal edit saja mengikuti yang ada di /etc/bind/larendacs"
            echo "Konsekuensinya adalah mungkin anda tidak bisa internetan karena /etc/resolv.conf sudah diedit dengan script ini."
            echo "Kembalikan isi dari resolv.conf yang asli. File ini akan berada di /etc/resolv/resolv.conf ."
            echo "Script ini open source, silahkan edit nameserver di resolv.conf sesuai kehendak anda. Biarkan default jika tidak ingin mengeditnya"
            echo "Sesuaikan ip address dan interface yang ada di addip dan atau delip sesuai dengan interface PC / Laptop kamu dan atau ip yang kamu mau." 
            echo "Jika ini dilakukan maka lakukan pula hal yang sama di resolv.conf yang ada di script ini."       
            mkdir /etc/resolv
            sleep 2
            chmod 0777 -R /etc/resolv
            mkdir /etc/resolv/resolv.conf.d
            sleep 1
apt-get update
apt-get install apache2 php mariadb-server mariadb-client bind9 postfix dovecot-common dovecot-imapd dovecot-pop3d
sleep 1
mv usr/bin/webserver-start /usr/bin
sleep 1
mv usr/bin/webserver-restart /usr/bin
sleep 1
mv usr/bin/webserver-stop /usr/bin
sleep 1
mv usr/bin/addip /usr/bin
sleep 1
mv usr/bin/delip /usr/bin
sleep 1
chmod +x /usr/bin/webserver-start
chmod +x /usr/bin/webserver-restart
chmod +x /usr/bin/webserver-stop
chmod +x /usr/bin/addip
chmod +x /usr/bin/delip
sleep 1
rm /etc/bind/named.conf
sleep 1
mv etc/bind/named.conf /etc/bind
sleep 1
mv etc/bind/larendacs /etc/bind
sleep 1
mv sites-available/larendacs.conf /etc/apache2/sites-available/
sleep 1
mv sites-available/ip.larendacs.conf /etc/apache2/sites-available/
sleep 1
mv sites-available/mail.larendacs.conf /etc/apache2/sites-available/
sleep 1
mv sites-available/mail2.larendacs.conf /etc/apache2/sites-available/
sleep 1
mv sites-available/ipmail.larendacs.conf /etc/apache2/sites-available/
sleep 1
mv sites-available/ipmail2.larendacs.conf /etc/apache2/sites-available/
sleep 1
mkdir /var/www/larendacs
chmod -R 0777 /var/www/larendacs
sleep 1
mv var/www/larendacs/index.php /var/www/larendacs
cd /etc/apache2/sites-available && a2ensite *.* *.*.*
webserver-restart
echo "												"
echo "Semua sudah terinstall, silahkan dicoba...!!!"
echo "												"
echo "webserver-start untuk memulai..."
echo "webserver-restart untuk memulai ulang..."
echo "webserver-stop untuk menghentikan..."
echo "												"
echo "1. Install WebServer 	2. Uninstall WebServer 	3. Show Commands 	4. Quit"
            ;;
        "Uninstall Webserver")
			echo "Silahkan untuk yang benar-benar bersih. Lakukan secara manual karena kami khawatir jika kami yang melakukan, data penting anda ikut terhapus pula."
			rm -rf /etc/resolv/resolv.conf.d
rm -rf /etc/resolv/
rm /usr/bin/webserver-start
rm /usr/bin/webserver-restart
rm /usr/bin/webserver-stop
rm /usr/bin/addip
rm /usr/bin/delip
rm /etc/apache2/sites-available/larendacs.conf
rm /etc/apache2/sites-available/ip.larendacs.conf
rm /etc/apache2/sites-available/mail.larendacs.conf
rm /etc/apache2/sites-available/mail2.larendacs.conf
rm /etc/apache2/sites-available/ipmail.larendacs.conf
rm /etc/apache2/sites-available/ipmail2.larendacs.conf
rm -rf /etc/apache2
rm -rf /etc/bind
rm -rf /var/www/larendacs
rm -rf /var/www
apt-get purge apache2 php mariadb-server mariadb-client bind9 postfix dovecot-common dovecot-imapd dovecot-pop3d dovecot*
apt-get autoremove apache2 php mariadb-server mariadb-client bind9 postfix dovecot-common dovecot-imapd dovecot-pop3d dovecot*
echo "																		"
echo "Sudah terhapus tapi tidak sepenuhnya. Silahkan lakukan secara manual" 
echo "																		"
echo "1. Install WebServer 	2. Uninstall WebServer 	3. Show Commands 	4. Quit" 
			;;     
        "Show Commands")
        	echo "=================================================================================="
        	echo "							"
        	echo "Install Commands WebServer + DNS "
        	echo "							"
            echo "mkdir /etc/resolv"
			echo "chmod 0777 -R resolv"
			echo "mv resolv.conf.d"
			echo "apt-get update"
			echo "apt-get install apache2 php mariadb-server mariadb-client bind9 postfix dovecot-common dovecot-imapd dovecot-pop3d"
			echo "mv usr/bin/webserver-start /usr/bin"
			echo "mv usr/bin/webserver-restart /usr/bin"
			echo "mv usr/bin/webserver-stop /usr/bin"
			echo "mv usr/bin/addip /usr/bin"
			echo "mv usr/bin/delip /usr/bin"
			echo "chmod +x /usr/bin/webserver-start"
			echo "chmod +x /usr/bin/webserver-restart"
			echo "chmod +x /usr/bin/webserver-stop"
			echo "chmod +x /usr/bin/addip"
			echo "chmod +x /usr/bin/delip"
			echo "rm /etc/bind/named.conf"
			echo "mv etc/bind/named.conf /etc/bind"
			echo "mv etc/bind/larendacs /etc/bind"
			echo "mv sites-available/larendacs.conf /etc/apache2/sites-available/"
			echo "mv sites-available/ip.larendacs.conf /etc/apache2/sites-available/"
			echo "mv sites-available/mail.larendacs.conf /etc/apache2/sites-available/"
			echo "mv sites-available/mail2.larendacs.conf /etc/apache2/sites-available/"
			echo "mv sites-available/ipmail.larendacs.conf /etc/apache2/sites-available/"
			echo "mv sites-available/ipmail2.larendacs.conf /etc/apache2/sites-available/"
			echo "mkdir /var/www/larendacs"
			echo "chmod -R 0777 /var/www/larendacs"
			echo "mv var/www/larendacs/index.php /var/www/larendacs"
			echo "cd /etc/apache2/sites-available && a2ensite *.* *.*.*"
			echo "webserver-restart"
            echo "							"
            echo "=================================================================================="
            echo "								"
            echo "Uninstall Commands WebServer + DNS   "
            echo "								"
            echo "rm -rf /etc/resolv/resolv.conf.d"
			echo "rm /etc/resolv/"
			echo "rm /etc/apache2/sites-available/larendacs.conf"
			echo "rm /etc/apache2/sites-available/ip.larendacs.conf"
			echo "rm /etc/apache2/sites-available/mail.larendacs.conf"
			echo "rm /etc/apache2/sites-available/mail2.larendacs.conf"
			echo "rm /etc/apache2/sites-available/ipmail.larendacs.conf"
			echo "rm /etc/apache2/sites-available/ipmail2.larendacs.conf"
			echo "rm /usr/bin/webserver-start"
			echo "cp /usr/bin/webserver-restart"
			echo "cp /usr/bin/webserver-stop"
			echo "apt-get purge apache2 php mariadb-server mariadb-client bind9 postfix dovecot-common dovecot-imapd dovecot-pop3d dovecot*"
			echo "apt-get autoremove apache2 php mariadb-server mariadb-client bind9 postfix dovecot-common dovecot-imapd dovecot-pop3d dovecot*"
			echo "rm -rf /etc/bind"
			echo "rm -rf /var/www/larendacs"
			echo "							"
			echo "====================================================================================="
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
