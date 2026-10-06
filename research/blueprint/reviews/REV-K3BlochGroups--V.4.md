# REV-K3BlochGroups--V.4

**Accepted after corrections.** Independent reviewer: Codex, session
`codex-bIstYN`; issue [#6399](https://github.com/CBirkbeck/tauceti-explorer/issues/6399).
Date: 2026-10-06. The original pass was written by session `codex-n9gXQ0`.
This is a finished target-level review. The packet remains a complete planning
pass, V.4 remains planned with explicit remaining work, and every
implementation status remains unchecked.

I read the packet, suggested file, reader, original handoff, accepted parent,
binding protocols and the complete upstream AlgebraicTopology and
RepresentationTheory/InductionRestriction documents. I checked each new
node's statement, source passage, proof route and direct prerequisites, the
supplier contracts, all baseline citations, construction APIs and tests,
coverage and the reviewed library audit. Seven closure gaps are retained;
acceptance does not certify their proofs or mark the stage closed.

| Item | Before | Reviewed |
| --- | ---: | ---: |
| Nodes | 16 | 16 |
| Theorems / constructions | 11 / 5 | 11 / 5 |
| API items | 25 | 32 |
| Named unit tests | 17 | 19 |
| Baseline declarations | 17 | 18 |
| Imported parent V.4 targets | 36 | 36 |
| Gaps / requests | 7 / 6 | 7 / 6 |
| Source issues with independent verdicts | 2 | 5 confirmed |
| New planets | 0 | 0 |
| Node verdicts | none | 5 verified, 11 corrected |

No nodes were added, deleted or split. At target level the simultaneous
assertions in Suslin's Theorem 3.4 belong together. The five constructions
have respectively 5, 4, 3, 3 and 4 discriminating tests. The inherited layer
already has six planets: projective configurations, cross-ratio, the two
Bloch maps, the enhanced torsion term and the Suslin sequence. The supplement
correctly introduces no additional planets.

## Corrections

1. Corrected the suggested finite-coefficient Hurewicz direction. It goes
   from K₄(Ω;Z/m) to H₄(SL(Ω);Z/m). The homology square separately maps
   H₄(µ;Z/m) through monomial/SL homology to Chern evaluation. The suggested
   signature now retains both that square and the Chern factorization and
   K-theory Bockstein equalities. It creates no reverse Hurewicz map.
2. Narrowed the Bott-product proof to odd moduli or moduli divisible by 8.
   KVI Lemma 5.19 invokes a product rule for m≢2 mod4, but KV11.3.2 explicitly
   supplies it only for odd m or 8|m. The missing special mod4 justification
   is recorded as a source gap. The chosen range suffices: every finite
   2-primary order lies in a level 2ʳ with r≥3. In particular m=8 detects
   order-two torsion. The cyclic Chern evaluation itself retains every
   invertible m, including 2 and 4. Updated the statement, hypotheses,
   acceptance check, proof routes, L.2/M.7 requests and coverage text.
3. Added the lower-block affine action API for independent frames, its basis
   formula and identity/composition laws. The m=0 representation now has a
   common underlying chain equivalence identifying both the differential and
   GL action. A shear test catches an action that forgets the lower block.
4. Added the frame algebra's unit, two unit laws, multiplication by e=⟨1,1⟩
   and its formula. Typed the normalized S₂ equivalence, the internal
   Milnor/e-image sum and zero intersection, positive-degree product
   generation, and the e-injectivity clause. The last clause belongs to the
   simultaneous spectral-sequence induction, not to the earlier splitting.
5. Restored `Infinite F` on the connecting map and Milnor homology map
   construction signatures. Added the prime-field condition to scalar
   homology using the existing prime-subfield closure predicate. These
   hypotheses can already be stated at the baseline.
6. Replaced the weight-two test's assumed homology answer with the actual
   power-two group homomorphism on C₇ and the existing `groupHomology.map`
   with identity coefficients. Added a separate ordinary-tensor-zero test
   for divisible torsion roots. Normalized five test kinds from `value` to
   `computation` and one from `relation` to `characterisation`.
7. Clarified that applying torus generation to ψ is a subsequent use, not a
   prerequisite of generation. This avoids suggesting a circular proof.
8. Corrected declaration-kind metadata for `Rep` and `SpectralSequence`
   (structures), and `Rep.trivial` and `groupHomology.map` (abbreviations).
   No baseline citation was removed or replaced. Added `Subfield.closure`.
9. Added independent verdicts to both original source issues and three
   additional findings. Recorded Chapter IV and the dated full author copy
   used for checking the product cross-reference and source collation.

The suggested file still interprets future Milnor, block-inclusion,
cross-ratio, frame-spectral-sequence and early Chern objects as supplier
parameters. Protocol §13 permits leaving out conditions whose supplier syntax
is unavailable. These prototypes do not assert results for arbitrary maps.
They use existing homology, representations, complexes and quotient types;
there are no invented proposition-valued models or claims of implementation.
Frame convergence and supplier-specific normalizations remain in the
mathematical packet and its explicit gaps.

## Node checks

Ids below omit the common `K3BlochGroups:V.4/` prefix. The packet review
contains each full id, verdict and individual reason.

| Node | Verdict | Check |
| --- | --- | --- |
| scalar-homology-vanishing | corrected | Su84 Cor1.8 uses the standing infinite-field convention; mixed symmetric/exterior homology includes characteristic2 and arbitrary vector spaces. Added the expressible prime-field hypothesis. |
| affine-block-homology | verified | Su84 Thm1.9 prints all diagonals; its proof uses central scalars, justifying the stated sufficient refinement. LHS and integral UCT remain requested inputs. |
| unimodular-vector-chains | corrected | Projected linear independence, ordered deletion, augmentation shift and lower affine block match §2. Added action API and shear test. |
| unimodular-acyclic-range | verified | Lem2.1–2.2 use finite-support coning and finite proper-subspace avoidance. Rank0 retains the augmentation as top homology. |
| stability-coinvariants | corrected | §§2.3–2.5 give the presentation, associative ordered product and Milnor retraction. Checked the one-based relation sign and added unit/e API. |
| frame-connecting-map | corrected | §2.6/Lem2.6.1 give the iterated connector, old-rank vanishing and product compatibility. Corrected the construction's infinite-field scope. |
| frame-algebra-splitting | corrected | Cor2.7.4 and §3.3 give S₂, internal splitting and decomposability before the stability induction. Expanded typed conclusions. |
| frame-spectral-sequence-collapse | corrected | §§3.1–3.2/Thm3.4 prove collapse, e-injectivity, quotient and stability simultaneously. E¹ terms, odd/even d¹ and finite filtration match. |
| normalized-milnor-homology-map | corrected | §§2.7.1–2.7.4 give well-definedness before stability with ordered coefficient+1. Unstable SL₂ input is honestly a gap; restored infinite-field scope. |
| cross-ratio-coefficient-change | verified | Su91 Lem2.2 fixes (0,∞,1,x)↦x and the ordered face formulas. Naturality follows from determinants; ψ requires the separate infinite-field condition. |
| milnor-frame-retraction | verified | Cor2.7.3–2.7.4: the sole product term without a replaced entry1 survives. The identity precedes stability. |
| degree-three-torus-quotient | corrected | Thm3.4(d), n=3, gives quotient isomorphism and torus-plus-old-rank generation. Clarified the downstream application. |
| closure-torsion-detector | corrected | KVI Def2.1 and Su91 Lem5.7 use e only on torsion. The uniquely divisible Milnor kernel gives a canonical torsion quotient identification. Strengthened tests. |
| cyclic-chern-evaluation | verified | Su91 p236 and KV Ex11.5 give −u² and an isomorphism at all invertible moduli. No Bott restriction is imposed on this evaluation. |
| chern-bockstein-square | corrected | KVI5.19's diagram and KV11.3.2 fix arrow direction, sign and supported modulus range. Cofinal supported levels retain all torsion. |
| closure-detector-injectivity | corrected | Su91 Lem5.7–5.8 reduce ordinary Tor injectivity naturally to the closure. Updated supported 2-primary levels; enhanced Tor remains a separate AHSS obligation. |

The potentially delicate scalar-hypothesis refinement is justified directly:
scalar matrices are central in the corresponding diagonal factor and act on
M by t or t⁻¹. Both scalar actions satisfy the vanishing theorem. LHS first
kills the positive-M rows over every prime field, then integral UCT detects
the split homology equivalence. No finite-group averaging is used.

## Baseline and supplier audit

All statements were read at Mathlib
[`082e2d37e8b0463410cdb532e111cd43d5a66174`](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174).
Tau Ceti's recorded baseline is
`f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti declaration is cited or
imported by this suggested file.

| Declaration | Module and line | Contract |
| --- | --- | --- |
| groupHomology | RepresentationTheory/Homological/GroupHomology/Basic.lean:230 | Homology of inhomogeneous chains for a bundled representation; integral trivial coefficients are available. |
| groupHomology.indIso | RepresentationTheory/Homological/GroupHomology/Shapiro.lean:66 | Subgroup induction/Shapiro, with the source's decidable-equality condition. |
| FreeAbelianGroup | GroupTheory/FreeAbelianGroup.lean:96 | Free abelian carrier; `of` and `lift` at108,112. |
| Matrix.GeneralLinearGroup | LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43 | Units of square matrices; `toLin` at121 supplies the existing linear action. |
| Representation.Coinvariants | RepresentationTheory/Coinvariants.lean:57 | Quotient by the span of action-minus-identity relations. |
| HomologicalComplex₂.total | Algebra/Homology/TotalComplex.lean:265 | Signed total complex; no convergence theorem is inferred. |
| CategoryTheory.ProjectiveResolution | CategoryTheory/Preadditive/Projective/Resolution.lean:41 | Projective complex and quasi-isomorphism to the object. |
| Rep.FiniteCyclicGroup.resolution | RepresentationTheory/Homological/FiniteCyclic.lean:243 | Periodic norm/action-minus-one resolution, not a supplied cup-product calculation. |
| OnePoint.equivProjectivization | Topology/Compactification/OnePoint/ProjectiveLine.lean:84 | ∞↦[1:0], t↦[t:1]; Möbius action is already available. |
| CategoryTheory.Tor | CategoryTheory/Monoidal/Tor.lean:44 | Derived tensor functor; locally cyclic computations and transitions are additional work. |
| groupHomology.map | RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157 | Covariant group/coefficient map; abbreviation metadata corrected. |
| LinearIndependent | LinearAlgebra/LinearIndependent/Defs.lean:98 | Injective Finsupp linear-combination map; distinctness is insufficient. |
| Rep | RepresentationTheory/Rep/Basic.lean:30 | Bundled module and representation; structure metadata corrected. |
| Rep.trivial | RepresentationTheory/Rep/Basic.lean:286 | Trivial action; abbreviation metadata corrected. |
| CategoryTheory.SpectralSequence | Algebra/Homology/SpectralSequence/Basic.lean:37 | Pages and next-page homology isomorphisms; structure metadata corrected. |
| AddCommGrpCat.injective_of_divisible | Algebra/Category/Grp/Injective.lean:54 | Divisible abelian groups are injective; embeddings split. |
| CommGroup.torsion | GroupTheory/Torsion.lean:373 | Genuine torsion subgroup; the generated additive declaration is usable. |
| Subfield.closure | Algebra/Field/Subfield/Basic.lean:294 | Smallest generated subfield; empty-set closure expresses the prime subfield. |

The reviewed library audit is `AUDIT-29`, independently checked by
`REV-AUDIT-29` on 2026-09-17. It marks V.4's targets absent while identifying
existing ingredients and the cross-ratio overlap with Polylogarithms:P.2.
This packet imports the parent cross-ratio; it does not plan a second one.
It likewise imports Milnor K-theory, indecomposable K₃, configurations,
monomial groups, the plus/AHSS constructions and the exact sequence.

I checked the H.1 and H.6 contracts, upstream topology stage5, T.2 Milnor and
Matsumoto statements, L.1 finite coefficients/Bott, L.2 rigidity, M.7's étale
comparison scope, and V.2's injectivity/indecomposable and homology comparison.
None supplies all the extra claims merely by having a related name. The six
requests are precise, and the seven gaps distinguish the missing H.1 Part II
calculations, unstable SL₂ symbols, algebraically closed coefficient theory,
early Chern slice, omitted d³ calculation, inherited ψ₃/symmetric-group inputs,
and plus/enhanced-Tor closure. In particular stable Matsumoto does not supply
the unstable rank-two presentation; L.2 rigidity does not state the full
algebraically closed calculation; and full M.8 would introduce the documented
regulator cycle. The proposed early supplier split retains those boundaries.
All 36 parent targets have explicit import coverage, so planned status is
justified under protocol §0; closed status would not be.

## Source findings and independent computations

The four original PDFs were fetched independently and their hashes agree
with the packet. Read Su84 §§1–3, including the displayed formulas on the
Russian scan; Su91 Lem2.2/2.4 and Lem5.7–5.8 on the English scan; KV§11 and
KVI§§1–2/Lem5.19. Also read KIV§2 and collated the relevant passages in the
public full author PDF dated August29,2013. All URLs and six version hashes
are recorded in the packet. The K-book findings are scoped to those author
copies, without claiming inspection of a separate publisher edition.

| Finding | Verdict | Reason |
| --- | --- | --- |
| E-V4-1 | confirmed | KV Ex11.5's positive hint conflicts with Whitney sum and Su91's printed negative sign; negation preserves the isomorphism. |
| E-V4-2 | confirmed | Su91 Lem2.4 explicitly omits the long d³ calculation. This is a proof gap, not a false-formula finding. |
| E-V4-3, added | confirmed | KVI p5's positive-characteristic cyclotomic surjectivity claim is false. On µ₇ in the algebraic closure of F₂, field automorphisms have exponents1,2,4, while root-group exponent3 also exists. Actual field automorphisms still act with weight two. |
| E-V4-4, added | confirmed | KVI5.19's product-rule invocation includes4, outside KV11.3.2's stated scope. Recorded the missing special justification and used sufficient cofinal supported moduli; no counterexample to the lemma is claimed. |
| E-V4-5, added | confirmed | KIV Prop2.7 and its proof's last line repeat q₁ in the second factor; the intervening Moore-space formula correctly has q₂. |

I checked the [author's homepage](https://sites.math.rutgers.edu/~weibel/Kbook.html)
and [Books page](https://sites.math.rutgers.edu/~weibel/Books.html), their
linked errata location (404), the dated full author copy and relevant web
searches. No correction to these passages was located in this pass. That is
a scoped search result, not a claim that no correction exists elsewhere.

An independent normalized bar calculation checks the weight-two test.
For C₇ in additive coordinates the integral cycle is the sum of [1|b|1]
for b=1,…,6. Its integral boundary vanishes. The mod7 carry cocycle
φ(a,b,c)=a·floor((b+c)/7) annihilates boundaries of all 1296 normalized
four-tuples. It evaluates to1 on the cycle and4 on its image under
power-two, distinguishing the proposed answer from2. The periodic cyclic
resolution identifies H₃(C₇)=Z/7, so this pins the homology action. Separate
rational arithmetic checks the five ordered faces at x=2,y=3 as
1/2,3/4,3/2,3,2. The negative Chern sign differs from the positive sign
mod3 and agrees mod2, explaining why an order-two-only sign test is weak.
These are finite checks of conventions, not formal proofs of the roadmap.

## Assembly actions and validation

The orchestrator should route the six existing supplier requests and preserve
the seven closure gaps. A special mod4 Bott normalization may be established
in that supplier work, but it is unnecessary for the corrected cofinal proof.
The enhanced extension requires its own inherited AHSS argument; ordinary
Tor injectivity must not silently replace it.

The reader `research/blueprint/readmes/K3BlochGroups--V.4.md` is outside this
review's allowed files. Synchronize its finite-coefficient-square subsection,
acceptance test and L.2/M.7 request/gap text to the supported odd-or-8-divisible
proof range and m=8 order-two route. Incorporate the added action/unit/e API,
two tests, corrected source findings and counts32/19/18. The final target
(detector injectivity for every infinite field) is unchanged. The original
BP handoff is historical; the review packet and this report supply the
corrected proof contract.

Validation: `python3 scripts/check_blueprint.py
research/blueprint/packets/K3BlochGroups--V.4.json` reports zero errors and zero
warnings. The suggested file elaborates through `lean-check` in the existing
build with the exact pinned Mathlib, with exit status zero, zero errors and 82 warnings, all solely declarations
using `sorry`. Its individual imports are all Mathlib; no Tau Ceti module was
tested. API/test correspondence, all source hashes, implementation statuses,
prerequisite coverage and the finite computations above were checked.
No language server or library build was started.
