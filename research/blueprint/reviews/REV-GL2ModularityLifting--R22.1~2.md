# Independent review: GL₂ modularity lifting, part R22.1 (revision 2)

Job `REV-GL2ModularityLifting--R22.1~2`, issue #10112. Reviewer: Claude, session `claude-gcGM8R`, 17 October 2026. The revision under review is `BP-GL2ModularityLifting--R22.1~2` by Codex session `codex-qkZIrl` (issue #10105, PR #10148). This session wrote, reviewed or fixed no earlier version of the packet, reader or suggested file.

**Verdict: accepted with corrections**, as a complete target-level plan with all eleven stages `planned`, none `closed`. The corrections below are made in the packet, the reader and the suggested file. Acceptance does not certify the open supplier requests, the gaps or any implementation; every node stays `unchecked`.

The maintainer directed this round to resolve the earlier findings and to consume LocalGaloisDeformationRings, GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra (with its Part II) and OrdinaryAutomorphicFormsAndModularityLifting. The revision did consume the first two well. It also met the old shape findings: under the current WORKERS.md shape, the 53 untyped API signatures of the earlier rounds are README targets, not Lean declarations. But it planned again about twenty results that accepted lower-tier roadmaps own, among them KW II §8, which the revision claimed as this roadmap's own. It also left placeholder text on every new node. These are corrected here rather than sent back, because every owner node exists, is accepted, and states what the GL2 consumers need.

## Inventory

| | Revision | After review |
| --- | ---: | ---: |
| Nodes | 104 | 94 (10 retired, 2 reduced to comparisons) |
| Definitions / constructions | 14 / 14 | 12 / 14 |
| API items / unit tests | 93 / 86 | 80 / 79 |
| Planets | 26 | 24 |
| Requests (open + provided) | 25 + 3 | 22 + 3 |
| Gaps | 11 | 11 |
| Baseline declarations | 11 | 8 |
| Suggested file | 136 lines | 81 lines |

## 1. Duplicates of lower-tier owners (retired)

A Sonnet sweep compared all 104 nodes with the 20,409 nodes of tier ≤ 20 packets, by statement similarity, source locator and keyword. I read every pair it labelled the same result. These ten nodes restate accepted lower-tier nodes and no other packet cites them. Each is retired and its GL2 consumers now cite the owner. The packet records them under `retiredDraftNodes`.

| Retired GL2 node | Owner (tier) | Why |
| --- | --- | --- |
| `R22.1/allowable-base-change` (KW II Def. 7.9) | SerreWeightAndLevelOptimisation R20.6/kw-optimisation-data (19) | Allowable changes, with composition `kwOptimisationData_allowable_comp`. The tower reading of "solvable" moves into the hypotheses of the two GL2 nodes that use the notion. |
| `R22.1/lemma-8-1-residual-field-choice` | R20.6/kw-optimisation-data (19) | KW II Lemma 8.1, verbatim in content. |
| `R22.1/determinant-character-kinds` | R20.6/kw-optimisation-data (19) | The unit restrictions (i)–(iii) of KW II §8.1. |
| `R22.1/lemma-7-10-determinant-adjustment` | ArithmeticGaloisDuality R02.6/finite-order-determinant-twists (8) | KW II Lemma 7.10; SerreWeightAndLevelOptimisation already uses it. |
| `R22.1/cht-character-extension` (CHT Lemma 4.1.1) | ArithmeticGaloisDuality R02.4/grunwald-wang (8) | Grunwald–Wang gives a global character of order n or 2n with the prescribed local components. For p-power local orders the exceptional case forces p = 2, so the p-power refinement is automatic. |
| `R22.1/lemma-8-3-weight-two-to-p-plus-one` | R20.6/weight-two-to-p-plus-one (19) | KW II Lemma 8.3. |
| `R22.1/prescribed-level-raising-step` | R20.6/quaternionic-level-raising and quaternionic-base-change-tower (19) | The raising step and the quadratic tower of the proof of Theorem 8.4. |
| `R22.1/theorem-8-4-prescribed-modular-lifts` | R20.6/prescribed-local-type-lifts (19) | KW II Theorem 8.4, all A/B/C and dyadic branches. |
| `R22.2/hensel-selected-roots` | HilbertModularVarietiesAndShimuraCurves R18.3/tw-localised-control (14) | Its first clause is the Hensel lift A_v. |
| `R22.2/auxiliary-coinvariant-control` | R18.3/tw-localised-control (14) | KW II Corollary 7.5, coinvariants through ξ_v. |

