#!/bin/bash

HAXBY_MODES="$HAXBY_MODES start"

function haxby::start {

cd $HAXBY_DATA

pg_ctl -l $PGLOG -w start

}
