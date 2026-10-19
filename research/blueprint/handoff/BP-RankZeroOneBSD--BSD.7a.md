# BP-RankZeroOneBSD--BSD.7a handoff

Issue #10919; Codex, session codex-Q1if3d. Claim confirmed at [the bot response](https://github.com/CBirkbeck/tauceti-explorer/issues/10919#issuecomment-6268088794). This is one complete planning pass, not a checkpoint or a mathematical-closure claim. Only BSD.7a is in scope. The issue's top-level scope governs the older embedded three-stage instructions; BSD.8 and BSD.9 have separate jobs #10920 and #10921 and are untouched.

## Result

The packet has status **complete**, with BSD.7a **planned**, no closed stage, and all implementation statuses **unchecked**. Its 36 targets comprise 22 theorems, 10 comparisons, 3 lemmas and 1 construction. The construction has 6 API items and 6 unit tests. There are 5 planets, 6 pinned baseline declarations, 9 precise gaps and 16 supplier requests. Every target has hypotheses, a proof plan, source locators, direct dependencies and a Check in the reader.

The accepted RS-30 title and base are followed: **Elliptic curves, Part II: rank-zero and rank-one Birch–Swinnerton-Dyer theory**, extending the unchanged Tau Ceti EllipticCurves roadmap. The current read-only roadmap/library were checked for overlap as well as the pinned baseline. The newer Tate-module Galois declaration is not misrepresented as available at the pin. No upstream roadmap or library was edited or built.

The arithmetic graph distinguishes CGS's local exclusion from KY's broader local 1/ω branch, the actual nonsplit residual extension from its semisimplification, exceptional global and local character corrections, finite S Euler products, characteristic ideals from Fitting ideals, augmentation from the coefficient prime, the full central-value BDP function from a square root, and the actual geometric/KY/Wüthrich lattices. The cyclotomic proof retains Wüthrich's individual integral containment, the rational BF bound, finite-power congruences, μ repair, nonzero augmentation control and product descent. It makes no general cyclotomic μ=0 assertion.

## Integration with the earlier packet

The accepted mixed-scope packet `RankZeroOneBSD--BSD.7.json` already contains 36 BSD.7a IDs. Reusing them in a second packet fails the duplicate-ID check. This deliverable therefore has distinct semantic IDs and a complete `refinementOf.nodeMap`, with each revised node's `refines` pointing to its predecessor. This is a refinement proposal for the **same owner and stage**, not a second owner of its mathematics. No old review is copied or inherited.

After independent review, integration must replace the earlier BSD.7a graph using this mapping and redirect its consumer references. The old packet's BSD.7, BSD.8 and BSD.9 nodes remain outside this edit. Do not keep two parallel copies of the BSD.7a graph or treat the newly named nodes as additional mathematical targets. The existing packet and other consumers were not edited because they are outside this issue's allowed paths.

## RT-AREA-iwasawa-1/5

The missing elliptic-unit owner has since been supplied by **CMAllPrimeMainConjectures CZ.2–CZ.3**. This pass imports its actual Rubin/character nodes, plus **AutomorphicPadicLFunctions L3h** for Hida's Katz μ theorem, and requests the stronger exceptional specialization. It does not propose a duplicate elliptic-unit roadmap. The existing owner's projection/Tor/control gaps remain visible; HE.7s's CM route should use that same owner, while its independent direct route is not given an artificial elliptic-unit dependency.

The Wüthrich extension is requested precisely from **KatoEulerSystems L4**, with the distinguished étale quotient, Néron/modular-symbol lattice, integral zeta class including nonfree cohomology, integral ordinary containment and isogeny transfer. **IntegralIwasawaTheory L4** already supplies the fine-Selmer Ferrero–Washington inputs. **ModularSymbolsPadicLFunctions L1** must supply the arithmetic Néron-period comparison beyond its saturated symbol lattice. The packet's rescope proposal keeps these additions in the existing supplier directions as Part II extensions.

## Exact remaining work

