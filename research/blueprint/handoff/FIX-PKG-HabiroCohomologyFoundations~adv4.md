# Habiro foundations: trace ownership repair

Issue #11401; agent Codex; session `codex-8HJiKe`; 2026-10-20.

The repair within this issue's four deliverables is complete. The package now
has no RefinedTraceMethods or Part II supplier. Its genuine exports to
RefinedTraceMethods remain consumer notes in §§4.28 and 5.26 and the downstream
paragraph. The mathematical targets removed here already have destinations in
the Part II design and package; the conservation table below identifies them.

The fix self-assessment is **needs_changes**, because the requested
`ordinaryDerivedComparison` deletion belongs to a different package, whose
files this issue does not authorize. Its new owner already contains the
comparison, but its old owner still contains the backward supplier edge.
This is not certification that the five-package supplier graph is acyclic.
The exact remaining edits are recorded below; no outside deliverable was edited.

## Inputs and finding dispositions

The issue's named `REV-PKG-HabiroCohomologyFoundations~adv.md` is not present in
this checkout. Read the available base, `~2`, `~3` and `~codex4` package reviews,
the existing review result, the Part II `~codex1` review and handoff, and the
`DESIGN-HabiroCohomologyFoundationsPartII.md` relocation manifest. The absent
filename has not been treated as an unseen clean review.

| Finding | Disposition in this fix |
| --- | --- |
| Part II review R1: Part I imports its trace consumer | Removed old Layer 6 §§6.1–6.5, old §8.1's trace example only, and old §9.15's trace comparison only. Removed trace supplier entries in Scope, Exact supplier contracts and aggregate dependencies. Updated §§4.28, 5.19, 5.26 and downstream directions. The independent PR.3/AI.1/HQ.4 construction remains in §8.15. |
| R2: ordinary/derived completion creates HC ↔ HR | Confirmed a naming mismatch in the issue: `ordinaryDerivedComparison` is in **HabiroCyclotomicCompletions §5.5**, whereas this package's §5.5 is the p-tilde de Rham comparison. HabiroRings §2.4 already owns the full destination. The unauthorized HC deletion remains, with its ordinary boundary to preserve, as specified below. This package's unrelated §5.5 is retained. |
| R2: HR §2.13 imports QSeries factorial divisibility | Read the current destination: it already derives the integral factorial identity from HC Layer 1's `qBinomial_factorial` and `qFactorial_pochhammer`. No additional Gaussian-polynomial target or edit is needed here. |
| R3: RT's étale input cites former HR.6 | External residue: RT §6.14 and its aggregate still cite HR.6 for this comparison. The owner is this package §4.21. This fix preserves that target and does not edit RT. |
| R4: full framed trace theorem has conflicting ownership | External residue: the Part II supplier contract still describes RT §6.10 as providing the one-variable example, while Part II §§3.1–3.2 own the general framed construction. The design assigns that general construction to RT. The exact transfer remains for those owners; deleting Part I's trace clause does not close it. |
| Base review R1–R3 and round-2 R4–R8: fake carriers or unconstrained comparisons | Those declarations were removed by earlier repairs and remain absent. The current Lean has only five light definitions over native carriers. The README retains actual enhanced categories, derived cofibers, universal envelopes, fixed comparison maps and the q-FV/ghost hypotheses. No old countermodel script was executed. |
| Round-3 boundaries and `~codex4` export corrections | Preserved the coherent divisor diagrams, factorial transitions, graded t-localization and degreewise completion in §4.28; its operadic and finite-projective base-change conditions; §5.26's actual rational overlaps and contravariant quotient maps. The analytic and canonical θ/Witt compatibility gaps remain visible. |
| Computed conventions, generality and Lean shape | Added the characteristic-two, rank-zero, coefficient-relation and correction-sign witnesses described below. The five definitions and seven theorem signatures are unchanged. Removed the closing name catalogue and updated layer references. Every example is proved. |

## Relocation and conservation

Old Layers 7, 8 and 9 become Layers 6, 7 and 8. Their subsection numbers and
internal section references change accordingly; the HQ family labels do not.
Sections 4.28 and 5.26 retain their numbers. The original 153 numbered
subsections become 148: exactly the five trace subsections are deleted.
All other original subsections remain. Existing API identifiers and Checks
outside the relocated trace material are preserved; new native Checks are
additions. No numbered placeholder marks a deleted target.

Destinations below are the checked-in Part II package sections, with RT as
the trace theorem supplier. They are not new targets of Part I.

