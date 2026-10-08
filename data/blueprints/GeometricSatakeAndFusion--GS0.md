# Geometric Satake over the Fargues–Fontaine curve: GS0–GS2

This document is the definitive mathematical plan for the first part of
`GeometricSatakeAndFusion`. It covers Beilinson–Drinfeld Grassmannians, early
Schubert smoothness, integral Witt geometry, semi-infinite geometry, relative
perversity, and convolution with duals. The packet beside this document records
the same declarations and their direct dependencies. The suggested Lean file
prototypes their algebraic and categorical interfaces against the pinned libraries.
Its comments specify which geometric hypotheses cannot yet be expressed.

The target-level pass is complete. All eight stages are planned; none is closed.
The packet has 62 nodes: 21 constructions, 2 definitions,
27 theorems, 8 comparisons, 1 application and 3 lemmas.
The 23 definition and construction nodes have their API outlines and discriminating
tests; across the packet there are 73 API items and 72 tests. There are
25 planets, 30 pinned baseline declarations, 23 supplier requests and
10 explicit gaps. Every implementation status remains unchecked. A planned target
has a mathematical contract whose prerequisite chains end in a pinned declaration,
an existing roadmap node, a precise supplier request or a named gap. The status
does not claim that these suppliers are implemented or that the prototype proves
the geometric theorem.

This revision preserves the 59 existing node identities and the historical independent
review record. It synchronizes the corrections throughout the reader and adds the
three auxiliary lemmas explicitly routed by the current issue: FS VI.1.13 and
VI.3.2–VI.3.3. The original review remains a record of the previous version; a new
independent review of this revision is accepted as a complete target-level pass; see the review report `REV-GeometricSatakeAndFusion--GS0~2.md`. The inherited review remains historical provenance.

The second part owns symmetric fusion, tensor compatibility of the fibre
functor, rational Tannakian reductivity and dual-group reconstruction. They are
outside this document. Convolution closure and both duals precede symmetric
fusion: FS VI.8 proves them, and VI.9 uses them. The elementary two-leg collision
family in VI.8.1(ii) is an ingredient of the early closure proof and is included
here. It does not import the coherent symmetric fusion construction.

## Conventions and the library boundary

Fix a nonarchimedean local field E of residue characteristic p and a coefficient
prime ℓ different from p. Write O_E for its valuation ring. For the reductive integral-divisor construction fix an integral reductive model.
Parahoric integral constructions instead take their specified smooth parahoric
or quasiparahoric model. A general
possibly ramified reductive group over E is handled on generic divisors by a
splitting extension and Galois descent; this does not produce a reductive O_E-model.
Parahoric and Iwahori integral models are distinct inputs. Integral group models belong to `ReductiveGroupsPartII:RG2.3`; affine Weyl groups,
Bruhat order, admissible sets and Kottwitz maps belong to `RG2.4`. Absolute Lie,
adjoint, root and parabolic theory is imported from the existing ReductiveGroups
roadmap. Its relative and integral weight compatibility is an `RG2.1` refinement.
`RG2.5` owns the integral dual group and does not supply the early stabilizer
calculation.

For an integral degree-d divisor D, B⁺_D and B_D are the completed and punctured
rings supplied by `RelativeFarguesFontaine:RF2:integral-divisors`. On the X version
of the divisor base use the affinoid basis on which D_S is affinoid. The ideal I
of the Cartier divisor is retained throughout finite congruence quotients. The
full positive loop group is an inverse limit. Finite jet quotients and its graded
pieces have finite cohomological dimensions; no finite dimension is assigned to
the whole inverse-limit group.

For a finite set of ordered legs, add their Cartier divisors. At a geometric
point with r distinct untilts there are r local factors, even when there are more
than r labelled legs. Bounds on legs with the same untilt add. The cocenter degree is the sum of the combined local cocharacters over distinct
supports, counted once each; multiplicity is already present in the ordered-leg
sum and in the Cartier equation. The author-copy description before FS VI.3.1
adds an extra weight, corrected in E24. The perverse shift
is the sum of the dimensions of these r local Schubert factors. On a single cell
labelled μ it is d_μ=⟨2ρ,μ⟩. This avoids counting a collision twice in the local
product while forgetting its summed relative-position bound.

A perfect-base GL_n Witt lattice Λ is an embedded finite projective W(R)-module
spanning W(R)[1/p]^n. Pole bounds are locally uniform. For a positive bound use
the quotient W(R)^n/Λ, whose determinant has the positive quotient convention.
Its geometric type is a sorted partition with fixed total length. Dominance is
equal total length together with all initial partial-sum inequalities; coordinatewise
comparison is different. Coordinate-ring perfection is the direct Frobenius
colimit. Mathlib’s `Perfection` is an inverse-limit construction and cannot supply
that interface. A pfp perfect scheme has finite-type models up to Frobenius, with
compatible dimensions and étale topoi supplied by SF.0.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed `AUDIT-21` entries of
`data/library-coverage.json` are the starting point. Their missing geometric
Satake targets are distinct from the abstract algebraic and categorical
substrates in those pins. The declaration statements cited below were inspected
at these commits. Witt vectors, ordinary module flatness, submodules, quotients,
t-structures and hearts, full subcategories, action categories and rigid categories
are reused. This part does not plan those notions again.

Tau Ceti’s `InvertibleSheaf` is the scheme line-bundle carrier, with its trivial
object. That carrier alone supplies neither positivity nor the needed Picard
tensor/descent calculus. Likewise the field-based `ReductiveAffineGroupSchemeCat`
does not provide an integral parahoric model, and `LeftRigidCategory` does not
assert right rigidity. The plan requests the missing interfaces from their owners.
The analytic scheme/adic comparisons are imported from L1/L3 and D6. Before
representability has been proved, a nonanalytic scheme-associated v-sheaf is not
called a diamond simply because its analytic restriction is one.

The initial coefficient setting is prime-to-p torsion, with compatible derived
adic systems supplied by L0. A Satake object is bounded, ULA, relative perverse
and coefficient-flat. Flatness means that derived tensor with every coefficient
module remains perverse. It does not follow from perversity or from a rational
cycle computation. The category of flat objects is used with its additive/exact
structure; it is not asserted to be abelian for integral coefficients. Rational
IC, decomposition and semisimplicity are imported where explicitly stated.

## Order of construction and ownership

The loop and torsor functors use RF2's completed rings and its vector-bundle
descent on each finite Cartier thickening. Passing to finite projective modules
over the completed ring requires a separate RF4 algebraization theorem for
compatible quotient systems: uniform rank, continuous complete ring maps and
effective transition data must be retained. RF4 then supplies the Tannakian
torsor transfer, Beauville–Laszlo gluing and the punctured A_inf extension used
in the parahoric integral comparison. These imports retain the existing owners.
The étale-over-divisor lemma is a separate GS0 target used in smooth loop charts.

Early generic bounded properness uses the generic divisor geometry. Integral
bounded properness also needs the special Witt fibre. It is therefore owned
only by GS0:Witt-geometry and follows the projectivity argument there; it is not
proved a second time in loop geometry. Smooth open-cell geometry is computed
from the opposite parabolic and finite congruence layers. The minuscule
Bialynicki–Birula identification matches the CS and FS sign conventions and
imports the period-sheaf connection and the finite-projectivity criterion where
its source proof needs them.

Witt projectivity follows the geometric determinant route of BS §§6–8. First
construct the filtration/Demazure resolution and prove connected cohomologically
trivial fibres. Descend the product of graded quotient determinants using the
supplier’s fibral line-bundle criterion. On fixed finite models apply the
Witt-specific positivity calculation and then Keel’s general criterion. SF.5
owns the general positivity vocabulary, exceptional locus, Kodaira decomposition,
Keel lemmas, Frobenius extension and Stein contraction. The two duplicate Keel
aliases in the routed paper extraction refer to that same supplier. GS owns the
application, not a second general positivity library.

One prerequisite of that induction needs a precise repair: before applying
Keel on the lower-bound union, construct its pfp proper representative using
closed intersections and finite pinching. This is an SF.1 request and a named
gap. The packet consequently does not treat the union’s representability as a
consequence of the very projectivity theorem being proved. Canonical weakly
normal models and the rank-two cone chart are separate source targets. The announced Hodge determinant comparison remains an obligation. In the cone
chart the corrected order is A⁻¹X, and the adjugate argument proves its integrality
and unit determinant. Its matrix value can depend on the chosen Witt lift:
for A=pI, changing X from pI to pI+p³E₁₂ changes the factor from I to I+p²E₁₂.
The remaining target is the typed truncated-Witt quotient and chart construction,
with existence of a factor and uniqueness of the chart point, rather than a
lift-independent factor. Normal/Cohen–Macaulay conjectures for nonperfect
canonical Schubert models are not assumptions of the established perfect-bound
projectivity target.

Semi-infinite strata and hyperbolic localization give normalized constant-term
functors. VS1 owns Braden’s comparison and the enhanced proper-relative ULA
kernel formalism. The Witt affine intersections, ULA criterion and one-leg
restriction comparison then supply the relative perverse structure. The early scheme perversity/recollement supplier is EDC.5. Its existing coefficient
range is finite fields, self-injective finite DVR quotients and rational fields;
the full FS torsion/adic coefficient range needs the explicit coefficient-reduction
and torsion-pair request. The early shifted constant-term proof uses field dévissage,
the cell dimension bound and hyperbolic duality. It does not use subsequent rational
weight concentration. Perfect constant terms mean bounded complexes with finite
projective terms; their cohomology modules need not themselves be projective. GS1
receives L1/L3 directly for the scheme-to-v-sheaf comparisons. The lisse-category
stage VS3 is not needed for these torsion étale Satake constructions. EDC.7
occurs in the explicitly rational standard/costandard and weight refinements,
without being put in front of GS0 smoothness.

Finally define the full Satake subcategory and its total-cohomology fibre functor.
A finite-support semi-infinite filtration proves finite projectivity of total
cohomology. Both split kernels and split cokernels lift and their universal cones
are preserved; the kernel property together with conservativity proves faithfulness.
An arbitrary infinite grading would not give a finite module. Over a general leg
base this construction does not give a canonical splitting or tensor identification. Define convolution by the bounded proper Hecke correspondence.
EDS and VS supply coherent composition and the Ind extension, including the
associator, units and higher compatibility. ULA kernels compose, the elementary
collision family gives the nonpositive perverse bound, and duality supplies the
other aisle. Testing all coefficient modules proves flatness. Kernel adjunctions
then give evaluation and coevaluation with both triangle identities, and hence
both duals. Symmetry and the tensor fibre comparison have their specified owner
in the second part.

## Sources and passage ledger

The public versions below fix all locators. The original planning and independent
review read extents are retained as provenance. The revision read extents separately
identify what was checked again for this round. All eight downloaded PDFs match the
recorded SHA-256 hashes. A source finding's historical independent verdict is preserved;
it does not become an author-endorsed correction. Mathematical statements are
paraphrased with the corrected hypotheses.

### FS-geometrization

Laurent Fargues, Peter Scholze. [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). Author-hosted 356-page PDF; PDF page = printed page. Re-fetched and passages inspected 2026-10-07.

SHA-256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

**Recorded planning/review passages:**

- VI.1–VI.8, printed pp. 190–226, including proofs.
- IV.2.23–IV.2.26, printed pp. 124–126; IV.6.1–IV.6.8 and IV.6.11–IV.6.14, pp. 155–159, 162–163.

**Passages checked again in this revision:**

- VI.1.2–VI.1.13 and proofs, printed pp.191–196 (text lines9190–9560); in particular the whole VI.1.13 statement/proof p.196 was read for the new routed lemma.
- VI.2 opening and VI.2.2–VI.2.8 with proofs, printed pp.196–201 (text lines9560–9970): split/integral versus generic bases, stabilizer/Lie-weight calculation, BB map, collision bounds and bounded-action truncation.
- VI.5.1–VI.5.7 and proofs, printed pp.209–211 (text lines10410–10565): affine-flag and Demazure diamond geometry.
- Printed pp201–209: §VI.3 semi-infinite construction and VI.3.2–3 full statements/proofs, affineness/dimension; §VI.4 equivariance and CT conservativity.
- Printed pp211–226: §VI.6 ULA, §VI.7 perverse/Satake/cohomology/duality and §VI.8 convolution and rigidity, statements and proofs.
- Printed pp123–128: §IV.2.3.3 kernel 2-category and IV.2.23–26 ULA adjointability/relative variant/duality/composition; surrounding text including IV.2.28.
- Rendered p207: unqualified VI.3.8 dimension sentence and VI.4.1 statement.
- Root additionally read the complete VI.3.2–VI.3.3 statements/proofs on pp.203–204, IV.2.28 and proof on p.127, and IV.6.11–IV.6.14 on pp.162–163, including the inverse-action duality formula and ULA preservation.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf; sha256: 9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905; bytes: 2665415; matchesInheritedVersion: True

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf; SHA256: `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`. The review report records the exact passage extents and version limits.

### BS17-witt-grassmannian

