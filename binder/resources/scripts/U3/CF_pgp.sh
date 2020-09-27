#!/bin/bash
#randomfilename=$(sed "s/[^a-zA-Z0-9]//g" <<< $(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%*()-+' | fold -w 32 | head -n 1))
randomfilename=$(shuf -i 2000-65000 -n 1)
echo $randomfilename
echo "Introduzca a continuación el correo con el que creó su par de llaves:"
read email
if echo "${email}" | grep '^[a-zA-Z0-9]*@[a-zA-Z0-9]*\.[a-zA-Z0-9]*$' >/dev/null; then
        touch /tmp/${randomfilename}
        echo "Hey, what you doin?" > /tmp/${randomfilename}
if gpg --output ./archivo-cifrado.pgp --encrypt --recipient ${email} /tmp/${randomfilename} 2> /dev/null; then
        echo ""
        echo "Se acaba de crear un archivo cifrado con la llave pública del email ingresado en este mismo directorio."
	echo "El archivo creado se llama: \"archivo-cifrado.gpg\", deberás descifrarlo utilizando tu llave privada ya que allí está tu flag."
	echo ""
        echo "Recuerda que se te pedirá tu passphrase ingresado en el momento de la creación de tu par de llaves."
	echo ""
        echo "Ten en cuenta que si introdujiste mal el correo electrónico o elegiste uno diferente para crear tu clave no podrás descifrarlo."
else
        echo "Parece que hay un problema con tu correo electrónico o tu llave, intentalo de nuevo."
fi
else 
echo "El correo electrónico introducido no es válido."
fi