| Removed material | Destination and conservation boundary |
| --- | --- |
| Old §6.1: trace existence | Part II §§1.1–1.3 (`TraceInput`, `tracePair`, `traceHabiro`), importing RT §§6.9–6.10. Preserve the absolute 2-inverted theorem, relative spherical base `(tC_p)`, prime-dependent E₂/E₁ choices, the extra condition at 2, the completed grading, all four pair axioms and conditional E_(n−1) structure. |
| Old §6.2: ku-lift boundary | Part II §1.3 `traceHabiro_kuLiftInsufficient` and its RT boundary request. Part I §5.20 retains the algebraic exponent-one failure. The design's absence of a known E₂ ku-counterexample and unconstructed image-of-J equivariant diagram remain boundary obligations; this deletion supplies neither. |
| Old §6.3: local resolution and identity cover | Part II §1.1 imports RT §§6.1, 6.9. Preserve a p-torsion-free semiperfect cover and the entire lifted augmented Čech nerve; truncate THH before taking the limit and residual circle fixed points. Keep the all-prime local proof, identity-cover independence and E∞ refinement distinct from general-cover multiplicativity. |
| Old §6.4: lift after perfection | Part II §2.2 `perfectedLiftNaive`, with the quotient range in §2.1 and RT §6.9 as supplier. It is the perfected algebra R_∞ that has a lift. Completed faithfully flat descent, the toric x−1 example and the stricter spectral range at 2 remain there. Part I §§5.19–5.26 keep the independent algebraic theorem for every exponent ≥2, including 2. |
| Old §6.5: number-field trace export | Part II §§4.1–4.2, importing RT §6.14. Preserve arbitrary number fields, Δ divisible by 6 and the discriminant, periodic KU, genuine finite fixed points followed by residual circle fixed points, the spectral limit and only then π₀. Taylor/cyclotomic exports are transported through that ring comparison. |
| Old §8.1: trace example only | Part II §3.3 `canonicalFramedTrace` and its ℤ[1/2][x] Check; the full framed supplier remains the R4 transfer above. Polynomial, étale, smooth-scheme, torsion, tensor-domain and Laurent examples remain Part I §7.1. |
| Old §9.15: trace comparison only | Part II's independent-construction supplier boundary and RT's trace-filtration comparison. Part I §8.15 retains Frobenius-divisibility Nygaard, its descent, the relative Frobenius and the q-Witt comparison. Syntomic trace comparisons remain with RT. |

Part I §§8.18–8.19 are the old §§9.18–9.19, with their full enhanced
θ/Witt map-equality targets and existing uniqueness/descent gaps unchanged.
No full comparison layer is discarded because of its former aggregate RT
citation. The old immutable packet aliases, including HQ.5-trace and the
HQ.8 staging node, still require the manifest's integration edits; packets
are not deliverables of this fix.

## Precise external follow-up

1. In `research/blueprint/packages/HabiroCyclotomicCompletions/README.md`,
   remove `ordinaryDerivedComparison` and its derived Checks from §5.5,
   remove the HabiroRings Layer 2 supplier from Scope and its supplier table,
   and update the Layer 5/§6.4 aggregates. Remove its duplicate ownership from
   that package's `Suggested.lean` closing list. **Keep** the ordinary
   polynomial-module exactness and the arbitrary-module counterexample
   built from the sum of the powers of t. HC must export its ordinary
   toolkit to HR, rather than importing derived completion back from HR.
2. The destination is already `HabiroRings/README.md` §2.4. It contains the
   canonical comparison, projection/naturality API, zero and polynomial
   tests, integral/unit tests, coefficient torsion at 2, exclusion of m=0,
   and the derived q=1 cofiber counterexample. HR §2.13 already has the HC
   factorial suppliers. Preserve both repairs; do not introduce a second
   comparison or drop the arbitrary-module boundary from HC.
3. In `RefinedTraceMethods/README.md`, retarget the obsolete HR.6
   degree-zero étale supplier in Scope/contracts/§6.14/aggregates to
   `HabiroCohomologyFoundations` §4.21. Reconcile RT §6.10 and Part II
   §§3.1–3.3 with the design's `HT-RT-framed` request, transferring the
   full framed theorem, diagonal q-PD/Čech construction and prime-two
   resolution comparison to RT while Part II consumes them. Preserve all
   hypotheses and Checks in that transfer.

Once these owner edits and their external prerequisites are reconciled, the
conditional family order is **HC → HR → I → RT → II**. This is an order of
the audited family, not an invented numerical Caraiani–Newton tier or a
certification of all suppliers. No authorization to edit these outside
packages is inferred from their being named here.

## Adversarial pass

All twelve native definition/theorem statements were checked against their
actual `variable` blocks and their README counterparts. The seven theorem
proofs remain roadmap obligations; successful elaboration alone is not a
mathematical proof. The table covers every mathematically edited contract
and every native statement. Mechanical renumberings do not enlarge domains.

