# RT-RS-02 — abelian schemes and finite flat groups

Job: RT-RS-02. Issue: #4389.
Agent: Codex — codex-a71f92. Read date: 30 September 2026.

Result: complete; no actionable finding established. This conclusion concerns
the accepted ownership/restructuring proposal, not completion of its future
proofs or acceptance of the two partial blueprint packets.

## Independence and snapshot

The proposal author was ChatGPT Pro, session gpt-20260921-c74f2a; its reviewer
was Claude Code, session cc-442dc5. This session did neither job. The claim
bot confirmed comment 5912823817 before work began, and the issue was reread.

Audit snapshot: 9b6bba7cba64c9ae481a5aee3bbafcd4f2ca7296.
Read the entire family file, accepted result/report, independent review and
both member README documents. Read all 13 layer decisions, 23 owner records
and 274 link reasons. Outside-member reading covered every link endpoint's
full stage description, not every complete outside roadmap document:
14 anchor stages and 47 other stages, plus CR.0/CR.1. The R09.3 ownership
handoff in its README was also read because its stage excerpt alone does
not explicitly name Weil restriction.

Input SHA-256 identifiers:

| Input | SHA-256 |
| --- | --- |
| RS-02.json | be503e4d0ab1916223fa7d5dc40c7df203461286b6f890655b0453c3f5b2e710 |
| RS-02.result.json | 31aabcb0086353ab033ea86e4574bea22b29c7a431ff678ba90247883a3f2d84 |
| RS-02.md | 1878587f220cd63fbccffa73950790a123e203be1917722c0503a1fc2b775838 |
| REV-RS-02.md | f90013cd689b1d991362f989b274ad63d787163de53e06e747539d0d49b5a595 |
| AbelianSchemesAndArithmeticModuli README | b229fca45253186f2cf113cbb00e988e77da2874378080cb4293174f4572c381 |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory README | e2443ea2fcedc06c744d0b29803416ec77e748f3f78c0069a30863bf5d08fa42 |

The family has 36 evidence records representing 28 unordered pairs.
Repeated/reversed records and coarse Layer 0/1/2/7 aliases were not counted
as additional independent mathematical evidence.

## All thirteen stage decisions

A0–A6 abbreviate AbelianSchemesAndArithmeticModuli; R07.1–R07.6 abbreviate
FiniteFlatGroupsAndIntegralPadicHodgeTheory. The table records the attempted
failure and why the proposal survives it.

| Stage | Action | Preservation and boundary checked |
| --- | --- | --- |
| A0 | keep | General representability/cohomology remains imported from R09.1–R09.6 and A0-extension. No new resolution or late arithmetic-moduli dependency. |
| A1 | narrow | Field and genus-one carriers are reused; general-base rigidity, relative dimension, differentials, square/cube and base change remain. Equality is not deduced from geometric fibres over a nonreduced base; no global polarization is smuggled into the definition. |
| A2 | narrow | General relative Picard space, the abelian-space-to-scheme theorem, Poincare bundle, biduality, polarizations and Rosati remain. The field/curve or elliptic theorem is not promoted to arbitrary dimension/base. Sign and rigidifying base-line comparisons remain explicit. |
| A3 | narrow | Nonaffine abelian fppf quotient, isogenies, relative duals, torsion ranks and pairings remain. Affine quotient existence is only an input. The nonzero integer and positive-dimensional etaleness qualifications, dimension-zero identity case, characteristic-p scheme torsion and polarization-dependent radical/perfectness are retained. |
| A4 | narrow | Relative de Rham/Hodge/Gauss-Manin, Tate local systems, complex comparison, general structured Serre-Tate and effectivity remain. General p-divisible and PD-filtration results are imports, not replacements for this realization/compatibility work. |
| A5 | narrow | Higher-dimensional polarized complex tori, integral Hodge structures, analytic families and Siegel family remain. R12.1 supplies genus one. Converse algebraization remains downstream at V5 after M3; no unimodularity assumption for every lattice. |
| A6 | narrow | Finite-generation/torsion-freeness, complete reducibility, rational semisimplicity, Rosati positivity and polarized degrees are not confused with the existing End ring. General Weil restriction is imported; finite-etale abelian preservation, scheme criterion and Tate-module induction remain actual theorems here. |
| R07.1 | narrow | Reuses general Cartier duality, finite-level connected-etale, quotients/descent and the elliptic tower. Arbitrary-height coherent towers, Tate limits, flat closures, integral models, strict-bound Raynaud results and tame characters remain. |
| R07.2 | narrow | Integral group/crystal classification, covariance, F/V, exactness, duality and descent remain. Rational slopes come from VB0. Generic Grothendieck-Messing moves here explicitly; exact PD hypotheses, morphisms, duality and effectivity remain obligations. |
| R07.3 | keep | Unramified integral Fontaine-Laffaille, torsion exactness/full faithfulness and reduction remain. Common safe interval [0,p-2] is distinct from rational filtration length < p and the restricted [0,p-1] endpoint; p=2 is not ignored. |
| R07.4 | keep | Breuil-Kisin ring, bounded height, classification, descent and generic-fibre/integral comparisons remain. Finite-flat, Barsotti-Tate, potentially Barsotti-Tate and potentially semistable branches are not identified; dyadic theorem still requires its source. |
| R07.5 | keep | Extension-sensitive inertia and finite-flat calculations remain, including ordinary/supersingular and peu/tres distinctions. Semisimplification cannot erase extension classes; modular weight recipes remain consumers. |
| R07.6 | narrow | Only the generic PD deformation equivalence is imported from R07.2. Local tangent/obstruction/model comparisons, twists, base extension and finite-flat ramification/different bounds remain, including the stated shift of upper numbering and normalization. |

