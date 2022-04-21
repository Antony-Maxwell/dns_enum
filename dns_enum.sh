#! /bin/bash
day=$(date +%A)
blue='tput setaf 4'
reset='tput sgr0'

greetings()
{
	echo -e " welcome root! today is $day. u r using $SHELL shell for script execution \n author = Maxwell"
}

dns_enum()
{
for rec in A AAAA CNAME MX TXT; do
	echo $rec record of $dom 
	dig $dom $rec +short
	echo "__________________"
done
}

file_enum()
{
while read domain; do
   echo $domain
   for rec in A AAAA CNAME MX TXT; do
   	echo " $rec $domain "
   	dig $domain $rec +short
   	echo "######################"
   done
   echo " ===========  $domain completed  ==============="
done < file.txt
}

menu()
{
	echo "1 : check ip4"
	echo "2 : check ip6"
	echo "3 : check MX"
	echo "4 : check TXT"
	echo "5 : check CNAME"
	echo "6 : check all"
	read -p "select one option : " opt
}
case_state()
{
  case $opt in
  	1 )
   ipv4=$(dig $dom A +short)
  	echo "ipv4 of $dom is $ipv4";;
  	2 )
   ipv6=$(dig $dom AAAA +short)
	echo "ipv6 of $dom is $ipv6";;
  	3 )
   mx=$(dig $dom MX +short)
	echo "MX record of $dom is $mx";;
  	4 )
  	txt=$(dig $dom TXT +short)
   echo "TXT record of $dom is $txt";;
  	5 )
  	cname=$(dig $dom CNAME +short)
  	echo "CNAME of $dom is $cname";;
  	6 )
   dns_enum;;
  esac
}

greetings
menu
read -p "enter a domain:" dom
case_state