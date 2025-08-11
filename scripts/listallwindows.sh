#!/bin/bash

swaymsg -t get_tree | jq -r '
  .nodes[] |
  recurse(.nodes[], .floating_nodes[]) |
  select(.type == "con" or .type == "floating_con") |
  {
    id: .id,
    app_id: .app_id,
    class: .window_properties.class,
    title: .name,
    pid: .pid
  }
'
