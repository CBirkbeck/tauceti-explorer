# Independent package review: global shtukas and function-field Langlands

**Verdict: accepted with the corrections below.** Reviewer: Codex, session
codex-eGSrmO, 2026-10-20. Refs #10901. The package author was a different agent
and session. This review covers the README, Suggested.lean and metadata against
the accepted 104-node plan, including ownership changes that the plan requests.
The verdict concerns the roadmap specification, not an implementation of its
theorems.

## Form, coverage and ownership

Read the JacobianChallenge and ReductiveGroups upstream README models, the
current AlgebraicVectorBundles and PeripheralActions suggested files, and the
binding package and upstream guides. The package has the required summary,
boundaries, conventions, supplier contracts, ordered layers, mathematical
targets, API outlines, discriminating Checks, examples and locators. Metadata
remains the single appropriate line `topic = "math.NT"`. The text is in its
authors' own words; no source passages or sequential source summaries were
added.

There are 93 targets: 92 retained plan nodes and the necessary stack-sheaf
target GS.1.4. No target was deleted or narrowed to shorten this review. The
author's twelve deferrals to AutomorphicLFunctionsAndLocalFactors AL.3 are
correct and remain deferrals. Their mathematical contents and suppliers are:

| Plan content deferred | AL.3 supplier |
| --- | --- |
| Rank-r Drinfeld shtuka varieties | Two-leg unramified shtukas; leveled shtukas and ramified rank induction |
| Truncations and absence of a stable open | Bounded curve-bundle loci and shtuka truncations |
| Compactification and boundary analysis | Two-leg unramified shtukas; shtuka intersection cohomology and essential comparison |
| Normalized Hecke correspondences | Essential cohomology and local factors |
| Rank-negligible representations | Essential cohomology and local factors |
| Essential shtuka cohomology | Essential cohomology and local factors |
| Trace formula and matching of terms | Essential cohomology and local factors |
| Negligible cohomology and rank induction | Shtuka intersection cohomology and essential comparison |
| Deligne rank induction | Leveled shtukas and ramified rank induction |
| Global GL_r correspondence | Leveled shtukas and ramified rank induction; unramified pure realization |
| Local factors, purity and multiplicity | Function-field local factors, multiplicity one and converse theorem; ramified rank induction |
| Rank one as class field theory | Rank-one unramified reciprocity; ramified rank-one curve reciprocity |

The current TauCetiRoadmap checkout was inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine roadmaps newer
than the atlas snapshot and Completed. The current Tau Ceti library was
searched at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches covered
mathematical objects, hypotheses and operators throughout GS.0–GS.7, including
torsors, HN filtrations, determinant functors, Schubert bounds, stack sheaves,
shtukas, Frobenius, integral Hecke orbits, product descent, excursions,
companions, local centres, nearby cycles and monodromy. Generic finite locally
free sheaves and determinants belong to AlgebraicVectorBundles; the revised
GS.1.12 explicitly applies that determinant functor to the finite quotient of
a lattice. The numerical curve Euler pairing is not a duplicate of the
library's quiver or abstract Ext Euler forms. Classical spherical Satake and
Bernstein theory remain supplied by SmoothRepresentationsOfLocalGroups.
The searches found no additional target to remove.

## Supplier closure

Checked the cited pinned Mathlib declarations in their source files at
082e2d37: Scheme, pseudofunctor DescentData/IsStack, GaloisCategory,
ExteriorAlgebra, charpoly/Cayley–Hamilton, Submodule.FG/Module.Finite,
Algebra.adjoin, generalized eigenspaces and their simultaneous decomposition,
Ind, IsSerreClass and isoModSerre. These give the claimed foundations; none
silently supplies stack algebraicity or stack cohomology.

The current supplier contracts were checked against their actual mathematical
prefixes, rather than the older atlas link graph:

- AL PR #924 at `691b4b3310d33d5ad6b2b5224005a407eff9a1f8` retains the curve
  HN, shtuka, essential-cohomology and all-level GL_r constructions. Its
  *Function-field local factors, multiplicity one and converse theorem*
  explicitly constructs equal-characteristic local constants, their
  conductor/norm-twist comparisons, highly ramified twists and product
  formula before rank induction. GS.7.10 now names this input exactly;
  ArithmeticGaloisRepresentations §2.7's p-adic theorem is not substituted for
  it. No duplicate Artin-constant construction is introduced here.