1. **Exceptional CM specialization.** Verify the actual CZ.3 specialization for θ=1/ω, p=3, anomalous cases and p dividing h_K. Preserve char X_1=(T·L_1). Rubin 1991 and HT94 were inspected at statement level, not through their full proofs; Rubin 1994 pp.23–28 and de Shalit III.1.10 were not obtained in an authorized copy.
2. **p-irregular CM congruence.** Prove both integral congruence-ideal divisibilities at this weight-one point, retaining h_K. The generic AC L0 residual-distinction theorem does not apply unchanged. BDP22's augmentation nonvanishing does not make its value an integral unit. Hida's 2025 correction retains a local nontriviality hypothesis whose applicability to this family must be established.
3. **Integral arithmetic exports.** Supply the exact Wüthrich/Kato, Néron-symbol periods, actual KLZ specialization and both reciprocity laws, regulator target lattices, and characteristic-zero scalar/open-image verification. The generic KLZ suppliers themselves retain unread-source gaps. ES.8 must supply the KLZ ordinary-local refinement of the rational Rubin bound, not the residual-irreducible integral theorem or a strict-at-all-p bound.
4. **KY coefficient prime.** ES.8's existing augmentation node leaves the coefficient-prime branch conditional. Verify its uniform error as ramification grows or give an independent μ argument. The integral Greenberg equality can use the rational Heegner bound plus the independent μ=0/λ comparison; it need not assume this stronger Kolyvagin export.
5. **Integral unscaled Heegner comparison.** Verify the two-way logarithm/local/lattice comparison at the coefficient prime. CGS asserts the integral corollary; KY's Introduction B and §3.0.8 have inconsistent ring labels. Preserve the weaker rationalized index-square comparison and the separately integral Greenberg equality. Fixed p-powers in descent and lattice transfer cannot be dropped from the unscaled line.
6. **KY cyclotomic adaptation.** Check finite-submodule, H⁰, surjectivity, control, BF and finite-power congruence inputs on the chosen lattice with local 1/ω, then compare it with Wüthrich's distinguished lattice and the original curve, including Néron period indices. The three lattices need not coincide.
7. **Normalized Coleman cokernel.** Resolve E13 before asserting an integral two-way BF equivalence. With the printed raw map and degree identity, multiplying by H_p(f) gives positive (p)-cokernel length when α_p²≡1 modulo p. A corrected raw target/normalization or an explicit divisor term is needed. The rational comparison survives this scalar. This finding does not disprove the main-conjecture endpoint.
8. **Hida Katz μ proof correction.** Resolve E15 in AP L3h. The 2022 replacement lemma does not repair the generic projection/intersection assertion as written. Verify the published independent second proof of Corollary 3.19, pp.97–98, or give the needed geometric argument with its actual extra hypotheses. Do not infer that μ-vanishing itself is false.
9. **Lean carriers.** Build the arithmetic supplier APIs before stating the omitted arithmetic signatures. The compact Suggested file lists all 36 targets, six API names and six test names as README omissions. It has seven genuine Mathlib algebra examples, no admitted data or empty arithmetic stand-ins.

The packet's 16 requests name exact consumers. In addition to the owners above they cover AGR R01.1, PF L0, PHR L3, early HE.8 and the unchanged EllipticCurves Layers 1, 2 and 4. No equality from HE.8b or MIMC L6 is a proof input.

## Sources and findings

The source ledger records exact URLs, dates, PDF hashes and reading scopes. Read the relevant CGS v2 §§2–4,6,7; CGLS published residual/congruence and main-conjecture passages; KY v2 §§1.1–1.5,2.2,3.0; and Wüthrich's Theorems 4,13,16, Proposition 8, Lemma 17 and Corollary 18. Also read the HT94/Rubin91 theorem statements, Hida 2010 hypotheses and correction passages, the whole 2022 addendum, the 2007 congruence application and its 2025 replacement, and BDP22's weight-one branch and augmentation proof. These are target-oriented readings, not a claim to have read every supplier proof.

CGS's publisher PDF returned HTML. All CGS locators and findings concern the inspected arXiv v2. The author copy was separately checked at the normalization passage; it has the same assertions. No finding is asserted against an uninspected journal text. The KY author copy was also compared at its findings. The cleared-library index was read; no other copy of uncleared de Shalit was used. No source file or passage is committed.

There are nine source findings, **RankZeroOneBSD/E7–E15**, with no self-review verdicts:

- E7: corrected anticyclotomic/cyclotomic disjointness and fixed-field wording.
- E8: KY's inconsistent index-square coefficient-ring labels; stronger integral export remains qualified.
- E9: KY's Theorem/Remark 3.0.9 cross-reference.
- E10: KY's p-adic lattice is tensored with its p-adic coefficient fraction field, not the auxiliary Q_ℓ.
- E11: Hida 2010 Lemma 3.17, withdrawn by the author addendum; do not infer its false full-rank conclusion.
- E12: Hida 2007 Corollary 5.6 uses the 2025 replacement argument and its retained assumptions.
- E13: CGS v2 raw/normalized PR Coleman pseudo-null-cokernel inconsistency, with an explicit height-one calculation.
- E14: CGS v2's reference to Corollary 4.1.1 should point to the normalized-map Corollary 4.1.3; E13 remains separate.
- E15: the coordinate-sum-zero plane also defeats the 2022 addendum's intersection/containment inference. The PDF was visually checked. A=any field, N={(x,y,z):x+y+z=0} has every required pair projection surjective, while N∩(A²×0) is one dimensional and fails the asserted m=2 pair-surjectivity condition.

Searches of version records, author publication pages and correction listings are recorded. E7–E8 retain previously identified issues without inheriting their review. The new findings require independent verification. The reader contains self-contained local and linear-algebra checks, so no scratch file is needed to reproduce the objections.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/RankZeroOneBSD--BSD.7a.json`: **0 errors, 0 warnings**.
- Source finding schema and source-version validation through `source_issues.check_issues` and `check_errata.versions_checked`: **0 errors**. The standalone errata CLI expects an errata envelope and filename; it is not a checker for a blueprint packet directly.
- Recursive traversal through the available packet-node graph: no cycles and no HE.8b/MIMC L6 equality input paths.
- Node/API/test inventory: every one of the 36 target IDs, six API names and six test names occurs in the reader and in the Suggested file's explicit arithmetic omission inventory.
- `lean-check research/blueprint/suggested/RankZeroOneBSD--BSD.7a.lean`: **exit 0, no errors or warnings**. The 132-line compact file imports Mathlib.RingTheory.PowerSeries.Inverse at the pinned shared build. Available memory was 83 GB before compilation. No Lean server, library build or dependency update was started.
- `git diff --check`: passed. Only the packet, reader, suggested file and this handoff belong to the submission.

No scratch artifact is required by the next worker. The source hashes, mathematical counterexamples, exact supplier contracts and migration map are preserved in the four deliverables.
