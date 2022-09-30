<a name="readme-top"></a>
<br />
<div align="center">
  <a href="https://tailscale.com/">
    <img src="https://cdn.secunit.io/media/images/tailscale/tailscale-logo.png" alt="Tailscale" width="521" height="118"></a>
</div>
<br />

## Create an active/passive Tailscale Network Router on Linux

### Getting Started

### Prerequisites
* Some flavor of Debian or Ubuntu, although other flavors should work with minimal changes.
* A working Tailscale mesh network - i.e. you should be able to ping all your nodes from the box you want to be your LAN router.
* An general understanding of advanced networking concepts - like virtual IPs, VRRP, multicast - if someting goes wrong.
* curl or wget should be installed
* root or su/sudo access

## Fully Automated Install
| Method | One-Liner |
| --- | --- |
| curl | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/x86txt/bashFunctions/main/routing/tailscale-install.sh)"` |
| wget | `sh -c "$(wget https://raw.githubusercontent.com/x86txt/bashFunctions/main/routing/tailscale-install.sh -O -)"` |
| fetch | `sh -c "$(fetch -o - https://raw.githubusercontent.com/x86txt/bashFunctions/main/routing/tailscale-install.sh)"` |

> **Warning** It's a good idea to inspect the install script from projects you don't yet know. You can do that by downloading the install script first, looking through it so everything looks normal, then running it.













[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


[contributors-shield]: https://shields.secunit.io/github/contributors/x86txt/alphatheory.svg?style=for-the-badge
[contributors-url]: https://github.com/x86txt/alphatheory/graphs/contributors
[forks-shield]: https://shields.secunit.io/github/forks/x86txt/alphatheory.svg?style=for-the-badge
[forks-url]: https://github.com/x86txt/alphatheory/network/members
[stars-shield]: https://shields.secunit.io/github/stars/x86txt/alphatheory.svg?style=for-the-badge
[stars-url]: https://github.com/x86txt/alphatheory/stargazers
[issues-shield]: https://shields.secunit.io/github/issues/x86txt/alphatheory.svg?style=for-the-badge
[issues-url]: https://github.com/x86txt/alphatheory/issues
[license-shield]: https://shields.secunit.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg?style=for-the-badge
[license-url]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[linkedin-shield]: https://shields.secunit.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/company/alpha-theory-llc
[product-screenshot]: https://cdn.secunit.io/media/images/tailscale/tailscale-network-diagram.svg
<p align="right">(<a href="#readme-top">back to top</a>)</p>
