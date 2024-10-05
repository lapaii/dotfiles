#!/bin/sh

if [ -z "$1" ]; then
  echo "No argument provided. Usage: $0 [grep|pause|previous|next]"
  exit 1
fi

music_player="cider"

action=$1

case "$action" in
    grep)
        class=$(playerctl metadata --player=$music_player --format '{{lc(status)}}')

        case "$class" in
            playing)
                info=$(playerctl metadata --player=$music_player --format '{{artist}} - {{title}}')

                if [[ ${#info} -gt 50 ]]; then
                    # Trim title to 36 characters and add "..."
                    trimmed_title="${info:0:50}.."
                else
                    # Keep full title if less than or equal to 36 characters
                    trimmed_title="$info"
                fi

                trimmed_title=$(echo "$trimmed_title" | sed 's/\&/\&amp;/g; s/[[:space:]]*$//')

                text=" $trimmed_title"

                echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
                ;;

            paused)
                info=$(playerctl metadata --player=$music_player --format '{{artist}} - {{title}}')
                # Check if title length exceeds 36 characters
                if [[ ${#info} -gt 50 ]]; then
                    # Trim title to 36 characters and add "..."
                    trimmed_title="${info:0:50}.."
                else
                    # Keep full title if less than or equal to 36 characters
                    trimmed_title="$info"
                fi

                trimmed_title=$(echo "$trimmed_title" | sed 's/\&/\&amp;/g; s/[[:space:]]*$//')

                text=" $trimmed_title"

                echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
                ;;

            stopped)
                text=""

                echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
                ;;

            *) 
                ;;

        esac
        ;;
    
    pause)
        playerctl --player=$music_player play-pause
        ;;
    
    previous)
        playerctl --player=$music_player previous
        ;;

    next)
        playerctl --player=$music_player next
        ;;  
    *)
        echo "Unknown action: $action. Please use 'grep', 'pause', 'previous', or 'next'."
        exit 1
        ;;
esac
