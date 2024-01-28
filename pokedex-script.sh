#!/usr/bin/bash

pokemonName=$1

if [ "$pokemonName" = "" ];then
    echo "Input a pokemon name!"
    
else 
    pokeUrlInfo=$(curl --silent https://pokeapi.co/api/v2/pokemon/$pokemonName)

    if [ "$pokeUrlInfo" = "Not Found" ];then 
        echo "$pokemonName is not a pokemon!"
    else 
        echo -e "New entry in the pokedex: $1 has been scanned!\n"
    
        id=$(echo $pokeUrlInfo| jq .id)
		name=$(echo $pokeUrlInfo | jq .name)
		weight=$(echo $pokeUrlInfo | jq .weight)
		height=$(echo $pokeUrlInfo | jq .height)
		order=$(echo $pokeUrlInfo | jq .order)

        pokemon="$name(No. $order) \nId: $id \nWeight: $weight \nHeight: $height"
		echo -e $pokemon
    fi

fi


