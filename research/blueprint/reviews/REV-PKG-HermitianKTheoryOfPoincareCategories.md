# Independent package review: HermitianKTheoryOfPoincareCategories

**Verdict: accepted with the fixes in this review.** The package is ready for a
draft TauCetiRoadmap pull request. This accepts a mathematical roadmap with six
explicit additional-input boundaries; it does not certify those inputs as built
or the theorem targets as formalized.

Reviewer: Codex, session `codex-OPFIdv`, issue #11258, 2026-10-20. The package was
written by another session. The claim bot confirmed this review claim at
00:55:55 UTC. Only this job was claimed. The review followed WORKERS,
PACKAGE_REVIEW, PROTOCOL, UPSTREAM_GUIDE and the expansion protocol. The two
roadmap models read were StablePeriodicCurved and GrothendieckEulerForms, both
in the atlas snapshot and in the current upstream checkout.

## Changes made

1. In §4.8, replaced the asserted equivalence between an ordinary category of
   quasi-isomorphisms and the derived core by the precise lifting statement
   needed for the comparison: bounded projective complexes compute derived
   morphisms through chain homotopy classes. The contractible complex
   `R →^{id} R` and zero have equivalent derived images without being isomorphic
   complexes. This is now an explicit negative control. The short-form and
   bounded-L-group comparison targets are retained.
2. In §6.2, restricted the integral torsion-module sharpness witness to
   `n ≥ 2`. The case `n = 1` is zero, and `n = 0` gives the projective module ℤ;
   neither witnesses the claimed lower duality bound.
3. In §7.2, qualified the improvement over Ranicki's nonnegative-degree range.
   The numerical bounds improve for `d ≥ 2`; for `d = 0,1` both results already
   cover every nonnegative degree.
4. In §7.3, restored two accepted mathematical consequences which the package
   had reduced to mentions of unspecified external theorems. Read's ℤ/4
   counterexample now has its degree assertions. Schlichting's regular-domain
   comparison now has its precise ring/involution hypotheses and degree bounds,
   including the stronger non-zero-divisor case. Added direct primary-source
   references and tests separating these examples from the Laurent-ring
   sharpness argument. Their status as additional inputs is preserved.
5. Added Mathlib's existing `Module.projective_of_isSemisimpleRing` to the
   supplier boundary. The retained milestone adds the converse and the
   projective-dimension-zero identification. Added a sphere-to-Hℤ test in §5.4
   distinguishing equivalence of homotopy categories from equivalence of
   projective infinity categories. Strengthened §0.4's tests with shift
   preservation under two contravariant duals and signature preservation under
   double transport.

No accepted packet, reader document, upstream file or library was edited.
Suggested.lean and metadata.toml needed no changes. No target or Check was
deleted in this review.

## Accounting, prerequisites and current upstream

The input packet has 62 nodes: seven constructions, six definitions, 48 theorems
and one comparison. Its checker reports nine planned stages, zero closed stages,
88 API entries and 52 named tests. The package represents these in 61
mathematical subsections, with the existing generic shift-equivalence node
consumed in Exact supplier contracts. Independently compared the API names:
83 of 88 occur unchanged; three coherence/dimension names have the corresponding
Lean names; the global-dimension predicate is supplied by StablePeriodicCurved;
the finite-presentation specialization of the all-module dimension hypothesis
is immediate. None of these last two is missing mathematical content.

All subsection Needs lines were followed to earlier targets or the named
supplier contracts. In particular:

| Supplier | Contract checked and restriction retained |
| --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic §§6.1a–b, 6.1.6 | C₂-spectra, norm/Tate, connective K and the group-completion adapter. Algebraic Tate cohomology alone does not supply spectrum coherences. |
| The same roadmap §6.8a | Perfect derived enhancement/Hom, invertible coefficients, Poincaré structures, basic isotropic surgery, generic shifts, GW/L, localization, fundamental square and weight-heart comparison. Relative bounded surgery here extends that API. |
| EnhancedDerivedSheaves E0, E5:abstract, E5:presentability | Stable categories, algebra/module objects, relative tensor and compact objects. The separate HR/derived comparison is commutative-only; the general-ring route uses the first supplier's perfect enhancement. |
| GeneralAlgebraicKTheoryPartII §KII.3 | A bounded t-structure on the homotopy category with enhanced truncations and heart, using Mathlib's existing ordinary t-structure. KII.0–3 explicitly have no chromatic/trace prerequisite. |
| StablePeriodicCurved Layer 4 | `HasFiniteGlobalDimension` quantifies over all right modules. Passing to the opposite ring gives the left convention used here. |
| QuadraticFormInvariants Layer 4 and current Tau Ceti | Field Witt ring with two invertible, rather than characteristic-two symmetric or quadratic Witt groups. |
| ChromaticHomotopyTheory §CH.11 | The ko carrier only. Its Tate calculation remains a separate assumption. |

The order file places GeometryOfNumbersAndQuadraticArithmetic in tier 3 and
EnhancedDerivedSheaves in tier 4. This roadmap, GeneralAlgebraicKTheoryPartII and
ChromaticHomotopyTheory have no numeric tier in that 94-roadmap order; no tier or
bundle was invented for them. No `FoundationsAndLibraryIntegration` or
`UPSTREAM:` placeholder survives. The general weight-heart theorem is the input
used here, not the supplier's Dedekind specialization of the comparison being
proved. Likewise its integral tables supply examples, not a proof of the
general coherent-ring comparison. There is no dependence of the main comparison
on §7.3's optimality examples.

