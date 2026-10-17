# Independent package review: étale duality, cycle classes and perverse sheaves

**Verdict: accepted after the corrections below.** Issue #10165; Codex,
session `codex-C6qk1G`, 2026-10-17. The package author was Codex session
`codex-j3C1Td` (#10160). This reviewer did not write that package. This is the
single fixing package review, not a claim that the proposed theorems have been
formalized. No accepted packet was edited.

## Coverage and form

Read WORKERS.md, PROTOCOL.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md and the
source-faithfulness rules in expansion/PROTOCOL.md. Read the entire package
README, Suggested.lean, metadata, accepted inputs and package handoff. The two
snapshot README models were JacobianChallenge and AlgebraicTopology; current
AlgebraicVectorBundles, RealAlgebraicGeometry and JacobianChallenge supplied
additional README/signature models. The package has its summary, boundaries,
conventions, supplier contracts, ordered layers, APIs, Checks, worked examples
and source locators. The source statements are in the author's own words;
there are no reproduced source passages or section-by-section source summaries.

The five accepted packets contain 227 unique nodes: 52 in EDC.0, 25 in EDC.4,
29 in EDC.5, 7 in EDC.6 and 114 in EDC.7. Independently compared their ids with
the complete disposition table in `handoff/PKG-EtaleDualityAndPerverseSheaves.md`:
each occurs once, with 138 retained and 89 imported. Checked that retained
subsection destinations exist and read their statements, hypotheses, API and
Checks. All 35 retained input definition/construction nodes have at least three
discriminating Checks; the additional product-duality and supported-Betti
closure interfaces have their own hypotheses and controls too. Imported
material remains in the supplier contracts rather than new target stubs.

Suggested.lean is 417 lines with 11 light, real-bodied definitions, native
Mathlib carriers and no sorry-defined data. The closing comment accounts for
the heavy README-only geometric and enhanced constructions. It does not try
to develop missing theories inside the suggested file. Replaced two scalar
power tautologies by four tests of the actual Euler sum and determinant
product. The README now records the same numerical controls.

## Corrections applied

1. **Intersection-complex duality (§2.10).** Made self-injectivity explicit in
   the finite-coefficient duality statement and corrected the target of a
   perfect self-pairing from Λ(−d) to Λ(d). Added an arithmetic affine-plane
   control: IC of Qℓ(1) is self-dual in dimension two, whereas Qℓ(−1) has dual
   IC Qℓ(3)[2]. The Frobenius structures distinguish the two twist signs;
   forgetting them would lose the test. The rational control explicitly uses
   the coefficient extension of §3.1.
2. **Relative hard Lefschetz (§5.8).** Restored the smooth pullback shifts
   [d] on the largest subobject and quotient coming from the base. These are
   perverse objects after u*[d], rather than after unshifted pullback.
3. **Restricted specialization (§5.9).** Specified the nonempty residual
   constituent family at a point. Separated transport of the constant object
   on P¹ from pushforward along its structural map: the latter lives on the
   base point and has H⁰ = Zℓ, H² = Zℓ(−1), with other degrees zero.
4. **Frobenius contraction (§6.5).** Specified the reduced scheme structure
   on the closed subset used in ram(c₂,Z), consistent with the actual
   ramification definition. The strict inequality qⁿ > ram(c₂,Z) is retained.
5. **Correspondence maps (§§7.2, 7.4, 7.5).** Restored the superscripts in
   c₁^*F → c₂^!F and g^*F → F; these are pullback/exceptional-pullback maps.
6. **Supplier closure (§§3.8–3.9 and the opening contracts).** Replaced stale
   ClassicalAdicEtaleCohomology H3/H5 identifiers with its actual §§9.3–9.6,
   8.2 and 11.1–11.2, including named GeneralSmoothTrace and
   AnalyticFirstChernClass targets. The curve-duality reference now points
   to §9.2. Removed §3.9's redundant prerequisite on itself and repeated
   coefficient-supplier entries. Added versioned bibliography entries for
   ClassicalAdicEtaleCohomology and AdicCoefficientsAndComparisons. Replaced
   the remaining request wording in the nonproper Betti proof by a local
   proof instruction with its existing BBD source.
7. **Existing weight owner.** Explicitly identified the weight supplier as
   the existing TauCetiRoadmap.DeligneWeightsAndPurity document at its
   versioned upstream commit. Its scalar/lisse/absolute-Lefschetz results
   remain imports; the package retains the relative and perverse refinements.
8. **Source and tests.** Corrected ECD Propositions 27.5–27.7 to pp.166–167
   (p.168 starts the bibliography). Added χ = 0 for zero ranks, χ = 1 for
   three rank-one degrees, Δ = 10/3 for scalar maps 2,3,5, and the degree-zero
   Δ = q endpoint. The scalar triple is explicitly only a numerical test,
   not a claimed geometric duality example. Also repaired stray punctuation.

## Sources independently opened

No locator was flagged unverified by the package author. For the required
random sample, enumerated in original README order the 138 lines starting
`Use [` and used `random.Random(10165).sample(citations, 15)`, then sorted by
original line number. The original README git blob starts `8f66ba4b4`.
Each sampled source was opened at the stated page, rather than accepted from
a bibliography entry. Printed/manuscript pagination is used below.

| Original line | Locator read | Result |
|---|---|---|
| 777 | Deligne, Weil I (2.4), p.281 | Integral torsion duality and the relevant degree conventions agree. |
| 928 | Yu, arXiv:1807.04659v5, §6.1, equations (6.1.1)–(6.1.2), p.42 | Curve pairing passage located; the package correctly keeps the dual in the contravariant Hom position. |
| 1329 | BBD 1.3.4, p.30; Theorem 1.3.6 and proof, pp.31–32 | Heart, kernels/cokernels and abelianity proof located. |
| 1955 | BBD 4.0 examples, p.102; Lemma 4.3.2, pp.112–113 | Noetherian coefficients and the noetherian perverse conclusion located. |
| 2141 | BBD 4.2.2–4.2.4, p.108 | Affine morphism exactness and related bounds located. |
| 2386 | BBD 1.4.22–1.4.25, pp.54–55; 2.1.7, pp.58–59; 2.1.9, p.59; 2.2.12, pp.70–71 | Intermediate extension, the displayed product convention and geometric refinements located. |
| 2917 | Bhatt–Scholze, arXiv:1309.1198v2, 6.6.11, p.54; 6.7.1–6.7.2, p.55; 6.8.14–6.8.15, pp.61–62 | Normalization, coherent constructibility and rational coefficient descent located. |
| 3659 | Huber 3.7.2/3.8.1, pp.226–228; 5.7.2/5.7.5, pp.316–318; 7.3.4, pp.378–382; 7.5.3/7.5.4(ii), pp.390–392 | Read in the maintainer-cleared book, in place. The proper-support, smooth-duality and residue-characteristic restrictions are retained. |
| 3725 | Scholze, ECD dated 14 April 2026, 27.1–27.4, pp.163–165; 27.5–27.7, pp.166–167 | Located the comparison/full-faithfulness range. Corrected the final page from 168 to 167; no unconditional exceptional-image assertion follows. |
| 4129 | Weil I (5.7), p.292; Stacks Tag 0EKE, Morphisms Lemma 29.44.18 | Hyperplane input and affine complement located; use is the forward implication for a finite pullback. |
| 4541 | Weil I §7, p.299; Milne LEC v2.21, §33, proof of Lemma 33.2, p.194; LPV §§3.3–3.5 | Complete-intersection route located; the pencil supplier handles the good member and small-dimensional cases. |
| 5438 | BBD Theorem 5.3.8, p.138; Weil II (3.4.1)(iii), p.207 | Geometric semisimplicity located; arithmetic Frobenius Jordan blocks remain permitted. |
| 5886 | BBD 5.4.11–5.4.13, pp.145–146 | Universal-hyperplane subobject/quotient argument located; restored its shifted pullbacks. |
| 5995 | BBD 5.4.10, p.144; 6.2.10, p.165; de Cataldo–Migliorini, arXiv:0712.0349v2, Remark 3.1.12, p.38 | Absolute/complex semisimplicity and geometric-origin conclusion located. |
| 7591 | Weil I (2.4), (2.6), pp.281–282; Milne LEC v2.21, 27.13–27.14, p.159 | Pairing multiplier, determinant relation and reciprocal factors located. |

The public editions are those linked in the package bibliography: Numdam
BBD and Weil I/II, the stated arXiv versions, the author's current ECD PDF,
Milne v2.21 and the Stacks tag. Milne was readable through the web reader
although a direct download returned HTTP 406. Huber was read only in the
cleared library; no copy or extracted passage was saved. Also checked
Varshavsky's closed-subset ramification definition (2007, §2.2), the 2023
finite-jet correction used by the package, and the actual supplier interfaces
listed below. No sampled claim remains unsourced.

## Dependencies, ownership and library checks

The reviewed library audit was read before the ownership pass. Read the
relevant declarations, not just search hits, at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. These include the t-structure heart
and truncations, the abelian-subcategory criterion, derived homology,
adjunction counit/essential-image criterion, dual-map determinant and inverse
characteristic-polynomial formulas, and Tau Ceti's rank-two similitude,
Gram-matrix determinant and finite-product trace statements. In particular,
the abstract heart is not already supplied as an abelian instance at the pin;
the finite-product trace has field coefficients; and the counit criterion
requires the full and faithful left adjoint, not an arbitrary adjunction.

The current read-only roadmap checkout was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object/hypothesis searches covered
all nine newer roadmap directions, their relevant README/Suggested passages,
and Completed/*. The comparisons include vector-bundle Chern/duality APIs,
real de Rham duality, integral lattice pairings, local Galois duality,
Hilbert-space orthogonality, orthogonal isometries and completed Hodge
Lefschetz theory. None supplies the package's extra étale/perverse carriers
or its general bilinear similitudes. No additional target needed removal.

Confirmed the existing current-library boundaries: `Module.Baer.zmod_self`
handles Z/n self-injectivity, not all DVR quotients; the finite Z/n double-dual
API does not replace the general Noetherian self-injective evaluation target;
`LinearMap.BilinForm.IsAlt.even_finrank` supplies alternating parity, not the
self-paired primary-space determinant signs. The package already imports
these facts and distinguishes the retained variants. Existing ownership
removals (89 imports) are unchanged; no ownership move was introduced.

Read the consumed interfaces of the following existing upstream documents.
Their full versioned links are in the package bibliography.

| Supplier | Upstream PR | Version inspected |
|---|---|---|
| EtaleCohomologyFoundations | 938 | `c4ee54f4b3b32173235ff75fa9db736daecb66fe` |
| EnhancedDerivedSheaves | 908 | `b3ea60e3efc3bd4a0b541fb54469dcbf88772064` |
| ClassicalAdicEtaleCohomology | 875 | `e36805f4bbf96f644034fbc220ab0607a15ace83` |
| ComplexComparisonPartII | 848 | `d6cb0fc8f2ef059d222be2503f8e99285293111a` |
| LefschetzPencilsAndVanishingCycles | 873 | `4c7deab75898820bcc1fedd1db4df1010cfc2303` |
| DeligneWeightsAndPurity | 929 | `5f713c436ee303ceb25938d815e236b1a2c3d09a` |
| AdicCoefficientsAndComparisons | 965 | `4a7b4d83e2622df066e2a883525bb755bce6b115` |

The apparent higher atlas tier of DeligneWeightsAndPurity does not authorize
replanning its existing upstream targets: PROTOCOL §15 explicitly treats open
TauCetiRoadmap PRs as existing roadmaps. The corrected contract points to that
upstream owner, not an upward atlas stage. Its scalar, lisse and absolute
Lefschetz inputs are distinguished from this package's perverse and relative
conclusions. No FoundationsAndLibraryIntegration or UPSTREAM placeholders
remain. Local construction order is coefficient/abstract calculus before
comparison and applications; the redundant self-prerequisite was removed.

## Adversarial mathematics pass

Read every retained statement, identity, definition, convention and proof
route. This table groups the checks by package subsection; each row covers
its defining objects and theorem/API claims, not only its heading theorem.
An unchanged row means the required restrictions or controls were already
present and were retained.

| Statements | Instances and failure modes tried | Disposition |
|---|---|---|
| §0.1 self-injectivity and evaluation | Z/4 with its nonprojective Z/2 module; ramified and equal-characteristic DVR quotients; zero module | No projectivity assumption introduced; positive quotient exponent retained. |
| §0.2 all-constructible duality, finite-Tor products | Nonprojective torsion stalk versus finite-Tor tensor input; zero complexes | All-constructible self-injective biduality separated from finite-Tor product comparison. |
| §§0.3–0.4 flat traces | Identity/empty fibres, nonreduced lengths and purely inseparable degree | Trace multiplicities are lengths, not just numbers of geometric points. |
| §0.5 global duality | Spec Fq versus a separably closed point; P¹; torsion complexes | Relative Galois-module statement separated from the false arithmetic absolute variant. |
| §0.6 integral duality | Zℓ/ℓ and the Ext term in complementary degree; vanishing extremes | Ext index and torsion-sensitive pairing retained. |
| §0.7 curve direct images | Proper smooth curve, point fibres and self-injective nonfield coefficients | Hom direction and (−d) twist checked; supplier section corrected. |
| §1.1 semi-purity and cycles | Smooth divisor, singular support, multiplicities and transverse pullback | Smooth ambient hypotheses and supported class degree/twist retained. |
| §1.2 Chern classes | Trivial bundle, line bundle and projective bundle for a line L | With ξ = −c₁(L), the relation and signs agree. |
| §1.3 Chow classes | Principal divisor, proper degree and intersection with Tor multiplicities | Rational equivalence and refined multiplicities are required, not inferred from bare cycles. |
| §2.1 hearts and cohomology | Zero heart object, map of heart objects and shifted cone | Kernel uses τ≤0 Cone[−1]; cokernel uses τ≥0 Cone. |
| §2.2 exact functors and recollement | Identity, [1], [−1], open/closed splitting | Right/left t-exact adjoint directions and gluing inequalities agree. |
| §2.3 intermediate extension and torsion tilt | Open identity, boundary skyscraper, free O and torsion O/λ | Tilt keeps the free object in degree zero and torsion in degree −1. |
| §2.4 noetherian coefficients | Finite field, DVR and nonconstructible stalk limits | Noetherianity does not assert artinianity for integral coefficients. |
| §2.5 self-injective perverse duality | Z/ℓ over Z/ℓ²; smooth surface with a finite-Tor test | Projectivity is not smuggled into biduality; naive ordinary amplitude is not the perverse criterion. |
| §2.6 quasi-finite maps/dimension | Point, finite map, positive fibre dimension | Exactness bounds depend on fibre dimension. |
| §2.7 smooth and affine maps | Smooth A¹ pullback and disconnected fibres; affine open | Pullback is u*[d]; full-faithfulness needs the connected-fibre condition. |
| §2.8 products and locally closed extension | Point factor, empty support and boundary subobject | Product exactness fixes the other factor; j!* keeps its boundary exclusion. |
| §2.9 Deligne truncation | Smooth open and first singular stratum | Relative truncation bounds and low-degree comparison retained. |
| §2.10 IC/simple objects | Smooth curve normalization; finite birational map; A² with Qℓ(±1) | Corrected self-pair target to Λ(d), made self-injectivity explicit and added Frobenius-sensitive witness. |
| §2.11 nonconstructible conditions | Bounded stalk/costalk tests and filtered unions | Not identified with constructible perverse categories; boundedness hypotheses retained. |
| §2.12 small/semismall | Finite étale map, small resolution and top-dimensional fibres | Generically finite and étale range distinguished from an arbitrary map. |
| §3.1 normalized systems | Ramified λ, O/λ², varying strata and unbounded Tor | Common strata and uniform ordinary/Tor bounds required; no raw tower limit shortcut. |
| §3.2 reduction and mapping limits | O/λ derived reduction and separably closed versus arithmetic base | Both Tor degrees retained; mapping-limit claims use the stated finiteness/ML range. |
| §§3.3–3.4 coefficient extension | Ramification index e > 1; identity extension; P¹ trace | O/λ extends to O′/λO′, not O′/λ′; finite-free proof avoids circular trace dependence. |
| §3.5 Betti/perverse comparison | Rank-one monodromy ℓ on C×; finite non-ctf coefficients | Rational image requires a stable lattice; f! comparison is not inferred from full faithfulness alone. |
| §3.6 Tate orientation and supported Betti purity | Divisor, normal line, conjugation and noncompact space | Supported Thom/localization and coherent systems give the extra interface; compact manifold duality alone is insufficient. |
| §3.7 trace/cycle comparison | P¹ integral trace one, divisor boundary and Tate orientation | Cup/Gysin/trace normalization checked together. |
| §3.8 analytic smooth comparison | Residue characteristic dividing n; nonproper model and proper-support range | Prime-to-residue-characteristic and quasi-separated/taut restrictions retained; actual supplier sections repaired. |
| §3.9 diamond mates/image condition | Characteristic-p comparison; DVR point; object outside the image | Unconditional mate/recovery separated from conditional strong f! exchange; self-reference removed. |
| §4.1 support and weak Lefschetz | Boundary degree, torsion and p⁺ input | Compact-support estimate and integral torsion-free/saturation conclusions not conflated. |
| §4.2 ample/generic sections | Affine complement, dimension one and empty good section | Bertini induction stops at the stated dimension; no nonexistent curve step. |
| §4.3 complete intersections | Degree divisible by ℓ; given singular partial intersections | High-degree generator distinguished from hyperplane power; use connected smooth parameter family rather than assume a smooth given chain. |
| §4.4 projective bundles/flags | Rank one and zero Chern classes | ξ² = −c₁(L)ξ for the fixed sign convention. |
| §4.5 blow-up columns/retractions | Codimension two exceptional divisor and identity complement | Exceptional integration sign −1 and columns 1,−ζ^a agree. |
| §4.6 vanishing/restricted/primitive | Quadric over F₂, zero/identity Gysin and primitive P⁰/top | Orthogonal subspaces can intersect; no unsupported direct sum. |
| §4.7 Betti formulas | Conic, cubic curve, quadric/cubic/quartic surface and quintic threefold | Values 0,2,1,6,21,204; d,m ≥ 1 protect the geometric formula and denominator. |
| §5.1 Weil/mixed objects | Arithmetic unit eigenvalues and a nontrivial descent map | Continuity and arithmetic descent retained. |
| §5.2 weights and Ext | Rank-one weights, subquotients, product and affine support | Ext argument direction and weight inequalities checked. |
| §5.3 pure IC | Lisse weight w on a d-dimensional open | IC has weight w+d in the chosen shift convention. |
| §5.4 weight filtration | Zero/simple objects and a two-class extension | Ext(P-quotient, non-P-subobject) direction gives the claimed unique subobject. |
| §5.5 geometric semisimplicity | Arithmetic unipotent Jordan block at a point | Geometric semisimplicity does not require Frobenius semisimplicity. |
| §5.6 perverse decomposition | Pure closed/open support and arithmetic Ext² | Geometric splitting separated from an unjustified arithmetic splitting. |
| §5.7 graded Lefschetz | Extreme primitive degree, zero object and nonzero Tate twist | η-powers, shifts and twists checked categorically. |
| §5.8 relative Lefschetz | Universal hyperplane and largest base subobject/quotient | Restored [d] on both pullbacks; absolute Lefschetz remains supplied by the existing owner. |
| §5.9 restricted specialization/origin | Point with specified L, P¹, non-quasi-unipotent local system | Fixed the base of structural pushforward; only finite prescribed operations/constituents are spread. |
| §5.10 complex decomposition | Different pure weights and geometric-origin constituents | Spread and specialize separate weights; no claim that arbitrary constituent data is already semisimple. |
| §6.1 scheme correspondences | Graph(g,id), identity graph and composed graphs | Composition corresponds to the stated order; fixed scheme is the equalizer. |
| §6.2 cohomological maps | Identity, open restriction and compactly supported sections | Properness needed on the first leg for the stated compact action. |
| §6.3 trace/local terms | Proper fixed component and nontransverse fixed point | Integrated local term is not always the stalk trace; properness belongs to the specified fixed map. |
| §6.4 invariant/specialized traces | Closed/open decomposition, shifted graded pieces and inertia | Invariance uses c₁(c₂⁻¹Z) ⊂ Z; all shifted graded traces vanish in the filtration argument; geometric nearby exchange is distinguished from inertia invariants. |
| §6.5 contraction | Reduced Z, nilpotent thickening and qⁿ equal to the bound | Specified reduced ramification input; strict inequality and schematic contraction retained. |
| §7.1 tubular predicates | Zero normal vector and punctured cone | NoAlmostTubularFixed includes the scalar-zero condition; it is stronger than NoTubularFixed. |
| §7.2 ULA/normal-cone trace | Constant family and a nontrivial cone deformation | Fixed-fibre trace group and proper-component condition kept; map notation repaired. |
| §7.3 tame fixed schemes | Nonreduced equalizer (including x³+yz-type example) and finite-order action | Full fixed scheme retained; finite-jet/tame weight repair of the cited argument is explicit. |
| §7.4 semisimple fixed schemes | Dense cyclic closure, zero/nonzero jet weights and Artin component | Quotient ideal has nonzero characters and generates the associated graded ideal; zero weight is not silently discarded. |
| §7.5 isolated local terms | Tame isolated point and wild translation of P¹ in characteristic p | Wild local term 2 versus stalk trace 1 prevents dropping the tame/normal-cone hypotheses. |
| §8.1 bilinear similitudes | Rank 0, c = 0, rank-one −s, alternating rank 2 and characteristic 2 | char ≠ 2 restrictions retained; determinant sign and self-paired multiplicity parity checked. |
| §8.2 graded duality | d = 0, q = 1, zero ranks, odd/even middle rank and swapped quadric rulings | Δ lies in units; odd middle rank is even; even exponent is (d/2)b, not d(b/2). Added genuine numerical-definition tests. |

The characteristic-polynomial reversal in the last layer was also checked
with P¹ and the zero vector space: reciprocal partners use the multiplier
q^d and the factor (−q^d t)^b, and rank zero gives determinant and polynomial
one. Negative exponents in Δ are integer powers in the unit group.

## Lean signature comparison and validation

Read every suggested declaration. The following explicit comparisons exceed
the required ten representative signatures.

| Lean declaration | README comparison |
|---|---|
| uniformizerQuotient_selfInjective | §0.1: arbitrary DVR, irreducible uniformizer and positive exponent; no Zp-only specialization. |
| finiteModule_eval_bijective | §0.1: Noetherian self-injective ring and finite module, no projectivity. |
| Functor.IsRightTExact / IsLeftTExact / IsTExact | §2.2: actual le/ge zero aisles and conjunction, no placeholder predicates. |
| Functor.isRightTExact_iff_isLeftTExact_of_adjunction | §2.2: adjunction and triangulated shift compatibility, correct adjoint direction. |
| heart_abelian | §2.1: triangulated category and t-structure; propositional existence of abelian data, no sorry-defined instance. |
| vanishingSubspace_eq_orthogonal | §4.6: specified restriction/Gysin, adjointness and separation on the target. |
| restrictedSubspace_eq_orthogonal | §4.6: finite dimension, nondegeneracy and reflexivity supply reverse orthogonality. |
| hypersurfacePrimitiveRank | §4.7: integer expression is total; geometric assertion separately requires positive degree and dimension. |
| isSemisimpleObject_iff_socle | §5.4: both finite-length conditions and arbitrary abelian category. |
| exists_unique_torsion_subobject | §5.4: isomorphism-invariant predicate and correctly directed split simple extensions. |
| form_similitude_det_sq / det_alt / det_symm | §8.1: actual form and similitude maps, nondegeneracy, characteristic restrictions, square root and generalized eigenspace. |
| graded_delta_sq | §8.2: family of native spaces, perfect complementary pairings, automorphisms and unit q; no Frobenius semisimplicity. |
| even_middle_det / odd_middle_det | §8.2: middle parity, characteristic zero, form symmetry and q^d multiplier; integer-rank exponent agrees. |

Final `lean-check` on the absolute Suggested.lean path exited 0: 34
`declaration uses sorry` warnings, no errors or other warnings. The final
Lean file was not changed after that successful run. Memory was checked
before elaboration, and no build or language server was started in either
read-only checkout. `scripts/check_sorry_data.py` reports no sorry-defined
data. All five unchanged packet checks report zero errors and zero warnings.
The six-file `intake.py check-files` check reports zero problems, and
`git diff --check` passes.

## Remaining boundaries

No unresolved defect in this package's stated scope was found after these
fixes. Acceptance does not erase historical packet gap records or extend the
claims beyond their explicit hypotheses. The old integral coefficient and
supported-Betti obligations have named closure targets in §§3.1–3.6 and exact
suppliers. The normalized integral analytic comparison still needs a
constructible derived-complete analytic realization with common strata and
uniform bounds. Strong diamond exceptional pullback still needs the stated
counit/essential-image condition; full faithfulness alone is insufficient.
Neither unconditional extension is promised.

The inherited trait-rectified perversity, general absolute purity, stacks,
perfect/equivariant spaces, non-Noetherian/solid coefficients, unrelated
shtuka geometry and smaller-field splitting extensions remain outside this
roadmap. Their historical gap records do not certify results here. The
Suggested.lean file establishes only that the proposed native signatures
typecheck; its sorrys supply no mathematical proofs.