The revision's handoff says KW II §8 "is owned by R22.1" and asks SerreWeightAndLevelOptimisation R20.6 for "independent" inputs only. That contradicts the order of tiers and the accepted SerreWeightAndLevelOptimisation packet. It also contradicts that roadmap's open TauCetiRoadmap pull request #1013 (head `cad2a3c`). The PR's README says the roadmap "owns the concrete totally real optimisation in Khare–Wintenberger II §8", and it lists GL2ModularityLifting as the downstream consumer of the KW minimal and prescribed-type witnesses (§§6.6–6.11). The R20.6 nodes cite nothing in GL2, so importing them creates no cycle. An in-memory `merge_blueprints` of the corrected packet raises no error and skips no link.

## 2. Comparisons kept for external consumers

- `R22.1/theorem-8-2-minimal-modular-lifts` is cited by PotentialModularityAndCompatibleSystems R23.3 and R24.1, and its R23.1 request names it. It is now a `comparison` with SerreWeightAndLevelOptimisation R20.6/kw-minimal-modular-lifts. Its statement repeats the owner's cases so that those consumers read the same theorem. Its planet is dropped, since the owner has the planet "KW minimal modular lifts".
- `R32.1/quadratic-cyclotomic-irreducibility` (Dieulefait–Pacetti Lemma 1.13) is cited by GL2ModularityLifting R32.6. It is now a comparison with ArithmeticGaloisRepresentations R01.4/bad-dihedral-representations-and-the-oddness-criterion (b). That node proves the equivalence for every number field, without oddness, by a Clifford argument. Source issue E9 (the faulty torus-normaliser step of the printed proof) is kept as a record about the source.
- `R32.1/p-star` stays. ArithmeticGaloisRepresentations writes p* only inline (upstream `GaloisRep.cyclotomicSquareSubfield_rat`), so a light `pStar` duplicates no declaration.
- The α/β predicates `R22.5/kw-residual-modularity(-beta)` stay as definitions, since PotentialModularityAndCompatibleSystems R23.4/R24.4 cite them. Their ownership note now says that a witness of the predicate is what fills the α/β field of R20.6/kw-optimisation-data.

## 3. Rewiring to the patching and Taylor–Wiles owners

The R22.3 nodes restated Kisin's patching datum without citing DeformationAndDerivedPatchingAlgebra R03.5, which plans Kisin Proposition (3.3.1) node by node. They are kept as the arithmetic instances, which KW II §9 needs, and now cite their owners:

- `arithmetic-patching-data` is restated as the instance of R03.5/kisin-patch-datum, plus the arithmetic augmentation, framing and Hecke maps. Its constants c_m and r_m = s·m·p^{m(h+j)} agree with Kisin's DVI pp. 62–63; the worked value r_m = 18 for s = 1, p = 3, m = 2, h + j = 1 is right.
- `patched-ring-and-module` now cites R03.5/kisin-ring-module-patching, `patched-support` R03.5/kisin-patching-criterion, `minimal-ring-finite` R03.4/finite-of-faithful-finite-module, `generic-fibre-r-equals-t` R03.5/kisin-characteristic-zero-patching and R03.6/torsion-in-kernel, `patching-data-finite-and-compatible` R03.5/finite-decorated-data and patching-extraction, and `finite-level-patching-realization` R03.5/kisin-patch-datum.
- `component-patching` now cites R03.5/kisin-characteristic-zero-patching.
- `dyadic-patched-module-faithful` now cites R03.6/faithful-group-transitive, which is the algebra of KW II Lemma 9.6(b).
- `modularity-from-full-support` now cites R03.6/nearly-faithful-iff-support-eq-univ.
- `delta-freeness-at-taylor-wiles-level` is rebased on HilbertModularVarietiesAndShimuraCurves R18.3/tw-localised-control. What remains here is the check that the R04.5 primes satisfy its hypotheses.

