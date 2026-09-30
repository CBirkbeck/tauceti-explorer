# Verification of RT-PAPER-SCHROER-23

Issue #4057; Codex session `codex-5ebb6f`; 30 September 2026. Base:
`1b75b3376bbaca6bf692a0a341d4f8085e43063b`.
I did not extract, review or red-team this paper, or write/review its errata.

All seven findings are confirmed: one high, five medium and one low. Confirmation
applies to the concrete defects described below, with corrected fixes where the
red team overstates a supplier or source. Every medium/high finding warrants a
change. This verification edits only its two deliverables; it does not apply the
fixes to the extraction, other packets or generated register.

**Sources and limits.** I fetched the primary PDFs afresh on 30 September 2026.
The arXiv v3 hash matches the input reviews. The author copy was also fetched and
hashed; it is not a substitute for the published version. The Annals page identifies
the 2023 article and its revision date, but I did not obtain the typeset published
PDF. Findings about printed mathematics below are scoped to v3, with its own page
numbers. They are not assertions that the version of record has the same defects.

| Text | Primary URL | SHA-256 |
| --- | --- | --- |
| Schröer, arXiv v3 | [PDF](https://arxiv.org/pdf/2004.07025v3) | `ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61` |
| Schröer, author copy, July 2022 | [PDF](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf) | `828efee55d68b29b5c1617872cc97955bb22374500de721cddd24a7b3c1ed191` |
| EGA IV4 | [Numdam PDF](https://www.numdam.org/item/PMIHES_1967__32__5_0.pdf) | `b4277fb99c6edf8feec5b01f54368e4b8521bcd52871316c0edf6ff4ae69389e` |
| Raynaud, Spécialisation du foncteur de Picard | [Numdam PDF](https://www.numdam.org/item/PMIHES_1970__38__27_0.pdf) | `fdba4b96e9f3fa3eeb158868217b95ffd4172f128148a70013115666cf04cf92` |
| Tate–Oort, Group schemes of prime order | [Numdam PDF](https://www.numdam.org/item/ASENS_1970_4_3_1_1_0.pdf) | `064cec666ea2082bc23ec5748b7b6db2fe01feb7f83f8afd04736e78bc44fa5a` |
| Tate, Algorithm for determining the type of a singular fiber in an elliptic pencil | [Original paper scan](https://wstein.org/Tables/antwerp/tate/tate.pdf) | `8650805838f84ad1bc9afa169b1797bd345fb7d9ea4628cdf995c83a10aaccfc` |

Read the seven complete finding objects, affected extraction items/briefs,
sourceIssues E34/E44 and the corresponding errata entries, the original review,
and the named supplier nodes. Source checks were selected readings, not a new
full-paper extraction: v3 §§1, 3–5, relevant §§6–8, §§10–11 and the final proof;
EGA 18.5.11 on printed pp.130–131; Raynaud 6.1.4 and 8.2.1; Tate–Oort's
introduction; Tate §§7–8, printed pp.47–51, inspected as page images.

Checked the relevant reviewed library-audit contracts: R25.3 is not built,
A0-extension is partly built, and there is no R07.1 entry. No missing audit row
establishes absence of a library API. Read the cited discriminant declarations
and Weierstrass invariant/variable-change definitions at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin remains
`f790474821cf4256814db967cb154e7af3d0c369`. Existing packet coverage is planning
evidence, not a certificate of implemented mathematics. No Lean was compiled.

**1. Confirmed, high: propagate the classification gap.**

The extraction already accepts E34/E44 and names the missing exclusion in its
route-6 brief. Items `/119`, `/130`, `/146` and `/47` and the overview nonetheless
retain an unqualified table/reduction or proof-check account. V3 pp.32–33 derives
the elliptic column of Proposition 11.1 directly from Theorems 10.4/10.5; p.38
uses it in Proposition 11.4; p.49 uses that reduction to prove Theorem 15.1 and
then Theorem 5.1. A downstream design must see the same open gate at each use.

I independently calculated the three displayed models, using the pinned
Weierstrass formulas in characteristic two and Tate's original algorithm. Here
`A`, `B`, `C` have coefficient tuples `(a1,a2,a3,a4,a6)` as follows.

| Model | Tuple | Discriminant | Fibres at 0, 1, infinity | Rational point sum |
| --- | --- | --- | --- | --- |
| A | `(t,1,t³,0,0)` | `t¹⁰` | `I₂*`, `E₄`, nonsplit `I₂` | `15+4+6=25` |
| B | `(t,t,t³,0,0)` | `t¹¹` | `I₃*`, `E₄`, nonsplit `I₁` | `17+4+4=25` |
| C | `(t,t²,t²,0,0)` | `t⁸(t²+t+1)` | `IV*`, `E₄`, nonsplit `I₂` | `15+4+6=25` |

For A the change `y -> y+x` gives `(t,t,t³,t³,0)`. Tate's cubic is
`T²(T+1)`; the successive quadratics are `Y²` and `X²+X`, giving split `I₂*`.
For B the same cubic leads through `Y²`, `X²`, then `Y²+Y`, giving split
`I₃*`. C has cubic `T³` and quadratic `Y²+Y`, giving split `IV*`.
The splitting polynomials have their required distinct roots in F₂, so these
checks include component rationality, not just discriminant valuations.

At infinity substitute `s=1/t` and replace `a_i` by `s^i a_i(1/s)`.
A/B reduce to a node at `(1,1)`; C to a node at `(0,0)`.
Each tangent cone is `Y²+XY+X²`, irreducible over F₂. The discriminant orders
are respectively 2, 1 and 2. Thus the small multiplicative fibres are the
nonsplit forms, whose component graphs can still be rational. At `t=1` all
three affine equations have exactly `(0,0),(0,1),(1,0)`, plus the point at
infinity. C also has a geometric `I₁` fibre at the degree-two point
`t²+t+1=0`. The additive trees have respectively 7, 8 and 7 rational components;
their point counts are `2r+1`. The nonsplit counts follow from normalization,
as in v3 Proposition 3.2. These are the omitted cases in the accepted E34
review, and each has only one rational semistable/supersingular fibre.

A scratch GF(2)[t] calculation independently reproduced the invariants, changed
coefficients, Tate-polynomial coefficients, infinity valuations and the four-point
smooth fibre. Its finite computation is not the previous worker's exhaustive
enumeration of all equations or coordinate orbits. I have not independently
certified that the fourteen proposed classes exhaust the classification.

The IV* argument at v3 p.37 assumes the other multiple fibre has type III or IV.
That step does not settle the added IV*+E₄+nonsplit-I₂ case. The main theorem
may still be true: the extra Jacobians do not establish that an Enriques surface
realizes them. Correct `/119` and `/130` as conditional bounds/reductions, expose
the unresolved exclusion and classification-completeness obligations, and remove
the unconditional proof-check note on `/146`. Propagate these gates to `/47`
and the overview. Import the Jacobian classification from route 2; route 6 owns
the Enriques exclusion. Do not cure the gap by treating an unproved table as
an established theorem.

**2. Confirmed, medium: reuse the R07.1 classification.**

Current R07.1 coverage is closed with no remaining planning entries. Its exact
supplier nodes are
`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-classification`
and `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-over-number-rings`.
They already cover `/52` and `/54`. In the primary introduction, Tate–Oort
explicitly gives the rank-two construction over arbitrary bases; for p=2 the
coefficient base is Z. The coordinate law has a minus sign, also checked by
the Z example `a=1,b=2`: combining 1 and 1 must give 0, whereas the printed
plus sign gives 4 outside the scheme.

Mark those two items planned at these nodes. For `/51` and `/53`, ask the same
owner for the explicit rank-two coordinate and nontrivial-invertible-module
duality adapters. Preserve Schröer as an application/source, rather than moving
general classification into an Enriques roadmap. A paper-v1 fix should use the
brief/notes and maintainer handoff for that request unless its schema actually
supports a requests field.

The claim that a source into a closed stage cannot be acted on is not established.
`make_queue.py` lines 910–914 appends accepted source routes without a stage-closure
test. The current R07.1 packet does omit Schröer attribution, and issue #731's body
does not list this added source, but neither fact is an implementation claim or
proof of a permanent automation prohibition. The stale statuses and missing
supplier adapters are the confirmed defects.

**3. Confirmed, medium: split the finite and infinite-stalk clauses of `/181`.**

Use
`SmallRamificationAndAbelianVarietyBaseCases:R25.3/etale-group-schemes-over-integers-are-constant`
for the already planned finite-cover/pi1 assertion. At the pin,
`NumberField.not_dvd_discr_iff_isUnramifiedIn` in
`Mathlib/NumberTheory/NumberField/Discriminant/Different.lean` and
`NumberField.abs_discr_gt_two` in the adjacent `Basic.lean` supply arithmetic
ingredients; they are not the full scheme theorem or an infinite-stalk API.

The extra review note on `/181` recognizes that Num has infinite stalk Z¹⁰.
Keep its normal-base Isom-torsor/finite-monodromy adapter explicit and missing
until a supplier supplies it. Request the general lemma from the fundamental-group
direction and let Enriques consume its Spec Z specialization. Drop the duplicate
finite assertion from route 7. Do not add R25.3 as another independent owner of
`/54`: its simple-two-group result imports R07.1, whose direct rank-two
classification is the appropriate supplier.

**4. Confirmed, medium: coordinate Enriques and K3 carriers.**

Schröer `/26` covers all characteristics; Benoist `/114` combines a
characteristic-zero Enriques definition, canonical cover and real halves.
The current briefs lack a shared Enriques supplier. Proposition 4.2 in v3 p.12
supplies the classical comparison; it is automatic away from characteristic two.
One arbitrary-field carrier and canonical-torsor construction should be owned
by `EnriquesSurfacesAndIntegralNonexistence`, with the real theorem importing
the characteristic-zero specialization and retaining its real-halves API.
The CP.5 and MC.7 consumers need the same interface, not private definitions.

Routes 3/6 use K3 surfaces through `/148` and `/188` without naming the
Charles/Shankar supplier contract. The queue lists
`DESIGN-K3SurfacesAndSymplecticBoundedness` as pending; there is no corresponding
packet in this checkout. Record a requested definition and design gate against
that accepted extraction proposal. Do not label a bare roadmap name as an existing
stage. Also preserve the distinction between a smooth characteristic-zero K3
cover and the characteristic-two K3-like cover, which v3 p.13 allows to be singular.

**5. Confirmed, medium: expose the actual proof inputs to Proposition 8.1.**

V3 p.22 invokes a horizontal divisor over a finite DVR extension, a normal model
dominating two models, Raynaud's cohomological-flatness result and Lemma 8.4.
Item `/81` and route 2 do not decompose these leaves. The red team's proposed
general EGA replacement is not the cited theorem.

EGA IV4 18.5.11, printed pp.130–131, gives equivalent henselian-local-ring
conditions. Its condition (c) extracts a finite local component of a separated
locally finite-type morphism quasi-finite at a point of the closed fibre. Import
that exact result. Separately prove the transverse Cartier-divisor construction
in the proper regular relative-curve setting used here, including regularity of
the divisor, its finite DVR algebra and the unchanged residue field. Neither
arbitrary Cartier-divisor lifting nor regularity follows merely from the generic
flat finite-presentation hypothesis in the proposed fix.

Raynaud 8.2.1, printed p.66, assumes a proper flat relative curve over a trait
satisfying (N)*. Definition 6.1.4 requires no embedded components in the special
fibre, normal local rings at its maximal points, and `f_*O_X=O_S`.
In this application prove these from the normal model and connected genus-one
generic fibre. A section supplies the degree-one generic divisor in condition
(ii); the implication chain to (iv) gives cohomological flatness. To conclude
`h⁰=h¹=1` also use connectedness/base change and the constant genus-one Euler
characteristic. A proper flat scheme with a section alone is insufficient.

Request the general henselian and coherent-cohomology contracts from their
foundation owners. Route 2 should own the transverse-divisor application,
dominating-model comparison and genus-one isogeny argument, importing `/84–/85`.
This adds the missing leaves without planning a second general cohomology theory.

**6. Confirmed, medium: canonical errata and version provenance.**

The current generated register has 55 Schröer entries; each of E1–E11 occurs
twice. E1 denotes the same subject twice, while later ids collide across different
subjects. The relevant semantic correspondence is:

| Extraction entry | Separate errata entry |
| --- | --- |
| E1 | E1 |
| E4 | E2 |
| E5 | E3 |
| E6 | E4 |
| E11 | E5 |
| E12 | E6 |
| E13 | E7 |
| E15 | E8 |
| E16 | E9 and E11, two slips combined |
| E17 | E10, plus an additional discriminant-form correction |

For v3 Lemma 1.1, d=0 makes the existential condition vacuous for every X;
P¹_C viewed over R has a nonconstant rank-two numerical local system. For
Proposition 3.1, the two rulings of E×P¹ give constant Num, but its rational
smooth elliptic fibre is not birational to P¹. Thus extraction E1 **and E4**
affect stated results, as the separate errata already says.

Both source files lack top-level `sourceVersions`; the errata checker reproduces
the missing-provenance error. Add records with actual kind, URL, read date and
hash. The preprint and author-copy entries must retain their scope; record the
unread version of record as an unresolved collation, not as a published text read.

Cross-references alone do not deduplicate the register:
`scripts/errata.py` lines 42–98 collects both files and appends every finding.
The integration fix needs one canonical, unambiguous active entry per mistake
and file-qualified historical aliases, preserving combined/split corrections and
review provenance. Ask the maintainer to coordinate the permitted source edits
and regenerate the register; editing only generated data would recur. The current
collision is independently established without relying on a historical assertion
about which job wrote its file first.

**7. Confirmed, low: correct the Layer D description and import its overlap.**

The full contract of
`tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`
defines fppf Picard sheafification and its Brauer obstruction for proper flat
finitely presented morphisms with geometrically integral fibres, before using a
section to rigidify it. It also names the general projective-variety Picard scheme
route. Correct `/215` and add that exact import to route 1 and `/213`'s notes.
V3 Lemma 1.4, p.7, needs `Br(X_aff)` for arbitrary proper X; that extension
remains missing. Layer D does not automatically provide `/213`'s numerical
quotient, Pic^tau or all its finite-generation theory.

**Validation.** The verification has one verdict for each of the seven input
finding ids, with no extras or duplicates. Required red-team and intake checks
and whitespace validation are recorded in the pull request. The unchanged
errata input's checker failure was reproduced as evidence for finding 6; it is
not a failure of the verification deliverables. No library build, cache download
or Lean compilation was performed.
