# 项目技能安装记录

技能安装在 `.agents/skills/<name>/SKILL.md`，供从本仓库目录启动的 Codex 自动发现。
本次安装没有修改上游技能正文。完整来源和固定提交见 `skills-sources.json`；
保留了上游资源与许可证。Supervisor-Skills 根许可证补充到缺少许可证文件的技能目录。
各文件的许可声明应一并保留，其中部分技能注明 CC BY 4.0，仓库根声明 CC BY-NC-SA 4.0。

## 已安装

- hugohe3/ppt-master：`ppt-master`。
- HKUSTDial/Supervisor-Skills：`benchmark-paper-template`、`deep-research`、
  `drawio-reconstruction`、`figure-designer`、`idea-evaluator`、`intro-drafter`、
  `paper-polish`、`paper-writer`、`pre-submission-reviewer`、`rebuttal-guidance`、
  `tech-paper-template`、`vibe-research-workflow`。
- Acyeee/gpt-writing：现有平台代理认证下返回 `Repository not found`，无法验证
  SKILL.md，未安装、未替换。可能是地址不存在、已更名或私有仓库无访问权限。

## 恢复依赖和使用

需要 Python 3.10–3.14。当前实例使用 Python 3.12，依赖固定清单基于 Linux/Python 3.12。
在项目根目录运行：

```bash
bash scripts/setup-skills.sh
source .venv/bin/activate
```

脚本创建独立虚拟环境，安装固定依赖及上游 requirements，运行 pip check 和 PPT Master
完整性检查。`.venv`、生成缓存和 `.env` 不提交。未来任务直接使用现有 checkout，
无需创建 Git worktree。启动 Codex 时将工作目录设为本仓库，可用 `$ppt-master`、
`$paper-writer` 等技能名明确调用。已有会话可能需要重新启动以刷新目录。

## 验证与功能边界

- 全部 13 个 SKILL.md 的 YAML name/description 有效，名称与目录一致，无重复。
- Codex 0.166.0-alpha.1 的真实 app-server `skills/list`（forceReload=true）
  返回全部 13 个技能 enabled=true、errors=[]；记录见 `skills-discovery.json`。
  验证使用临时 CODEX_HOME，未修改用户配置，也未启动模型任务。
- 上游技能文件与固定来源逐字节一致；PPT Master attribution_guard 通过。
- PPT Master 原生图表导入、检查和导出回归测试：11 项通过（在 scripts 目录运行）。
- Python 依赖安装完成，pip check 通过；Draw.io crop_assist --help 正常运行。
- Draw.io Desktop/CLI 当前未安装：XML 编写和检查可用，但 `export_drawio.py`
  导出 PNG 需要安装官方 Draw.io 并设置 DRAWIO_PATH，Linux 无桌面时通常还需 Xvfb。
- Pandoc 已提供；LibreOffice 未安装，依赖它的 Office 渲染/预览尚未验证。
- OCR 可选依赖未专门配置；在线检索、AI 图片、语音服务需要对应网络或凭据，
  本次没有新增密钥、调用付费 API 或验证远程生成服务。
- 技能可识别不代表每个生成工作流都已端到端验证。未运行完整 PPT 生成、
  Draw.io 图像导出或文献研究任务。

本次仅提交本地 Git 更改，不推送远程，不发布云环境。
