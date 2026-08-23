# UndertaleMonstersRecreation

[![license](https://img.shields.io/badge/license-MIT%2FApache--2.0-blue)](LICENSE-APACHE) <img src="https://img.shields.io/github/repo-size/Bli-AIk/UndertaleMonstersRecreation.svg"/> <img src="https://img.shields.io/github/last-commit/Bli-AIk/UndertaleMonstersRecreation.svg"/> <img src="https://img.shields.io/github/v/release/Bli-AIk/UndertaleMonstersRecreation.svg"/> <br>
<img src="https://img.shields.io/badge/UNDERTALE-000000?style=for-the-badge&logo=undertale&logoColor=ff0000" /> <img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white" /> <img src="https://img.shields.io/badge/Kristal-FF6B35?style=for-the-badge&logo=love2d&logoColor=white" />

**UndertaleMonstersRecreation** — 面向 [MagicalGlassRedux](https://github.com/Bli-AIk/MagicalGlassRedux) 与 [Kristal](https://github.com/KristalTeam/Kristal) 的 UNDERTALE 怪物光战斗内容（蛙吉特、小模怪…）。

本仓库是**维护 fork**：上游（[FireRainV/Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack)）面向 Kristal 0.10 且不再积极维护，因此本仓库跟随 MagicalGlassRedux fork 的 Kristal 0.11-dev 移植，并增加可选的 [kristal-i18n](https://github.com/Bli-AIk/kristal-i18n) 支持。详见 [`UPSTREAM.md`](UPSTREAM.md) 与 [`CHANGELOG.md`](CHANGELOG.md)。

| 简体中文 | English                |
| -------- | ---------------------- |
| 简体中文 | [English](./README.md) |

## Kristal 版本支持

| Kristal 版本 | UndertaleMonstersRecreation |
| ------------ | --------------------------- |
| [v0.11.0-dev](https://github.com/KristalTeam/Kristal/commit/f62afea63ccab02f468c24ac0d096bd8a2c9aa81)（`f62afea`，2026-08-17） | v0.0.0（fork），engineVer `v0.11.0-dev` |
| v0.10.0 | v1.1.1（上游；`f182f69`） |

`v0.0.0` 是本 fork 当前在 `lib.json` 中的版本线；本 fork 尚未发布打包版本（见 [`CHANGELOG.md`](CHANGELOG.md)）。

### 上游对齐

| fork 版本 | 对齐的上游 | 上游 ref | 说明 |
| --------- | ---------- | -------- | ---- |
| v0.0.0 | UndertaleMonstersRecreation v1.1.1 | Noelle-Libraries-Pack `f182f69`（文件树 `0482e7d`） | Kristal 0.11-dev 移植 + kristal-i18n 适配 |

上游 pin 记录在 `.github/upstream-facts.json`；计算方法见 [`UPSTREAM.md`](UPSTREAM.md)。

## 安装

需要 **MagicalGlassRedux**（库 id `magical-glass`）——本库在 `lib.json` 中声明其为硬依赖。

```sh
git submodule add https://github.com/Bli-AIk/MagicalGlassRedux.git \
  libraries/MagicalGlassRedux
git submodule add https://github.com/Bli-AIk/UndertaleMonstersRecreation.git \
  libraries/UndertaleMonstersRecreation
```

本库为纯内容库（无 `lib.lua`）：MagicalGlassRedux 加载后，敌人通过 `MG_EVENT` 注册表注册。保持上游文件夹名（`UndertaleMonstersRecreation`），引擎才能通过 `lib.json` 发现它（库 id `undertale_monsters_recreation`）。

## 运行时开关

与 MagicalGlassRedux 一样，主 mod 可在自己的 `mod.json` 中干净地关掉本库（覆盖 `lib.json` 的 `enabled` 默认值 `true`，无需改库文件）：

```json
"config": {
    "undertale_monsters_recreation": { "enabled": false }
}
```

关闭后其内容不注册；库依然出现在 `Mod.libs` 中，依赖守卫仍然安全。

## 内容

- `froggit`（蛙吉特）—— 光敌人，3 波次（flies / leapfrog / splinter）、6 弹幕，遭遇战 `froggit`、`froggit2`
- `moldsmal`（小模怪）—— 光敌人，2 波次（pollendrop / splinterbig），遭遇战 `moldsmal`、`moldsmal2`、`moldsmal3`

## kristal-i18n 支持（可选）

当加载了 kristal-i18n（`kristalI18n`）时，敌人名/检查文本与波次字符串经 `Game:loc` + `Game:hasStr` 守卫本地化（否则英文回退）。语言数据位于 `lang/`，自动合并。

翻译出处记录在 `lang/zh_hans.json` 的注释里；来源见[上游来源与参考](#上游来源与参考)。

## 上游来源与参考

| 来源 | 作者 |
| ---- | ---- |
| [Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack)（上游） | FireRainV |
| UT 汉化补丁 0.3.3 键值对提取（UT 汉化原作：好人汉化组） | 真是滑稽了啊 |
| [DeltaruneChinese](https://github.com/gm3dr/DeltaruneChinese) —— 与光世界 UI 重叠处以它为准 | [Goodman 3 Localization Group \| UNDERTALE & DELTARUNE Chinese Localization](https://github.com/gm3dr/) |
| [kristal-i18n](https://github.com/Bli-AIk/kristal-i18n) | Bli-AIk |

## 参与贡献

欢迎提交 Issue 或 Pull Request。仓库布局（上游代码 vs fork 代码）、落地规则与翻译审核要求见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 许可证

**许可拆分**（重要——见 [LICENSE-UPSTREAM.md](LICENSE-UPSTREAM.md)、[LICENSE-MIT](LICENSE-MIT)、[LICENSE-APACHE](LICENSE-APACHE)）：

- *上游代码* —— pack 库中最初随附的全部内容，import 提交 `249c171`（对应上游 `f182f69`）—— **保留所有权利** © `lib.json` 所列原作者（Sam Deluxe、BrendaK7200、FireRainV）；上游发布时**未授予任何开源许可**。
- *fork 代码* —— 移植补丁、kristal-i18n 适配、CI 与文档 —— **MIT OR Apache-2.0 双许可，任选其一**。
- 拆分以 `git log` 为准：`Import UndertaleMonstersRecreation v1.1.1 ...` 及以前均为上游代码，其后为 fork 代码。
- 上游文本的衍生物（如上游文本的翻译）归于上游权利；fork 原创翻译由 fork 许可覆盖。