Bhargav Bhatt, Peter Scholze. [Projectivity of the Witt vector affine Grassmannian](https://arxiv.org/abs/1507.06490). arXiv:1507.06490v3, 61-page PDF; PDF page = printed page.

SHA-256: `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`.

**Recorded planning/review passages:**

- §§2–4, 6–10 (geometric determinant route; §5 only a cited alternative), printed pp. 4–18, 21–39.

**Recorded access limitation:** Publisher PDF endpoint returned an HTML paywall with access=No on 2026-10-07; final arXiv v3 is the source read. No published-text equivalence is asserted.

**Passages checked again in this revision:**

- arXiv v3 only: Selected §6 descent statements/proofs pp20–26, including6.1,6.8,6.11 and6.13–6.14; §7.1–7.14 pp26–32 (types, Quot/filtration and fibres); §8.1–8.11 pp32–36 (determinant, positivity, full Theorem8.3 proof); §9.4–9.7 p37; §10.1–10.6 pp37–40. No published Springer PDF was read by this agent.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://arxiv.org/pdf/1507.06490v3; sha256: b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e; bytes: 687439; matchesInheritedVersion: True

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://arxiv.org/pdf/1507.06490v3?download=1; SHA256: `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`. The review report records the exact passage extents and version limits.

### SW20-berkeley

Peter Scholze, Jared Weinstein. [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Author-hosted Berkeley Lectures PDF dated March 27, 2020; PDF page = printed page + 10.

SHA-256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.

**Recorded planning/review passages:**

- Lectures 18–20, especially §§19.2–19.4 and 20.3–20.5; Lecture 21 §§21.1–21.5, printed pp. 191–197; Appendix 21.6 opening pp. 198–200.

**Passages checked again in this revision:**

- §19.2, Proposition19.2.1, Definition19.2.2, Proposition19.2.3 and Theorem19.2.4 with proofs, printed pp.172–173 (text lines9430–9535).
- §19.4, Definition19.4.1 and Proposition19.4.2 with entire proof, printed pp.176–177 (text lines9690–9770): opposite parabolic, lattice filtration and finite-projectivity argument.
- Proposition20.4.5 statement and opening proof, printed pp.187–188 (text lines10280–10340): BD bounds, surjectivity and proper/local-spatial conclusions. The remainder of that proof and all of §19.3 were not re-read in this revision.
- Author PDF dated27March2020: §20.3.1–20.3.7 pp185–186; §20.5.3–20.5.4 p190; §21.1 pp191–192; Theorem21.2.1 and proof/21.2.2–3 pp192–194; Proposition21.4.3 and proof pp195–196; §21.5 setup and Proposition21.5.1 with proof passagepp196–197.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf; sha256: 225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc; bytes: 1695564; matchesInheritedVersion: True

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf; SHA256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`. The review report records the exact passage extents and version limits.

### Zhu17

Xinwen Zhu. [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Published Annals 185 (2017), pp. 403–492; PDF page = printed page − 402.

SHA-256: `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7`.

**Recorded planning/review passages:**

- §§1.1–1.4, 2.1–2.2, Appendices A and B, printed pp. 412–440, 464–488.

**Passages checked again in this revision:**

- Printed pp429–432: §2.1 rational equivariant perverse category, parity/semisimplicity and convolution statements/proofs.
- Printed pp434–440: §2.2 weight concentration, minuscule/quasi-minuscule cases and minimal-convolution generation including Lemmas2.11–2.17.
- Printed pp481–482: AppendixA.3 connected-kernel equivariance and final pro-unipotent independence convention.
- Rendered p482: A.3.5 final pro-unipotent-kernel paragraph (E13).
- Published Annals PDF: coweight-order conventionp412; Results 1.9–1.12 pp418–421; Results 1.17–1.20 pp424–426 plus affine-flag discussionp427; Results 2.5–2.12 and 2.14–2.17 pp433–440 (MV statements and supporting proof passages); A.29–A.31 pp476–477; A.3.1–A.3.3 pp478–480; AppendixB opening and B.1–B.11 pp482–488. Pages433,436 and488 also visually rendered and inspected. References named inside these passages were not independently chased.
- Root additionally read the complete B.10–B.11 chart argument on pp.487–488 and the Corollary 2.9 proof display on p.436, checking the full-Witt determinant distinction and the omitted IC shift.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf; sha256: 5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7; bytes: 768124; matchesInheritedVersion: True

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf; SHA256: `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7`. The review report records the exact passage extents and version limits.

### CS17

Ana Caraiani, Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Published Annals 186 (2017); PDF page = printed page − 648.

SHA-256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.

**Recorded planning/review passages:**

- §3 setup p. 675; §3.4 pp. 684–686.

**Passages checked again in this revision:**

- Published §3.4, Propositions3.4.3, Lemma3.4.4, Theorem3.4.5, Lemma3.4.6 and proofs, printed pp.684–686 (text lines1660–1813): lattice filtration, sign convention, minuscule BB comparison and membership detection.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf; sha256: 4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a; bytes: 899242; matchesInheritedVersion: True

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf; SHA256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`. The review report records the exact passage extents and version limits.

### GLX26

Ian Gleason, Dong Gyu Lim, Yujie Xu. [The connected components of affine Deligne–Lusztig varieties](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf). Published Inventiones 243 (2026), pp. 805–861; PDF page = printed page − 804.

SHA-256: `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485`.

**Recorded planning/review passages:**

- §1.1 p. 806; §3.2–3.3 pp. 822–824.

**Passages checked again in this revision:**

- Published Inventiones243(2026): §3.2 and §3.3/Lemmas3.3–3.4 with proofs pp822–823 and Remark3.5p824. The non-minuscule local-model extension is cited by GLX; its external source was not newly audited here.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf; sha256: c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485; bytes: 1815979; matchesInheritedVersion: True

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf; SHA256: `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485`. The review report records the exact passage extents and version limits.

### VH24

Pol van Hoften. [Mod p points on Shimura varieties of parahoric level](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Published Cambridge PDF, PDF pages used as locators.

SHA-256: `d86da9a0e35c93d22df291979be37a5acf1ddc44fbd762e11f2a5f6c92961be0`.

**Recorded planning/review passages:**

- §2.2.6–§2.2.15, PDF pp. 13–16 (Witt flags, admissible strata and torsor adapters).

**Passages checked again in this revision:**

- Published Cambridge PDF: relative-position §2.2.14 and admissible-set/local-model §2.2.15 pp15–16, with preceding parahoric-change argument on p15. The minuscule qualifier was read directly.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf; sha256: d86da9a0e35c93d22df291979be37a5acf1ddc44fbd762e11f2a5f6c92961be0; bytes: 999392; matchesInheritedVersion: True

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf; SHA256: `d86da9a0e35c93d22df291979be37a5acf1ddc44fbd762e11f2a5f6c92961be0`. The review report records the exact passage extents and version limits.

### He21

Xuhua He. [Cordial elements and dimensions of affine Deligne–Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf). Published Forum of Mathematics Pi 9 (2021), e9; PDF page = printed page.

SHA-256: `d53843f0c8875cf1e14173ad271e025bd30f177fe319a7d83926629d454683dd`.

**Recorded planning/review passages:**

- §2.2 p. 5; §§5.3–5.4 pp. 9–12.

**Passages checked again in this revision:**

- Published Forum of Mathematics,Pi9(2021)e9: §2.2 standing simple quasi-split settingp4; §5.3 notation and Proposition5.6 p10; surrounding proof§5.4 pp10–12 inspected for its use of the convolution inequalities. GH10/GHN source proofs were not newly read.

**Revision access:** date: 2026-10-07; job: BP-GeometricSatakeAndFusion--GS0~2; url: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf; sha256: d53843f0c8875cf1e14173ad271e025bd30f177fe319a7d83926629d454683dd; bytes: 418679; matchesInheritedVersion: True

Keel's general theory is requested from SF.5. The GS projectivity route uses BS's geometric determinant descent and positivity application. BS §5 is an alternative route and is not an input to that proof.

The routed-source ledger below accounts individually for 239 extracted items. Proof ingredients share the appropriate target only when their contracts are explicitly present; the three newly routed FS lemmas have separate nodes. Out-of-scope conclusions, conjectures and supplier-owned theory retain those dispositions.

| Paper | Routed items |
| --- | --- |
| PAPER-BHATT-SCHOLZE-17 | 95 |
| PAPER-CARAIANI-SCHOLZE-17 | 6 |
| PAPER-FARGUES-SCHOLZE-21 | 3 |
| PAPER-GLEASON-LIM-XU-26 | 2 |
| PAPER-HE-21 | 14 |
| PAPER-VANHOFTEN-24 | 7 |
| PAPER-ZHU-17 | 112 |

**Current independent review access:** date: 2026-10-08; job: REV-GeometricSatakeAndFusion--GS0~2; opened PDF: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf; SHA256: `d53843f0c8875cf1e14173ad271e025bd30f177fe319a7d83926629d454683dd`. The review report records the exact passage extents and version limits.

## Coverage and acceptance

| Stage | Status | Remaining obligations |
| --- | --- | --- |
| `GeometricSatakeAndFusion:GS0` | planned | Resolve the SF/RF/RG supplier refinements inherited from the three substages. |
| `GeometricSatakeAndFusion:GS0:Schubert-smoothness` | planned | RG Lie-weight/parabolic computation and the CS finite-projectivity/period-sheaf supplier interfaces. |
| `GeometricSatakeAndFusion:GS0:Witt-geometry` | planned | Boundary pinching before Keel; corrected truncated-Witt cone-factor interface; sketch-only canonical Hodge determinant comparison. Compatible bounded pfp flag models, local-model functoriality and componentwise adjoint fibre-dimension transfer. |
| `GeometricSatakeAndFusion:GS0:loop-geometry` | planned | RF4 torsor gluing/Anschütz extension and integral/parahoric RG refinements. Exact geometric Lean signatures after supplier carriers are available. The separate FS VI.1.13 lift-functor target requires RF2 integral geometric-support and closed support-map contracts, and its exact geometric Lean carrier remains omitted. |
| `GeometricSatakeAndFusion:GS1` | planned | Model-dependent rational MV trace normalization and corrected quasi-minuscule/minimal-generation argument. Application and descent of the existing VS1 hyperbolic/ULA calculus through bounded finite-dimensional Artin Hecke quotient charts, plus the EDS Ind t-structure extension. EDC5 coefficient reduction/adic and torsion-pair scope; VS1 filtered-equivariance ordinary-cohomology continuity. Exact geometric signatures for the length and lattice-position semicontinuity lemmas require the integral geometric-DVR/fibre-map and bounded rank-one fibre-detection supplier extensions; their full mathematical contracts are planned here. |
| `GeometricSatakeAndFusion:GS2` | planned | Resolve the coherent correspondence/stack-kernel refinements inherited from the two substages. |
| `GeometricSatakeAndFusion:GS2:Satake-closure` | planned | Proper-relative ULA evaluation/coevaluation with both triangle identities and the compatible one-leg comparison. |
| `GeometricSatakeAndFusion:GS2:correspondences` | planned | Enhanced associator/unit coherence and filtered finite-projective fibre comparison, with no canonical tensor splitting yet. |

Acceptance requires the statements, hypotheses, direct dependencies, APIs and tests below to agree with the named sources. Closure additionally resolves the supplier refinements and gaps. A prototype with explicitly omitted geometric conditions cannot by itself satisfy the full mathematical acceptance criterion.

## Beilinson–Drinfeld Grassmannians and loop groups

`GeometricSatakeAndFusion:GS0`

This is the aggregate geometric target. Its nodes are owned by the loop-geometry, Schubert-smoothness and Witt-geometry substages and also realise GS0. The aggregate imports their existing targets; it does not create second Grassmannian, smoothness or properness nodes. Acceptance checks all three families, including the two-leg collision bound and the generic/integral properness distinction.

## Loop spaces and bounded modifications

`GeometricSatakeAndFusion:GS0:loop-geometry`

The three moduli objects are separated: loop evaluation, the Hecke groupoid with automorphisms, and the Grassmannian quotient sheaf with a chosen punctured trivialization. Ordered legs, generic Galois descent and generic bounded properness use these objects. The affine flag resolution is retained as a distinct construction. Finite congruence layers connect the moduli to Lie data without attributing a finite dimension to the complete positive loop group. Acceptance includes the diagonal stabilizer of the identity Hecke modification, the unit Grassmannian section, the GL₂ equal-degree dominance counterexample, and the empty reduced-word flag resolution.

### Positive and full loop spaces

`GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.positiveLoopSpace`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

For an affine O_E-scheme Z and a divisor D in Div^d_𝒴, L⁺Z(S)=Z(B⁺_D(S)) and LZ(S)=Z(B_D(S)) are v-sheaves over Div^d_𝒴. The generic E-scheme version is defined over Div^d_Y or Div^d_X. For X use the basis of affinoid S for which D_S is affinoid. For a group scheme these are group v-sheaves, with the natural inclusion L⁺G→LG.

**Hypotheses**

- Z affine; d≥1; integral G is a split reductive O_E-model; generic G/E can be ramified.

**Proof or construction**

1. Import completed rings, their functoriality and v-descent from RF2.
2. Evaluate the affine functor of points on those rings; v-descent of sections follows from affine equations and the structure sheaf.
3. Restrict to the affinoid-divisor basis over X and descend across its open covers.

**Direct prerequisites**

- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`
- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `ReductiveGroupsPartII:RG2.3`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-topological-comparison`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.5, p. 192. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.1.7–VI.1.9: Loop maps present both modification moduli.
- HeckeStacksAndLocalShtukas:HS0: Local modifications form the relative Hecke correspondence.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.positiveLoopSpace_eval` | characterisation | At a completed ring A, the positive loop space is the affine functor of points F(A); the full loop space uses A[1/ξ]. |
| `TauCeti.Suggested.GeometricSatake.positiveLoopSpace_map` | functoriality | A ring map induces the map F(f); identity and composition agree with those in the affine functor. |
| `TauCeti.Suggested.GeometricSatake.positiveLoopSpace_map_comp` | relation | Positive loop maps compose in the same order as ring maps. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.loop_gm_units` | computation | For G_m the evaluation at A agrees with the unit group of A. |
| `TauCeti.Suggested.GeometricSatake.loop_trivial` | degenerate | The trivial affine group has one loop at every ring. |
| `TauCeti.Suggested.GeometricSatake.loop_affine_evaluation` | compatibility | Affine evaluation uses the existing CommRingCat functor, not an underlying-set functor on schemes. |

**Acceptance**

- For G=G_m the two groups are (B⁺)ˣ and Bˣ; for G=GL_n they are invertible matrices.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** This signature retains affine functor evaluation; completed-ring assignment, divisor sites, v-descent and group-valued structure are supplied by RF2/RG. Full loop evaluation is the same signature at the localized input ring.

**Implementation status:** unchecked.

**Planet:** Loop spaces.

### Local Hecke stack

`GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.localHeckeAction`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

Hck_G(S) is the groupoid of two G-torsors on Spec B⁺_D(S), together with an isomorphism of their B_D-restrictions. It is a small v-stack; its étale-stack presentation is [L⁺G\LG/L⁺G].

**Hypotheses**

- The same divisor basis and group-model conditions as loop spaces.

**Proof or construction**

1. Use RF2 finite-thickening descent together with RF4 effective descent/algebraization of compatible completed finite-projective modules (uniform rank and continuity), then transfer through the faithful exact tensor description to G-torsors. The completed-ring conclusion is not supplied by RF2 finite-thickening descent alone.
2. Trivialize torsors étale-locally using the geometric DVR and smooth finite-level lifting/spreading.
3. Changes of the two trivializations give the double quotient; keep automorphisms, rather than taking only isomorphism classes.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`
- `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `RelativeFarguesFontaine:RF4:G-torsors`
- `ReductiveGroupsPartII:RG2.3`
- `mathlib:CategoryTheory.ActionCategory`
- `RelativeFarguesFontaine:RF2:untilts`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.6–VI.1.7, p. 193. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.1.7: The double quotient must keep stabilizers.
- FS VI.8: The middle positive-loop action is divided out in convolution.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.localHeckeAction_formula` | characterisation | The double action is (h₁,h₂)·g=h₁gh₂⁻¹, and the quotient is an action groupoid. |
| `TauCeti.Suggested.GeometricSatake.localHeckeAction_groupoid` | compatibility | For the double action, the local quotient uses Mathlib ActionCategory with its Groupoid instance. |
| `TauCeti.Suggested.GeometricSatake.localHeckeAction_unit_stabilizer` | characterisation | The automorphism labels of the identity are exactly pairs (h,h), retaining the diagonal positive-loop group. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.hecke_trivial_group` | degenerate | For the trivial group there is one modification and one automorphism. |
| `TauCeti.Suggested.GeometricSatake.hecke_identity_automorphisms` | non-example | In the multiplicative encoding of ℤ, the diagonal pair labelled by 1 additive fixes the identity modification and has a nonidentity group label. Replacing the action groupoid by its orbit set loses this automorphism. |
| `TauCeti.Suggested.GeometricSatake.hecke_double_action` | computation | For G=H, (h,1) sends the identity to h, whereas (1,h) sends it to h inverse. |

**Acceptance**

- At the trivial modification automorphisms are the diagonal L⁺G; for the trivial group the stack is the base.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The action groupoid is the local presentation. Stackification, ring-valued torsors and étale-local trivialization are not encoded by a new unknown predicate.

**Implementation status:** unchecked.

**Planet:** Local Hecke stack.

### Beilinson–Drinfeld Grassmannian

`GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.grassmannianQuotient`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

Gr_G(S) classifies a G-torsor on Spec B⁺_D(S) with a B_D-trivialization. It is a small v-sheaf and the étale sheafification of LG/L⁺G. Its map to Hck_G fixes the second torsor as trivial.

**Hypotheses**

- Integral and generic group and divisor conventions as above.

**Proof or construction**

1. Use the same effective torsor descent as Hck_G.
2. The B-trivialization kills all automorphisms; étale-local trivialization gives the quotient sheaf.
3. Apply imported Beauville–Laszlo gluing for the identification with modifications off D on the relative curve.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`
- `RelativeFarguesFontaine:RF4:G-torsors`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-topological-comparison`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.8–VI.1.9, pp. 193–194. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.2: Schubert cells live in the quotient sheaf.
- FS VI.7.9: Pullback from Hecke sheaves is fully faithful on the Grassmannian.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_eq` | compatibility | The trivialized local presentation is the existing right-coset carrier G/H; H need not be normal. |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_mk` | constructor | Every full loop gives its right-coset class and hence a trivialized modification. |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_eq_iff` | characterisation | Two trivializations define the same point precisely when g⁻¹g′ lies in H. |
| `TauCeti.Suggested.GeometricSatake.grassmannianQuotient_unit` | constructor | The unit section is the class of the identity full loop. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.grassmannian_zero` | degenerate | The unit section is the coset of the identity full loop. |
| `TauCeti.Suggested.GeometricSatake.grassmannian_all_subgroup` | computation | When H=G, the local quotient has exactly one point. |
| `TauCeti.Suggested.GeometricSatake.grassmannian_non_normal` | compatibility | Grassmannian cosets do not require H normal; the quotient is the existing set quotient even without a quotient-group structure. |

**Acceptance**

- The unit section is the trivial torsor with identity trivialization.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the coset presentation is typed; étale sheafification and the Beauville–Laszlo comparison require the RF4 supplier. The unit example tests its naming, while the nonnormal API prevents imposing an incorrect normality requirement.

**Implementation status:** unchecked.

**Planet:** Beilinson–Drinfeld Grassmannian.

### Ordered legs and divisor base change

`GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.orderedLegCollision`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

For finite I, pull back Gr_G and Hck_G along (Div¹_𝒴)^I→Div^{|I|}_𝒴 given by addition of Cartier divisors. Formation commutes with base change. Over disjoint divisors the completed rings split as products and Gr factors as the product of the individual Grassmannians. Equal untilts are counted once in the product, but their cocharacters add in the bound.

**Hypotheses**

- Split integral model; restrict to generic Y/X for a general G/E.

**Proof or construction**

1. Import divisor addition, disjointness and completion base change from RF2.
2. Apply product decomposition of torsors and trivializations to the functor of points.
3. At a collision the ideal has repeated factors but its completion is the same adic ring; the relative-position bound is the sum.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`
- `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`
- `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.6 and preceding discussion, pp. 199–200. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- Two equal legs have a single local factor bounded by μ₁+μ₂; two distinct legs have two factors.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The typed coweight core adds labels at collisions; divisor-completion base change and disjoint-product v-sheaf isomorphisms need RF2.

**Implementation status:** unchecked.

### Generic Schubert bounds

`GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.dominanceBound`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

After a splitting extension and choices T⊂B⊂G, define Gr_{≤μ} by geometric rank-one points whose Cartan coweight is ≤μ; Gr_μ has exact relative position μ. Over generic Div^d_Y and Div^d_X the bounded inclusions are closed and the projections proper and representable in spatial diamonds. Their filtered union in each π₁(G)-component is Gr. Bounds for a tuple of legs sum at collisions.

**Hypotheses**

- μ dominant; μ−λ is a sum of positive coroots with the same π₁-class. General G/E descends its Galois-stable orbit of bounds.

**Proof or construction**

1. Import Cartan decomposition and its functorial descent from RG2.4.
2. Use SW 19.2–19.4 and 20.4.5 for generic properness: the successive bounded convolution tower surjects, giving quasicompactness in addition to partial properness.
3. Detect closedness on geometric points; ordered covers and finite splitting descent give the Div^d versions. Integral properness is the distinct Witt node.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`
- `ReductiveGroupsPartII:RG2.4`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `DiamondsAndVStacks:D6/pre-adic-diamondification`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-topological-comparison`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.2–VI.2.3, pp. 196–197. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.2.2–VI.2.3: Bounds require Cartan labels and the same component.
- FS VI.8: Bounded convolution lands in the summed cocharacter bound.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.dominanceBound_iff` | characterisation | For GL_n, dominance means equal total degree and every initial partial sum of ν at most the corresponding sum of μ. |
| `TauCeti.Suggested.GeometricSatake.dominanceBound_refl` | relation | Every dominant cocharacter lies in its own bound. |
| `TauCeti.Suggested.GeometricSatake.dominanceBound_trans` | relation | Bounds are nested by transitivity of the dominance relation. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.bound_zero_component` | degenerate | For a torus of rank one the bound is equality, not the usual integer order. |
| `TauCeti.Suggested.GeometricSatake.bound_gl2` | computation | GL₂ coweight (1,1) is below (2,0). |
| `TauCeti.Suggested.GeometricSatake.bound_wrong_degree` | non-example | The cocharacter (1,0) is not below (2,0), despite its smaller partial sums. |

**Acceptance**

- μ=0 is the unit section; a bound in one component does not include a coweight with another π₁-class.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The GL_n combinatorial core is a fully stated predicate, not a placeholder. Geometric relative-position maps, closedness and properness have their own theorem nodes and supplier requests.

**Implementation status:** unchecked.

**Planet:** Schubert bounds.

### Galois descent of bounded modifications

`GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.genericGaloisDescent`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

For finite Galois E′/E splitting G, base change identifies loop spaces, torsor-modification functors and each Galois-stable union of Schubert strata with the split constructions over E′. Descent returns the orbit-labelled cell Gr_{μ̄} and bound Gr_{≤μ̄}; this asserts no reductive O_E-model for a ramified G.

**Hypotheses**

- Generic divisors on Y or X; μ̄ a finite Galois orbit.

**Proof or construction**

1. Import finite étale/v-descent of affine group data.
2. Apply descent to geometric Cartan labels and their stable unions.
3. Descend properness and local spatiality along the finite splitting cover. Cohomological smoothness is first proved in open-cell-stabilizer-and-smoothness and then descended there; it is not an input to this earlier node.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`
- `ReductiveGroupsPartII:RG2.3`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2 opening and VI.8 final paragraphs, pp. 196, 226. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- An individual μ not defined over E is retained only after splitting; its orbit descends.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only isomorphism detection is typed. Effective Galois descent and split orbit-bound data are omitted.

**Implementation status:** unchecked.

### Affine flags and Demazure spaces over Spd O_C

`GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.demazureChains`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

For split G and an Iwahori model 𝓘⊂G, Fl_G=LG/L⁺𝓘 over Spd O_C. Its projection to Gr has v-locally fibre (G/B)^⋄ and is proper and cohomologically smooth. For w=s₁⋯s_rω reduced in the extended affine Weyl group, the Demazure space is the contracted product of the minimal parahorics divided by L⁺𝓘, followed by ω. It is an iterated (P¹)^⋄-bundle, proper over the bound, and isomorphic over the open w-cell.

**Hypotheses**

- Parahoric models and affine Weyl group from RG2.3–RG2.4.

**Proof or construction**

1. Construct torsor quotients and their changes of trivialization.
2. Use each minimal parahoric quotient P_i/𝓘=(P¹)^perf on the special fibre and the corresponding integral flag diamond.
3. Multiply the factors; reducedness gives the open-cell isomorphism and the boundary normal-crossing strata needed for ULA generation.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`
- `ReductiveGroupsPartII:RG2.3`
- `ReductiveGroupsPartII:RG2.4`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.5.1–VI.5.7, pp. 209–211. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.5: Demazure pushforwards generate the ULA category.
- Zhu 1.4: Reduced-word towers prove parahoric projectivity.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.demazureChains_points` | characterisation | The point core consists of chains x₀,…,x_r with each consecutive pair in the specified simple-step relation. |
| `TauCeti.Suggested.GeometricSatake.demazureChains_endpoint` | projection | Multiplication forgets the intermediate flags and keeps the endpoints. |
| `TauCeti.Suggested.GeometricSatake.demazureChains_base_change` | functoriality | A map of flag spaces preserving each simple-step relation acts on every vertex of a Demazure chain. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.demazure_empty` | degenerate | An empty chain is one flag; its two endpoints coincide. |
| `TauCeti.Suggested.GeometricSatake.demazure_one_step` | computation | A one-step chain is the given simple-step incidence relation. |
| `TauCeti.Suggested.GeometricSatake.demazure_not_product` | non-example | If a simple-step relation is empty, there is no chain, even if the flag space is nonempty. |

**Acceptance**

- The empty word gives the ω-cell; a simple reflection gives P¹ with its open A¹ cell.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The typed chain is the functor-of-points incidence core; contracted products, parahoric torsors and the iterated P¹-bundle structures need RG/SF/VS suppliers. This core does not prove representability.

**Implementation status:** unchecked.

**Planet:** Demazure spaces.

### Separated étale lifts over an effective divisor

`GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor` — lemma.

**Declaration:** `TauCeti.Suggested.GeometricSatake.etaleOverDivisor`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

Let S be a perfectoid space over F_q with a map S→Div^d_𝒴 and associated Cartier divisor D_S⊂𝒴_S. For any separated étale map of adic spaces D′→D_S, the functor on perfectoid T→S sending T to Hom_{D_S}(D_T,D′) is represented by a perfectoid space S′ with a separated étale map S′→S. The representing bijections Hom_S(T,S′)≃Hom_{D_S}(D_T,D′) are natural in T.

**Hypotheses**

- E is a nonarchimedean local field with residue F_q; the integral divisor base is Div^d_𝒴, so untilts over O_E including special-characteristic legs are allowed.
- D_T is the pullback effective Cartier divisor on 𝒴_T. The degree d is finite; repeated legs retain their Cartier multiplicities. The map D′→D_S is separated étale. No reductive group, coefficient ring or ℓ≠p hypothesis is needed.

**Proof or construction**

1. Use v-descent for separated étale perfectoid spaces to reduce S to a strictly totally disconnected cover (DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks; FS cites Sch17a Proposition 9.7).
2. Exhaust D′ by increasing quasicompact opens and work with one such open. On each geometric fibre, D_S up to nilpotents is the finite disjoint union of its distinct geometric O_E-untilt supports. A separated étale D′ over this fibre is a disjoint union of open subspaces.
3. Spread these fibrewise descriptions to a neighbourhood, using the étale local structure theorem and the étale-site comparison (FS cites Sch17a Proposition 11.23 and Lemma 15.6), and glue the resulting local representing spaces.
4. For the reduced case D′⊂D_S open, the representing locus is the complement of the image of |D_S|\|D′| under |D_S|→|S|. This is open because that support map is closed. Its inclusion into S represents exactly the lift functor.
5. Descent and gluing give the separated étale S′→S and the natural universal property. Uniqueness follows from Yoneda.

**Direct prerequisites**

- `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`
- `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`
- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `RelativeFarguesFontaine:RF2:untilts`
- `DiamondsAndVStacks:D1/strictly-totally-disconnected`
- `DiamondsAndVStacks:D3/etale-and-finite-etale-are-v-stacks`
- `DiamondsAndVStacks:D5/local-structure-of-etale-maps`
- `DiamondsAndVStacks:D6/etale-site-comparison`
- `RelativeFarguesFontaine:RF2:integral-divisors`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma VI.1.13 and proof, printed/PDF p. 196. Exactly the separated étale representability of the divisor-lift functor, including its natural universal property.

**Uses shaping the API**

- GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops: After forming D′=D_S×_Z Z′ for separated étale Z′→Z, this lemma represents T_{Z′}×_{T_Z}S and proves the separated étale comparison in FS VI.1.12.

**Acceptance**

- For D′=D_S, the represented functor is final over S and S′≃S.
- For d>0 and D′ empty, every geometric fibre has a nonempty divisor, so the represented functor is empty and S′ is empty; for d=0, D_T is empty and S′≃S.
- Over a geometric base with r distinct support points, D′ a disjoint union of n labelled copies of D_S has n^r lifts; coincident legs do not create additional choices.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Étale-over-divisor geometric carriers and support-map input: FS VI.1.13 is now a distinct named lemma target with its exact universal property. Its §13 Lean signature is omitted until the actual perfectoid/adic category, divisor pullback and separated-étale representability carriers exist. RF2 must additionally supply the integral geometric-support description (including special O_E-untilts) and the closed support map |D_S|→|S|; existing generic E-untilt complete-DVR data are insufficient for that integral scope. This is an interface gap, not a claim that the source lemma is unproved.

**Prototype boundary:** The named Lean declaration TauCeti.Suggested.GeometricSatake.etaleOverDivisor is omitted under PROTOCOL §13 pending the actual perfectoid/adic-space, effective-divisor pullback, separated-étale and representability carriers. The required signature quantifies E,S,d,D_S,D′→D_S and constructs S′→S with natural Hom_S(T,S′)≃Hom_{D_S}(D_T,D′). An arbitrary Type equivalence or an unspecified Prop field would not express this theorem.

**Implementation status:** unchecked.

**Added by:** `BP-GeometricSatakeAndFusion--GS0~2`.

### Smooth scheme loops over a divisor

`GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.smoothSchemeLoopDimension`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

For a smooth quasiprojective Z→O_E of relative dimension n, the functor of maps D_S→Z is representable in locally spatial diamonds, partially proper and ℓ-cohomologically smooth of dimension dn over Div^d_𝒴. Separated étale maps Z′→Z give representable separated étale maps T_{Z′}→T_Z; open immersions give open immersions.

**Hypotheses**

- D_S affinoid on the chosen basis; ℓ≠p.

**Proof or construction**

1. For affine space, pull back to the ordered-leg cover and filter the map by d successive affine-space diamonds of the corresponding untilts; each layer has dimension n.
2. For separated étale Z′→Z and S→T_Z, form the separated étale adic map D′=D_S×_Z Z′→D_S. Apply etale-over-divisor (FS VI.1.13) to represent T_{Z′}×_{T_Z}S by a separated étale perfectoid space over S. Open immersions therefore induce open immersions of the mapping functors.
3. At a geometric point D_S has finite support. Quasiprojectivity supplies an affine neighbourhood of its image in Z. For affine Z, a closed immersion into affine space proves local spatiality and partial properness.
4. Choose affine neighbourhoods of these finitely many image points admitting separated étale coordinates to A^n over O_E. The affine-space calculation and separated étale comparison give cohomological smoothness of dimension dn.

**Direct prerequisites**

- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- `ReductiveGroupsPartII:RG2.3`
- `GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor`
- `RelativeFarguesFontaine:RF2:untilts`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.12–VI.1.13, pp. 195–196. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For A¹ and degree d the dimension is d.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Étale-over-divisor geometric carriers and support-map input: FS VI.1.13 is now a distinct named lemma target with its exact universal property. Its §13 Lean signature is omitted until the actual perfectoid/adic category, divisor pullback and separated-étale representability carriers exist. RF2 must additionally supply the integral geometric-support description (including special O_E-untilts) and the closed support map |D_S|→|S|; existing generic E-untilt complete-DVR data are insufficient for that integral scope. This is an interface gap, not a claim that the source lemma is unproved.

**Prototype boundary:** Only the degree-times-relative-dimension arithmetic is typed; representability, partial properness and ℓ-cohomological smoothness are missing supplier notions.

**Implementation status:** unchecked.

### Congruence filtration of positive loops

`GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.congruenceFiltration`.

**Owner:** `GeometricSatakeAndFusion:GS0:loop-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:loop-geometry`, `GeometricSatakeAndFusion:GS0`.

L⁺_mG=ker(L⁺G→G(B⁺/I^m)), m≥1, has successive quotients Lie(G)⊗_{O_E}I^m/I^{m+1}. For degree d these are vector-group diamonds of ℓ-dimension d·dim G. The reduction L⁺G/L⁺_1G is the functor of maps D_S→G; in degree one it is G^⋄. The geometry assertion is for the finite quotients and graded pieces, not for the entire inverse-limit group with a finite dimension.

**Hypotheses**

- G split reductive O_E-model; ℓ≠p; I is the ideal of the degree-d divisor.

**Proof or construction**

1. Linearize the group law modulo successive powers of I using smoothness of G.
2. Import the Cartier-module and geometric DVR descriptions.
3. Reduce degree d on the ordered-leg cover to vector-group layers; apply DSO smoothness and descent.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`
- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`
- `ReductiveGroupsPartII:RG2.1`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.10–VI.1.11, pp. 194–195. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For GL_n the graded piece is M_n⊗I^m/I^{m+1}, with addition as group law.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The group kernel is concrete. The Lie/Cartier-line graded-piece isomorphism and finite-quotient smoothness require RG/RF/DSO interfaces.

**Implementation status:** unchecked.

**Planet:** Congruence filtration.

## Early Schubert smoothness

`GeometricSatakeAndFusion:GS0:Schubert-smoothness`

Work with finite jets on a bounded locus. Reduce the open-cell stabilizer to the opposite parabolic and its congruence pieces to Lie weights. Truncation at a sufficiently large positive depth removes the deep positive-loop action. The resulting smoothness calculation gives dimension ⟨2ρ,μ⟩. For minuscule μ its unipotent fibres disappear, yielding the flag-variety identification. Acceptance must reconcile μ(ξ) with CS’s μ(ξ⁻¹), retain the one-leg normalization, and use the finite-projectivity and connection inputs rather than declaring pointwise detection automatic.

### Truncated positive loop groups

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`. **Realises:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS0`.

For m≥1, L^{+,<m}G(S)=G(B⁺_D(S)/I^m) is the finite congruence quotient of L⁺G as a v-sheaf. Reduction has smooth vector-group kernels Lie(G)⊗I^j/I^{j+1}, 1≤j<m. These quotients provide finite-dimensional group actions on bounded Hecke loci.

**Hypotheses**

- Split smooth integral model; degree-d divisor; ℓ≠p.

**Proof or construction**

1. Use smooth lifting across nilpotent thickenings to identify the quotient, not only its naive pointwise image.
2. Linearize each finite step and apply DSO smoothness.
3. Construct the transition maps of the finite quotients. The later truncation-of-the-loop-action theorem proves the factorization of bounded actions; it is not used to construct these quotients.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`
- `ReductiveGroupsPartII:RG2.3`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.10–VI.1.11, pp. 194–195; VI.2.8, p. 201, for the later bounded-action application. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.2.8: Bounded actions factor through this quotient.
- FS VI.7: Perverse descent uses smooth finite truncations.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop_eval` | characterisation | The finite loop quotient evaluates F on the ring A/I^m, rather than the subgroup ker(F(A)→F(A/I^m)). |
| `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop_reduction` | functoriality | Reduction of a positive loop gives a point in the m-th quotient; smoothness makes this locally surjective. |
| `TauCeti.Suggested.GeometricSatake.truncatedPositiveLoop_transition` | functoriality | For a≤b, reduction modulo I^b maps to reduction modulo I^a. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.truncation_one` | computation | At m=1 the quotient is G(A/I), not the congruence kernel. |
| `TauCeti.Suggested.GeometricSatake.truncation_trivial_group` | degenerate | Every finite quotient of the trivial group is trivial. |
| `TauCeti.Suggested.GeometricSatake.truncation_ring_quotient` | compatibility | The ring input is Mathlib Ideal.Quotient, preserving the ideal and its exponent. |

**Acceptance**

- At m=1 only the reduction group remains.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Nilpotent lifting, v-local surjectivity and finite-dimensional smoothness are omitted from the core type; no finite dimension is assigned to the entire positive loop group.

**Implementation status:** unchecked.

**Planet:** Truncated positive loops.

### Open Schubert cell smoothness

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.schubertCellDimension`.

**Owner:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`. **Realises:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS0`.

Gr_{G,μ} is ℓ-cohomologically smooth of dimension ⟨2ρ,μ⟩ over the degree-one divisor base. Its stabilizer in L⁺G reduces to P⁻_μ (weights ≤0); the m-th graded piece consists of Lie weights ≤m. The quotient maps to (G/P⁻_μ)^⋄ with successive positive-loop unipotent fibres. Galois-orbit cells descend over the generic base.

**Hypotheses**

- G split for the computation; μ dominant; ℓ≠p. Integral statement requires the reductive model.

**Proof or construction**

1. Compute L⁺G∩μ(ξ)L⁺Gμ(ξ)⁻¹ in a faithful representation; in GL_n, the upper entry A_ij is divisible by ξ^{k_i−k_j}.
2. Use SW 19.4.2 for the lattice subbundle test, then the root-weight stabilizer and DSO vector-group smoothness.
3. Sum positive weights for dimension; apply splitting descent for μ̄. No perverse or decomposition theorem enters.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`
- `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`
- `ReductiveGroupsPartII:RG2.1`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- `RelativeFarguesFontaine:RF4:vector-bundles`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.4–VI.2.5, pp. 198–200; IV.1.18, p. 112. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For GL₂, μ=(a,b), a≥b, the dimension is a−b; μ=0 has dimension zero.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the GL₂ root-pairing core is typed; cell stabilization and cohomological smoothness are not a predicate placeholder.

**Implementation status:** unchecked.

**Planet:** Schubert cell smoothness.

### Finite truncation of bounded actions

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.boundedLoopActionTrivial`.

**Owner:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`. **Realises:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS0`.

If m>0 is at least every weight of μ on Lie G, then L⁺_mG acts trivially on Gr_{≤μ}. For ordered legs use the corresponding bound for the sum at each collision. Thus the action factors through L^{+,<m}G. The comparison of equivariant derived categories is the later GS1/prounipotent-equivariance theorem, with its filtered continuity and prime-to-p coefficient hypotheses.

**Hypotheses**

- Split G; dominant μ; finite Schubert bound.

**Proof or construction**

1. Use normality of the congruence kernel and the stabilizer weight calculation on the open orbit.
2. For ν≤μ the maximum root pairing does not increase; conclude for all lower strata.
3. Check on geometric points and descend the trivial action on the v-sheaf.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`
- `ReductiveGroupsPartII:RG2.1`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.2.8, p. 201. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For GL₂ μ=(a,b), m≥a−b and m>0 suffices.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** K must be the specified deep congruence subgroup on the specified bound; those absent geometric hypotheses are omitted.

**Implementation status:** unchecked.

### Minuscule Bialynicki–Birula isomorphism

`GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.minusculeBialynickiBirula`.

**Owner:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`. **Realises:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness`, `GeometricSatakeAndFusion:GS0`.

If μ has Lie weights in {−1,0,1}, the Bialynicki–Birula map Gr_μ→(G/P⁻_μ)^⋄ is an isomorphism. In GL_n it sends a B⁺_dR-lattice Λ to the ascending filtration Fil^m=((B⁺)^n∩ξ^{-m}Λ)/(ξ(B⁺)^n∩ξ^{-m}Λ). CS uses μ(ξ^{-1}); matching FS uses inversion of the coweight or of the chosen parabolic convention.

**Hypotheses**

- Generic characteristic-zero untilt; minuscule μ; ℓ≠p for the smoothness consequence.

**Proof or construction**

1. The stabilizer filtration has no additional fibre when μ is minuscule.
2. Alternatively use CS 3.4.4 on field points, 3.4.6 for pointwise detection and KL finite-projectivity to prove injectivity over reduced bases.
3. Surjectivity is supplied by the filtered integrable universal connection and Griffiths transversality; import its period-sheaf realization from P8.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`
- `ReductiveGroupsPartII:RG2.1`
- `RelativeFarguesFontaine:RF4:vector-bundles`
- `PadicHodgeTheory:P8:local-rational`

**Sources**

- [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), 3.4.4–3.4.6, pp. 685–686. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For GL_n μ=(1^r,0^{n−r}) the cell is the Grassmannian of r-planes, with the sign dictionary fixed.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Cell/Flag must be the minuscule Grassmannian and its flag functor; the geometric minuscule hypotheses are omitted.

**Implementation status:** unchecked.

## Witt Grassmannians, determinant lines and perfect models

`GeometricSatakeAndFusion:GS0:Witt-geometry`

The lattice/type interface is the entry point. It supports the finite determinant-jet presentation, the original algebraic-space quotient, the Demazure filtration and its connected cohomological fibres. The geometric determinant line has a fibre-triviality descent proof, followed by the Witt-specific positivity and Keel application. Integral reductive and parahoric properness consume this projectivity; their coefficient and group-model hypotheses remain distinct. Canonical models, the cone chart, normalized SL_n determinants and section growth are separate targets. The routed flag work adds finite admissible unions, incidence correspondences and their ordinary/Demazure fibre estimates. Acceptance tests determinant sign, h>N, zero quotient type, a genuine nonempty dominance boundary, normalized base factors and bounded componentwise dimension transfer.

### Witt lattice functor

`GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.WittLattice`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For a perfect F_p-algebra R let Λ be a finite projective W(R)-submodule of W(R)[1/p]^n with Λ[1/p]=W(R)[1/p]^n. Gr^W_GL_n is the v-sheaf of such lattices; a positive bounded piece Gr_{≤λ} has Λ⊂W(R)^n and quotient of type ≤λ. Negative bounds are obtained by translating by p^a. For O_E coefficients use RF0’s ramified Witt ring; for a general smooth model 𝓖 use 𝓖-torsors with a punctured trivialization.

**Hypotheses**

- The two pole bounds on a lattice are locally uniform; coefficients perfect; quotient type has fixed total length.

**Proof or construction**

1. Use finite projectivity and bounded denominators to define the functor.
2. Apply SF’s Witt vector-bundle v-descent to both finite levels and the formal limit.
3. Use the quotient/torsor comparison of BS 9.5 and Zhu 1.3; this construction does not assume projectivity.

**Direct prerequisites**

- `mathlib:WittVector`
- `mathlib:PerfectRing`
- `mathlib:Module.Projective`
- `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`
- `SchemeAndStackFoundations:SF.4`
- `ReductiveGroupsPartII:RG2.3`
- `mathlib:Module.Finite`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 8.1 and 9.4–9.5, pp. 32, 36–37. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- BS 7–8: Positive quotient-type bounds and their resolution use these embedded lattices.
- Zhu 1.2: The lattice functor is the GL_n affine Grassmannian.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.WittLattice_module` | projection | A lattice is a finite projective B-submodule of K^n whose K-span is the whole module. |
| `TauCeti.Suggested.GeometricSatake.WittLattice_standard` | constructor | The image of B^n in K^n gives the standard lattice when B→K is injective. |
| `TauCeti.Suggested.GeometricSatake.WittLattice_ext` | extensionality | Lattices are equal when their embedded submodules are equal; finite-projectivity proofs carry no extra moduli. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.lattice_rank_zero` | degenerate | There is only one rank-zero lattice. |
| `TauCeti.Suggested.GeometricSatake.lattice_standard_field` | compatibility | Over B=K the standard lattice agrees with the top Submodule of K^n. |
| `TauCeti.Suggested.GeometricSatake.lattice_span` | non-example | A purported rank-one lattice with zero embedded submodule is excluded over a nonzero field. |

**Acceptance**

- For n=1 lattices are p^aW(R) locally on components; Λ=W(R)^n is the unit.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The generic imported coefficient algebra B→K is the ramified Witt ring and its localization in the intended application. The finite/projective/span conditions are concrete. A separate structure below records them; representing schemes are not defined by this point core.

**Implementation status:** unchecked.

**Planet:** Witt vector affine Grassmannian.

### Witt torsion module types

`GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.wittTypeBound`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

A finite p-power-torsion isogeny cokernel Q over W(R) has geometric type λ=(λ₁≥⋯≥λ_n≥0), meaning Q_x≅⊕W(k_x)/p^{λ_j}. Its row lengths are n_λ(i)=#{j:λ_j>i}. Dominance means equal total length and all partial sums bounded. Type ≤λ is a closed locus; on a constant-type locus the modules p^iQ/p^{i+1}Q are finite projective of ranks n_λ(i). An isogeny is a map of finite projective W-modules invertible after p-inversion.

**Hypotheses**

- R perfect; a uniform p-power kills Q; the isogeny-cokernel criterion is projective dimension at most one, including Q=0.

**Proof or construction**

1. Import projective module algebra, Fitting-ideal tests and reducedness of perfect rings from SF.
2. Apply BS 7.3, 7.5 and 7.7–7.9 to ranks of powers of p and the dominance inequalities.
3. Use the repaired finite-rank argument in PAPER-BHATT-SCHOLZE-17/E37 (Lemma 7.7, p.29): establish the same finite rank at every prime before deducing finite generation of the projective kernel. Density of characteristic-zero points alone does not suffice.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`
- `SchemeAndStackFoundations:SF.0`
- `mathlib:Module.Projective`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 7.1–7.9, pp. 27–32. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- BS 7.2–7.13: Column ranks control the Demazure filtration.
- BS 8.3: Dominance induction controls the closed boundary.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.wittTypeBound_dominance` | compatibility | The quotient-type relation is GL_n dominance after embedding nonnegative parts in the integer coweight lattice. |
| `TauCeti.Suggested.GeometricSatake.wittTypeBound_columns` | data | The i-th graded quotient has rank equal to the number of parts λ_j exceeding i. |
| `TauCeti.Suggested.GeometricSatake.wittTypeBound_closed_under_dominance` | relation | A lower quotient type remains in any larger bound. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.witt_type_zero` | degenerate | The zero bound admits only zero nonnegative quotient parts. |
| `TauCeti.Suggested.GeometricSatake.witt_type_210` | computation | For λ=(2,1,0), the successive column ranks are two and one. |
| `TauCeti.Suggested.GeometricSatake.witt_type_not_component_order` | non-example | The quotient type (1,0,0) is not below (2,1,0), since its length is one rather than three. |

**Acceptance**

- For Q=W(k)/p²⊕W(k)/p the type is (2,1), rows (2,1); a different total length is never a dominance comparison.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The type relation and column counts are concrete; elementary divisors for a finitely presented isogeny cokernel over a perfect family are an RG/SF refinement.

**Implementation status:** unchecked.

**Planet:** Witt module types.

### Zhu finite-jet presentation

`GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For λ=(N,0,…,0), V_N parametrizes W-matrices with determinant p^N times a unit. For h>N, V_{N,h} is the perfection of the truncated determinant locus det₀=⋯=det_{N−1}=0, det_N invertible. Gr̄_{N,h} adds a W_h-trivialization of the lattice and is an L^hGL_n-torsor over Gr̄_N. The stabilizer J={(A,γ):Aγ=A} gives Gr̄_{N,h}≅J after a chosen normalized lift.

**Hypotheses**

- The isomorphism uses a choice of lifting; h>N, not h=N. Nonperfect Greenberg test rings use the ring scheme of O_E/ϖ^h, not a naive tensor formula.

**Proof or construction**

1. Import Greenberg realization and perfect finite models from SF.
2. Zhu 1.9 produces the matrix cover; choose lifts as in 1.10–1.11.
3. Identify the stabilizer and verify the corrected compositions βε=A and γ=ε_A⁻¹α⁻¹ε. This is the original algebraic-space route.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`
- `SchemeAndStackFoundations:SF.0`
- `ReductiveGroupsPartII:RG2.3`

**Sources**

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 1.9–1.11, pp. 418–421. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- Zhu 1.9–1.12: Finite-jet torsor quotients represent lattice bounds.
- Zhu B.4/B.11: The determinant equations define canonical models and the cone chart.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus_mem` | characterisation | The matrix jet lies on the determinant locus when det(A)=uπ^N for a unit u; the finite truncation and bound h>N are retained in the application. |
| `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus_right_invariance` | relation | Right multiplication by an invertible matrix preserves the determinant locus. |
| `TauCeti.Suggested.GeometricSatake.jetDeterminantLocus_ring_map` | functoriality | A ring map takes the determinant locus to the corresponding locus with the image uniformizer. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.jet_level_zero` | degenerate | For N=0 the determinant is a unit. |
| `TauCeti.Suggested.GeometricSatake.jet_identity` | computation | The identity matrix is in the N=0 locus. |
| `TauCeti.Suggested.GeometricSatake.jet_zero_excluded` | non-example | A zero rank-one matrix is excluded at N=0 over a nonzero field. |

**Acceptance**

- For N=0 the trivial lattice with a jet trivialization is L^hGL_n; the determinant-zero equations disappear.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The determinant equation is the matrix core. Finite Greenberg representability, the lift-kernel quotient and its perfect torsor are imported, not represented by an arbitrary smoothness predicate.

**Implementation status:** unchecked.

### Original perfect algebraic-space construction

`GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.zhuBoundPresentation`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

Each Gr̄_N and hence each bounded GL_n Witt Grassmannian is a perfectly finitely presented separated proper algebraic space; Gr is an increasing union of such pieces. For general reductive G a faithful representation with quasi-affine quotient gives a locally closed embedding into the GL_n Grassmannian; an affine quotient gives a closed embedding.

**Hypotheses**

- Zhu published edition; perfect fields/rings; integral model assumptions pinned.

**Proof or construction**

1. Use the affine jet presentation and effective quotient theorem A.29.
2. Import the published flatness proof A.30–A.31 from SF; the torsor fibre-product identity alone does not prove flatness.
3. Demazure properness supplies properness of the bounded spaces. No BS determinant/projectivity theorem is used in this original construction.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`
- `SchemeAndStackFoundations:SF.1`
- `ReductiveGroupsPartII:RG2.3`

**Sources**

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 1.12, 1.19–1.20; A.29–A.31, pp. 421, 425–426, 476–477. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- The target is a perfect algebraic space before the separate projectivity proof.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Presentation must be Zhu's smooth determinant-jet cover. The quotient algebraic-space carrier is not available and is omitted; this signature asserts only the cover's affineness.

**Implementation status:** unchecked.

### Witt Demazure filtration space

`GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.wittFiltration`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For Q of type ≤λ, Dem_λ(Q) classifies Q=Q₀⊃Q₁⊃⋯⊃0 with Q_i/Q_{i+1} locally free over R of rank n_λ(i). The global resolution Gr̃_λ classifies a lattice together with such a filtration of W(R)^n/Λ. It is a proper pfp perfect scheme obtained by successive perfected Grassmannian bundles. Its image is Gr_{≤λ}; over exact type the filtration is the p-adic filtration and the map is an isomorphism.

**Hypotheses**

- λ sorted nonnegative; total length fixed; all quotient maps respect the Witt action; zero λ gives the vanishing locus.

**Proof or construction**

1. Use SF’s perfected Quot/Grassmann bundles to choose a locally free quotient Q/pQ→G of rank n_λ(0), and recurse on ker(Q→G) with λ shifted by one column. Q/pQ itself can have larger rank on lower-type fibres; it is not the chosen quotient G.
2. BS 7.13 gives image, uniqueness and properness. Zhu 1.13–1.18 gives the lattice-chain presentation, including reversed dual bounds for reversed chains.
3. BS 8.6 produces a smooth projective finite-type model for the global tower.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `CrystallineCohomology:CR.1`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 7.10–7.13 and 8.4–8.6, pp. 29–34. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- BS 7.13–7.14: Filtration fibres supply connectedness and structure-sheaf cohomology.
- BS 8.8: The determinant is the product of graded quotient determinants.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.wittFiltration_eval` | characterisation | The typed filtration consists of a decreasing chain of submodules starting at M and ending at zero. |
| `TauCeti.Suggested.GeometricSatake.wittFiltration_piece` | projection | Evaluation gives the i-th submodule in the chain. |
| `TauCeti.Suggested.GeometricSatake.wittFiltration_ext` | extensionality | Two filtration points are equal if all their submodules agree. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.filtration_length_zero` | degenerate | A length-zero filtration forces the module to be zero. |
| `TauCeti.Suggested.GeometricSatake.filtration_one_step` | computation | A length-one filtration has first piece top and all later pieces zero. |
| `TauCeti.Suggested.GeometricSatake.filtration_direction` | non-example | The filtration decreases; increasing kernels of p must first be reverse-indexed. |

**Acceptance**

- λ=0 gives the unit; λ=(1^r) is the perfected ordinary Grassmannian. For λ=(2,1,0) and Q=k³ killed by p, choose a rank-two quotient of Q/pQ=k³; its kernel line varies in P², giving the boundary fibre. Replacing the chosen quotient by all of Q/pQ would lose this fibre.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The submodule-chain core omits prescribed locally free quotient ranks, annihilation by p, perfect-scheme representability and its lattice map. These conditions are written in the packet, not replaced by unknown proposition fields.

**Implementation status:** unchecked.

**Planet:** Witt Demazure resolution.

### Fibres of the Witt resolution

`GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.wittResolutionConnectedFibres`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

The fibres of Gr̃_λ→Gr_{≤λ} are geometrically connected and have RΓ(O)=k at geometric perfect fields. The resolution is an isomorphism over exact type. In Zhu’s full ω₁-chain resolution of Gr̄_N every lower-type fibre has positive dimension.

**Hypotheses**

- Nonempty geometric fibres; Q an isogeny cokernel.

**Proof or construction**

1. Apply BS 7.14 to filtered Grassmann incidence parameters; reverse the increasing kernels of multiplication by p to match its decreasing-filtration convention.
2. Induct on the filtration length for cohomology and connectedness.
3. For the full ω₁ resolution, use Λ_λ+p^iΛ₀, not the erroneous intersections in Zhu 1.18; projection to a nontrivial projective space detects positive dimension.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.3`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 7.13–7.14, pp. 30–32. The stated construction or result, with the conventions and corrections specified in this node.

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Lemma 1.18, pp. 424–425. The full ω₁-chain resolution is an isomorphism over the exact-type orbit, and every lower-type fibre has positive dimension.

**Acceptance**

- For λ=(2,1,0), fibre above (1,1,1) is P²; exact-type fibres are points.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** X/Y/f must be the Witt resolution and bound; perfect structure-sheaf cohomology is omitted.

**Implementation status:** unchecked.

### Descent on Witt resolution fibres

`GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` — application.

**Declaration:** `TauCeti.Suggested.GeometricSatake.wittFibralDescent`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

Apply the supplier’s v-descent for finite/formal Witt bundles and its proper pfp connected-fibre criterion to Gr̃_λ→Gr_{≤λ}. Pullback on line bundles is fully faithful; a line bundle trivial on every geometric fibre descends. The stronger Rψ_*O=O criterion applies to the same resolution and commutes with base change.

**Hypotheses**

- Proper surjective pfp perfect morphism; geometric connectedness alone is the weaker sufficient criterion, not an equivalence with Rψ_*O=O.

**Proof or construction**

1. Import BS 4.1 and 6.1, 6.8, 6.13 from SF rather than reproduce their general theory.
2. Verify the proper pfp hypotheses and fibre computation from the resolution node.
3. Use the fibre criterion and full faithfulness for effective descent and uniqueness.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`
- `SchemeAndStackFoundations:SF.4`
- `SchemeAndStackFoundations:SF.3`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 6.1, 6.8, 6.13 and 8.5, pp. 21–26, 33. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- Apply to λ=0, where descent is the identity; keep pfp in the statement.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the line-bundle full-faithfulness core is typed; effective fibre-trivial descent and proper pfp hypotheses belong to SF.

**Implementation status:** unchecked.

### Geometric determinant line

`GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

There is a unique line bundle L on Gr_{≤λ} whose pullback to Gr̃_λ is ⊗_i det_R(Q_i/Q_{i+1}); these lines agree under lower bounds and hence form the determinant line on Gr_GL_n. Construct it geometrically using complete-flag refinements and fibre triviality, without the K-theoretic determinant.

**Hypotheses**

- Positive quotient convention W(R)^n/Λ; determinant of a sublattice would reverse the line.

**Proof or construction**

1. Refine filtrations to full flag towers as in BS 6.11 and 8.8.
2. On each geometric fibre the product of graded determinants identifies with the fixed determinant of the associated R-gradeds of Q.
3. Apply the fibral descent node and its full faithfulness to descend and reconcile lower-bound restrictions.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`
- `SchemeAndStackFoundations:SF.3`
- `KTheoryLowDegrees:Z.3`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 6.11 and 8.8, pp. 25, 33–34. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- BS 8.9–8.11: Positive degrees and boundary sections prove projectivity.
- BS 10.1: The normalized SL_n line is built from these determinants.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine_pullback` | compatibility | On the Demazure resolution, the pulled-back line is the tensor product of the determinants of the graded quotients, with the positive quotient convention. |
| `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine_unique` | characterisation | Fibre-trivial descent is unique through the fully faithful pullback of invertible sheaves. |
| `TauCeti.Suggested.GeometricSatake.geometricDeterminantLine_lower_bound` | functoriality | Restriction to a lower bound agrees with that bound’s determinant line. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.determinant_zero` | degenerate | The zero bound has the trivial invertible sheaf. |
| `TauCeti.Suggested.GeometricSatake.determinant_existing_carrier` | compatibility | The descended geometric line uses Tau Ceti InvertibleSheaf, rather than a rank-one module at a point. |
| `TauCeti.Suggested.GeometricSatake.determinant_quotient_sign` | computation | On a one-step quotient Grassmannian, the descended line pulls back to the graded quotient determinant; its sign is the quotient sign. |

**Acceptance**

- For λ=(1,0,…), the line is O(1) on the projective Grassmannian; λ=0 gives the trivial line.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the existing invertible-sheaf carrier is typed. X must be the specified bounded Witt scheme, pull the specified resolution/restriction, and gradedDet its graded determinant. Those missing geometric conditions are omitted in these signatures and are not arbitrary new predicates.

**Implementation status:** unchecked.

**Planet:** Determinant line.

### Positivity of the determinant line

`GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.determinantCurveDegree`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

On Gr̃_λ, ⊗det(Q_i/Q_{i+1})^{a_i} is ample for a₀≫a₁≫⋯>0. Each determinant factor has sections nonvanishing on the exact-type open locus. The unweighted descended line has positive degree on every nonconstant proper curve in Gr_{≤λ}; its resolution pullback is nef and big, with exceptional locus contained in the lower-type boundary.

**Hypotheses**

- Finite-type models fixed up to Frobenius; a_i integers with successive domination; effective divisors interpreted on these models.

**Proof or construction**

1. Use BS 8.9 and Grassmann-bundle induction for weighted ampleness and explicit nonvanishing sections.
2. If the sum of nonnegative determinant degrees on a lifted curve were zero, all weighted degrees would be zero, contradicting ampleness (8.10).
3. Use an effective decomposition with ample weighted part to place the exceptional locus in the boundary (8.11); invoke only the supplier’s positivity notions.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`
- `SchemeAndStackFoundations:SF.5`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 8.9–8.11, pp. 34–35. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For a one-step projective Grassmannian the line has degree one on a Schubert line.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** degree must be the determinant degree on a nonconstant proper curve in the specified bound. The missing curve/intersection API and hypotheses are omitted.

**Implementation status:** unchecked.

### Projectivity of the Witt Grassmannian

`GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.wittProjectiveBound`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For every dominant positive λ, Gr_{≤λ} is the perfection of a projective F_p-scheme and its determinant line is ample on a finite Frobenius model. Consequently all pole-bounded GL_n lattice pieces are perfections of projective varieties.

**Hypotheses**

- Use BS’s geometric determinant construction. Keel’s criterion, exceptional locus and Frobenius extension/descent are imported from SF.5; pfp/model theory from SF.0.

**Proof or construction**

1. Induct on dominance. Realize the lower boundary as an iterated finite pushout of lower bounds along closed intersections, importing the missing representability argument from SF.1 (PAPER-BHATT-SCHOLZE-17/E39; BS proof of Theorem 8.3, pp.35–36).
2. The determinant is ample on boundary pieces; Keel’s union lemma and strict curve positivity make it ample on the boundary. Keel’s restriction criterion then makes ψ*L semiample because its exceptional locus lies there.
3. Take its Stein contraction on a finite model. Strict curve positivity and fibre triviality identify its equivalence relation with the Demazure quotient; hence the contraction is Gr_{≤λ}. Its descended line is ample.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.5`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), §8.4, Theorem 8.3 (statement p. 32; proof pp. 35–36), Lemmas 8.9–8.11 (pp. 34–35). The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- No Zhu representability input in this independent route; λ=(1) recovers projective space.

**Remaining obligations**

- Boundary representability before Keel: BS 8.3’s induction calls the lower-bound union a pfp proper perfect algebraic space before proving it. The SF1 finite-pushout/model request must construct closed intersections and effective pinching in the chosen model, then prove it is the image v-sheaf. This proof must precede the positivity application.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only scheme properness is typed; X/f must be the finite model of the bound over the base field. Projectivity/ample line notions are imported from SF5 and omitted.

**Implementation status:** unchecked.

**Planet:** Witt projectivity theorem.

### Perfect models and étale realization

`GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.wittEtaleComparison`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For the bounded Witt schemes/algebraic spaces, import compatible finite-type models up to Frobenius, dimension and fibre-product compatibility and étale-topos equivalence from SF0/SF1. Apply those general results to identify their scheme diamondification with the characteristic-p fibre of the integral Grassmannian, by equality of the lattice/torsor functors. This node owns the Witt comparison application; SF owns the general model and perfection theory.

**Hypotheses**

- Coordinate perfection is a direct Frobenius colimit; Mathlib Perfection is an inverse-limit carrier and is not cited for this construction. Trace/cycle normalizations require a fixed model.

**Proof or construction**

1. Import Zhu A.3, A.15–A.17 and BS 3 from SF.0–SF.1.
2. Import the characteristic-p scheme-diamond comparison from L1.
3. Evaluate the torsor/lattice functor on perfectoid R; B⁺ at a characteristic-p untilt is W_{O_E}(R), so both sheaves have the same functor of points.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `DiamondsAndVStacks:D6/pre-adic-diamondification`

**Sources**

- [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 20.3.1–20.3.4, p. 185. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- A¹_perf has dimension one but is not finite type as an ordinary scheme.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** These categories must be the specified étale categories of a perfect Witt bound and its scheme diamond; supplier geometry is omitted.

**Implementation status:** unchecked.

### Integral bounded Grassmannian families

`GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.integralWittGenericComparison`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

The integral BD Grassmannian over Spd O_E (or Div^d_𝒴) interpolates between the generic B⁺_dR Grassmannian and the v-sheaf of the Witt Grassmannian. For a split reductive model, the geometric relative-position bounds are closed and proper and representable in spatial diamonds, also for ordered multiple legs with summed collision bounds; their componentwise filtered union is the full functor.

**Hypotheses**

- Fixed integral reductive model; unramified cocharacter reflex extensions in SW 20.3–20.5; no ramified reductive O_E-model asserted.

**Proof or construction**

1. Use SW 20.3.2 for the torsor/étale quotient description and the explicit characteristic-p comparison.
2. BS projectivity provides the special-fibre compact bounds; generic bounded properness and SW 20.3.6, 20.5.4 give proper relative diamonds.
3. For multiple legs build the bounded convolution tower and use its surjective multiplication map to establish quasicompactness and closedness.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`
- `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`
- `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`

**Sources**

- [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 20.3.6 and 20.5.4, pp. 186, 190. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- At equal legs the bound is the sum, not their maximum.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the two functor-of-points fibre identifications are typed; the diamond base change and proper bounds are omitted.

**Implementation status:** unchecked.

### Witt affine flags and components

`GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.parahoricGeometricComponents`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For a smooth affine O_E-model 𝓖 of a reductive generic fibre, the Witt affine Grassmannian is an ind-pfp perfect space with locally closed embedding into a GL_n Grassmannian and ind-quasiprojective bounds. If 𝓖 is parahoric its bounds are projective. Over k̄ its components are π₁(G)_I via Kottwitz, with residual Frobenius action retained. For an Iwahori, Schubert cells have dimension ℓ(w), closures are the Bruhat unions and reduced-word Demazure spaces are iterated perfected P¹-bundles.

**Hypotheses**

- Parahoric/Iwahori notions supplied by RG2.3; inertia I, not the full absolute Galois group, labels geometric components.

**Proof or construction**

1. Use the faithful representation with quasi-affine quotient and Zhu 1.20.
2. Zhu 1.4 and SW 21.1.1 use Iwahori Demazure towers; properness descends to other parahorics.
3. Use Zhu 1.21 and the corrected BS 9.7/SW 21.1.4 component identification.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`
- `ReductiveGroupsPartII:RG2.3`
- `ReductiveGroupsPartII:RG2.4`

**Sources**

- [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 21.1.1–21.1.4, pp. 191–192. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For a torus the geometric flag space is the discrete inertia-coinvariant coweight scheme with Frobenius action.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the Kottwitz label equivalence is typed, with geometric inertia coinvariants rather than full Galois coinvariants. Model representability and properness are omitted.

**Implementation status:** unchecked.

**Planet:** Parahoric Witt Grassmannians.

### Integral parahoric ind-properness

`GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.integralParahoricProperBounds`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

If 𝓖° is parahoric, Gr_{𝓖,Spd O_E} is an increasing union of closed proper subfunctors. A closed representation 𝓖→GL_n induces a closed immersion of integral Grassmannians. For minuscule bounds the closure is unchanged on replacing 𝓖 by 𝓖°, and central quasiparahoric isogenies identify the corresponding closures after reflex-field base change.

**Hypotheses**

- Quasiparahoric models and component maps as in SW 21.2–21.5; minuscule hypothesis only for the closure comparisons.

**Proof or construction**

1. Import Anschütz’s extension/triviality of torsors on punctured A_inf from RF4:G-torsors.
2. Use SW 21.2.3 to extend each geometric lattice and take products of uniformly bounded trivializations to obtain quasicompactness.
3. Apply the geometric-point and component tests in 21.4.3 and 21.5.1; do not claim the local-model conjecture from this argument.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`
- `RelativeFarguesFontaine:RF4:G-torsors`
- `ReductiveGroupsPartII:RG2.3`
- `ReductiveGroupsPartII:RG2.4`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`

**Sources**

- [SW20-berkeley](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), 21.2.1–21.2.3, 21.4.3, 21.5.1, pp. 192–197. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For a torus the integral flag is the diamondification of the integral coweight scheme; special labels are inertia coinvariants.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only topological properness is typed; spaces/map must be a closed parahoric bound over the integral base. Spatial-diamond representability is omitted.

**Implementation status:** unchecked.

### Canonical determinant models

`GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.canonicalWittModel`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For h>N, the finite-type truncated matrix locus det₀=⋯=det_{N−1}=0 with det_N invertible is a normal complete intersection. The normalized finite-jet quotient supplies Zhu’s canonical weakly normal model Gr′_μ. Compatible transition maps between these models may require Frobenius twists. The canonical Demazure model Gr̃′_N is a smooth projective model obtained from chains of p-divisible groups, with determinant comparison to the product of their Hodge lines.

**Hypotheses**

- Fix model and Frobenius levels; do not infer normal Cohen–Macaulayness of every canonical Schubert model (Conjecture III). Dieudonné/crystal and p-divisible-group theory is imported.

**Proof or construction**

1. Use Zhu B.4’s codimension and Serre-criterion argument for the matrix complete intersection, with the SF model API.
2. Descend the normalized jet quotient using SF effective quotients; use twisted transitions as in B.6.
3. Import B.7–B.9’s Dieudonné realization from the p-divisible-group owner and check the pullback of the Hodge determinant; the sketch-only comparison remains an explicit gap.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.4`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6`
- `CrystallineCohomology:CR.1`
- `CrystallineCohomology:CR.7`

**Sources**

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), B.4–B.9, pp. 484–486. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- Zhu Appendix B: Canonical models fix trace and Hodge determinant normalizations.
- GS1 rational weight concentration: Cycle traces depend on a chosen model rather than perfection alone.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.canonicalWittModel_transition` | functoriality | A sufficiently deep finite-jet level has a transition to a shallower canonical model; compatibility can require a Frobenius twist. |
| `TauCeti.Suggested.GeometricSatake.canonicalWittModel_normalized_quotient` | compatibility | The canonical model is identified with the normalized jet quotient, not an arbitrary scheme having the same perfection. |
| `TauCeti.Suggested.GeometricSatake.canonicalWittModel_perfection` | compatibility | Its scheme perfection is the specified Witt Schubert bound. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.canonical_model_zero` | degenerate | The N=0 canonical bound is Spec k, over the specified perfect coefficient field. |
| `TauCeti.Suggested.GeometricSatake.canonical_model_rank_one` | computation | For GL₁ and N<h, the canonical bound is Spec k: the prescribed lattice p^N W(k) is unique. |
| `TauCeti.Suggested.GeometricSatake.canonical_model_not_choice` | non-example | In the dual-number F₂ algebra, the nonzero nilpotent squares to zero. Its perfection forgets the nilpotent, so sharing a perfection cannot specify a canonical finite model. |

**Acceptance**

- For N=0 the canonical model is a point; a canonical model is not an arbitrary deperfection.

**Remaining obligations**

- Sketch-only canonical determinant and crystal comparison: Zhu B.1, B.9 and the closing B.3 paragraph are announced without proofs. The R07/CR7 interfaces and the map between the normalized jet model and the p-divisible chain model must prove the Hodge-line determinant comparison; no conjectural normal Cohen–Macaulay property is assumed.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The coefficient input is explicitly a perfect field of characteristic p. Finite-type, normalization, model perfection and Frobenius-twisted transition conditions are supplied by SF0/SF1. The canonical model and its maps use Mathlib Scheme. The sketch-only Dieudonné comparison is a recorded gap; Conjecture III is not a theorem.

**Implementation status:** unchecked.

### Rank-two quadratic cone model

`GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.rankTwoConeClosedOrbit`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For p>2, GL₂ and N=2, Gr̄₂ has an open chart equal to the perfection of Spec k[x,y,z]/(x²−yz), via A=((p+[x],−[y]),([z],p−[x])). Together with the open exact-type orbit it covers Gr̄₂. Its Demazure resolution is the perfection of P(O(1)⊕O(−1)). The open decomposition locus of W₃-matrices X with [λ]det X=p² is characterized by X=Ag with g∈GL₂(W₃); the representative A is unique.

**Hypotheses**

- p>2; finite Witt truncation h=3; correct order g̃=Ã⁻¹X̃ and determinant det X=p²[λ]⁻¹.

**Proof or construction**

1. Use the projective-bundle extension E/p and its splitting to identify the resolution model.
2. Use the determinant equations B.3.1 to solve uniquely for x,y,z on the locus det(X₁) invertible, then saturate by the right GL₂(W₃)-action.
3. Repair the displayed inverse order in B.11. The rank-two adjugate argument below proves integrality of the chosen right factor Ã⁻¹X̃ and its unit determinant. The remaining refinement is the typed truncated-Witt and jet-torsor interface; the jet torsor then identifies the open chart.
4. Choose a Witt lift X̃ as in Remark 1.11 and let Ã be the displayed Teichmüller matrix, so det(Ã)=p². For the corrected factor g̃=Ã⁻¹X̃, use X̃* Ã≡0 mod p² and adj(X̃* Ã)=Ã* X̃ in rank two. Thus p⁻² Ã* X̃ is integral. The determinant has the form det(X̃)=p²u with u∈W(R)× reducing to λ⁻¹; hence det(g̃)=u is a unit. Reducing this chosen factor modulo p³ gives X=Ag. The factor g can depend on the chosen lift and the stabilizer of A; B.11 asserts uniqueness of the cone representative A, not uniqueness or lift-independence of g. The remaining task is to express existence and the induced jet-torsor/quotient compatibility in the supplier’s truncated-Witt interface.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`
- `SchemeAndStackFoundations:SF.0`

**Sources**

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), B.10–B.11, pp. 486–488. The stated construction or result, with the conventions and corrections specified in this node.

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.rank_two_right_factor_not_unique` | non-example | Over Z/27Z, corresponding to W₃(F₃), A=3·Id and g=Id+9E₁₂ satisfy Ag=A, det(g)=1 and g≠Id. Thus the right factor in X=Ag need not be unique; the chart representative A is the unique datum asserted by Zhu B.11. |

**Acceptance**

- At x=y=z=0, A=p·Id has determinant p² and maps to the unique closed orbit.

**Remaining obligations**

- Zhu B.11 corrected truncated-Witt interface: The rank-two adjugate calculation proves corrected right-factor integrality and unit determinant after choosing Witt lifts: adj(X* A)=A* X, det(Ã)=p² and det(X̃)=p²u with u a unit. The truncated equation is det(X)=p²[λ]⁻¹; only the residue of u is forced to equal λ⁻¹. What remains is the typed truncated-Witt interface, existence of a factor after the chosen lift, and compatibility with the jet-torsor quotient. The factor need not be unique or lift-independent (already A=3·Id over W₃(F₃) has a nontrivial stabilizer); uniqueness concerns the cone representative A. Retain the corrected order A⁻¹X.
- Sketch-only canonical determinant and crystal comparison: Zhu B.1, B.9 and the closing B.3 paragraph are announced without proofs. The R07/CR7 interfaces and the map between the normalized jet model and the p-divisible chain model must prove the Hodge-line determinant comparison; no conjectural normal Cohen–Macaulay property is assumed.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the closed-orbit equation and a finite-ring regression are typed. The perfect cone open immersion and the corrected truncated-Witt/jet-torsor interface remain a gap. The adjugate argument proves right-factor integrality; it does not make the factor unique or independent of the chosen lift.

**Implementation status:** unchecked.

### Normalized determinant on SL_n lattices

`GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.normalizedDeterminant`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

On Gr_SL_n over the ramified Witt coefficient ring, lattices have determinant trivialization. For a≪0 define L_M as det̃(p^aW_{O_E}(R)^n/M)⊗det̃(p^aW_{O_E}(R)^n/W_{O_E}(R)^n)⁻¹, independent of a. It is ample on every proper bound. Translations differ from L only by a line on the base, giving a G_m-central extension of the loop group acting on L.

**Hypotheses**

- The ordinary geometric determinant on filtered torsion modules agrees with the imported determinant calculus; the normalization factor is retained. This does not assert an honest LG-linearization.

**Proof or construction**

1. Reduce the ramified coefficient module to W(R)^{ne} using a fixed coefficient basis, then use the GL_{ne} bound and determinant line.
2. Use tensor multiplicativity of determinants to cancel the standard-lattice factor under changing a.
3. Apply the finite embedding into a GL_{ne} bound for ampleness; compose translation-line isomorphisms for the central extension. The tame K₂ identification belongs to its supplier.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`
- `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`
- `KTheoryLowDegrees:Z.3`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 10.1 and discussion through 10.4, pp. 37–39. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- BS 10.1: Ramified SL_n bounds inherit ampleness from GL_ne.
- BS 10.3–10.4: Translation lines form a loop-group central extension.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.normalizedDeterminant_trivial` | simp | At the standard lattice, the normalized determinant line is the tensor unit. |
| `TauCeti.Suggested.GeometricSatake.normalizedDeterminant_comparison` | compatibility | Normalization retains the inverse standard-lattice determinant factor. |
| `TauCeti.Suggested.GeometricSatake.normalizedDeterminant_translation` | relation | Translation gives a line from the base tensored with the original line; the compatible lines form a central extension rather than an honest action on the line. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.normalized_standard` | degenerate | The standard lattice has normalized determinant R. |
| `TauCeti.Suggested.GeometricSatake.normalized_zero_quotient` | computation | Two zero truncation quotients have the unit determinant. |
| `TauCeti.Suggested.GeometricSatake.normalized_tensor_carrier` | compatibility | Tensor products and determinant duals use existing ModuleCat and TensorProduct. |

**Acceptance**

- For the standard lattice the normalized line is canonically trivial; translation by the identity gives the identity extension element.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** This is the pointwise module carrier for the normalized line. M and M₀ must be the specified finite filtered torsion quotients, and the geometric sheaf gluing is not yet typed. The translation statement omits that geometry, while keeping the indispensable base-line factor.

**Implementation status:** unchecked.

### Sections of the Witt determinant line

`GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.determinantSectionsRestriction`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For the ample determinant line on Gr_SL_n, restriction of global sections to any proper closed bound is surjective, and the global section space is infinite dimensional whenever the Grassmannian has positive-dimensional bounds.

**Hypotheses**

- Pass to fixed finite models and arbitrarily large Frobenius powers of their ample lines. This gives no answer to BS Question 10.6 about canonical modules or embeddings.

**Proof or construction**

1. Use SF’s section-colimit description of line bundles on perfections.
2. Serre vanishing on finite models at large p^r powers gives restriction surjectivity.
3. Apply the same Frobenius powers to positive-dimensional bounds to obtain unbounded section dimensions.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization`
- `SchemeAndStackFoundations:SF.5`
- `SchemeAndStackFoundations:SF.0`

**Sources**

- [BS17-witt-grassmannian](https://arxiv.org/abs/1507.06490), 10.5 and 10.6, pp. 39–40. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- Zero-dimensional bounds have finite section spaces; the infinite-dimensional assertion has a dimension hypothesis.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The modules/map must be determinant global sections and restriction to the specified proper bound. Serre vanishing/Frobenius section-colimit hypotheses are omitted.

**Implementation status:** unchecked.

### Bounded admissible affine flag loci

`GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For a parahoric 𝓚 and a dominant cocharacter class μ, the admissible locus A_{𝓚,μ} is the finite closed union of affine Schubert strata labelled by the parahoric image of Adm(μ). Its reduced perfect structure is determined by geometric points. Under a morphism of parahoric models f:𝓚₁→𝓚₂ sending μ₁ to μ₂, the map of affine flags carries A_{𝓚₁,μ₁} into A_{𝓚₂,μ₂}.

**Hypotheses**

- Admissible sets and affine Bruhat order from RG2.4; integral v-sheaf local-model existence/functoriality is an imported refinement, not inferred from Satake.
- Use the connected parahoric/local-model hypotheses of GLX §3.2 and §3.3 (Lemmas 3.3–3.4) and van Hoften §2.2.6–§2.2.15. Van Hoften §2.2.15 states the perfect local-model interpretation for minuscule μ; GLX §3.2 supplies the non-minuscule extension. A generic group homomorphism without an integral parahoric model morphism is not covered.

**Proof or construction**

1. Use finite Bruhat unions and the representable flag spaces.
2. Identify this union with the reduced special fibre of the imported local model.
3. GLX 3.4 applies functoriality of local models and checks the containment on geometric points; GS supplies the ambient flag morphism.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`
- `ReductiveGroupsPartII:RG2.4`
- `SchemeAndStackFoundations:SF.4`

**Sources**

- [GLX26](https://link.springer.com/content/pdf/10.1007/s00222-025-01386-1.pdf), §3.2 and §3.3, Lemmas 3.3–3.4, pp. 822–823. The stated construction or result, with the conventions and corrections specified in this node.

- [VH24](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf), §2.2.14–§2.2.15, pp. 15–16. Relative-position strata, admissible sets and their bounded affine-Schubert union; the local-model interpretation in §2.2.15 is stated for minuscule μ. GLX §3.2 supplies the general non-minuscule extension.

**Uses shaping the API**

- GLX 3.4: Admissible special-fibre containment is functorial in the group model.
- van Hoften §2.2.6–2.2.15: The ambient parahoric flag space supplies the admissible locus.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus_mem` | characterisation | A flag lies in the admissible locus precisely when it is in one of the finitely many admissible Schubert strata. |
| `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus_mono` | functoriality | Increasing the admissible label set enlarges the locus. |
| `TauCeti.Suggested.GeometricSatake.admissibleFlagLocus_map` | compatibility | An ambient flag morphism whose local-model comparison sends all admissible strata into the target locus restricts to the admissible locus. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.admissible_empty` | degenerate | The empty label set gives the empty locus. |
| `TauCeti.Suggested.GeometricSatake.admissible_singleton` | computation | A singleton label gives exactly its Schubert stratum. |
| `TauCeti.Suggested.GeometricSatake.admissible_nonlabel` | non-example | A point belonging to no admissible stratum is excluded, even when it lies in a different connected component. |

**Acceptance**

- The zero admissible set in the torus is its corresponding component; identity group map fixes the locus.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Bounded affine-flag dimension and adjoint transfer: The He/GH10 imported fibre argument must be proved on compatible bounded pfp models; the unbounded ind-space need not have finitely many components. RG2.4 supplies rank-one induction and corrected componentwise adjoint comparison; SF4 supplies local-model functoriality for GLX admissible containment. These are precise supplier obligations, not a whole affine-flag isomorphism.

**Prototype boundary:** This finite-union core records only membership and maps. Bruhat downward closure, reduced perfect structure and local-model functoriality belong to RG/SF suppliers.

**Implementation status:** unchecked.

### Relative-position flag correspondences

`GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.flagIncidence`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Grassmannian`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

For affine flags define O_w⊂Fl×Fl by relative position w. The two-step incidence C_{u,v}={(x,z,y):(x,z)∈O_u,(z,y)∈O_v} maps by forgetting z to Fl×Fl; pull back to O_{uv} or O_{u*v} to get the product and Demazure-product correspondences. Work on finite Schubert bounds over the first flag; these give pfp perfect models and compatible base changes.

**Hypotheses**

- Relative position and Demazure product from RG2.4. The bounded twisted product is not an untwisted Cartesian product.

**Proof or construction**

1. Construct the fibre-product incidence and its projection from the affine flag moduli.
2. Apply finite Bruhat closure bounds to z and y after an étale-local choice of the first flag, producing the proper bounded convolution tower.
3. Use SF compatible perfection models and dimension invariance for all pullbacks, including He’s X₂→X₃ and X₄→X₅.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`
- `ReductiveGroupsPartII:RG2.4`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.1`

**Sources**

- [He21](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), 5.3–5.4, pp. 9–12. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- He 5.6: Ordinary-product and Demazure-product fibre estimates apply to these projections.
- He proof of 5.5: Bounded pullbacks give X₂→X₃ and X₄→X₅.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.flagIncidence_points` | characterisation | Two-step incidence consists of (x,z,y) with (x,z) in the first relative-position orbit and (z,y) in the second. |
| `TauCeti.Suggested.GeometricSatake.flagIncidence_projection` | projection | The product projection forgets z and returns (x,y). |
| `TauCeti.Suggested.GeometricSatake.flagIncidence_fibre` | characterisation | The fibre over (x,y) is the set of middle flags satisfying both relative-position conditions. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.incidence_identity_left` | computation | If the first relation is the diagonal, z is uniquely x. |
| `TauCeti.Suggested.GeometricSatake.incidence_empty` | degenerate | An empty first relation gives empty incidence. |
| `TauCeti.Suggested.GeometricSatake.incidence_no_unrestricted_middle` | non-example | For both diagonal relations, a middle flag different from x cannot occur. |

**Acceptance**

- C_{1,v} and C_{u,1} have a uniquely determined middle flag; finite bounds are required before dimension arguments.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Bounded affine-flag dimension and adjoint transfer: The He/GH10 imported fibre argument must be proved on compatible bounded pfp models; the unbounded ind-space need not have finitely many components. RG2.4 supplies rank-one induction and corrected componentwise adjoint comparison; SF4 supplies local-model functoriality for GLX admissible containment. These are precise supplier obligations, not a whole affine-flag isomorphism.

**Prototype boundary:** The geometric fibre products, bounded pfp models and their dimensions are omitted from this pointwise core; no dimension is asserted for an unbounded ind-space.

**Implementation status:** unchecked.

### Affine flag convolution fibre bounds

`GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.flagConvolutionFibreBound`.

**Owner:** `GeometricSatakeAndFusion:GS0:Witt-geometry`. **Realises:** `GeometricSatakeAndFusion:GS0:Witt-geometry`, `GeometricSatakeAndFusion:GS0`.

If ℓ(uv)=ℓ(u)+ℓ(v), the product-incidence projection C_{u,v}|_{O_{uv}}→O_{uv} is an isomorphism. In general it is surjective with each geometric fibre of dimension ≥(ℓ(u)+ℓ(v)−ℓ(uv))/2. The Demazure-product projection is surjective with fibres of dimension ≥ℓ(u)+ℓ(v)−ℓ(u*v). These statements transfer to compatible pfp perfect models and their bounded pullbacks.

**Hypotheses**

- Nonempty fibres and bounded pfp models; ordinary and Demazure products kept distinct. Adjoint transfer is componentwise and needs the corrected GHN hypothesis.
- He’s standing geometric setting is a simple quasi-split group over the local field (§2.2); any transfer to other groups must use the requested componentwise comparison with its stated hypotheses.

**Proof or construction**

1. Use rank-one A¹/G_m convolution strata and induction on affine reduced words, as in GH10 2.4–2.5 cited by He 5.6.
2. Length-additive factors give uniqueness of the middle flag.
3. Transfer surjectivity and dimensions along perfected fibre products; for He’s dimension inequality use a finite cover of bounded components, not an unproved finite-component claim for the whole ind-space.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`
- `ReductiveGroupsPartII:RG2.4`
- `SchemeAndStackFoundations:SF.0`
- `SchemeAndStackFoundations:SF.4`

**Sources**

- [He21](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), 5.6 and proof 5.5, pp. 10–12. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For u=v=s, ℓ(s)=1 and s*s=s: the Demazure fibre has dimension at least one, while the ordinary-product fibre lower bound is one.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Bounded affine-flag dimension and adjoint transfer: The He/GH10 imported fibre argument must be proved on compatible bounded pfp models; the unbounded ind-space need not have finitely many components. RG2.4 supplies rank-one induction and corrected componentwise adjoint comparison; SF4 supplies local-model functoriality for GLX admissible containment. These are precise supplier obligations, not a whole affine-flag isomorphism.

**Prototype boundary:** Only the ordinary-product length/dimension inequality is typed; the bounded nonempty geometric fibre and length interpretations are omitted. The Demazure-product factor differs and is stated in the document.

**Implementation status:** unchecked.

## Semi-infinite geometry, ULA and relative perversity

`GeometricSatakeAndFusion:GS1`

Constant term is the plus pull–push functor with Braden’s minus comparison on eligible monodromic objects. The length and lattice-position lemmas establish the strata and their closed unions. Semi-infinite affineness supplies the early dimension input; integral ULA and flatness use FS’s constant-term criterion. The rational MV description is a separate later refinement. The relative perverse structure uses distinct geometric untilts and their cell shifts. EDC.5 supplies scheme perversity within its recorded coefficient range, with the additional integral/adic extension requested explicitly; L1/L3 transport the perfect scheme charts; EDS supplies the generated/Ind extension. Standard and costandard objects keep their integral map, with rational torsion comparison isolated. The MV node retains its integrated id beginning GS0:Witt-geometry for compatibility, but its parent stage and realised target are GS1. Acceptance includes the torus shift, a nonflat coefficient module, nonempty intersections, the quasi-minuscule infinity term and fixed-model trace normalization.

### Semicontinuity of completed divisor length

`GeometricSatakeAndFusion:GS1/length-semicontinuity` — lemma.

**Declaration:** `TauCeti.Suggested.GeometricSatake.divisorLengthUpperSemicontinuous`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

In the ordered O_E-untilt setup of FS VI.3.2, let f∈B⁺. The function ℓ_f:|S|→ℕ∪{∞}, s↦length_{B_s⁺}(B_s⁺/(f_s)), has open sublevel loci {s | ℓ_f(s)≤m} for every m∈ℕ. Infinite length is retained when f_s vanishes on a DVR factor; it is never replaced by zero.

**Hypotheses**

- S=Spa(R,R⁺) is affinoid perfectoid over F_q; E is a nonarchimedean local field with residue field F_q. Fix n≥1 ordered O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+}), with repetitions allowed, and primitive generators ξ_i of ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+}).
- Choose a pseudouniformizer ϖ of R. Put ξ=∏_i ξ_i, B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k), and B=B⁺[1/ξ]. These are the actual Cartier-completed period rings; ξ need not be a uniformizer when legs coincide.
- For s∈|S| use the corresponding completed residue-field pair (K(s),K(s)⁺) and the induced ring map B⁺→B_s⁺. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity.

