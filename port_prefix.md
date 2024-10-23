Here's the content transformed into Markdown format:

# Cosmos Port Prefixes

## Rationale

Node operators in the Cosmos ecosystem often want to run multiple Cosmos SDK-based nodes on the same server to save cost. The Cosmos SDK init command will generate `config.toml` and `app.toml` for each node. Without revision, the ports in these files will conflict with each other if multiple nodes are ran on the same server.

This project is an attempt to standardize these ports while avoiding port conflict. While any random non-conflicting ports can do, a standardized port prefix system can make the port assignment more predictable. Moreover, if two node operators follow the same system, they can easily exchange deployment scripts without breaking codes.

## How to Use

The best way to use the port prefix system is to use Ansible deployment script.

You can also change these 9 ports (5 in `config.toml` and 4 in `app.toml`) manually. See below.

### `config.toml`:
- `laddr = "tcp://0.0.0.0:26656"` -> `laddr = "tcp://0.0.0.0:{{ custom_port_prefix }}56"`
- `laddr = "tcp://127.0.0.1:26657"` -> `laddr = "tcp://0.0.0.0:{{ custom_port_prefix }}57"`
- `proxy_app = "tcp://127.0.0.1:26658"` -> `proxy_app = "tcp://127.0.0.1:{{ custom_port_prefix }}58"`
- `prometheus_listen_addr = ":26660"` -> `prometheus_listen_addr = ":{{ custom_port_prefix }}61"`
- `pprof_laddr = "localhost:6060"` -> `pprof_laddr = "localhost:{{ custom_port_prefix }}60"`

### `app.toml`:
- `address = "tcp://0.0.0.0:1317"` -> `address = "tcp://0.0.0.0:{{ custom_port_prefix }}17"`
- `address = ":8080"` -> `address = ":{{ custom_port_prefix }}80"`
- `address = "0.0.0.0:9090"` -> `address = "0.0.0.0:{{ custom_port_prefix }}90"`
- `address = "0.0.0.0:9091"` -> `address = "0.0.0.0:{{ custom_port_prefix }}91"`

## Supported Chains and Prefixes

Note: Please do not use 266 as port prefix because this is the default.

| Supported Chains | Prefixes |
|------------------|----------|
| Chain 1          | Prefix 1 |
| Chain 2          | Prefix 2 |
| ...              | ...      |

Replace `Chain 1`, `Prefix 1`, `Chain 2`, `Prefix 2`, etc., with the actual supported chains and their corresponding prefixes.