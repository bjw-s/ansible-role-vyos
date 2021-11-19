# vyos_coredns

**Title:** vyos_coredns

VyOS CoreDNS configuration

| Property                       | Pattern | Type    | Deprecated | Definition | Title/Description                                          |
| ------------------------------ | ------- | ------- | ---------- | ---------- | ---------------------------------------------------------- |
| - [enabled](#enabled )         | No      | boolean | No         | -          | Enable a CoreDNS container.                                |
| - [config_path](#config_path ) | No      | string  | No         | -          | Path on the VyOS router where the configuration is stored. |
| - [container](#container )     | No      | object  | No         | -          | CoreDNS container configuration                            |
| - [k8s_gateway](#k8s_gateway ) | No      | object  | No         | -          | CoreDNS k8s_gateway plugin configuration                   |
|                                |         |         |            |            |                                                            |

## <a name="enabled"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > enabled`

Enable a CoreDNS container.

**Example:** 

```yaml
enabled: true

```

## <a name="config_path"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > config_path`

Path on the VyOS router where the configuration is stored.

**Example:** 

```yaml
config_path: /config/coredns

```

## <a name="container"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > container`

CoreDNS container configuration

**Example:** 

```yaml
container:
  repository: ghcr.io/k8s-at-home/coredns
  tag: v1.8.4

```

| Property                               | Pattern | Type   | Deprecated | Definition | Title/Description                                                                    |
| -------------------------------------- | ------- | ------ | ---------- | ---------- | ------------------------------------------------------------------------------------ |
| + [repository](#container_repository ) | No      | string | No         | -          | Configure the CoreDNS image repository.                                              |
| + [tag](#container_tag )               | No      | string | No         | -          | Configure the CoreDNS image tag.                                                     |
| - [name](#container_name )             | No      | string | No         | -          | Configure the CoreDNS container name. Defaults to 'vyos-coredns'                     |
| - [networks](#container_networks )     | No      | object | No         | -          | Configure CoreDNS container networking. If not present, the container will be co ... |
|                                        |         |        |            |            |                                                                                      |

### <a name="container_repository"></a>![badge](https://img.shields.io/badge/Required-blue) `vyos_coredns > container > repository`

Configure the CoreDNS image repository.

### <a name="container_tag"></a>![badge](https://img.shields.io/badge/Required-blue) `vyos_coredns > container > tag`

Configure the CoreDNS image tag.

### <a name="container_name"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > container > name`

Configure the CoreDNS container name. Defaults to `vyos-coredns`

### <a name="container_networks"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > container > networks`

Configure CoreDNS container networking. If not present, the container will be configured with host networking.

| Property                                                            | Pattern | Type   | Deprecated | Definition | Title/Description       |
| ------------------------------------------------------------------- | ------- | ------ | ---------- | ---------- | ----------------------- |
| - [additionalProperties](#container_networks_additionalProperties ) | No      | object | No         | -          | Container network entry |
|                                                                     |         |        |            |            |                         |

#### <a name="container_networks_additionalProperties"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > container > networks > Container network entry`

**Title:** Container network entry

**Example:** 

```yaml
networks:
  services:
    ipv4_hostid: 2

```

| Property                                                               | Pattern | Type    | Deprecated | Definition | Title/Description                                                            |
| ---------------------------------------------------------------------- | ------- | ------- | ---------- | ---------- | ---------------------------------------------------------------------------- |
| - [ipv4_hostid](#container_networks_additionalProperties_ipv4_hostid ) | No      | integer | No         | -          | The host id that is used to generate the IP address on the specified network |
|                                                                        |         |         |            |            |                                                                              |

##### <a name="container_networks_additionalProperties_ipv4_hostid"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > container > networks > Container network entry > ipv4_hostid`

The host id that is used to generate the IP address on the specified network

## <a name="k8s_gateway"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > k8s_gateway`

CoreDNS k8s_gateway plugin configuration

**Example:** 

```yaml
k8s_gateway:
  api_ip: 10.0.0.10
  domains:
  - example.com
  enabled: true
  service_account: coredns
  service_account_ns: default

```

| Property                                                 | Pattern | Type            | Deprecated | Definition | Title/Description                                                                    |
| -------------------------------------------------------- | ------- | --------------- | ---------- | ---------- | ------------------------------------------------------------------------------------ |
| - [enabled](#k8s_gateway_enabled )                       | No      | boolean         | No         | -          | Enable the k8s_gateway plugin.                                                       |
| + [api_ip](#k8s_gateway_api_ip )                         | No      | string          | No         | -          | Address where the K8s API can be reached.                                            |
| + [domains](#k8s_gateway_domains )                       | No      | array of string | No         | -          | Configure the domains which should be handled by the k8s_gatway plugin.              |
| + [service_account_ns](#k8s_gateway_service_account_ns ) | No      | string          | No         | -          | Namespace where the ServiceAccount is defined.                                       |
| + [service_account](#k8s_gateway_service_account )       | No      | string          | No         | -          | Name of the ServiceAccount that is used to communicate with the K8s API. This ro ... |
|                                                          |         |                 |            |            |                                                                                      |

### <a name="k8s_gateway_enabled"></a>![badge](https://img.shields.io/badge/Optional-yellow) `vyos_coredns > k8s_gateway > enabled`

Enable the k8s_gateway plugin.

### <a name="k8s_gateway_api_ip"></a>![badge](https://img.shields.io/badge/Required-blue) `vyos_coredns > k8s_gateway > api_ip`

Address where the K8s API can be reached.

### <a name="k8s_gateway_domains"></a>![badge](https://img.shields.io/badge/Required-blue) `vyos_coredns > k8s_gateway > domains`

Configure the domains which should be handled by the k8s_gatway plugin.

| Each item of this array must be     | Description |
| ----------------------------------- | ----------- |
| [items](#k8s_gateway_domains_items) | -           |
|                                     |             |

#### <a name="autogenerated_heading_2"></a>vyos_coredns > k8s_gateway > domains > items

### <a name="k8s_gateway_service_account_ns"></a>![badge](https://img.shields.io/badge/Required-blue) `vyos_coredns > k8s_gateway > service_account_ns`

Namespace where the ServiceAccount is defined.

### <a name="k8s_gateway_service_account"></a>![badge](https://img.shields.io/badge/Required-blue) `vyos_coredns > k8s_gateway > service_account`

Name of the ServiceAccount that is used to communicate with the K8s API. This role does *not* create the ServiceAccount.

----------------------------------------------------------------------------------------------------------------------------
Generated using [json-schema-for-humans](https://github.com/coveooss/json-schema-for-humans) on 2021-11-19 at 13:42:22 +0100