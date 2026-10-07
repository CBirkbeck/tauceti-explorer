# Independent review: Potential automorphy infrastructure, Part II

Job `REV-DESIGN-PotentialAutomorphyInfrastructurePartII`, issue #3592. Reviewer: Codex, session `codex-ODvJVt`, 7 October 2026. The design was written by Claude, session `claude-Zy0b6p`; this review is independent.

**Verdict: needs_changes. This review is complete.** The mathematical plan has substantial source-backed content, but its suggested Lean file did not encode its stated arithmetic hypotheses. Several statements and proof sketches also needed correction. Clear fixes are applied in the four permitted deliverables; unresolved inputs are explicit gaps. The reviewed packet is now `partial`, with all ten stages `partial`. This is the state of the plan, not a checkpoint of this review. A revision must reconcile the reader, which issue #3592 does not authorize editing.

## Counts and method

| Item | Original | Reviewed |
| --- | ---: | ---: |
| Nodes | 86 | 86 |
| Definitions / constructions / theorems | 13 / 10 / 63 | 13 / 10 / 63 |
| API items | 136 | 137 |
| Unit tests | 96 | 96 |
| Planets | 27 | 35 |
| Baseline declarations | 3 | 3 |
| Gaps | 4 | 13 |
| Supplier requests | 15 | 23 |
| Source excerpts checked | 165 | 168 |
| Source records / version records | 12 / 12 | 15 / 16 |

No nodes were added or removed. The added API is `splitReducibilityIdeal`, separate from the determinant reducibility ideal. The node verdicts are 39 `corrected` and 47 `unverifiable`; every node is listed below and in the packet. “Corrected” describes an established correction, not a claim that its missing arithmetic signatures are implemented. “Unverifiable” includes source-correct prose whose proof inputs or packet-to-Lean correspondence are still missing. No implementation status was promoted.

Read WORKERS, both protocols and UPSTREAM_GUIDE. Read the upstream Multiquadratic and GlobalNumberFields documents in full, and relevant ModularForms/ProfiniteCohomology portions. Read every node's statement, hypotheses, proof steps, acceptance criteria, definition API and tests; inspected the full original suggested file. For external prerequisites, read all 75 exact node statements found among the original 88 distinct external references; the other 13 are stage references whose scope and requests were inspected. A stage reference is not evidence that its broad title supplies a specialized theorem. Checked the reviewed library audit and source passages, rather than inferring from declaration names.

All 165 original excerpts match the downloaded source texts after NFKC, whitespace and minus normalization. All twelve original PDF hashes match the recorded SHA-256 values. Literal excerpt agreement alone does not verify a mathematical statement. Many locators mixed publication and preprint pages; each citation now records the PDF coordinate of the excerpt in its recorded version, with all occurrences listed where an excerpt is ambiguous. The global PD-automorphy usage formerly attributed to BLGGT §2.1 p.35 is located in Proposition 4.1.1's conclusion, PDF p.50. Other section/theorem identifiers were retained where they disambiguate the passage.

## Public sources and version limits

The twelve original source records remain pinned to the independently downloaded versions:

