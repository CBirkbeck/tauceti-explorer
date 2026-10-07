# Independent review: EllipticCurveModularityPartII

Job: `REV-DESIGN-EllipticCurveModularityPartII`, issue #3521. Reviewer: Codex, session `codex-3H4Xqs`, 2026-10-07. The designer was a different session (`codex-KtiZyb`). This is a completed review, not a planning checkpoint.

## Verdict

**Needs changes: synchronize the definitive reader.** All 31 packet nodes have been independently checked and corrected at target level. The packet, roadmap definition and suggested-file comments contain the clear corrections described below. However, the roadmap and the suggested file designate `research/blueprint/readmes/EllipticCurveModularityPartII.md` as definitive. That document still contains contradictory supplier claims, the incorrect Darmon–Merel scope, and the underspecified quotient/model conventions. The review issue permits edits to the roadmap JSON, packet JSON, suggested Lean file and this report; it does **not** permit editing that reader. A revision must synchronize it before the plan is accepted.

This verdict is not based on the presence of open gaps, missing implementations, or unavailable Lean compilation. The nine recorded gaps are legitimate follow-up work under PROTOCOL §0. All six stages remain `planned`; none is `closed`. No implementation is asserted.

## Counts and coverage

The finished review retains 31 nodes: 3 definitions and 28 theorems, with 9 API items, 9 unit tests, 23 planets, 13 baseline references, 23 requests and 9 gaps. No nodes or baseline references were removed or added. Every checked-node verdict is `corrected`, including the replacement of generic source-match prose by a specific mathematical explanation. There are six public source PDFs and 37 excerpts. The original five hashes agree with the packet; the added Darmon–Merel author-copy hash is recorded in both JSON files.

| Stage | Nodes | Coverage | Principal remaining input |
| --- | ---: | --- | --- |
| EC.1 | 4 | planned | dimension/newspace supplier contracts |
| EC.2 | 2 | planned | integral/field norm comparison and residue divisibility |
| EC.3 | 4 | planned | coefficient, conductor and residual comparison contracts |
| EC.4 | 5 | planned | ideal-valued Sturm and the mod-four subgroup/Chebotarev argument |
| EC.5 | 5 | planned | Mazur arithmetic proof inputs and composite-isogeny exclusions |
| EC.6 | 11 | planned | compactified Cartan curves, winding/local extension, arithmetic exclusions and complete image certificates |

Every stage target has a node. The order is sound: thresholds precede norm/comparison estimates, rationality precedes full-two-torsion realization, and isogeny/image results precede Lemos’s theorem. The parent’s fixed-curve modularity proof is not made dependent on this continuation’s uniform irreducibility. All seven Bennett–Siksek routed items are covered. The split proposal preserves 27 Caraiani–Newton, 3 Khare–Wintenberger and 62 BCDT routed items in three independent continuations; those inventories and the design brief agree. This review does not claim to have reviewed the mathematical plans of those proposed continuations.

## Corrections made

