#!/usr/bin/env bash
set -euo pipefail

# Returns the most specific locale available in the environment
get_locale() {
  for v in LC_ALL LC_MESSAGES LANG; do
    val=${!v:-}
    if [[ -n "$val" && "$val" != "C" && "$val" != "POSIX" ]]; then
      echo "$val"
      return
    fi
  done

  # fallback to `locale` output
  loc="$(locale 2>/dev/null | awk -F= '/^LANG=/ {print $2; exit}')"
  echo "${loc:-C}"
}

# Normalise and map to short code
locale_full="$(get_locale)"

# Take language part (before dot/at/encoding/charset and before underscore or dash)
lang="$(echo "$locale_full" | sed -E 's/([^.@]+).*/\1/' | cut -d'_' -f1 | cut -d'-' -f1)"
lang_lc="$(echo "$lang" | tr '[:upper:]' '[:lower:]')"

case "$lang_lc" in
  en) printf "EN" ;;
  el|gr|greek) printf "EL" ;;
  *) 
    # default: uppercase first two letters (or whole code if short)
    if [[ ${#lang_lc} -ge 2 ]]; then
      printf "%s" "$(echo "${lang_lc:0:2}" | tr '[:lower:]' '[:upper:]')"
    else
      printf "%s" "$(echo "$lang_lc" | tr '[:lower:]' '[:upper:]')"
    fi
    ;;
esac

exit 0

