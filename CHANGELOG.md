# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [v2025.1.0] - 2025-01-07
### :wrench: Chores
- [`e77a264`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/e77a264c0e25679fbd9f7fd0eabfe47939c0854c) - **update**: Cloudflared v2025.1.0 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.12.2] - 2024-12-19
### :wrench: Chores
- [`2c82345`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/2c82345f4c3a224549719af7264f1944f2717543) - **ci**: using ubuntu-24.04 for github action runners *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`8d621d5`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/8d621d57ddf75339bde40d930970742519d334f4) - **update**: Cloudflared v2024.12.2 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.12.1] - 2024-12-11
### :wrench: Chores
- [`5ce16f6`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/5ce16f6492d93f23b49e5e81eafde8efedd32c9a) - **update**: Cloudflared v2024.12.1 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.12.0] - 2024-12-10
### :sparkles: New Features
- [`3c1fce0`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/3c1fce03236cd9197c4b0adde0293724a663843d) - **ci**: introducing parameterized DOCKERHUB_PLATFORMS *(commit by [@visibilityspots](https://github.com/visibilityspots))*

### :wrench: Chores
- [`396f777`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/396f7773c5a1e8d4829811ef607556d0ab6ac9c3) - **ci**: disable requirement on DOCKERHUB_TOKEN to test inheritance *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`a4132ca`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/a4132caa25d33213ae83633a04953d75f5053e4e) - **update**: Cloudflared v2024.12.0 + Golang v1.23.4 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.11.1] - 2024-11-19
### :wrench: Chores
- [`13e7bb9`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/13e7bb9686da741b394ffd6b591e5b75ffbd999a) - **ci**: using secret for GOSS_CMD *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`efaa11d`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/efaa11d47f46b038a708d0ff3a71f17d961a14c5) - **update**: Cloudflared v2024.11.1 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.11.0] - 2024-11-08
### :sparkles: New Features
- [`b2f7347`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/b2f7347c442194c83ed6db0103c66530e89a9c1d) - **ci**: adding reusable workflow parameters + refactored some of them *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`6a91e0d`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/6a91e0de3c03156c72a349ea5974557b19253325) - **ci**: make trivy workflow reusable *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`37a80e8`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/37a80e8432880ed7de135abb0ace0f56ac85452a) - **ci**: make main workflow reusable *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`f4a8d30`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/f4a8d30434d9b9b3ed013e6f7b1724a2dcd6459b) - **ci**: make GOSS_CMD vars param *(commit by [@visibilityspots](https://github.com/visibilityspots))*

### :bug: Bug Fixes
- [`2eb1c3f`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/2eb1c3fd43921dea1ebbdc30a098fa3523290671) - **ci**: short-description indentation fixed *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`9a603da`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/9a603da8532ff99f533edd5b3d5fddf14b205ac0) - **ci**: using var for DOCKERHUB_USERNAME instead of default *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`53bea8d`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/53bea8d5d08c41235d6c2e53cc9333700b701dc1) - **ci**: using env var over inputs *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`edab8f3`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/edab8f31cfbd55a603089c6e8e9a98f57399b755) - **ci**: used wrong DOCKERHUB_REPOSITORY value due to copy paste *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`52d3450`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/52d34500edd9384105647adb273d70024e3bba49) - **README**: referring to yml main workflow over yaml one *(commit by [@visibilityspots](https://github.com/visibilityspots))*

### :wrench: Chores
- [`a80a2cd`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/a80a2cd9044c9a3c33667a8cd9e3afcc6ef4f3b5) - **update**: Golang v1.23.3 + Cloudflared v2024.11.0 *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`fd2bdb7`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/fd2bdb75da3b9201fc81913fef8f082f0fa54586) - **ci**: trigger docker-hub-description on every push *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`efbfdab`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/efbfdab6784e531e748f57a4edfe54348a820b85) - **ci**: figuring out parameters *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`72aa91f`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/72aa91f316c3ab8ea27b42337f37898ebab8eeae) - **revert**: removed last release to test ci chain *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`a859394`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/a85939415eca220518bbb62524263934442e3b1e) - **ci**: refactored workflows *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`c709aa9`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/c709aa983149e06ea76a69c8515d96f57d436293) - **revert**: removed last release to test ci chain *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`dd577e7`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/dd577e75cad4ce45759d029e7739485e51a84318) - **ci**: standardized yml extension *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`af0505a`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/af0505a9ecf510b6a023635b425d502f978258be) - **ci**: renamed a few actions + playing around with GOSS_CMD parameter *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.10.1] - 2024-10-24
### :bug: Bug Fixes
- [`c4bc296`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/c4bc29623a89a8e9ead3734f0d5291a66f20964f) - **ci**: using AWS based trivy repositories to mitigate TOOMANYREQUESTS from GHCR based ones *(commit by [@visibilityspots](https://github.com/visibilityspots))*

### :wrench: Chores
- [`ad8eb0a`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/ad8eb0a2a050298a26d648f15e6b9198513546d4) - **update**: cloudflared v2024.10.1 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.10.0] - 2024-10-10
### :wrench: Chores
- [`ea05d70`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/ea05d70aff2c2dd429577aec4f6ad98cc46ae6bf) - **update**: cloudflared v2024.10.0 + golang v1.23.2 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.9.1] - 2024-09-10
### :bug: Bug Fixes
- [`4ebb8a0`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/4ebb8a0a14c53321df4a144ddfe23ea24534e996) - **ci**: using main over master branch for committing changelog *(commit by [@visibilityspots](https://github.com/visibilityspots))*

### :wrench: Chores
- [`41f2395`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/41f2395a324c6bd110b206dfffcd468442581aa8) - **update**: cloudflared v2024.9.1 *(commit by [@visibilityspots](https://github.com/visibilityspots))*


## [v2024.8.3] - 2024-08-22
### :wrench: Chores
- [`d7d4b43`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/d7d4b4325c50dab3d4b95abb1060d2e946551307) - **ci**: auto generate release notes *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`5a034df`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/5a034df0ae4ba0d72cf24f2aea107b00d336ac85) - **ci**: added CHANGELOG action *(commit by [@visibilityspots](https://github.com/visibilityspots))*
- [`3067b87`](https://github.com/visibilityspots/dockerfile-cloudflared/commit/3067b8701a53fca607a411a9165e004f1fe4a4e3) - **update**: cloudflared v2024.8.3 + golang v1.23.0 *(commit by [@visibilityspots](https://github.com/visibilityspots))*

[v2024.8.3]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.8.2...v2024.8.3
[v2024.9.1]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.9.0...v2024.9.1
[v2024.10.0]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.9.1...v2024.10.0
[v2024.10.1]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.10.0...v2024.10.1
[v2024.11.0]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.10.1...v2024.11.0
[v2024.11.0]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.10.1...v2024.11.0
[v2024.11.0]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.10.1...v2024.11.0
[v2024.11.0]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.10.1...v2024.11.0
[v2024.11.1]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.11.0...v2024.11.1
[v2024.12.0]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.11.1...v2024.12.0
[v2024.12.1]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.12.0...v2024.12.1
[v2024.12.2]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.12.1...v2024.12.2
[v2025.1.0]: https://github.com/visibilityspots/dockerfile-cloudflared/compare/v2024.12.2...v2025.1.0
