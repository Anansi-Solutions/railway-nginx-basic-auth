#!/bin/sh

# USERS: user:password pairs, separated by newlines or spaces.
for PAIR in ${USERS:-${USERNAME}:${PASSWORD}}; do
  echo "Generating password for user ${PAIR%%:*}"
  echo "${PAIR%%:*}:`openssl passwd -apr1 ${PAIR#*:}`" >> /etc/nginx/.htpasswd
done