| Statement or contract | Instances and calculation | Result / change |
| --- | --- | --- |
| `qDiff`, `jackson_calculus`; §1.2 | Constant and x⁰ give zero; x gives 1; x² gives (1+q)x and the two-term twisted product rule. At q=2, x²↦3x and x³↦7x². At q=1 in 𝔽₂, x²↦0. | Holds over arbitrary commutative rings, including the zero ring and positive characteristic; no division or regularity hypothesis. Added the characteristic-two Check and proved example. |
| `uniformDenominator`, `uniformDenominator_pos`; §1.8 | n=0 and 1 give 1; n=2 gives 64; n=3 gives 2¹⁴3²⁶. Every factor is a positive prime power. | Positivity is the native assertion; actual envelope maps are still the README construction. Consolidated the witnesses into two proved examples. |
| `torusScaleHom`, `torusScaleHom_action`, `torusScale_exists_unique`; §1.23 | Rank 0 is the coefficient algebra; q=1 fixes every monomial. Rank 1 exponent −1 scales by q⁻¹. Rank 2: (2,−1) paired with (−1,3) gives −5. Scaling by a then b adds the exponents; the inverse uses −a. | General commutative coefficients and unit q agree in Lean and prose. No domain, field or DVR restriction. Added rank-zero and q=1 witnesses; retained the sign calculation. |
| `coefficientRelation`, `coefficientRelation_eval`; §2.2 | For m=2, (2,3,1) gives 0 while (2,2,1) gives −1. For m=1, (2,1,1) gives 0. For m=0, (2,0,0) gives 0. | Evaluation theorem remains valid even at m=0 over every commutative ring; cyclotomic constructions explicitly require m≥1. Added both boundary Checks and proved witnesses. |
| `qHodgeDiff`, `qHodge_polynomial`; §7.2 | Constants and x⁰ give zero; at q=1 every f gives zero. At q=2, x² gives 3x. At q=1, x distinguishes q-Hodge's zero from Jackson's one. | No replacement of q-Hodge by the ordinary derivative. Added the README Checks and generic constant witness. |
| `cyclotomic_prime_decomposition`; §8.2 | p=2: Φ₂=2+(X−1), u=1. p=3: Φ₃=3X+(X−1)², u=X. Prime divisibility of the remaining binomial coefficients constructs the general integral u, with u(1)=1. | p=0,1 are excluded by `Fact p.Prime`. Added proved p=2 and p=3 witnesses. |
| Correction sign; §§5.26, 8.2 | 2=−(X−1)+(X+1); replacing minus by plus evaluates to 4 at X=2. | Added the explicit negative control in README and Lean. |
| Export package; §4.28 | Unit/étale pair, m=1 reduction, identity and composable divisor transitions; localization at β versus t; finite-projective versus arbitrary scalar change. | All graded completion, coherence and conditional hypotheses are retained. Only the trace consumer direction changes. No lift hypothesis is added to a chosen pair. |
| Higher powers; §5.19 | α=2 at p=2 and at an odd prime remain admitted; α=1 remains the failure of §5.20; empty regular sequence recovers the base. | Algebraic range stays all α≥2. Removed the stale local reference to the relocated spectral criterion. |
| Finite coefficients; §5.26 | m=1 keeps a nonzero uncompleted rational corner, while completed modification contributes zero; m=4 remains allowed algebraically despite the spectral range. At p=2 the correction sign above is required. For m∣m′ the ring map is ℤ/m′→ℤ/m. | Actual C_p overlaps, constant rational filtration, staticity argument and contravariant maps are unchanged. Only the downstream trace note changes. |
| Trace-free examples; §7.1 | x²'s two differentials, H⁰(M/^Lh) versus H⁰(M)/h, étale input, tensor square of ℤ[x], and Laurent ℚ. | All existing algebraic examples remain. Only ℤ[1/2][x]'s spherical comparison moves. No analytic comparison becomes a premise. |
| Independent Nygaard; §8.15 | Unit smooth algebra in degree zero; p=2; positive-degree twisted input; filtrations before comparison. | Bounded prism, quasisyntomic construction/descent, Frobenius twist, filtered quotient and completions remain explicit. PR.3/AI.1/HQ.4 suffice; trace comparisons are downstream. |
| Analytic scope and corrected locators; §§3.30, 6.1–6.3, 8.3 | Root specialization in characteristic p, small-prime inversion and the non-E∞ general algebraic boundary. | Open analytic comparison remains open. Corrected QH 1.17(b),(c) to p.9, and the full paragraph to pp.8–9. |

Zero modules, the unit ideal and noncompact groups do not occur as quantified
inputs of the native polynomial signatures. Their relevant enhanced
boundaries remain in the README; no compactness, regularity or coefficient
condition is silently removed. In particular, native polynomial identities
over arbitrary rings are not claims about an arbitrary enhanced cohomology
theory with unconstrained input data.

## Source verification

