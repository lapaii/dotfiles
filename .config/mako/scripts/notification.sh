#!/bin/bash

pkill -f "mpv.*notification.ogg"

mpv --no-resume-playback --really-quiet /home/lapaii/Music/notification/notification.ogg