- ET PR #999 at `67d5fdc49feb67deecca4f6715125c134c871b34`, §§3.1–3.2,
  supplies Bun for an everywhere-reductive quasi-split model and the local
  fpqc loop Grassmannian. GS.0.1 and GS.1.1 state the difference made by their
  more general models and multi-leg geometry.
- SchemeAndStackFoundations PRs #779 and #943 provide the stated stack and
  deformation prefix. EtaleDualityAndPerverseSheaves PR #1040 at
  `9a0e8eeeb7bef06a13fdbda9d7c5551b368da248` remains scheme theory. The
  stack extension is therefore a genuine target GS.1.4, not an import of
  an unconstructed stack Part II.
- LanglandsParameterStacks supplies arbitrary-group reconstruction and
  excursion data; GS supplies the geometric realization and global
  continuity. RelativeFarguesFontaine supplies module patching, not the
  multi-leg Grassmannian. Trait nearby cycles and oriented products remain
  separate from the higher-dimensional construction in GS.7.3.

GlobalShtukasAndFunctionFieldLanglands is outside CaraianiNewton's enumerated
94-roadmap order. No numerical tier was invented for it. Checked the actual
consumed prefixes for independence of GS; the older AL/ET atlas backlinks do
not describe those prefixes. Parsed only each target's *Needs* line when
checking prerequisites: all 93 targets have them, the 198 internal edges are
acyclic, and all internal prerequisites precede their consumers. References
to later consequences in explanatory prose are not prerequisites. No
FoundationsAndLibraryIntegration or unresolved UPSTREAM ids remain.
Some supplier packages are still open upstream PRs; their merge order remains
the maintainer's upstream scheduling requirement, not a claim that these
theories are implemented.

## Source checks

The author marked no locator as unverified. Used a reproducible random sample
of fifteen plan nodes (seed 10901); one is correctly deferred to AL.3 and was
checked there as well. Read the source statements, not merely their search
results. The locators below refer to the editions in the README.

| Sample | Source checked | Result |
| --- | --- | --- |
| GS.1.10 central action | VL Remark 1.20, p. 51 | Positive-loop geometric centre, not the dual representation's centre. |
| GS.7.11 ramified GL_r comparison | LL VII.4–VII.5, pp. 196–197 | All-place pair-factor characterization and induction retained. |
| Deferred essential cohomology | LL VI.22–VI.24, pp. 181–185 | Constituent/negligibility comparison belongs to AL.3. |
| GS.0.9 parabolic instability | YZ Lemma 3.19, Corollary 3.20, pp. 29–30 | Uniqueness needs positive instability; added an explicit zero-minimum failure. |
| GS.2.5 IC systems | VL Definition 2.14, Corollaries 2.15–2.18, pp. 59–60; Definitions 4.1, 4.5, 4.7, pp. 65, 68 | Finite truncations versus ind-colimit and degree conventions agree. |
| GS.7.7 local compact-cohomology excursions | GeL Proposition 8.1, pp. 42–43; Remark 6.3, pp. 39–40 | Expanded the remark's page range; finite torsion support does not bound integral support. |
| GS.1.2 Schubert bounds | VL Definition 1.12, p. 46 | Reduced closure distinguished from inequality functor. |
| GS.4.2 lisse Drinfeld lemma | VL Lemma 8.2, p. 107; Lemma 8.12 and proof, pp. 111–112 | Corrected page range and included finitely generated torsion coefficients. |
| GS.0.1 Bun | Var Notation 2.1(a), p. 4; VL §12.1, p. 148 | Added direct general-model source Heinloth Proposition 1, p. 4. |
| GS.3.4 PGL₂ ind-perverse theory | YZ Propositions 3.14–3.15, Lemmas 3.16–3.17, Remark 3.18, pp. 25–29; §§3.5.1–3.5.2, p. 36 | Ind/Serre quotient formulation agrees. |
| GS.5.2 invariant-function indexing | VL Notation 10.5, Lemma 10.6, Notation 10.7, pp. 137–138 | Both diagonal invariances needed; added nonconstant two-leg computation. |
| GS.2.4 fractional infinity | YZ Definitions 3.5, 3.12, Lemmas 3.6–3.8, Propositions 3.9–3.10, pp. 21–26 | Degree balance and geometric infinity-point parity retained. |
| GS.2.1 global shtukas | VL Definition 2.1, pp. 52–53 | Made reductive good open U minus level explicit. |
| GS.5.8 reconstruction | VL Definition–Proposition 11.3, Proposition 11.7, Lemmas 11.9–11.10, pp. 141–146 | All-tuples reconstruction and continuity are distinct from one-element Chebotarev data. |
| GS.3.11 Eisenstein decomposition | YZ Lemma 3.37 through Theorem 3.41, pp. 39–41 | Finite non-Eisenstein sector, not finite total cohomology. |

