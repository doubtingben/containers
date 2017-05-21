#!/bin/bash

echoerr() { printf "%s\n" "$*" >&2; }

BEEPING_GEODATFILE="${BEEPING_GEODATFILE:-/opt/GeoIP/GeoLite2-City.mmdb}"
BEEPING_INSTANCE="${BEEPING_INSTANCE:-localhost}"
BEEPING_LISTEN="${BEEPING_LISTEN:-127.0.0.1}"
BEEPING_PORT="${BEEPING_PORT:-8080}"
BEEPING_TLSMODE="${BEEPING_TLSMODE:-false}"
BEEPING_VALIDATETARGET="${BEEPING_VALIDATETARGET:-true}"

BEEPING_TLSMODE_option=$([[ ${BEEPING_TLSMODE} == "true" ]] && echo "-tlsmode" || echo "")
BEEPING_VALIDATETARGET_option=$([[ ${BEEPING_TLSMODE} == "true" ]] && echo "-validatetarget" || echo "")

# run our command
exec "$@" -geodatfile ${BEEPING_GEODATFILE} \
	-instance ${BEEPING_INSTANCE} \
	-listen ${BEEPING_LISTEN} \
	-port ${BEEPING_PORT} \
	${BEEPING_TLSMODE_option} \
	${BEEPING_VALIDATETARGET_option}
