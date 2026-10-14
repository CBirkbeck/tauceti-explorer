# Independent review of RD.4

**Verdict: accepted as one complete planning pass.** RD.4 remains `planned`, with no stage marked closed. The three mathematical gaps and nine supplier requests remain explicit. Acceptance certifies the corrected plan and its stated limits, not a formal implementation or completed proofs of G1–G3.

Issue: [#9754](https://github.com/CBirkbeck/tauceti-explorer/issues/9754). Reviewer: Codex, session `codex-xAHMWQ`, on 2026-10-14. The reviewed blueprint was written by session `codex-mCyHLK` for [#9746](https://github.com/CBirkbeck/tauceti-explorer/issues/9746); this reviewer did not write it. The [packet](../packets/PadicDifferentialEquationsAndRigidCohomology--RD.4.json), [reader](../readmes/PadicDifferentialEquationsAndRigidCohomology--RD.4.md) and [suggested file](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.4.lean) were reviewed together.

| Inventory | Before | After |
|---|---:|---:|
| New target nodes | 23 | 23 |
| Theorems / constructions / definitions / comparisons | 12 / 8 / 1 / 2 | 12 / 8 / 1 / 2 |
| API items | 42 | 44 |
| Worked checks | 33 | 34 |
| Baseline declarations | 6 | 6 |
| New planet candidates | 3 | 3 |
| Imported RD.4 nodes / inherited refinement records | 33 / 8 | 33 / 8 |
| Gaps / supplier requests | 3 / 9 | 3 / 9 |
| Recorded source corrections | 0 | 3 |
| Node verdicts | — | 10 verified, 13 corrected |

No nodes were added or removed. The general coefficient and model interfaces were corrected in the existing refinement/request records, with direct coefficient prerequisites added where needed. All `implementationStatus` fields remain `unchecked`.

## Corrections made

1. **Shifted log maps.** The source diagrams suppress the implementation convention for shifts. With the standard cochain differential on C[−1] equal to −d, the degree-q injection into the absolute log complex is β↦(−1)^(q−1)β∧θ=θ∧β, where θ=dlog t. The absolute projection into Ξ[−1] needs the same degree sign. Their composite agrees with the shift of the unshifted relative map β↦[β∧θ]. The residue double complex still has horizontal differential (−1)^j d and vertical right wedge θ. Added `SupportedLogComplex.shiftInjection` and the concrete β=x dy chain-map check. These are convention clarifications, not allegations of a source theorem error.
2. **Admissibility.** Replaced smoothness of the entire generic fibre by the source's flatness and generic smoothness over W[t], retaining smoothness over W, the relative strict normal-crossings divisor, divisor log structure and exact special-base identity. Specified the induced product/blow-up higher embedding levels rather than permitting arbitrary compatible embeddings. Locators: DL Appendix B.1, pp. 114–115; GK05 §§5.1–5.2, pp. 26–28.
3. **Coefficients without Frobenius.** The parent already provides general ordinary j†/rigid realizations, but its MW, closed-support/localization and finite-extension clients often state F-isocrystal hypotheses. An arbitrary E∈Isoc† does not acquire Frobenius by forgetting it. Refined MW via BI Proposition 2.5.2(ii), global pp. 82–83, and Corollary 2.5.6, p. 86: use a finite projective weak module with integrable connection **and** Taylor overconvergence. Refined closed supports and localization termwise from B97's arbitrary-sheaf support kernel. Ordinary finite scalar extension uses CT03 Corollary 11.8.2, pp. 212–213. Its compact-support extension and the no-F local Gysin calculation/gluing remain G1. The RD.3 request and direct coefficient prerequisites now expose this interface. The automatic Taylor argument with invertible horizontal Frobenius remains the separate inherited RD.3 theorem.
4. **Dagger versus completed log realization.** GK00 Theorem 5.1 compares dagger cohomology with overconvergent j† cohomology on specified proper formal frames and partially proper dagger closure tubes. It does not identify arbitrary nonproper completed log-convergent charts. Corrected `log-dagger-comparison` to state the ordinary derived comparison, require coherent log-term/coefficient extensions, and make the DL supported/completed identification conditional on G2. Added the direct `proper-log-rigid-convergent-comparison` prerequisite for the unsupported proper semistable constant-coefficient case. GK05 Theorem 5.3(ii), pp. 28–29, does not supply the arbitrary log connection or nonproper boundary extension. G2 now names the support, completion, coefficient, signed-triangle and HLTT model compatibilities separately.
5. **API and checks.** All 33 original test kinds were `discriminating`, which is outside the PROTOCOL §12 enumeration. Assigned the specified kinds without weakening the checks. Made `support_order` an actual equality of the canonical map with the adjunction counit, and strengthened the specialization affine-line test to identify the ordinary/compact group types and ρ⁰(1)=1. Added the shifted-wedge computation and `LogRigidRealization.coefficientMap`. The nine definition/construction nodes all retain at least three discriminating checks. Heavy checks stay in the reader because their geometric carriers are not at the pins.
6. **Source scope and audit attribution.** Added the three source records below, made clear which old omissions are reported by correction notices, and recorded the inaccessible GK05 publication. Added independent current-upstream/supplier audit notes; the author's earlier Mathlib PR/Zulip searches remain attributed to the author. Updated reader hypotheses, maps, refinements, requests, worked tests and source-reading list, and the suggested file's heavy-target inventory, consistently.

## Node-by-node source and closure check

The node prefix is `PadicDifferentialEquationsAndRigidCohomology:RD.4/`. Every source locator and its `match` was checked against the identified PDF, not inferred from a bibliographic title. Public source URLs, versions and hashes are in the packet. GK00/GK05 were read from the maintainer-cleared copies of the identified public author versions, without copying their files or passages into the deliverables.

| Node suffix | Verdict | Evidence and scope |
|---|---|---|
| `relative-overconvergent-poincare` | verified | CT03 Proposition 8.3.5, pp. 156–162 and radius lemmas pp. 76–79 checked: relative differential is canonical, not an absolute connection; proper compactification and smooth ambient hypotheses retained. |
| `etale-proper-de-rham-descent` | verified | CT03 Theorem 9.1.1, Corollary 9.1.2 and proof route checked with §7.2.2 frame-hypercover conventions. Splitness of a separate compactification proof is recorded as a known correction, not added to this already-framed theorem. |
| `coefficient-long-exact-sequence` | corrected | CT03 Proposition 10.5.1 and B97 support exactness checked. Added direct general coefficient input and explicit no-F refinements of inherited support contracts. |
| `general-rigid-gysin` | corrected | T03 pp. 895, 908 confirms unrestricted Gysin and scalar compatibility. Corrected import of the F-only local calculation for arbitrary coefficients; no-F coordinate calculation and global gluing remain G1. |
| `quasi-etale-specialization` | corrected | DL B.1 checked. Formal/special étale equivalence is correctly separated from tube specialization; three test kinds corrected. |
| `tube-proper-support-functor` | corrected | DL Definition B.1, Remark B.2, Lemma B.3 checked. Tube kernel, exactness and direction of the natural map are correct; four test kinds corrected. |
| `supported-log-de-rham-complexes` | corrected | DL B.1–B.2 and GK05 §§5.1–5.2, 5.4 checked. Corrected generic smoothness and induced higher-level admissibility; fixed standard cochain injection signs, added its API and a degree-two computation, and made support-map test precise. |
| `log-monodromy-localization` | verified | DL (B.3) checked: localization triangles and connecting N are natural; boundary remains log convergent. Uses the corrected signed injection convention. |
| `log-rigid-proper-support-cohomology` | corrected | DL Definition B.4/(B.11) checked: proper compactification parameter retained and boundary convergent. Four test kinds corrected. |
| `log-residue-double-complex` | corrected | DL (B.4)–(B.6) and GK05 §5.2 checked: horizontal/vertical signs and P_(2j+k+1) correct. Intersection-order misprint recorded; three test kinds corrected. |
| `supported-log-weight-spectral-sequence` | verified | DL Lemma B.5/(B.12) checked: j≥max(0,−k), degree q−2j−k and intersection order 2j+k+1 correct. Vector-space scope avoids unsupported Frobenius normalization. |
| `positive-log-support-complex` | corrected | DL (B.7)–(B.10), Lemma B.6 checked: Xi quotient and zeroth column correct. Supplied signed absolute map into the standard shift and precise compatibility with the relative map; three test kinds corrected. |
| `positive-support-spectral-sequence` | verified | DL Lemma B.6 checked: only j=0, k≥0 and q−k survive, with total-to-column projection giving the map. |
| `high-degree-log-support-comparison` | verified | DL Lemma B.5 checked: inequalities kill the two boundary degrees; endpoints 2d and 2d−|k| and the j≥1 exception at (0,2d−1) retained. |
| `dagger-berthelot-comparison` | verified | GK00 Theorem 5.1 and proof read: proper formal model, partially proper closure tube, coherent radius comparison and smooth de Rham specialization correct. Frobenius naturality only for compatible lifts, followed by lift independence. |
| `dagger-supported-comparison` | verified | GK00 §§4.8,5.2 and ordinary comparison checked: closed-support fibre route sound, compact ambient support is a separate G2 target. No claim that ordinary localization alone supplies compact support. |
| `log-dagger-comparison` | corrected | Corrected dagger/jdagger versus completed log-convergent conflation. Added the proper constant-coefficient adapter prerequisite, partial-proper/coherent model data and precise support/completion/coefficient G2 obligations; checked GK00 5.1, GK05 5.3(ii) and DL B.2. |
| `algebraic-rigid-specialization-maps` | corrected | XZ §§2.2.1–2.2.4 checked: opposite directions of ordinary/compact maps and boundary-ideal pro-connection correct. Strengthened affine-line test to give actual group types and image of 1; four test kinds corrected. |
| `specialization-forget-supports-square` | verified | XZ Proposition 2.2.5 and proof checked: support square has composite rho after iota after rho_c, with no invertibility inference. |
| `igusa-theta-cokernel` | corrected | Pan v1 Definition 5.1.6, Proposition 5.1.7 checked: weights, determinant power, image quotient and smooth colimit action correct. Coleman geometric identification remains G3; four test kinds corrected. |
| `rigid-support-cohomological-bounds` | corrected | T03 Lemma 4.1.2 checked with localization/Gysin induction. Added the general coefficient prerequisite and repaired no-F inherited MW/support/scalar imports; G1 remains visible. No finiteness theorem inferred. |
| `proper-log-rigid-convergent-comparison` | verified | GK05 Theorem 5.3(ii) proof checked: proper component intersections identify the two residue pages for constant coefficients. No nonproper boundary or arbitrary-log-connection extension asserted. |
| `log-rigid-realization` | corrected | GK05 Lemma 1.4/§1.5,5.1 checked: exactified product tubes, common-refinement Poincare and locally constant coefficient class correct. Added coefficient-map API; four test kinds corrected. |

The relative Poincaré proof uses shrinking open-disc radius systems, coherent acyclicity and diagram resolutions; a closed unit disc is not substituted. CT03's already-framed étale-proper theorem is distinguished from constructing a compactification of an arbitrary étale hypercover. The unrestricted Gysin target keeps its gluing obligation. The DL weight-page intersection order 2j+k+1, lower bound j≥max(0,−k), and cohomological degree q−2j−k were checked. The positive page retains j=0 and k≥0. Both inequalities in each localization comparison were checked, including the j≥1 exception at (0,2d−1). No degeneration, Tate normalization or finiteness conclusion was added to those vector-space pages.

All eight inherited refinements were compared with the actual parent node statements. They cover strong fibration, automatic Taylor convergence, ordinary independence, compact independence, MW, finite scalar extension, localization, and finite étale pushforward. The parent Gysin node is the liftable F-coordinate case; it cannot close the new general no-F target. Where the read source is an announcement or a later invocation, G1 preserves the unread global proof. A full source proof was not claimed for Tsuzuki 1999, Berthelot's general compact invariance, or the Coleman geometric realization.

## Pinned baseline and nonduplication

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` were used. For each of the six entries, the declaration statement and relevant hypotheses were independently read and the shared-build source matched the raw exact-pin GitHub source. **No baseline citation was removed or replaced.**

| Declaration | What it supplies, and its limit |
|---|---|
| `mathlib:DerivedCategory` | The derived category for an abelian category with `HasDerivedCategory`; the name is global. Specialized sheaf-derived operations remain E1–E3 interfaces. |
| `mathlib:LinearMap.ker` | Existing kernel submodule of a semilinear map, specialized to linear section maps. It is not a tube sheaf functor. |
| `mathlib:LinearMap.range` | Existing image submodule; the semilinear range needs `RingHomSurjective`, satisfied in the linear specialization used here. |
| `mathlib:Submodule.mkQ` | Existing linear quotient projection and module carrier for the theta presentation. |
| `mathlib:KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale` | For commutative rings with compatible algebra/scalar-tower data and formally étale S→T, the algebraic differential base-change equivalence. No analytic overconvergence or support comparison is inferred. |
| `tauceti:TauCeti.kaehlerBasisOfFormallyEtale` | Basis transport across that formally étale algebraic base change; analytic tube form bases remain the supplier's work. |

The reviewed `data/library-coverage.json` has no direct RD.4 record; ColemanIntegration L0/L1 distinguishes partial analytic foundations from absent specialized MW/rigid cohomology. Independently read the relevant current AdicSpaces and StablePeriodicCurved reader contracts, checked their Suggested declaration inventory, searched the nine newer roadmap Suggested files and all OperatorTheory subpackages, checked the four Completed Suggested files, and searched current Tau Ceti. No specialized rigid/log/dagger carrier replacing these targets was found. Existing derived categories, kernels, images, quotient modules and algebraic étale differentials remain baseline inputs. The generic F1 comparison retains its partial-properness restriction.

## Supplier, tier, planet and red-team check

Read the actual supplier contracts in the RD.3/RD.4 parent, AdicSpacesPartII F1/R2/R3, CrystallineCohomology CR.5, AdicEtaleGeometry A1, EnhancedDerivedSheaves E1–E3 and SchemeAndStackFoundations SF.4. The nine requests are specific extensions or imported interfaces; they do not pretend the current generic stage already proves specialized tube/log comparisons. In particular, CR.5 owns algebraic/log models and residue/exactification extensions, while RD.4 owns their analytic comparison; the requested CR.5 foundations must not cite back to RD.4 analytic cohomology. These foundation suppliers are below RD's tier in the Caraiani–Newton order. RD.5/RD.6 and the higher modular/automorphic consumers are not prerequisites for RD.4's comparison or ordinary support-amplitude theorem.

Confirmed finding `RT-AREA-padic-2/32` and its independent verifier's explanation were read. The three proposed links remain justified: RD.4 comparison, RD.5 finiteness and RD.6 weights feed AG2.4 separately. F1 keeps dagger carriers and ambient boundary operations; it is not a duplicate rigid comparison owner. The HLTT tube/model/log adapter remains G2 rather than an unrestricted generic-fibre identification. No consumer or upstream file was changed.

The three new planets are central targets. The existing assembly proposal consolidates parent and continuation flags to six total RD.4 planets; concatenating the flags would exceed the limit. The proposed general Gysin planet replaces the inherited restricted one. No planet name or proposal needed changing.

## Source corrections

All three added findings have this independent review's `confirmed` verdict, and their full evidence and searches are recorded in `sourceIssues`:

- **E1, GK00 Lemma 4.7, p. 21:** the author-version footnote reports that discrete valuation and characteristic zero were omitted in print. Use the repaired hypotheses. Theorem 5.1's mixed-characteristic DVR setup already satisfies them. The old publisher text was not independently collated.
- **E2, GK05 §5.2, p. 28:** the second intersection sum in the alternating residue complex repeats Θ_(1,G); it must be Θ_(2,G), as equation (2) and the two-component case show. This is a harmless index misprint in the read arXiv v1. The AMS publication returned HTTP 403, so the finding does not allege that the published version has it. ArXiv history, attempted author/publisher pages and indexed correction searches found no available repair.
- **E3, CT03 Remark 11.7.2, p. 210:** the published notice repairs an earlier omission of splitness in the simplicial compactification proof. It also points to descent without splitness by another proof. The already-supplied frame-hypercover Theorem 9.1.1 target here is unchanged. The older version was not independently collated.

There are no source excerpts in the reviewed deliverables. Formulas, correction evidence and proof sketches are stated in original prose.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.4.json`: zero errors and zero warnings.
- Source finding schema and version records checked with `source_issues.check_issues` and `check_errata.versions_checked`: no errors. The standalone errata-job CLI is not a blueprint-packet validator.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.4.lean`: passed; all three light definitions have real bodies.
- `lean-check` at the shared exact pins: compiled successfully with ten `sorry` warnings and no other diagnostics. Its six endpoint theorems and four examples are statement sketches; heavy geometry remains in the reader. No lake build, dependency update or Lean server was started.
- Swarm `intake.py check-files` for the five authorized deliverables and `git diff --check`: passed.
- Reader/packet statements, hypotheses, steps, direct prerequisites, API items and checks were checked for consistency; the local node dependency graph is acyclic.

## Orchestrator actions

No mathematical clarification is needed to accept this planning pass. Assembly and closure still require these concrete actions:

1. Reconcile the no-F MW, support/localization and finite-extension refinements with the parent node contracts, and the general affine Taylor-convergent interface with RD.3. Preserve Frobenius as additional structure and its separate automatic-convergence theorem.
2. Route the nine supplier requests, retaining the CR.5 algebraic / RD.4 analytic boundary. Point the existing CR.6 analytic clients at these interfaces without making a reverse foundational dependency; its Fréchet/Stein/completed-tensor requests remain outside this pass.
3. Complete G1 (including no-F local Gysin and support-preserving comparisons), G2 (including the supported completion/coefficient/HLTT adapter) and G3 (Coleman/Igusa geometric realization). Keep the stage `planned` until they and the supplier interfaces are resolved.
4. Apply the separate RD.4/RD.5/RD.6 → AG2.4 links from finding 32, and make RD.5 import RD.4's ordinary/closed-support amplitude target. Do not infer finiteness or weights from comparison alone.
5. During authorized assembly use the proposed six-planet inventory, replacing the restricted Gysin flag and dropping extra flags while retaining their targets. Collate GK05 E2 against the version of record when accessible.
