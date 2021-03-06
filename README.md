openntpd Cookbook
=================

Install the OpenBSD ntp daemon.

Requirements
------------

### Ohai and Chef:
This cookbook makes use of `node['platform_family']` to simplify
platform selection logic. This attribute was introduced in Ohai v0.6.12.

### Platform:

The following platform families are supported:

* Debian

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### openntpd::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openntpd']['servers']</tt></td>
    <td>Array</td>
    <td>Servers to use in configuration</td>
    <td><tt>['0.debian.pool.ntp.org', '1.debian.pool.ntp.org', '2.debian.pool.ntp.org']</tt></td>
  </tr>
  <tr>
    <td><tt>['openntpd']['listen']</tt></td>
    <td>Array</td>
    <td>Devices to listen on, e.g. '*', '::1'. None means no listening at all…</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

Usage
-----
#### openntpd::default

Just include `openntpd` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openntpd]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

- Authors:
  * Andreas Lappe

- Copyright: 2013, kaeufli.ch

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
