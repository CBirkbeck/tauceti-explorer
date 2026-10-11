# Handoff: BP-PeriodsAndSpecialValues--PS.8

Issue #1035; Codex (GPT-6), session codex-ILKXck; 11 October 2026.
This submission completes one target-level blueprint pass for exactly PS.8 and
PS.9. It is ready for independent review. It is not an implementation or a claim
that the roadmap is closed.

The packet has 40 nodes: 13 constructions, 8 definitions, 18 theorems and one
comparison. Its 21 definitions/constructions have 63 API items and 63 unit tests.
There are six planets in each layer, 19 checked baseline declarations, nine
supplier requests, four gaps and two source corrections. Both coverage records
are `planned`; neither is `closed`. Every implementation status is `unchecked`.

The definitive reader is
[PeriodsAndSpecialValues--PS.8.md](../readmes/PeriodsAndSpecialValues--PS.8.md).
Its statements, conventions, APIs, tests, sources and acceptance conditions agree
with the [packet](../packets/PeriodsAndSpecialValues--PS.8.json).
The [suggested file](../suggested/PeriodsAndSpecialValues--PS.8.lean) gives typed
core prototypes, with unavailable supplier-dependent conditions identified by
name as PROTOCOL section 13 requires.

## What the pass establishes

PS.8 has the explicit resolved quartic model, residue normalization, corrected
Picard–Fuchs pullback, integral marking and based-loop monodromy, Frobenius
solutions, symmetric square, local continuation, normalized mirror coordinate,
modular relation and coefficient-integrality route. The quintic route specifies
the invariant summand, formal connection, normalized Dwork operator, exact
coefficient convolution and boundary matrix. It separately identifies the
unproved integral crystalline and limiting-lattice transport. A formal C_p basis
is never declared an integral lattice.

PS.9 fixes descending indices and largest-time-first integral words, both
product multiplicities, tangential polynomial extensions and their comparison.
It specifies the actual mixed-Tate category over Z, path torsor, largest stable
ideal, period map, coaction, f-alphabet embedding and dimension bound, joint
derivation kernel, ordinary and motivic one-three evaluations, free Hoffman
word spaces, cut matrix, dyadic determinant argument and motivic basis. Applying
the period map gives numerical spanning. Numerical independence, general period
injectivity, completeness of double shuffle and the proposed quintic p-adic
L-value formula are not proved claims or premises.

Backward chains terminate in checked baseline declarations, this packet's
targets, read supplier nodes, requested stages or the named gaps. The current
TauCetiRoadmap main and Tau Ceti library were screened read-only, including the
roadmaps newer than the atlas snapshot. No existing target is re-planned.
Completed ContourIntegration and HodgeStructures supplied roadmap/API style.
The actual MC.6 neutral-Tannaka-reconstruction node is used, rather than
substituting its diagram-specific reconstruction node. RS-13 is accepted and
leaves PS.8 and PS.9 intact. No tier-dependent ownership move is proposed.

## Where a follow-up must resume

1. **G1, quintic comparison:** prove the homogeneous/projective comparison on
   the actual overconvergent/completed complex, identify normalized Dwork
   Frobenius with rational crystalline Frobenius and its pairing, establish
   invariant torsion-freeness, construct a semistable/log model at λ=0, and
   compare its extension with the formal one. Specify the transported lattice
   and change of basis. Schwarz–Shapiro explicitly leaves the full crystalline
   identification unproved; matching differential equations is insufficient.
2. **G2, convergence:** establish quantitative p-adic estimates for both
   factorial-weighted Dwork sums, including the double harmonic weight. The
   chosen Shapiro version asserts convergence and refers to work in
   preparation. The boundary calculation retains actual convergence premises.
3. **G3, motivic stuffle:** compare Soudères's relative-cohomology frames with
   Brown's path generators, preserving frames, and prove the tangential
   leading-one extension in that presentation. Numerical identities cannot
   replace this comparison. This remains a PS.9 proof obligation.
4. **G4, geometry:** obtain a reusable relative finite-quotient/A3-resolution
   interface from a geometry owner, then verify the explicit quartic family
   through it. Hartmann gives the family-specific construction. MC.2 supplies
   realizations and is not a generic resolution theorem.

The packet proposes source-qualified geometry and Dwork-comparison additions;
it does not claim those results already belong to existing stage statements.
No stage can be marked closed before its corresponding gaps and supplier
conditions have been discharged.

The nine requests are recorded in the packet, not sent as new GitHub jobs:

- **MC.2:** realization and pairing for the selected models and group actions.
- **CR.7:** proper-smooth crystalline finiteness, Frobenius and invariant
  projector, with the torsion-freeness hypotheses made explicit.
- **CR.5:** log-crystalline realization on the proved boundary model.
- **CR.6:** semistable comparison respecting extension, residue and pairing.
- **ModularCurvesPartII:R13.3:** integral normalized j-expansion together with
  its analytic Schwarzian comparison. The latter must come from uniformisation
  R12.1 or a precise addition; a formal cusp expansion does not supply it.
- **BorelRegulators:R.3:** the rational K-groups needed for Beilinson–Soulé and
  the particular Tate Ext computation.
- **BorelRegulators:R.4:** the regulator injection used in DG Proposition 2.14.
- **MC.4:** Tate-generated motives, motivic cohomology/Adams K-theory and the
  relative framed motives used in the stuffle comparison.