**Proof or construction**

1. For each i, let S_i be the closed locus in S where the image of f in the i-th untilt R_i^♯ vanishes. Away from their finite union, f is a unit in every geometric completed DVR factor, so ℓ_f=0.
2. On S_i, pull back to that closed locus and divide f by its regular Cartier generator ξ_i. For f_i=f/ξ_i the geometric module length is ℓ_f=ℓ_{f_i}+1, with ∞+1=∞. This counts that one degree-one divisor even if some other legs coincide.
3. Induct on m. In each closed S_i the bad locus ℓ_f>m is the bad locus ℓ_{f_i}>m−1, closed by induction; their finite union is the complement of the required open sublevel locus. The case m=0 is the unit locus described in the first step.

**Direct prerequisites**

- `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`
- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`
- `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `RelativeFarguesFontaine:RF2:untilts`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma VI.3.3 and full proof, printed p. 204; setup in Lemma VI.3.2, printed p. 203. Open finite-length sublevel loci, proof by the closed zero loci of the untilt residues and division by a degree-one Cartier equation.

**Acceptance**

- A unit f has length zero on every fibre; f=0 has infinite length on every nonempty geometric divisor fibre.
- For one geometric leg and f=ξ_1^a, the length is a. For ξ=ξ_1^n at a coincident n-tuple, length(B_s⁺/ξ)=n, not one.
- For distinct supports, length is the sum of the DVR-factor lengths; no DVR assertion is made about the whole product.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Signature omitted under §13, reserving the exact name divisorLengthUpperSemicontinuous until the actual affinoid-perfectoid space, ordered O_E-untilts, completed Cartier rings and geometric fibre maps exist. Its intended conclusion is ∀ m:ℕ, IsOpen {s∈|S| | length_{B_s⁺}(B_s⁺/(f_s))≤m}, with length in ℕ∪{∞}. An arbitrary topological space and arbitrary length function are not a substitute. The RF2 integral geometric-DVR extension is requested explicitly; the existing geometric-divisor-complete-dvr target covers generic E-untilts.

**Implementation status:** unchecked.

**Added by:** `BP-GeometricSatakeAndFusion--GS0~2`.

### Semicontinuity of lattice position

`GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity` — lemma.

**Declaration:** `TauCeti.Suggested.GeometricSatake.latticeRelativePositionUpperSemicontinuous`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

In the ordered O_E-untilt setup of FS VI.3.2, let L⊂B be a finitely generated B⁺-submodule for which ξ^N B⁺⊂L⊂ξ^(−N)B⁺ for some N≥0. Let S_m⊂|S| be the locus where the image L_s of L⊗_{B⁺}B_s⁺ in B_s has total relative position m∈ℤ against B_s⁺. Then ⋃_{m′≥m}S_{m′} is closed for every m∈ℤ. If S_m=|S| for some m, L is a line bundle over B⁺ (a finite projective module of rank one); global freeness is not asserted.

**Hypotheses**

- S=Spa(R,R⁺) is affinoid perfectoid over F_q; E is a nonarchimedean local field with residue field F_q. Fix n≥1 ordered O_E-untilts S_i^♯=Spa(R_i^♯,R_i^{♯+}), with repetitions allowed, and primitive generators ξ_i of ker(θ_i:W_{O_E}(R⁺)→R_i^{♯+}).
- Choose a pseudouniformizer ϖ of R. Put ξ=∏_i ξ_i, B⁺=lim_k W_{O_E}(R⁺)[1/[ϖ]]/(ξ^k), and B=B⁺[1/ξ]. These are the actual Cartier-completed period rings; ξ need not be a uniformizer when legs coincide.
- For s∈|S| use the corresponding completed residue-field pair (K(s),K(s)⁺) and the induced ring map B⁺→B_s⁺. Its distinct geometric untilt supports give the finite product of complete DVRs; repeated supports do not create new product factors. Use ordinary module length over that product, allowing infinity.
- Relative position uses the sum of the valuations on the distinct geometric DVR factors, with the convention that for L_s⊂B_s⁺ it is length(B_s⁺/L_s). The image of tensor base change is used, not an unproved injectivity of L⊗B_s⁺→B_s.
- L is finitely generated, open and bounded in the displayed ξ-adic sense. These hypotheses imply only finitely many relative-position values; local principality is the conclusion, not an input.

**Proof or construction**

1. Multiply L by a power of ξ to reduce to L⊂B⁺. This changes every relative-position value by the same constant (the degree n times that power), so it preserves the claimed semicontinuity and constant-position criterion.
2. At a point s, B_s⁺ is a finite product of DVRs and L_s is a free rank-one ideal. After localizing S, choose l∈L whose image generates L_s. Apply length-semicontinuity to l: near s the length of B_t⁺/(l_t) is at most the length at s.
3. Since B⁺l⊂L, the relative position of L_t is at most that of B_t⁺l. Thus the relative-position sublevel loci are open; taking complements gives closed loci of position at least m.
4. If the position is constant, the containment B⁺l⊂L has equal geometric fibre positions nearby and is an equality there; the generator gives a local trivialization. The ring/lattice fibre-detection step is supplied by RF4’s stated finite-projectivity and fibre-detection extension, not inferred from an arbitrary ring map. These local identifications make L a line bundle.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/length-semicontinuity`
- `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`
- `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`
- `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`
- `RelativeFarguesFontaine:RF4:vector-bundles`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma VI.3.2 and full proof, printed pp. 203–204; relative-position convention immediately before the lemma. Finite-generation and open-boundedness, closed upper-position loci, and the constant-position rank-one conclusion.

**Acceptance**

- L=B⁺ has constant position zero and is a line bundle. L=ξ^aB⁺ has constant total position na, including coincident legs.
- The closed-locus direction is position≥m; the open-locus direction is position≤m. They are not interchanged.
- Constancy gives local rank-one projectivity, not a chosen global generator; no assertion is made for a merely pointwise specified or non-finitely-generated submodule.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Signature omitted under §13, reserving the exact name latticeRelativePositionUpperSemicontinuous until the genuine completed Cartier-ring family and its fibrewise submodule images and relative positions can be stated. Its single named mathematical contract includes both the closed loci ⋃_{m′≥m}S_{m′} and the implication S_m=|S| ⇒ L finite projective of rank one. Do not assume L projective in order to state the result, replace finite generation by arbitrary lattice data, or substitute a proposition-valued placeholder. The RF2 integral geometric-DVR and RF4 fibre-detection extensions remain requests.

**Implementation status:** unchecked.

**Added by:** `BP-GeometricSatakeAndFusion--GS0~2`.

### Semi-infinite strata and constant terms

`GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.constantTerm`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For a parabolic P⁺⊂G with Levi M and opposite P⁻, Hck_{P±}→Hck_G and Hck_{P±}→Hck_M give CT_P=R(p⁺)_!(q⁺)*. On bounded monodromic objects it identifies with R(p⁻)_*R(q⁻)!. For a Borel, on a one-leg geometric fibre with primitive equation t, the local strata are S_λ=L U·λ(t). On a general geometric fibre the stratum of total cocenter weight ν is the union of products of these local strata over the distinct supports, with local labels summing to ν. The union of total-weight strata with ν′≤ν is closed as in VI.3.1; for a Borel this is the coroot order on all coweights, without requiring dominance; the attracting and repelling decompositions come from a regular central cocharacter of M.

**Hypotheses**

- G split for labels; bounded quasicompact Schubert support; coefficients killed by an integer prime to p initially, with derived adic passage supplied by L0. The cocenter degree is the sum of the combined local cocharacters over distinct geometric supports, counted once each. At collisions the ordered-leg labels add first; the support multiplicity is not an additional weight (E24).

**Proof or construction**

1. Use RG’s parabolic/Levi and Iwasawa decompositions on geometric points. For the locally closed strata and their closed weight-bound unions, reduce via a faithful representation, maximal parabolics and exterior powers to an image submodule of a rank-one period module; apply lattice-relative-position-semicontinuity (FS VI.3.2), whose proof uses length-semicontinuity (VI.3.3). In that reduction use ordinary product-DVR length, as in VI.3.2, rather than the extra multiplicity weighting in the description before VI.3.1 (E24).
2. Verify FS IV.6.1’s finite attracting/repelling decomposition on each bound.
3. Import the diamond hyperbolic-localization theorem, base change, duality and ULA preservation from VS1; apply it to the maps of Hecke stacks.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`
- `ReductiveGroupsPartII:RG2.4`
- `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`
- `VStackSheavesAndLisseCategories:VS1`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category`
- `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`
- `AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits`
- `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`
- `VStackSheavesAndLisseCategories:VS0`
- `GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity`
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-localization`
- `VStackSheavesAndLisseCategories:VS1/braden-theorem`
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-base-change-duality-and-ula`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.3.1–VI.3.5, pp. 201–206. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.6.1: ULA is detected by constant terms after the weight shifts.
- FS VI.7.4/VI.7.7: Constant terms recognize perversity and coefficient flatness.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.constantTerm_formula` | characterisation | The plus constant-term functor is q-plus pullback followed by p-plus shriek pushforward. |
| `TauCeti.Suggested.GeometricSatake.constantTerm_minus_comparison` | equivalence | On bounded monodromic complexes the plus formula is naturally isomorphic to q-minus exceptional pullback followed by p-minus star pushforward. |
| `TauCeti.Suggested.GeometricSatake.constantTerm_map_comp` | functoriality | Constant term preserves composition of morphisms as a genuine functor. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.ct_torus` | degenerate | For G=T with identity correspondence, constant term is the identity functor. |
| `TauCeti.Suggested.GeometricSatake.ct_point_evaluation` | computation | The plus formula evaluates to p-shriek of q-star on every object. |
| `TauCeti.Suggested.GeometricSatake.ct_order` | compatibility | Composition agrees with Mathlib Functor.comp in pullback-then-pushforward order. |

**Acceptance**

- For G=T the constant term is the identity; plus and minus formulas need monodromicity. For two coincident G_m legs with labels (1,0), the combined lattice tB⁺ has degree one, even though the product Cartier equation is t². A second multiplicity factor would incorrectly give degree two.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The plus/minus comparison omits monodromicity and the geometric correspondence hypotheses. The functor type and plus composition are concrete; hyperbolic localization is imported from VS1.

**Implementation status:** unchecked.

**Planet:** Constant term functor.

### Affine semi-infinite intersections

`GeometricSatakeAndFusion:GS1/semi-infinite-affineness` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.semiInfiniteBoundAffine`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

On the Witt special fibre, S_λ∩Gr_{≤μ} is affine and perfectly finitely presented. It is the nonvanishing locus of a section of the ample determinant line on the closed weight-bound union. When nonempty, this bounded intersection is equidimensional of dimension ⟨ρ,μ+λ⟩; the same holds for its nonempty open intersection with the exact μ-cell. Neither dimension formula is asserted for an empty intersection.

**Hypotheses**

- Split group; fixed perfect field; nonempty for the dimension assertion; integral coefficient freeness does not follow from cycle counting.

**Proof or construction**

