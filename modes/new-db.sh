#!/usr/bin/env bash

HAXBY_MODES="$HAXBY_MODES newdb"

function haxby::modes::newdb {

db=$1
if [ -z "$db" ]; then
    echo "Usage: haxby newdb name"
    exit 1
fi

mkdir -p $HAXBY_DATABASE_D/$1/{schemas.d,data.d}
pushd $HAXBY_DATABASE_D/$1 >/dev/null
touch init.sql

(
cat <<EOF
\connect postgres

DROP DATABASE IF EXISTS $1;
CREATE DATABASE $1;

\connect $1

-- Add any DB initialization code here
-- i.e. Create users/roles
EOF
) >init.sql

popd >/dev/null

}