- **NC.2:** generic unipotent groupoids, truncations, tangential points and bar
  comparison. Only the three-punctured mixed-Tate specialization is owned here.

PS.0 and PS.2 are imports from the other part of this same roadmap. The confirmed
finding RT-AREA-iwasawa-3/8 concerns PS.2 and is handled here by requiring its
localized algebra P_eff[L⁻¹], L↦2πi and evaluation of L⁻¹. This part does not
re-plan PS.2. Its worker must supply the Tate unit/inverse and rank-one Laurent
torsor tests. The added Boxer–Calegari–Gee–Pilloni PS.1 interface and Liu et al.
PS.6 interface are also outside this part; they remain with their owning part.

## Source corrections and precise arithmetic checks

**E1:** Hartmann Proposition 4.26/Example 4.27, PDF p.21, reverses the period
rescaling. The correct pullback is (1−t⁴)/64 times D_t followed by multiplication
by 1/t; hypergeometric periods are t times raw periods. The packet gives all
four derivative coefficients and a constant-input countercheck. Exact rational
checks on Laurent monomials agreed with the expanded identity.

**E2:** Hartmann Theorem 4.28, PDF p.22, uses the wrong upper pair for U₁ in
1−t⁴. Nagura–Sugiyama formula (26), p.9, already gives the correct (1/8,1/8).
The U₂ pair (5/8,5/8) is correct and is retained. The first regular coefficient
is 1/32. The square-root sign change gives the required reflection. The packet
records the checked versions and correction searches without source excerpts.

Scratch computations used exact rational arithmetic to verify all five Gram
isometries, M∞M₄M₃M₂M₁=1, maximal nilpotence index three, and the first four
mirror coefficients. They also checked the descending one-three coefficients:
ζ(2,3)=−2ζ(3)ζ(2)+(9/2)ζ(5) and
ζ(3,2)=3ζ(3)ζ(2)−(11/2)ζ(5). These checks verify conventions and computations;
they do not prove the geometric or motivic comparison theorems.

## Lean elaboration and remaining signature conditions

The suggested file was elaborated with `lean-check` in the shared pinned build:
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. It finished successfully; every warning
was a declaration using `sorry`. Memory was checked before compilation.
No language server or library build was started.

Elaboration validates the stated core types, not the omitted full conditions.
The names present only as explicit omissions are:

- Geometry/period interfaces: `quartic_group`, `quartic_residue_invariant`,
  `quartic_residue_period`, `quartic_picard_fuchs`, `quartic_marking_transport`,
  `quartic_frobenius_analytic`, `quartic_mirror_period`,
  `quartic_modular_relation`, `quintic_invariant_projector`,
  `quintic_smooth_locus`, `dwork_monomial_reduction`, and
  `quintic_crystalline_comparison`.
- Category/path interfaces: `mzv_iterated_polylog`, `mtz_unramified`,
  `mixed_tate_galois`, `mzv_path_word_coordinates`,
  `mzv_path_betti_comparison`, and `mzv_coaction_cuts`.
- Exact cut entries and dyadic normalization: `hoffman_matrix_entry` and
  `hoffman_matrix_leading`.

The invariant-rank and family-semilinearity tests likewise need the geometric
cohomology objects. Other geometric tests have explicit polynomial, matrix or
chart cores. The typed mixed-Tate objects and f-alphabet require their stated
category/Hopf identifications; the typed D_r maps require their actual
indecomposable/coaction identification. Partial monodromy, continuation and
Frobenius signatures retain their missing geometric conditions in comments.
No opaque proposition or assumption equal to a desired conclusion substitutes
for these conditions. The complete mathematical requirements are in the reader.

All packet definition, API and test names are represented in the suggested
file, with these omissions distinguished from declarations. The next
implementation/prototyping pass must add the conditions using the suppliers'
actual objects, preserving the reader's hypotheses and normalizations.

## Sources and validation

All eleven public sources were accessed on 11 October 2026. Versions, hashes,
read sections and page conventions are recorded in the reader's source table
and the packet. The checked mathematics comes from Hartmann; both Lian–Yau
preprints; Shapiro and Schwarz–Shapiro; Ihara–Kaneko–Zagier;
Deligne–Goncharov; Brown; Zagier; Soudères; and Nagura–Sugiyama. DG locators use
printed pages, two less than PDF page numbers. Brown uses the 19-page arXiv v1,
not Annals pagination. The quartic modular relation is Lian–Yau's arithmetic
preprint **section 5.5**, equation (5.19). Its prime-degree theorem is not applied
to degree four. Soudères's mathematical text was also checked in the ar5iv
rendering of v3 because the downloaded PDF's text extraction is defective.

No necessary source was inaccessible. The missing items are the four specified
proof/interface obligations, not permission to use another book copy. No book,
PDF, extracted passage or source-by-source synopsis is committed. An alternative
Vologodsky comparison was screened and not used as an unconditional bridge: its
stated motivic-vanishing/compatibility assumptions would not discharge G1.

Validation: `scripts/check_blueprint.py` reports zero errors and zero warnings,
including validation against the pinned declaration index. All definition and
construction nodes have three tests; all named prototypes/omissions are
represented; exact arithmetic checks passed; `git diff --check` passed. The
scratch sources and logs are disposable after submission. This note, the
reader's version table, and the packet retain everything needed to resume.
