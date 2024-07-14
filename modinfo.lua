name = "Not enough loots"
description = "Scale rare boss item loot"
author = "Wasp"
version = "0.1.0"

api_version = 10
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

configuration_options =
{
  {
    name = "ExtraDrop",
    label = "Extra Amount",
    hover = "Add number",
    options = { -- Static table for testing purposes
      {description = "Normal", data = 1},
      {description = "Doubled", data = 2},
      {description = "Tripled", data = 3},
      {description = "Over 9000", data = 10},
    },
    default = 1,
  },
}