1. Use the faithful representation and a highest-weight determinant section to express the semi-infinite weight condition as a nonvanishing locus (VI.3.7).
2. Import A_inf lattice extension needed to define the section; then apply the GS0 determinant ampleness theorem.
3. Use the closed filtration by the height ⟨2ρ,λ⟩: successive complements are affine, so each step drops dimension by at most one. The total number of steps equals the total dimension drop from the bound to its antidominant point, forcing equidimensionality as in VI.3.8. The exact-cell intersection is open. This argument precedes rational weight concentration and uses no minimal-convolution generation theorem.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`
- `RelativeFarguesFontaine:RF4:G-torsors`
- `ReductiveGroupsPartII:RG2.1`
- `SchemeAndStackFoundations:SF.5`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.3.7–VI.3.8, pp. 205–207. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For a torus the nonempty intersection is a point; λ outside the weights gives an empty intersection.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** X must be the specified bounded semi-infinite intersection on its pfp model. Affineness also holds for the empty intersection; nonemptiness is required only for the dimension equality. General perfect-space affineness requires the SF model interface.

**Implementation status:** unchecked.

### Mirković–Vilonen intersections

`GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.mvCycleDimension`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For the rational special-fibre category over k̄, the top-dimensional irreducible components of the nonempty S_λ∩Gr_μ give the weight-cycle description of H_c^{⟨2ρ,λ⟩}(S_λ,IC_μ). The intersection dimension is ⟨ρ,μ+λ⟩; unshifted constant coefficients on its open top-dimensional pieces occur in degree ⟨2ρ,μ+λ⟩. Cycle normalization is relative to a fixed finite model, since different perfection models can rescale trace classes by powers of p.

**Hypotheses**

- Rational ℓ-adic coefficients; IC perverse normalization [⟨2ρ,μ⟩]; choose model; no assertion of a canonical integral cycle basis.

**Proof or construction**

1. Use semi-infinite dimensions and the rational concentration theorem.
2. Apply top compact-support cohomology on fixed finite-type models and étale-topos invariance.
3. Normalize fundamental classes on those models; Zhu A.3.3 does not supply a model-independent trace under Frobenius.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`
- `GeometricSatakeAndFusion:GS1/rational-weight-concentration`
- `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`

**Sources**

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 2.8–2.9, pp. 434–436; A.3.3, pp. 479–480. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- The nonempty torus case has one component and weight dimension one.

**Remaining obligations**

- Rational MV trace normalization on perfect models: Fix a finite model and its Frobenius power for fundamental classes; Zhu A.3.3’s model-independent scalar trace omits p-power degree. Require nonempty geometric intersections, geometrically irreducible components for a scalar trace, and the spreading step in the finite-field point-count route. The integral CT/perverse criterion uses FS instead of a rational MV basis.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the normalized dimension equality is typed; the nonempty Schubert/semi-infinite intersection, MV components and rational trace model are omitted.

**Implementation status:** unchecked.

**Planet:** Mirković–Vilonen cycles.

### Prounipotent equivariance invariance

`GeometricSatakeAndFusion:GS1/prounipotent-equivariance` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.prounipotentEquivariance`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

Let H be a group small v-sheaf over S with closed congruence subgroups H^{≥m}, complete separated filtered presentation, and, v-locally on S, finite filtrations of each successive quotient by affine-line diamonds of untilts. If the action on X factors through H^{<m}=H/H^{≥m}, m>0, pullback D_ét(H^{<m}\X,Λ)→D_ét(H\X,Λ) is an equivalence for coefficients killed by an integer prime to p. Consequently the deep congruence kernel adds no equivariance data. H itself need not have a finite filtration.

**Hypotheses**

- Closed congruence filtration as in FS VI.4.1, with the filtered spatial ball-subgroup/inverse-limit presentation used in its proof; action factors at a finite level.
- Λ is killed by n prime to p. The adic extension is levelwise with compatible derived coefficient limits, not an unrestricted p-torsion assertion.

**Proof or construction**

1. Descend along S→[H^{<m}\S] to reduce to a trivially acting deep kernel. Use the section to reduce equivariant descent to full faithfulness of pullback on complexes.
2. Compute ordinary cohomology RΓ(S,A)→RΓ(S×H,A), using Postnikov towers, spatial ball subgroups H_j and their finite quotients H_j^{<r}. Apply Sch17a 14.9 continuity and ordinary cohomology of relative balls.
3. Descend the equivalence through the action nerve and apply finite bounded-action factorization. Affine-space compact support is Λ(−d)[−2d], so it is not unshifted acyclicity.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`
- `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`
- `DiamondSixOperations:S4/cohomologically-smooth`
- `DiamondSixOperations:S4/smooth-composition`
- `DiamondSixOperations:S4/smooth-stable-under-base-change`
- `DiamondSixOperations:S4/smooth-descent-along-smooth-surjection`
- `DiamondSixOperations:S5/ball-smooth`
- `DiamondSixOperations:S5/analytic-smooth-is-cohomologically-smooth`
- `AdicCoefficientsAndComparisons:L0/derived-I-complete-etale-category`
- `AdicCoefficientsAndComparisons:L0/adic-coefficient-limit`
- `AdicCoefficientsAndComparisons:L0/completed-tensor-and-colimits`
- `AdicCoefficientsAndComparisons:L0/six-operations-for-adic-coefficients`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `VStackSheavesAndLisseCategories:VS1`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.4.1, pp. 207–208. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- A vector group has only the trivial bounded prime-to-p equivariant local system; this fails as an unrestricted p-torsion assertion.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Early coefficient scope and filtered-equivariance continuity: Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

**Prototype boundary:** D/DEq are the actual finite-quotient and full filtered-equivariant derived categories. The closed filtration, factorized action, spatial continuity and prime-to-p coefficient hypotheses are supplied by VS1 and omitted from this equivalence signature.

**Implementation status:** unchecked.

### Conservativity of constant terms

`GeometricSatakeAndFusion:GS1/constant-term-conservativity` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.constantTermConservative`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For split G and a Borel B, CT_B is conservative on bounded Hecke complexes with quasicompact Schubert support. After a splitting extension this supplies the corresponding criterion for general G/E.

**Hypotheses**

- Bounded support and monodromic/positive-loop equivariance; prime-to-p coefficients.

**Proof or construction**

1. Use the closed semi-infinite filtration and choose an extremal nonzero stratum.
2. Prounipotent invariance and hyperbolic localization identify its detecting constant term.
3. Descend conservativity along the splitting cover.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`
- `GeometricSatakeAndFusion:GS1/prounipotent-equivariance`
- `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.4.2, pp. 208–209. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For a torus the detecting functor is identity; arbitrary unbounded support is excluded.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** CT must be the geometric torus constant term on the bounded-support category; its geometric hypotheses are omitted.

**Implementation status:** unchecked.

### ULA Hecke complexes

`GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

D^ULA(Hck_G/S,Λ) is the full subcategory of complexes with bounded quasicompact Schubert support whose pullback to Gr_G is universally locally acyclic over S. Switching the two torsors preserves this condition. On one leg over Spd O_C this is equivalent to requiring that every open-cell restriction along a geometric section is locally constant with perfect fibre.

**Hypotheses**

- Support can be locally bounded on the base; a fixed bound is used in each argument. General ULA and stack formalism imported from VS1.

**Proof or construction**

1. Use the smooth truncated positive-loop quotient charts and VS1’s ULA descent.
2. Use the definition and smooth-chart ULA descent to construct the category. VI.6.5 reduces one-leg ULA to cell restrictions; the later VI.6.4 constant-term criterion is proved in ula-constant-term-criterion, not assumed here.
3. Demazure generators and prounipotent invariance prove the reverse implication; no arbitrary collision-version of 6.5 is asserted.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/prounipotent-equivariance`
- `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`
- `mathlib:Action`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.1–VI.6.5, pp. 211–214. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.6.1–VI.6.5: CT criterion and Demazure generation control ULA objects.
- FS VI.8.1(i): Convolution composes proper relative ULA kernels.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory_finite_action` | compatibility | The typed equivariant-object core is Action DU H, where DU is the supplied ULA category and H is a finite jet group on the chosen bound. |
| `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory_forget` | projection | Forget positive-loop equivariance to the underlying ULA object, keeping its intertwining morphisms. |
| `TauCeti.Suggested.GeometricSatake.ulaHeckeCategory_trivial_action` | constructor | A ULA object has the trivial finite-jet action whenever this is the desired equivariance. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.ula_trivial_group` | degenerate | For the trivial group, an equivariant object has no additional automorphism labels. |
| `TauCeti.Suggested.GeometricSatake.ula_intertwining` | non-example | A morphism between equivariant ULA objects must intertwine every group element; an arbitrary underlying morphism is insufficient. |
| `TauCeti.Suggested.GeometricSatake.ula_action_identity` | compatibility | The finite-jet action obeys the existing Action identity law. |

**Acceptance**

- The unit complex is ULA; a locally constant but nonperfect coefficient complex is excluded; one-leg stratum recognition is not asserted at collisions.

**Remaining obligations**

- Stack enhancement and coherent Ind convolution: VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** DU is imported as the ULA category, not defined by an unknown proposition. Action DU H is only the discrete equivariant-object core at a chosen level; smooth geometric action/descent, bounded supports, and enhanced ULA kernels are not encoded.

**Implementation status:** unchecked.

**Planet:** ULA Hecke complexes.

### ULA recognition by constant terms

`GeometricSatakeAndFusion:GS1/ula-constant-term-criterion` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.ulaConstantTermPerfect`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For a bounded Hecke complex A, the following are equivalent: A is ULA; CT_B A is ULA; for every D→Div^d the torus constant-term pushforward over D is locally constant with perfect stalks. On one-leg or disjoint-leg bases the ULA category is stable under Verdier duality, tensor and internal Hom, cell !/* extensions and cell !/* restrictions.

**Hypotheses**

- Split G and Borel for labels; the disjoint-leg restriction is essential for the complete cell calculus.

**Proof or construction**

1. For the forward direction, hyperbolic localization preserves ULA and proper torus pushforward on a bounded support remains ULA.
2. For the converse, reduce to a strictly totally disconnected base and split G, and use the ULA diagonal-duality map of IV.2.23 on a bounded finite-dimensional quotient chart. By conservativity of CT for G×G it suffices to apply CT_{B⁻×B}; compatibility with exterior tensor products and hyperbolic duality IV.6.13 identifies the result with the same ULA criterion for CT_B(A). The final perfect locally constant pushforward criterion uses IV.2.28.
3. Apply the one-leg cellwise criterion VI.6.5 and its closure consequence VI.6.6 one leg at a time on the disjoint locus for VI.6.8. The arbitrary collision version of those cell-functor closure assertions is not claimed.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`
- `GeometricSatakeAndFusion:GS1/constant-term-conservativity`
- `VStackSheavesAndLisseCategories:VS1`
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `mathlib:DerivedCategory`
- `mathlib:Module.Finite`
- `mathlib:Module.Projective`
- `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-base-change-duality-and-ula`
- `VStackSheavesAndLisseCategories:VS1/perfect-local-systems`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.4–VI.6.6, VI.6.8, pp. 212–215. The stated construction or result, with the conventions and corrections specified in this node.

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.perfect_complex_cohomology_not_projective` | non-example | For R=Z/4Z, the quotient R/(2) is not a projective R-module. It occurs as cohomology of the two-term perfect complex R → R with differential multiplication by 2, so perfect constant-term stalks do not imply projectivity of their individual cohomology modules. |

**Acceptance**

- No claim that all four cell functors preserve ULA over an arbitrary collision family.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The typed coefficient core states that a geometric CT stalk admits a bounded cochain model of finite projective terms representing that derived object. Those terms are a strict perfect model, not the individual cohomology modules. The identification with the actual CT stalk, étale local constancy and ULA hypotheses require the supplied sheaf carriers and are omitted.

**Implementation status:** unchecked.

### One-leg ULA special/generic comparison

`GeometricSatakeAndFusion:GS1/integral-family-comparison` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.oneLegULAComparison`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For a split integral model and one leg, restriction induces equivalences D^ULA(Hck_{Spd O_C},Λ)≃D^ULA(Hck_{Spd C},Λ)≃D^ULA(Hck_{Spd k̄},Λ), compatible with finite Schubert bounds and coefficient change. The special side is identified with perfected scheme charts by the L1/L3 comparison; this is an actual restriction equivalence, not a formal analogy between lattice rings.

**Hypotheses**

- Algebraically closed complete untilt C; split integral model; bounded quasicompact support; prime-to-p/derived adic coefficients.

**Proof or construction**

1. Use the cellwise locally constant perfect criterion, whose restriction over the strictly local trait is an equivalence.
2. Induct on finite Schubert stratifications with gluing; Demazure generators give essential surjectivity.
3. Use VI.6.7, L1/L3 and perfection invariance to identify the scheme-valued special category.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness`
- `AdicCoefficientsAndComparisons:L1/char-p-scheme-diamond-and-comparison-functor`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`
- `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`
- `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.7, p. 214; VI.7.4, pp. 217–219. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- An arbitrary non-ULA complex is not transported by this equivalence; split model fixed throughout.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The supplied categories must be the one-leg ULA categories with compatible finite supports. Arbitrary multi-leg collisions are excluded in the document.

**Implementation status:** unchecked.

### Relative perverse t-structure

`GeometricSatakeAndFusion:GS1/relative-perverse-t-structure` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.relativePerverse`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

On the bounded-support derived category over a leg base S, define perverse ≤0 by the condition that at each geometric point with r distinct untilts and open-cell labels μ₁,…,μ_r, the restriction lies in ordinary degrees ≤−Σ⟨2ρ,μ_i⟩. The opposite aisle is obtained by the glued costalk inequalities. These form a t-structure; pullback in S is t-exact. On ULA objects the relative condition is detected on geometric fibres.

**Hypotheses**

- Use distinct local factors at collisions; bounded support and locally finite Schubert stratification. Stable enhancement and presentability are imported from EDS.

**Proof or construction**

1. Use the stable enhanced category and Lurie HA 1.4.4.11 to generate the aisle and right orthogonal.
2. Glue finite Schubert pieces; compare on special finite models with EDC.5 via L1/L3.
3. Use hyperbolic localization and ULA to prove the geometric-fibre criterion and base-change t-exactness.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`
- `GeometricSatakeAndFusion:GS1/integral-family-comparison`
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`
- `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`
- `EnhancedDerivedSheaves:E5:abstract/stable-infinity-category`
- `EnhancedDerivedSheaves:E5:presentability/ind-completion`
- `EnhancedDerivedSheaves:E5:presentability`
- `mathlib:CategoryTheory.Triangulated.TStructure`
- `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`
- `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.1–VI.7.4, pp. 215–219. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.7.7–VI.7.8: Flat objects and Satake are defined in this relative heart.
- FS VI.8.1(ii): t-exact constant terms detect convolution bounds.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.relativePerverse_le` | characterisation | On ULA complexes, the nonpositive aisle is detected by the normalized torus constant term in nonpositive ordinary degrees. |
| `TauCeti.Suggested.GeometricSatake.relativePerverse_ge` | characterisation | On ULA complexes, the nonnegative aisle is detected by normalized torus constant term in nonnegative ordinary degrees. |
| `TauCeti.Suggested.GeometricSatake.relativePerverse_existing_heart` | compatibility | Its heart is the intersection of the two degree-zero aisles, using Mathlib TStructure.heart. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.perverse_torus` | degenerate | For a torus, normalized constant term is the identity and the relative perverse structure is the ordinary one. |
| `TauCeti.Suggested.GeometricSatake.perverse_zero` | computation | The zero object belongs to the relative perverse heart. |
| `TauCeti.Suggested.GeometricSatake.perverse_shifted_cell` | compatibility | A smooth d-dimensional cell uses the normalization Λ[d], and on a normalized torus constant term its degree is zero. |

**Acceptance**

- On a smooth μ-cell the constant sheaf shifted by ⟨2ρ,μ⟩ is perverse; colliding legs use the cell label of their sum.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Early coefficient scope and filtered-equivariance continuity: Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

**Prototype boundary:** D and DT denote the imported ULA categories with their triangulated structures; CT denotes the conservative normalized constant-term functor. The assumptions asserting that these data arise from the geometric Hecke family are omitted. This is an actual TStructure signature, not a proposition-valued stand-in.

**Implementation status:** unchecked.

**Planet:** Relative perverse t-structure.

### Equivariant perverse descent and constant terms

`GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.perverseConstantTermExact`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

Pullback of perverse Hecke objects to Gr is fully faithful. For A≤0 and B≥0 the derived Hom is connective. Shifted CT_B[deg⟨2ρ,−⟩] is t-exact and conservative, and the relative t-structure commutes with base change.

**Hypotheses**

- Finite bounded charts and positive-loop equivariance; ordinary scheme perverse input is EDC.5, not EDC.7.

**Proof or construction**

1. Use FS 7.3: for a connected cohomologically smooth map with section, H⁰Rf_*f*A→H⁰A is an isomorphism in the connective range.
2. Combine finite action truncation with perverse gluing for full faithfulness.
3. Reduce by collision-stratum excision and cell devissage to a one-leg shifted constant sheaf over a geometric base, then to field coefficients. On the Witt special fibre use dim(S_λ∩Gr_μ)≤⟨ρ,μ+λ⟩ and the ordinary compact-support bound 2dim; hyperbolic duality gives the costalk side. Transport by the one-leg comparison and geometric-point criterion. This does not use the later rational weight-concentration theorem.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`
- `GeometricSatakeAndFusion:GS1/constant-term-conservativity`
- `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`
- `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`
- `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.2–VI.7.4, pp. 216–219. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For a torus the shift is zero; signs must make the μ-cell constant sheaf in perverse degree zero.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Early coefficient scope and filtered-equivariance continuity: Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

**Prototype boundary:** CT must include the root-degree shift, and D the geometric ULA category. Smooth finite-jet stack descent and that identification are omitted.

**Implementation status:** unchecked.

### Flat perverse objects

`GeometricSatakeAndFusion:GS1/flat-perverse-objects` — definition.

**Declaration:** `TauCeti.Suggested.GeometricSatake.flatPerverse`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

A perverse object A is coefficient-flat if A⊗^L_Λ M is perverse for every Λ-module M. Among ULA objects this is equivalent to shifted torus constant terms having finite projective fibres concentrated in degree zero. Flatness defines a full subcategory; it is not automatic for integral perverse objects.

**Hypotheses**

- Prime-to-p torsion rings and compatible adic systems; the ordinary tensor test uses every module, not just Λ itself.

**Proof or construction**

1. Use t-exact conservative shifted CT and its compatibility with derived coefficient tensors.
2. Reduce to the algebraic condition that a perfect Λ-complex remains concentrated in degree zero after every tensor.
3. Use Module.Flat/projectivity on finite perfect fibres; retain the all-module test.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`
- `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`
- `mathlib:Module.Flat`
- `mathlib:Module.Projective`
- `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.7, pp. 220–221. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.7.7–VI.7.8: Satake imposes coefficient flatness in addition to perversity.
- FS VI.8.1(iii): Tensoring by arbitrary modules tests flatness after convolution.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.flatPerverse_iff` | characterisation | An object is flat perverse when it is in the heart and remains there after derived coefficient tensor with every R-module. |
| `TauCeti.Suggested.GeometricSatake.flatPerverse_module` | compatibility | On the one-point torus, coefficient flatness is Module.Flat: tensoring any injective linear map stays injective. |
| `TauCeti.Suggested.GeometricSatake.flatPerverse_heart` | projection | A flat-perverse object belongs to the Mathlib t-structure heart. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.flat_perverse_zero` | degenerate | The zero object is flat perverse when coefficient tensors preserve zero. |
| `TauCeti.Suggested.GeometricSatake.flat_module_field` | computation | Every vector space over a coefficient field is flat, agreeing with the point-torus test. |
| `TauCeti.Suggested.GeometricSatake.flat_module_integral_nonexample` | non-example | Z/2 as a Z-module is not flat; being concentrated in perverse degree zero does not suffice. |

**Acceptance**

- Over Z/ℓ² the module Λ/ℓ has higher Tor and is not coefficient-flat.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Early coefficient scope and filtered-equivariance continuity: Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

**Prototype boundary:** The all-module derived tensor functors come from the coefficient supplier. The predicate is fully stated using the existing t-structure heart; the module compatibility specializes it to the existing injectivity characterization of Module.Flat. Derived tensor is not identified with ordinary tensor without flatness.

**Implementation status:** unchecked.

**Planet:** Flat perversity.

### Standard and costandard objects

`GeometricSatakeAndFusion:GS1/standard-costandard-objects` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.standardCostandard`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Perverse`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For a one-leg μ-cell of dimension d_μ, Δ_μ=pH⁰j_{μ!}Λ[d_μ] and ∇_μ=pH⁰Rj_{μ*}Λ[d_μ]. These objects are ULA and flat perverse, commute with base/coefficients, and Verdier duality interchanges them with Tate twist d_μ. The canonical map Δ_μ→∇_μ is retained integrally.

**Hypotheses**

- One-leg base, split model; IC has perverse normalization [d_μ], not [2d_μ].

**Proof or construction**

1. Apply cell ULA calculus and perverse gluing.
2. Use shifted CT and affine perverse vanishing to prove finite free fibres.
3. Use relative duality on the smooth open cell for the Tate twist. The rational isomorphism and uniform torsion bound are a separate target.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/flat-perverse-objects`
- `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`
- `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`
- `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.5 and VI.7.9, pp. 219–222. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.7.5: Uniform bounded torsion compares standard and costandard objects.
- Zhu 2.2.2: Rational IC generation uses normalized minimal objects.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.standardCostandard_formula` | characterisation | The standard and costandard objects are perverse H⁰ of j-shriek and j-star of the shifted constant local system Λ[d], respectively. |
| `TauCeti.Suggested.GeometricSatake.standardCostandard_map` | data | Adjunction gives the standard-to-costandard map; its perverse image is the IC object. |
| `TauCeti.Suggested.GeometricSatake.standardCostandard_restriction` | compatibility | Both restrict to the same normalized local system on the open cell. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.standard_zero_cell` | degenerate | For a point cell with identity inclusions the pair is the same constant object. |
| `TauCeti.Suggested.GeometricSatake.standard_open_restriction` | computation | The costandard object restricts to Λ[d] on its own cell. |
| `TauCeti.Suggested.GeometricSatake.standard_h0_normalization` | non-example | The construction takes perverse H⁰ and the geometric dimension shift before forming the standard-to-costandard map; unshifted ordinary H⁰ is not substituted. |

**Acceptance**

- At μ=0 both are the unit; over integral coefficients their canonical map need not be an isomorphism.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Early coefficient scope and filtered-equivariance continuity: Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

**Prototype boundary:** jshriek/jstar, jpull, h0 and constant must be the indicated geometric functors and local system. Their geometric identities are omitted, while the existing shift/functor/object types fix the construction order.

**Implementation status:** unchecked.

**Planet:** Standard Satake objects.

### Rational parity and integral torsion bounds

`GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.standardCostandardBoundedTorsion`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For fixed μ, Δ_μ→∇_μ is an isomorphism after rationalization, and over Z_ℓ its kernel and cokernel are killed by some ℓ^a uniformly under base change. The rational special-fibre equivariant perverse category is semisimple with simple IC_μ indexed by dominant coweights and constant equivariant local systems.

**Hypotheses**

- Rational statement requires decomposition/parity and connected stabilizers; the integral category is not semisimple.

**Proof or construction**

1. Import EDC.7’s rational proper direct-image decomposition and parity on Demazure generators.
2. Connected stabilizers rule out additional equivariant simple local systems.
3. Finite-generation and base-change compatibility of fixed-bound CT detect a uniform torsion exponent; this late result is not a prerequisite of early geometric smoothness or the ULA criterion.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/standard-costandard-objects`
- `EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`
- `ReductiveGroupsPartII:RG2.3`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`
- `mathlib:PadicInt`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.5 end and proof, pp. 219–220. The stated construction or result, with the conventions and corrections specified in this node.

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Lemma 2.1 and its proof, printed pp. 429–430. Rational special-fibre equivariant semisimplicity and the parity argument used by FS VI.7.5.

**Acceptance**

- The assertion does not set a=0 and does not make integral extensions split.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** R is explicitly a ℤ_ℓ-algebra, ℓ is prime, and the bound is ℓ^a. M must be the specified standard-to-costandard kernel or cokernel. The source supplies one a(μ) independent of R; this single-module core omits the geometric μ/family identification, not the coefficient algebra or the nonvacuous power bound.

**Implementation status:** unchecked.

### Rational special-fibre weights

`GeometricSatakeAndFusion:GS1/rational-weight-concentration` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.rationalWeightsFinite`.

**Owner:** `GeometricSatakeAndFusion:GS1`. **Realises:** `GeometricSatakeAndFusion:GS1`.

For rational equivariant perverse A on the Witt Grassmannian, H_c^i(S_λ,A)=0 unless i=⟨2ρ,λ⟩. The resulting weight functors are exact. For μ minuscule the weight multiplicities are one at Weyl orbit weights; for quasi-minuscule μ the zero-weight multiplicity is the number of simple coroots of G in the Weyl orbit of the quasi-minuscule coweight (the short simple coroots); equivalently count the corresponding simple roots of the dual root system. General concentration follows by generation from minimal convolutions.

**Hypotheses**

- k algebraically closed; rational coefficients only; CT normalization uses compact support.

**Proof or construction**

1. Use Zhu 2.11’s minuscule flag and quasi-minuscule parahoric P¹ resolution; retain the section-at-infinity term missing in 2.2.13.
2. Use the corrected twisted external product and finite-jet U-torsor descent in 2.17.
3. Apply generation by minimal objects (2.16) and exact summands, plus early scheme semismallness for minimal convolution.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`
- `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`
- `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`
- `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`
- `ReductiveGroupsPartII:RG2.4`

**Sources**

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 2.7 and 2.11–2.17, pp. 434, 436–440. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For the SL₃ highest root, the zero-weight dimension is two; the missing infinity contribution would give the wrong answer.

**Remaining obligations**

- Rational MV trace normalization on perfect models: Fix a finite model and its Frobenius power for fundamental classes; Zhu A.3.3’s model-independent scalar trace omits p-power degree. Require nonempty geometric intersections, geometrically irreducible components for a scalar trace, and the spreading step in the finite-field point-count route. The integral CT/perverse criterion uses FS instead of a rational MV basis.
- Quasi-minuscule infinity contribution and minimal generation: For the quasi-minuscule P¹ resolution retain the section-at-infinity term absent from Zhu (2.2.13); in SL₃ the zero-weight multiplicity is two. Check the corrected parahoric in type A_n, the finite U-jet torsor/twisted external product in 2.17 and 2.16’s minimal-generation argument with the RG/EDC interfaces.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** W must be the concentrated rational weight module of the specified IC object. Its MV basis and the degree-vanishing assertions require enhanced cohomology interfaces and are omitted.

**Implementation status:** unchecked.

## Satake objects and convolution

`GeometricSatakeAndFusion:GS2`

This aggregate has two substages: the objects/correspondences and their closure/duals. Every underlying target is recorded once with the substage as parent and GS2 in its realised stages. The aggregate accepts coherent bounded convolution and its restriction to all three Satake conditions. It neither imports symmetric fusion to prove closure nor asserts that the total-cohomology filtration has a canonical tensor splitting.

## Satake category, fibre functor and Hecke correspondences

`GeometricSatakeAndFusion:GS2:correspondences`

The full subcategory retains boundedness, ULA, relative perversity and coefficient flatness. Its fibre functor takes total cohomology in every integer degree and has finite projective locally constant fibres. Parity makes the finite semi-infinite filtration spectral sequence degenerate; the finite-projective graded terms give exactness, and the split-kernel lifting theorem together with conservativity gives faithfulness. Verdier duality and normalized Levi constant terms preserve these objects. Convolution is first constructed in the enhanced ambient category, with proper finite bounds, a twisted external tensor and coherent associator/unit maps. The rational Witt special-fibre adapter proves semismallness and perversity with rational coefficients. Acceptance includes the zero object, exclusion of an object outside the heart, the torus sum of skyscraper labels, and the distinction between a bounded twisted product and an untwisted product.

### Satake category

`GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor` — definition.

**Declaration:** `TauCeti.Suggested.GeometricSatake.satakeCategory`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Convolution`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS2:correspondences`. **Realises:** `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2`.

Sat^I_G(S,Λ) is the full subcategory of the bounded-support Hecke derived category consisting of ULA, relative perverse, coefficient-flat objects. Equivariance is encoded by the Hecke stack. Pullback to Gr is fully faithful and the switch involution preserves the category. The category is additive and exact under sequences whose terms remain flat; it is not asserted to be abelian.

**Hypotheses**

- Split integral or generic descended setting; all three conditions are required.

**Proof or construction**

1. Intersect the ULA subcategory with the relative perverse heart and the all-module flatness condition.
2. Use VI.7.7 and perverse descent to obtain the finite-projective constant-term characterization.
3. Use the switch and relative duality for the involution.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`
- `GeometricSatakeAndFusion:GS1/flat-perverse-objects`
- `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`
- `mathlib:CategoryTheory.Triangulated.TStructure.Heart`
- `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.8–VI.7.9, pp. 221–222. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.8: Convolution must preserve all three conditions.
- HeckeStacksAndLocalShtukas:HS2: Satake complexes provide the Hecke kernel coefficients.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.satakeCategory_full_subcategory` | compatibility | Satake is the full subcategory of the supplied bounded ULA category whose underlying object is flat perverse. |
| `TauCeti.Suggested.GeometricSatake.satakeCategory_inclusion` | projection | The full-subcategory inclusion forgets only the Satake flat-perverse condition and is fully faithful. |
| `TauCeti.Suggested.GeometricSatake.satakeCategory_morphisms` | characterisation | A Satake morphism is the same underlying ULA morphism; no separate morphism condition is imposed. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.satake_zero` | degenerate | A zero ULA object whose underlying object is zero belongs to Satake. |
| `TauCeti.Suggested.GeometricSatake.satake_inclusion_fully_faithful` | compatibility | Morphisms agree with those in the existing Mathlib ObjectProperty full-subcategory construction. |
| `TauCeti.Suggested.GeometricSatake.satake_wrong_degree` | non-example | A ULA object outside the relative perverse heart is excluded from Satake. |

**Acceptance**

- A ULA object in the wrong perverse degree is excluded; Λ/ℓ over Λ=Z/ℓ² is excluded by flatness; the unit lies in Satake.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** DU denotes the imported bounded-support ULA category and forgetULA its geometric inclusion. Boundedness is encoded in that input category, not in a new unknown proposition. The actual three-condition Satake subcategory uses Mathlib FullSubcategory.

**Implementation status:** unchecked.

**Planet:** Satake category.

### Satake cohomology functor

`GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.satakeFibre`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Convolution`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS2:correspondences`. **Realises:** `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2`.

F^I(A)=⊕_i H^iRπ_*(A|Gr^I_G) is a locally constant sheaf of finite projective Λ-modules on the leg base. It is exact, faithful and conservative on Satake objects. It has the semi-infinite filtration whose graded pieces are shifted constant terms; over a general base this does not yet give a canonical splitting or a switch-invariant tensor identification. If ker F(f)→F(A) is split, f:A→B has a kernel in Satake and F preserves it; if F(B)→coker F(f) is split, the analogous cokernel exists and is preserved. These split conditions are essential over integral coefficients and do not make Satake abelian.

**Hypotheses**

- Bounded support; A Satake; locally constant finite projectivity is part of the result.

**Proof or construction**

1. Use proper support, CT filtration and flat-perverse recognition.
2. On each connected component of Gr_G, the shifted constant-term graded pieces of a Satake object are concentrated in degrees of the same parity. Hence the finite filtration spectral sequence degenerates. The graded cohomology modules are finite projective, so successive module extensions split locally and give finite-projective cohomology and exactness; this argument does not claim a canonical splitting.
3. For a morphism with a split total-cohomology kernel, the constant-term filtration identifies its perverse kernel as ULA and flat; apply the split-kernel clause of VI.7.10, and its analogous split-cokernel clause. For F(f)=0 the kernel is all F(A), hence split: conservation makes the kernel map an isomorphism, proving f=0 and faithfulness. Keep the filtration until GS3 tensor comparison.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`
- `GeometricSatakeAndFusion:GS1/constant-term-conservativity`
- `GeometricSatakeAndFusion:GS1/flat-perverse-objects`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `mathlib:Module.Projective`
- `AdicCoefficientsAndComparisons:L0/rational-constructible-coefficients`
- `mathlib:Module.Finite`
- `EtaleDualityAndPerverseSheaves:EDC.5`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.10–VI.7.11, pp. 222–223. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.7.10–VI.7.11: The filtered constant-term comparison proves finite projectivity and exact faithfulness.
- GS3 and GS4: The next part equips this functor with tensor compatibility and Tannakian reconstruction.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_cohomology` | characterisation | The fibre at A is the direct sum of all integer-degree cohomology modules; bounded support makes only finitely many degrees nonzero. |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_finite_projective` | structure | The total cohomology module is finite and projective over the coefficient ring. |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_faithful` | structure | FS VI.7.10’s split-kernel lifting together with conservativity proves faithfulness; do not infer faithfulness from conservativity alone in an exact category. |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_kernel` | universal-property | If ker F(f)→F(A) is a split inclusion, f has a Satake kernel and F carries its universal cone to the module kernel. |
| `TauCeti.Suggested.GeometricSatake.satakeFibre_cokernel` | universal-property | If F(B)→coker F(f) is a split projection, f has a Satake cokernel and F carries its universal cocone to the module cokernel. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.fibre_torus_rank_one` | computation | A torus skyscraper with one rank-one cohomology module has total cohomology R. |
| `TauCeti.Suggested.GeometricSatake.fibre_zero` | degenerate | If all cohomology modules vanish, total cohomology is the zero module. |
| `TauCeti.Suggested.GeometricSatake.fibre_existing_module` | compatibility | The fibre functor targets existing ModuleCat, and projectivity is the existing Module.Projective predicate. |
| `TauCeti.Suggested.GeometricSatake.fibre_unbounded_nonexample` | non-example | One copy of ℚ in every integer degree has infinite-dimensional direct sum: finite projectivity in each degree does not imply finite total cohomology without a boundedness hypothesis. |

**Acceptance**

- For a torus skyscraper at λ, F is Λ of rank one; a noncanonical filtration splitting is not advertised as canonical.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.
- Early coefficient scope and filtered-equivariance continuity: Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

**Prototype boundary:** S must be the actual Satake category and H the geometric cohomology functors. Finite support in degree and the CT filtration hypotheses are omitted from the finite-projectivity/faithfulness signatures. No canonical splitting or tensor identification is stated.

**Implementation status:** unchecked.

**Planet:** Satake cohomology functor.

### Verdier duality of Satake objects

`GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.satakeVerdierBiduality`.

**Owner:** `GeometricSatakeAndFusion:GS2:correspondences`. **Realises:** `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2`.

Relative Verdier duality preserves Satake, the biduality map A→D(D(A)) is an isomorphism, and F(D(A)) identifies with the Λ-linear dual of F(A). Normalized Levi constant terms CT_P[deg⟨2ρ_G−2ρ_M,−⟩] preserve Satake and are transitive for nested Levis.

**Hypotheses**

- ULA, flat perverse and bounded proper support; the normalization depends on the chosen parabolic.

**Proof or construction**

1. Use ULA dualizability and biduality from VS1.
2. Use reversed hyperbolic action, the shifted CT characterization and finite-projective module duality.
3. Use proper relative duality for F and compose parabolic correspondences for transitivity.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`
- `GeometricSatakeAndFusion:GS1/flat-perverse-objects`
- `VStackSheavesAndLisseCategories:VS1`
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `ReductiveGroupsPartII:RG2.1`
- `VStackSheavesAndLisseCategories:VS1/ula-dualizability-criterion`
- `VStackSheavesAndLisseCategories:VS1/hyperbolic-base-change-duality-and-ula`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.7.12–VI.7.13, pp. 223–224. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- On a one-leg smooth cell the dual of Λ[d] is Λ[d](d); the normalized Levi shift is zero for M=G.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** S must be Satake and dual the relative Verdier duality. Levi normalization and geometric coefficient hypotheses are omitted.

**Implementation status:** unchecked.

### Ambient Hecke convolution

`GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram` — construction.

**Declaration:** `TauCeti.Suggested.GeometricSatake.heckeConvolution`. **Library destination:** `TauCeti/Geometry/GeometricSatake/Convolution`, namespace `TauCeti.GeometricSatake`.

**Owner:** `GeometricSatakeAndFusion:GS2:correspondences`. **Realises:** `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2`.

The two-step Hecke stack has maps a:Hck×^{L⁺G}Hck→Hck×Hck (an L⁺G-torsor) and b to Hck (composition of modifications). On bounded support b is ind-proper with proper finite bounds. Define A⋆B=Rb_*a*(A⊠B), equivalently Rb_! for those bounds. Composition in the enhanced correspondence 2-category and Ind-extension give a coherent ambient monoidal structure with the unit supported on the trivial modification.

**Hypotheses**

- Use the stack quotient, not a naive product; derived external tensor over Λ; bounds required for pushforward. General correspondence coherence is supplied by EDS and VS0.

**Proof or construction**

1. Build the stack of three torsors and two punctured isomorphisms; multiplication composes them.
2. Trivialize the intermediate torsor only locally; descent gives a and proper bounded b via GS0.
3. Apply proper base change and projection formula in the enhanced correspondence calculus, then extend across filtered support bounds.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`
- `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `VStackSheavesAndLisseCategories:VS0/artin-v-stack-definition`
- `EnhancedDerivedSheaves:E5:presentability/universal-property-of-ind`
- `EnhancedDerivedSheaves:E3`
- `VStackSheavesAndLisseCategories:VS0`
- `DiamondSixOperations:S2/exchange-pasting-coherence`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8 opening, pp. 224–225. The stated construction or result, with the conventions and corrections specified in this node.

**Uses shaping the API**

- FS VI.8.1: ULA, perversity and flatness are proved for this ambient operation.
- FS VI.8.2 and HS1: Proper ULA kernels provide convolution adjoints and Hecke functors.

**API outline**

| Name | Role | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.heckeConvolution_obj` | characterisation | A⋆B is b-star of a-pullback of the derived external product of A and B, with b proper on the chosen bounds. |
| `TauCeti.Suggested.GeometricSatake.heckeConvolution_associator` | structure | The coherent correspondence calculus supplies the associator for convolution. |
| `TauCeti.Suggested.GeometricSatake.heckeConvolution_unit` | structure | The unit is the identity-modification kernel and its left and right unit maps are isomorphisms. |
| `TauCeti.Suggested.GeometricSatake.torusConvolutionLabels` | data | On a torus, convolution support is the Minkowski sum of the two finite coweight supports. |

**Unit tests**

| Name | Kind | Statement |
| --- | --- | --- |
| `TauCeti.Suggested.GeometricSatake.convolution_unit` | degenerate | Convolving with the identity kernel returns the other kernel. |
| `TauCeti.Suggested.GeometricSatake.convolution_torus_labels` | computation | For a torus, two skyscraper labels convolve to the skyscraper at their sum. |
| `TauCeti.Suggested.GeometricSatake.convolution_twisted_diagram` | compatibility | The typed object formula keeps both a-star descent and b-star pushforward; substituting the external product alone does not satisfy it. |

**Acceptance**

- The unit acts on either side; changing an intermediate trivialization does not change the resulting complex.

**Remaining obligations**

- Stack enhancement and coherent Ind convolution: VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The input functors must arise from the bounded torsor correspondence. Their properness, external derived tensor, support bounds, coherent correspondence composition, and unit-kernel identifications are omitted. The arbitrary input symbols are functors, not proposition placeholders.

**Implementation status:** unchecked.

**Planet:** Hecke convolution.

### Associativity and unit of convolution

`GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.convolutionPentagon`.

**Owner:** `GeometricSatakeAndFusion:GS2:correspondences`. **Realises:** `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2`.

Iterated composition supplies associator (A⋆B)⋆C≅A⋆(B⋆C), left/right unit isomorphisms, and the pentagon and triangle identities in the ambient bounded-support category, compatible with coefficient and base change when the six operations are defined.

**Hypotheses**

- Enhanced coherence, rather than equality of iterated objects; proper finite bounds and derived tensors.

**Proof or construction**

1. Use the common three-step Hecke stack and proper base-change/projection-formula isomorphisms.
2. Import coherent composition of correspondences from EDS rather than choosing unrelated associators.
3. The identity modification gives the diagonal kernel and the triangle identities.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`
- `EnhancedDerivedSheaves:E3`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `DiamondSixOperations:S2/exchange-pasting-coherence`
- `VStackSheavesAndLisseCategories:VS0`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8 opening, pp. 224–225. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- Four-fold composition must satisfy the pentagon; associativity alone is not the full monoidal API.

**Remaining obligations**

- Stack enhancement and coherent Ind convolution: VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** Only the standard monoidal pentagon is typed; the ambient convolution monoidal instance must be supplied by the enhanced correspondence calculus.

**Implementation status:** unchecked.

### Rational Witt convolution and semismallness

`GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.rationalConvolutionSemismall`.

**Owner:** `GeometricSatakeAndFusion:GS2:correspondences`. **Realises:** `GeometricSatakeAndFusion:GS2:correspondences`, `GeometricSatakeAndFusion:GS2`.

On the rational Witt special fibre, the n-fold unbounded convolution Grassmannian is identified with Gr^n by cumulative modifications, but a bounded convolution locus is a twisted product. The bounded multiplication map to Gr_{≤Σμ_i} is proper and stratified semismall: over the λ-stratum fibre dimension is ≤⟨ρ,Σμ_i−λ⟩. Hence twisted convolution of rational equivariant perverse sheaves is perverse.

**Hypotheses**

- k algebraically closed; dominant bounds; rational coefficients; no integral coefficient-flatness inferred from this statement.

**Proof or construction**

1. Use the lattice-chain Demazure and bounded proper map.
2. Apply Zhu 2.3’s semi-infinite intersection estimate and EDC.5 semismall pushforward.
3. Identify the torsor descent of the twisted external product with the special-fibre restriction of the ambient Hecke convolution.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`
- `GeometricSatakeAndFusion:GS1/rational-weight-concentration`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`
- `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`

**Sources**

- [Zhu17](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 2.1.2 and 2.2–2.4, pp. 431–432. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- For minuscule one-step bounds, twisted convolution still need not be the product of the two flag varieties.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** These dimensions must come from the bounded rational Witt convolution map and a target stratum. Properness and coefficient restrictions are omitted.

**Implementation status:** unchecked.

## Convolution closure and both duals

`GeometricSatakeAndFusion:GS2:Satake-closure`

Compose proper relative ULA kernels to preserve ULA. Prove the nonpositive aisle bound for all bounded nonpositive inputs through the elementary two-leg collision family, cell dévissage and normalized constant terms. Use duality for the opposite bound and every coefficient-module tensor for flatness. Proper-kernel adjunction then supplies sw*D(A) as a right dual, with evaluation and coevaluation satisfying both triangle identities; the switch produces the left dual. The one-leg restriction equivalence respects these bounded convolution diagrams. Acceptance is both rigidity structures and the compatible comparison, without symmetry or a fibre-functor tensor isomorphism.

### ULA preservation by convolution

`GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.convolutionULAKernelDual`.

**Owner:** `GeometricSatakeAndFusion:GS2:Satake-closure`. **Realises:** `GeometricSatakeAndFusion:GS2:Satake-closure`, `GeometricSatakeAndFusion:GS2`.

If A and B are ULA bounded Hecke complexes, A⋆B is ULA over the leg base.

**Hypotheses**

- Finite proper bounds; derived tensor; split and generic descended versions.

**Proof or construction**

1. Use the VS1 ULA criterion as adjointability of kernels, including the proper-relative IV.2.24 variant.
2. Compose adjointable kernels; Verdier duality commutes with bounded proper convolution.
3. Descend across the positive-loop quotient and compatible support bounds.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`
- `VStackSheavesAndLisseCategories:VS1/ula-for-artin-v-stacks`
- `VStackSheavesAndLisseCategories:VS1`
- `DiamondSixOperations:S3/upper-shriek`
- `DiamondSixOperations:S3/adjunction-calculus`
- `DiamondSixOperations:S3/verdier-duality-lower-shriek`
- `DiamondSixOperations:S2/lower-shriek`
- `DiamondSixOperations:S2/lower-shriek-base-change`
- `DiamondSixOperations:S2/projection-formula`
- `VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.1(i), p. 225. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- ULA preservation does not alone imply perversity.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** The algebraic core composes two individually right-dualizable proper relative ULA kernels. It does not assume the entire ambient category is rigid; the geometric ULA/kernel identification requires VS1.

**Implementation status:** unchecked.

### Nonpositive perverse convolution

`GeometricSatakeAndFusion:GS2:Satake-closure/convolution-perverse-nonpositive` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.convolutionPerverseNonpositive`.

**Owner:** `GeometricSatakeAndFusion:GS2:Satake-closure`. **Realises:** `GeometricSatakeAndFusion:GS2:Satake-closure`, `GeometricSatakeAndFusion:GS2`.

For any bounded Hecke complexes A,B in relative perverse degrees ≤0, A⋆B is perverse ≤0. First reduce by ordered collision-stratum excision and cell devissage to shifted cell constants with ULA factors. For those generators an elementary two-leg family is an external product away from the diagonal; locally constant perfect torus constant terms carry the nonpositive bound to the collision fibre. This is FS VI.8.1(ii), before VI.9 symmetric fusion.

**Hypotheses**

- Coefficient derived tensor and correct cell dimensions; this elementary family is distinct from the coherent symmetric fusion construction of VI.9.

**Proof or construction**

1. Use ordered legs, partial-diagonal excision and the defining cell inequalities to reduce the arbitrary bounded inputs to shifted cell constants. Their one-leg ULA property is supplied by VI.6.5.
2. Use the Künneth/external-product bound off the diagonal and VI.8.1(ii)’s elementary two-leg family. ULA convolution and constant-term local constancy carry the normalized bound across the collision.
3. Apply conservative shifted CT to return to G and reassemble by extensions. No GS3:fusion prerequisite is introduced.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula`
- `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`
- `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`
- `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness`
- `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`
- `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.1(ii), pp. 225–226. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- A collision is tested by summed cocharacters; the proof has a geometric family but not a symmetric monoidal Satake theorem.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** D/conv denote the full bounded-support Hecke derived category and its convolution, with the stated geometric perverse t-structure. The devissage, two-leg family and geometric identities are omitted. Inputs need not be ULA; only the reduced generators are ULA. GS3 fusion and ambient rigidity are not assumed.

**Implementation status:** unchecked.

### Closure of Satake under convolution

`GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.convolutionFlatPerverse`.

**Owner:** `GeometricSatakeAndFusion:GS2:Satake-closure`. **Realises:** `GeometricSatakeAndFusion:GS2:Satake-closure`, `GeometricSatakeAndFusion:GS2`.

Convolution of two Satake objects is Satake: it remains ULA, relative perverse and coefficient-flat. Derived tensors against arbitrary coefficient modules remain perverse, so the operation restricts to the flat subcategory.

**Hypotheses**

- All Satake conditions retained; coefficients need not be fields.

**Proof or construction**

1. ULA follows from VI.8.1(i). Apply the nonpositive result to A,B and their relative Verdier duals.
2. Bounded proper convolution commutes with relative duality, so the dual nonpositive bound yields the nonnegative bound.
3. Tensor by arbitrary coefficient modules and use the flat-perverse criterion to prove coefficient flatness.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula`
- `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-perverse-nonpositive`
- `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`
- `GeometricSatakeAndFusion:GS1/flat-perverse-objects`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.1(iii), pp. 225–226. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- Over Λ=Z/ℓ² a nonflat perverse object is not admitted as a factor.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** D/conv/tensor must be the ULA Hecke category, geometric convolution and derived coefficient tensors. Those supplier conditions are omitted.

**Implementation status:** unchecked.

**Planet:** Satake convolution closure.

### Duals of Satake objects

`GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity` — theorem.

**Declaration:** `TauCeti.Suggested.GeometricSatake.satakeRigid`.

**Owner:** `GeometricSatakeAndFusion:GS2:Satake-closure`. **Realises:** `GeometricSatakeAndFusion:GS2:Satake-closure`, `GeometricSatakeAndFusion:GS2`.

Every Satake object has both left and right duals for convolution. The right dual is sw*D(A); evaluation and coevaluation come from the adjunction of proper relative ULA kernels and satisfy the two triangle identities. Switching gives the other dual.

**Hypotheses**

- Proper bounded support; ULA; use both left and right rigid structures in the library. No symmetry or fibre-functor monoidality is assumed.

**Proof or construction**

1. Apply FS IV.2.24 to the bounded Hecke kernel, using the proper target.
2. Use VI.6.2 switch invariance and VI.7.12 Satake Verdier duality.
3. Restrict the resulting unit/counit to Satake using convolution closure and verify adjunction triangles; conclude VI.8.2.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`
- `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`
- `VStackSheavesAndLisseCategories:VS1`
- `mathlib:CategoryTheory.RigidCategory`
- `VStackSheavesAndLisseCategories:VS1/kernel-correspondence-category`
- `VStackSheavesAndLisseCategories:VS1/ula-relative-adjoints-and-calculus`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.8.2, p. 226; IV.2.24, pp. 125–126. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- The dual is sw*D(A), not D(A) without switching; it supplies GS3’s later fusion argument.

**Remaining obligations**

- Stack enhancement and coherent Ind convolution: VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.
- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** S must be the actual Satake category with its convolution structure. Both duals are asserted; the switch-pullback Verdier formula is in the document.

**Implementation status:** unchecked.

**Planet:** Satake rigidity.

### One-leg Satake equivalence

`GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison` — comparison.

**Declaration:** `TauCeti.Suggested.GeometricSatake.oneLegSatakeComparison`.

**Owner:** `GeometricSatakeAndFusion:GS2:Satake-closure`. **Realises:** `GeometricSatakeAndFusion:GS2:Satake-closure`, `GeometricSatakeAndFusion:GS2`.

The one-leg ULA restriction equivalence over Spd O_C restricts to equivalences of flat-perverse Satake categories on the generic and Witt special fibres. The functors commute with coefficient change, finite bounds and bounded convolution diagrams and carry the unit and the convolution duals to their corresponding objects.

**Hypotheses**

- Split integral model; chosen C and k̄; the comparison is not asserted for arbitrary multi-leg collision ULA categories.

**Proof or construction**

1. Use t-exact base change and the all-module tensor criterion on the ULA equivalence.
2. Compare the actual torsor convolution diagrams through the integral family and proper base change.
3. Compare switch, Verdier duality and the unit by their functorial constructions.

**Direct prerequisites**

- `GeometricSatakeAndFusion:GS1/integral-family-comparison`
- `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`
- `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`
- `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`
- `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`
- `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`
- `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`

**Sources**

- [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.6.7, VI.7.4–VI.7.8 and VI.8, pp. 214, 217–226. The stated construction or result, with the conventions and corrections specified in this node.

**Acceptance**

- The special-fibre comparison imports early L1/L3, without requiring VS3 lisse categories.

**Remaining obligations**

- Typed geometric signatures and unavailable prebuilt line module: The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Prototype boundary:** These are the indicated one-leg flat-perverse ULA categories; the base change geometry and diagram compatibility are omitted.

**Implementation status:** unchecked.

## Baseline declarations reused

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. These are limited algebraic and categorical substrates. Each stated interface is read in its source at the pin; it does not imply the missing geometric theorem.

All stages in this part remain missing as geometric Satake targets. The listed schemes, Witt vectors, root/Coxeter carriers and categorical infrastructure are partial substrates only.

- Do not plan ordinary Witt-vector arithmetic, abstract t-structures/hearts, generic sheaf sites or module flatness again.
- Do not infer geometric Grassmannians, positivity, integral reductive models, ULA categories, enhancements or both duals from a similarly named baseline carrier.
- No claim of formalization follows from this target-level planning pass.
- Import the current VS1 diamond-level hyperbolic and relative-ULA calculus nodes directly; request only their bounded Artin Hecke-chart transport and the missing filtered-group ordinary-cohomology continuity.

| Declaration | Module at the pin | Interface reused |
| --- | --- | --- |
| `mathlib:WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | The type of p-typical Witt vectors, indexed by a natural p. Its ring laws and perfect-ring properties are reused; ramified Witt coefficient comparison is RF0’s node, not a new definition here. |
| `mathlib:PerfectRing` | `Mathlib/FieldTheory/Perfect.lean` | PerfectRing R p asserts bijectivity of the p-th power map on a type with powers; it does not itself assert that p is prime or that R has characteristic p. The Witt geometric applications separately require a commutative ring, Fact p.Prime and CharP R p, giving a perfect F_p-algebra. This is the algebraic hypothesis carrier, not a representability result. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | The ordinary scheme carrier and category. Being a perfection of a projective model is a missing target; the existence of Scheme does not establish BS representability. |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | Properness of a morphism of schemes. The representing object is a proper perfectly finitely presented scheme, and the fibral descent criterion is for proper maps. |
| `mathlib:ValuationRing` | `Mathlib/RingTheory/Valuation/ValuationRing.lean` | Valuation rings. The proof of the fibral descent criterion reduces to a base whose connected components are spectra of valuation rings. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | Invertible sheaves on an ordinary scheme, including the Witt-bound and Demazure determinant lines after those schemes are constructed. This carrier supplies neither ampleness nor the adic Cartier-divisor line I_S^m/I_S^{m+1}; the latter belongs to the RF2/RF4 geometric interfaces. |
| `mathlib:CoxeterSystem` | `Mathlib/GroupTheory/Coxeter/Basic.lean` | Abstract Coxeter-system combinatorics only. Affine root data, Cartan/Iwasawa decomposition and parahoric geometry require RG2.4. |
| `tauceti:TauCeti.TitsSystem.bruhatCell` | `TauCeti/GroupTheory/TitsSystem/Bruhat/Basic.lean` | Bruhat cells of a Tits system. Tau Ceti already has the Bruhat decomposition, which is the combinatorial shadow of the Schubert stratification this layer builds geometrically. |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | The abstract paired roots/coroots and their module dualities, not a built split reductive group, Lie-weight decomposition or affine Cartan theorem. |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean` | Reductive affine group schemes over a FIELD k, using [Field k]. This does not provide an integral O_E-model or parahoric group scheme; those are requested from RG2.3. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` | t-structures on a triangulated category, already in the pinned library with IsLE and IsGE. The relative perverse t-structure of GS1 is one of these, so the abstract notion is cited and only its normalisation is planned. |
| `mathlib:CategoryTheory.Triangulated.TStructure.Heart` | `Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean` | The Heart typeclass identifies a heart with a full subcategory of a pretriangulated category; TStructure.heart is the underlying object property. No generic abelian-heart theorem is claimed. |
| `mathlib:CategoryTheory.Pretriangulated` | `Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean` | Pretriangulated categories, the level at which the t-structure and the recollement of the Schubert stratification are stated. |
| `mathlib:DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean` | The Verdier-localization carrier for the derived category of an abelian category, not the stable enhanced sheaf categories or six-operation coherence; EDS owns those extensions. |
| `mathlib:CategoryTheory.Sheaf` | `Mathlib/CategoryTheory/Sites/Sheaf.lean` | Sheaves valued in a category on a Grothendieck site; the diamond/v-site topology and geometric representability are not provided by this carrier. |
| `mathlib:CategoryTheory.GrothendieckTopology` | `Mathlib/CategoryTheory/Sites/Grothendieck.lean` | Abstract Grothendieck topologies; actual v/h/étale topologies and their descent properties are supplier work. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | Monoidal categories, the structure convolution puts on the bounded sheaf category and on the Satake category. |
| `mathlib:CategoryTheory.LeftRigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Left duals only. The conclusion that all Satake objects have both duals uses the separate RigidCategory carrier. |
| `mathlib:CategoryTheory.Equivalence` | `Mathlib/CategoryTheory/Equivalence.lean` | Equivalences of categories, the form of the special-fibre comparison of the ULA categories over Spd O_C, Spd C and Spd k. |
| `mathlib:CategoryTheory.Comma` | `Mathlib/CategoryTheory/Comma/Basic.lean` | Comma categories, the pinned form of the slice and correspondence categories over which the convolution 2-category is indexed. |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness. Flat perversity is half the definition of the Satake category, and it is what excludes the Tor obstruction to t-exactness of convolution. |
| `mathlib:Module.Projective` | `Mathlib/Algebra/Module/Projective.lean` | Projective modules: finite projective terms of a strict perfect complex, flat-perverse torus fibres in degree zero, total Satake cohomology and lattice graded pieces. ULA alone requires perfect stalk complexes and does not make each cohomology module projective. |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. The lattice computation in the GL_n case of the open-cell stabilizer chooses a compatible basis, which is a freeness statement after localisation. |
| `mathlib:CategoryTheory.RigidCategory` | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean` | Both left and right rigid structures. LeftRigidCategory alone cannot state VI.8.2. |
| `mathlib:CategoryTheory.ActionCategory` | `Mathlib/CategoryTheory/Action.lean` | The category of elements of a monoid action, with Groupoid for group actions. This is the local quotient presentation, not stackification. |
| `mathlib:Action` | `Mathlib/CategoryTheory/Action/Basic.lean` | Objects with a monoid homomorphism into their endomorphisms; morphisms intertwine the action. Only the discrete equivariant-object core. |
| `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean` | Full subcategories with the existing fully faithful inclusion; their object property must be stated mathematically. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules; paired with Module.Projective for lattice and fibre-functor finiteness. |
| `mathlib:Module.Flat.iff_lTensor_preserves_injective_linearMapₛ` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness characterized by injectivity preservation of linear maps after tensor; the smallness universe condition is part of the source statement. |
| `mathlib:PadicInt` | `Mathlib/NumberTheory/Padics/PadicIntegers.lean` | The subtype of p-adic numbers with norm ≤1, with the existing commutative ring structure for prime p. Its ℤ_p-algebra structure explicitly states the coefficient hypothesis of the uniform ℓ-power torsion bound. |

## Supplier requests

Each request states the additional contract its existing owner must supply. A stage reference is not a claim that the interface has already been implemented.

### CrystallineCohomology:CR.1

Evaluate a locally free crystal on perfect Witt thickenings and obtain its finite projective values and quotient mod p, functorially in perfect bases; the sublattice Grassmannian construction uses this evaluation (Zhu 1.14).

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### CrystallineCohomology:CR.7

The Dieudonné-crystal and Hodge-determinant family interface for Zhu’s canonical Demazure models, compatible with R07’s conventions and the ramified coefficient summands. It does not reprove the classification in R07.2.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### EnhancedDerivedSheaves:E3

Enhanced coherent composition of pull–push correspondences with external tensor, higher associativity/unit maps and Ind extension, compatible with DSO exchange/pasting and VS0 Artin descent. A homotopy-category pentagon statement alone does not give the needed coherent ambient convolution.

**Consumers:** `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`.

### EnhancedDerivedSheaves:E5:presentability

Lurie HA 1.4.4.11 extension of a generated t-structure to the Ind category, with the small stable generators, closure and accessibility hypotheses checked for the relative perverse category. Existing universal-property-of-ind alone does not prove this extension.

**Consumers:** `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Dieudonné realization for the specified isogeny chains over perfect residue fields, with covariance, distinguished τ₀-summand, heights and Hodge filtration fixed as in Zhu B.7–B.8. General family crystal theory is requested separately.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6

P-divisible-group deformation and Hodge-line comparison on the smooth projective canonical Demazure family in Zhu B.8–B.9; prove the scheme-map comparison stated only as an appendix sketch.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`.

### KTheoryLowDegrees:Z.3

Determinant of finite projective graded quotients, multiplicativity for short exact sequences and its Picard tensor comparison. This is the elementary determinant interface only; GS projectivity uses the geometric BS §6/§8 route, without BS §5’s K-theoretic determinant construction.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization`.

### PadicHodgeTheory:P8:local-rational

Corrected relative O𝔅⁺_dR period sheaf, filtered integrable universal connection and Griffiths transversality on minuscule flag varieties, with [Sch13c, 7.9] and its corrigendum conventions, yielding the CS 3.4.5 surjectivity construction.

**Consumers:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`.

### ReductiveGroupsPartII:RG2.3

Smooth affine integral/parahoric/Iwahori group models; faithful representations with quasi-affine quotient; compatible Greenberg jets, dilatations, finite-level torsor lifting and Weil-restriction comparisons. The field-only pinned reductive-group category is insufficient. Sources: Zhu 1.1/1.20; SW 19.4, 21.1–21.2; BS 9.2–9.6.

**Consumers:** `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`.

### ReductiveGroupsPartII:RG2.4

Affine Weyl and extended Weyl data, length/Bruhat order, admissible sets, Cartan and Iwasawa decompositions, rank-one ordinary/Demazure convolution, Kottwitz inertia-component labels, and componentwise adjoint flag comparison with p prime to |π₁(G_ad)| when required by the corrected GHN theorem. Sources: Zhu 1.4, He 5.6 and its GH10/GHN imports. These strengthen this stage’s existing direction.

**Consumers:** `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`.

### ReductiveGroupsPartII:RG2.1

Import absolute Lie/adjoint and root/parabolic theory from the existing ReductiveGroups layers 2 and 7. Extend RG2.1 only by its relative/integral cocharacter-weight compatibility: Lie stabilizer weights ≤m, the opposite-parabolic convention, minuscule weights {−1,0,1}, and the dimension sum ⟨2ρ,μ⟩ after splitting. Compare CS and FS signs. RG2.5 constructs integral dual groups and supplies none of these geometric computations; do not re-plan the existing absolute theory.

**Consumers:** `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`.

### RelativeFarguesFontaine:RF4:G-torsors

Beauville–Laszlo gluing and effective étale/v-descent for G-torsors on the completed Cartier divisor. RF2/v-descent-of-bundles-on-the-divisor supplies descent on each finite thickening only: additionally prove algebraization of compatible finite-projective modules over the complete quotient system, with uniform rank, complete continuous ring maps and effective descended transition data, before transferring via BG0 Tannakian torsors. Include Anschütz’s punctured A_inf extension/triviality theorem in SW 21.2.2 with its group-model hypotheses. Import RF2’s rings and finite-thickening descent; do not construct them again.

**Consumers:** `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`.

### RelativeFarguesFontaine:RF4:vector-bundles

The uniform Banach algebra finite-projectivity criterion [KL15, 2.8.4] used in CS 3.4.3–3.4.6: a finitely presented module with the required locally constant fibre rank is finite projective, and compatible sublattices are detected on geometric field points. Include the bounded rank-one submodule fibre-detection step in FS VI.3.2: for finitely generated open bounded B⁺l⊂L⊂B on an affinoid perfectoid base, equal geometric lattice fibres on a neighborhood imply B⁺l=L there. Do not assume L finite projective before proving that conclusion.

**Consumers:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity`.

### SchemeAndStackFoundations:SF.0

Pfp perfect schemes/algebraic spaces and compatible finite-type models up to Frobenius, dimensions, base change and étale-topos invariance (BS 3; Zhu A.1–A.17), plus finite Greenberg realization and perfected Grassmann/Quot bundles. Coordinate-ring perfection is the DIRECT Frobenius colimit, not Mathlib’s inverse-limit Perfection.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`.

### SchemeAndStackFoundations:SF.1

Effective quotients of separated pfp perfect spaces by smooth perfect affine torsors (Zhu A.29–A.31), normalized finite-jet quotients, and finite pushouts/pinching of a finite union of lower Schubert bounds along closed representable intersections BEFORE applying Keel. This repairs PAPER-BHATT-SCHOLZE-17/E39’s boundary representability gap.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`.

### SchemeAndStackFoundations:SF.3

Proper pfp perfect connected-fibre full faithfulness/effective vector-bundle descent (BS 6.1, 6.8, 6.13), including the weaker connected-fibre criterion and compatibility with geometric base change; relative Grassmann structure cohomology, determinant/Picard tensor pullbacks and fibre-trivial line descent.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`.

### SchemeAndStackFoundations:SF.4

Finite/formal Witt vector-bundle v-descent and acyclicity (BS 4.1, 4.4, 4.6), with repaired blowup reduction; integral local-model existence and functoriality identifying the finite admissible Schubert union with the reduced special fibre (GLX 3.3–3.4), and compatible bounded pfp fibre-product models. Local models are an extension in SF’s moduli direction, not an ADLV or shtuka replanning.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`.

### SchemeAndStackFoundations:SF.5

General nef/big/ample/semiample line bundles, exceptional locus, Kodaira decomposition, Keel’s characteristic-p criterion and union/exceptional-locus lemmas, Frobenius-power extension/descent of sections, Stein contraction, Serre vanishing and section growth on perfections. GS keeps only the BS 8.9–8.11 application; all general positivity has this single owner.

**Consumers:** `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`.

### VStackSheavesAndLisseCategories:VS0

Enhanced six operations and smooth equivariant descent for Artin v-stacks, including nonrepresentable quotient-stack maps, finite congruence charts and coherent proper-kernel correspondences. DSO’s eligible representable operations alone do not cover [*/L⁺G].