Read the public versions linked in the README, with printed PDF page numbers.
No passages, source files or page-by-page synopsis are included here. Changed
contracts were checked at QH §§3.1–3.2, 3.4, 3.6–3.7, 4.2 and Appendix A;
TC §§3.1–3.2; KU Theorem 1.14 (§1.2, p.7); Bhatt Proposition 8.5 and Remark
8.7 (§8, pp.32–33); and BS Theorems 15.2–15.3 (§15.1, pp.102–104).

For the package-review source sample, selected 15 retained subsections with
Python `random.Random(11401).sample` from the ordered subsections containing
a `(See …)` locator. This sample was chosen before the page-range repairs.
Every row below was checked in the cited source, not from a search snippet.

| Retained subsection | Source locations checked |
| --- | --- |
| §2.5 | QH A.14, p.76; §A.1, p.70 |
| §2.11 | QH 3.14, p.28; 3.49, p.49 |
| §4.14 | QH 3.42, p.45; 3.45, p.47 |
| §8.17 | BS 16.1, p.106; QH A.1(b), p.69 |
| §4.20 | QH 3.11(b), p.25 |
| §4.7 | QH 3.10, p.24 |
| §1.1 | QH A.1(b), p.69; §A.1, p.70 |
| §1.6 | QH A.6, pp.71–72 |
| §3.16 | QH 3.15, p.29 |
| §8.9 | QH 3.18, pp.30–31; 3.49, p.49 |
| §8.4 | QH A.1(b), p.69; A.12, p.75; BS 16.18, p.113 |
| §1.12 | QH A.12, p.75 |
| §8.16 | QH 1.13, p.7; 1.10, p.6; Scholze §2, p.4; BS 17.2, p.117 |
| §3.9 | QW 2.48, p.33; 3.31, p.50; 3.33, p.52 |
| §8.3 | QH 1.17, pp.8–9; 3.48, p.49; BS 17.2, p.117 |

The sample exposed the QH 1.17 page-range issue. All occurrences of its (b)
and (c) clauses were corrected as well. Section 8.15's refreshed locator
also identifies BS 15.2 on pp.102–103 and QH 3.20/3.22 in §3.4 on p.32.

Versions: [QH v2](https://arxiv.org/abs/2510.04782v2),
[QW v5](https://arxiv.org/abs/2410.23078v5),
[TC v4](https://arxiv.org/abs/2410.23115v4),
[KU v1](https://arxiv.org/abs/2510.06057v1),
[Pridham v4](https://arxiv.org/abs/1608.07142v4),
[Bhatt v1](https://arxiv.org/abs/1204.6560v1),
[BS v4](https://arxiv.org/abs/1905.08229v4), and
[Scholze v1](https://arxiv.org/abs/1606.01796v1).

## Library and upstream audit

Read `data/library-coverage.json` for HQ.1–HQ.8 and confirmed the object
boundaries in the current read-only sources, rather than treating an absence
of matching target names as proof. Checked q-difference substitution and
geometric sums, filtered coefficient relations, q-PD envelopes, derived
completion versus ordinary completion, Frobenius-divisibility/Nygaard and
torus characters. Current roadmaps were inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The newer roadmap ownership
boundaries, including AlgebraicVectorBundles, remain in Scope.

Tau Ceti's `LinearAlgebra/Basis/DiagonalTorus/Basic.lean` already gives
`torusCharacter` and its addition, negation and integer-scaling laws. The
existing Scope citation is retained; this roadmap's remaining torus target
is the induced algebra scaling and coherent module descent. Mathlib's
geometric sums and cyclotomic formulas remain cited inputs. No newly found
duplicate required an additional deletion. The five light definitions are
specializations on existing carriers, not replacement cohomology models.

Read the exemplar and the current DGAInfinity and StablePeriodicCurved
roadmaps for the document/signature shape. No build or Lake command was run
in either current read-only checkout.

## Validation

- `lean-check research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`:
  exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Exactly seven `sorry` warnings;
  no other warnings or errors. Memory was checked before compilation.
- 219 Lean lines, five real-bodied definitions, seven theorem signatures and twelve proved
  `example` declarations. Two examples per definition; two additional
  examples pin the cyclotomic milestone and correction negative control.
  No admitted data or examples, no auxiliary theory development.
- Intake `check-files` on all four deliverables: exit 0, zero problems.
- Sorry-data check: exit 0. All five immutable Part I packet checks (main,
  HQ.1, HQ.1-2, HQ.3 and HQ.8): exit 0, zero errors and warnings.
- Subsection/API preservation inventory: all 148 retained sections found;
  no retained backtick API identifier or existing Check bullet lost.
  All twelve native declaration signatures match the baseline exactly.
- `git diff --check`, the four-file scope audit and local-path scan: pass.

Only the four authorized deliverables change. No suspicious instructions
were encountered in the external data. Public source material and working
notes were kept only in temporary scratch, which is deleted after submission;
the residue above is sufficient for the next authorized owner.
