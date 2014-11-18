# FreeAgent puts the powerline style in zsh !

#colors
LEFT_SEC_1_BG='11'
LEFT_SEC_2_BG='8'
LEFT_GIT_BG='234'
LEFT_GIT_FG='white'


RIGHT_A_BG='240'

RIGHT_B_BG='237'
RIGHT_B_FG='white'

RIGHT_USER_BG='12'
RIGHT_USER_FG='231'

if [ "$POWERLINE_DATE_FORMAT" = "" ]; then
  POWERLINE_DATE_FORMAT=%D{%Y-%m-%d}
fi

if [ "$POWERLINE_RIGHT_B" = "" ]; then
  POWERLINE_RIGHT_B=%D{%H:%M:%S}
elif [ "$POWERLINE_RIGHT_B" = "none" ]; then
  POWERLINE_RIGHT_B=""
fi

if [ "$POWERLINE_RIGHT_A" = "mixed" ]; then
  POWERLINE_RIGHT_A=%(?."$POWERLINE_DATE_FORMAT".%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "exit-status" ]; then
  POWERLINE_RIGHT_A=%(?.%F{green}✔ %?.%F{red}✘ %?)
elif [ "$POWERLINE_RIGHT_A" = "date" ]; then
  POWERLINE_RIGHT_A="$POWERLINE_DATE_FORMAT"
fi

if [ "$POWERLINE_HIDE_USER_NAME" = "" ] && [ "$POWERLINE_HIDE_HOST_NAME" = "" ]; then
    POWERLINE_USER_NAME="%n@%M"
elif [ "$POWERLINE_HIDE_USER_NAME" != "" ] && [ "$POWERLINE_HIDE_HOST_NAME" = "" ]; then
    POWERLINE_USER_NAME="@%M"
elif [ "$POWERLINE_HIDE_USER_NAME" = "" ] && [ "$POWERLINE_HIDE_HOST_NAME" != "" ]; then
    POWERLINE_USER_NAME="%n"
else
    POWERLINE_USER_NAME=""
fi

POWERLINE_CURRENT_PATH="%3~"

if [ "$POWERLINE_FULL_CURRENT_PATH" = "" ]; then
  POWERLINE_CURRENT_PATH="%1~"
fi

if [ "$POWERLINE_GIT_CLEAN" = "" ]; then
  POWERLINE_GIT_CLEAN="✔"
fi

if [ "$POWERLINE_GIT_DIRTY" = "" ]; then
  POWERLINE_GIT_DIRTY="%F{red}✘%F"
fi

if [ "$POWERLINE_GIT_ADDED" = "" ]; then
  POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
fi

if [ "$POWERLINE_GIT_MODIFIED" = "" ]; then
  POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
fi

if [ "$POWERLINE_GIT_DELETED" = "" ]; then
  POWERLINE_GIT_DELETED="%S%F{red}✖%F%s"
fi

if [ "$POWERLINE_GIT_UNTRACKED" = "" ]; then
  POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
fi

if [ "$POWERLINE_GIT_RENAMED" = "" ]; then
  POWERLINE_GIT_RENAMED="➜"
fi

if [ "$POWERLINE_GIT_UNMERGED" = "" ]; then
  POWERLINE_GIT_UNMERGED="═"
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" \ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" $POWERLINE_GIT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN=" $POWERLINE_GIT_CLEAN"

ZSH_THEME_GIT_PROMPT_ADDED=" $POWERLINE_GIT_ADDED"
ZSH_THEME_GIT_PROMPT_MODIFIED=" $POWERLINE_GIT_MODIFIED"
ZSH_THEME_GIT_PROMPT_DELETED=" $POWERLINE_GIT_DELETED"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" $POWERLINE_GIT_UNTRACKED"
ZSH_THEME_GIT_PROMPT_RENAMED=" $POWERLINE_GIT_RENAMED"
ZSH_THEME_GIT_PROMPT_UNMERGED=" $POWERLINE_GIT_UNMERGED"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"

# if [ "$(git_prompt_info)" = "" ]; then
   # POWERLINE_GIT_INFO_LEFT=""
   # POWERLINE_GIT_INFO_RIGHT=""
