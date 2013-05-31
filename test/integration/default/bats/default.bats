#!/usr/bin/env bats

SCRIPT="/tmp/basicstats.sh"

@test "script should get written to configured location" {
  [ -e ${SCRIPT} ]
}

@test "nc should be installed" {
  run which nc
  [ "$status" -eq 0 ]
}

@test "host should be configured" {
  run grep "logs.example.net" ${SCRIPT}
  [ "$status" -eq 0 ]
}

@test "port should be configured" {
  run grep "8678" ${SCRIPT}
  [ "$status" -eq 0 ]
}

#@test "cron line should be correct" {
#  run crontab -l -u root | grep "9 8 7 6 5 bash /tmp/basicstats.sh"
#  [ "$status" -eq 0 ]
#}

@test "interface should be configured" {
  run grep "bg098" ${SCRIPT}
  [ "$status" -eq 0 ]
}