**Consumers:** `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`.

### VStackSheavesAndLisseCategories:VS1

Import the existing VS1 hyperbolic-localization, braden-theorem, hyperbolic-base-change-duality-and-ula, kernel-correspondence-category, perfect-local-systems, ula-dualizability-criterion and ula-relative-adjoints-and-calculus nodes for their eligible representable-diamond scope; in particular IV.2.24 and IV.2.28 are already planned there. Supply their compatible application and descent through bounded finite-dimensional Artin Hecke quotient charts, retaining properness, finite relative dimension, monodromicity and the relevant coefficient hypotheses. Coordinate coherent bounded ind-correspondences with the existing EDS request and derived adic passage with L0. For FS VI.4.1 additionally construct complete congruence filtrations, filtered spatial ball-subgroup presentations, finite-quotient actions and inverse-limit ordinary-cohomology continuity, yielding RΓ(S,A)≃RΓ(S×H,A). This filtered-group extension is not supplied by the listed diamond-level nodes, by cohomological smoothness, by unshifted compact-support acyclicity, or by profinite prime-to-ℓ averaging.

**Consumers:** `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`, `GeometricSatakeAndFusion:GS1/prounipotent-equivariance`.

### EtaleDualityAndPerverseSheaves:EDC.5

Export the early scheme perverse/recollement construction for the actual torsion and derived-complete adic coefficient rings of FS, with coefficient reduction/base change, and the integral O_ℓ torsion-pair conventions when used. Existing perverse-t-structure supplies finite fields, self-injective O/π^m and rational E only. For arbitrary Λ, use the geometric cell/field-devissage and 2dim compact-support proof of FS VI.7.4 rather than silently enlarging BBD’s coefficient hypotheses. Keep Verdier duality restricted to the appropriate flat/finite-Tor objects; no early EDC.7 input.

**Consumers:** `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`, `GeometricSatakeAndFusion:GS1/flat-perverse-objects`, `GeometricSatakeAndFusion:GS1/standard-costandard-objects`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`.

### RelativeFarguesFontaine:RF2:untilts

Extend the generic geometric-divisor-complete-dvr target to a geometric marked O_E-untilt, including the special-characteristic leg: the positive completed Cartier ring is a complete DVR, its residue field is the untilt field and a primitive degree-one equation is a uniformizer. For finitely many ordered legs identify the geometric completed ring with the product over distinct supports, carrying actual fibre maps from the affinoid base; repeated legs retain their multiplicities in ξ and do not duplicate product factors. Include the Cartier-residue zero locus and restriction/division by ξ_i used in FS VI.3.3, with finite or infinite module lengths and their additivity. This is an extension of the actual RF2 integral Cartier completion and generic DVR contracts, not a second GS construction of period rings.

**Consumers:** `GeometricSatakeAndFusion:GS1/length-semicontinuity`, `GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops`, `GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor`.

### RelativeFarguesFontaine:RF2:integral-divisors

For any perfectoid S→Div^d_𝒴, construct the canonical support map |D_S|→|S| (via D_S^diamond⊂𝒴_S^diamond≃S×Spd O_E) and prove it is closed, compatibly with perfectoid base change. Thus for every open adic D′⊂D_S the locus of T→S on which all of D_T lands in D′ is the open complement of the image of |D_S|\|D′|. This is the geometric supplier used in FS VI.1.13; product Cartier equations and affineness alone do not state it.

**Consumers:** `GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor`.

## Gaps and exact refinement work

### Boundary representability before Keel

BS 8.3’s induction calls the lower-bound union a pfp proper perfect algebraic space before proving it. The SF1 finite-pushout/model request must construct closed intersections and effective pinching in the chosen model, then prove it is the image v-sheaf. This proof must precede the positivity application.

**Applies to:** `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`.

### Zhu B.11 corrected truncated-Witt interface

The rank-two adjugate calculation proves corrected right-factor integrality and unit determinant after choosing Witt lifts: adj(X* A)=A* X, det(Ã)=p² and det(X̃)=p²u with u a unit. The truncated equation is det(X)=p²[λ]⁻¹; only the residue of u is forced to equal λ⁻¹. What remains is the typed truncated-Witt interface, existence of a factor after the chosen lift, and compatibility with the jet-torsor quotient. The factor need not be unique or lift-independent (already A=3·Id over W₃(F₃) has a nontrivial stabilizer); uniqueness concerns the cone representative A. Retain the corrected order A⁻¹X.

**Applies to:** `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`.

### Sketch-only canonical determinant and crystal comparison

Zhu B.1, B.9 and the closing B.3 paragraph are announced without proofs. The R07/CR7 interfaces and the map between the normalized jet model and the p-divisible chain model must prove the Hodge-line determinant comparison; no conjectural normal Cohen–Macaulay property is assumed.

**Applies to:** `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`.

### Rational MV trace normalization on perfect models

Fix a finite model and its Frobenius power for fundamental classes; Zhu A.3.3’s model-independent scalar trace omits p-power degree. Require nonempty geometric intersections, geometrically irreducible components for a scalar trace, and the spreading step in the finite-field point-count route. The integral CT/perverse criterion uses FS instead of a rational MV basis.

**Applies to:** `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`.

### Quasi-minuscule infinity contribution and minimal generation

For the quasi-minuscule P¹ resolution retain the section-at-infinity term absent from Zhu (2.2.13); in SL₃ the zero-weight multiplicity is two. Check the corrected parahoric in type A_n, the finite U-jet torsor/twisted external product in 2.17 and 2.16’s minimal-generation argument with the RG/EDC interfaces.

**Applies to:** `GeometricSatakeAndFusion:GS1/rational-weight-concentration`.

### Stack enhancement and coherent Ind convolution

VS0/VS1 must supply Artin quotient descent and proper-relative ULA adjointability at the enhanced level; EDS3/5 supplies coherent correspondence and Ind t-structure extension. Verify common bounded correspondences, unit/counit triangles and support filtrations; choosing binary natural isomorphisms does not close this obligation.

**Applies to:** `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`.

### Typed geometric signatures and unavailable prebuilt line module

The suggested file retains the algebraic/category cores and records omitted supplier-dependent geometric conditions in prototypeNotes. The full file was not compiled: no existing build has both recorded pins. In this independent review, a Mathlib-only projection of this revision elaborated at Mathlib 082e2d3 using lean-check with only placeholder-proof warnings. It removed the Tau Ceti import and the geometric-determinant-line and h-descent-and-fibral-criterion node blocks; it validates neither those blocks nor the full file. Once supplier carriers and the pinned build are available, state the exact geometric interfaces, including divisor sites, dimensions, properness, ULA, perfect models and locally constant coefficients, and elaborate the complete file. The three geometric lemmas reserve their declaration names through precise omissions until those supplier interfaces exist.

**Applies to:** `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncated-positive-loops`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/truncation-of-the-loop-action`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags`, `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/perfect-model-and-etale-comparison`, `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles`, `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space`, `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor`, `GeometricSatakeAndFusion:GS0:loop-geometry/generic-galois-descent`, `GeometricSatakeAndFusion:GS0:loop-geometry/grassmannian`, `GeometricSatakeAndFusion:GS0:loop-geometry/local-hecke-stack`, `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/ordered-leg-base-change`, `GeometricSatakeAndFusion:GS0:loop-geometry/schubert-bounds-and-properness`, `GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops`, `GeometricSatakeAndFusion:GS1/ULA-sheaves-on-the-hecke-stack`, `GeometricSatakeAndFusion:GS1/constant-term-conservativity`, `GeometricSatakeAndFusion:GS1/flat-perverse-objects`, `GeometricSatakeAndFusion:GS1/integral-family-comparison`, `GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity`, `GeometricSatakeAndFusion:GS1/length-semicontinuity`, `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`, `GeometricSatakeAndFusion:GS1/prounipotent-equivariance`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/standard-costandard-objects`, `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound`, `GeometricSatakeAndFusion:GS1/ula-constant-term-criterion`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-perverse-nonpositive`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-preserves-satake-and-dualizability`, `GeometricSatakeAndFusion:GS2:Satake-closure/convolution-ula`, `GeometricSatakeAndFusion:GS2:Satake-closure/one-leg-satake-comparison`, `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-associativity-and-unit`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution`, `GeometricSatakeAndFusion:GS2:correspondences/satake-category-and-fibre-functor`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `GeometricSatakeAndFusion:GS2:correspondences/satake-verdier-duality`.

### Bounded affine-flag dimension and adjoint transfer

The He/GH10 imported fibre argument must be proved on compatible bounded pfp models; the unbounded ind-space need not have finitely many components. RG2.4 supplies rank-one induction and corrected componentwise adjoint comparison; SF4 supplies local-model functoriality for GLX admissible containment. These are precise supplier obligations, not a whole affine-flag isomorphism.

**Applies to:** `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags`.

### Early coefficient scope and filtered-equivariance continuity

Prove the new EDC5 coefficient-change/adic and torsion-pair interface under its exact hypotheses. Separately supply VS1’s spatial ball-subgroup presentations and ordinary-cohomology inverse-limit continuity for FS VI.4.1. Neither arbitrary integral duality from field BBD nor unshifted compact-support acyclicity closes these steps. These are named supplier refinements, before rational decomposition or GS3 fusion.

**Applies to:** `GeometricSatakeAndFusion:GS1/relative-perverse-t-structure`, `GeometricSatakeAndFusion:GS1/perverse-descent-and-shifted-ct`, `GeometricSatakeAndFusion:GS1/flat-perverse-objects`, `GeometricSatakeAndFusion:GS1/standard-costandard-objects`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor`, `GeometricSatakeAndFusion:GS1/prounipotent-equivariance`.

### Étale-over-divisor geometric carriers and support-map input

FS VI.1.13 is now a distinct named lemma target with its exact universal property. Its §13 Lean signature is omitted until the actual perfectoid/adic category, divisor pullback and separated-étale representability carriers exist. RF2 must additionally supply the integral geometric-support description (including special O_E-untilts) and the closed support map |D_S|→|S|; existing generic E-untilt complete-DVR data are insufficient for that integral scope. This is an interface gap, not a claim that the source lemma is unproved.

**Applies to:** `GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor`, `GeometricSatakeAndFusion:GS0:loop-geometry/smooth-scheme-loops`.

## Source corrections and their recorded verification

The source ledger contains 23 findings. E1–E22 retain their identities, mathematical content, provenance, exact source/version scope and historical independent reviews. Their source-assertion descriptions are presented in our own words under the updated PROTOCOL§5/§18. The additional revision finding E23 awaits independent review. A gap or omitted proof argument is recorded as such; it is not automatically a counterexample to the source theorem.