Additional checks addressed the new stack target and every substantive fix:
LO-I Theorem 2.3.3, p. 11, §§3.3–3.5, pp. 23–25, §4, pp. 29–37,
Theorems 5.5.6 and 5.7.5, pp. 47, 61; LO-II introduction, p. 1,
Theorems 7.5, 7.7, 11.4, 12.1, pp. 20, 23, 30, 31; LO-P
Theorems 4.2, 5.1, 8.2, pp. 6, 7, 12; Sun Theorems 1.1 and
4.2, pp. 2, 29. The one-sided boundedness of the operations is now explicit.

Also read Heinloth Proposition 1 and proof, p. 4; Schieder Theorem 2.3.3,
pp. 12–13 and Theorem 4.5.1, pp. 39–40; Chaudouard Theorem 4.1.2,
p. 17 of his author preprint; Richarz Theorems 0.1 and 5.1, pp. 2, 20,
Proposition 5.6 and Corollary 5.8, p. 22; MV (4.2), p. 13 and
Theorem 12.1, pp. 33–37; Xue-I §§1.1.1–1.1.7, pp. 5–6 and
Theorem 8.3.3, p. 57; Schiffmann Theorem 4.1, pp. 316–317 and
Appendix A, p. 356; LL VII.6(iv), p. 198; Zhu §0.1.4, p. 3;
Lusztig–Yun Lemma 3.3 and §3.4, pp. 9–11; and GeL §§7.1–7.3,
pp. 40–42. Read Deligne's local-constant axioms, finite-order globalization
and Weil–Deligne extension in the maintainer-cleared corrected printing:
§3.12, pp. 533–534, Theorem 4.1, p. 535, Lemmas 4.12–4.16,
pp. 544–545, §8.12, pp. 572–573. No book files or passages were copied.
Pinned MV's reference to the actual v5 used for its page numbers.

## Adversarial mathematics pass

The table covers every target, including definitions, theorem hypotheses and
convention witnesses. “Retained” means the stated restriction or control
already handles the instance; it does not mean a proof was formalized.
Finite-field size always satisfies q>1; geometric positive-rank formulas do
not include rank zero. The integral arguments were checked for a coefficient
DVR with uniformizer λ, not just the special case Z_ℓ.

