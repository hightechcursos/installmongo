#!/bin/sh

# VERSÃO A SER INSTALADA, ALTERE SE QUISER OUTRA VERSÃO
MONGOVERSION="1.4.4"

# MENSAGEM DE BOAS-VINDAS
printf "\nInstalador do MongoDB pra Mac. Criado por Guilherme Rambo (screencaster.com.br)\n\n"
printf "Oi! Vou instalar o MongoDB pra você.\n\n"
printf "Durante o processo irei pedir sua senha, não tenha medo, não vou roubá-la ;)\n\n"
printf "#############################################################################\n\n"
printf "`tput setaf 5`Primeiro passo - Baixar os binários para Mac\n\n`tput op`"

# ESCOLHA DE PLATAFORMA
printf "`tput setaf 4`PERGUNTA: VOCÊ QUER A VERSÃO 32 OU 64 BITS? (RESPONDA 32 OU 64)... `tput op`"
read VERSION
if [ "$VERSION" = "64" ] ; then
	printf "\nBaixando mongodb-osx-x86_64-$MONGOVERSION.tgz...\n"
	URL="http://downloads.mongodb.org/osx/mongodb-osx-x86_64-$MONGOVERSION.tgz"
	DIR="mongodb-osx-x86_64-$MONGOVERSION"
else
	printf "\nBaixando mongodb-osx-i386-$MONGOVERSION.tgz...\n"
	URL="http://downloads.mongodb.org/osx/mongodb-osx-i386-$MONGOVERSION.tgz"
	DIR="mongodb-osx-i386-$MONGOVERSION"
fi

# DOWNLOAD DO PACOTE
`curl $URL > mongo.tgz`

printf "\n\n`tput setaf 2`Yatta! Download concluído!`tput op`\n\n"
printf "`tput setaf 5`Segundo passo - Descompactar binários\n\n`tput op`"

# DESCOMPACTAÇÃO
`tar xzf mongo.tgz`

printf "\n\n`tput setaf 2`Huhu! Descompactado!`tput op`\n\n"
printf "`tput setaf 5`Terceiro passo - Mover os arquivos aos seus devidos lugares\n`tput op`"
printf "`tput setaf 1`Atenção: eu vou pedir sua senha!\n\n`tput op`"

# INSTALAÇÃO DOS ARQUIVOS
`sudo cp $DIR/bin/* /usr/bin`
`sudo cp $DIR/lib/* /usr/lib`
`sudo cp -R $DIR/include/* /usr/include`
`sudo mkdir -p /data/db`

printf "\n\n`tput setaf 2;tput smso`INSTALAÇÃO CONCLUÍDA!`tput op`\n\n"
printf "\n\nPara iniciar o servidor rode:\n"
printf "`tput setaf 2;tput smso`sudo mongod`tput op`\n\n"
printf "Para usar o console rode:\n"
printf "`tput setaf 2;tput smso`mongo`tput op`\n\n"
printf "`tput setaf 2;tput smso`Bons estudos!`tput op`\n\n"