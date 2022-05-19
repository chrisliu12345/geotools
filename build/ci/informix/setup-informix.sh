#!/bin/bash -e
printf "\nCopy database connection resource file"
mkdir --parents --verbose ~/.geotools
cp --verbose --force ./build/ci/informix/informix-sqli.properties ~/.geotools/

printf "\nCreate GEOTOOLS schema...\n"
docker cp ./build/ci/informix/setup_informix.commands geotools:/home/informix/
docker exec -u informix -w /opt/ibm/informix/ -i geotools /opt/ibm/informix/bin/dbaccess sysmaster /home/informix/setup_informix.commands