### GeometricSatakeAndFusion/E1 — misprint

**Locator:** p412, coweight order

**Source assertion:** The source uses positive roots to specify dominance among coweights.

**Correction:** Use positive coroots in the coweight dominance order.

**Reason or counterexample:** The order is on X_*(T); roots belong to the dual character space. (cc-442dc5) Reclassified to affect nothing: a misprint whose intended form, given in the correction, is fixed by the types and conventions of the surrounding argument; the argument goes through with it.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E2. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E2.

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Earlier effect assessment:** the proof

**Extraction provenance:** PAPER-ZHU-17/E2

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: Coweight dominance is an order in X_*(T), hence positive coroots; printed p.412 uses roots.; by: REV-GeometricSatakeAndFusion--GS0

**Current independent review:** confirmed — At Zhu p.412 the positivity cone for coweights is generated by positive coroots. Roots lie in the wrong lattice; the surrounding pairing fixes the intended correction. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E2 — misprint

**Locator:** p. 424, proof of Lemma 1.17, definition of X(R′)

**Source assertion:** Inv(𝓕_i ⇢ 𝓕_{i+1}) = μ_i^*

**Correction:** Inv(𝓕_i ⇢ 𝓕_{i−1}) = μ_{N+1−i}^* for i = 1, …, N, with maps oriented 𝓕_N ⇢ ⋯ ⇢ 𝓕_0 as in the quasi-isogeny 𝓕_N ⇢ 𝓕_0 used next. Equivalently, keeping the displayed orientation, Inv(𝓕_{i−1} ⇢ 𝓕_i) = μ_{N+1−i}.

**Reason or counterexample:** (Gr_{μ•})_R consists of chains 𝓔 = 𝓔_N ⇢ 𝓔_{N−1} ⇢ ⋯ ⇢ 𝓔_0 with Inv(β_i) = μ_i. Building it from 𝓕_0 = 𝓔 gives 𝓕_i = 𝓔_{N−i}. Then 𝓕_{i−1} ⇢ 𝓕_i is β_{N+1−i}, of position μ_{N+1−i}, and its inverse has position μ_{N+1−i}^*. The printed condition indexes by μ_i (μ_0 is undefined for i = 0, and the order is not reversed) and attaches the star to the displayed direction 𝓕_i ⇢ 𝓕_{i+1}. That is wrong even when all μ_i are equal: for μ_i = ω_1 the displayed map has position ω_1, not ω_1^*. The rest of the argument (the quasi-isogeny 𝓕_N ⇢ 𝓕_0 = 𝓔 ⇢ 𝓔_0 and the closed locus X_{ω_0}) goes through with the correction. The erroneous chain condition is recorded above as a mathematical formula. The same text is in v2 and v3.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E8. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E8.

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Earlier effect assessment:** the proof

**Extraction provenance:** PAPER-ZHU-17/E8

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: The displayed chain orientation and reversed sequence require F_i→F_{i−1} with μ*_{N+1−i}; checked the p.424 construction.; by: REV-GeometricSatakeAndFusion--GS0

**Current independent review:** confirmed — Reversing the lattice chain on Zhu p.424 reverses the order of its graded quotients. Dualizing therefore reads μ_{N+1−i}, rather than μ_i. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E3 — misprint

**Locator:** p488, determinant unit inB.11

**Source assertion:** p²[λ]

**Correction:** Use p²[λ]⁻¹.

**Reason or counterexample:** Solving the defining equation for detX requires the inverse; for p=5 and unit2, 25·2 and 25·3 differ modulo125. (cc-442dc5) Reclassified to affect nothing: a misprint whose intended form, given in the correction, is fixed by the types and conventions of the surrounding argument; the argument goes through with it.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E32. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E32.

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Earlier effect assessment:** the proof

**Extraction provenance:** PAPER-ZHU-17/E32

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: The determinant equation forces det X=p²[λ]⁻¹, agreeing with the corrected rank-two factorization.; by: REV-GeometricSatakeAndFusion--GS0

**Current independent review:** confirmed — In the truncated Witt chart on Zhu p.488, det(A)=p² and det(X)=p²[λ]⁻¹. The right factor must have unit determinant reducing to λ⁻¹; a full lift need not equal the Teichmüller unit exactly. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E4 — misprint

**Locator:** p. 488, proof of the claim in Lemma B.11 (display defining g̃)

**Source assertion:** g̃ := X̃Ã^{−1} = p^{−2}X̃Ã^*

**Correction:** g̃ := Ã^{−1}X̃ = p^{−2}Ã^*X̃ ∈ LGL_2. Then X̃ = Ãg̃, and g = (g̃ mod p³) satisfies X = Ag.

**Reason or counterexample:** Confirmed; the correction should fix both expressions in the display. With the printed order, X̃ = g̃Ã, which contradicts the conclusion X = Ag. The existing counterexample works: A = (p −1; 0 p) is of cone form (x = z = 0, y = 1), g = (1 0; 1 1), X = Ag = (p−1 −1; p p). X lies in W̃ (a_1d_1 − b_1c_1 = 1), and X A^{−1} has entry −1/p². With the corrected order, integrality follows from (B.3.2): X^*A ≡ 0 mod p² gives A^*X = adj(X^*A) ≡ 0 mod p² (for 2×2 matrices adj(adj X) = X), so p^{−2}Ã^*X̃ is integral. Its determinant is a unit.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E33. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E33.

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Earlier effect assessment:** the proof

**Extraction provenance:** PAPER-ZHU-17/E33

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: For X=Ag the right factor is A⁻¹X. The 2×2 adjugate of X* A proves integrality in the corrected order and its determinant is a unit.; by: REV-GeometricSatakeAndFusion--GS0

**Current independent review:** confirmed — The chart equation on Zhu p.488 is X=Ag, hence g=A⁻¹X. For 2×2 matrices the adjugate of X* A proves integrality in that order; the printed opposite order need not be integral. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E5 — gap

**Locator:** p. 482, Appendix B opening paragraph (not p. 484)

**Source assertion:** The opening of the appendix announces that proofs will be omitted for many assertions it contains.

**Correction:** Stated without proof: Prop. B.1, Lemma B.9, and the final paragraph of B.3 (Conjecture I for GL_2, N = 2). Prop. B.2 has a one-sentence justification. It also needs \tilde L_det to be trivial on the fibres of π, which follows from base-point-freeness and the second part of Prop. B.1. Lemma B.4, Lemma B.7 and Prop. B.8 provide sketches whose further details are assigned to the reader. Also unproved: the claims on p. 485 (that M_{N,h} is an irreducible component of the RZ-type space) and p. 486 (\mathring M_{N,h} ≃ Gr′_N), and the claim in Remark B.6. Lemmas B.10 and B.11 are proved in full on pp. 487–488, apart from the misprints E32 and E33; the appeal to Lemma 1.10 for surjectivity goes through. Bhatt–Scholze prove Conjectures I–II. The main results of §§1–3 do not depend on Appendix B.

**Reason or counterexample:** The appendix-wide notice about omitted proofs occurs on p. 482. The existing correction wrongly lists B.10 and B.11 as unproved. Specific points: Prop. B.2 proposes to construct L_det by pushing forward \tilde L_det; this also requires \tilde L_det to be trivial on the fibres of π. That follows from base-point-freeness together with Prop. B.1's second part (degree 0 on fibre curves) and π_*O = O (Lemma A.21). The hint for B.4 also needs the fibres of V_{N,h} → \overline{Gr}_N to have constant dimension; this holds, since the stabilizer {γ: Aγ = A} has dimension nN everywhere. The main theorems do not depend on Appendix B. Remarks 1.15 and 1.16 point to B.3 and B.8, but they are remarks.

**Effect:** a stated result

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E34. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E34.

**Extraction provenance:** PAPER-ZHU-17/E34

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: Appendix opening is p.482; B.1/B.9 are announced and several other results sketched, whereas B.10/B.11 have proofs. The qualified correction accurately separates these.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — Zhu’s Appendix B opening on p.482 expressly leaves arguments sketch-only. The B.1 and B.7–B.9 interfaces require proof requests, whereas the later B.10–B.11 computations are actually supplied. This is a qualified proof-status record, not a counterexample to all appendix results. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E6 — misprint

**Locator:** p. 425, proof of Lemma 1.18 (positive dimension of fibres); also p. 425, proof of Lemma 1.18 (last paragraph)

**Source assertion:** The proof says that some index i satisfies dim_k(Λ_λ ∩ p^iΛ_0/Λ_λ ∩ p^{i+1}Λ_0) > 1 in its argument about fibres.

**Correction:** Replace ∩ by +: for λ < Nω_1, dim_k((Λ_λ + p^iΛ_0)/(Λ_λ + p^{i+1}Λ_0)) > 1 for some i (e.g. i = 0). Every hyperplane 𝓔_1 ⊂ Λ_0 containing Λ_λ + pΛ_0 extends to a point of π^{−1}(p^λ), so the fibre surjects onto ℙ^{d−1,p^{−∞}} with d = #{j : l_j ≥ 1} ≥ 2. Also: Replace ∩ by + in both places: dim_k (Λ_λ + p^iΛ_0)/(Λ_λ + p^{i+1}Λ_0) > 1 (this holds at i = 0 when λ < Nω_1), and lines L in this space give the lattices Λ_λ + p^{i+1}Λ_0 + L̃, which extend to full chains. Equivalently, dim (p^{-1}Λ_λ ∩ Λ_0)/Λ_λ = #{j : m_j ≥ 1} ≥ 2, the fibre of π_2 from the preceding paragraph.

**Reason or counterexample:** For λ = (l_1 ≥ … ≥ l_n ≥ 0) with Σ l_j = N, Λ_λ ⊂ Λ_0 and Λ_λ ∩ p^iΛ_0 = ⟨p^{max(l_j,i)}e_j⟩, so the printed dimension is #{j : l_j ≤ i}. For n ≥ 2 this exceeds 1 for every λ once i ≥ l_1, including λ = Nω_1, whose fibre is a single point by the first part of the lemma. Moreover these subquotients lie inside Λ_λ, while points of π^{−1}(p^λ) are chains of lattices between Λ_λ and Λ_0, so lines in them do not give points of the fibre. With + the dimension is #{j : l_j ≥ i+1}, which for i = 0 is at least 2 exactly when l_2 ≥ 1, i.e. λ ≠ Nω_1. The intended argument is then correct. The same text is in v2 (with 𝓔_λ) and v3. It is classified as a misprint (∩ for +); a verifier could argue for 'error', since the step fails as printed.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E44. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E44.

**Extraction provenance:** PAPER-ZHU-17/E44

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: The displayed intersection quotients sit inside the final lattice and cannot parametrize the chain. The sum quotients have dimension #{j:l_j≥i+1}, giving the needed lower-stratum fibre.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — On Zhu p.425 the intersection quotients lie inside the final lattice and cannot parametrize enlargements in the chain fibre. For Λ_λ=⟨p^{l_j}e_j⟩ their dimensions count l_j≤i, which eventually exceeds one even at λ=Nω₁ with point fibre. Replacing both lattice intersections by sums gives dimension #{j:l_j≥i+1}; at i=0 it is at least two exactly on the lower-type boundary. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E7 — error

**Locator:** p. 433, Proposition 2.5 (second sentence)

**Source assertion:** overline(S_λ ∩ Gr_{≤μ}) = ⋃_{λ′≤λ} S_{λ′} ∩ Gr_{≤μ}

**Correction:** Replace the second sentence by S̄_λ ∩ Gr_{≤μ} = ∪_{λ′≤λ}(S_{λ′} ∩ Gr_{≤μ}), which follows from the first. Or restrict to λ a weight of V_μ (equivalently S_λ ∩ Gr_{≤μ} ≠ ∅) and supply a proof of closure(S_λ ∩ Gr_{≤μ}) = S̄_λ ∩ Gr_{≤μ}.

**Reason or counterexample:** The closure operations differ already for GL₂, μ=(1,0) and λ=(2,−1). The initial intersection S_λ∩Gr_{≤μ} is empty, so its closure is empty; the union of the lower intersections S_(1,0) and S_(0,1) is the perfected P¹. The corrected operation closes S_λ first and then intersects Gr_{≤μ}. This counterexample is checked against the published p.433 display; it does not require a comparison with an unread preprint or Zhu16 edition.

**Effect:** a stated result

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E46. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E46.

**Extraction provenance:** PAPER-ZHU-17/E46

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: Visually checked the published p.433 display: the overline covers the intersection. The empty GL₂ example makes the asserted closure equality false; closure of S_λ intersected with the bound is the safe replacement.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — The closure bar on Zhu p.433 covers the intersection as printed. An empty initial orbit intersection can have nonempty intersection after closing the semi-infinite orbit; closing the orbit first and then imposing the bound is the required operation. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E8 — misprint

**Locator:** p. 434, Corollary 2.8; p. 439, Corollary 2.14

**Source assertion:** The source gives the components of the intersection a uniform dimension, dim(S_λ ∩ Gr_{≤μ}) = (ρ, λ + μ), without requiring that the intersection have any points.

**Correction:** Add 'if nonempty, i.e. if λ is a weight of V_μ' to the dimension clause of Cor. 2.8, and 'if nonempty, i.e. if each λ_i is a weight of V_{μ_i}' to Cor. 2.14.

**Reason or counterexample:** For λ not a weight of V_μ (e.g. λ = μ + α^∨) the scheme is empty, so the dimension formula fails literally. The component count dim V_μ(λ) = 0 remains correct. This is the same kind of missing nonemptiness hypothesis as the recorded E19; keep the classifications consistent (I lean to misprint, since the intended reading is clear).

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E47. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E47.

**Extraction provenance:** PAPER-ZHU-17/E47

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: An empty intersection has no asserted nonnegative equidimension. The dimension equality needs nonemptiness; the zero component count remains valid.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — Zhu’s dimension equalities on pp.434 and 439 apply to nonempty intersections. Coweights outside a bounded orbit’s weights give empty intersections and cannot have the asserted finite dimension. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E9 — misprint

**Locator:** p. 435, Corollary 2.9

**Source assertion:** The source places a basis of cycle classes in H^i_c(S_λ, IC_μ), without choosing a value for i.

**Correction:** The relevant cycle classes give a basis for H_c^{(2ρ,λ)}(S_λ, IC_μ) = CT_λ(IC_μ).

**Reason or counterexample:** The index i is free. The cycle classes live in degree (2ρ,λ), which by Proposition 2.7 is the only nonzero degree.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E49. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E49.

**Extraction provenance:** PAPER-ZHU-17/E49

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: The basis occurs only in degree ⟨2ρ,λ⟩ by 2.7; the unbound index i in 2.9 is a misprint.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — The weight-basis statement on Zhu p.435 uses a free index i where its proof selects cohomological degree ⟨2ρ,λ⟩. Retaining arbitrary i would make the claimed basis false. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E10 — error

**Locator:** p. 436, proof of Corollary 2.10

**Source assertion:** Fil′_{<λ}H^*(A) = Im(H^*_{S⁻_{<λ}}(A) → H^*(A)); H^* = ⊕_λ H_c^*(S_λ, −)

**Correction:** Use Im(H^*_{S̄^-_λ}(A) → H^*(A)), as in [MV07, Th. 3.6]. Fix k = (2ρ,λ). Parity and degree give H^k_{S̄^-_λ}(A) = H^k_{S^-_λ}(A) and H^k(S̄_λ,A) = H^k_c(S_λ,A). The composite H^k_{S̄^-_λ}(A) → H^k(A) → H^k(S̄_{λ′},A) is the isomorphism of (2.2.10) (hyperbolic localization at ϖ^λ) for λ′ = λ. It is zero for λ′ ≠ λ of the same degree, since a nonempty closed G_m-stable S̄^-_λ ∩ S̄_{λ′} contains some ϖ^η with λ ≤ η ≤ λ′. Hence H^k(A) = ⊕_{(2ρ,λ)=k} Im(H^k_{S̄^-_λ}(A) → H^k(A)), which gives H^* ≅ ⊕_λ H^*_c(S_λ,−).

**Reason or counterexample:** By Proposition 2.5, S̄^−_λ − S^−_λ = ∪_{λ′>λ} S^−_{λ′}. By (2.2.10) and Proposition 2.7, H^k_{S^−_{λ′}}(A) = 0 unless k = (2ρ,λ′) > (2ρ,λ). So the printed Fil′_{<λ} vanishes in degree (2ρ,λ) and cannot split off the λ-piece. Morally it is ⊕_{λ′>λ}, which lies inside Fil_{≥λ} instead of complementing it. Counterexample to the claimed complementarity: GL_2, A = IC_{(1,0)} = Q̄_ℓ[1] on P^1, λ = (0,1). Here Fil_{≥λ} = H^*(A), because S_{<λ} ∩ P^1 = ∅. But Fil′_{<λ} is the image of H^*_{pt}(A) with pt = ϖ^{(1,0)}, which is H^1 ≠ 0. The corollary is right by the MV argument the proof cites. Same text in arXiv v3.

**Effect:** the proof

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E51. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E51.

**Extraction provenance:** PAPER-ZHU-17/E51

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: The printed opposite filtration contains higher weights rather than the complementary λ-piece. The GL₂ minuscule point-support example confirms the proof error; use support in the opposite orbit closure.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — The printed opposite filtration on Zhu p.436 contains higher ordinary weights and fails to complement the selected λ-piece. In the GL₂ minuscule example the point-support image is nonzero while the other filtration already equals total cohomology. Use support in the opposite orbit closure S̄⁻_λ for the splitting argument. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E11 — error

**Locator:** p. 437, item (2) before Lemma 2.12

**Source assertion:** The source claims that no parahoric subgroup properly contains Q_{1/2}.

**Correction:** Delete item (2), or state: Q_{1/2} is the parahoric of −θ/2, whose reductive quotient contains the SL_2 of the affine roots ±(θ^∨+1). It is maximal unless the simple factor containing θ is of type A_n with n ≥ 2.

**Reason or counterexample:** Q_{1/2} is the parahoric of −θ/2 (the v2 discussion identifies −μ/2 as a vertex). The affine roots vanishing there are ±(θ^∨ + 1) and the roots orthogonal to θ. These have full rank only if the roots orthogonal to the highest root have rank r − 1, which fails in type A_n, n ≥ 2, where they have rank n − 2. For SL_3, θ = (1,0,−1) pairs to 1 or 2 with every positive root. So −θ/2 lies on the single wall θ^∨ + 1 = 0, inside an edge, and Q_{1/2} is properly contained in the parahorics of the edge's two vertices. Type A is covered by the paper: θ ∈ M (p. 439) and Lemma 2.11 includes it. The claim is not used in any proof.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E52. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E52.

**Extraction provenance:** PAPER-ZHU-17/E52

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: In type A₂ the point −θ/2 lies in an edge rather than a vertex, so its parahoric is not maximal. The statement is unused in the needed proof.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — For SL₃ on Zhu p.437, θ=(1,0,−1) and −θ/2 lies in the interior of an affine alcove edge, not at a vertex. Its parahoric Q_{1/2} is properly contained in the two endpoint parahorics, disproving the stated maximality. This assertion is not needed in the proof used by the packet. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E12 — error

**Locator:** p. 439, proof of Lemma 2.11 (μ = θ): display for π^{-1}(S_0 ∩ Gr_{≤μ}) and (2.2.13)