The dyadic nodes already consumed GlobalGaloisDeformations R04.4 (free-action quotients, truncated actions, the determinant torsor) and R04.6 (level-n dyadic data), as the maintainer asked. No change was needed there.

DeformationAndDerivedPatchingAlgebraPartII is Kawasaki's Cohen–Macaulay blowing-ups (from the Česnavičius route). As the revision's request note says, it supplies nothing this packet uses.

## 4. Placeholder text on the 31 new nodes

Every new node carried three placeholders: the hypothesis "Use the coefficient, representation and level hypotheses specified in the statement" (28 nodes), the acceptance line "Check all hypotheses, action maps and specializations in the statement before using the conclusion" (29 nodes), and a source `match` equal to the node title (31 entries). PROTOCOL §5 requires the match to say what the cited place states. Each placeholder is replaced by the actual hypotheses, concrete acceptance checks and a statement of the cited passage, written after reading the pages (§6). Of the older nodes, 69 matches had been cut to labels such as "The statement." when the excerpts were removed; these too are rewritten from the pages.

The revision had also regenerated every `uses` entry. All 91 entries for definitions and constructions read "Uses the specified data, structure maps and APIs to establish …". This replaced 27 specific entries and dropped the external consumers (ClassicalSerreModularity R33.1, PotentialModularityAndCompatibleSystems R23.4/R24.4) and the stage-level uses. All are rewritten to say what each consumer takes, and the dropped consumers are restored.

## 5. Statement and locator corrections

- `bcdt-type-r-equals-t` cited CDT under the BCDT source id, at "author pp. 21–30". In the author copy, Theorem 5.4.2 is on p. 22 and §§5.5–6.4 run over pp. 22–31; the CDT part is now a separate CDT-1999 entry.
- `patched-weight-filtration`: Kisin's filtration of M∞ ⊗ 𝔽 is on DVI pp. 40–41, not 41–44. Exactness of the coefficient functor is (2.1.2), p. 36, not (2.1.4).
- `patched-weight-nonvanishing-and-support` cited "(2.2.15)" in the published numbering while the packet's Kisin FM edition is the DVI. It is now "Proposition (2.2.14) of the DVI ((2.2.15) in print)".
- `patched-generic-rank`: "Let R be their set" now names the set (Gee–Kisin B.5): the places of S∖Σ_p at which ρ̄(Frob_v) has equal eigenvalues.
- `kisin-durham-crystalline-over-q`: Kisin's caution after Theorem (3.14) concerns the Skinner–Wiles level lowering, which is written only in weight two; the proof step now says so.
- `minimal-level-data` now cites GL2AutomorphicRepresentationsAndTransfer R17.3/global-jl for its Jacquet–Langlands step, replacing a stage request.

## 6. Mathematics of the new and rewritten nodes

Read in the sources at the recorded hashes (all twelve checked, plus five more for the match rewrite; all match the packet). Representative checks:

