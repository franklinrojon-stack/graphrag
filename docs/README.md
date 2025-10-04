# 文档资源索引

本仓库 `/docs` 目录汇总了针对特殊教育支持与精品课程建设的可直接使用的模板、指南与脚本。以下分模块说明各子目录的用途，便于在构建 GraphRAG 时快速定位语料来源。

## ASD 学生情绪与行为支持库
- [`asd_support/incident_abc_template.md`](asd_support/incident_abc_template.md)：ABC 观察记录表，记录前因、行为、后果与推测功能。
- [`asd_support/fba_guide.md`](asd_support/fba_guide.md)：功能性行为评估流程与数据表样例。
- [`asd_support/bip_template.md`](asd_support/bip_template.md)：干预计划模板，涵盖替代行为教学与强化计划。
- [`asd_support/deescalation_manual.md`](asd_support/deescalation_manual.md) 与 [`asd_support/safety_crisis_protocol.md`](asd_support/safety_crisis_protocol.md)：降阶策略与危机应对流程。
- 其他文件提供课堂环境改造、家校沟通、PBIS/MTSS 分层支持与案例闭环记录。

## ASD+ID 语言与沟通干预库
- [`asd_language_intervention/assessment_profile_*.md`](asd_language_intervention)：评估与基线记录模板，覆盖晨圈、游戏与加餐情境。
- [`asd_language_intervention/aac_guideline_*.md`](asd_language_intervention)：AAC 选型与建模策略，含 PECS、电子设备与多模态组合方案。
- [`asd_language_intervention/fct_plan_*.md`](asd_language_intervention)：功能性沟通训练方案，聚焦逃避、感官与注意力功能。
- [`asd_language_intervention/ndbi_plan_*.md`](asd_language_intervention)：自然情境教学计划，融入 ESDM、PMT 等理念。
- 数据记录、提示淡化、强化与泛化计划以及 10–15 分钟会话脚本也收录于同一目录。

## 五年级《生活语文》单课教案库
- [`life_language_grade5/lesson_plan_*.md`](life_language_grade5)：完整教案示例，含导入、示范、练习、巩固与家校延伸。
- [`life_language_grade5/task_analysis_*.md`](life_language_grade5)：任务分析与提示层级拆分。
- [`life_language_grade5/differentiated_support_*.md`](life_language_grade5)：A/B/C 组分层、IEP 适配与 UDL 便利。
- [`life_language_grade5/materials_*.md`](life_language_grade5)：可复制板书、图片卡与工作纸。
- 同目录内还包含形成性评价工具、数据记录表、行为支持协议与课后反思模板。

## 精品课示范与研修质量保障库
- [`exemplary_lessons/premium_lesson_rubric_*.md`](exemplary_lessons)：精品课评价量规，覆盖语言探究、STEM 项目与美感素养场景。
- [`exemplary_lessons/lesson_study_cycle_*.md`](exemplary_lessons)：Lesson Study 备课范式与流程记录。
- [`exemplary_lessons/classroom_observation_checklist_*.md`](exemplary_lessons)：观课要点与时间采样表。
- 案例全套包、共备清单、反馈表与可视化展示模板也集中在该目录。

## GraphRAG 构建流程参考
- [`graphrag_pipeline.md`](graphrag_pipeline.md)：讲解从语料整备、切分、向量化到关系抽取与图谱集成的建议步骤。

使用上述语料时，可结合 GraphRAG 的 chunking 与实体抽取流程，为教育场景知识图谱与问答系统提供高质量的结构化与半结构化数据来源。