# else
    if [ "$POWERLINE_SHOW_GIT_ON_RIGHT" = "" ]; then
        if [ "$POWERLINE_HIDE_GIT_PROMPT_STATUS" = "" ]; then
            POWERLINE_GIT_INFO_LEFT=" %F{$LEFT_SEC_2_BG}%K{$LEFT_GIT_BG}"$'\ue0b0'"%F{$LEFT_GIT_BG}%F{$LEFT_GIT_FG}%K{$LEFT_GIT_BG}"$'$(git_prompt_info)$(git_prompt_status)%F{$LEFT_GIT_BG}'
        else
            POWERLINE_GIT_INFO_LEFT=" %F{$LEFT_SEC_2_BG}%K{$LEFT_GIT_BG}"$'\ue0b0'"%F{$LEFT_GIT_BG}%F{$LEFT_GIT_FG}%K{$LEFT_GIT_BG}"$'$(git_prompt_info)%F{$LEFT_GIT_BG}'
        fi
        POWERLINE_GIT_INFO_RIGHT=""
    else
        POWERLINE_GIT_INFO_LEFT=""
        POWERLINE_GIT_INFO_RIGHT="%F{$LEFT_GIT_BG}"$'\ue0b2'"%F{$LEFT_GIT_FG}%K{$LEFT_GIT_BG}"$'$(git_prompt_info)'" %K{$LEFT_GIT_BG}"
    fi
# fi

if [ $(id -u) -eq 0 ]; then
    POWERLINE_SEC1_BG=%K{red}
    POWERLINE_SEC1_FG=%F{red}
else
    POWERLINE_SEC1_BG=%K{$LEFT_SEC_1_BG}
    POWERLINE_SEC1_FG=%F{$LEFT_SEC_1_BG}
fi
POWERLINE_SEC1_TXT=%F{black}
if [ "$POWERLINE_DETECT_SSH" != "" ]; then
  if [ -n "$SSH_CLIENT" ]; then
    POWERLINE_SEC1_BG=%K{red}
    POWERLINE_SEC1_FG=%F{red}
    POWERLINE_SEC1_TXT=%F{white}
  fi
fi
PROMPT="$POWERLINE_SEC1_BG$POWERLINE_SEC1_TXT $POWERLINE_USER_NAME %k%f$POWERLINE_SEC1_FG%K{$LEFT_SEC_2_BG}"$'\ue0b0'"%k%f%F{white}%K{$LEFT_SEC_2_BG} "$POWERLINE_CURRENT_PATH"%F{$LEFT_SEC_2_BG}"$POWERLINE_GIT_INFO_LEFT" %k"$'\ue0b0'"%f "

if [ "$POWERLINE_NO_BLANK_LINE" = "" ]; then
    PROMPT="
"$PROMPT
fi

if [ "$POWERLINE_DISABLE_RPROMPT" = "" ]; then
    if [ "$POWERLINE_RIGHT_A" = "" ]; then
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT%F{$RIGHT_B_BG}"$'\ue0b2'"%k%F{$RIGHT_B_FG}%K{$RIGHT_B_BG} $POWERLINE_RIGHT_B %f%k"
    elif [ "$POWERLINE_RIGHT_B" = "" ]; then
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT%F{$RIGHT_B_BG}"$'\ue0b2'"%k%F{240}%K{$RIGHT_B_BG} $POWERLINE_RIGHT_A %f%k"
    else
        RPROMPT="$POWERLINE_GIT_INFO_RIGHT%F{$RIGHT_B_BG}"$'\ue0b2'"%k%F{$RIGHT_B_FG}%K{$RIGHT_B_BG} $POWERLINE_RIGHT_B %f%F{$RIGHT_A_BG}"$'\ue0b2'"%f%k%K{$RIGHT_A_BG}%F{255} $POWERLINE_RIGHT_A %f%k"
    fi


    RPROMPT="${RPROMPT}%F{$RIGHT_USER_BG}%K{$RIGHT_A_BG}"$'\ue0b2'"%k%F{$RIGHT_USER_FG}%K{$RIGHT_USER_BG} %m"
    # RPROMPT="${RPROMPT}%F{$RIGHT_USER_BG}%K{$RIGHT_USER_BG}"$'\ue0b2'"%k%F{$RIGHT_HOST_FG}%K{$RIGHT_HOST_BG} %m "

fi
