# Potential Modularity And Compatible Systems: adversarial fix handoff

**Blocked checkpoint; not ready upstream.** Issue #10211, job `FIX-PKG-PotentialModularityAndCompatibleSystems~adv`, agent Codex, session `codex-5WxcBu`, 2026-10-17. The verdict remains `needs_changes`. The mandatory lower-owner independence and ordinary-supplier work is outside this issue's four deliverable paths. This run fixes the package changes that can be certified here and records the residue rather than accepting an incomplete dependency chain.

## Submission and starting state

Submit one **draft checkpoint** for maintainer handling, with `Refs #10211`. Keep it a draft: the package completion branch of `research/blueprint/issues.py:deliverables_complete` tests file existence, so ordinary automatic intake can mistake this incomplete package for a completed repair. Merging these files does not establish mathematical completion. No queue, tier, packet or other roadmap file was edited.

The issue's named `REV-PKG-PotentialModularityAndCompatibleSystems~adv.md` does not exist in this checkout. Read both existing reports, especially [the latest independent review](../reviews/REV-PKG-PotentialModularityAndCompatibleSystems~2.md), and [the revision-3 checkpoint](PKG-PotentialModularityAndCompatibleSystems~3.md). The current package already contains that checkpoint's substantial expansions. The old `review.json` described the earlier review state; this run updates it without attributing the inherited repairs to this session.

Read WORKERS, both protocols, PACKAGE_REVIEW, UPSTREAM_GUIDE, the package and its inherited source/gap ledgers, the relevant reviewed library-audit entries and current upstream sources. JacobianChallenge and AlgebraicVectorBundles were read as current prose models. The current roadmap and Tau Ceti checkouts were read only, without running Lake. Elaboration uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; the additional current-coverage checkouts are TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Changes in this run

