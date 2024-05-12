if [[ "${UNAME_MACHINE}" == "arm64" ]]
  then
    # On ARM macOS, this script installs to /opt/homebrew only
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    # On Intel macOS, this script installs to /usr/local only
    eval "$(/usr/local/bin/brew shellenv)"
  fi