1. Checked all original excerpts literally after Unicode/whitespace normalization. Replaced all 31 generic `match` descriptions with explanations identifying the precise result or application adapter. Added three Bennett–Siksek threshold citations and three Darmon–Merel citations; replaced the prime-integrality excerpt with the actual Σ statement. Visually inspected Bennett–Siksek p. 360 to confirm both radicals, which text extraction omits.
2. Corrected Martin’s proof locator from §5 to **§4**, pp. 14–16; Theorem 2 is on p. 3. Retained the precise equality classification and 10,125-integer finite calculation. Corrected the source metadata in both JSON files.
3. Restated small-prime trace transfer with explicit E, F, ℓ, exact residual conductor, residual isomorphism, weight, full-two-torsion and strict G-bound hypotheses. It no longer leaves F or “under Kraus Theorem 3” as implicit quantifiers. The existing suggested signature already retained these assumptions.
4. Disambiguated Chen’s curve: the Atkin–Lehner quotient is by **w_{p²}**, retaining the r-level, rather than w_{rp²}. Fiber-product notation denotes its smooth projective normalization. Retained the p-new quotient and away-from-p Hecke equivariance. Updated the winding proof convention and suggested-file comment.
5. Read [Darmon–Merel’s public author copy](https://perso.imj-prg.fr/loic-merel/wp-content/uploads/merel-pub/winding.pdf), dated 5 January 2001, §§6–8, with its own pagination. Proposition 7.1, Theorem 8.1 and Lemmas 8.2–8.3 concern **r=2,3**. Lemos, not that paper, supplies the stated extension to 5,7,13. The gap now asks to verify the extension of the nonvanishing calculation, integral model, cotangent comparison and reduction input; it also names Kolyvagin–Logachev and Manin–Drinfeld.
6. Specified the formal-immersion target’s prime p, real-cyclotomic base, cusp, canonical smooth locus, optimal quotient and Néron model. The original r=2,3 argument is checked; the larger-level extension remains explicit follow-up work. Removed the spurious characteristic-2 obligation: p outside Σ implies p≥11, and a prime q≡±1 mod p cannot be 2 or 3. The quotient has to have good reduction at the relevant denominator prime for the specialization argument.
7. Added the direct ModularForms Layer 4 prerequisite to small-prime integrality for the bad-prime coefficient values. The previous transitive path through finite rationality did not state that direct use.
8. Removed the request that treated **R15.2 as a supplier of ideal-valued Sturm**. Read its stage and packet: its q-expansion/integral-Hecke scope does not state that bound. Added a precise gap for Kraus Appendix II Proposition 1 and ideal (2)². Updated EC.4’s coverage and roadmap dependencies. The pinned analytic Sturm theorem remains only a characteristic-zero equality theorem.
9. Requested the corrected weight-two Eisenstein construction from **upstream ModularForms Layer 0**, whose exceptional-weight specification covers it, instead of burying that series in Layer 4’s newform contract. Retained Layer 4 for recurrences and bad-prime Euler-factor comparisons.
10. Replaced the **R12.2** rational-moduli request (analytic comparison) by **upstream ModularCurves Layer 9**, consuming Layer 8’s cyclic level problem. The narrowed contract maps a given rational elliptic curve and stable subgroup to its coarse noncuspidal point; it asserts no classification of rational points. Added the upstream ModularCurves roadmap prerequisite.
11. Narrowed **R01.4** to finite-group facts, removing its purported elliptic exceptional-image exclusions. Serre’s arithmetic exclusion and Bilu–Parent–Rebolledo remain in the existing arithmetic gap. Narrowed **CN.3** to intrinsic computations, rather than a complete rational-point or universal exceptional-prime theorem. **CN.5** continues to provide certificate schemas and reproducibility.
12. Restricted **R01.5** to semisimple recognition over a common field and justified coefficient descent. Removed its use as a ready-made mod-four representation theorem. The finite E[4] Chebotarev density/predicate step is now explicit in the mod-four gap and EC.4’s corresponding stage dependency is removed.
13. Marked all 13 baseline entries independently checked, synchronized the permitted roadmap descriptions, and added this review object. Updated the suggested-file explanation of omitted geometric signatures without inventing supplier predicates or claiming compilation.

## Baseline and audited ownership

Read every following declaration statement at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, as appropriate. All names exist and their cited limited uses are correct. No citation was removed or replaced.

| Reference | Module | Confirmed scope |
| --- | --- | --- |
| `mathlib:Algebra.norm_eq_prod_embeddings` | `Mathlib/RingTheory/Norm/Transitivity.lean` | Norm as the product over all embeddings into an algebraically closed extension. |
| `mathlib:Algebra.norm_eq_zero_iff` | `Mathlib/RingTheory/Norm/Basic.lean` | Norm is zero exactly at zero for a finite free extension of domains. |
| `mathlib:Ideal.absNorm_dvd_norm_of_mem` | `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean` | Ideal norm divides the integral element norm for an element belonging to that ideal. |
| `tauceti:HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` | Bundled normalized newform on Γ₁(N), with a nebentypus and newness. |
| `tauceti:TauCeti.cuspFormsNew` | `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean` | Γ₁(N) newspace, Petersson orthogonal to the oldspace; trivial-character intersection supplies Γ₀ newspace. |
| `tauceti:cuspFormCharSpace` | `TauCeti/NumberTheory/ModularForms/DiamondOperators.lean` | Joint diamond eigenspace for a specified nebentypus. |
| `tauceti:TauCeti.ModularForm.sturm_bound_finiteIndex_SL2Z` | `TauCeti/NumberTheory/ModularForms/SturmBound.lean` | Characteristic-zero equality bound; does not provide congruence modulo arbitrary ideals. |
| `mathlib:CongruenceSubgroup.Gamma0` | `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean` | Congruence subgroup used for μ(N) as its index. |
| `tauceti:WeierstrassCurve.frobeniusTrace_eq_card_point` | `TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean` | For an elliptic finite-field model the trace equals q+1 minus the actual point-group cardinality. |
| `mathlib:WeierstrassCurve.j` | `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` | j-invariant of an elliptic Weierstrass curve. |
| `mathlib:Representation.IsIrreducible` | `Mathlib/RepresentationTheory/Irreducible.lean` | Irreducibility via the simple lattice of subrepresentations. |
| `tauceti:TauCeti.Isogeny.Hom` | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean` | Coordinate-pullback elliptic homomorphisms, including zero; the Add module supplies integer multiples of identity. |
| `mathlib:WeierstrassCurve.Affine.Point.map` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` | Actual additive point map along an algebra homomorphism; used for Galois stability. |

The norm product requires the finite/separable extension and algebraically closed target; nonvanishing uses finite freeness and domains. The ideal-norm lemma alone does not identify integral and field norms or extract the rational residue characteristic. Those adapters remain a gap. Γ₁ newness and the diamond eigenspace do not alone prove coefficient integrality, Galois-orbit dimension bounds or Γ₀ dimension formulas. Their supplier contracts remain separate. Frobenius point-count equality is not Hasse. The point-map and Hom carriers are genuine existing geometry, not proofs of torsion classification or endomorphism arithmetic.

Read the reviewed library coverage for the relevant AUDIT-11, AUDIT-16 and AUDIT-13 layers, and the arithmetic Galois audit entries. No node duplicates an audited implemented theorem. Read upstream EllipticCurves and ModularForms conventions and the relevant ModularCurves level/coarse boundaries. Confirmed the exact R29.6 modularity node, the three R20.6 reduced-level/newform/trace nodes, and R19.6’s residual-newform node. Read all requested supplier stage statements. The concrete corrections above are where the original contracts exceeded those statements.

## Sources, API, signatures and planets

The verified source URLs, editions, access date and six PDF hashes are in `sources`; node citations distinguish source statements from derived adapters. Kraus’s published Theorems 3–4 retain ℓ≥5, irreducibility and Serre weight two, with parent modularity supplying modularity. The reduced level is not silently identified with the prime-to-ℓ conductor. The norm bound uses every embedding and a nonzero element. The Mazur prime list is not used as a replacement for the composite cyclic-isogeny theorem. Lemos’s theorem retains geometric non-CM, rational cyclic isogeny and p>37. Complete image certificates, rather than a finite sample of primes, remain required.

The three threshold definitions have the appropriate equality, lower-bound, dimension-zero, lcm-compatibility and maximum APIs. Their three tests each distinguish a missing radical, exponent, incorrect lcm or omitted maximum branch. All nine API names and nine test names/examples occur in the suggested file. No further API, node split or planet is needed at target level. The 23 planets are mathematical objects or named theorems, with at most six in each stage. The suggested file honestly omits geometric signatures whose suppliers are absent and uses actual point/endomorphism carriers for its seeded interfaces; its reduced two-isogeny and kernel-transport signatures explicitly describe which clauses are not seeded.

The original `sourceIssues` is empty. No new published mathematical error was established. The Martin locator and the Darmon–Merel scope errors are errors in this plan’s citations, not established errors in those papers. Lemos’s attribution describes a method extension; this review does not claim its theorem false. The AMS published PDF returned HTTP 429 during collation; the v2/published comparison remains a precise source obligation, already recorded in the certificate gap.

## Revision required and questions for the orchestrator

Include `research/blueprint/readmes/EllipticCurveModularityPartII.md` in the revision’s deliverables and synchronize:

- **Martin’s dimension bound** and **Sources and versions**: §4, not §5.
- **Small-prime point-count transfer**: use the fully quantified statement now in the packet.
- **Chen’s isogeny** and **Rank-zero winding quotient**: fix w_{p²}, normalized fiber product and the exact Darmon–Merel/Lemos scope.
- **Cuspidal formal immersion** and **Darmon–Merel winding and formal-immersion inputs**: use the explicit real-cyclotomic base, canonical smooth locus and Néron model, restrict the original-source verification to r=2,3, and remove the characteristic-2 obligation.
- **Supplier contracts** and layer dependency lists: remove the unsupported R15.2 Sturm claim, route the Eisenstein series to Layer 0 and coarse moduli to ModularCurves Layer 9, narrow R01.4/CN.3/R01.5, and add the direct bad-prime coefficient dependency.
- **Source and closure obligations**: add the ninth gap and acknowledge that the Darmon–Merel author copy has been read in this review.

Once those concrete contradictions are corrected, the open gaps themselves need not block acceptance of this target-level pass. Separately, assign a shared compactified Cartan-level owner serving EC.6 and the imaginary-quadratic continuation, and an owner extension for ideal-valued Sturm; do not duplicate those general theories here. Those owner decisions are follow-up closure work, not a request to rewrite all six planned stages.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartII.json` reports **0 errors, 0 warnings**. Validated both JSON documents, all 37 short literal excerpts and all six source hashes; reviewed the packet/roadmap statement and dependency changes. Definitions, API and example names agree with the suggested file. `git diff --check` passes.

The suggested file **was not compiled**. After checking available memory, `lean-check` stopped immediately because the shared build lacks `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Add.olean`. A complete build at the Tau Ceti pin was unavailable; no build, dependency update, cache download or language server was started. Source inspection used the pins, not the shared checkout’s current HEAD. This limits signature validation, not the mathematical source review.