| Target | Instance or failure tested | Disposition |
| --- | --- | --- |
| GS.0.1 | G_m, trivial group, bad fibres of a smooth affine model | General-model source added; stack stabilizers retained. |
| GS.0.2 | Line-bundle deformations; H² on a curve | Direct Heinloth deformation source added. |
| GS.0.3 | Empty N; a nonreduced thickened level | Full trivialization and Weil restriction retained. |
| GS.0.4 | n=1; twisting through all n flag steps | Periodic chain returns E(−x), not E. |
| GS.0.5 | Zero sheaf; torsion; O(1)⊕O(−1); positive characteristic | Zero has no slope; relative HN limited to strata; no general positive-characteristic stratum isomorphism. |
| GS.0.6 | Unbounded O(m)⊕O(−m); nonsplit/parahoric model | Added faithful-model comparison defining cofinal bounded opens. |
| GS.0.7 | G_m; nonsplit pure inner forms | Groupoid automorphisms and ker¹ components retained. |
| GS.0.8 | n=0; empty block; real dominant T; T=0 | n≥1 and a<b explicit; Lean shift generalized from Q to R. |
| GS.0.9 | O² with distinct flags at 0,∞ on P¹ | Added two minimizing divisors at instability zero; uniqueness remains N>0. |
| GS.0.10 | Degree-zero idele; GL_n degree nd; semisimple G | Degree-injective lattice, finite-index condition, API and three controls added. |
| GS.0.11 | G_m automorphism order q−1 | Groupoid mass is reciprocal stabilizer order. |
| GS.0.12 | Nontrivial inner-form component | Descent does not discard it. |
| GS.0.13 | Rank 0 versus rank 1; length 0; q=1 | Positive rank required for bundle formula; length nonnegative; finite fields exclude q=1. |
| GS.0.14 | Torus; characteristic function of O⊕O | Empty constant-term family versus noncuspidal finite support distinguished. |
| GS.0.15 | P¹ degree components; Lang on Pic⁰ | Lang kernel finite only on Pic⁰; central quotient controls other degrees. |
| GS.1.1 | Empty legs; G_m on nonreduced rings | Geometric points Z do not identify the full loop quotient functor. |
| GS.1.2 | Zero bound; infinitesimal test ring | Reduced closure not confused with inequality bound. |
| GS.1.3 | Trivial modification; concatenation | Final trivialization omitted; finite jets large enough for the bound. |
| GS.1.4 | B G_m, B Γ, scheme; unbounded compact cohomology | Corrected Rf_* to D⁺, Rf_! to D⁻ and corresponding tensor/Hom domains. |
| GS.1.5 | GL₂ minuscule collision fibre P¹ | Smallness over moving legs distinguished from semismall fixed convolution. |
| GS.1.6 | n=1; level collision | Relative dimensions rn and r(n−1) retained with flatness at collisions. |
| GS.1.7 | Trivial group with Frobenius +1 or −1 | Geometric category over F̄_q separated from arbitrary arithmetic descent. |
| GS.1.8 | Two odd GL₂ minuscule objects; torus | Odd-odd correction fixes symmetric fibre functor; rational coefficients retain −1 even at ℓ=2. |
| GS.1.9 | G_m weights; GL₂ standard representation | Dual root datum and moving-leg ULA claims retained. |
| GS.1.10 | Nontrivial dual central character | Only geometric positive-loop centre acts trivially. |
| GS.1.11 | Unit; torus δ_m; bad place | Good hyperspecial place explicit; integral normalization uses ℓ≠p. |
| GS.1.12 | Rank-0 determinant; scalar a; basis swap in characteristic 2; IH⁰/IH² | Quotient determinant API and four sign controls added. |
| GS.1.13 | Trivial versus nontrivial Galois action | Prescribed finite L-group projection retained. |
| GS.1.14 | O_E/λ; Tor₁ of two residue fields; G_m weights | All finitely generated coefficients restored; perverse truncation, flat restriction and API explicit. |
| GS.2.1 | Empty legs; bad model point; Frobenius on X instead of S | Good-leg base explicit; Frobenius remains on S. |
| GS.2.2 | Unbounded central degrees; increasing HN bound | Central quotient and bounded finite-type stages retained. |
| GS.2.3 | Zero bound; collision diagonal | Local model controls IC, not a claim that every Schubert variety is smooth. |
| GS.2.4 | Wrong degree balance; even-degree infinity point | Degree equality and parity use the geometric infinity sections correctly. |
| GS.2.5 | Fixed finite bound versus all bounds; j≠0 | Constructible stages and all-degree ind-systems retained. |
| GS.2.6 | Zero legs; nontrivial ker¹ | Inner forms retained in the no-leg identification. |
| GS.2.7 | Rank one; characteristic/pole placement | Only the stated elliptic-sheaf specialization retained. |
| GS.2.8 | r=0; odd number of vertical steps | Closure forces even vertical count and specified support. |
| GS.2.9 | One block; product of blocks | Bound may increase; product is total Frobenius. |
| GS.2.10 | Bijection; merging two legs; empty set | Restriction to diagonal coefficients, not deletion of factors. |
| GS.2.11 | Unit Hecke function; convolution; growing bound | Correspondences act on the directed system. |
| GS.3.1 | Unit; evaluation/coevaluation; finite integral orbit | Construction explicitly precedes Hecke-finite restriction. |
| GS.3.2 | 0; integral scalar; multiplication by ℓ⁻¹ on Q_ℓ | Integral lattice definition retained; fraction-field finite dimension insufficient. |
| GS.3.3 | Zero and positive instability; horocycle support | Large-instability hypotheses and shifts retained. |
| GS.3.4 | Fixed truncation; self-inverse PGL₂ double coset | Ind(Perv), mc localization and inverse adjoints retained. |
| GS.3.5 | Torus; proper Levi; generic diagonal | Modified-Levi codomains and genericity condition retained. |
| GS.3.6 | Unit; degree-two place; minuscule GL₂ | API and explicit d=2 and −q_v^(−1/2) versus +q_v^(−1/2) controls added. |
| GS.3.7 | dim V=1,2; V=0 | Exterior polynomial has correct order/sign; V=0 has zero coefficient cohomology. |
| GS.3.8 | No legs; torus | Cusp space, not all compact automorphic functions for general G. |
| GS.3.9 | Constant term on unstable boundary | Target includes Picard translation and finite-dimensional errors. |
| GS.3.10 | Torsion coefficients; all j | Finite O_E generation retained without integral semisimplicity. |
| GS.3.11 | Infinite Eisenstein sector | Only isolated non-Eisenstein sector asserted finite-dimensional. |
| GS.3.12 | O_E[t] finite over itself, not O_E | Single-Hecke-algebra finiteness distinguished from integral finite orbit. |
| GS.3.13 | r=0; infinity empty/nonempty; parity | Finite-type criterion retains parity and r versus #Σ∞. |
| GS.4.1 | One leg; nonétale dual numbers | Finite étale hypothesis and product-of-lifts condition retained. |
| GS.4.2 | Residue-field module; one leg; infinite Laurent module | General finitely generated coefficients included; infinite naive descent excluded. |
| GS.4.3 | One/two legs; total Frobenius | Z and Z² degree quotients with geometric kernel, not profinite degree quotient. |
| GS.4.4 | Merge two legs | One partial Frobenius becomes product of the two. |
| GS.4.5 | Finite piece versus whole cohomology | Dense Ω restriction and piece-dependent open retained. |
| GS.4.6 | Specialization kernel | Injectivity as well as lifting is part of the proof target. |
| GS.4.7 | Infinite union of finite envelopes | Continuity on finite pieces, not finite total dimension. |
| GS.4.8 | Empty legs; trivial added leg; V⊠V∨ | Indexed functor and fusion retained, no tensor equivalence asserted. |
| GS.4.9 | Two legs merged | Galois map γ↦(γ,γ), not multiplication. |
| GS.4.10 | Unaffected versus created leg | Only the appropriate commutations asserted. |
| GS.4.11 | Two specialization choices | Comparisons cancel in final endomorphism, not in basepoint identifications. |
| GS.4.12 | O_E[t]/(λt−1)=E; maximal ideal containing λ | Two-case descent retained; no unjustified integral finiteness. |
| GS.4.13 | Collision diagonal; nonsplit integral coefficients | Rational parahoric result and weaker split integral statement distinguished. |
| GS.5.1 | Unit; ξ=0; all γ_i=1 | Scalar ξ(x) and ordered composite retained. |
| GS.5.2 | One leg; zero covector; SL₂ two-leg trace 5/2 | Three discriminating matrix-coefficient Checks added. |
| GS.5.3 | Weil degree 0 and 1; general reductive group | Good place explicit; single-element data not simultaneous conjugacy. |
| GS.5.4 | Empty retained legs; torsion module; j≠0 | All finite auxiliary/retained leg data and coefficients quantified. |
| GS.5.5 | Empty/reindexed leg set; three copies | Universal excursion identities imported, geometric verification retained. |
| GS.5.6 | Inertia at a good place | Unramifiedness uses continuity/density, not all bad places. |
| GS.5.7 | Empty family; zero space; Jordan block | Unital scalars, finite generated algebra and generalized blocks retained. |
| GS.5.8 | Equal one-element classes; all-tuples evaluations | Arbitrary-group reconstruction plus global continuity retained. |
| GS.5.9 | Zero cusp space; nonreduced excursion algebra | Generalized blocks coexist with actual characteristic-zero spherical scalars. |
| GS.5.10 | Nonsplit group; pure inner forms | Finite projection and ramification outside good open retained. |
| GS.5.11 | Nonsemisimple mod-ℓ block | Completely reducible parameters; generalized Hecke eigenvalues only. |
| GS.5.12 | Missing partial-Frobenius trace comparison | Explicitly conditional, no consumer depends on it. |
| GS.5.13 | Empty-leg specialization | Conjecture formulation only; not an axiom or dependency. |
| GS.6.1 | Unit at one ℓ but not another non-p place | Algebraic/plain hypotheses and optional purity kept separate. |
| GS.6.2 | r=1; p-adic valuation; degree>0 | Added exact normalized slope inequality and nonzero denominator. |
| GS.6.3 | r=1; lower-rank induction | Comparison consumes independent AL.3 correspondence. |
| GS.7.1 | Good hyperspecial point | Satake comparison uses geometric Frobenius and volume 1. |
| GS.7.2 | r=0; Frobenius preimage thickening | D_(−1)=n v and scheme-theoretic inverse divisors retained. |
| GS.7.3 | Trait; higher-dimensional base | Modification/base-change theorem is constructed, not inferred from trait theory. |
| GS.7.4 | Degree-zero local lift; two lifts | Nearby-cycle transport has stated equivariance and choice comparisons. |
| GS.7.5 | Torsion exponent 1; increasing level; pro-p group | ℓ≠p ensures averaging denominators are units. |
| GS.7.6 | Integral character versus nonunit Frobenius scalar | Galois extension only for integral case; arbitrary case remains Weil. |
| GS.7.7 | Finite support at each torsion level, growing supports | Integral limit only required to decay at infinity. |
| GS.7.8 | Ramified place; nonsplit projection | All-tuples semisimple equality, not monodromy. |
| GS.7.9 | Steinberg versus trivial GL₂ representation | Same semisimple Weil part does not recover N. |
| GS.7.10 | Zero representation; trivial line; ψ(ϖ·) | Exact AL.3 supplier, seven-part API, gamma quotient and measure/exponent witnesses added. |
| GS.7.11 | Rank one; ramified GL_r | Frobenius semisimplification retains N and all pair factors. |