The two extension titles preserve their exact upstream titles.
Distinct Part II extensions of ModularCurves are not a duplicate merely
because they share the anchor: the analytic and integral-group scopes differ.

## Ownership ledger

The following is the entire 23-entry ownership ledger, checked against its
named stages. Upstream ownership is a roadmap assignment, not a claim that
every theorem in that stage is already implemented.

| Subproblem | Owner |
| --- | --- |
| Field-level abelian-variety carrier, basic rigidity, square/cube and Hom/End operations | JacobianChallenge#layer-e-abelian-varieties |
| Relative genus-one Weierstrass presentation and invariant differential bundle | ModularCurves#1c-pole-sheaves-weierstrass-coordinates-and-variable-changes |
| Relative elliptic scheme-theoretic group law and its canonical carrier | ModularCurves#1d-the-scheme-theoretic-group-law |
| Relative elliptic Picard square/cube, Poincare normalization and dual-comparison theorem | ModularCurves#2d-picard-duality-and-comparison-of-the-duals |
| Curve Picard/Jacobian and rigidified field-curve Poincare specialization | JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme |
| Field-level dual abelian variety and polarization construction | JacobianChallenge#layer-e-abelian-varieties |
| General finite locally free commutative group-scheme Cartier duality and evaluation | ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality |
| Affine finite quotient and finite-flat torsor construction with its hypotheses | ModularCurves#0c-finite-quotients-and-torsors |
| Effective descent of the finite locally free objects and polarized/projective objects in the anchor scope | ModularCurves#0e-effective-descent-and-spreading-out |
| Field-level multiplication-isogeny and characteristic-p torsion foundations | JacobianChallenge#layer-e-abelian-varieties |
| Relative elliptic multiplication rank and torsion base change | ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree |
| Relative elliptic nonaffine fppf quotient by a finite locally free subgroup | ModularCurves#2b-isogenies-and-quotients |
| Elliptic isogeny factorization-dual theorem | ModularCurves#2c-the-factorisation-dual |
| Relative elliptic Cartier-Nishi duality and scheme-theoretic Weil pairing | ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing |
| Henselian finite-level connected-etale sequence and its special-fibre splitting statement | ModularCurves#7e-p-divisible-groups |
| Elliptic p-divisible tower and its finite-level morphism/base-change comparisons | ModularCurves#7e-p-divisible-groups |
| Arbitrary-height p-divisible category, coherent tower and Tate-limit foundations beyond the elliptic instance | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1 |
| Elliptic Serre-Tate equivalence and the three selected level-problem specializations | ModularCurves#7f-serretate-theory-with-level-structure |
| Generic Grothendieck-Messing equivalence for p-divisible lifts and admissible Hodge-filtration lifts over the source PD thickenings | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2 |
| Elliptic Frobenius/Verschiebung and ordinary/supersingular height-one/two cases | ModularCurves#7e-p-divisible-groups |
| Rational isocrystal carrier and Dieudonne-Manin classification in the specified algebraically closed field/coefficient setting | VectorBundlesAndIsocrystals:VB0 |
| Genus-one lattice uniformization compared with the existing elliptic scheme | ModularCurvesPartII:R12.1 |
| General restriction-of-scalars functor, finite-locally-free algebraic-space representability and base change | AlgebraicModuliForArithmeticGeometry:R09.3 |

