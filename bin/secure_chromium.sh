#!/usr/bin/zsh
function secure_chromium() {
  port=4711
  chromium --proxy-server="socks://localhost:$port" &
}
secure_chromium
