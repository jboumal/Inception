#!/bin/sh

envsubst < /tools/init.sql | sponge /tools/init.sql
exec $@