- [BLGGT14: Potential automorphy and change of weight](https://arxiv.org/abs/1010.2561v4): Annals of Mathematics 179 (2014), 501–609; read in arXiv:1010.2561v4 (9 December 2013). SHA-256 `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24`.
- [Tho12: On the automorphy of l-adic Galois representations with small residual image](https://arxiv.org/abs/1107.5989v1): Journal of the Institute of Mathematics of Jussieu 11 (2012), 855–920; read in arXiv:1107.5989v1 (29 July 2011). SHA-256 `537af0053745f4206157c0441365218285624d95a25ae408149f287372d9ba55`.
- [Tho17: A 2-adic automorphy lifting theorem for unitary groups over CM fields](https://www.repository.cam.ac.uk/handle/1810/254922): Mathematische Zeitschrift 285 (2017), 1–38; read in the author's accepted manuscript dated 16 March 2016 (Apollo, University of Cambridge repository). SHA-256 `f7b706eb2eb69354f5be3ce846193dc75f73ed46a7437eb54451b8f177af74c9`.
- [Tho15: Automorphy lifting for residually reducible l-adic Galois representations](https://www.repository.cam.ac.uk/items/2796d161-598e-44da-83fd-2015c26f1dbc): Journal of the American Mathematical Society 28 (2015), 785–870; read in the author's accepted manuscript dated 16 April 2014 (Apollo, University of Cambridge repository). SHA-256 `76393fcb9a31931789fa4f7c6de9a64275fb02e81e5a3b98c53b8aa1a1834928`.
- [ANT20: Automorphy lifting for residually reducible l-adic Galois representations, II](https://arxiv.org/abs/1912.11269v2): Compositio Mathematica 156 (2020), 2399–2422; read in arXiv:1912.11269v2 (13 August 2020). SHA-256 `077a344352c80389ce75d5c61a69fba90413303aca911a616fe46dbeb8514bfa`.
- [NT23: Adjoint Selmer groups of automorphic Galois representations of unitary type](https://arxiv.org/abs/1912.11265v3): Journal of the European Mathematical Society 25 (2023), 1919–1967; read in arXiv:1912.11265v3 (30 June 2023), whose numbering is used here. SHA-256 `286597946a3efcac15b1f1d610370ca0cb52619b20954f3c5bd7f224c12bcf5f`.
- [NT21: Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/abs/1912.11261v3): Publications mathématiques de l'IHÉS 134 (2021), 1–116; read in arXiv:1912.11261v3 (27 September 2021). SHA-256 `6d50b558a6182a8d1515a6715529a33079807bf405c8db775e4ed252f5a2f379`.
- [NT21B: Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/abs/2009.07180v2): Publications mathématiques de l'IHÉS 134 (2021), 117–152; read in arXiv:2009.07180v2 (27 September 2021). SHA-256 `0f08214ebe03344c2e2851be76c49213dc4adf7928ff561610b674c423a2a6bf`.
- [NT26: Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/abs/2212.03595v2): Annals of Mathematics 203 (2026); read in arXiv:2212.03595v2. SHA-256 `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c`.
- [BCG25: Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/abs/2309.15944v3): Journal of the American Mathematical Society 38 (2025), 509–520; read in arXiv:2309.15944v3 (mathematically identical to the published text, as the extraction PAPER-BOXER-CALEGARI-GEE-25 records). SHA-256 `abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684`.
- [LTXZZ: Deformation of rigid conjugate self-dual Galois representations](https://arxiv.org/abs/2108.06998v1): Acta Mathematica Sinica, English Series 40 (2024); read in arXiv:2108.06998v1, the version cited by Liu et al., Invent. Math. 228 (2022). SHA-256 `fce1c9ae227dc1fcbc2fa712ae0034f7454b77595f63b927a7bdc7237f81292a`.
- [LLHLM23: Local models for Galois deformation rings and applications](https://arxiv.org/abs/2007.05398v2): Inventiones mathematicae 231 (2023), 1277–1488; read in arXiv:2007.05398v2. SHA-256 `3cdae0b192d3ba8d75391fbd2bf40264e23c9d9c69d536ad30b50dddda0d61af`.
- [CT14: On the symmetric power functoriality for holomorphic modular forms](https://www.dpmms.cam.ac.uk/~jat58/lrspi.pdf): Author manuscript lrspi.pdf; Lemma 2.6, PDF pp. 6–7. SHA-256 `f8609496aff7abb2858694331556a635a353a50a8280d5e05d507948d4aa24f7`.
- [GK14: The Breuil–Mézard conjecture for potentially Barsotti–Tate representations](https://arxiv.org/abs/1208.3179v5): arXiv:1208.3179v5 (12 June 2026); this version, not an unchecked version of record. SHA-256 `65cb5797bbe10e328843b5fdc73f2623c80e19fa89ceb72ce6cd296881eb68f9`.
- [Che14: The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings](https://arxiv.org/abs/0809.0415v2): arXiv:0809.0415v2 (18 July 2013). SHA-256 `f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953`.

Also read the [NT21 version of record](https://numdam.org/item/10.1007/s10240-021-00127-3.pdf), especially pp.77–80, and added its hash to `sourceVersions`. NT26's Annals article page identifies its publication, but the published PDF was not obtained: findings E1–E2 are confirmed only in arXiv v2. Ger19, BG19 and Tho24 were not obtained in the exact cited versions. The affected uses are `unverifiable` or explicit gaps; an application in another paper does not count as independent reading of those refinements.

## Corrections established in the sources

1. **Isobaric ordinarity.** CT14 Lemma 2.6 is a two-summand equivalence. Both shifted summands must be ordinary, and the infinity-type interleaving permutation must depend only on the place above l. Regularity does not force that compatibility. Replaced the original broader implication, its proof and acceptance criteria; added CT14 and corrected the roadmap target.
2. **Barsotti–Tate components.** GK14 Lemma 4.4.1 uses an ordinary split lift and a nonordinary split Lubin–Tate lift. It does not put an ordinary point on every component. Corrected the proof, recorded the exact finite-extension comparison missing from the Q_p-only supplier, and restricted this checked route to l>2 rather than claiming an unchecked p=2 argument.
3. **Twists and multiplier normalization.** It is finite inertia of the smooth Hecke character that can be killed, not inertia of an arbitrary algebraic l-adic character. Thorne's Hecke multiplier µ becomes the full multiplier ε^{1−n}µ in the PL.0 automorphy convention; corrected the minimal lifting conclusion and its reduction proof. Specified the integral seed ρ and µ in minimal finiteness.
4. **Hecke and Taylor–Wiles modules.** Added finite O-coefficient and hyperspecial inert-place conditions to the Hecke statement, and its constituent-Galois prerequisite. Thorne's polynomial cutout is not automatically an idempotent. Freeness and coinvariants use `pr S`, so inserted the cutout in those conclusions and the test, and requested the precise parahoric calculation. Added the missing Taylor–Wiles datum prerequisite; this exposes a PL.2→PL.3 order defect for the next revision. Level is a predicate in N, not a nonexistent largest integer when Q is empty.
5. **Polarized Schur theory.** Schur is a condition on a polarized 𝒢_n homomorphism. The former GL_n-only carrier did not imply semisimplicity. The determinant subring is closed, not merely `Algebra.adjoin`. Added odd-prime and invariant-local-condition assumptions for ANT's block-sign invariant/étale statements, and replaced the incorrect Cayley–Hamilton integrality shortcut by Thorne's actual constant-determinant/Schur argument. A nonzero unconstrained Ext class does not prove non-surjectivity with the chosen polarized local conditions; repaired that test.
6. **Two reducibility ideals.** `I_split` in the full deformation ring represents strictly split polarized lifts (Tho15 Proposition 3.32). `I_det^red` lies in the determinant subring and is the product of the partition ideals (ANT Proposition 2.5/Lemma 3.4), not an asserted intersection with an identification of schemes. Repaired the APIs/tests and prime criterion, and used the extended determinant ideal in the dimension bound.
7. **Residually reducible lifting.** Corrected “ρ trivial above l” to “ρ̄ trivial.” The proof uses `P→T`, with the extended kernel in every minimal prime of R; it does not produce a full `R→T` in this setting. The determinant point factors through T, then ordinary classicality and semisimplicity identify the Galois representations. Fixed the residual seed notation in the two-constituent theorem. Generic restriction uses Clifford induction and residual primitivity, not eigenvalue independence alone.
8. **Selmer and pseudodeformation comparisons.** WD is supplied by R01.2, while R01.5 supplies Chebotarev recognition. Rational restriction uses Hochschild–Serre/res-cor and needs no p∤degree assumption, including p=2. Added c-stable S, the multiplier character and its local semistability/weight conditions to the self-dual semistable determinant ring. Requested the WWE stable category, characteristic-zero bounded-denominator tangent comparison, enormous-image bounded-torsion prime detection and Brochard patching criterion separately.
9. **Rigidity.** LTXZZ §4.1 concerns the polarized symmetric power of the rank-two cohomology of an elliptic curve, not a symmetric power called an abelian variety. Supercuspidality gives irreducibility of the full Weil parameter; its inertia can be reducible. Corrected the proof to retain the Frobenius orbit and integral reduction argument.

No new paper error is inferred from these planning errors. The five original paper findings were separately adjudicated:

| Finding | Verdict | Scope / correction |
| --- | --- | --- |
| E1 | confirmed | NT26 arXiv v2 Definition 2.5(1) uses ι where its complex-valued character requires ι^{-1}; no claim about the unread version of record. |
| E2 | confirmed, narrowed | Proposition 6.1 in v2 cites BLGGT 1.4.1 for a result in 1.4.3(2). The additional asserted occurrence in Lemma 5.7 is absent from v2 and has been removed from the confirmed locator. |
| E3 | confirmed, known | Tho17 §7 explicitly repairs the component-group adequacy problem in Tho12; read its Propositions 7.1–7.2 and Corollary 7.3 independently. |
| E4 | confirmed as proof gap | NT21 Corollary 5.4 in preprint and version of record constructs a point allowing ramification at Σ; this proves the S∪Σ conclusion, not the stronger printed S-only conclusion. No counterexample to that stronger existence statement is established. Changed kind/affects accordingly. |
| E5 | confirmed as application gap | Topological finite generation of G_{F,S} is not established. Φ_p suffices for Noetherianity by Che14 Proposition 3.7/Example 3.6; Corollary 1.14 instead realizes the determinant and enables the finite-root proof. |

Each entry has its own review object, precise reason and version-limited locator.

## Baseline, ownership and closure

Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`. All three baseline declarations were opened at the Mathlib pin and retained:

| Declaration | Module | What it supplies |
| --- | --- | --- |
| `Ideal.minimalPrimes` | `Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean` | Minimal primes above an ideal, used for components. |
| `ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | Krull dimension, with its `WithBot ℕ∞` convention. |
| `IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean` | Local-ring structure only. |

No baseline citation was removed or replaced. These carriers do not themselves supply excellence, complete local deformation rings or arithmetic dimension formulas. The suggested connectedness quotient bound now also requires maximal-ideal adic completeness, as the source does. The packet cites no Tau declaration; it does not rely on a later Tau checkout for a baseline theorem.

Neither this new roadmap nor its parent has a coverage entry supplying the proposed polarized results. Relevant reviewed audits distinguish existing linear-algebra adjoints/symmetric powers, highest-weight representations and basic continuous cohomology operations from the missing arithmetic carriers/comparisons. These existing generic constructions are not re-planned as arithmetic nodes here. AF.4/AF.5 remain owners of generic coefficients/forms; the present nodes are their definite-unitary specializations. IHG owns determinants/Cayley–Hamilton theory; LocalGaloisDeformationRings owns local quotients; DeformationAndDerivedPatchingAlgebra owns abstract patching. Grunwald–Wang existence is now routed to IG.4 separately from upstream global class field correspondence. No upstream files or audits were edited.

The original external nodes were checked for hypothesis fit. Specific failures are recorded rather than concealed by broad stage names: Q_p-only rank-two BT components, odd-prime polarized deformation presentations used at p=2, residually absolutely irreducible Carayol used at a reducible residual point, and residual-enormous Taylor–Wiles statements used for characteristic-zero enormous image. Division-algebra inner forms at S(B) were also absent from the matrix-form construction. New/extended requests state exactly these variants and their consumers. Readable target statements can still depend on unread Ger19/BG19/Tho24 refinements.

There is no internal node cycle after adding the missing datum edge. Layer order is still defective: PL.2 Taylor–Wiles levels consume the PL.3 datum. Move the datum before its consumer in the revision and reconcile IDs/references/reader without inducing a stage cycle. The four proposed nonpolarized directions in `restructure` remain proposals, not created roadmaps; the Dwork owner in particular is still missing. This review neither duplicates nor promotes them.

## Suggested Lean and tests

The original “templates” omitted their essential arithmetic identities/hypotheses. Lean interprets them as universal assertions despite a contrary comment. Examples showing the issue:

- A surjection ℤ→ℤ/2 has nonnilpotent kernel, refuting the former universal minimal/ordinary R=T kernel claims.
- A noetherian local k-algebra k⟦X⟧ is not finite over k, refuting the former arbitrary-ring finiteness claims.
- An empty place type cannot contain a Taylor–Wiles set of cardinality one.
- Taking a localization map to be the identity and every local condition to be the whole vector space makes the abstract Selmer kernel the whole space, not zero.
- The one-dimensional sign representation of C₂ over ℚ has no nonzero vector fixed by its nonidentity element, yet is not free over ℚ[C₂]. Thus the former `tw_free` condition was insufficient.
- Swapping the two characters and flags of a diagonal representation refutes the generic ordinary-weight uniqueness assertion without ordered Hodge weights.
- A basis-dependent off-diagonal-product ideal cannot characterize irreducibility: a coordinate-swap matrix is diagonalizable over ℚ, but its off-diagonal product is a unit in the original basis.

Removed the final arithmetic-template namespace and the false substitute automorphy, unpolarized Schur, unclosed pseudodeformation, basis-dependent reducibility and Prop-valued rigidity sections. Removed the ordinary uniqueness and `tw_free` assertions; corrected level, positive-rank dichotomy, complete-ring assumption and the dependent (1+T,1) genericity comment. Retained valid generic helpers and models, with a header stating their limited scope. The complete required-name inventory lists all 86 nodes, 137 API names and 96 examples; an inventory comment is not a signature.

Every definition/construction still has at least three mathematical packet tests. However several draft examples merely test a weaker carrier fact: Hecke-generator membership replaces a Frobenius characteristic polynomial; subgroup containment replaces coinvariants; assuming a diagonal point replaces the Fontaine–Laffaille criterion; assuming independence replaces a power-series calculation. These do not satisfy protocol §13. The arithmetic-signature gap applies to every node and explicitly names these examples. The revision must supply faithful statements, not add hypotheses equal to the desired conclusions.

## Per-node decisions

Stage/node suffixes below abbreviate the full `{pid}:` IDs. Notes are also stored in the packet's review object.

| Node | Verdict | Independent result / remaining requirement |
| --- | --- | --- |
| PL.0/ordinary-of-weight | unverifiable | Arithmetic weight and HT conventions agree with Tho15/BLGGT; sorted-weight uniqueness is valid. The removed generic uniqueness example lacked ordering; exact local Artin/HT carriers and the Tate/supersingular examples remain pending. |
| PL.0/iota-ordinary | unverifiable | Compared both U-operator and principal-series formulations with Tho15 Lemma 2.3. The generic inverse-image module does not supply smooth induction, integral U lattices or the slopes; the new ordinary-action gap records this. |
| PL.0/automorphic-polarized-representation | corrected | The full multiplier is ε^{1−n}r(χ). Removed AutomorphyData with arbitrary Prop-valued level/ordinarity fields; the actual automorphic carrier, API and arithmetic examples are pending. |
| PL.0/iota-ordinary-implies-ordinary | unverifiable | Tho15 Corollary 2.6 and BLGGT ordinary comparison read. Exact local principal-series comparison is still a requested input, and the removed template had no such assumptions. |
| PL.0/ordinary-implies-iota-ordinary | corrected | Retain BLGGT potentially-prime-to-l level hypothesis; added soluble-descent prerequisite. Ger19 Lemma 5.9 without it was not obtained, so that variant remains open. |
| PL.0/steinberg-weight-zero-iota-ordinary | unverifiable | NT26 Lemma 2.6 gives this restricted weight-zero Steinberg criterion. Its U-eigenvalue calculation is not realized by the removed arbitrary-module template. |
| PL.0/isobaric-sum-iota-ordinary | corrected | Replaced the false sufficient-condition statement by CT14 Lemma 2.6: shifted summands ordinary and a single infinity-type ordering at each coefficient-prime place; added the primary source and necessity proof. |
| PL.0/automorphy-under-twist | corrected | Corrected the proof to trivialize finite inertia of the smooth Hecke local component, not the algebraic l-adic character. Cyclotomic inertia cannot be killed by finite extension. |
| PL.0/soluble-descent | corrected | BLGGT Lemma 2.2.2 keeps irreducibility after restriction. Added the missing semisimple Chebotarev-recognition supplier; soluble descent and its exact carrier remain pending in Lean. |
| PL.0/induction-descent | corrected | BLGGT Lemmas 2.2.3–2.2.4 use the archimedean parameter comparison, automorphic induction and Galois recognition. Added continuous induction and recognition requests rather than assuming an arbitrary ring map. |
| PL.0/auxiliary-cm-extensions | corrected | Checked A.2.1–A.2.3, including the alternative hypotheses rather than inheriting all conditions of the first part. Split class field correspondence from Grunwald–Wang existence, owned by IG.4. |
| PL.0/auxiliary-characters | corrected | Checked the parity and algebraic-character conditions of BLGGT A.2.5; routed prescribed finite local components to IG.4 with the exceptional 2-power case explicit. Its exact character signatures remain pending. |
| PL.1/connects-relation | corrected | The minimal-prime carrier models common-component connection. Corrected the WD test to compare underlying Weil inertia, not monodromy under ∼ alone. Actual lifting rings/Hodge-type quotients and that test remain pending. |
| PL.1/connects-properties | unverifiable | Checked conjugacy, restriction and strong-connection consequences in BLGGT §§1.3–1.4; the H⁰ adjoint condition uses local duality. The named arithmetic theorem signatures were not supplied by the generic component model. |
| PL.1/generic-smooth-points | unverifiable | BLGGT Lemma 1.3.2 uses generic LLC and local duality to identify the smooth locus; density is a deformation-ring theorem, not a statement about every arbitrary spectrum. Those arithmetic signatures remain pending. |
| PL.1/potentially-diagonalizable | corrected | The local definition and lattice-independence assertion agree with BLGGT 1.4.1. Corrected the global-usage locator and removed its Prop-field automorphy substitute; exact crystalline character and global automorphic signatures remain pending. |
| PL.1/pd-criteria | unverifiable | BLGGT Lemma 1.4.3 requires potential crystallinity for the ordinary criterion and the stated Fontaine–Laffaille weight range. The generic example previously just assumed the existence of a diagonal point, so the arithmetic tests remain pending. |
| PL.1/potentially-barsotti-tate-diagonalizable | corrected | Corrected the proof using both ordinary and nonordinary split lifts in GK14 Lemma 4.4.1; restricted this checked route to l>2. The arbitrary-local-field finite-extension comparison is now a precise R08.4 request. |
| PL.1/pd-operations | unverifiable | BLGGT local component operations support restriction, sums, tensors and symmetric powers under the stated hypotheses. Exact arithmetic operations and crystalline characters are absent from the draft; no universal ring-map template remains. |
| PL.2/definite-unitary-group | corrected | The matrix-form construction matches Tho12 §6. Recorded the missing division-algebra inner forms at S(B) needed downstream; the generic hermitian matrix group only models the matrix case. |
| PL.2/unitary-algebraic-modular-forms | unverifiable | AF.5 owns the generic equivariant-function construction. The specialization needs integral highest-weight coefficients and a coefficient action on a Hecke semigroup; these are explicit gaps rather than inferred from a bare U-action. |
| PL.2/unitary-hecke-algebra | corrected | Restricted finiteness to finite O-coefficients, added hyperspecial inert places and the constituent-Galois prerequisite. The generic Hecke operator lacks the semigroup extension; its membership test is not the Frobenius-polynomial test. |
| PL.2/exactness-and-freeness | unverifiable | Tho12 Lemmas 6.3–6.4 need prime-to-l arithmetic stabilizers and the precise level quotient. Fixed-vector conditions on an arbitrary linear action do not replace the free action on the finite arithmetic double-coset set. |
| PL.2/unitary-constituent-galois-representation | unverifiable | Checked Tho12 Theorem 6.5: semisimple Galois representations use regular algebraic isobaric base change through ET.7a and AG2.2, not a blanket cuspidality assertion. Exact automorphic carriers remain pending. |
| PL.2/hecke-valued-galois-representation | unverifiable | Tho12 Propositions 6.6–6.7 require a non-Eisenstein maximal ideal and determinant/Carayol input. This residually irreducible R→T map cannot be reused for the residually reducible P→T argument. |
| PL.2/unitary-base-change-and-descent | unverifiable | Compared the ET.7a statement and the source applications. Matrix and division-inner-form transfers must be separated; generic Hida arithmetic point classicality remains unverified in Ger19. |
| PL.2/iwahori-ordinary-parts | corrected | Generic Fitting projections are distinct from factorial-power limits on finite coefficient quotients. Corrected that Lean description; the imported PadicFamilies finite-module projector does not by itself supply the integral inverse-limit ordinary theory. |
| PL.2/big-ordinary-hecke-algebra | unverifiable | The inverse-limit ring model is sound as a carrier. Ger19 control, coefficient finiteness, continuity and arithmetic Λ-structure are not supplied by an arbitrary tower of rings; these remain an explicit gap. |
| PL.2/ordinary-forms-free-over-lambda | unverifiable | Read Tho12 Proposition 8.2 and NT21 Proposition 6.5. Their level/smallness/control hypotheses do not follow from arbitrary inverse limits, and exact Ger19 control has not been independently obtained. |
| PL.2/hida-classicality | unverifiable | An arithmetic specialization needs the finite-order isotypic quotient at its character, not the whole level space with only algebraic weight specified. Ger19 precise control statement remains unread; do not accept the full-space identification. |
| PL.2/ordinary-hecke-galois-representation | unverifiable | Tho12 Propositions 8.4–8.5 require the ordinary Hecke and local ordinary flag constructions. The present generic ring tower does not give their arithmetic compatibility or exact specialization. |
| PL.2/taylor-wiles-level-structures | corrected | Corrected polynomial cutout versus idempotent and inserted pr on the free module/coinvariant test. Removed false tw_free based on fixed vectors, added the actual datum prerequisite and precise parahoric module request; stage order remains open. |
| PL.3/thorne-taylor-wiles-datum | corrected | Level is now a predicate in N, with every level for empty Q. The retained complementary-subspace model omits nonzero Frobenius eigenspaces, unramifiedness and fixed residual reduction; its exact datum/API/tests remain pending. |
| PL.3/adequate-taylor-wiles-primes | unverifiable | Compared Tho12 Proposition 4.4 and the corrected Tho17 Proposition 7.1, including component-group adequacy. Existence is arithmetic; the removed template on arbitrary place types was false for an empty place type. |
| PL.3/taylor-wiles-primes-two-adic | unverifiable | Tho17 Proposition 2.21 read; the supplier polarized presentation currently assumes an odd prime. Added the p=2 tangent/sign request; no theorem on arbitrary place types is retained. |
| PL.3/minimal-r-equals-t | unverifiable | Tho12 Theorem 6.8 is a component-supported patching theorem. Removed the universal surjective-ring-map nilpotent-kernel assertion; its polarized deformation, local component and patching signatures are still missing. |
| PL.3/ordinary-r-equals-t | unverifiable | Tho12 Theorem 8.6 uses ordinary local rings, Λ-control, Taylor–Wiles modules and patching. An arbitrary surjective algebra map does not have nilpotent kernel; that template was removed. |
| PL.3/revised-adequacy-r-equals-t | unverifiable | Tho17 Proposition 7.2 supplies the corrected adequate-image hypotheses to the Tho12 minimal/ordinary arguments. The exact component-supported R=T signatures still need the requested patching and Hecke carriers. |
| PL.4/minimal-automorphy-lifting | corrected | Corrected Thorne Hecke multiplier µ versus the PL.0 full multiplier ε^{1−n}µ in the conclusion and reduction proof. Retained the BLGGT full-multiplier formulation separately. |
| PL.4/strongly-residually-odd | corrected | Added positive m to the even-rank congruence dichotomy: at rank zero the two forms coincide and Xor is false. Actual 𝒢_n lifts and p=2 polarization/sign API remain pending. |
| PL.4/two-adic-automorphy-lifting | unverifiable | Read Tho17 Theorem 5.1, including strong residual oddness and the local component hypotheses. The odd-prime G7 presentation cannot supply the 2-adic argument; the new request names the missing calculation. |
| PL.4/relaxed-adequacy | unverifiable | BCG25 proof of Theorem 3.1 itself leaves the remaining adequacy uses in Tho17 Theorem 5.1 to be checked. This is a recorded unverified argument, not a verified generic relaxation theorem. |
| PL.4/ordinary-automorphy-lifting | unverifiable | BLGGT Theorem 2.4.1 includes CM and totally real cases, regular labelled weights, adequacy and the ordinary automorphic seed. These hypotheses were absent from the removed arbitrary deformation-ring template. |
| PL.4/minimal-finiteness | corrected | Specified the previously undefined integral ρ=r_{l,ι}(π) and µ=r_{l,ι}(χ). Components through the seed and its unique-component condition remain essential; finiteness does not hold for every local noetherian O-algebra. |
| PL.4/ordinary-finiteness | unverifiable | Tho12 Theorem 10.2/BLGGT 2.4.2 use ordinary local quotients and an ordinary automorphic seed. The source theorem is not a finiteness theorem for arbitrary Λ-algebras; exact signatures are pending. |
| PL.4/characteristic-zero-lifts | corrected | Added nonempty chosen local components and their reduced l-torsion-free closures. Algebraic point extraction must also establish continuity in the complete local deformation category; recorded that remaining supplier requirement. |
| PL.5/dwork-potential-ordinary-automorphy | unverifiable | Checked BLGGT Theorem 3.1.2, including rank parity and residual hypotheses. The Dwork family/monodromy gap already existed; added the prescribed-Steinberg local refinement consumed by NT21 Theorem 5.2. |
| PL.5/ordinary-lifts-prescribed-local | unverifiable | BLGGT Proposition 3.2.1 keeps the multiplier and prescribed local lift conditions, with the chosen Hodge weights. It depends on Dwork ordinary automorphy and continuous characteristic-zero point extraction, both now explicitly open. |
| PL.5/tensor-product-trick-lifting | unverifiable | BLGGT Proposition 4.1.1 uses auxiliary characters with separated weights, tensor recognition and ordinary lifting. Exact arithmetic tensor/induction APIs and the Dwork route remain pending. |
| PL.5/pd-automorphy-lifting | unverifiable | BLGGT Theorem 4.2.1 uses potential diagonalizability, irreducibility on G_{F(ζ_l)}, the l≥2(d+1) bound and an ordinary or PD automorphic seed. All must occur in an arithmetic signature; the arbitrary map template was removed. |
| PL.6/schur-residual-representation | corrected | Tho15 Definition 3.2 is for a polarized 𝒢_n-homomorphism, not an unpolarized GL_n map. Removed the latter carrier and its invalid semisimplicity API; exact polarized signatures are pending. |
| PL.6/primitive-representation | unverifiable | Checked finite-index continuous induction and the system-of-imprimitivity equivalence. The generic representation predicate models it, but the arithmetic continuous-induction supplier and exact examples remain pending. |
| PL.6/character-sums-primitive | unverifiable | NT21 Lemma 5.1 uses pairwise ratio order >n. The source and generic imprimitivity argument match, but exact continuous-character arithmetic signatures are not supplied by the former templates. |
| PL.6/connectedness-dimension | corrected | Added maximal-ideal adic completeness to the quotient bound. Checked minimal-prime partitions, arithmetic rank and concrete crossing-component tests against Tho15 §1; generic dimension statements do not supply excellent deformation rings. |
| PL.6/polarized-pseudodeformation-subring | corrected | Corrected Schur finiteness proof, added odd-prime/invariant-local-condition hypotheses, identified the polarized block-sign centralizer and fixed the Ext non-example. Removed the unclosed Algebra.adjoin substitute. |
| PL.6/pseudodeformation-restriction-finite | corrected | Separated Φ_p Noetherianity (Che14 Proposition 3.7) from determinant realization (Corollary 1.14) and supplied the finite-root argument. Added the primary source; it does not require unknown topological finite generation of G_{F,S}. |
| PL.6/reducibility-ideal | corrected | Separated I_split⊂R from I_det^red⊂P, the product of partition ideals, and repaired API/tests and the prime criterion. The source gives no equality of these schemes; removed the basis-dependent block-product model. |
| PL.6/reducible-locus-dimension | corrected | The dimension bound now uses I_det^red A, with ANT20 Lemma 3.5 giving a split realization after passing to the appropriate prime. It does not assume the original universal lift splits. |
| PL.6/generic-prime | corrected | The arithmetic generic-prime definition matches ANT20. Corrected the Lean comment: (1+T,1) is dependent, whereas the packet uses (1+T₁,1+T₂). The retained example assumes independence instead of proving the power-series test. |
| PL.6/large-quotients-contain-generic-primes | unverifiable | Tho15 Lemma 1.9 uses a complete noetherian local equal-characteristic algebra over a finite field and the countable bad-locus family; an arbitrary mixed-characteristic ring is insufficient. Its arithmetic signature remains pending. |
| PL.6/genericity-under-restriction | corrected | Corrected the proof: multiplicity-free restriction plus Clifford induction would make the residual semisimplification induced, contradicting primitivity. Independent eigenvalues alone do not contradict induction. |
| PL.6/reducible-twisting-and-base-change | unverifiable | Tho15 §4.6/ANT20 good-extension arguments require ordinary inner-form classicality and local-control conditions, beyond matrix-form base change. These exact signatures and inputs remain open. |
| PL.6/generic-prime-r-equals-t | unverifiable | Tho15 Theorem 4.19 and ANT20 Theorem 4.1 compare the determinant subring P to T at generic primes. Division-inner-form and generic-prime patching inputs remain missing; no full residually reducible R→T assertion is accepted. |
| PL.7/ordinary-steinberg-finiteness | corrected | Corrected r to r̄ in the p-adic triviality hypothesis. ANT20 Theorem 6.2 is the read base theorem; the Tho24 Theorem 7.5 refinement used by NT26 remains explicitly unread. |
| PL.7/residually-reducible-automorphy-lifting | corrected | Corrected residual triviality and the proof to P→T with JR in every minimal prime; the point factors on determinants, then classicality and semisimplicity give the Galois representation. No full R→T is asserted. |
| PL.7/two-constituent-automorphy-lifting | corrected | Corrected the seed to r̄_ι(π)^ss≅ρ̄^ss. Tho15 Theorem 7.1 also needs potential automorphy of the constituents; its exact residual and local hypotheses remain in the prose. |
| PL.7/sum-of-characters-finiteness | unverifiable | NT21 Theorem 5.2 needs the Dwork construction with Steinberg conditions at Σ; this refinement is not supplied by the recorded BLGGT theorem. Its dimension/prime argument is source-backed but that input remains open. |
| PL.7/ordinary-lifts-every-weight | unverifiable | The packet already uses S∪Σ, the ramification set proved by the source construction. E4 is a proof gap in the stronger printed S-only conclusion; the arithmetic lifting signatures remain pending. |
| PL.7/unrestricted-ring-dimension-bound | unverifiable | NT21 Corollary 5.5 is conditional on its Schur lift and local Hodge/Steinberg deformation setup. BG19 Schur-lift input and exact dimension/presentation signatures remain open. |
| PL.7/reducible-locus-small | unverifiable | NT21 Proposition 5.6 applies to its finite-Λ quotient and determinant reducibility ideal; keep the source local-degree/Steinberg constraints. Exact quotient and determinant carriers remain pending. |
| PL.7/generic-primes-large-quotients | unverifiable | NT21 Theorem 5.7 uses the specified characteristic-l large quotient and countable bad loci. It is not a statement for every quotient of every noetherian ring; exact arithmetic signatures remain pending. |
| PL.7/global-lifts-schur | unverifiable | The source application invokes BG19 Corollary 5.1.1, not obtained here in its Schur generality. An absolutely irreducible residual lifting theorem is not a substitute; recorded the exact unread input. |
| PL.7/prescribed-type-lifts | unverifiable | NT21 Proposition 5.8 combines ordinary/Steinberg conditions and the Schur lift dimension theorem. The latter relies on unread BG19, so this proof is not closed despite its readable target statement. |
| PL.8/generic-weil-deligne | corrected | Corrected the carrier supplier from R01.5 (Chebotarev recognition) to R01.2 (WD). The generic Hom-to-Tate-twist condition matches NT23 Definition 1.1; actual local/global compatibility remains imported. |
| PL.8/bloch-kato-at-generic-places | unverifiable | The generic WD/semistable criterion is NT23 §1 with the stated de Rham conditions at p. H¹_f/H¹_g and local duality suppliers are needed; abstract unrelated subspaces cannot encode it. |
| PL.8/adjoint-bloch-kato-selmer-group | corrected | Replaced Shapiro and p>2 by Hochschild–Serre/res-cor over characteristic-zero E, including p=2. The generic kernel model is only a carrier; integral torsion comparison needs separate hypotheses. |
| PL.8/semistable-pseudodeformation-ring | corrected | Added c-stable S, the character χ, its semistability/weight and residual self-duality conditions. The framed-height quotient does not supply the WWE stable finite Cayley–Hamilton category, now precisely requested. |
| PL.8/pseudodeformation-tangent-comparison | corrected | NT23 Proposition 2.7 is a bounded-denominator comparison at a characteristic-zero absolutely irreducible point with possibly reducible residue. Added the exact IHG.1 request rather than citing residually irreducible Carayol alone. |
| PL.8/adjoint-selmer-vanishing | corrected | Removed p∤degree for rational restriction, and requested characteristic-zero enormous-prime torsion bounds and Brochard patching. Removed the false universal kernel-is-zero assertion on arbitrary localization maps. |
| PL.8/pseudodeformation-ring-regular-at-automorphic-point | corrected | NT21B Theorem 2.1 uses the characteristic-zero tangent comparison and NT23 vanishing, not a generic tangent-space isomorphism for arbitrary rings. Added the missing IHG/Brochard supplier variants. |
| PL.8/ordinary-tangent-vectors-h1g | unverifiable | The ordinary tangent inclusion depends on actual semistable/ordinary local representations. The former abstract statement only assumed an inclusion; it did not prove the arithmetic comparison in NT21 §2.18.1. |
| PL.9/rigid-residual-representation | corrected | Removed arbitrary Prop-valued local-condition arguments from the rigidity model and added its planet. Actual minimal, Fontaine–Laffaille and unramified predicates and eigenvalue condition require supplier carriers. |
| PL.9/rigid-r-equals-t | unverifiable | LTXZZ Theorem 3.6.3 needs rigid local conditions, integral Shimura cohomology (or the definite-module case) and Taylor–Wiles patching. Those are not represented by a generic surjection with zero kernel. |
| PL.9/rigidity-for-almost-all-primes | corrected | Corrected the object to the polarized symmetric power of H¹ of an elliptic curve, not an abelian variety called a symmetric power. Replaced irreducible inertia by the full irreducible Weil parameter and the Frobenius-orbit argument. |
| PL.9/generic-local-domain-lifting | unverifiable | LLHLM Theorem 9.2.1 requires its local genericity, residual and automorphic weight/type hypotheses. Exact away-from-p component matching and the domain-to-automorphy proof remain supplier-dependent, not an arbitrary domain theorem. |
| PL.9/generic-change-of-weight-lifting | unverifiable | The relaxed weight matching requires LLHLM Theorem 9.1.6 (generic Serre weights), already recorded as a missing owner/input. It remains conditional and has no faithful arithmetic signature. |

## Complete change inventory

Beyond the established corrections above, changed the packet summary/status, all ten coverage records, all five source-issue review records (including their corrected scope), source/source-version metadata, supplier requests and consuming prerequisites. Added eight planets: Taylor–Wiles datum and prime existence, minimal and ordinary R=T, Schur representation, connectedness dimension, determinant reducibility ideal, and rigid residual representation. There are at most six planets per layer and every name is at most sixty characters. Updated roadmap targets/boundaries and external supplier metadata; retained its parent, area and PL.0–PL.9 scope. All source citation locators were made version-explicit as described above. Added this report and the mandatory handoff.

The following table records every node field changed relative to the original, including locator-only changes. JSON field paths are descriptive, not new declarations. Global field changes and Lean removals are recorded above.

| Node | Changed fields |
| --- | --- |
| PL.0/ordinary-of-weight | sources |
| PL.0/iota-ordinary | sources |
| PL.0/automorphic-polarized-representation | sources |
| PL.0/iota-ordinary-implies-ordinary | sources |
| PL.0/ordinary-implies-iota-ordinary | prerequisites, sources |
| PL.0/steinberg-weight-zero-iota-ordinary | sources |
| PL.0/isobaric-sum-iota-ordinary | acceptance, hypotheses, proofSteps, sources, statement, title |
| PL.0/automorphy-under-twist | proofSteps, sources |
| PL.0/soluble-descent | prerequisites, sources |
| PL.0/induction-descent | prerequisites, sources |
| PL.0/auxiliary-cm-extensions | prerequisites, sources |
| PL.0/auxiliary-characters | prerequisites, sources |
| PL.1/connects-relation | sources, tests |
| PL.1/connects-properties | sources |
| PL.1/generic-smooth-points | sources |
| PL.1/potentially-diagonalizable | sources |
| PL.1/pd-criteria | sources |
| PL.1/potentially-barsotti-tate-diagonalizable | hypotheses, prerequisites, proofSteps, sources, statement |
| PL.1/pd-operations | sources |
| PL.2/definite-unitary-group | sources |
| PL.2/unitary-algebraic-modular-forms | sources |
| PL.2/unitary-hecke-algebra | hypotheses, prerequisites, sources, statement |
| PL.2/exactness-and-freeness | sources |
| PL.2/unitary-constituent-galois-representation | sources |
| PL.2/hecke-valued-galois-representation | sources |
| PL.2/unitary-base-change-and-descent | sources |
| PL.2/iwahori-ordinary-parts | sources |
| PL.2/big-ordinary-hecke-algebra | sources |
| PL.2/ordinary-forms-free-over-lambda | sources |
| PL.2/hida-classicality | sources |
| PL.2/ordinary-hecke-galois-representation | sources |
| PL.2/taylor-wiles-level-structures | api, prerequisites, sources, statement, tests |
| PL.3/thorne-taylor-wiles-datum | api, planet, sources, tests |
| PL.3/adequate-taylor-wiles-primes | planet, sources |
| PL.3/taylor-wiles-primes-two-adic | prerequisites, sources |
| PL.3/minimal-r-equals-t | planet, sources |
| PL.3/ordinary-r-equals-t | planet, sources |
| PL.3/revised-adequacy-r-equals-t | sources |
| PL.4/minimal-automorphy-lifting | proofSteps, sources, statement |
| PL.4/strongly-residually-odd | sources |
| PL.4/two-adic-automorphy-lifting | prerequisites, sources |
| PL.4/relaxed-adequacy | sources |
| PL.4/ordinary-automorphy-lifting | sources |
| PL.4/minimal-finiteness | sources, statement |
| PL.4/ordinary-finiteness | sources |
| PL.4/characteristic-zero-lifts | hypotheses, sources |
| PL.5/dwork-potential-ordinary-automorphy | sources |
| PL.5/ordinary-lifts-prescribed-local | sources |
| PL.5/tensor-product-trick-lifting | sources |
| PL.5/pd-automorphy-lifting | sources |
| PL.6/schur-residual-representation | planet, sources |
| PL.6/primitive-representation | sources |
| PL.6/character-sums-primitive | sources |
| PL.6/connectedness-dimension | planet, sources |
| PL.6/polarized-pseudodeformation-subring | hypotheses, proofSteps, sources, statement, tests |
| PL.6/pseudodeformation-restriction-finite | proofSteps, sources |
| PL.6/reducibility-ideal | api, planet, proofSteps, sources, statement, tests, title |
| PL.6/reducible-locus-dimension | sources, statement |
| PL.6/generic-prime | sources |
| PL.6/large-quotients-contain-generic-primes | sources |
| PL.6/genericity-under-restriction | proofSteps, sources |
| PL.6/reducible-twisting-and-base-change | sources |
| PL.6/generic-prime-r-equals-t | prerequisites, sources |
| PL.7/ordinary-steinberg-finiteness | prerequisites, sources, statement |
| PL.7/residually-reducible-automorphy-lifting | proofSteps, sources |
| PL.7/two-constituent-automorphy-lifting | sources, statement |
| PL.7/sum-of-characters-finiteness | sources |
| PL.7/ordinary-lifts-every-weight | sources |
| PL.7/unrestricted-ring-dimension-bound | sources |
| PL.7/reducible-locus-small | sources |
| PL.7/generic-primes-large-quotients | sources |
| PL.7/global-lifts-schur | sources |
| PL.7/prescribed-type-lifts | sources |
| PL.8/generic-weil-deligne | prerequisites, sources |
| PL.8/bloch-kato-at-generic-places | sources |
| PL.8/adjoint-bloch-kato-selmer-group | prerequisites, proofSteps, sources |
| PL.8/semistable-pseudodeformation-ring | hypotheses, prerequisites, sources, statement |
| PL.8/pseudodeformation-tangent-comparison | prerequisites, sources |
| PL.8/adjoint-selmer-vanishing | prerequisites, proofSteps, sources |
| PL.8/pseudodeformation-ring-regular-at-automorphic-point | prerequisites, sources |
| PL.8/ordinary-tangent-vectors-h1g | sources |
| PL.9/rigid-residual-representation | planet, sources |
| PL.9/rigid-r-equals-t | sources |
| PL.9/rigidity-for-almost-all-primes | acceptance, proofSteps, sources, statement |
| PL.9/generic-local-domain-lifting | sources |
| PL.9/generic-change-of-weight-lifting | sources |

## Validation and revision routing

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructurePartII.json`: zero errors and zero warnings, including the internal prerequisite DAG and planet limits.
- `lean-check research/blueprint/suggested/PotentialAutomorphyInfrastructurePartII.lean`: the revised partial draft elaborates at the pinned Mathlib; only “declaration uses sorry” warnings. The first check found a removed shared irreducibility helper; it was restored and the second check exited zero. No language server or Lake build/update/cache command was run.
- Independent excerpt/hash verification: all 168 citations and all 15 source PDF hashes pass. All 86 node IDs are present exactly once in the review; every source issue has its independent verdict; JSON and allowed-file checks pass.
- Compilation establishes syntax/type correctness of the retained draft only. It establishes no theorem and does not discharge the recorded packet/signature mismatch.

The orchestrator should issue the design revision with **the reader added to its allowed deliverables**, alongside the roadmap, packet and suggested Lean file. It must reconcile the corrected statements and five source findings, repair the layer order, obtain the unread refinements, resolve or precisely route the per-stage inputs, and replace the partial prototypes with faithful signatures/APIs/examples. This finished review requires no further claim in this run. Do not promote the packet or its planets before a later independent acceptance.
