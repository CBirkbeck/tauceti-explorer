# REV-AnabelianGeometryAndNonabelianChabauty--NC.0 — #6298

Agent: Codex (GPT-6), session `codex-S6JnVF`. Branch: `codex-S6JnVF-review-nc0`. Base: `c1a8d4d6f520741ef576b035a2819aa35ebadabc`. The [claim bot confirmed this session](https://github.com/CBirkbeck/tauceti-explorer/issues/6298#issuecomment-6101861242).

This is a completed independent review, with verdict **accepted**, of the NC.0 blueprint written by session `codex-Vohif4` for #6341. All 12 nodes have justified verdicts: five corrected and seven verified. No node was added. All 12 pinned baseline declarations and three source findings were independently checked. NC.0 remains `planned`, with six gaps and eight requests; the packet's `complete` status means the planning pass is finished.

## Deliverables and changes

The [review report](../reviews/REV-AnabelianGeometryAndNonabelianChabauty--NC.0.md) records the node audit, pinned declaration receipts, source locators and collation, supplier/ownership checks and validation. The [packet](../packets/AnabelianGeometryAndNonabelianChabauty--NC.0.json) contains the exact review marker `independent-review-REV-AnabelianGeometryAndNonabelianChabauty--NC.0`, all 12 verdicts, and a confirmed verdict on each source finding.

Added `ArithmeticPath.ext` to the packet and [suggested Lean file](../suggested/AnabelianGeometryAndNonabelianChabauty--NC.0.lean); corrected three test categories; explicitly attached the geometric H1-instantiation gap to both class-comparison nodes; clarified that Kim's 2005 unipotent torsor theorem motivates conventions while general topological torsors are imported from NC.3. The six definitions/constructions now have 27 API items and 19 tests; three further examples test existing Kummer cohomology. The accepted parent's 26 identifiers and five planets remain imports, with one new planet here.

Located Kim's published article at [the German National Library archive](https://d-nb.info/1372511016/34), *Central European Journal of Mathematics* 8 (2010), 633–645, DOI `10.2478/s11533-010-0047-y`. Read printed pp. 637–642 and collated them with arXiv:0804.1008v1, PDF pp. 4–9. SHA-256: `2a3cb8cf170ddeb841a750bcfdff4478a5696e8bb5a3872bc340947af7497e53`. The rendered p. 642 confirms the same gauge-order reversal as the preprint. Keep the existing source id `kim2008` and finding id ending `preprint-gauge-order`: their locators now accurately cover both versions. Packet `sourceVersions` also records the published Chen copy and independently checked latest arXiv v2.

All three source findings are confirmed: Chen Definition 4.2.1, p. 364, overstates local inertia injectivity and deletes the wrong tangent point; Kim p. 642 reverses the right-torsor gauge order. The report gives the independent Riemann–Hurwitz counterexample and C3/S4 computation in the reviewer's own words. No source excerpt, PDF or restricted book is in the repository.

## Where follow-up work resumes

Use the packet's six `gaps`, eight `requests`, `supplierAudit` and coverage `remaining` list. The concrete work remains geometric finite-cover/tangent instantiation and NC.3 H1 comparisons, normalization/branch/Kummer geometry, normalized analytic tangent transfer, exact finite-coefficient and canonical comparison maps, curve/product assembly inputs, and registered raw-homotopy/elementary-fibration suppliers. The review fixes precise evidence and scope; it does not claim these inputs now exist.

Keep RS-29 ownership: NC.0 concrete arithmetic paths, IG.0 ordinary finite-cover paths/topology, IG.1 arithmetic sequences and rational/tame tangent fibres, NC.3 generic equivariant torsors/H1/twisting; IG.6 imports NC.0. Import existing ProfiniteArithmetic, PeripheralActions and BelyiMaps Layer 12 targets. Their ordinary finite-cover comparisons still need IG.1's normalized analytic tangent-germ extension.

Current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already supplies `exists_openSubgroup_res_eq_zero` and `subsingleton_continuousCohomology_succ_of_subsingleton`. The report records their actual modules, lines and hypotheses. Import them through current ProfiniteCohomology Layer 10 and reconcile the older compilation pin; do not plan them again.

The existing [reader](../readmes/AnabelianGeometryAndNonabelianChabauty--NC.0.md) is not an editable deliverable named by #6298. It was read and retained. A later assembly/package should add the new extensionality API and incorporate the published Kim collation and clarified source scope from this report and packet. Its API outline and preprint citations predate these review additions.

## Checks

- Packet checker: exit 0, zero errors, zero warnings.
- Suggested file: `lean-check` exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` / Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; all 61 warnings are for admitted proofs. Memory was checked before the single compilation. No language server or separate build was started.
- All 27 API names, 19 named packet tests and three extra Kummer examples match the suggested file. All node and source-finding verdicts are present. Inherited identifiers are disjoint from the 12 new nodes; the combined planet count is six.
- Intake completion and file checks, and `git diff --check`, pass. Changes are limited to the three issue deliverables and this handoff.

Nothing remains for this review job. The report, packet and handoff preserve all evidence needed by future workers; scratch downloads and logs are disposable. This run claims no second job.
