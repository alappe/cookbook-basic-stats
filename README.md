basic-stats Cookbook
====================

This is a very simple cookbook around a shell script that fetches most basic system health stats and pushes them to a statsd
server somewhere. I want to have a version of this on all my boxes and as they vary, the first version of the shell script
decided which system it's on. This might later be changed, as the recipe can figure this out and have a slimmer script on each
platform.

Requirements
------------

The following platform families are supported:

* Debian
* Mac OS X
* FreeBSD

#### packages
- `nc` - use netcat to send the stats via UDP

Attributes
----------

#### basic-stats::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['basic-stats']['host']</tt></td>
    <td>String</td>
    <td>hostname or ip of the remote statsd</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['port']</tt></td>
    <td>String</td>
    <td>port to send to</td>
    <td><tt>8125</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['interface']</tt></td>
    <td>String</td>
    <td>network interface to fetch stats from</td>
    <td><tt>eth0</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['location']</tt></td>
    <td>String</td>
    <td>path to write the script to</td>
    <td><tt>/usr/local/bin</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['cron']['minute']</tt></td>
    <td>String</td>
    <td>cron description for minute</td>
    <td><tt>*</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['cron']['hour']</tt></td>
    <td>String</td>
    <td>cron description for hour</td>
    <td><tt>*</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['cron']['day']</tt></td>
    <td>String</td>
    <td>cron description for day</td>
    <td><tt>*</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['cron']['month']</tt></td>
    <td>String</td>
    <td>cron description for month</td>
    <td><tt>*</tt></td>
  </tr>
  <tr>
    <td><tt>['basic-stats']['cron']['weekday']</tt></td>
    <td>String</td>
    <td>cron description for weekday</td>
    <td><tt>*</tt></td>
  </tr>
</table>

Usage
-----
#### basic-stats::default

Just include `basic-stats` in your node's `run_list` with a configured `host`:

```json
{
  "name":"my_node",
	"normal": {
	  "basic-stats": {
		  "host": "logs.example.net"
		}
	},
  "run_list": [
    "recipe[basic-stats]"
  ]
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Authors
-------

* Andreas Lappe

License
-------

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
