# Nginx Log Analyser

A Bash-based utility for analysing Nginx access logs and identifying the most frequent IP addresses, requested paths, HTTP status codes, and user agents. It uses standard Linux command-line tools to generate summary reports from access log files.

## Project Page

Project URL: https://roadmap.sh/projects/nginx-log-analyser

## Features

- Analyses Nginx access log files.
- Displays the top 5 IP addresses by request count.
- Displays the top 5 requested paths.
- Displays the top 5 HTTP response status codes.
- Displays the top 5 user agents.
- Accepts a custom log file path as a command-line argument.
- Uses the sample log file in the script directory by default.
- Validates file existence and read permissions.
- Returns a non-zero exit status when input validation fails.
- Supports execution from directories other than the script directory.

## Requirements

- Linux operating system
- Bash
- awk
- sort
- uniq
- head

## Project Structure

```text
nginx-log-analyser/
├── LICENSE
├── nginx-access.log
├── nginx-log-analyser.sh
└── README.md
```

## Usage

Make the script executable:

```bash
chmod +x nginx-log-analyser.sh
```

Run the script using the default sample log file:

```bash
./nginx-log-analyser.sh
```

The script uses `nginx-access.log` located in the same directory as the script by default.

To analyse a different access log file, provide its path as an argument:

```bash
./nginx-log-analyser.sh /path/to/access.log
```

The script displays four reports containing the top 5 results for each category.

## Log Format

The script is designed for the structure of the provided Nginx sample access log, which follows the Combined Log Format.

The User Agent extraction relies on the quoted-field structure of this format.

Different Nginx log formats may require adjustments to the parsing logic.

## Example Output

```text
Top 5 IP Addresses:
   1087 178.128.94.113
   1087 142.93.136.176
   1087 138.68.248.85
   1086 159.89.185.30
    277 86.134.118.70

Top 5 Requested Paths:
   4560 /v1-health
    270 /
    232 /v1-me
    127 /v1-list-workspaces
     75 /v1-list-timezone-teams

Top 5 HTTP Status Codes:
   5740 200
    937 404
    621 304
    260 400
     23 403

Top 5 User Agents:
   4347 DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com)
    513 Mozilla/5.0 (Windows NT 10.0; Win64; x64) ...
    332 Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) ...
    294 Custom-AsyncHttpClient
    282 Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) ...
```

## Project Status

The core log analysis functionality, input validation, custom file path support, and execution from different working directories have been implemented and tested in an AlmaLinux lab environment.

The project uses a sample Nginx access log file for testing.

## Limitations

- Log parsing is based on the structure of the provided sample log file.
- Different access log formats may require changes to the parsing commands.
- The script displays the top 5 results for each category.

## License

This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.