**Source assertion:** RΓ_c(π⁻¹(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) = RΓ_c(⋃_{wμ<0} ŪwP̄_μ/P̄_μ, Q̄_ℓ[d − 2])

**Correction:** With Y = ∪_{wμ<0} ŪwP̄_μ/P̄_μ, π^{-1}(S_0 ∩ Gr_{≤μ}) = [φ^{-1}(Y) \ π^{-1}(∪_{wμ<0} S_{wμ} ∩ Gr_{≤μ})] ⊔ [π^{-1}(Gr_0) ∩ φ^{-1}(Ḡ/P̄_μ − Y)], where π^{-1}(Gr_0) ≅ Ḡ/P̄_μ is the section at infinity. So (2.2.13) should read RΓ_c(π^{-1}(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) = RΓ_c(Y, Q̄_ℓ[d−2]) ⊕ RΓ_c(Ḡ/P̄_μ − Y, Q̄_ℓ[d]); the sequence splits since all terms are in even degrees. Comparison with (2.2.12) then gives H^i(𝒞) = H^i_c(π^{-1}(S_0 ∩ Gr_{≤μ}), Q̄_ℓ[d]) for i ≠ 0 and H^0_c(S_0, IC_μ) ≅ Q̄_ℓ^{|Δ_θ|}.

**Reason or counterexample:** Cells of Ḡ/P̄_θ: for β = wθ > 0 the dimension is ht θ + ht β − 1; for β < 0 it is ht θ − ht(−β); and d = 2 ht θ. With the printed (2.2.13), H^i_c vanishes for i > 0, yet H^i(C) = H^{i+d}(Ḡ/P̄_μ) ≠ 0 whenever some positive β ∈ Wθ has height 1 + i/2. In degree 0 both sides have dimension |Δ_θ|, which would give H^0_c(S_0, IC_μ) = 0. Check for SL_3: Ḡ/P̄_θ is the flag variety and C = Q̄_ℓ[2] ⊕ Q̄_ℓ^2 ⊕ Q̄_ℓ[−2]. The printed (2.2.13) gives Q̄_ℓ[2] ⊕ Q̄_ℓ^2, so H^0_c(S_0, IC_θ) = 0 and the degree-2 term would be negative. The corrected formula gives H^0_c = Q̄_ℓ^2 = V_θ(0). The final conclusion (and the [NP01, §8] computation it defers to) is right. The same display is in arXiv v2 and v3.

**Effect:** the proof

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E53. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E53.

**Extraction provenance:** PAPER-ZHU-17/E53

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: The infinity section contributes the omitted cohomology. The SL₃ flag resolution yields zero-weight multiplicity two; retain the excision sequence and avoid a claimed canonical splitting.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — In Zhu’s quasi-minuscule calculation on p.439 the infinity section over the complement contributes to compact support. For SL₃ the printed expression omits a degree-two term and gives an incorrect zero-weight answer; restoring the section gives multiplicity two. Excision and even-degree splitting supply the correction without a canonical splitting claim. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E13 — misprint

**Locator:** A.3.5, last paragraph, p. 482

**Source assertion:** The source permits a pro-unipotent pro-algebraic J₁ in its construction independent of the kernel; connectedness is not an additional hypothesis.

**Correction:** Require J_1 to be connected (as for the congruence subgroups L^+G^{(h)} used in the paper). Two admissible choices J_1, J_1' are then compared through the connected, normal, pro-unipotent subgroup J_1J_1' (or through J_1 ∩ J_1'), applying (A.3.4) to the connected groups J_1J_1'/J_1 and J_1J_1'/J_1', and (A.3.6) for cohomology.

**Reason or counterexample:** (A.3.4) is stated only for connected J_1, but the condition allows disconnected unipotent J_1 (finite p-groups are unipotent in characteristic p). Counterexample: J = Z/p (constant), X = Spec k. Both J_1 = J and J_1' = {1} satisfy the condition, but P_{J/J}(X) = Vect while P_{J/{1}}(X) = Rep_{Qlbar}(Z/p), which has p simple objects. This also conflicts with the earlier definition of P_J for pfp J. The cohomology half is fine, since (A.3.6) holds for any unipotent J_1 (l != p). In the paper J_1 is always a connected congruence subgroup, so nothing downstream is affected.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-ZHU-17/E71. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-ZHU-17/E71.

**Extraction provenance:** PAPER-ZHU-17/E71

**Source:** Zhu17

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Historical independent review:** verdict: confirmed; reason: Confirmed as a missing convention: under the broad convention allowing disconnected unipotent groups, the constant group F_p gives inequivalent representation categories. Require connected congruence kernels, or define pro-unipotent with connected quotients. This is not an error if connectedness is already built into that term.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — Zhu p.482 needs connected pro-unipotent groups in the intended geometric convention. If a broader definition allows a constant F_p group, its nontrivial representations disprove equivalence with vector spaces. The packet already uses connected congruence kernels. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E14 — misprint

**Locator:** arXivv3 Lemmas7.7–7.8 pp28–29; Definition7.10 convention

**Source assertion:** The source claims that the cokernel of an isogeny has projective dimension 1 exactly.

**Correction:** Use projective dimension at most one, or separately exclude Q=0 when claiming equality one.

**Reason or counterexample:** The identity isogeny has cokernel zero and the zero R-module is projective; its projective dimension is not exactly one under the usual conventions. (cc-442dc5) Reclassified to affect nothing: the dimension-one wording has the intended meaning of a bound ≤1 throughout Lemmas 7.7–7.8 and Definition 7.10, and the zero module causes no problem in the determinant construction.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-BHATT-SCHOLZE-17/E10. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E10.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

**Earlier effect assessment:** a stated result

**Extraction provenance:** PAPER-BHATT-SCHOLZE-17/E10

**Source:** BS17-witt-grassmannian

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Version scope:** Final arXiv v3 only; publisher refused the PDF. This is not a verified finding against the published version.

**Historical independent review:** verdict: confirmed; reason: The identity isogeny has zero cokernel. The intended projective-dimension condition is ≤1; equality one is not literally true for this degenerate case.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — BS arXiv v3 pp.28–29 includes the identity isogeny, whose cokernel is zero. The correct projective-dimension condition is at most one, and the nonzero torsion case has dimension one. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E15 — misprint

**Locator:** arXiv v3, Lemma 7.9, p. 29

**Source assertion:** Spec(R)_{≤λ} ⊂ {x ∈ Spec(R) | λ(Q ⊗ W(k(x))) ≤ λ}

**Correction:** Spec(R)_{≤λ} := {x ∈ Spec(R) | λ(Q ⊗ W(k(x))) ≤ λ} is a closed subset of Spec(R).

**Reason or counterexample:** The display defines the locus, and the proof on p. 32 shows that this whole set is closed (it is the image of Dem_λ(Q)). With '⊂' the statement would say nothing about which subset. The earlier revision concerned how the display was recorded, not the mathematical diagnosis in the inherited E12 finding. Present in v1 and v2.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-BHATT-SCHOLZE-17/E12. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E12.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

**Extraction provenance:** PAPER-BHATT-SCHOLZE-17/E12

**Source:** BS17-witt-grassmannian

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Version scope:** Final arXiv v3 only; publisher refused the PDF. This is not a verified finding against the published version.

**Historical independent review:** verdict: confirmed; reason: The p.29 display specifies the whole type-bound locus, whose closedness is proved subsequently; replace the ambiguous inclusion by the defining equality.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — The locus notation on BS arXiv v3 p.29 is being defined by the displayed condition. Equality/definition notation is intended; reading the containment as a further restriction is unsupported. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E16 — gap

**Locator:** p. 35, proof of Theorem 8.3, second paragraph

**Source assertion:** The proof appeals to induction to show that L|⋃_{μ<λ}Gr_{≤μ} is ample, although it has not yet shown that the union is representable.

**Correction:** Before invoking Keel, show that Y = ∪_{μ<λ}Gr_{≤μ} is the perfection of a proper algebraic space. Here Y is the image sheaf of ⊔_{μ<λ}Gr_{≤μ}, equivalently the closed complement of Gr_λ. The map ⊔Gr_{≤μ} → Y is a v-cover. Its equivalence relation is given by the closed intersections Gr_{≤μ} ×_{Gr_{≤λ}} Gr_{≤μ'}. So Y is the iterated pushout of the Gr_{≤μ} along these intersections. Affine-locally this pushout is A1 ×_{A12} A2, which is perfect and satisfies A1 ⊗_A A2 = A12. On finite-type models the pushout is a proper algebraic space by [Ar70, 6.1]. Next, every subvariety of Y lies in some Gr_{≤μ}, where L is ample, so E(L|_Y) = ∅. Keel's Lemma 1.8, applied inductively over the pieces, then makes L|_Y semiample. Its morphism contracts no curve, hence is finite, so L|_Y is ample. Alternatively, cite Zhu's Theorem 8.2, which makes Y a closed subspace of a proper perfect algebraic space; but then the proof is no longer independent of Zhu as claimed (p. 32).

**Reason or counterexample:** Keel's Lemma 1.8 is a gluing statement for semiampleness on a proper algebraic space X = X_1 ∪ X_2 with E(L) ⊂ X_1. To obtain ampleness it has to be combined with E(L) = ∅ and Nakai. Applying it requires Y = ∪_{μ<λ} Gr_{≤μ} to be (the perfection of) a proper algebraic space. The induction hypothesis makes each Gr_{≤μ} a projective perfect scheme, but not their union inside the v-sheaf Gr_{≤λ}, whose representability is what is being proved. The union is not a single Gr_{≤μ} in general: for n = 3, λ = (4,2,0), both (3,3,0) and (4,1,1) are maximal below λ and are incomparable. Applying Keel's lemma on the scheme ψ^{-1}(Y) instead does not work, since the exceptional locus there does not lie in one piece. Defence: the missing step is standard and fillable (pinching of perfect schemes along closed subschemes, or gluing sections as above). Theorem 8.3 itself is not in doubt.

**Effect:** the proof

**Published-correction status:** Previously recorded as PAPER-BHATT-SCHOLZE-17/E39. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E39.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

**Extraction provenance:** PAPER-BHATT-SCHOLZE-17/E39

**Source:** BS17-witt-grassmannian

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Version scope:** Final arXiv v3 only; publisher refused the PDF. This is not a verified finding against the published version.

**Historical independent review:** verdict: confirmed; reason: The p.35 induction invokes representability of the lower-bound union before the pinching step is supplied. Confirmed as a recorded proof obligation, not a counterexample to projectivity.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — The BS projectivity induction on arXiv v3 p.35 invokes positivity on the lower-bound union before constructing that union as a proper pfp perfect space. The SF1 finite-pushout request records the missing proof step; no failure of projectivity is alleged. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E17 — error

**Locator:** p. 37, the sentence introducing Kottwitz' map and Proposition 9.7 ([Zhu14, Proposition 1.21])

**Source assertion:** π₁(G)_{Gal_K}

**Correction:** Add the hypothesis 'k algebraically closed' (as in [Zhu14, §1.5.2]); then Gal_K is the inertia group. For a general perfect k: Kottwitz's map is κ: LG(k̄) = G(W_{O_K}(k̄)[1/p]) → π1(G)_{I_K}, where I_K ⊂ Gal_K is the inertia subgroup. It induces Gal(k̄/k)-equivariant bijections π0(LG_{k̄}) ≅ π0(Gr_{𝒢,k̄}) ≅ π1(G)_{I_K}. The connected components over k are the Gal(k̄/k)-orbits on π1(G)_{I_K}.

**Reason or counterexample:** For finite k and an unramified quadratic extension K′/K, take T=Res_{K′/K}G_m with its connected integral model. The geometric components of its affine Grassmannian form ℤ² with Frobenius exchanging the coordinates, whereas full Galois coinvariants give ℤ. Thus BS arXiv v3 p.37 must use inertia coinvariants for geometric components and retain residual Frobenius. Zhu’s published Proposition 1.21 on p.427 has an algebraically closed residue-field standing setting; the broader finite-k assertion does not follow from that setting. The SL_n application has trivial π₁ and is unaffected.

**Effect:** a stated result

**Published-correction status:** Previously recorded as PAPER-BHATT-SCHOLZE-17/E41. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E41.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

**Extraction provenance:** PAPER-BHATT-SCHOLZE-17/E41

**Source:** BS17-witt-grassmannian

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Version scope:** Final arXiv v3 only; publisher refused the PDF. This is not a verified finding against the published version.

**Historical independent review:** verdict: confirmed; reason: Geometric components use inertia coinvariants. An unramified restriction-of-scalars torus separates these from full-Galois coinvariants; the issue is scoped to the non-algebraically-closed base.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — BS arXiv v3 p.37 concerns geometric components. Inertia coinvariants retain a residual Frobenius action; passing directly to full Galois coinvariants would lose those geometric components. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E18 — gap

**Locator:** p. 37, Proposition 10.1 (second assertion) and its proof

**Source assertion:** L = det̃_R(p^a W_{O_K}(R)^n/M)

**Correction:** Add the argument. Choose a W(k)-basis of O_K, so that W_{O_K}(R)^n = W(R)^{ne}. On a bounded piece X ⊂ Gr_{SL_n} (proper by Corollary 9.6), for a ≪ 0 the map M ↦ p^{-a}M ⊂ W(R)^{ne} sends X into some Gr_{≤λ} for GL_{ne}. The cokernel is Q = W(R)^{ne}/p^{-a}M ≅ p^aW_{O_K}(R)^n/M, killed by a bounded power of p, of constant length −ane. This map is proper and injective on points, hence finite (pass to finite-type models). By definition of det̃ on K(W_{O_K}(R) on R), L|_X is the pullback of the Theorem 8.3 bundle det̃(Q). So L|_X is ample by Theorem 8.3.

**Reason or counterexample:** The proof constructs L and notes independence of a, but never addresses the asserted ampleness. For ramified O_K the lattices are W_{O_K}(R)-lattices, and Theorem 8.3 (stated for W(R)-lattices in W(R)^n) does not apply without the restriction-of-scalars comparison. Proposition 10.5 (Serre vanishing, infinite-dimensionality) depends on this ampleness. The missing argument is short and the statement is true.

**Effect:** the proof

**Published-correction status:** Previously recorded as PAPER-BHATT-SCHOLZE-17/E42. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E42.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

**Extraction provenance:** PAPER-BHATT-SCHOLZE-17/E42

**Source:** BS17-witt-grassmannian

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Version scope:** Final arXiv v3 only; publisher refused the PDF. This is not a verified finding against the published version.

**Historical independent review:** verdict: confirmed; reason: Proposition10.1 constructs the line but does not prove its stated ampleness. A finite restriction-of-scalars map to an ordinary Witt bound supplies the missing argument, under the listed lattice/model hypotheses.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — The line on BS arXiv v3 p.37 exists for ramified coefficients, but the cited sentence alone does not prove its ampleness. Restriction of scalars with compatible finite proper bounded models supplies the extra positivity route requested from the owners. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E19 — misprint

**Locator:** p. 37, last paragraph (after Proposition 10.1)

**Source assertion:** det_R(p^a W_{O_K}(R)^n/gW_{O_K}(R)^n)

**Correction:** det̃_R(p^aW_{O_K}(R)^n/gW_{O_K}(R)^n) (up to the canonically trivial factor det̃_R(p^aW_{O_K}(R)^n/W_{O_K}(R)^n)^{-1})

**Reason or counterexample:** p^a W_{O_K}(R)^n / g W_{O_K}(R)^n is not killed by p, hence not an R-module, so det_R is undefined. The extended determinant det̃_R of Theorem 5.7 and Proposition 10.1 is meant. The normalizing factor is a trivial line bundle, and the proof of Proposition 10.4 uses det̃_k correctly.

**Effect:** nothing

**Published-correction status:** Previously recorded as PAPER-BHATT-SCHOLZE-17/E43. The corresponding source passage was checked in this run; no separate published correction verified here.

**Recorded correction search:** The exact source version and passages listed in sources.readSections.; The existing atlas paper extraction and its recorded correction/provenance: PAPER-BHATT-SCHOLZE-17/E43.; Springer PDF endpoint for doi:10.1007/s00222-016-0710-4, 2026-10-07: HTML paywall, not the published PDF.

**Extraction provenance:** PAPER-BHATT-SCHOLZE-17/E43

**Source:** BS17-witt-grassmannian

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Version scope:** Final arXiv v3 only; publisher refused the PDF. This is not a verified finding against the published version.

**Historical independent review:** verdict: confirmed; reason: The quotient is p-power torsion, not an R-module in general; det_R is undefined. The extended determinant and its normalized constant factor are the intended expression.; by: REV-GeometricSatakeAndFusion--GS0

**Verification state:** Independently checked against the recorded source version; see review verdict.

**Current independent review:** confirmed — The Witt torsion quotient on BS arXiv v3 p.37 is not an ordinary R-vector bundle to which det_R applies. The extended determinant with the inverse standard-lattice factor gives the SL normalization used by the node. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E20 — misprint

**Source:** Zhu17

**Locator:** A.3.1, p.478

**Source assertion:** Q_ℓ[2 dim X](dim X)

**Correction:** Use the perverse shift [dim X] for IC on a smooth dense open; specify any Tate normalization separately.

**Reason or counterexample:** The normalized IC in the paper’s Satake construction is perverse. On a smooth curve Q_ℓ[2] lies one degree away from the perverse constant Q_ℓ[1]. This printed formula confuses IC normalization with the smooth dualizing complex.

**Effect:** a stated result

**Published-correction status:** New finding of this independent review; no author-endorsed correction verified.

**Recorded correction search:** Recorded public PDF and surrounding source arguments.; Existing packet sourceIssues and paper-extraction findings; this issue was absent from the packet ledger.

**Verification state:** Independently confirmed; not an author-endorsed erratum.

**Added by:** REV-GeometricSatakeAndFusion--GS0

**Historical independent review:** verdict: confirmed; reason: The normalized IC in the paper’s Satake construction is perverse. On a smooth curve Q_ℓ[2] lies one degree away from the perverse constant Q_ℓ[1]. This printed formula confuses IC normalization with the smooth dualizing complex.; by: REV-GeometricSatakeAndFusion--GS0

**Current independent review:** confirmed — For a smooth d-dimensional stratum, Zhu p.478 uses IC restricted as the constant sheaf shifted by d; its dualizing complex is shifted by 2d with twist d. Identifying them directly loses a shift and twist. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E21 — error

**Source:** Zhu17

**Locator:** A.3.3, pp.479–480

**Source assertion:** The source claims that passing between finite models leaves c_{X′} and c_{X″}, the normalized classes, unchanged.

**Correction:** Fix the finite model and account for the purely inseparable degree in trace/fundamental-class comparisons.

**Reason or counterexample:** Relative Frobenius P¹→P¹ has degree p and pulls c₁(O(1)) to p·c₁(O(1)). It induces an étale-topos equivalence and an isomorphism on rational top cohomology, but does not preserve the scalar trace normalization. Thus the claimed model independence fails.

**Effect:** a stated result

**Published-correction status:** New finding of this independent review; no author-endorsed correction verified.

**Recorded correction search:** Recorded public PDF and surrounding source arguments.; Existing packet sourceIssues and paper-extraction findings; this issue was absent from the packet ledger.

**Verification state:** Independently confirmed; not an author-endorsed erratum.

**Added by:** REV-GeometricSatakeAndFusion--GS0

**Historical independent review:** verdict: confirmed; reason: Relative Frobenius P¹→P¹ has degree p and pulls c₁(O(1)) to p·c₁(O(1)). It induces an étale-topos equivalence and an isomorphism on rational top cohomology, but does not preserve the scalar trace normalization. Thus the claimed model independence fails.; by: REV-GeometricSatakeAndFusion--GS0

**Current independent review:** confirmed — Zhu pp.479–480 uses a trace in top cohomology. Frobenius on an ordinary P¹ model has degree p and changes that trace normalization. Universal-homeomorphism invariance of the étale topos does not identify these model-dependent trace maps without normalization. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E22 — misprint

**Source:** FS-geometrization

**Locator:** Corollary VI.3.8, p.207

**Source assertion:** The source gives a uniform dimension for components of the semi-infinite intersection, with no assumption that the intersection contains a point.

**Correction:** Qualify the intersection dimension equality by nonemptiness, as also required for Zhu Corollary2.8.

**Reason or counterexample:** For GL₂ μ=(1,0), λ=(2,−1) is outside the weights of the minuscule bound, so S_λ∩Gr_{≤μ} is empty while ⟨ρ,μ+λ⟩=2. The closed-filtration proof applies to the nonempty strata.

**Effect:** nothing

**Published-correction status:** New finding of this independent review; no author-endorsed correction verified.

**Recorded correction search:** Recorded public PDF and surrounding source arguments.; Existing packet sourceIssues and paper-extraction findings; this issue was absent from the packet ledger.

**Verification state:** Independently confirmed; not an author-endorsed erratum.

**Added by:** REV-GeometricSatakeAndFusion--GS0

**Historical independent review:** verdict: confirmed; reason: For GL₂ μ=(1,0), λ=(2,−1) is outside the weights of the minuscule bound, so S_λ∩Gr_{≤μ} is empty while ⟨ρ,μ+λ⟩=2. The closed-filtration proof applies to the nonempty strata.; by: REV-GeometricSatakeAndFusion--GS0

**Current independent review:** confirmed — FS p.207’s numerical dimension formula needs a nonempty intersection. The GL₂ minuscule bound and λ=(2,−1) give an empty intersection despite a positive numerical expression. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E23 — misprint

**Source:** Zhu17

**Locator:** Proof of Corollary 2.9, p.436 (PDF page34), final displayed comparison in the first paragraph

**Source assertion:** H_c^{⟨2ρ,λ⟩}(S_λ,IC_μ) ≃ H_c^{⟨2ρ,λ⟩}(S_λ∩Gr_μ,Q̄_ℓ)

**Correction:** Write d_μ=⟨2ρ,μ⟩ and r=⟨2ρ,λ⟩. With IC_μ|Gr_μ=Q̄_ℓ[d_μ] before any Tate normalization, the right-hand side is H_c^{r+d_μ}(S_λ∩Gr_μ,Q̄_ℓ), namely unshifted degree ⟨2ρ,μ+λ⟩. If IC carries a Tate normalization, put that twist on the constant sheaf separately; it does not change the cohomological shift.

**Reason or counterexample:** The open-stratum restriction of a perverse intersection complex carries shift[d_μ], and H^r(K[d_μ])=H^{r+d_μ}(K). The printed proof keeps r unchanged after replacing IC by the unshifted constant sheaf. For GL₂ with μ=λ=(1,0), Gr_μ is the perfected projective line, S_λ∩Gr_μ is the perfected affine line, d_μ=r=1, and the IC weight group is its nonzero H_c² with constant coefficients. The printed H_c¹ with constant coefficients is zero. This is distinct from E9’s free index in the statement of Corollary 2.9, and the corrected node already has the required unshifted degree.

**Effect:** the proof

**Published-correction status:** New revision finding; no author-endorsed correction verified in the bounded primary journal/author-repository search on 2026-10-07.

**Recorded correction search:** 2026-10-07: read and visually rendered published Annals 185(2017) p.436, https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf; exact SHA256 5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7.; 2026-10-07: opened journal article page https://annals.math.princeton.edu/2017/185-2/p02; no correction notice was displayed.; 2026-10-07: domain-restricted searches for the paper title with correction/corrigendum/errata on annals.math.princeton.edu and the author institutional domains stanford.edu/caltech.edu; no relevant author-endorsed correction was retrieved.; 2026-10-07: opened author-submitted arXiv record https://arxiv.org/abs/1407.8519; it lists v3 dated 20 July 2016 and a correction to Theorem A.29, not to this cohomological-degree display. Only record/version metadata were read here, not the arXiv PDF.; 2026-10-07: opened institutional author repository https://authors.library.caltech.edu/records/tc3x3-jbc74; it links submitted 1407.8519v2.pdf and contains no correction notice for this display. Its attached PDF was not downloaded or compared.

**Version scope:** Established against the published Annals 185(2017) PDF only, exact SHA256 5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7. This record does not assert that the same error occurs in an unread author-preprint edition.

**Statement format:** The source assertion is described in the worker’s own words; mathematical symbols and formulas are retained where needed to identify the issue. The correction and reason are mathematical analysis, not quoted source prose.

**Added by:** BP-GeometricSatakeAndFusion--GS0~2

**Verification state:** Verified directly against the published page, including its rendered image; not an author-endorsed erratum.

**Current independent review:** confirmed — In Zhu’s published p.436 proof the restriction IC_μ|Gr_μ has shift d_μ. Thus H_c^r with IC becomes unshifted constant-coefficient H_c^{r+d_μ}. The minuscule GL₂ affine-line example has nonzero H_c² and zero H_c¹. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.


### GeometricSatakeAndFusion/E24 — misprint

**Source:** FS-geometrization

**Locator:** Description of the geometric-point degree function immediately before Proposition VI.3.1, printed/PDF p.202; compare Lemma VI.3.2 and its proof, pp.203–204, and collision bounds VI.2.6, p.200

**Source assertion:** After identifying the geometric Grassmannian with factors indexed by the distinct untilts, the description weights each factor’s local cocharacter by that untilt’s multiplicity among the ordered legs.

**Correction:** Sum the combined local cocharacters once over the distinct geometric supports. In a coincident block the local cocharacter already sums the ordered-leg labels. Retain the multiplicity in the product Cartier equation ξ, without applying it again to the local valuation or cocenter degree.

**Reason or counterexample:** Take G=G_m and two coincident degree-one legs with primitive equation t. Completion for ξ=t² is the same as t-adic completion, and its geometric positive ring is one DVR B⁺. The ordered labels (1,0) give the lattice L=tB⁺, whose local cocharacter and ordinary length length(B⁺/L) are one. The printed extra weight gives two. Alternatively L=ξB⁺=t²B⁺ has ordinary position two and the printed weighting gives four. The sum over ordered labels at the start of p.202 and the product-DVR length identification in VI.3.2 both select the unweighted combined local cocharacter. This does not remove the collision addition of Schubert bounds.

**Effect:** nothing

**Published-correction status:** new; no author-endorsed correction found in the bounded primary-source search on 2026-10-08

**Version scope:** Established only for the exact author-hosted PDF recorded above. No comparison with the arXiv PDF or the Astérisque version of record is claimed.

**Recorded correction search:**

- 2026-10-08: inspected the author-hosted PDF https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf, SHA256 9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905, including rendered p.202 and the surrounding pp.200–204.
- 2026-10-08: opened https://people.mpim-bonn.mpg.de/scholze/papers.html; no separate correction for this passage was listed.
- 2026-10-08: opened https://arxiv.org/abs/2102.13459 and checked its version metadata (v4 dated 27 November 2024). The arXiv PDF was not downloaded or compared.
- 2026-10-08: searched the author domain and arxiv.org for Geometrization with correction, errata, VI.3.1 and multiplicity, and searched the exact title with erratum. No relevant author-endorsed correction was retrieved.

**Current independent review:** confirmed — The repeated-leg torus example distinguishes Cartier multiplicity from the already combined local cocharacter. The neighbouring ordinary-length proof fixes the intended convention, so this is a descriptive misprint with no change to the intended results. Reviewer: `REV-GeometricSatakeAndFusion--GS0~2`; date: 2026-10-08.

**Added by:** `REV-GeometricSatakeAndFusion--GS0~2`. Source assertion prose is paraphrased.

## Routed-source reconciliation

| Extraction item | Name and source locator | Disposition | Covered by | Reason |
| --- | --- | --- | --- | --- |
| `PAPER-BHATT-SCHOLZE-17/S403` | Acyclicity of affine Witt bundles — Theorem4.1(i), finite level; Theorem 1.2 (introduction form, for vector bundles in the h-topology) | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S404` | Formal Witt acyclicity — Theorem4.1(i), formal case | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S405` | Finite Witt vector-bundle descent — Theorem4.1(ii); Theorem 1.2 (introduction form, for vector bundles in the h-topology) | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S406` | Abstract blowup cohomology triangle — Lemma4.6(i) | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S407` | Abstract blowup vector-bundle patching — Lemma4.6(ii) | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S408` | Reduction to a blowup and Serre vanishing — Lemma4.6 proof, pp.16–17 | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S409` | Frobenius extension of bundle gluing — Lemma4.6 proof, p.17 | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S411` | Affineness does not descend for perfect v-covers — Remark4.3 | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S412` | Flat sheaves can fail h-descent — Remark4.3 | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/S413` | Hom between Witt bundles is a v-sheaf — Corollary4.4 | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/F601` | Fully faithful pullback across connected proper fibres — Proposition6.1 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F602` | Witt-bundle full faithfulness — Proposition6.1 following sentence | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F611` | Triviality over a valuation base — Lemma6.4 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F612` | Cohomologically trivial fibre descent — Theorem6.8 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F613` | Fibrewise cohomology detects the structure pushforward — Lemma6.9 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F617` | Fibre determinant triviality — Lemma6.11 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F620` | Descent using only connected fibres — Theorem 6.13, p. 25 (proof pp. 25-26); announced as Theorem 1.3, p. 3 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F621` | Flat closure and normalization reduction — Theorem6.13 proof, pp.25–26 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/F622` | Saturation of global sections — Theorem6.13 proof, p.26 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/G701` | Partitions and dominance — Definition7.1 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G702` | Witt torsion module type — Definition 7.2, p. 27 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G703` | Constant type gives projective gradeds — Lemma 7.3 and Remark 7.4, p. 27 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G7050` | Dominance criterion 1 — Lemma 7.5(i), p. 27 (proof pp. 27-28) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G7051` | Dominance criterion 2 — Lemma 7.5(ii), p. 27 (proof pp. 27-28) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G7052` | Dominance criterion 3 — Lemma 7.5(iii), p. 27 (proof pp. 27-28) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G7053` | Dominance criterion 4 — Lemma 7.5(iv), p. 27 (proof pp. 27-28) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G706` | Isogeny of projective Witt modules — Definition 7.6, p. 28 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G707` | Isogeny cokernel criterion — Lemma 7.7, p. 28 (proof p. 29); 'at most one' as in E10 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G708` | Projectivity after reduction modulo p — Lemma 7.8, p. 29 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G709` | Closed bounded-type locus — Lemma 7.9, p. 29 (proof p. 32) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/G710` | Demazure filtration functor — Definition 7.10, p. 29 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/G711` | Filtration representability — Proposition 7.11, p. 29 (proof p. 30) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/G713` | Image of the filtration scheme — Lemma 7.13, first assertion, p. 30 (proof pp. 30-31) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/G714` | Filtered Grassmann incidence variety — Lemma7.14 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/G715` | Exact-type uniqueness — Lemma 7.13, second assertion, p. 30 (proof p. 30, via Corollary 6.10) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/G716` | Cohomology of filtration fibres — Lemma 7.13, third assertion, p. 30 (proof pp. 30-31) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/G801` | Bounded Witt lattice Grassmannian — Definition 8.1, p. 32 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` | The lattice quotient construction and its bounded v-sheaf/algebraic-space representation are covered; the chosen integral model is retained in the quotient comparison. |
| `PAPER-BHATT-SCHOLZE-17/G802` | Bounded Grassmannian is a v-sheaf — Definition8.1 discussion | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` | The lattice quotient construction and its bounded v-sheaf/algebraic-space representation are covered; the chosen integral model is retained in the quotient comparison. |
| `PAPER-BHATT-SCHOLZE-17/G803` | Prior algebraic-space representability — Theorem8.2 [Zhu14] | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` | The lattice quotient construction and its bounded v-sheaf/algebraic-space representation are covered; the chosen integral model is retained in the quotient comparison. |
| `PAPER-BHATT-SCHOLZE-17/G804` | Global Demazure resolution — Definition8.4 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The global resolution has proper connected/cohomologically trivial fibres and a smooth projective tower. The first boundary-fibre example checks that the resolution is not everywhere an isomorphism. |
| `PAPER-BHATT-SCHOLZE-17/G805` | Proper cohomological resolution — Remark8.5 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The global resolution has proper connected/cohomologically trivial fibres and a smooth projective tower. The first boundary-fibre example checks that the resolution is not everywhere an isomorphism. |
| `PAPER-BHATT-SCHOLZE-17/G806` | Smooth projective resolution tower — Proposition8.6 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The global resolution has proper connected/cohomologically trivial fibres and a smooth projective tower. The first boundary-fibre example checks that the resolution is not everywhere an isomorphism. |
| `PAPER-BHATT-SCHOLZE-17/G807` | First nontrivial boundary fibre example — Example8.7 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The global resolution has proper connected/cohomologically trivial fibres and a smooth projective tower. The first boundary-fibre example checks that the resolution is not everywhere an isomorphism. |
| `PAPER-BHATT-SCHOLZE-17/G808` | Determinant line on the Grassmannian — Theorem8.8 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line` | The determinant identity on complete flag refinements proves fibre triviality in the geometric construction; the elementary determinant interface is requested from KTheoryLowDegrees:Z.3, not all of BS §5. |
| `PAPER-BHATT-SCHOLZE-17/G809` | Ample weighted quotient determinants — Lemma8.9(i) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity` | Weighted relative determinant ampleness, open-stratum sections, curve positivity, bigness and the boundary exceptional locus are the Witt-specific positivity target; general positivity is SF.5. |
| `PAPER-BHATT-SCHOLZE-17/G810` | Sections at the open stratum — Lemma8.9(ii) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity` | Weighted relative determinant ampleness, open-stratum sections, curve positivity, bigness and the boundary exceptional locus are the Witt-specific positivity target; general positivity is SF.5. |
| `PAPER-BHATT-SCHOLZE-17/G812` | Strict positivity on Grassmannian curves — Lemma8.10 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity` | Weighted relative determinant ampleness, open-stratum sections, curve positivity, bigness and the boundary exceptional locus are the Witt-specific positivity target; general positivity is SF.5. |
| `PAPER-BHATT-SCHOLZE-17/G813` | Bigness and boundary exceptional locus — Lemma8.11 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/determinant-positivity` | Weighted relative determinant ampleness, open-stratum sections, curve positivity, bigness and the boundary exceptional locus are the Witt-specific positivity target; general positivity is SF.5. |
| `PAPER-BHATT-SCHOLZE-17/G818` | Semiampleness on the resolution — Theorem8.3 proof | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | The Keel application, semiample contraction and equality of its relation with the lattice relation give bounded projectivity; boundary representability before the induction is explicitly requested and retained as a gap. |
| `PAPER-BHATT-SCHOLZE-17/G819` | Semiample contraction and relation comparison — Theorem8.3 proof | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | The Keel application, semiample contraction and equality of its relation with the lattice relation give bounded projectivity; boundary representability before the induction is explicitly requested and retained as a gap. |
| `PAPER-BHATT-SCHOLZE-17/G820` | Projectivity of bounded Witt Grassmannians — Theorem8.3; Theorem1.1 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | The Keel application, semiample contraction and equality of its relation with the lattice relation give bounded projectivity; boundary representability before the induction is explicitly requested and retained as a gap. |
| `PAPER-BHATT-SCHOLZE-17/G902` | Mixed-characteristic loop groups — Definition9.1 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Witt loops and integral-model quotient adapters use RF0 coefficient rings and the requested SF/RG Greenberg and restriction-of-scalars interfaces. |
| `PAPER-BHATT-SCHOLZE-17/G903` | Loop representability — Proposition 9.2, p. 36 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Witt loops and integral-model quotient adapters use RF0 coefficient rings and the requested SF/RG Greenberg and restriction-of-scalars interfaces. |
| `PAPER-BHATT-SCHOLZE-17/G904` | Affine Grassmannian of an integral group model — Definition9.4 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Witt loops and integral-model quotient adapters use RF0 coefficient rings and the requested SF/RG Greenberg and restriction-of-scalars interfaces. |
| `PAPER-BHATT-SCHOLZE-17/G905` | Integral-model ind-quasi-projectivity — Corollary9.6 first assertion | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Quasi-affine faithful embeddings reduce to lattice bounds, proper parahoric flags turn the bounded locally closed embedding into the needed closed/projective one, and RG2.4 supplies Kottwitz components. |
| `PAPER-BHATT-SCHOLZE-17/G906` | Parahoric ind-projectivity — Corollary9.6 second assertion | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Quasi-affine faithful embeddings reduce to lattice bounds, proper parahoric flags turn the bounded locally closed embedding into the needed closed/projective one, and RG2.4 supplies Kottwitz components. |
| `PAPER-BHATT-SCHOLZE-17/G907` | Kottwitz connected components — Proposition9.7 [Zhu14, Proposition1.21] | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Quasi-affine faithful embeddings reduce to lattice bounds, proper parahoric flags turn the bounded locally closed embedding into the needed closed/projective one, and RG2.4 supplies Kottwitz components. |
| `PAPER-BHATT-SCHOLZE-17/G1001` | Normalized determinant for SLn lattices — Proposition10.1 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization` | The normalized base-factor determinant line, determinant-trivial SL_n lattice comparison, translation formula and constant global functions are this construction’s API. |
| `PAPER-BHATT-SCHOLZE-17/G1005` | Infinite-dimensional sections — Proposition10.5 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds` | Infinite-dimensional section growth is a Witt/SL_n application of perfected ample section growth imported from SF.5, with n≥2 and a nontrivial character. |
| `PAPER-BHATT-SCHOLZE-17/G717` | Incidence parameters of the first filtration quotient — Proof of Lemma 7.13, p. 31 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/G908` | GLn lattice quotient comparison — Proposition9.5 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` | The lattice quotient construction and its bounded v-sheaf/algebraic-space representation are covered; the chosen integral model is retained in the quotient comparison. |
| `PAPER-BHATT-SCHOLZE-17/G1007` | SLn determinant-trivial lattice comparison — Proposition10.1 first assertion | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization` | The normalized base-factor determinant line, determinant-trivial SL_n lattice comparison, translation formula and constant global functions are this construction’s API. |
| `PAPER-BHATT-SCHOLZE-17/G1006` | Restriction of sections to perfect projective bounds — Proposition10.5, second assertion | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds` | Infinite-dimensional section growth is a Witt/SL_n application of perfected ample section growth imported from SF.5, with n≥2 and a nontrivial character. |
| `PAPER-BHATT-SCHOLZE-17/S415` | Formal Witt vector-bundle descent — Theorem4.1(ii), formal Witt assertion | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-BHATT-SCHOLZE-17/Q106` | Question 10.6 (statement only) — Question 10.6, pp. 39–40 | open-question | `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds` | Question 10.6 about the characteristic-p representation is recorded as a question. It is not an acceptance theorem or assumed in projectivity. |
| `PAPER-BHATT-SCHOLZE-17/witt-vectors-of-perfect-rings` | Witt vectors of a perfect F_p-algebra — §1.2, p. 2 (unnumbered background) | baseline-and-import | `mathlib:WittVector`, `RelativeFarguesFontaine:RF0` | The pinned WittVector carrier is present; perfect-base integral coefficient extensions are RF0 input. No second Witt vector construction is planned. |
| `PAPER-BHATT-SCHOLZE-17/witt-vector-affine-grassmannian` | Witt vector affine Grassmannian and its bounded pieces Gr^{Waff,[a,b]} — §1.1-§1.2, pp. 1-2 (with Theorem 1.1); 'lattice' is made explicit only in Proposition 9.5, p. 37 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` | The lattice quotient construction and its bounded v-sheaf/algebraic-space representation are covered; the chosen integral model is retained in the quotient comparison. |
| `PAPER-BHATT-SCHOLZE-17/theorem-1-1` | Theorem 1.1 (projectivity of the bounded Witt vector affine Grassmannian) — Theorem 1.1, p. 2 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | The Keel application, semiample contraction and equality of its relation with the lattice relation give bounded projectivity; boundary representability before the induction is explicitly requested and retained as a gap. |
| `PAPER-BHATT-SCHOLZE-17/remark-6-5-connected-fibres-suffice` | Triviality over a valuation base under fibre connectedness only — Remark 6.5, p. 22 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/lemma-6-11-k-theoretic-identity` | K-theoretic form of the filtered determinant — Before the proof of Lemma 6.11, p. 25 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line` | The determinant identity on complete flag refinements proves fibre triviality in the geometric construction; the elementary determinant interface is requested from KTheoryLowDegrees:Z.3, not all of BS §5. |
| `PAPER-BHATT-SCHOLZE-17/complete-flag-tower-lemma-6-11` | Tower of complete filtrations of a torsion W(k)-module — Proof of Lemma 6.11, p. 25 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/perfect-quot-scheme` | Perfect Quot scheme Quot(F, n) — Convention before the proof of Proposition 7.11, p. 29 | requested | `SchemeAndStackFoundations:SF.0` | Perfect Quot representability is general moduli input used by the filtration tower. |
| `PAPER-BHATT-SCHOLZE-17/n-lambda-row-lengths` | Row lengths n_λ(i) — Remark 7.4, p. 27 (with the proof of Lemma 7.5 and footnote 14, p. 28; proof of Lemma 7.13, p. 30) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/exact-type-finitely-presented` | Exact type forces finite presentation — Sentence before Lemma 7.3, p. 27 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/demazure-recursion` | Recursive description of the Demazure scheme — Proof of Proposition 7.11, p. 30; recalled in the proof of Lemma 7.13, p. 31 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/dem-zero-clopen-locus` | Vanishing locus of an isogeny cokernel is open and closed — Proof of Proposition 7.11, λ = 0 case, p. 30 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/extension-dominance-bound` | Dominance bound for an extension by k^r — Proof of Lemma 7.13, p. 30 ('from which it follows that') | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The type target includes geometric invariant factors, row lengths, Fitting-closed bounds and constant-type projective gradeds; the several source equivalence criteria and extension/zero-locus checks stay in its proof/API. |
| `PAPER-BHATT-SCHOLZE-17/exact-type-unique-filtration` | Filtrations of exact type are p-adic — Proof of Lemma 7.13, p. 30 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/grassmannian-structure-cohomology` | Cohomology of perfected Grassmannians and flag varieties — Proofs of Lemma 6.11 (p. 25) and Lemma 7.14 (p. 32) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/psi-pullback-fully-faithful-on-line-bundles` | Pullback along the Demazure resolution is fully faithful on line bundles — §8.3, p. 33, sentence after Theorem 8.8 | requested | `SchemeAndStackFoundations:SF.3`, `GeometricSatakeAndFusion:GS0:Witt-geometry/h-descent-and-fibral-criterion` | Connected-fibre proper pfp full faithfulness and effective vector/line descent are imported once. GS applies them to Demazure fibres, without treating the sufficient structure-cohomology hypothesis as necessary. |
| `PAPER-BHATT-SCHOLZE-17/complete-flag-refinement-cover` | Complete-flag refinement Gr̃_μ(λ) for λ = (N,0,…) — Proof of Theorem 8.8, p. 34 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The filtration construction and its recursive Grassmann tower give the image, exact-type uniqueness and fibre structure cohomology; the incidence parameter is the initial quotient choice, not a new independent target. |
| `PAPER-BHATT-SCHOLZE-17/keel-lemma-1-7` | Keel: the exceptional locus lies in the effective part — Cited in the proof of Lemma 8.11, p. 35 | requested | `SchemeAndStackFoundations:SF.5` | General Keel exceptional-locus/union and Frobenius section-extension lemmas are owned once by SF.5. The duplicate GS aliases in the extraction are reconciled with its general G817/G815 routes. |
| `PAPER-BHATT-SCHOLZE-17/keel-lemma-1-8` | Keel: gluing semiampleness over a union — Cited in the proof of Theorem 8.3, p. 35 | requested | `SchemeAndStackFoundations:SF.5` | General Keel exceptional-locus/union and Frobenius section-extension lemmas are owned once by SF.5. The duplicate GS aliases in the extraction are reconciled with its general G817/G815 routes. |
| `PAPER-BHATT-SCHOLZE-17/greenberg-realization` | Greenberg realization over W_{O_K} — Proof of Proposition 9.2, p. 36 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Witt loops and integral-model quotient adapters use RF0 coefficient rings and the requested SF/RG Greenberg and restriction-of-scalars interfaces. |
| `PAPER-BHATT-SCHOLZE-17/weil-restriction-reduction` | Weil restriction does not change loop groups — Proof of Corollary 9.6, p. 37 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Witt loops and integral-model quotient adapters use RF0 coefficient rings and the requested SF/RG Greenberg and restriction-of-scalars interfaces. |
| `PAPER-BHATT-SCHOLZE-17/pr08-quasi-affine-faithful-representation` | Faithful representation with quasi-affine quotient — Proof of Corollary 9.6, p. 37 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Quasi-affine faithful embeddings reduce to lattice bounds, proper parahoric flags turn the bounded locally closed embedding into the needed closed/projective one, and RG2.4 supplies Kottwitz components. |
| `PAPER-BHATT-SCHOLZE-17/zhu-locally-closed-embedding` | Locally closed embedding of affine Grassmannians — Proof of Corollary 9.6, p. 37 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Quasi-affine faithful embeddings reduce to lattice bounds, proper parahoric flags turn the bounded locally closed embedding into the needed closed/projective one, and RG2.4 supplies Kottwitz components. |
| `PAPER-BHATT-SCHOLZE-17/zhu-parahoric-ind-proper` | Partial affine flag varieties are ind-proper — Proof of Corollary 9.6, p. 37 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Quasi-affine faithful embeddings reduce to lattice bounds, proper parahoric flags turn the bounded locally closed embedding into the needed closed/projective one, and RG2.4 supplies Kottwitz components. |
| `PAPER-BHATT-SCHOLZE-17/loop-translate-of-L` | Translates of L differ by a line bundle on the base — §10, p. 37, paragraph after Proposition 10.1 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization` | The normalized base-factor determinant line, determinant-trivial SL_n lattice comparison, translation formula and constant global functions are this construction’s API. |
| `PAPER-BHATT-SCHOLZE-17/global-functions-on-gr-sln` | Global functions on Gr_{SL_n} — Proof of Proposition 10.3, p. 38 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/sl-determinant-normalization` | The normalized base-factor determinant line, determinant-trivial SL_n lattice comparison, translation formula and constant global functions are this construction’s API. |
| `PAPER-BHATT-SCHOLZE-17/lattice-determinant-e1-map` | Lattice-determinant description of L̃G(k) — Proof of Proposition 10.4, p. 39 | ancillary-not-required | `KTheoryLowDegrees:Z.3` | The pointwise lattice determinant central-extension description is ancillary to the selected geometric projectivity proof. A central-extension application must also import the owning low-degree K-theory symbol interface; this packet does not claim that construction. |
| `PAPER-BHATT-SCHOLZE-17/sections-on-perfections` | Sections of an ample bundle on a perfection — Proof of Proposition 10.5, p. 39 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/sections-on-witt-bounds` | Infinite-dimensional section growth is a Witt/SL_n application of perfected ample section growth imported from SF.5, with n≥2 and a nontrivial character. |
| `PAPER-BHATT-SCHOLZE-17/vect-perfection-colimit` | Vector bundles on a perfection are a Frobenius colimit — Lemma 4.6 proof, p. 17 ('By approximation ... at least after Frobenius twisting') | requested | `SchemeAndStackFoundations:SF.0` | The direct Frobenius-colimit finite-presentation descent is a general perfection foundation. It is not Mathlib’s inverse-limit Perfection. |
| `PAPER-BHATT-SCHOLZE-17/frobenius-thickening-extension` | Frobenius pullback extends isomorphisms over thickenings of a Cartier divisor — Lemma 4.6 proof, p. 17 ('After replacing ψ_0 by a large enough Frobenius pullback (depending on n) ...') | requested | `SchemeAndStackFoundations:SF.5` | General Keel exceptional-locus/union and Frobenius section-extension lemmas are owned once by SF.5. The duplicate GS aliases in the extraction are reconciled with its general G817/G815 routes. |
| `PAPER-BHATT-SCHOLZE-17/witt-bundle-devissage-step` | Induction step for descent of W_n-bundles — Proof of Theorem 4.1(ii), p. 17 | requested | `SchemeAndStackFoundations:SF.4` | Finite/formal Witt v-descent, blowup patching and its counterexamples are general foundations. The request includes the corrected reduction/induction and excludes false descent of arbitrary flat sheaves or affine spaces. |
| `PAPER-CARAIANI-SCHOLZE-17/37` | Lemma 3.4.4 (the Bialynicki-Birula map on field points) — §3.4, Lemma 3.4.4, p. 685 | planned | `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula` | The minuscule isomorphism target includes field-point detection and pointwise lattice equality as proof steps; use the completed-lattice criterion and correct the whole-Grassmannian versus minuscule-cell misidentification. |
| `PAPER-CARAIANI-SCHOLZE-17/38` | Lemma 3.4.6 (lattices are detected pointwise) — §3.4, Lemma 3.4.6, p. 685 | planned | `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula` | The minuscule isomorphism target includes field-point detection and pointwise lattice equality as proof steps; use the completed-lattice criterion and correct the whole-Grassmannian versus minuscule-cell misidentification. |
| `PAPER-CARAIANI-SCHOLZE-17/39` | Theorem 3.4.5 (for minuscule µ the Bialynicki-Birula map is an isomorphism) — §3.4, Theorem 3.4.5, pp. 685–686 | planned | `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula` | The minuscule isomorphism target includes field-point detection and pointwise lattice equality as proof steps; use the completed-lattice criterion and correct the whole-Grassmannian versus minuscule-cell misidentification. |
| `PAPER-CARAIANI-SCHOLZE-17/132` | Minuscule cocharacters — §3, p. 675 | requested | `ReductiveGroupsPartII:RG2.5` | Minuscule cocharacters and Lie weights are reductive-group input, with the CS/FS opposite-parabolic convention reconciled in the application. |
| `PAPER-CARAIANI-SCHOLZE-17/133` | Kedlaya–Liu: projectivity from locally constant fibre rank over uniform Banach rings — §3.4, proof of Proposition 3.4.3, p. 684 ([KL15, Prop. 2.8.4]) | requested | `RelativeFarguesFontaine:RF4:vector-bundles` | The uniform Banach finite-projectivity criterion is a vector-bundle supplier obligation with its locally constant fibre-rank hypothesis. |
| `PAPER-CARAIANI-SCHOLZE-17/135` | Griffiths transversality of the universal filtration on Fℓ_{G,µ} for minuscule µ — §3.4, proof of Theorem 3.4.5, p. 686 | requested | `PadicHodgeTheory:P8:local-rational`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/minuscule-bialynicki-birula` | The filtered period-sheaf connection and Griffiths transversality supply the surjectivity argument, with the cited corrigendum. |
| `PAPER-GLEASON-LIM-XU-26/T05` | Witt affine flag representability and component map — §§1.1,3.1 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity`, `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags` | The pfp flag and Kottwitz-component interfaces are covered, with inertia labels imported from RG2.4. |
| `PAPER-GLEASON-LIM-XU-26/T27` | Functorial admissible loci — Lemmas3.3–3.4 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags` | Functorial admissible loci use the requested local-model morphism, rather than an unsupported assertion that every group map preserves affine Bruhat labels. |
| `PAPER-HE-21/14` | Affine flag carrier — §2.2 p.5; §5.3 pp.9–10 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The equal-characteristic carrier and mixed-characteristic pfp carrier are distinguished; use their respective representability targets. |
| `PAPER-HE-21/61` | Adjoint realization of the construction and descent of the conclusion — §5.2–5.4 pp.9–11 | requested | `ReductiveGroupsPartII:RG2.4`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | Import the corrected componentwise adjoint comparison, including the characteristic restriction when required; apply it only on the compatible bounded carriers. |
| `PAPER-HE-21/64` | Relative-position orbit and convolution incidence variety — §5.3 pp.9–10 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences` | The incidence object includes the actual orbit pair and intermediate-flag forgetful maps. |
| `PAPER-HE-21/65` | Length-additive convolution is an isomorphism — §5.4 pp.11–12; GH10 §2.2(1) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/66` | Convolution onto the ordinary-product orbit — Proposition 5.6 ordinary-product case p.10 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/67` | Convolution onto the Demazure-product orbit — Proposition 5.6 Demazure case p.10 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/69` | Carrier and fibre-dimension theory for the two correspondences — §5.4 argument (a), pp.11–12 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/104` | Corrected adjoint comparison on connected components — GHN15 §2.2; erratum Proposition0.0.1 | requested | `ReductiveGroupsPartII:RG2.4`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | Import the corrected componentwise adjoint comparison, including the characteristic restriction when required; apply it only on the compatible bounded carriers. |
| `PAPER-HE-21/123` | Bounded models for forgetting an intermediate flag — He21 §5.3–5.4; GH10 §2.4–2.5; GS0 bounded flag interfaces | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/125` | Local boundedness of the two He21 correspondence maps — He21 §5.4 pp.11–12; follow-up local-model proof plan | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/126` | Compatible perfection models transfer fibre dimension bounds — GS0:Witt-geometry; He21 §5.4 perfect-carrier obligation | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/128` | Rank-one convolution strata — GH10 §2.4(1)–(2), pp.5–6 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | The target includes length-additive isomorphisms, ordinary versus Demazure product fibres, local boundedness, rank-one strata and their finite-model dimension transfer; the two length-drop branches are kept distinct. |
| `PAPER-HE-21/133` | Perfection preserves fibre products and underlying dimensions — Zhu17 Appendix A.1.2, Corollary A.3 and Remark A.4, printed pp.465–466 | requested | `SchemeAndStackFoundations:SF.0` | Finite-type models up to Frobenius, compatible fibre products and topological dimension invariance are general perfection foundations, not another GS theorem. |
| `PAPER-HE-21/134` | A morphism of pfp perfect spaces has a compatible model — Zhu17 Proposition A.17 and proof, printed pp.472–473; Proposition A.15 and Remark A.4 | requested | `SchemeAndStackFoundations:SF.0` | Finite-type models up to Frobenius, compatible fibre products and topological dimension invariance are general perfection foundations, not another GS theorem. |
| `PAPER-VANHOFTEN-24/G01` | Witt loop groups — §2.2.6 pp13–14 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The parahoric quotient/torsor and Witt-loop adapters are the interface of the ind-projectivity target, with RF4/RG2.3 supplying torsor descent. |
| `PAPER-VANHOFTEN-24/G02` | Witt affine flags — §2.2.7 pp13–14 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The parahoric quotient/torsor and Witt-loop adapters are the interface of the ind-projectivity target, with RF4/RG2.3 supplying torsor descent. |
| `PAPER-VANHOFTEN-24/G03` | Torsor modification description — §2.2.7 p14 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The parahoric quotient/torsor and Witt-loop adapters are the interface of the ind-projectivity target, with RF4/RG2.3 supplying torsor descent. |
| `PAPER-VANHOFTEN-24/G04` | Witt torsors and loop torsors — Lemma2.2.8 p14 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The parahoric quotient/torsor and Witt-loop adapters are the interface of the ind-projectivity target, with RF4/RG2.3 supplying torsor descent. |
| `PAPER-VANHOFTEN-24/G05` | Admissible Schubert union — §2.2.14–2.2.15 pp15–16 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags` | Finite admissible unions and the minuscule local-model dimension are the bounded-admissible target; general local-model existence is requested from SF.4. |
| `PAPER-VANHOFTEN-24/G06` | Schubert normality and dimension — §2.2.14 p15 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres` | Normality and length dimensions are transported through compatible pfp models and normalized Schubert bounds; RG2.4 supplies the combinatorics. |
| `PAPER-VANHOFTEN-24/G07` | Minuscule local-model dimension — §2.2.15 p16 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/bounded-admissible-flags` | Finite admissible unions and the minuscule local-model dimension are the bounded-admissible target; general local-model existence is requested from SF.4. |
| `PAPER-ZHU-17/G02` | Greenberg jets and perfect loops — §1.1.1, pp. 412–413 | requested | `SchemeAndStackFoundations:SF.0`, `ReductiveGroupsPartII:RG2.3` | Finite Greenberg realization and smooth model jets are shared foundations. GS evaluates their positive loop functors and uses the congruence filtration. |
| `PAPER-ZHU-17/G03` | Representability of punctured loops — Proposition1.1 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The loop/jet targets include the punctured-loop union, positive-loop closedness and dilatation congruence presentation as source proof steps; representability of general Greenberg functors stays with SF/RG. |
| `PAPER-ZHU-17/G04` | Integral loops as a closed subfunctor — Lemma 1.2, p. 414 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The loop/jet targets include the punctured-loop union, positive-loop closedness and dilatation congruence presentation as source proof steps; representability of general Greenberg functors stays with SF/RG. |
| `PAPER-ZHU-17/G05` | Congruence subgroups through dilatation — §1.1 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/loop-groups-and-local-hecke`, `GeometricSatakeAndFusion:GS0:loop-geometry/congruence-filtration-and-graded-pieces`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | The loop/jet targets include the punctured-loop union, positive-loop closedness and dilatation congruence presentation as source proof steps; representability of general Greenberg functors stays with SF/RG. |
| `PAPER-ZHU-17/G06` | Witt affine Grassmannian — §1.1 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/G07` | Integral torsor description — Lemma1.3 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/G08` | Witt lattices and relative position — §1.2.1, (1.2.1), pp. 415–416 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/G09` | Minuscule lattice quotient criterion — Lemma1.5 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/G10` | Closed relative-position bounds — Lemma1.6 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/G11` | Separated lattice quotient — Corollary 1.7, p. 417 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/G13` | Bounded matrix presentation — Lemma1.9 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` | Finite determinant-jet presentation includes the smooth determinant equation, finite-level torsor, stabilizer J and normalized lifting as its proof; Teichmüller zero-extension is not assumed to be a ring homomorphism. |
| `PAPER-ZHU-17/G14` | Finite-jet stabilizer presentation — (1.2.4)–(1.2.5), Lemma 1.10 and Remark 1.11, pp. 419–421 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` | Finite determinant-jet presentation includes the smooth determinant equation, finite-level torsor, stabilizer J and normalized lifting as its proof; Teichmüller zero-extension is not assumed to be a ring homomorphism. |
| `PAPER-ZHU-17/G15` | Bounded Grassmannian algebraic space — Proposition1.12 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` | The original algebraic-space quotient target uses the finite-jet cover and SF.1 quotient; projectivity is proved through the independent geometric BS determinant argument. |
| `PAPER-ZHU-17/G16` | Demazure lattice-chain space — §1.3.1, (1.3.1), p. 421 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G17` | Projective quotient lifting — Lemma1.14 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G18` | Proper Demazure tower — Proposition1.13 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G19` | First two one-step towers — Remark 1.15, p. 423 (stated without proof; sample calculation in §B.3) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G20` | Proper convolution and scheme fibres — Lemma 1.17, p. 424 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G21` | Open isomorphism of the full ω1 resolution — Lemma 1.18, first assertion, p. 424 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G22` | Connected boundary fibres — Lemma 1.18, second assertion, pp. 424–425 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G23` | Irreducibility and properness of bounds — Corollary1.19 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/G27` | Affine flag Schubert cells — §1.4.2 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Affine flag Schubert geometry uses the separate parahoric Demazure construction and ind-projectivity statement, not spherical-lattice properness without a comparison. |
| `PAPER-ZHU-17/G28` | Affine flag Demazure resolution — §1.4.2 | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Affine flag Schubert geometry uses the separate parahoric Demazure construction and ind-projectivity statement, not spherical-lattice properness without a comparison. |
| `PAPER-ZHU-17/G29` | Ind-properness theorem — Theorem 1.4, p. 415; cf. Theorem 0.1, p. 406 (introduction form for the GL_n lattice functor) | planned | `GeometricSatakeAndFusion:GS0:loop-geometry/affine-flag-demazure`, `GeometricSatakeAndFusion:GS0:Witt-geometry/parahoric-ind-projectivity` | Affine flag Schubert geometry uses the separate parahoric Demazure construction and ind-projectivity statement, not spherical-lattice properness without a comparison. |
| `PAPER-ZHU-17/G31` | General reductive position bounds — Lemma1.22 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness` | General reductive labels and the finite-dimensional orbit projection are obtained from RG Cartan/Lie data and the finite-jet stabilizer calculation; the infinite positive loop group itself has no finite dimension. |
| `PAPER-ZHU-17/G32` | Orbit dimension and finite model — Proposition 1.23, p. 428 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness` | General reductive labels and the finite-dimensional orbit projection are obtained from RG Cartan/Lie data and the finite-jet stabilizer calculation; the infinite positive loop group itself has no finite dimension. |
| `PAPER-ZHU-17/G33` | Orbit projection to the partial flag — (1.4.4) and Corollary 1.24, pp. 428–429 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness` | General reductive labels and the finite-dimensional orbit projection are obtained from RG Cartan/Lie data and the finite-jet stabilizer calculation; the infinite positive loop group itself has no finite dimension. |
| `PAPER-ZHU-17/G34` | Component parity — (1.4.5) and Lemma 1.25, p. 429; pure parity p(A), §2.4.3, p. 448 | requested | `ReductiveGroupsPartII:RG2.4`, `GeometricSatakeAndFusion:GS1/rational-weight-concentration` | Component parity of the root pairing is a reductive combinatorial fact used by rational weight concentration, not a new Witt construction. |
| `PAPER-ZHU-17/Q01` | Quasi-minuscule parahoric resolution — Definition of Q_r and Lemma 2.12, p. 437; proof and the maps φ, φ̊, p. 438 | proof-step | `GeometricSatakeAndFusion:GS1/rational-weight-concentration` | The quasi-minuscule parahoric resolution is the geometric proof input for the zero-weight case; retain its source gap and correct parahoric hypotheses. It is not needed for early generic smoothness. |
| `PAPER-ZHU-17/B01` | Determinant line on a modification chain — §B.1, pp. 482–483, display (B.1.1) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | The geometric determinant and BS projectivity resolve the old determinant-descent conjectures. B.3’s independent basepoint-free implication is a historical alternative; no conjecture is silently assumed. |
| `PAPER-ZHU-17/B02` | Ordinary cohomology injectivity for the resolution — Proposition B.1, first assertion | alternative-not-required | `EtaleDualityAndPerverseSheaves:EDC.7` | Resolution cohomology injection, descended Chern classes and rational IC comparison belong to the alternative appendix/rational route. The chosen geometric determinant proof uses fibre-trivial line descent, not these rational cohomology statements. |
| `PAPER-ZHU-17/B03` | Descended first Chern class — Proposition B.1, second assertion | alternative-not-required | `EtaleDualityAndPerverseSheaves:EDC.7` | Resolution cohomology injection, descended Chern classes and rational IC comparison belong to the alternative appendix/rational route. The chosen geometric determinant proof uses fibre-trivial line descent, not these rational cohomology statements. |
| `PAPER-ZHU-17/B04` | Basepoint freeness implies determinant descent — PropositionB.2 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | The geometric determinant and BS projectivity resolve the old determinant-descent conjectures. B.3’s independent basepoint-free implication is a historical alternative; no conjecture is silently assumed. |
| `PAPER-ZHU-17/B05` | Determinant descent and projectivity resolved subsequently — Footnote 21 (p. 482); Conjecture I (p. 483); Conjecture II (p. 483) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/geometric-determinant-line`, `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | The geometric determinant and BS projectivity resolve the old determinant-descent conjectures. B.3’s independent basepoint-free implication is a historical alternative; no conjecture is silently assumed. |
| `PAPER-ZHU-17/B07` | Canonical weakly normal orbit model — AppendixB.2 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` | The canonical weakly-normal model target includes normalized determinant jets, smooth covers and twisted transition functions, with the normal/Cohen–Macaulay conjecture kept as a conjecture. |
| `PAPER-ZHU-17/B08` | Truncated determinant complete intersection — Lemma B.4 (the locally-complete-intersection assertion) and the first paragraph of the hint after it, p. 484 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` | The canonical weakly-normal model target includes normalized determinant jets, smooth covers and twisted transition functions, with the normal/Cohen–Macaulay conjecture kept as a conjecture. |
| `PAPER-ZHU-17/B09` | Normality of the determinant model — Lemma B.4 (the normality assertion) and the second paragraph of the hint, p. 484 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` | The canonical weakly-normal model target includes normalized determinant jets, smooth covers and twisted transition functions, with the normal/Cohen–Macaulay conjecture kept as a conjecture. |
| `PAPER-ZHU-17/B10` | Canonical models need twisted transition maps — RemarkB.6 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` | The canonical weakly-normal model target includes normalized determinant jets, smooth covers and twisted transition functions, with the normal/Cohen–Macaulay conjecture kept as a conjecture. |
| `PAPER-ZHU-17/B16` | Rank-two quadratic-cone chart — AppendixB.3 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/B17` | Rank-two resolution model — AppendixB.3 p486 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/B18` | Finite Witt matrix factorization — LemmaB.11 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/B19` | Open cone chart and scheme representability — Lemma B.10 (p. 487), the display defining the map just before it, and the note just after it (scheme property); proof pp. 487–488 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/B20` | Rank-two determinant extension — §B.3, final paragraph, p. 488 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/BC3` | Conjecture III (statement only) — Conjecture III | conjecture | `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` | These are appendix conjectures about the nonperfect canonical models, recorded with their exact status; projectivity of the perfect bounds does not prove them. |
| `PAPER-ZHU-17/BC4` | Conjecture IV (statement only) — Conjecture IV | conjecture | `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` | These are appendix conjectures about the nonperfect canonical models, recorded with their exact status; projectivity of the perfect bounds does not prove them. |
| `PAPER-ZHU-17/greenberg-realization` | Greenberg realization (cited black box) — §1.1.1, pp. 412–413 | requested | `SchemeAndStackFoundations:SF.0`, `ReductiveGroupsPartII:RG2.3` | Finite Greenberg realization and smooth model jets are shared foundations. GS evaluates their positive loop functors and uses the congruence filtration. |
| `PAPER-ZHU-17/lemma-1-5-minuscule-relative-position` | Lemma 1.5 (relative position ω_i gives a lattice chain) — Lemma 1.5, pp. 416–417 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/lemma-1-6-semicontinuity-relative-position` | Lemma 1.6 (semicontinuity of relative position; cited) — Lemma 1.6, p. 417 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/cor-1-7-diagonal-closed` | Corollary 1.7 (Gr_{GL_n} has closed diagonal) — Corollary 1.7, p. 417 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/gln-minuscule-coweights-and-order` | 𝕏_•(D_n)^+, ω_i, ω_i^* and the GL_n dominance order — §1.2.1, p. 416 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/gr-leq-mu-strata` | Gr_{≤μ} and Gr_μ for GL_n — §1.2.1, p. 417 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/lattice-lambda-mu-point-p-mu` | The lattice Λ_μ and the point p^μ — (1.2.3), pp. 417–418 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/lemma-1-8-cartan` | Lemma 1.8 (Cartan decomposition for Gr_{GL_n}) — Lemma 1.8, p. 418 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/gr-bar-N-definition` | Gr̄_N, Gr_N and the reduction to Gr̄_N — §1.2.2, p. 418 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-lattice-functor-and-representability`, `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds` | The bounded lattice target and its type API include minuscule quotient tests, chosen standard lattice, equal-degree dominance, Cartan stratification, semicontinuity and separatedness. Cartan theory is imported from RG2.4. |
| `PAPER-ZHU-17/V-N-and-lemma-1-9` | The scheme V_N and Lemma 1.9 — §1.2.2, Lemma 1.9, p. 418 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` | Finite determinant-jet presentation includes the smooth determinant equation, finite-level torsor, stabilizer J and normalized lifting as its proof; Teichmüller zero-extension is not assumed to be a ring homomorphism. |
| `PAPER-ZHU-17/gr-bar-N-h-torsor` | The L^hGL_n-torsor Gr̄_{N,h} — §1.2.2, p. 419 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` | Finite determinant-jet presentation includes the smooth determinant equation, finite-level torsor, stabilizer J and normalized lifting as its proof; Teichmüller zero-extension is not assumed to be a ring homomorphism. |
| `PAPER-ZHU-17/V-N-h-and-stabilizer-J` | V′_{N,h}, V_{N,h}, the stabilizer J and the map Gr̄_{N,h} → V_{N,h} — (1.2.4), (1.2.5), p. 419 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` | Finite determinant-jet presentation includes the smooth determinant equation, finite-level torsor, stabilizer J and normalized lifting as its proof; Teichmüller zero-extension is not assumed to be a ring homomorphism. |
| `PAPER-ZHU-17/lemma-1-10-J-iso-gr-bar-N-h` | Lemma 1.10 (Gr̄_{N,h} is affine) — Lemma 1.10, pp. 419–421 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` | Finite determinant-jet presentation includes the smooth determinant equation, finite-level torsor, stabilizer J and normalized lifting as its proof; Teichmüller zero-extension is not assumed to be a ring homomorphism. |
| `PAPER-ZHU-17/remark-1-11-teichmuller-lift` | Remark 1.11 (normalized lifting) — Remark 1.11, p. 421 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-finite-jet-presentation` | Finite determinant-jet presentation includes the smooth determinant equation, finite-level torsor, stabilizer J and normalized lifting as its proof; Teichmüller zero-extension is not assumed to be a ring homomorphism. |
| `PAPER-ZHU-17/prop-1-12-gr-bar-N-representable` | Proposition 1.12 (representability of Gr̄_N and Gr) — Proposition 1.12, p. 421 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/zhu-original-algebraic-space` | The original algebraic-space quotient target uses the finite-jet cover and SF.1 quotient; projectivity is proved through the independent geometric BS determinant argument. |
| `PAPER-ZHU-17/prop-1-13-gr-mu-bullet-proper` | Proposition 1.13 (Gr_{μ•} is perfectly proper) — Proposition 1.13, pp. 421–423 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/crystal-values-at-perfect-points` | Values x^*𝓔 and 𝓔/p of a locally free crystal — §1.3.1, p. 422 (and p. 415) | requested | `CrystallineCohomology:CR.1` | Evaluation of a locally free crystal at perfect Witt points is owned by crystalline cohomology and supplies the relative Grassmannian construction. |
| `PAPER-ZHU-17/lemma-1-14-grassmannian-of-sublattices` | Lemma 1.14 (sublattices with rank-i quotient form a Grassmannian bundle) — Lemma 1.14, pp. 422–423 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/convolution-map-1-3-3` | Sum of coweights and the map π : Gr_{μ•} → Gr_{≤\|μ•\|} — §1.3.2, (1.3.3), p. 424 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/lemma-1-17-pi-perfectly-proper` | Lemma 1.17 (π is representable and perfectly proper) — Lemma 1.17, p. 424 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/demazure-resolution-gr-tilde-N` | The Demazure resolution G̃r_N → Gr̄_N — §1.3.2, p. 424 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/lemma-1-18-demazure-fibres` | Lemma 1.18 (fibres of the Demazure map) — Lemma 1.18, pp. 424–425 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/cor-1-19-gr-bar-N-irreducible-proper` | Corollary 1.19 (Gr̄_N irreducible and perfectly proper) — Corollary 1.19, p. 425 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-demazure-resolution`, `GeometricSatakeAndFusion:GS0:Witt-geometry/connected-cohomological-fibres` | The lattice-chain construction gives the projective bundle tower, convolution map, open isomorphism and connected/cohomologically trivial fibres. Projective quotient lifting and the first two towers are proof computations, not extra targets. |
| `PAPER-ZHU-17/reductive-relative-position-and-spherical-schubert-varieties` | Relative position and spherical Schubert varieties for split reductive G — §1.4.3, pp. 427–428 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/witt-types-and-bounds`, `GeometricSatakeAndFusion:GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness` | General reductive labels and the finite-dimensional orbit projection are obtained from RG Cartan/Lie data and the finite-jet stabilizer calculation; the infinite positive loop group itself has no finite dimension. |
| `PAPER-ZHU-17/remark-B5-ic-comparison` | Remark B.5: mixed versus equal characteristic Schubert varieties — Remark B.5, p. 484 | alternative-not-required | `EtaleDualityAndPerverseSheaves:EDC.7` | Resolution cohomology injection, descended Chern classes and rational IC comparison belong to the alternative appendix/rational route. The chosen geometric determinant proof uses fibre-trivial line descent, not these rational cohomology statements. |
| `PAPER-ZHU-17/conj-II-from-point-separation` | Conjecture I plus point separation implies Conjecture II — §B.1, paragraph after Conjecture II, p. 483 | proof-step | `GeometricSatakeAndFusion:GS0:Witt-geometry/ampleness-via-keel` | Point separation is part of the semiample contraction/relation comparison. It is supplied by the BS proof rather than importing the unresolved antecedent of the historical implication. |
| `PAPER-ZHU-17/canonical-model-demazure-resolution` | Canonical model \widetilde{Gr}'_N of the Demazure resolution — §B.2, p. 485, first paragraph | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/canonical-witt-models` | The canonical weakly-normal model target includes normalized determinant jets, smooth covers and twisted transition functions, with the normal/Cohen–Macaulay conjecture kept as a conjecture. |
| `PAPER-ZHU-17/V23-witt-description` | Equations for V_{2,3} — §B.3, p. 487, proof of Lemma B.11, (B.3.1) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/functor-W-decomposable` | The functor W ⊂ V_{2,3} and the open locus W̃ — §B.3, p. 487 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/W-tilde-decomposition-claim` | Decomposition claim on W̃ — Proof of Lemma B.11, pp. 487–488, (B.3.2)–(B.3.3) | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/cone-chart-action-map-iso` | The action map U^{p^{−∞}} × L^3GL_2 → V is an isomorphism — Proof of Lemma B.10, pp. 487–488 | planned | `GeometricSatakeAndFusion:GS0:Witt-geometry/rank-two-cone-chart` | The rank-two chart target states the p>2 quadratic cone, blowup model, corrected matrix order and truncated determinant. The adjugate argument proves integrality of a chosen right factor; the typed truncated-Witt existence/jet-torsor comparison and open-chart realization remain obligations, and the factor is neither unique nor lift-independent. |
| `PAPER-ZHU-17/S01` | Semisimple Satake category — §2.1 | planned | `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | Rational equivariant perverse/IC conventions and connected stabilizers are used by the rational special-fibre adapter. General IC and decomposition are imported from EDC.7; the integral FS category is not declared semisimple. |
| `PAPER-ZHU-17/S02` | Satake semisimplicity — Lemma 2.1, p. 430 (the classification of simple objects is in the preceding paragraph of §2.1.1) | planned | `GeometricSatakeAndFusion:GS1/standard-costandard-torsion-bound` | Rational semisimplicity with connected stabilizers is the fixed-bound standard/costandard comparison input, imported through EDC.7 decomposition. Tannakian reductivity and dual-group reconstruction remain targets of the second part; integral Satake is not declared semisimple. |
| `PAPER-ZHU-17/S03` | Twisted convolution product — §2.1 | planned | `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram` | The two-stage target includes twisted multi-step convolution carriers and rational sheaf pull–push; repeated convolution is covered by associativity. |
| `PAPER-ZHU-17/S04` | Semi-infinite orbit and weight functor — §2.2 | planned | `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` | The semi-infinite target includes Iwasawa cover, closure order, attractor coordinates and the nonempty intersection dimension. Braden is imported from VS1. |
| `PAPER-ZHU-17/S05` | Semi-infinite closure order — Proposition 2.5, p. 433 | planned | `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` | The semi-infinite target includes Iwasawa cover, closure order, attractor coordinates and the nonempty intersection dimension. Braden is imported from VS1. |
| `PAPER-ZHU-17/S06` | Semi-infinite product coordinates — (2.2.1)–(2.2.3) and Remark 2.6, p. 434 | planned | `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` | The semi-infinite target includes Iwasawa cover, closure order, attractor coordinates and the nonempty intersection dimension. Braden is imported from VS1. |
| `PAPER-ZHU-17/S07` | MV intersection dimension — Corollary 2.8, p. 434 (proof p. 435) | planned | `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` | The semi-infinite target includes Iwasawa cover, closure order, attractor coordinates and the nonempty intersection dimension. Braden is imported from VS1. |
| `PAPER-ZHU-17/Q02` | Minuscule and quasi-minuscule weight concentration — Lemma 2.11, p. 437 (proof pp. 437–439) | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/Q03` | Zero quasi-minuscule multiplicity — Proof of Lemma 2.11: (2.2.11), p. 438; conclusion p. 439; Remark 2.13, p. 439 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/Q04` | Minimal convolution dimension bound — Corollary 2.14, p. 439 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/Q05` | Minimal convolution is perverse — Corollary2.15 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/Q06` | Generation by minimal objects — Lemma2.16 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/Q07` | Concentration for minimal products — Corollary 2.17, p. 440 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/S08` | General convolution perversity — Proposition2.2 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/S09` | General convolution semismallness — Proposition 2.3, p. 432 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/S10` | Convolution multiplicity cycles — Remark 2.4, p. 432 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/S11` | Weight concentration for all Satake objects — Proposition 2.7, p. 434 (proof sketched in §2.2.3) | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/S12` | Weight cycle basis — Corollary 2.9, p. 435 (proof p. 436) | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/S13` | Total weights equal ordinary cohomology — Corollary2.10 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/T02` | Satake rigidity and neutral structure — §2.5 | planned | `GeometricSatakeAndFusion:GS2:Satake-closure/satake-rigidity`, `GeometricSatakeAndFusion:GS2:correspondences/satake-fibre-functor` | Rigid duals and exact faithful finite-projective cohomology are early targets. A symmetric neutral Tannakian structure also requires the GS3 tensor/symmetry interfaces, so that clause belongs to the other part. |
| `PAPER-ZHU-17/T03` | Rational Tannakian reductivity — §2.5 | other-part | `GeometricSatakeAndFusion:GS4:rational-reductivity`, `GeometricSatakeAndFusion:GS4:dual-group-reconstruction` | Rational semisimplicity, Tannakian reductivity and the dual root datum/geometric Satake equivalence belong to the GS3 part’s GS4 targets. They are not prerequisites of GS0 geometry or VI.8 closure. |
| `PAPER-ZHU-17/T04` | Torus Satake equivalence — §2.5 | other-part | `GeometricSatakeAndFusion:GS4:rational-reductivity`, `GeometricSatakeAndFusion:GS4:dual-group-reconstruction` | Rational semisimplicity, Tannakian reductivity and the dual root datum/geometric Satake equivalence belong to the GS3 part’s GS4 targets. They are not prerequisites of GS0 geometry or VI.8 closure. |
| `PAPER-ZHU-17/T05` | Tensor constant term — Proposition 2.36 and the paragraph after it, p. 454 | other-part | `GeometricSatakeAndFusion:GS3:fusion` | Tensor constant term/its equivariant alternative is a fusion/tensor compatibility statement. GS1 uses only the nonmonoidal normalized CT. |
| `PAPER-ZHU-17/T06` | Dual root datum identification — §2.5 | other-part | `GeometricSatakeAndFusion:GS4:rational-reductivity`, `GeometricSatakeAndFusion:GS4:dual-group-reconstruction` | Rational semisimplicity, Tannakian reductivity and the dual root datum/geometric Satake equivalence belong to the GS3 part’s GS4 targets. They are not prerequisites of GS0 geometry or VI.8 closure. |
| `PAPER-ZHU-17/T07` | Mixed-characteristic rational geometric Satake — Theorem0.3 and§2.5 | other-part | `GeometricSatakeAndFusion:GS4:rational-reductivity`, `GeometricSatakeAndFusion:GS4:dual-group-reconstruction` | Rational semisimplicity, Tannakian reductivity and the dual root datum/geometric Satake equivalence belong to the GS3 part’s GS4 targets. They are not prerequisites of GS0 geometry or VI.8 closure. |
| `PAPER-ZHU-17/dual-group-and-highest-weight-modules` | Dual group Ĝ, B̂, T̂ and the modules V_μ, V_μ(λ) — §0.5, p. 412 (footnote 11: the Tannakian group from the geometric Satake comes with B̂ and T̂) | other-part | `GeometricSatakeAndFusion:GS4:rational-reductivity`, `GeometricSatakeAndFusion:GS4:dual-group-reconstruction` | Rational semisimplicity, Tannakian reductivity and the dual root datum/geometric Satake equivalence belong to the GS3 part’s GS4 targets. They are not prerequisites of GS0 geometry or VI.8 closure. |
| `PAPER-ZHU-17/n-fold-convolution-grassmannian` | n-fold convolution Grassmannian and bounded convolution maps — §2.1.2, (2.1.1)–(2.1.3), pp. 431–432 | planned | `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution`, `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram` | The two-stage target includes twisted multi-step convolution carriers and rational sheaf pull–push; repeated convolution is covered by associativity. |
| `PAPER-ZHU-17/semi-infinite-orbits-locally-closed-iwasawa` | Semi-infinite orbits are locally closed and cover Gr (Iwasawa) — §2.2.1, p. 433 | planned | `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` | The semi-infinite target includes Iwasawa cover, closure order, attractor coordinates and the nonempty intersection dimension. Braden is imported from VS1. |
| `PAPER-ZHU-17/gm-action-attractors-and-opposite-orbits` | The 2ρ^∨ torus action; attracting and repelling semi-infinite orbits — §2.2.1, p. 433 | planned | `GeometricSatakeAndFusion:GS1/semi-infinite-orbits-and-hyperbolic-localization`, `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`, `GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles` | The semi-infinite target includes Iwasawa cover, closure order, attractor coordinates and the nonempty intersection dimension. Braden is imported from VS1. |
| `PAPER-ZHU-17/quasi-minuscule-coweights-and-M` | (Quasi-)minuscule coweights and the set M — §2.2.2, pp. 436–438; §2.2.3, p. 439 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/stabilizer-connected-and-simple-objects` | Connected stabilizers; simple objects of P_{L^+G}(Gr_G) — §2.1.1, p. 430 | planned | `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | Rational equivariant perverse/IC conventions and connected stabilizers are used by the rational special-fibre adapter. General IC and decomposition are imported from EDC.7; the integral FS category is not declared semisimple. |
| `PAPER-ZHU-17/sat0-minimal-convolution-subcategory` | Subcategory Sat^0_G of minimal convolutions — p. 440 (before Lemma 2.16); p. 446 | planned-with-gap | `GeometricSatakeAndFusion:GS1/rational-weight-concentration`, `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | The rational weight target states concentration and the model-dependent rational cycle basis; its proof uses minuscule/quasi-minuscule seeds and minimal-product generation. The special-fibre convolution target covers perversity/semismallness and multiplicity cycles. Minimal generation and trace normalization are explicit refinement gaps, not proof by integral FS flatness. |
| `PAPER-ZHU-17/parahoric-coefficient-rings` | Equivariant coefficient rings of parahorics — §2.3.2, (2.3.3), p. 442 | alternative-not-required | `GeometricSatakeAndFusion:GS3:fusion` | Equivariant coefficient-ring base change belongs to the alternative rational monoidality proof. It is not necessary for the selected FS VI.1–VI.8 route. |
| `PAPER-ZHU-17/equivariant-to-ordinary-cohomology` | Ordinary cohomology as base change of equivariant cohomology — p. 443, before Proposition 2.20 | alternative-not-required | `GeometricSatakeAndFusion:GS3:fusion` | Equivariant coefficient-ring base change belongs to the alternative rational monoidality proof. It is not necessary for the selected FS VI.1–VI.8 route. |
| `PAPER-ZHU-17/normalised-intersection-cohomology` | Normalized (equivariant) intersection cohomology — p. 442 (proof of Lemma 2.19); p. 448 (§2.4.4); p. 450 | planned | `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | Rational equivariant perverse/IC conventions and connected stabilizers are used by the rational special-fibre adapter. General IC and decomposition are imported from EDC.7; the integral FS category is not declared semisimple. |
| `PAPER-ZHU-17/equivariant-constant-term-monoidality-method` | Monoidality of CT via T̄-equivariant cohomology (cited method) — Proof of Proposition 2.36, p. 454 | other-part | `GeometricSatakeAndFusion:GS3:fusion` | Tensor constant term/its equivariant alternative is a fusion/tensor compatibility statement. GS1 uses only the nonmonoidal normalized CT. |
| `PAPER-FARGUES-SCHOLZE-21/c6a-etale-over-divisor-lemma-VI.1.13` | Separated étale maps over D_S come from S (Lemma VI.1.13) — Chapter VI, §VI.1, Lemma VI.1.13, p. 196 | planned-with-gap | `GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor` | The current issue explicitly routes this previously implicit auxiliary lemma. It now has its own complete mathematical contract and proof route, with precise RF/diamond supplier dependencies and an exact-name geometric signature omission until those interfaces exist. |
| `PAPER-FARGUES-SCHOLZE-21/c6a-lattice-relative-position-semicont-VI.3.2` | Semicontinuity of relative position of rank-1 lattices (Lemma VI.3.2) — Chapter VI, §VI.3, Lemma VI.3.2, p. 203 | planned-with-gap | `GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity` | The current issue explicitly routes this previously implicit auxiliary lemma. It now has its own complete mathematical contract and proof route, with precise RF/diamond supplier dependencies and an exact-name geometric signature omission until those interfaces exist. |
| `PAPER-FARGUES-SCHOLZE-21/c6a-length-semicont-VI.3.3` | Semicontinuity of length of B⁺_s/f (Lemma VI.3.3) — Chapter VI, §VI.3, Lemma VI.3.3, p. 204 | planned-with-gap | `GeometricSatakeAndFusion:GS1/length-semicontinuity` | The current issue explicitly routes this previously implicit auxiliary lemma. It now has its own complete mathematical contract and proof route, with precise RF/diamond supplier dependencies and an exact-name geometric signature omission until those interfaces exist. |

## Proposed structure and upstream observations

These are proposals and observations for the maintainer. This job changes only its own packet, reader, suggested file and revision handoff.

- **rescope — GeometricSatakeAndFusion, SchemeAndStackFoundations:** Make SF0/SF1 the single owner of perfect pfp models/effective quotient and boundary pinching theory, SF3/SF4 the owner of general bundle descent and SF5 the owner of all general positivity/Keel theory. GS0:Witt-geometry owns their determinant-line and projectivity application. Remove the old text “sub-obligation here” and add the supplier edges. RF2’s finite-thickening descent is imported; RF4 must supply its separate completed-module algebraization and Tannakian torsor transfer.

- **rescope — GeometricSatakeAndFusion, AdicCoefficientsAndComparisons, EtaleDualityAndPerverseSheaves, VStackSheavesAndLisseCategories:** GS0 imports L1 scheme diamondification and D6 pre-adic diamondification/topological comparison; do not declare nonanalytic v-sheaves diamonds without an additional representability theorem. GS1 imports early L1/L3 and EDC5 perversity/recollement. Drop EDC4 and VS3 lisse-category prerequisites here. EDC7 appears only in rational standard/costandard torsion refinement; it does not precede GS0 smoothness.

- **rescope — GeometricSatakeAndFusion:** Reverse the atlas edge GS3:fusion→GS2:Satake-closure. FS VI.8.1–VI.8.2 prove closure and duals first; VI.9 then uses dualizability. VI.8.1(ii) uses an elementary two-leg collision family, which is explicitly planned here, but not VI.9’s coherent symmetric fusion. Keep GS2:correspondences before closure and closure before GS3; generic bounded properness and integral Witt properness remain distinct targets.

- **rescope — SchemeAndStackFoundations, RelativeFarguesFontaine, VStackSheavesAndLisseCategories, EnhancedDerivedSheaves, ReductiveGroupsPartII:** Refine existing supplier directions by the exact requests in this packet. In particular Scheme and stack foundations, Part II: perfect models, pinching and integral local-model functoriality extends SF0/SF1/SF4; Relative Fargues–Fontaine, Part II: punctured A_inf torsors extends RF4; V-stack sheaves and lisse categories, Part II: hyperbolic localization and proper relative ULA kernels extends VS1; Enhanced derived sheaves, Part II: coherent kernel correspondences extends E3/E5; Reductive groups, Part II already owns parahoric/affine-root and adjoint comparisons. These are extensions of the named owners, not new GS-owned general theories.

- **Mathlib/RingTheory/Perfection.lean at 082e2d3:** The existing Perfection carrier is the inverse limit under Frobenius; Zhu/BS coordinate perfection is the direct colimit. This is a baseline distinction for the maintainer, with no requested edit to an upstream Tau Ceti roadmap.

- **TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean at f790474:** ReductiveAffineGroupSchemeCat is field-based. Integral reductive/parahoric models used here require the proposed RG2.3 extension; no change to an upstream roadmap is proposed.

- **Existing ReductiveGroups layers 2 and 7; proposed RG2.1 versus RG2.5:** Absolute Lie/adjoint, root and parabolic theory is already planned upstream and imported. RG2.1 owns the relative/integral weight compatibility refinement; RG2.5 owns the integral dual group. The base GS0 supplier edge to RG2.5 should not be read as supplying cell stabilizer geometry. No upstream file is edited.

## Suggested-file validation and revision limits

The full suggested file was not compiled: no existing build has both recorded
pins. No library build or cache was created. On 2026-10-08 this independent review
ran `lean-check` on a Mathlib-only projection of this revision at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; it passed with only `sorry` warnings.
The projection removed the Tau Ceti import and the entire
`geometric-determinant-line` and `h-descent-and-fibral-criterion` node blocks.
Those blocks, the full file, and all omitted geometric hypotheses remain
unvalidated by that check.

The suggested file retains the accepted algebraic and categorical cores and makes
the remaining geometric boundaries explicit. Newly added source lemmas reserve
their exact declaration names and state their missing supplier interfaces instead
of introducing ungrounded proposition-valued carriers. Structural validation checks
the packet, dependencies, names and synchronization; full pinned Lean elaboration
remains a follow-up task once the required environment and interfaces exist.

## Revision record

job: BP-GeometricSatakeAndFusion--GS0~2; issue: 7303; date: 2026-10-07; agent: ChatGPT GPT-6 Astra Pro; session: gpt6astra-e19d65722997; inputCommit: 4689b245047bbf5817d9304ec7fff6b98f19ab31; preserved: All 59 inherited node IDs and their relative order, the historical top-level review, E1–E22 identities and mathematical corrections, and every historical source review. Source assertion descriptions are paraphrased to follow the superseding source-presentation rule adopted in main22f67751dcda86cd61c81a2213b5557123eab845.; newTargets: GeometricSatakeAndFusion:GS0:loop-geometry/etale-over-divisor; GeometricSatakeAndFusion:GS1/lattice-relative-position-semicontinuity; GeometricSatakeAndFusion:GS1/length-semicontinuity; changes: Synchronized the entire reader with the packet, including hypotheses, proof steps, dependencies, API, tests, coverage, baseline, requests, gaps and source findings.; Corrected the Witt right-factor lift claim and distinguished the full-lift unit determinant from the truncated Teichmüller equation; added a finite stabilizer regression.; Made the inherited perfect-complex/nonprojective-cohomology regression a named packet/reader test.; Corrected precise source scopes, labels and source attachments; supplied the actual ULA diagonal-duality proof and finite-filtration parity degeneration.; Imported existing VS1 hyperbolic and relative-ULA calculus nodes directly; narrowed the request to bounded Artin Hecke-chart transport and filtered ordinary-cohomology continuity.; Recorded new published-source finding E23 with its IC-shift correction, minuscule counterexample, exact version and bounded correction search.; Updated the nine rank-two route explanations to agree with the chosen-factor integrality proof and the remaining typed quotient/open-chart obligations.; validationLimit: No existing pinned build or full declaration index is available. No Lean compilation, library build, cache setup or LSP was performed. Prior projection checks remain historical.; correctedRouteReasons: PAPER-ZHU-17/B16; PAPER-ZHU-17/B17; PAPER-ZHU-17/B18; PAPER-ZHU-17/B19; PAPER-ZHU-17/B20; PAPER-ZHU-17/V23-witt-description; PAPER-ZHU-17/functor-W-decomposable; PAPER-ZHU-17/W-tilde-decomposition-claim; PAPER-ZHU-17/cone-chart-action-map-iso; concurrentProtocolUpdate: commit: 22f67751dcda86cd61c81a2213b5557123eab845; date: 2026-10-07; scope: PROTOCOL§5/§18 now require statements in our own words, no excerpt fields or copied source prose; incorrect formulas may be recorded as mathematics. The concurrent GS0 packet change only deleted excerpts. This revision adopts that change and paraphrases source-assertion descriptions while preserving mathematical content, IDs and historical reviews.; removedSourceFields: 130; paraphrasedSourceFields: 39; sourceIssuesWithPresentationChanges: GeometricSatakeAndFusion/E1; GeometricSatakeAndFusion/E5; GeometricSatakeAndFusion/E6; GeometricSatakeAndFusion/E8; GeometricSatakeAndFusion/E9; GeometricSatakeAndFusion/E11; GeometricSatakeAndFusion/E13; GeometricSatakeAndFusion/E14; GeometricSatakeAndFusion/E16; GeometricSatakeAndFusion/E21; GeometricSatakeAndFusion/E22; GeometricSatakeAndFusion/E2; GeometricSatakeAndFusion/E15; GeometricSatakeAndFusion/E17; GeometricSatakeAndFusion/E3; GeometricSatakeAndFusion/E4; GeometricSatakeAndFusion/E7; GeometricSatakeAndFusion/E10; GeometricSatakeAndFusion/E12; GeometricSatakeAndFusion/E18; GeometricSatakeAndFusion/E19; GeometricSatakeAndFusion/E23

## Current independent review

Accepted by Codex, session `codex-QiJw0o`, job `REV-GeometricSatakeAndFusion--GS0~2`, on 2026-10-08. All 62 nodes have individual verdicts: 58 verified and 4 corrected. The review checks all 30 pinned baseline declarations, eight public source versions, 79 direct supplier prerequisites, 23 requests, 73 API items, 72 tests, 25 planets, all eight planned stages and the six supplied red-team findings. The 24 source issues are individually confirmed with their stated qualifications. The full pass retains 10 explicit gaps and no closed stage. Every implementation status is unchecked. Exact audit extents, source hashes, corrections and the full-file Lean limit are recorded in the companion [review report](../reviews/REV-GeometricSatakeAndFusion--GS0~2.md).