1. **Actual upstream ownership, §§1.1–1.9.** Inspected the files at the heads of open upstream [PR #1006](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1006), commit `4a3681082bdda51d99b5276928db227758b34d31`, and [PR #1007](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1007), commit `06cbbcfc56ba257910bbf16066e5e676e8204344`. AG2.P, “Arbitrary-rank compatible data and operations,” owns `AutomorphicSystemData`, `Weak`, all-place `Strict`, generic operations, character families and supplied purity/polarization predicates. AG2.6 owns `VeryWeak`, `ExtremelyWeak` and weakening. AGR §7.1 now imports AG2.P and adds its rank-two DP predicate and chosen `HilbertSystemRealizations`. Replaced the stale `CompatibleSystemData` ownership and removed proposed second weakened-family, purity and character constructors in favor of imports and explicitly named comparisons. Renamed this roadmap's BLGGT away-coefficient predicate `IsAwayStrictlyCompatible`, distinguishing it from the supplied all-place predicate. Updated the Lean closing inventory accordingly. This resolves the specific inherited AG2-to-this-roadmap generic-carrier cycle against these open heads, without claiming the upstream PRs are merged.
2. **Realization fields, §§1.1–1.2.** Preserved finite realization extensions L_λ/M_λ in the imported raw carrier. Common rational good polynomials do not imply an M_λ-model. DP's literal local-model comparison takes the additional chosen models. KW I §5, pp.7–8, uses algebraic-closure WD parameters, not a forced E-model. Added a quaternion-group negative control: rational character values do not descend its two-dimensional representation to ℚ₂. The displayed complex matrices satisfy the quaternion relations by proved Lean computation. The no-ℚ₂-model argument uses anisotropy of the Hamilton norm, detected by primitive integral coordinates modulo 8; it is a prose argument, not a formalized local-algebra theorem.
3. **Hodge–Tate cocharacter, §1.17.** Read Serre, *Groupes algébriques associés aux modules de Hodge–Tate*, §1.3–§1.4, printed pp.157–160. Replaced the unsupported invocation of an unread Sen operator result for the needed inclusion by the tensor-category proof: the Hodge grading gives tensor automorphisms after scalar extension, hence a cocharacter into local algebraic monodromy; connectedness puts its image in the identity component of global monodromy. Retained coefficient actions. The stronger Sen generation assertion is distinguished and is not needed for this inclusion. Added rank-zero, repeated-weight and `diag(1,t)` normalization controls, with a proved matrix product/trace/determinant Lean example. This supplies an inspected alternate proof for the inclusion, not every later maximality or Lie-algebra theorem.
4. **Dyadic Steinberg error, §§10.5, 10.7.** Corrected `RequiredLiftParameters.requiresSteinberg`: minimal crystalline is false; cases 2–4 use `k=4` at `p=2` and `k=p+1` otherwise. The old unconditional `p+1` test incorrectly accepted dyadic weight 3 and rejected weight 4. Read KW I Theorem 5.1(2)–(4), pp.9–10, and aligned both prose statements. Added proved tests for dyadic weights 2/3/4, odd weights 2/4, minimal crystalline at the odd exceptional weight, and both valid dyadic auxiliary types. The parameter carrier remains numerical; it does not pretend to contain a residual representation or deformation point.
5. **Polarization witnesses, §1.8 and Suggested.lean.** Added proved scalar tests for the tensor correction `(-1)(-1)(-1)=-1`, cancellation of the two quadratic factors in the normalized unit, and inversion of the odd multiplier under duality. These mirror existing README Checks and retain the distinction between a pairing and an unsigned self-duality isomorphism.

No target, Check, hypothesis or inherited locator was dropped to shorten the document. Heavy carriers remain README targets; new Lean tests use existing matrices and scalars, with no auxiliary theory or sorry-bodied data.

## Finding-by-finding disposition

“Inherited expansion” means the revision-3 work already present on main. It is not a claim that this run independently certified every ingredient of that expansion. Source and owner comparisons still outstanding are listed explicitly below.

| Finding from the latest review | State after this fix |
| --- | --- |
| Compactified Picard for regular nonsmooth curves, §2.7 | Inherited compactified rank-one torsion-free-sheaf route retained. Ordinary Jacobians and current line-bundle infrastructure are imported. Exact Quot/duality/representability and topology comparisons remain supplier obligations. |
| Strong S-unit congruence and determinant square root, §§3.1, 4.7 | Inherited Taylor Artin II Lemma 2.1 proof and Brauer-obstruction/quadratic correction retained. Read Artin II Lemma 2.1 in this run. The separate fixed-prime ordinary seed is still open. |
| Exact level adjustment and ordinary refinement, §§4.4–4.6 | Inherited exact Skinner–Wiles label, full-decomposition distinguishedness and permitted extra level retained. Ordinary supplier placement below tier 20 is unresolved. |
| Prime-three weight/level argument, §4.12 | Inherited Khare arXiv §2.1 and DDT Lemma 4.11 alternate retained. Does not certify every Gross/Coleman–Voloch or KW type/weight input. |
| Arbitrary-totally-real Snowden, §4.15 | Inherited Theorems 4.4.2, 6.1.1, 7.6.1, 7.8.1 contracts retained with (A1)/(A2), local types, uniform extension and positive-rank point extraction. Read the relevant source sections again; the lower independence audit is still separate. |
| Geraghty and ordinary patching, §§8.3–8.7 | Inherited 2010 arithmetic characteristic-zero specialization, nilpotent-kernel and near-faithfulness scope retained. No universal integral R=T added. The lower ordinary source contracts still need an authorized owner change. |
| Full CG finiteness, §8.8 | Inherited exceptional p=3/p=5 Snowden branches, R† eigenvalue cover, local hypersurface flatness and nilpotents retained. Read CG Theorem 4.8/proof and relevant Snowden statements; exact supplier presentation comparisons remain to certify. |
| Brauer overlap Hom characters, §12.1 | Inherited overlap restrictions/twists of the common irreducible member and 0/1 Hom criterion retained. This arithmetic input is still distinct from the elementary norm-one statement and requires its descent suppliers. |
| Full regular de Rham endpoint, §12.5 | Full DP output and separate KW milestone retained; DP v2 Definition 1.10/Theorem 1.11 checked. The modern lifting globalization-independence audit remains open in its lower owner. |
| Original monodromy inputs, §§1.17–1.20 | Cocharacter inclusion now has the inspected Serre tensor proof and computed convention witness. Original Larsen maximality and Bogomolov inputs remain uninspected; prior Larsen–Pink/Bruhat–Tits work is not recredited to this session. |
| Current upstream carriers and operations, §§1.1–1.9 | Fixed against actual open PR heads. Shared raw carrier and weaker predicates imported; no second model, purity or character construction. |
| Suggested-file shape and tests | Light real-bodied definitions retained; no unavailable arithmetic carriers invented. Added proved coefficient-field, cocharacter, polarization and dyadic controls. Final elaboration succeeds with only sorry warnings. |

### All 29 inherited packet-gap identifiers

These identifiers retain the earlier review's correspondence; the packets themselves are unchanged.

| Gap | Current disposition / remaining condition |
| --- | --- |
| R23.1 1 | Regular nonsmooth compactification explicitly planned; exact SF/AMAG exports and geometric source leaves still require comparison. |
| R23.1 2 | Inherited Khare/DDT alternate supplies the prime-three plan; remaining local-weight inputs are distinct. |
| R23.1 3 | KW II 8.2 and Gross/Coleman–Voloch remain exact lower GL₂/weight contracts. |
| R23.1 4 | Inherited integral finite-inertia identities precede reduction; no invalid inference of mod-p injectivity from characteristic-zero injectivity. Exact local export comparison remains. |
| R23.1 5 | Inherited odd/dyadic KW patching hypotheses retained, including dimensions and nilpotents; exact lower ring comparison remains. |
| R23.1 6 | Inherited split-CM crystalline/level-adjustment branch retained; lower supplier placement is unresolved. |
| R23.1 7 | Inherited determinant Brauer-obstruction tower retained; the soluble fixed-prime seed still needs proof. |
| R23.1 8 | Actual Skinner–Wiles source was inspected in revision 3; its labels and extra-place restriction remain. No stronger generic ordinary assertion is inferred. |
| R23.1 9 | Good spread, smooth Hensel, uniform point count and constant-component congruences retained. The even-degree quadratic-constant control remains. |
| R23.1 10 | Boundary/projective-module and S-unit quotient steps retained; regular-curve compactification supplier comparison remains. |
| R23.1 11 | Inherited all-ℚ-conjugate completion restriction and Jordan argument retained; compare IG.2.6 and degree-one scheme Chebotarev exactly. |
| R23.1 12 | BHKT/Calegari alternate endpoints retained; Moret–Bailly 1990 original remains unread. |
| R23.1 13 | Snowden arbitrary-totally-real hypotheses retained; narrower rational lifting is not substituted. |
| R23.1 14 | Polarized multiplier/sign controls strengthened by proved examples; inherited ordinary/CG expansions retained, lower ownership still unresolved. |
| R23.1 15 | Non-torsion/dimension and continuous characteristic-zero point conditions retained; O/(π) remains excluded. |
| R23.1 16 | Taylor Artin II Lemma 2.1 is the inherited stronger congruence source; read it again, not replaced by avatar existence. |
| R23.1 17 | Snowden 7.6.1 independent prescribed lifts retained; do not use later rational point extraction as their proof. |
| R23.1 18 | Torsion Fontaine–Laffaille and crystallinity are exact planned lower contracts, not installed library results. |
| R23.1 19 | Weil-restriction local products and geometric connectedness retain their actual moduli/scheme prerequisites. |
| R23.1 20 | Moret–Bailly II analytic density and completion conditions retained; topology alone is insufficient. |
| R23.1 21 | Existing rigidified line-bundle classes imported; relative boundary/group-sheaf and divisor comparisons remain additional. |
| R23.1 22 | Auxiliary p>3, simultaneous prime selection and disjointness retained; ordinary fixed-prime branch remains conditional. |
| R24.3 1 | Savitt's corrected boundary and additional lattice retained; exact Serre-weight translation remains lower-owner work. |
| R24.3 2 | Full DP endpoint retained separately from Dieulefait's small-weight endpoint; modern independence is still open. |
| R24.3 3 | Individual monodromy imported; common component/descent stays here. New inspected cocharacter inclusion proof resolves that specific source leaf. |
| R24.3 4 | Hecke-avatar route and prior Bruhat–Tits comparison retained; original Larsen/Bogomolov and exact uniform torus/maximality exports remain. |
| R24.3 5 | README-only heavy targets remain named; Suggested.lean contains only existing/light carriers and signatures. |
| R24.3 6 | Inherited arithmetic overlap Hom criterion retained; scalar norm-one typing does not certify its descent input. |
| R24.3 7 | All-member de Rham DP output retained; unrestricted weight is not replaced by the KW-type milestone. |

## Adversarial pass for the changed statements

Every new Lean example below is proved. The inherited arithmetic theorems remain signatures proved by `sorry`; elaboration is not a mathematical certificate. Inapplicable test parameters are recorded as such rather than being silently imposed on unrelated objects. Rank-zero and finite-rank tests concern family carriers, characteristic two and residue-𝔽₂ tests concern signs and dyadic parameters; unit ideals, fields versus DVRs, and noncompact topological groups do not enter the definitions changed in this run. The unchanged general-DVR complete-intersection interface was also spot-checked without specializing it to ℤ_p.

| Statement / API | Instances and plausible wrong version tried | Result / change |
| --- | --- | --- |
| Imported raw `AutomorphicSystemData`; `weakCompatibility_ofKW` | Rank 0, rank 1, weight-one Artin rank 2, Δ and its dual; rational character with quaternionic local obstruction | Retained arbitrary rank and finite realization fields. Added explicit quaternion relations and no-ℚ₂-model control; no rational-trace descent assertion. |
| `CompatibleSystem` and strict/DP comparisons | Residually reducible ramified coefficient prime; odd unramified coefficient prime; p=2; algebraic WD class without chosen E-model | KW exceptional branch kept; all-place and DP predicates imported separately. Chosen local models required for the literal DP comparison. |
| `VeryWeak` / `ExtremelyWeak` imports | Rank 1 determinant equals member; rank 2 metadata {−1,1} versus {0,0}; exceptional λ above a density-one rational prime | No second carriers. Very weak condition explicitly quantifies every λ and embedding; determinant sums do not force higher-rank Hodge metadata. |
| `extremelyWeak_rankOne_isWeak` | Trivial, finite-order and cyclotomic characters; arbitrary nonintegral infinity character | Uses finitely ramified Hodge–Tate character classification and common good polynomials, not a bare determinant sum for rank >1. |
| `weakening_preserves_hodgeMetadata`, `extremelyWeak_hodgeSum` | Weak→very weak→extremely weak; rank 0 empty sums; conflicting rank-two multisets with sum zero | Metadata is preserved, not reconstructed from its sum. Supplier projections/weakening imported. |
| Induction versus generic family operations | Degree-one extension; rank-one character; rank-zero member; induced residue-degree-two Frobenius block | Only induction is additional here. Generic twist/restriction/conjugation are imported with finite-field and ramification data. |
| `polarizedSystem_signComparison` | CM odd μ(c)=−1; change μ(c) without changing pairing; forget pairing to unsigned self-duality | Supplied witness retained; named sign comparison rather than another family carrier. |
| Purity and essential self-duality comparisons | Rank 0; repeated weights; Hodge sum zero but no conjugate symmetry; incorrect multiplier | Supplied purity/polarization predicates imported; comparison targets specify additional sign and Hodge symmetry. |
| `IsAwayStrictlyCompatible` | Coefficient prime with missing local comparison | Distinct name prevents treating BLGGT away-place strictness as AG2.P all-place strictness. |
| Sum, tensor, dual; symmetric/exterior powers | Dual of X−2 is X−1/2; rank-zero polynomial 1; noninvertible polynomial X; tensor Hodge collisions | Generic operations imported, additional powers and exact invertibility/weight conditions retained. No arbitrary tensor regularity assertion. |
| Polarized tensor/unit/dual operations | Two odd multipliers have raw product +1; add quadratic −1; unit m(−1)(−1)=m; inverse of −1 | Three proved scalar Lean controls mirror README Checks; correct odd sign retained. At characteristic 2 the numerical ±1 distinction collapses, so these are characteristic-zero witness computations. |
| Imported character family normalization | Trivial H={0}, Q=X−1; cyclotomic H={−1}, Q=X−p⁻¹; finite order; nonalgebraic character | Imported constructor, named Hodge/Frobenius/uniqueness comparisons; no second character-family assembly. |
| `hodgeTateCocharacterInMonodromy` | Rank 0; 1⊕ε⁻¹; repeated-weight 1⊕1; arbitrary compatible traces with no Hodge grading | Inspected tensor argument provides inclusion. Trace compatibility alone is insufficient; stronger Sen generation not asserted as proved. |
| Cocharacter convention and regularity consequence | diag(1,2)diag(1,3)=diag(1,6), trace 3, determinant 2; inverse scaling; repeated weights | New proved Lean example fixes t versus t⁻¹; repeated weights fail regularity. Coefficient action and connected image retained. |
| `requiresSteinberg`, weight-two constructor | p=3,k=4/2 and p=2,k=4/2/3 | Fixed false dyadic branch; all displayed cases proved by simplification. p=0/1 are numerical data only, outside the prime hypotheses of the lift theorem. |
| `requiresSteinberg`, minimal crystalline constructor | p=3,k=4; p=2 allows only k=2 through its constructor field | Remains false, independently of equality k=p+1. Proved odd exceptional-weight negative control. |
| `requiresSteinberg`, level-one constructor | p=2,q=5,i=2,k=4; odd exponent excluded | Same corrected dyadic condition, proved with valid auxiliary parameters. |
| `requiresSteinberg`, level-two constructor | p=2,q=7,i=6,j=0,k=4 gives order 8; q=5 has no allowed dyadic genuine level-two character | Same corrected condition, proved q=7 control; inherited q=5 negative control retained. |
| Type-2 lift theorem, §10.7 | Odd p,k=p+1; dyadic k=4; dyadic k=2 | README and light predicate agree. Actual representation/deformation-ring theorem remains a README target with the common prime/residual hypotheses. |
| General complete-intersection signature (unchanged) | n=m=0; unit equation/zero quotient; O/(π); ramified DVR; equal-characteristic k[[π]] | No ℤ_p-only substitution. Nontrivial quotient, finite O-module, proper equations and arbitrary uniformizer remain explicit; no change. |

## Blockers and exact continuation

1. **Modern independence must be supplied below this package.** `research/blueprint/readmes/GL2ModularityLifting.md`, R32.6 `globalisation-dependency-audit`, still explicitly leaves the suitable globalizations and weight-change inputs uninspected. Its named requests are `CompletedCohomologyAndLocalGlobalCompatibility:R31.6` and `SerreWeightAndLevelOptimisation:R20.6`. Exact leaves include Calegari 3.2, Snowden 8.2.1/KW II 6.1, Paškūnas 3.29 and KW II 3.5, CEG+16/Emerton–Paškūnas/BLGG13 A.4.1, and Gee 4.4.12. A displayed residual-modularity premise in Tung does not certify the independence of those auxiliary proofs. Export a restricted independently proved construction from the lower owners, or revise the bundle/dependency route. Do not invoke an unconditional consequence that uses full Serre inside a proof of Serre. This file is outside the authorized paths; merely declaring the audit closed here would be false.
2. **Place ordinary suppliers below their consumers.** `OrdinaryAutomorphicFormsAndModularityLifting` §6.9 requests the adequate ordinary seed BLGG13 A.4.1 and §6.13 uses Thorne 9.1/10.2. The added rank-two ordinary/level-adjustment source interfaces here are tier 22, after that tier-20 consumer. Move the exact contracts to an authorized lower GL₂/ordinary owner, or bundle/reorder the dependent roadmaps. `PotentialAutomorphyInfrastructurePartII` then imports them. The generic family-carrier cycle is resolved by the inspected AG2.P prelude; this separate ordinary-owner problem is not.
3. **Fixed-prime soluble ordinary seed, §4.7.** The target `solubleResidualRegularOrdinarySeed` must provide the chosen labeled ordinary quotient/tame character at the specified coefficient prime. Rogawski–Tunnell Theorem 2.9, pp.25–27, only gives the regular-weight congruence outside a finite exceptional set depending on the form; it does not certify an arbitrary fixed prime. Use an exact Serre-weight/ordinary-control export, or supply a fixed-prime Hasse/control argument with its integral-model hypotheses. Strong Artin weight one alone is insufficient. The revision-3 source inspection remains the basis for this warning; this run did not claim to reread the scan.
4. **Geometry and completion comparisons.** Finish the regular nonsmooth compactified Picard supplier with Quot, duality, base change, quotient representability and rational-point/topology comparison. Compare EGA/Jouanolou/Murre/Bertini/Abel-map source leaves with actual SF/AMAG exports. Compare §2.20's all-ℚ-conjugate exact completions with IG.2.6 and the degree-one scheme-Chebotarev statement; Q(i) at 5 cannot acquire unequal local degrees in a field Galois over Q. An endpoint citation alone is not that comparison.
5. **Remaining original monodromy/local-type leaves.** Original Larsen Theorem 3.17 and §§1.12–1.13 and Bogomolov pp.701–703 remain uninspected; retrieval reached inaccessible/non-PDF pages. The Serre proof now covers cocharacter inclusion, not every Sen Lie-algebra generation claim or Larsen maximality. Retain prior Larsen–Pink/Bruhat–Tits exact comparisons. Finish KW II 8.2, Gross/Coleman–Voloch and Savitt's corrected boundary/additional lattice exports at their lower owners. Moret–Bailly 1990 and Swinnerton–Dyer originals were not read; retain inspected alternate endpoints without pretending the originals were verified. No uncleared book copy was used.

Resume with items 1–3: they determine whether the complete potential-modularity and compatible-family endpoints can be certified without circularity. The four-path permission prevents the lower-owner changes required for items 1–2. Do not accept the package merely because the explicit proof plans are longer or the representative Lean file compiles.

## Validation

- `lean-check research/blueprint/packages/PotentialModularityAndCompatibleSystems/Suggested.lean`: **exit 0**, **420 lines**, exactly **32** warnings, all `declaration uses sorry`; no errors or other warnings. Available memory before this run was 83 GiB. The only subsequent Lean-file edit changes its closing comment. All added examples are proved; one inherited sorry example was replaced by simplification. No Lean process remains.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: no offenders.
- All four accepted packet checks: zero errors and warnings. R23.1 has 49 nodes/22 recorded gaps, R24.3 has 43/7; redirect packets R24.4 and R24.5 have zero nodes and 4/8 gaps. Validity does not close those gaps.
- `python3 research/blueprint/intake.py check-files` on the four permitted deliverables: **exit 0**, four files, zero problems. `git diff --check`: **exit 0**.
- Anchor/reference audit: **99 numbered targets**, **112 unique explicit anchors**; no inherited anchor removed, no missing internal target or reference definition. The handoff's two relative document links resolve.

## Public sources used for this run's repairs

Access date: 2026-10-17. Source files remained in scratch and are not committed. Only the mathematical arguments and locators, in our own words, enter this handoff and the package.

| Source | Passages relevant to the repairs |
| --- | --- |
| [KW I, author version](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | §5, pp.7–8, algebraic-closure WD parameters; Theorem 5.1(2)–(4), pp.9–10, dyadic/odd exceptional weights and auxiliary types. |
| [Serre, Astérisque 65](https://www.numdam.org/item/AST_1979__65__155_0.pdf) | §1.3–§1.4, pp.157–160, Hodge grading/tensor automorphisms and distinction from stronger generation. |
| [BLGGT v4](https://arxiv.org/pdf/1010.2561v4) | §§2.1, 5.1, 5.3 and Appendix A.1: signed pairing, family conventions and regularity/descent comparisons. |
| [DP v2](https://arxiv.org/pdf/2108.07577v2) | Definition 1.10 and Theorem 1.11, p.7: full all-member de Rham endpoint retained. |
| [Open AG2 head](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4a3681082bdda51d99b5276928db227758b34d31/TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md) | AG2.P and AG2.6: actual common carrier, finite realization fields, operations and weakening predicates. |
| [Open AGR head](https://github.com/TauCetiProject/TauCetiRoadmap/blob/06cbbcfc56ba257910bbf16066e5e676e8204344/TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md) | §7.1: imported raw carrier, DP predicate and chosen rank-two local models. |

The retrieved KW I PDF has SHA-256 `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82`; Serre's PDF has SHA-256 `51ee4c28314e68d4456900cba2f463f9d7c2404a6d7b2595d16ff9738626401b`. These identify versions; they are not claims to have read every page.

Other retrieved public papers were used to cross-check inherited expansions: Taylor Artin II Lemma 2.1, Snowden §§4.4/7.6/8.2, CG Theorem 4.8/proof, KW II §§8–10, Geraghty 2010 ordinary specialization, and Moret–Bailly II compactness. They do not certify the uninspected original leaves itemized above. The revision-3 handoff preserves the earlier exact public-version hashes and additional source locators.
