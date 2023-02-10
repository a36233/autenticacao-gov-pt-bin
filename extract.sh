#!/bin/bash
#cleanup
rm -rf pteid pteid_out *.flatpak
wget https://aplicacoes.autenticacao.gov.pt/apps/pteid-mw-linux.x86_64.flatpak
mkdir -p pteid
ostree init --repo=pteid --mode=bare-user
ostree static-delta apply-offline --repo=pteid pteid-mw-linux.x86_64.flatpak
ostree checkout --repo=pteid -U $(basename $(echo pteid/objects/*/*.commit | cut -d/ -f3- --output-delimiter= ) .commit) pteid_out