## Lean signature and validation checks

Suggested.lean has 249 lines, six real-bodied light definitions, nine named
theorem targets and eleven proved examples, at most two per definition. No
heavy carrier, sorry'd data definition, auxiliary development, admitted
example or weakened headline theorem was introduced. The closing comment
now also names CentralLattice, satakeDeterminantLine, IntegralSatake and
LocalGamma.

Checked all fifteen signatures against the README, exceeding the required
ten-signature sample:

| Signature | Hypotheses and truth check |
| --- | --- |
| eulerForm | Numerical rank-degree classes; P¹ values 2 and 0 fix the antisymmetric sign. |
| slope | WithTop Q; torsion gives top; (0,0) only totalizes the function. |
| shiftedSlope | Real shifts, not just rational; geometric blocks have a<b; zero shift gives ordinary slope. |
| HeckeFinite | Common finite R-submodule stable under every operator; not a finite E-span. |
| HeckeFinite.finiteLattice | Finite set of finite witnesses admits their finite sum, including the empty set. |
| HeckeFinite.map | Equivariant R-linear map sends a finite witness to its finite image. |
| finiteLattice_of_monic_recurrence | Monic annihilator gives span of finitely many iterates; degree zero forces the zero module. |
| not_heckeFinite_inv_ell | Prime ℓ; iterates have unbounded negative valuation. Z_ℓ here is explicitly a counterexample, not the general coefficient ring. |
| HeckeFinite.smul | E-linear operators and scalar tower; image of a witness under a· is finitely generated over R. |
| excursionFunction | Actual representation matrix coefficient with arbitrary existing group/module carriers. |
| excursionFunction_diagonal_invariant | Both invariant vector and invariant covector required; left and right translations checked separately. |
| excursionAlgebra | Algebra.adjoin of the operator range, including scalars for an empty family. |
| excursionAlgebra_commute | Pairwise commuting generators imply commutation in their generated algebra. |
| excursionAlgebra_finiteDimensional | Finite-dimensional V required; algebra is a subspace of End V. |
| iSup_generalizedCharacterSpace_eq_top | Algebraically closed field, finite-dimensional V and commuting family; genuine algebra characters index simultaneous generalized spaces. Zero V and a Jordan block checked. |

Final validation:

- `lean-check` exited 0 at the pinned shared build, with exactly nine
  `declaration uses sorry` warnings and no errors or other warnings.
- `scripts/check_sorry_data.py` exited 0.
- `scripts/check_blueprint.py` on the unchanged accepted packet reported
  0 errors and 0 warnings.
- Internal prerequisite ordering, anchor links, definition Check counts,
  allowed file scope and `git diff --check` were checked.
- `research/blueprint/intake.py check-files` on the package, review and
  handoff deliverables reported 0 problems.

No unresolved mathematical or source defect remains from this review.
Upstream supplier merge order and the accepted plan's older AL/ET link-map
cleanup remain maintainer coordination items; no packet or other job's file
was edited. No suspicious instruction was encountered in the untrusted
material read for this job.
