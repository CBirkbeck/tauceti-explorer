# Independent review: ArithmeticDynamics, DY.6 supplement

Accepted after correction on 14 October 2026. Reviewer: Codex, session `codex-HdowhT`; job [#9276](https://github.com/CBirkbeck/tauceti-explorer/issues/9276). The input was written in the separate `codex-Vlgvom` session for [#9318](https://github.com/CBirkbeck/tauceti-explorer/issues/9318).

This accepts a finished planning pass. The packet remains `complete`, and DY.6 remains `planned`, with eight explicit proof gaps and four supplier requests. It is not a certificate of proof closure or implementation. The packet's `review.checked` gives a verdict and mathematical reason for every supplemental node.

| Item | Result |
| --- | --- |
| Supplemental nodes | 21: 16 verified, 5 corrected, 0 added, 0 unverifiable |
| Pinned baseline references | All 15 names, modules, statements and needed hypotheses confirmed; none removed or replaced; 5 declaration-kind labels corrected |
| Public source files | All 12 opened at the consumer locators; all downloaded PDF SHA-256 values agree with the packet |
| Imported DY.6 nodes | All 93 retained; their ID set equals the base packet's entire DY.6 node set |
| Definitions/constructions | 2, with 14 API items and 9 discriminating tests in total |
| Remaining work | 8 named proof gaps, 4 supplier requests, 0 unresolved statement contradictions |
| Planets | No additions; the six accepted DY.6 planets remain inherited |
| Suggested Lean | 146 lines, 6 theorem statements and 8 examples; unchanged; elaborates with 14 `sorry` warnings only |

## Corrections

1. **General-curve specialization.** The previous acceptance check incorrectly inferred generic height zero from a constant family. For `f_t(z)=z²`, the constant section `P_t=2` has generic geometric height zero and a vanishing specialization ratio, whereas `P_t=t` has generic height one and ratio one. Both now appear in the packet and reader. The statement also spells out Call–Silverman's smooth projective total space, nonnegative degree-one base height, and fibral eigenrelation on the model. These are the setting of §3, pp.177–178, used by Theorem 4.1 and its proof, pp.183–186. The uniform height comparison and real-divisor curve-height limits remain explicit RP.0 requests.
2. **Benedetto finiteness argument.** Before invoking a bad place, handle the forward-invariant rational zero-height set of cardinality at most two. The larger-cardinality branch uses Proposition 6.1, pp.7–8. This repairs an omitted case in the sketch without changing the theorem or closing its local-disc supplier gap.
3. **Hybrid potential normalization.** Replace the instruction to specify a metric with the actual contract: the Fubini–Study reference on complex fibres, the standard model metric centrally, an explicit normalized homogeneous-iterate formula, and the scalar change under `F_t ↦ h(t)F_t`. Multiplying by `t^m` changes the central potential by `m log(r)/(d−1)` and leaves the measure unchanged. Favre Theorem 2.10 p.15 and Proposition 4.4 with the central identification, pp.29–31, support the extension and uniform estimate. The TB.0 analytic comparison proof remains open.
4. **Affine Lattès normal-form locator.** Cite Milnor Theorem 3.1, pp.3–4, and Lemma 3.5, pp.5–6, for the cyclic quotient. Theorem 5.1, pp.15–16, supplies the conjugacy invariants. Synchronize this distinction in the proof route, source read record, reader and repeated classification-gap descriptions.
5. **Attracting branch field hypothesis.** Restore Ingram's §1 convention, p.4: field characteristic zero or `p>d`. Small *residue* characteristic remains allowed and is accounted for by the threshold in Lemma 8, pp.7–8. The branch-value terminology and constants are retained.

The reader's SF.0 links now point to `SchemeAndStackFoundations--SF.0.json`, which actually contains the cited Cohen and spreading-out nodes. The original links pointed to the legacy packet. The source read records now include the additional Milnor, Ingram and Favre page locators checked here.

A separate packaging note distinguishes pinned and current elliptic height conventions. At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `Point.canonicalHeight` in `CanonicalHeight.lean` is half the limiting relative x-coordinate height. At current commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `CanonicalHeight/Basic.lean` uses the full limit. Over a number field, the absolute Néron–Tate convention of the inherited comparison therefore divides the pinned height by `[K:Q]`, or the current height by `2[K:Q]`. Both definitions were read; both are existing library work. The reader links to the exact revisions, and `upstreamNotes` records the conversion for the maintainer.

## Baseline verification

Every entry was read in the shared Mathlib checkout at `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reader already gives exact module links. No baseline reference was inferred from its name alone.

| Declaration | Check relevant to these nodes |
| --- | --- |
| `exists_finset_isTranscendenceBasis` | `FinTrdeg` gives a finite transcendence basis; essential finite type supplies that instance. |
| `IntermediateField.fg_top_iff` | Finite field generation is equivalent to essential finite type. |
| `Algebra.finite_of_essFiniteType_of_isAlgebraic` | Algebraic plus essentially finite type gives module finiteness. |
| `Field.exists_primitive_element` | Finite dimension and separability are required; characteristic zero supplies separability in the application. |
| `AlgebraicIndependent.aevalEquivField` | An algebraically independent family identifies the polynomial fraction field with its generated intermediate field. This is a definition returning an equivalence. |
| `PowerBasis.ofAdjoinSimpleEqTop` | Integrality and generation of the top intermediate field give a power basis. This is a definition. |
| `PowerBasis.exists_eq_aeval` | Polynomial representatives have degree strictly below the power-basis dimension. |
| `IsLocalization.integerNormalization_spec` | Normalization maps to a scalar multiple with scalar in the localization submonoid; the fraction-field application makes it nonzero. |
| `IsLocalization.exist_integer_multiples` | A finite family has a common denominator in the chosen submonoid. |
| `IsFractionRing.lift` | Requires injectivity of the map to the target field. This is a definition returning a ring homomorphism. |
| `IsFractionRing.lift_unique` | Agreement on the original ring determines the fraction-field map. |
| `IntermediateField.adjoinRootEquivAdjoin` | Uses the minimal polynomial of an integral element, rather than an arbitrary annihilating polynomial. This is a definition returning an algebra equivalence. |
| `IntermediateField.algHomAdjoinIntegralEquiv` | Algebra homomorphisms correspond to roots of the minimal polynomial in the target field. This is a definition. |
| `IntermediateField.algHomAdjoinIntegralEquiv_symm_apply_gen` | The root-selected homomorphism has the required value on the generator. |
| `PowerBasis.algHom_ext` | Agreement on the generator suffices for uniqueness. |

The five definitions above had been labelled `theorem` in baseline metadata. Their labels now match the Lean declarations. Their names, mathematical roles and modules were already correct; no substitute citations or new prerequisite nodes were needed.

## Source and closure audit

All source prose in the deliverables remains in the workers' own words; no source excerpts were added. `sourceIssues` is empty, so there was no alleged published mistake to adjudicate. The five node corrections concern this plan's statements, checks or locators, rather than alleged source errata.

The checks below describe the consumer contracts tested, not complete audits of every upstream proof. Exact public URLs, versions, hashes and page locators are in the packet's source records and the reader bibliography.

| Nodes (suffix after `followup-`) | Independent check |
| --- | --- |
| `integral-primitive-presentation`, `primitive-root-transport`, `lech-integral-assembly` | Read Cassels Theorem I and proof, especially (2) p.195 and (10) p.197; the addendum pp.479–480; Bell Lemma 3.1 pp.5–6. Denominators depend on parameters alone; zero/empty markings and transcendence degree zero are allowed. Injectivity permits a fraction-field lift. The inherited Hensel node explicitly supplies an integral root, independent integral parameters, unit leading coefficient and unit denominators for arbitrarily large primes. |
| `unramified-cohen-adapter` | Read BGT Proposition 2.1 pp.4–5 and the model construction §4 pp.12–15. The SF.0 supplier gives absolute coefficient structure. The coefficient-preserving unramified regular case and completion properties are requested separately. The given continuous `Z_p` map is determined by its restriction to dense `Z`. |
| `global-curve-specialization` | Read Call–Silverman §1 setting p.166, §3 pp.177–182 and §4 pp.183–186, and GTZ Lemma 6.5 p.17. The uniform-in-point relative height bound is what allows iteration to remove the error; no Northcott assertion over a general height field is needed. |
| `benedetto-zero-height`, `filled-julia-disc-cover` | Read Benedetto Theorems A–B p.2, Lemmas 5.1–5.3 pp.6–7 and Proposition 6.1/proof of Theorem A pp.7–8. Open discs at a bad place provide the strict product-formula inequality; potentially good places use closed discs. The proofs deferred to the earlier paper remain a gap. |
| `legendre-marked-degree-growth`, `legendre-marked-escape-convergence`, `legendre-torsion-infinitude` | Read DWY Proposition 1.4/Theorem 1.5 p.3, Proposition 3.1 pp.9–10, the §4 estimates/conclusion pp.12–19, and §6.5 pp.28–29. The four rational exceptional sections are `0,1,t,∞`, and logarithmic homogeneity has coefficient one. Activity-to-distinct-parameters and the cusp/curvature supplier proofs remain open. |
| `hybrid-uniform-potential`, `hybrid-equilibrium-limit` | Read Favre Theorem B pp.2–3, Theorems 2.10/2.12 pp.15–16, Definition 4.1/Theorem 4.2 pp.25–26 and §4.3 pp.29–31. A uniform potential estimate precedes the weak measure limit. The requested carrier, model-function, density and measure-continuity interfaces are not silently supplied by the topological hybrid space alone. |
| `finite-multiplier-spectrum` | Read McMullen Lemma 2.1, Theorem 2.2 and Corollary 2.3 in rendered printed pp.472–473, and Ingram Lemma 14 pp.14–15. Full spectra give finite non-affine fibres; Noetherian finite truncation and a common-iterate adapter remain explicit. McMullen's rigidity proofs in §§4–6 were not re-audited. |
| `affine-lattes-map`, `rigid-lattes-finiteness` | Read Milnor Definition 2.1 pp.2–3, Theorem 3.1 pp.3–4, Lemma 3.5 pp.5–6 and §5 pp.15–18. The definition covers translations and rigid examples, and excludes rank-one cylinder quotients. The fixed-degree lattice count is elementary conditional on the classification. |
| `minimum-conjugate-height`, `quasifinite-height-comparison` | Read Ingram Lemmas 13–15 and the proof of Theorem 1 pp.14–16. The RP.0 dense-open height inequality needs induction on the complement for the quasi-finite locus. The proof access for Lemma 13 remains a named gap; no uncleared book was used. |
| `quantitative-attracting-branch` | Read Ingram's field convention p.4 and Lemma 8 pp.7–8. The output is a branch value, with strict nonzero multiplier and the stated small-residue-prime threshold. Koebe and the nonarchimedean directional-multiplicity theorem remain supplier proof leaves. |
| `bilu-tichy-equal-degree`, `ritt-common-iterate`, `linear-synchronized-intersection` | Read GTZ Theorem 2.1/Corollary 2.2 pp.5–6, §5 pp.12–13 and §6 pp.17–18. The four equal-degree pairs, root-of-unity compatibility and synchronized affine cases match. The imported DT.2 unit-equation theorem works over any characteristic-zero field. The Bilu–Tichy/Ritt proofs and Dickson interface remain explicit gaps. |

Direct supplier statements were read in the ArithmeticDynamics, DiophantineApproximationAndTranscendence, HeightsRationalPointsAndObstructions and SchemeAndStackFoundations packets. In particular, Siegel's integral-point theorem does not supply Bilu–Tichy classification; an absolute Cohen theorem does not supply a specified coefficient map; and a dense-open height inequality does not by itself cover an entire quasi-finite locus. The packet already separates these requirements, and the corrections preserve that separation.

The reviewed `data/library-coverage.json` entries for ArithmeticDynamics were checked. Current read-only TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were screened, including the nine post-snapshot areas' suggested files (OperatorTheory's files are in its subdirectories). The relevant EllipticCurves height section, LocalFieldsRamification scope and PolynomialGaloisGroups contracts were read. Existing height and local-field work remains imported; no new family/embedding/classification target was found already implemented or planned there.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamics--DY.6.json`: **0 errors, 0 warnings**. The checker resolves all prerequisite references and reports 21 nodes, 14 API items, 9 tests, 15 baseline declarations, 8 gaps and 4 requests.
- `lean-check research/blueprint/suggested/ArithmeticDynamics--DY.6.lean`: **exit 0**, only 14 declaration-uses-`sorry` warnings. Available memory was 110 GiB before the check. No Lean server, Lake build/update or cache download was used.
- The Lean file contains theorem statements and examples only, with no data definitions or theory development. Heavy family, height, analytic and moduli carriers remain reader targets.
- The 93-entry import manifest was compared as a set with the base DY.6 nodes; it is exact. Every supplemental node has one review verdict. All definition/construction nodes retain at least three discriminating tests.

The orchestrator can accept this supplement and assemble it with the base packet. Retain the eight gaps and four requests, retain the six inherited planets, and apply the pinned/current height conversion when choosing the packaging baseline. Proof access for the bounded representative-height theorem and Tate's stronger bounded-variation theorem still needs resolution. These are recorded future proof tasks, not unfinished review tasks. No second job was claimed.