In particular, ModularCurves 0B is not limited to elliptic torsion, and 7E's
PD-2 is a general henselian finite-group statement even though PD-1 is its
elliptic tower. The proposal correctly rejects the narrower audit shorthand.
Conversely, neither 0C's affine quotient nor 0E's stated descent scope is
an automatic theorem on arbitrary nonaffine projective quotients.

The old R07.6 generic Grothendieck-Messing assignment really changes:
R07.2 already promises deformation theory, so the generic proof is placed
there and R07.6 imports it. The surviving R07.6-to-A4 edge is for its local
comparison applications, not a second generic equivalence or a reverse
R07.6-to-R07.2 dependency.

## Mathematical attacks and fresh source checks

All external source checks below were made on 30 September 2026.

1. **Serre-Tate is not Grothendieck-Messing.** Read Katz,
   [Serre-Tate Local Moduli](https://web.math.princeton.edu/~nmk/old/serretatelocmod.pdf),
   Theorem 1.2.1 and its proof, printed pp. 143–146, including the theorem
   image. Its data involve an abelian scheme on the quotient base, a lifted
   p-divisible group and their identification on that base; p and the
   defining ideal have the stated nilpotence assumptions. The proof treats
   morphisms as well as essential surjectivity. This supports A4's separate
   general equivalence and its early finite-torsion/p-divisible prefix. It
   does not identify arbitrary ordinary nilpotence with PD nilpotence.
   CR.0/CR.1 explicitly distinguish those conditions and supply envelopes,
   sites and crystals, not the integral Dieudonne classification itself.

2. **Strict small-ramification bounds.** Read Raynaud,
   [Schemas en groupes de type (p,...,p)](https://www.numdam.org/item/10.24033/bsmf.1779.pdf),
   section 2's DVR/valuation setup and 3.3.2–3.3.7, including printed p. 268
   visually. Theorem 3.3.3 and Corollary 3.3.6 use the strict e < p-1
   inequality for uniqueness and generic-fibre full faithfulness with the
   stated flat kernel/cokernel and Ext assertion. The later composition
   result has different assumptions and does not upgrade uniqueness to the
   endpoint. For p=2 a mixed-characteristic DVR has e >= 1, so this strict
   range gives no unrestricted dyadic substitute. R07.1 retains that limit.

3. **Weil restriction is not automatically proper.** Read statements and
   proofs of [Stacks 05YC](https://stacks.math.columbia.edu/tag/05YC)
   (base change) and [Stacks 05YF](https://stacks.math.columbia.edu/tag/05YF)
   (algebraic-space representability with finite locally free restriction
   base). These do not assert properness or abelian-scheme representability.
   The proposal leaves finite-etale split-product descent and the relevant
   scheme criterion at A6. Its dual-number tangent-bundle counterexample
   rules out the naive finite-locally-free properness inference.
   R09.3's owning README explicitly lists Weil restriction in its handoff;
   absence of that phrase from the short stage excerpt is not a missing owner.

4. **Elliptic normalization.** The anchor's positive identification
   P -> O(P-0) matches pullback by translation by -P of O(0). Thus a general
   phi_L defined using translation by P requires its sign comparison.
   A2 retains that comparison and the rigidifying base-line correction.
   A3 keeps pairing with the dual variety, rather than declaring every
   polarization-induced self-pairing perfect. Alternation in characteristic
   two cannot be discharged merely by skew-symmetry.

5. **Analytic, integral and arithmetic imports.** A5 feeds M3 and then V5,
   not the converse. A6's field Tate-module induction does not establish
   good reduction across a ramified integral extension. R07.2 distinguishes
   algebraically closed rational slope classification from integral
   descent/forms; R07.3 keeps its endpoint categories separate; R07.6
   preserves the original Fontaine shift and v(p)=1 different convention.
   These last checks compare retained source obligations and consumer
   contracts; they are not fresh proof audits of Fontaine-Laffaille,
   Breuil-Kisin, Fontaine or the analytic-family algebraization theorem.

Katz PDF SHA-256:
9c1209a71dbcd8f14da7cc42cf768fcfabaf43d2dc317483a992d5ceaf377938.
Raynaud PDF SHA-256:
05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe.

## Pinned-library and audit checks

Confirmed the clean pinned checkouts: Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369.

- [AbelianVariety/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean),
  lines 60–155: the existing carrier is over a field, with geometric
  integrality/properness, smoothness and commutativity results and its
  Krull-dimension definition. It does not discharge A1's general-base
  locally constant relative-dimension construction.
- [Hom/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Hom/Basic.lean),
  lines 25–125, and
  [End/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean),
  lines 1–215: the category, group-preserving maps, additive reindexing
  End, ring instance and conjugation transport are genuine reuse inputs.
  These declarations are not finite generation or Rosati positivity.
- [CartierDuality/FiniteLocallyFree.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean),
  lines 203–337: cartierDuality and cartierDualDualNatIso give the
  finite-locally-free commutative affine-group anti-equivalence and
  double-dual comparison over an arbitrary commutative ring. This is
  substantially more than an elliptic special case, but not every
  nonaffine quotient/descent theorem.
- [WittVector/Isocrystal.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Isocrystal.lean),
  lines 45–205: the semilinear carrier/morphisms and standard
  one-dimensional objects exist. isocrystal_classification assumes an
  algebraically closed field and finrank = 1; it is not the full rational
  theorem or the integral group/crystal functor.

Read all seven AbelianSchemes entries in data/library-coverage.json.
The aggregate has no R07 entries at this snapshot. Separately read all six
R07 entries in AUDIT-37.result.json and all of REV-AUDIT-37.md: the latter
says accepted, while the result's review metadata is null. Thus neither
aggregate absence nor the proposal's historical pending note was treated
as proof that there is no reviewed discussion. The Cartier-duality and
rank-one-isocrystal conclusions agree with the fresh statement checks.
The audit's other broad absence claims were not recertified here.

## Graph, forwarding and identity checks

Loaded the snapshot atlas and proposed-roadmap registry, and called the
repository's actual check_restructure.check and
restructure.apply_restructurings. Independently built edge sets and searched
for a path from target back to source for each proposed edge.

| Check | Result |
| --- | --- |
| Member coverage | Exactly 13 stages; nine narrow, four keep |
| Proposed pairs | 274, all distinct and resolvable |
| Application | 221 additional edges; no skipped links |
| Original atlas edges | All preserved |
| Stage identity/content | All original IDs/descriptions preserved; upstream title/owner/restructuring content unchanged |
| Native plus proposal | 3,729 edges; no return path for any proposed edge |
| Conservative accepted union | 7,460 edges; no return path for any proposed edge |
| Outside exports | All 47 preserved, reaching 44 distinct stages in 28 roadmaps |
| Concrete supplier reachability | No missing path to its importing layer |
| Supplier forwarding to original consumers | No missing direct edge in the checked union |
| Immutable anchors | No member-to-anchor backedge |
| Retired endpoints | No endpoint of a proposed pair occurs in an accepted drop/retire layer decision |

The conservative union additionally incorporates resolvable requires lists,
25 accepted link packets, 31 accepted research restructuring results and
27 promoted restructuring records. Duplicate pairs collapse to one edge.
The cycle statement is deliberately proposal-relative: it is not a claim
that every unrelated component or every unreviewed packet forms a DAG.
A direct supplier edge is access to a qualified theorem, not a stronger
unconditional theorem or a new proof of everything a broad layer contains.

The two member packets currently have 21 and 104 nodes respectively.
Both are partial and have no review object; the first has three gaps.
All 125 IDs are unique within their packet and all parent-stage IDs resolve
before and after the restructuring. No integrated decomposition for either
member was present. This preservation check is not a read-through or
certification of those packets' mathematical node statements.

## Validation and limits

The result passes scripts/check_redteam.py; both authorized deliverables
pass the intake path/JSON/privacy checks. The publication diff is checked
for whitespace errors. No source roadmap, accepted proposal, packet or
upstream file is changed by this submission.

No new Lean file is requested or changed; no Lean compilation, library
build, cache download or language server was used. No claim is made that
the remaining targets are formalised. A full proof audit of Faltings-Chai,
Messing, Fontaine-Laffaille, Breuil-Kisin, or all outside consumers was not
performed. These remain the respective source-decomposition jobs' duties;
the restructuring keeps rather than silently discharges their obligations.