- **CHT Lemma 4.1.2** (pp. 116–117): statement and proof match `cht-soluble-prescribed-completions`. The Galois closure keeps the completions because a Galois E_v/F_v is determined inside F̄_v by its isomorphism class. The split conditions at the simple subextensions force linear disjointness.
- **Allowable changes with prescribed completions**: the quadratic clause is right. Weak approximation gives d with prescribed square classes and total positivity; an inert auxiliary place z, split in D, forces F(√d) ∩ D = F. The worked example ℚ(√11) at p = 5, u = 3 checks (11 is a square mod 5 and not mod 3).
- **KW II §9.1** (pp. 78–83): the framed Hecke algebra (j = 4|S| − 1; T^□ reduced and O-flat), Lemma 9.1 and its remark (surjectivity at level Q, γ_{α_v}(π_v) ↦ U_v, bijectivity by Carayol), and the branch ideal of §7.4 (pp. 63–65) all match.
- **KW II Prop. 9.3** (pp. 84–87): the dyadic datum (D_m, L_m, D′_m), r′_m = b r_m with m^{r′} ⊂ m^{(r)}, the shift n + a with 2^a > N and a ≥ 2, the determinant map and action chunks, and the small-kernel comparison D″_m ↠ D_m all match.
- **BCDT** Theorems 1.4.1–1.4.2 (pp. 12–13) with all hypotheses, the proof changes (pp. 12–15), and §10 (pp. 77–78) match. E12–E18 are each confirmed item by item against §10.
- **Kisin Durham** Proposition (3.13) and Theorem (3.14) (pp. 19–21) match. The F = ℚ specialization is exactly what Kisin calls fully proven. For nonordinary weight p + 1 the reduction is Ind ω₂^p ≅ Ind ω₂ ((3.9)(1)), which is irreducible of Serre weight 2. So the residual-weight-two branch of `nonordinary-weight-p-plus-one` is the only nonordinary one, which agrees with KW II §10.2 (p. 92, citing Berger–Li–Zhu).
- **Gee–Kisin Appendix B.5** (pp. 39–41): the rank 2^{|R|}, Lemma B.5.1 with its equivalences (1)–(4), and Lemma B.5.2 with the exclusion ρ̄|G_{F_v} ≁ (ωχ ∗; 0 χ) all match the four R32.2 nodes.
- **Gee §5.6** (pp. 33–35, 40–41): the avoidance pair (X − 1)² and (X − ζ)(X − ζ⁻¹) with #k(v) ≡ 1 mod p and ρ̄|G_{F_v} trivial, R^loc/λ = R^{loc,′}/λ, and the primed system patched compatibly modulo λ, all match.
- **KW I Theorem 4.1** (p. 7) and **KW II §10.2** (p. 92): the case division of `kw-i-theorem-4-1-odd-prime` matches.

The suggested-file statements were rechecked by hand. |p*| = p, and the oddness bridge holds because det c = ±1 in a domain and φ(1) = −1 would force 2 = 0 in k. The examples are all correct.

## 7. Requests, gaps, coverage and restructuring

- Three requests are dropped because their only consumers were retired or now cite a node: R19.4 (level raising), R01.3 (§8 conductors), and R17.3, now the node R17.3/global-jl. The request to HilbertModularVarietiesAndShimuraCurves R18.2 is retargeted to R18.3, since R18.2's nodes are integral models.
- The R19.6 request gets a review note. Three of its four items already exist: R18.3/iwahori-selected-root, R18.3/tw-localised-control, and R19.4/quaternionic-sigma-place-local-form with R19.5/hilbert-local-behaviour-at-p. Only the tame-inertia identity at a Taylor–Wiles place is still open.
- The R20.6 request no longer forbids importing the KW §8 theorems.
- Three gap texts are rewritten so they no longer claim that KW II §8 belongs here.
- The R22.3 and R22.4 coverage entries said "independent review of this revision is pending", which is process language. They now record real remaining work. So does R22.5. These are the higher-tier requests addressed to this packet that it does not yet answer: Böckle's integral R_Q ≅ T_Q ⇒ R_∅ ≅ T_∅ (PotentialModularityAndCompatibleSystems R24.3, to R22.3), the minimal integral R = T over F (ClassicalSerreModularity R26.1, to R22.4), Snowden 4.4.2 (R23.1, to R22.5), and the odd-prime potentially Barsotti–Tate theorem over the field of BCGP Proposition 10.1.3 (ModularityAndLanglandsExtensions ML.1, to R22.5). The other requests addressed here (KW I Theorem 4.1 for odd p and p = 2, BCDT 1.4.1–1.4.2, α/β over ℚ) are met by existing nodes.
- The CHT move-down entry now moves only Lemma 4.1.2 here. PotentialModularityAndCompatibleSystems R23.1/cht-character-extension should import ArithmeticGaloisDuality R02.4/grunwald-wang. A new `rescope` entry records the owners above.

