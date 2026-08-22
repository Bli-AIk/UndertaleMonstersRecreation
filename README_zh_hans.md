# UndertaleMonstersRecreation

面向 [MagicalGlassRedux](https://github.com/Bli-AIk/MagicalGlassRedux) 与
[Kristal](https://github.com/KristalTeam/Kristal) 的 UNDERTALE 怪物光战斗内容
（蛙吉特 Frogitt、摩登斯玛尔 Moldsmal）。

本仓库是**维护 fork**：上游
（[FireRainV/Noelle-Libraries-Pack](https://github.com/FireRainV/Noelle-Libraries-Pack)）
面向 Kristal 0.10 且不再积极维护，因此本仓库跟随 MagicalGlassRedux fork 的
Kristal 0.11-dev 移植，并增加可选的
[kristal-i18n](https://github.com/Bli-AIk/kristal-i18n) 支持。
详见 [`UPSTREAM.md`](UPSTREAM.md) 与 [`CHANGELOG.md`](CHANGELOG.md)。

## Kristal 版本支持

| Kristal v0.11.0-dev（`f62afea`，2026-08-22） | UndertaleMonstersRecreation v1.1.1，engineVer `v0.11.0-dev` |
|---|---|
| Kristal v0.10.0 | v1.1.1（上游；`f182f69`） |

## 安装

需要 **MagicalGlassRedux**（库 id `magical-glass`）——本库在 lib.json 中声明
其为硬依赖。

```sh
git submodule add https://github.com/Bli-AIk/MagicalGlassRedux.git \
  libraries/MagicalGlassRedux
git submodule add https://github.com/Bli-AIk/UndertaleMonstersRecreation.git \
  libraries/UndertaleMonstersRecreation
```

本库为纯内容库（无 lib.lua）：敌人通过 MagicalGlassRedux 的 `MG_EVENT`
注册表自动注册。

## 内容

- `froggit`（蛙吉特）—— 光敌人，3 波次（flies / leapfrog / splinter）、6 弹幕，
  遭遇战 `froggit`、`froggit2`
- `moldsmal`（摩登斯玛尔）—— 光敌人，2 波次（pollendrop / splinterbig），
  遭遇战 `moldsmal`、`moldsmal2`、`moldsmal3`

## kristal-i18n 支持（可选）

当加载了 kristal-i18n（`kristalI18n`）时，敌人名/检查文本与波次字符串经
`Game:loc` + `Game:hasStr` 守卫本地化（否则英文回退）。语言数据位于 `lang/`，
自动合并。

翻译来源（见 `lang/zh_hans.json` 出处注释）：

- UT 键值对提取版由「真是滑稽了啊」提供（UT 汉化原作：好人汉化组）
- Deltarune 汉化：[Goodman 3 / gm3dr](https://github.com/gm3dr/DeltaruneChinese)
  —— 与光世界 UI 重叠处以它为准
- fork 未覆盖词条须经维护者审核后翻译

## 许可

**许可拆分**（重要 —— 见 `LICENSE-UPSTREAM.md`、`LICENSE-MIT`、`LICENSE-APACHE`）：

- *上游代码* —— pack 库中最初随附的全部内容，import 提交 `249c171`（对应上游
  `f182f69`）—— **保留所有权利** © `lib.json` 所列原作者（Sam Deluxe、
  BrendaK7200、FireRainV）；上游发布时**未授予任何开源许可**。
- *fork 代码* —— 移植补丁、kristal-i18n 适配、CI 与文档 ——
  **MIT OR Apache-2.0 双许可，任选其一**。
- 拆分以 `git log` 为准：`Import UndertaleMonstersRecreation v1.1.1 ...` 及以前
  均为上游代码，其后为 fork 代码。
- 上游文本的衍生物（如上游文本的翻译）归于上游权利；fork 原创翻译由 fork 许可覆盖。

维护说明：已就本 fork 联系上游作者 FireRainV（见 `UPSTREAM.md`）；向上游回捐
PR 优先于 fork 本地漂移。