Read the relevant entries of data/library-coverage.json: GN.6 and EDS E0/E5 are
not built, and there is no HermitianKTheoryOfPoincareCategories entry. Independently
checked the declarations instead of interpreting that absence as a library audit.
The Mathlib baseline is `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The two Tate isomorphisms were also read at the actual Tau Ceti commit
`f790474821cf4256814db967cb154e7af3d0c369`.

| Pinned interface read | What the declaration actually supplies |
| --- | --- |
| `Module.Projective`, `Module.FinitePresentation`, `Module.Invertible` | Projectivity, finite presentation by a finite free presentation with finitely generated kernel, and invertibility by evaluation. |
| `ChainComplex`, `HomotopyEquiv`, `HomologicalComplex.homology` | Homological indexing, maps inverse up to chain homotopy, and the homology object. |
| `CategoryTheory.ProjectiveResolution` | A projective ℕ-chain complex, augmentation to the single module and its quasi-isomorphism; not just an unaugmented complex. |
| `CategoryTheory.HasProjectiveDimensionLE` | Ext vanishing; `projective_iff_hasProjectiveDimensionLE_zero` identifies degree zero. |
| `IsNoetherianRing`, `IsSemisimpleRing`, `IsDedekindDomain` | The declared left-module hypotheses; the Dedekind convention includes fields. Semisimplicity means the regular module is semisimple. |
| `DerivedCategory`, `DerivedCategory.TStructure.t`, `CategoryTheory.Triangulated.TStructure`, `heart` | Ordinary localization, its cohomological halves and heart. None is substituted for a stable enhancement. |
| `Rep.FiniteCyclicGroup.tateCohomologyIsoEven/Odd` | Chosen-generator norm/difference homology descriptions in the two parities. |
| `Module.projective_of_isSemisimpleRing` | All modules over a semisimple ring are projective; added to the supplier boundary. |

The current read-only trees had heads
`0d144d044dacebca17b654695b6f1ad58f159b27` (TauCetiRoadmap) and
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (Tau Ceti). Searched all roadmap
READMEs/signatures and Completed by objects and hypotheses: coefficient duality,
norm/Tate, metabolic categories, projective width, coherent rings, projective
dimension, finite resolutions, Poincaré structures, bounded Lagrangians,
Ranicki groups and GW/L comparisons. This included all nine newer roadmaps and
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.

Read the plausible overlaps. LocalGaloisGroups/ClassFieldTheory concern special
group-ring modules and cohomological triviality; IntegralHeckeAndGaloisDeterminants
does not provide the general coherent-ring resolution theorem; DGAInfinity and
GrothendieckEulerForms use finite resolutions for Euler/K₀ constructions.
Current Tau Ceti's ModuleCat CartanMap API assumes finite projective resolutions
and constructs their Euler classes and K₀ equivalences. Its semisimple case
does not give the coherent finite-presentation theorem. Flat/Pi mentions
coherence in context but supplies no competing coherence predicate. Read the
current Witt/Ring definition and `wittClass` hypotheses.

**Removals in this review: none.** Confirmed the package's existing deferrals of
the generic shift, finite-global-dimension predicate, generic complex/resolution
carriers and characteristic-not-two field Witt ring. The new supplier citation
above records the additional existing one-direction semisimple input. The
remaining targets extend these suppliers through connectivity, finite length,
general coefficients or genuine-flavour comparisons. Neither read-only tree
was built or modified.

## Primary-source verification

No locator was marked unverified in the package/input source records. Checked
all six flagged external-input boundaries separately, and independently selected
15 nodes with `random.Random('codex-OPFIdv').sample(packet['nodes'], 15)`.
Read each listed primary passage, including its hypotheses and the relevant
argument. The sample is reproducible from the unchanged packet's node order.
The following table records the sample, not a section-by-section source summary.

| Sample target | Primary passages checked | Result |
| --- | --- | --- |
| Form parameters, §7.7 | III Remark 1.3.17 p.32; I Definition 4.2.26 p.73 and p.74 | Locator correct; retain coherent global dimension ≤1 for the comparison and the extra derivation input. |
| Ring-spectrum surgery, §5.3 | III Proposition 1.2.26 p.23 | Bounds are the same as discrete quadratic surgery; projective recognition supplies the replacement argument. |
| Width, §2.4 | III Lemma 1.1.6, Remarks 1.1.7–8 pp.12–13 | Both connectivity bounds are needed for a finite interval; the Lean theorem is explicitly one-sided. |
| Generic shift, supplier contract | III Proposition R.6 p.9; I Lemma 3.5.1, Proposition 3.5.3 pp.59–60, Corollary 4.2.24 p.73; II p.101 | Loop, index increment and coefficient sign agree, including endpoint structures. |
| Low-dimensional Witt descriptions, §6.6 | III Corollary 1.3.4, Remark 1.3.5 p.28; Example 1.3.7 p.30 | Coherence, global dimension and k≥1−r retained. The extra genuine endpoint has its separate low-degree argument. |
| Classical quadratic/symmetric GW, §8.4 | III Theorem 3 p.3; Corollary 1.3.10 pp.30–31; Remarks 1.3.12/16/17 pp.31–32 | General and 2-torsion-free ranges match; form-parameter extension remains conditional. |
| Classical fibre sequence, §8.1 | III Theorem 1 p.2 and pp.3–4; II Corollary 4.4.13 p.107 | Connective K homotopy orbits are the left term; the short spectrum is a connective cover. |
| Lagrangian surgery, §3.2 | III Remark 1.1.14, Construction 1.1.15 pp.14–15 | Relative target, fibre sequences and null-homotopy data agree. |
| Compact connective π₀, §5.2 | III Lemma 1.2.27 p.23, Remark 1.2.28 pp.23–24 | Finite presentation and projective/two-term criteria agree. The erroneous source label is correctly read as Lemma 1.1.6. |
| Karoubi periodicity, §1.4 | III Theorem R.8 p.10; II Corollary 4.3.4 p.101 | The shift is m+1 with −M; fibre definitions of U,V agree. |
| Special Karoubi cases, §1.5 | III Remark R.9 p.10 | Three classical identifications and the subsequent ≥3 structure are distinguished. |
| Metabolic category, §1.1 | I Definition 2.3.5 p.36, Lemma 2.3.7 p.37; III pp.9–10,13–14 | Relative quadratic fibre and arrow duality agree. |
| Dedekind comparison, §7.5 | III Corollaries 1.3.14–15 pp.31–32 | Nonnegative symmetric and degree-four quadratic comparison ranges agree. |
| Shifted GW/symplectic forms, §0.5 | III Remark R.7 p.9 | The diagonal is quadratic/Frobenius on 2-torsion, not ordinarily R-linear. |
| Genuine comparison, §7.2 | III Corollary 1.3.10 pp.30–31, Theorem 6 p.4, Remark 1.3.13 p.31; Ranicki Proposition 4.5 printed p.153/PDF p.67 | The theorem ranges agree. Fixed the blanket claim of strict improvement in nonnegative degrees. |

Also opened III pp.7,15–22,24–27,32–33 and Proposition 3.1.14 p.54 for coefficient
signs, bounded monoids, short complexes, extra inputs and surgery endpoints;
I Proposition 4.2.18 pp.71–72 for the restriction equivalence; and HA
Proposition 7.2.2.18/Corollary 7.2.2.19 pp.1244–1246 for projective lifting.
Read Read's actual Corollary F and proof, pp.6–7, and Schlichting's actual
Theorem 1.1, pp.2–3, before restoring their statements. No reliance on an
abstract, search snippet or another review replaced these readings.

Editions and downloaded-PDF SHA-256 values, to make the checks reproducible:

| Edition | SHA-256 |
| --- | --- |
| [III, arXiv:2009.07225v4](https://arxiv.org/pdf/2009.07225v4), 28 April 2026 | `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c` |
| [I, arXiv:2009.07223v3](https://arxiv.org/pdf/2009.07223v3), 27 December 2021 | `2c423b7f8fa95e1ee236c1d59a22d559de26fb8882328d9604e7680f31a7c68e` |
| [II, arXiv:2009.07224v5](https://arxiv.org/pdf/2009.07224v5), 11 April 2025 | `eaa19b40046c953f6aedc5d11ed86eaee16018fcad995fcbafeb4746af6239a3` |
| [Ranicki, Algebraic theory of surgery I](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/ats1.pdf), 1980 | `f8da5efcdb26cf6ed96ce1454a304b3aaab8833b27fc8ebdf5fc7da091cc2da7` |
| [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), 18 September 2017 | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |
| [Read, arXiv:2411.11993v2](https://arxiv.org/pdf/2411.11993v2), 14 February 2026 | `f7bb2fc3df394fd69977a15de30e273e4e74662f549136f9659ba0a5214b0143` |
| [Schlichting, arXiv:2503.14288v3](https://arxiv.org/pdf/2503.14288v3), 19 June 2025 | `3ecaee04088412e48149f170ac72e01da89488ce890d3809d45149a5d41c3fb1` |

Preprint page numbers are those of these editions. Ranicki's printed page is
PDF page plus 86. This review does not determine whether a preprint issue
persists in the version of record. Consulted the cleared-library INDEX; used
only the public primary sources above, and no restricted book. Repository
mathematics and this report are in the reviewer's own words.

## Definition tests and Lean signatures

Every owned definition/construction has a named API and at least three
independent discriminators. Repeated field/standard-flavour checks were not
counted as distinct evidence. Representative independent triples follow.

| Subsection | Three different failure modes tested |
| --- | --- |
| 0.1 Coefficient operations | Noncentral matrix ε; zero coefficient over a nonzero ring; sign collapse in characteristic two versus exchanged integral Tate parities. |
| 0.2 Flavour spectra | Integral gq→gs multiplies by eight while gs→s preserves signature; all flavours collapse with two invertible; integral sign coefficient changes GW₀ from ℤ² to ℤ. |
| 0.4 Opposite transport | General M is replaced by M∨; ℤ[1] keeps its degree after two contravariant duals; double transport of ⟨1⟩ keeps signature +1. |
| 1.1 Metabolic category | Hyperbolic standard Lagrangian; zero/identity arrows and their relative forms; characteristic-two metabolic but nonhyperbolic plane. |
| 2.1 Bounds | Quadratic and symmetric endpoints; gs over 𝔽₂ fails the next symmetry bound; gs over ℤ gains a bound through vanishing Tate parity. |
| 3.2 Relative surgery | Zero datum; fixed target for a zero-target datum; hyperbolic Lagrangian can be killed by a nonzero datum. |
| 3.3 Bounded monoids | Width −1 forces zero; forbidden odd n+a; (0,0,1) and the Ranicki-length intervals. |
| 4.7 Short complexes | A line with pairing 2 over ℤ fails Poincaré duality; n=0 symmetric Witt quotient; positive-degree Wu classes and negative even extension distinguish the degree conventions. |
| 5.1 Ring-spectrum structures | Discrete-ring specialization; sphere universal versus Tate/symmetric structures; compact 𝕊/2 is not projective. |
| 6.1 Coherence | Fields versus ℤ dimension one; a nonregular one-dimensional order; dual numbers have unbounded projective dimension. |
| 6.2 Perfect Postnikov heart | Field heart; ℤ/2 dual in degree −1; noncoherent ring with non-finitely-generated Ann(x₁). |
| 6.3 General t-structure bounds | Field Witt quotient; zero category; changing the t-structure changes connectivity, and perfect ℚ[1] with shifted duality separates connectivity from concentration. |
| 7.7 Form parameters | Burnside quadratic action; standard symmetric parameter; zero τ,ρ fail the integral trace condition. |

Suggested.lean has seven declarations and two proved examples, rather than ten
declarations from which to sample. Checked all seven signatures:

| Declaration | README agreement |
| --- | --- |
| `exists_homotopyEquiv_concentrated_ge` | §2.4: arbitrary ring, bounded ℤ-complex, finite projective terms, vanishing homology below k; conclusion gives a bounded replacement and homotopy equivalence. No unjustified upper bound is inferred from one-sided connectivity. |
| `IsLeftCoherentRing` | §6.1: every finitely generated left ideal is finitely presented; actual predicate body, not an admitted carrier. |
| `isLeftCoherentRing_of_noetherian` | §6.1: ring and left-noetherian hypothesis, no commutativity restriction. |
| `finitePresentation_finiteProjectiveResolution` | §6.1: coherence and an all-module uniform bound, finitely presented input, augmented native resolution, finite terms, zero above d. |
| `globalDimension_zero_iff_semisimple` | §6.1: all modules, not only finite or finitely presented ones; same module universe as the ring. |
| `dedekind_projectiveDimension_le_one` | §6.1: commutative Dedekind domain, arbitrary module, fields permitted. |
| `zmod_two_not_projectiveDimension_le_zero` | §6.1: the ℤ-module ℤ/2, not a module over ℤ/2. |

The two examples prove coherence of ℤ and every field, with no admissions.
There are no sorry'd data definitions, weakened proxy carriers, auxiliary theory
chains or placeholder propositions. The closing comment accounts for all
remaining heavy definition families in the README, including coefficient
operations, metabolic category, bounds, bounded monoids, surgery, short
complexes, ring spectra, t-structure and form parameters.

## Adversarial pass on every subsection

The table covers every mathematical subsection, its subsidiary API/identities
and the standing conventions. A retained row means the tested instances agree
with the stated hypotheses; it is not a claim that a finite calculation proves
the general theorem.

| Statement or definition | Instances and calculation | Decision/change |
| --- | --- | --- |
| Conventions | Fibre-connectivity of Hℤ→H𝔽₂; dual of ℤ→²ℤ; zero ring; k=0 and ±1 shifts. | Homological degrees and fibre/cofibre offset agree. |
| 0.1 | U=[[1,1],[0,1]], ε=[[0,1],[−1,1]]; four matrix units and 64 action-swap triples. J_bad²(E₁₁)=[[0,1],[0,1]]. Also M=0 and char 2. | Keep ε⁻¹bar and R≠0 for the zero non-example. |
| 0.2 | L₀ over ℤ: signature and eightfold symmetrization; q/s infinite endpoints; zero ring. | Retain index/map directions. |
| 0.3 | Norm 2 versus difference 0 on ℤ, interchanged on −ℤ; 2 a unit. | Cohomological degree −m matches truncation degree m. |
| 0.4 | Dual coefficient line; ℤ[1] through both contravariant duals; double transport of ⟨1⟩. | No unsupported identification M≃M∨; added degree/sign witnesses. |
| 0.5 | Shifts 0,2,4; antisymmetric/alternating distinction; x² over 𝔽₂[t]. | Frobenius action on R[2] retained. |
| 1.1 | Zero arrow, identity arrow, hyperbolic object; 𝔽₂-plane [[0,1],[1,1]]. | Relative fibre and arrow-duality directions pass. |
| 1.2 | L of a metabolic category vanishes; zero category; first term shifted by −1. | Bott–Genauer fibre/cofibre orientation passes. |
| 1.3 | fgt∘hyp=1+D, rank two over a field; fibres U,V. | V(Q)≃ΩU(Q[2]) agrees. |
| 1.4 | m=0,1 and endpoints ±∞, followed by a second shift. | Minus coefficient and increment m+1 retained. |
| 1.5 | Trivial/sign ℤ Tate parities; fourth step at ≥3. | Do not identify the fourth genuine structure with gq. |
| 1.6 | Two shifts cancel the sign; endpoint 4-periodicity; char-2 2-periodicity. | Retain Σ⁴Lgs≃Lgq, not periodicity of each genuine structure. |
| 2.1 | Endpoint structures; free-line generator; gs over 𝔽₂ versus ℤ. | Bounds distinguish vanishing of adjacent Tate coefficients. |
| 2.2 | m=0,1,2 in r=2−m; quadratic endpoint. | Symmetry/quadraticity indices pass. |
| 2.3 | Opposite twice; projective line versus non-self-dual coefficient. | Both bounds are preserved through the actual duality. |
| 2.4 | ℤ/2 has width [0,1], not [0,0]; zero complex; field projective. | One-sided Lean result and two-sided prose kept distinct. |
| 2.5 | k=0,±1; each branch of min(−2k,m−k). | Connectivity inequality passes at the switch. |
| 3.1 | (X,q)⊕(X,−q), diagonal; zero object. | Inverses and π_n convention agree. |
| 3.2 | Zero surgery; W=0 fixes the target; nonzero hyperbolic datum. | Relative fibre and cofiber diagrams pass. |
| 3.3 | n=0,a=0,b=0 or 1; a=−1; odd/even b+n; 775 integer tuples. | All half-integer formulas have parity or ceiling/floor protection. |
| 3.4 | Zero form; integral signature; metabolic nonalternating 𝔽₂-plane. | Witt quotient kills strictly metabolic objects, not just isometric hyperbolics. |
| 3.5 | Same 𝔽₂-plane is a counterexample without 1-quadraticity; standard hyperbolic form. | Hypothesis is necessary and retained. |
| 3.6 | b=a and a+1, including width zero. | Widening comparison has the claimed direction. |
| 4.1 | k below the surgery threshold, including equality in a≥n−2m; 8,485 integer instances. | Both strict null-homotopy inequalities hold. |
| 4.2 | n even/odd and n=2m; one-term/two-term representatives and Lagrangians. | Parity choices (0,1)/(1,0) agree. |
| 4.3 | n=0,1; gs has m=0. | [−n,0] and [−n−1,0] intervals agree. |
| 4.4 | n=2m−3 and 2m−2; 126 surjectivity and 117 injectivity inequalities; ℤ at degree −2. | Source's erroneous repeated n is not propagated. |
| 4.5 | Symmetric/even/quadratic Witt groups at zero; shifted negative even groups; odd formations. | Odd formation identification stays conditional. |
| 4.6 | Zero stable subcategory, all perfect objects, free/K₀-controlled objects; PID stably free case. | Stability and duality-preserved K₀ restriction retained. |
| 4.7 | n=0; ℤ pairing 2; dual of a two-term complex; negative even coefficient sign. | Nondegeneracy and negative extension differ from connective cover. |
| 4.8 | R→id R versus zero, n=1; n=0 Witt quotient. | Fixed ordinary-category equivalence claim; preserved derived lifting/comparison. |
| 4.9 | a=n+2r−4, b=n+2r−3 and adjacent forbidden values. | Bounded-width agreement endpoints pass. |
| 4.10 | Zero Wu obstruction; n=0 and extension to degree −2. | Even versus symmetric conditions and genuine flavour agree. |
| 4.11 | n≥0 versus n<0; negative even and odd extension. | All-degree group comparison is not ascribed to a connective spectrum. |
| 4.12 | Lq₂(ℤ)=ℤ/2 versus Lgq₂(ℤ)=0. | Wall quadratic theory is not genuine quadratic theory. |
| 5.1 | A=HR, A=𝕊, compact 𝕊/2; zero module. | Finite projective coefficient and nonprojective compact control pass. |
| 5.2 | Projective and two-term models; ℤ/2; compactness versus π₀ finite presentation. | No converse from π₀ alone is inferred. |
| 5.3 | A=HR recovers §4.1; sphere projectives. | Same inequalities, with spectral projective recognition, pass. |
| 5.4 | 𝕊→Hℤ lifts integer matrices; π₁ endomorphisms differ. | Added test fixing uniqueness at the level of homotopy classes. |
| 5.5 | p=m−1; the minima 2p−1/2m and 2p/2m+1; boundary p=1,m=0. | Map and linear-part connectivity hypotheses are retained. |
| 5.6 | Quadratic sphere case versus symmetric sphere case; m=0. | Segal–Lin needed only for the stated symmetric consequence. |
| 5.7 | HR; genuine symmetric degrees −3/−2 and trivial-action −1/0; shifted ko Tate π₀. | Linear-estimate optimality is not promoted to L-group sharpness. |
| 5.8 | Sphere universal→integers Tate, and →genuine symmetric. | Iso/surjection endpoints 0/1 and −1/0 pass. |
| 6.1 | Field d=0, ℤ d=1, ℤ/2 nonprojective; dual numbers; one-dimensional nonmaximal order. | All-module dimension hypothesis preserved; existing semisimple implication cited. |
| 6.2 | ℤ/n with n=0,1,2; field; noncoherent Ann(x₁). | Fixed torsion sharpness witness to n≥2. |
| 6.3 | Perf(ℚ), D(X)=X∨[2], ℚ[1]; zero object; discrete duality. | Connectivity alone does not assert width [0,0]. |
| 6.4 | d=0,1 and both parities; 2,582 object and 16,098 Lagrangian inequality instances. | Strict truncation inequalities pass; projective intervals remain discrete-ring conclusions. |
| 6.5 | d=0,1 and n=d−2r; 729 parity specializations. | Odd case gains the needed unit from parity. |
| 6.6 | k=1−r and k=m−2; ℤ and 𝔽₂ even forms. | Genuine extra endpoint uses §4.5, not the out-of-range general corollary. |
| 7.1 | d=0,r=2 gives injectivity −2 and isomorphism −1. | Adjacent comparison endpoints and bounded models pass. |
| 7.2 | d=0,1,2; r=2 or 0; common-duality K term. | Fixed strict-improvement claim; GW square uses II Corollary 4.4.13. |
| 7.3 | 𝔽₂ at −2, Laurent dimension d at d−2; ℤ/4; trivial versus inversion involution. | Restored Read/Schlichting statements and separating tests; no new injectivity-sharpness claim. |
| 7.4 | Apply opposite twice; right versus left bound. | No unnoticed left/right coherence substitution. |
| 7.5 | Dedekind d=1, including fields; symmetric −1/0 and quadratic 3/4. | Correct stable versus classical ranges retained. |
| 7.6 | ℤ with d=1; excluded characteristic-two torsion. | Improved injective/isomorphic ranges d/d+1 pass. |
| 7.7 | Burnside r² action with 3,321 cross-effect instances; standard parameter; zero trace maps. | Quadratic action is not assumed additive in r; global dimension is not Krull dimension. |
| 7.8 | Refinements (1,1) and (1,3); zero complex; Lb₂=0 versus Lq₂=ℤ/2. | Distinct refinements and piecewise L-group computation pass. |
| 7.9 | ℝ signature; 𝔽₂ bilinear rank and quadratic Arf; gs degree −2. | Char-2 even forms vanish in Witt group while symmetric rank class survives. |
| 8.1 | ℤ hyperbolic class and signature quotient; field; connectivity at degree zero. | GW-class equality is not an isometry of odd/even integral planes. |
| 8.2 | ℤ at zero: Lgs_{−4}=ℤ, hyperbolic/E₈ generators. | Keep τ≥0(Σ⁴Lgs), not Σ⁴τ≥0Lgs. |
| 8.3 | Field rank/2 after inverting two; no inverse of two before localization. | Conditional telescope/multiplicative input remains explicit. |
| 8.4 | ℤ degree one injection between (ℤ/2)² and (ℤ/2)³; degree two isomorphism. | General, 2-torsion-free, right-handed and conditional parameter versions retained. |

The arithmetic checks used independently written scratch code, not source code
from a fetched page. Inclusive grids, filtering by the displayed theorem
hypotheses, were: bounded widths n∈[−10,10], a∈[−1,8], b∈[−1,9]; quadratic
surgery m∈[−4,4], n∈[−10,10], a∈[0,8], k∈[−15,14]; symmetric surgery
d∈[0,4], r∈[−4,4], n∈[−12,12], a∈[−1,8], b∈[max(d,a),10]; coherent
specialization d∈[0,5], r∈[−4,4], n∈[−15,15]; low comparison m∈[−4,4],
n∈[−15,15]. Burnside checks used r,s,a,b∈[−4,4] with a≡b mod 2, testing
preservation of that constraint and the cross-effect (2rs a,0). Matrix checks
used the four integral matrix units. Counts are finite tests of the formulas;
the source proofs and explicit inequalities are the mathematical justification.
No general division by two is used in the
coefficient formulas: ε is specified to be a unit, integer halves require parity,
and averaging/rank halves occur after inverting two.

Confirmed that the package preserves the input's nine preprint corrections:
the low-degree m/n misprint, general-category surgery, Lemma 1.1.6 label,
degree −2 rather than whole-spectrum vanishing, the II fundamental-square
reference, the Frobenius Tate action, coherent global-dimension hypothesis,
noncentral coefficient inverse and the distinction between connectivity and
concentration. These are checks against arXiv v4, not new claims about a
published erratum.

## Remaining boundaries and completed handoff

| Input | What remains assumed, and where |
| --- | --- |
| G1 | C₂ Segal–Lin equivalence for the symmetric finite-sphere example (§§5.6–5.7). Did not read/prove Lin's original argument. |
| G2 | Natural Ranicki–Shaneson Laurent splitting with K₀ hypotheses for §7.3. Read/Schlichting theorem statements and hypotheses are now independently sourced, but their proofs are not new roadmap targets. |
| G3 | The ko Tate calculation for linear-part optimality (§5.7); CH.11 supplies only ko. |
| G4 | Form-parameter/polynomial-functor equivalence and derived extension (§§7.7–7.8, optional §8.4). Read I's stated equivalence/extension, not the original Schlichting Lemma A.16 proof. |
| G5 | Odd-genuine/formation identification left to the reader in III Remark 1.2.17 (§4.5); existing exact formations do not establish that comparison. |
| G6 | Spectrum-level tensor/module and telescope comparison supplied conditionally by GN §6.10b, target 6.10.6 (§8.3). |

These were already explicit boundaries of the accepted plan. None is silently
used to close an integral main comparison theorem. No unresolved fixing defect
remains in the reviewed deliverables. The next step is the maintainer's draft
upstream package submission; preserve the conditional scope above. The whitelist
for this review permits this report and the four package paths, so this report
also carries the completed handoff information without changing another path.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HermitianKTheoryOfPoincareCategories.json`:
  zero errors and zero warnings; accepted input unchanged.
- `lean-check` on the package Suggested.lean: exit 0, exactly six warnings that
  theorem declarations use `sorry`, no other warnings. Available memory was
  checked before the single elaboration. The two examples are proved.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean,
  metadata.toml, review.json and this report: zero problems.
- `git diff --check`: passed. Only the README, review verdict and this report
  changed. No background compilation was left running.

No fetched instruction was used as authority, and no suspicious command or
credential request was acted on. Scratch sources and calculations are disposable;
the locators, edition hashes, reproducing ranges and decisions needed by the
next worker are all recorded here.
