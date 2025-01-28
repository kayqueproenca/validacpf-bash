#! /usr/bin/env bash
#set -x

mult=10
dv1=0
dv2=0
soma=0
read -p 'Digite o CPF -> ' cpf
if [ ${#cpf} -lt 11 ] && [ ${#cpf} -gt 11 ]; then 
 echo "O CPF deve ter 11 digitos!"
 exit 1
fi
 
cpf_dig=()

for ((i=0; i < ${#cpf}; i++)); do
  cpf_dig[$i]=${cpf:i:1}
done


for (( i=0; i < 9; i++ )); do
  #echo ${cpf_dig[$i]}
  soma=$[ (${cpf_dig[$i]} * $mult) + $soma ]
  mult=$[ $mult - 1 ]
done

#echo $soma
resto=$[ $soma % 11 ]

if [ $resto -lt 2 ]; then
  dv1=0
else
  dv1=$[ 11 - $resto ]
fi

#echo $dv1
soma=0
mult=11
for (( i=0; i < 10; i++ )) ; do
 soma=$[ (${cpf_dig[$i]} * $mult) + $soma ]
 mult=$[ $mult - 1 ]
done

resto=$[ $soma % 11 ]

if [ $resto -lt 2 ]; then
   dv2=0
else
   dv2=$[ 11 - $resto ]
fi

if [ $dv1 -eq ${cpf_dig[9]} ] && [ $dv2 -eq ${cpf_dig[10]} ]; then
   echo "CPF valido!"
else
   echo "CPF invalido!"
fi
