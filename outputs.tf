output "namespace_id" {
  description = "Id of Event Hub Namespace."
  value       = azurerm_eventhub_namespace.events.id
}

output "hub_ids" {
  description = "Map of hubs and their ids."
  value       = { for k, v in azurerm_eventhub.events : k => v.id }
}

output "keys" {
  description = "Map of hubs with keys => primary_key / secondary_key mapping."
  sensitive   = true
  value = { for k, h in azurerm_eventhub_authorization_rule.events : h.name => {
    primary_key   = h.primary_key
    primary_conn_string = h.primary_connection_string
    secondary_key = h.secondary_key
    secondary_conn_string = h.secondary_connection_string
    }
  }
}

output "authorization_keys" {
  description = "Map of authorization keys with their ids."
  value       = { for a in azurerm_eventhub_namespace_authorization_rule.events : a.name => a.id }
}