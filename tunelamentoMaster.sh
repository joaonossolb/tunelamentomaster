#! /bin/bash
#Desenvolvedor: João Alexandre Nossol Balbino
#https://github.com/joaonossolb

echo "Tunelamento Master"
echo "Desenvolvedor: João Alexandre Nossol Balbino"
echo "https://github.com/joaonossolb"
echo ""
echo "Tunelamento Master, automatiza o redirecionamento de uma porta interna, colocando-a na internet"

echo ""

echo "Digite o seu IP"
read ip

echo "Digite a Porta de redirecionamento"
read porta_redir

echo "Digite a porta que vai receber o redirecionamento da porta configurada anteriormente"
read recebe_redir

echo "Qual Porta vai redirecionar internamente no alvo?"
read porta_interna_alvo

echo "Criando script (alvo.sh) para executar no alvo"
echo 'echo "Tunelamento Master"' > alvo.sh
echo 'echo ""' >> alvo.sh
echo "socat tcp4:$ip:$porta_redir tcp4:127.0.0.1:$porta_interna_alvo" >> alvo.sh
chmod 777 alvo.sh
echo ""
echo "Criando escuta.sh, vai ser o script com o codigo pronto não precisar configurar novamente as opções"
echo 'echo "Tunelamento Master"' > escuta.sh
echo 'echo ""' >> escuta.sh
echo 'echo "Escutando a conexão"' >> escuta.sh
echo "socat tcp4-listen:$porta_redir,reuseaddr,fork tcp4-listen:$recebe_redir,reuseaddr" >> escuta.sh
chmod 777 escuta.sh
echo ""
echo "Escutando a conexão"
socat tcp4-listen:$porta_redir,reuseaddr,fork tcp4-listen:$recebe_redir,reuseaddr