## 8. Reader and suggested file

The reader's node sections are a mechanical rendering of the packet. A renderer reproduced all 104 HEAD sections, the gap list and the request list byte for byte from the HEAD packet. The corrected packet was then rendered into the same frame, and the ten retired sections removed. The front matter, ownership paragraphs, layer map and Lean section were rewritten to match.

The reader had no Markdown escapes. A port of the emphasis rule of `src/markdown.js` counts 432 spurious emphasis spans in the revision's reader (567 in the corrected text before escaping): `_` after a non-ASCII-word character, and every `*`. The reader is now escaped outside code spans, link targets and anchors. That leaves no spurious spans and keeps all 924 bold labels, and removing the escapes gives back the unescaped text exactly.

The suggested file loses the determinant-exponent definitions and the Lemma 7.10 square-root statement, which served the retired §8.1 and Lemma 7.10 targets. It keeps `pStar`, `odd_determinant_of_odd_reduction` and their examples. `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474 exits 0, with two proof-placeholder warnings. An appended `run_cmd` audit, run on both the revision's file and the corrected one (12 constants), found no `sorry` in any statement.

## 9. Notes for other owners (not edited here)

- **ArithmeticGaloisDuality R02.6** (TauCetiRoadmap PR #858): §R02.6.2 states KW II Lemma 7.10 for one finite place v. KW II p. 69 states it for a finite set of finite places, and SerreWeightAndLevelOptimisation §6.6 quotes it that way. Recorded in the packet's `upstreamNotes`.
- **PotentialModularityAndCompatibleSystems R23.1**: import ArithmeticGaloisDuality R02.4/grunwald-wang for CHT Lemma 4.1.1 and GL2 R22.1/cht-soluble-prescribed-completions for Lemma 4.1.2. Its request for KW II Theorem 8.2 is answered by SerreWeightAndLevelOptimisation R20.6/kw-minimal-modular-lifts.
- **HeegnerPointEulerSystems HE.0**: its request note should name R20.6/quaternionic-level-raising rather than the retired GL2 R22.1/prescribed-level-raising-step.
- **HilbertModularVarietiesAndShimuraCurves R18.6** has no nodes in any packet, yet seven GL2 nodes cite the stage through request 1. Its content is expected from R18.3.
- R32.1/R32.2 still cite PadicLocalLanglandsForGL2Qp R30.6 and CompletedCohomologyAndLocalGlobalCompatibility R31.5/R31.6, two roadmaps outside the 94 (as `upstream/CaraianiNewton.md` lists). They form no cycle. Restating them here would duplicate those roadmaps, so their placement is the maintainer's decision.

## Checks run

- `python3 scripts/check_blueprint.py` on the packet, with the pinned declaration index: 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0, two proof-placeholder warnings.
- In-memory `merge_blueprints` against `data/atlas.json`: no error, no skipped link.
- Source hashes for all 17 files read: all match the packet.
- The eight remaining baseline declarations read at the pins: `Module.Free`, the `MonoidAlgebra` structure, `Group.IsSolvable`, `Group.isSolvable_of_ker_le_range`, `Group.isSolvable_of_isSolvable_injective`, `ZMod.neg_one_ne_one` (with `Fact (2 < n)`), `TauCeti.UpperTriangularGroup.instIsSolvable` and `TauCeti.GlobalNumberFields.weakApproximation_denseRange`. The unused `IsReduced`, `Polynomial.Splits` and `HenselianRing` entries are removed.
- `python3 research/blueprint/intake.py check-files` on the deliverables.

Subagents: one Sonnet duplicate sweep, one Sonnet request-versus-supplier match, and one Haiku retrieval of cited passages. Every verdict above is the reviewer's, made after reading the quoted source and owner statements.
