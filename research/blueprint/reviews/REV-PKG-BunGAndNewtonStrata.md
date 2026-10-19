# Independent package review: BunGAndNewtonStrata

**Verdict: accepted with corrections applied.** Review #10893, `REV-PKG-BunGAndNewtonStrata`, by Codex, session `codex-GpHwvp`, on 2026-10-19. The reviewed package came from PR #11003, authored by Claude, session `claude-9nCqNi`; this reviewer did none of that package work. The blueprint packet was read and checked, but not edited. This is acceptance of a roadmap for formalization, not a claim that its admitted milestone theorems have been proved in Lean.

The README now has 102 target subsections in five layers. All 98 packet-node anchors remain usable; the fundamental-group anchor now leads to its upstream ownership statement. Definitions retain their API outlines and at least three discriminating Checks. There are 37 sections with Checks, including additional checks on difficult theorem interfaces. The report uses the revised subsection numbers throughout.

## Quality, coverage and dependencies

Read the complete package and the binding review, blueprint, expansion and upstream-guide instructions. Compared its form with the upstream ReductiveGroups and AdicSpaces READMEs, and the current LocalGaloisGroups and ProfiniteArithmetic suggested-file headers. It has the opening Summary, scope, conventions, supplier contracts, ordered layers, exact hypotheses, source locators, definition APIs, Checks, worked examples and layer dependencies. Heavy geometric definitions remain README targets; their names occur in the Lean closing comment. `metadata.toml` remains `topic = "math.NT"`.

Walked the prerequisite chain for every subsection, including the representation-theoretic, relative Tannakian, crossed-module, period-space and flag-variety inputs. Checked the supplier layers against the order file and their descriptions. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` identifiers remain. BunGAndNewtonStrata and its linear supplier are not separate ranked entries in the 94-roadmap Caraiani–Newton order; this review does not assign them a fictitious tier. The Igusa imports are restricted to its unitary datum and dimension input, rather than its restatement of B(G). The endoscopic import is its cohomology layer, rather than its later reductive-bundle applications. Their reciprocal downstream uses are recorded in Scope and Downstream consumers.

The equal-characteristic topology argument now uses only the schematic-to-Bun direction of GIZ26 Theorem 7.18. Its full reverse comparison would require meromorphic bundles and parahoric shtuka stacks, which this roadmap does not otherwise construct. New §2.19 supplies the smaller interface actually needed: period spaces retaining the outer boundary, vector-bundle v-descent, comparison of their bundle categories, Frobenius restriction with R⁺=R^circ, and constant class on the completed rank-one valuation boundary. Section 2.17 now names the perfectly finitely presented Newton closed-locus theorem used to make the valuation-ring argument work. These targets precede §2.20 and cite their constructions and proofs; no later shtuka theorem is assumed.

## Corrections applied

1. Removed the duplicate `AlgebraicPiOne` subsection. Its generic construction, cocharacter class, coinvariants and functoriality are supplied by ReductiveGroupsPartII §RG2.1.5. The genuinely additional inner-form comparison is retained as `PiOneTransport.innerInvariant`, explicitly distinguished from upstream change of maximal torus. Renumbered Layer 1 and repaired linked subsection labels.
2. Replaced the induced-torus-resolution locator by the proof of Kot85 Lemma 2.2(b), p. 207. Added the permutation-lattice construction and the Shapiro argument for invariant surjectivity. Coinvariant right exactness is not used as a substitute for surjectivity on invariants.
3. Corrected T_sc to the preimage of T in G_sc, and identified the precise Weil-cohomological vanishing in the proof of FS Lemma III.2.11, p. 94. A torus is not called simply connected. Kept the p-adic restriction on the crossed-module construction and its L^sep coefficients.
4. Sourced the previously flagged elliptic-torus input with Kot14 §13.3, proof of Proposition 13.1, p. 66, and Dillery23 Theorem 5.3 and the following discussion, p. 54, for the equal-characteristic cohomological input.
5. Corrected minuscule Levi lifting to use W(G,T), with T maximal in M. W(M,T) and N_G(M)/M do not suffice. The GL_3 example with blocks of sizes one and two witnesses the distinction.
6. Added the missing basic-Kottwitz and torsor identifications to the connected-centre adjoint-torsor argument: Kot14 §1.3.3, p. 3, Proposition 13.1, pp. 65–66, and Proposition 10.4, pp. 50–51.
7. Fixed the displayed automorphism matrices for the ordered bundle O⊕O(1): the positive BC(O(1)) entry is lower left, H⁰(O(−1)) is the zero upper-right entry, and conjugation by diag(a,d) scales the lower entry by d/a. The filtered chart still uses the opposite extension direction.
8. Replaced the ambient-linear-group tensor-lift shortcut by `GIsocrystalFamily.tensorOrbit_lift`. The acting group is Aut_Φ(V₀)×Aut_Φ(L₀); the pair stabilizer is the smooth group J_b. Its orbit map has local continuous sections on the rational orbit, obtained by the smooth/étale local lifting argument of Conrad Lemma A.2.1, p. 62. Pullback and clopen refinement give the profinite-chart lift. Keeping the line automorphism prevents a μ_p stabilizer from invalidating the positive-characteristic argument.
9. Corrected HK22 v5 pagination: after its first PDF page, printed page = PDF page − 1. Retained the normal-base hypothesis, the denominator-dependent effective-lattice bound and the distinction between profinite étale triviality on normal charts and v-local triviality in general.
10. Added `GIsocrystalFamily.newtonClosed` and the period-boundary targets described above. The ideal must be finitely generated before applying the product-comb Bézout property. The completed open valuation subsheaf has the closed schematic class; its v-sheaf closure contains the discrete generic-field locus, giving the reversed specialization on Bun_G.
11. Repaired the ordinary-class construction: the general unique maximum is ordinary precisely when it attains μ◇. It is not asserted that every inner form has an ordinary class. The quaternion example is retained.
12. Clarified that the component-coset statement is a kernel/fibre deduction from GLX's representative Kottwitz formulas, not a theorem stated verbatim there.
13. Added the missing pure-inner-twist API and three tests, including GL(V) for a frame torsor. Arrows act by inverse precomposition in the Isom description. Clarified that the constant graded automorphism group scheme applies to the standard E_b, with twisting for a form of it.
14. Removed three duplicate rational-weight API targets, and recorded the current native scheme vector-bundle category and pullback coherence among the suppliers. Replaced admitted Lean examples by proof bodies; removed redundant examples to respect the two-per-definition bound; promoted four unproved boundary checks to named theorem targets also listed in the README.

## Source verification

The fifteen-section sample was drawn with seed 10893 from the original numbered sections, before checking their sources. The table translates those selections to the revised numbers. Every source was opened and its relevant statement and surrounding argument read. Mathematics below is paraphrased; no source passage was copied into the package.

| Revised section | Source and locator checked | Result |
| --- | --- | --- |
| §4.5 contracting chart action | FS Proposition V.3.6, pp. 175–176 | Confirmed the positive-power contraction, escaping inverse iterates and proper punctured quotient. |
| §1.39 transferred torus specialness | KMPS §1.1.16 and Corollary 1.1.17, pp. 12–13 | Confirmed the centralizer-torus and rational-Newton hypotheses. |
| §4.8 rank-two chart | FS Example V.3.1, p. 173 | Confirmed the extension orientation and split/stable alternatives. |
| §1.42 component coset | GLX equations (1.3)–(1.4), p. 807, and §2.2, p. 818 | Clarified the elementary fibre deduction and lack of a preferred origin. |
| §1.37 torus specialness | KMPS Definition 1.1.7, p. 8 | Confirmed the torus lift and the image in B(G). |
| §2.4 smallness | FS Proposition III.1.3, pp. 88–89 | Confirmed smallness of the moduli stack, rather than of an orbit set. |
| §3.14 unitary dimensions | CS24 §2.1, pp. 11–12, and Theorem 2.7.3, p. 33 | Confirmed the unitary datum and d−d_b dimension. |
| §2.9 Weil–curve comparison | FS Proposition III.2.12(ii) and Remark III.2.14, pp. 94–97 | Confirmed finite diagonalizable coefficients, comparison direction and characteristic restrictions. |
| §3.18 connected components | FS Corollary IV.1.23 and Lemma IV.1.24, pp. 113–114 | Confirmed integral π₁(G)_Γ and the use of connected basic loci. |
| §2.2 torsion cohomology | FS Proposition III.2.12(i), pp. 94–95 | Confirmed the separate p-primary and prime-to-p arguments. |
| §1.44 adjoint torsors | Kot14 Proposition 10.4, pp. 50–51 | The cited surjectivity needed the additional basic/H¹ identifications, now supplied. |
| §1.1 induced resolutions | Kot85 proof of Lemma 2.2(b), p. 207; Kot97 §6.5, p. 287; GLX proof of Lemma 3.16, pp. 829–830 | Corrected the resolution locator and distinguished the lattice arguments. |
| §3.9 stratum classification | FS Proposition III.5.3, p. 106 | Confirmed the full automorphism v-group, including its positive kernel. |
| §1.8 invariants | KMPS §1.1.2, pp. 6–7; RR96 Theorem 1.15, pp. 160–162; He16 §2.2, p. 22, Theorem 2.6, pp. 25–26; Kot14 §13, pp. 65–66 | Confirmed both invariants, integral torsion and their rational compatibility. |
| §3.6 opposite parabolic | FS equation III.5.1.1, pp. 105–106 | Corrected the ordered O⊕O(1) matrix and its conjugation character. |

In addition to the flagged elliptic-torus locator, directly checked the new Conrad, GIZ26 and PR24 inputs, RR96 Theorem 3.6(ii), pp. 171–172, HV11 Theorem 7.3, arXiv v3 p. 28, SW Proposition 19.5.3, pp. 180–181, and the filtered-functor splitting statements of Zie15 used in §§0.2 and 3.3. Read FS Proposition V.3.5 and the paragraph following it: its distinction between an absolute diamond and a morphism representable in diamonds is intentional and is correctly retained. A base change to a perfectoid test space is essential to that relative assertion.

Public PDF version receipts, SHA-256:

| Source | Digest |
| --- | --- |
| FS author PDF | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |
| KMPS author PDF | `fd22990bc3eff8a726375cf8f0c9015828c39f1c32b0717347a9ef23ce9b52db` |
| GLX published PDF | `c40fe1fc5e0941812cf3aca5ba77c471ee49122c63ed7b0d864d322136031485` |
| CS24 arXiv v2 | `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e` |
| Kot14 | `37c9980b749d315d014c5046f486ea9d8bac1acc3753fe766ae45ac7907f12a4` |
| Kot85 | `51fe79cbe6798ea061128fd294c2459046572fcf5f7ed150c75d50e974819171` |
| GIZ26 arXiv v3 | `78855695f8654374174073434eca08297751d397786b3abf29e367c9cc2cff23` |
| Dillery23 public published PDF | `39ed5beb15e862144dd86e9640a051c6022bfe6c0fe77374289d8063af89d7f3` |
| Conrad author PDF | `a1b909e7fdaaf56a21811e0379c9370ae8e9e51e75e047c6f1db927e278fca3c` |
| PR24 public published PDF | `ef0234368c2527ac6792b13a1ddcbb44c7ba8dae6a0563cd4778b2cfbfe8657e` |

All books used were public author copies permitted by the library index. No restricted book or passage was copied.

## Current upstream duplication audit and handoff

Audited TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current TauCeti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. Searches used the objects and their mathematical properties: coroot quotients and maximal-torus independence; diagonalizable comodules, weight submodules and finite support; locally free tensor categories and pullback coherence; semilinear Frobenius, rational slopes, Newton orders, reductive centralizers, torsors, Weil cohomology, flag strata and period-space boundaries. Read the matching declarations and roadmap targets, rather than treating name matches as duplication.

Checked the nine newer roadmaps AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, including their suggested files; also the Completed roadmaps ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. The relevant new overlap is the native scheme vector-bundle category. No other target removal arose from those thirteen roadmaps.

Every removal and replacement:

| Removed package target | Existing supplier / retained variant |
| --- | --- |
| `AlgebraicPiOne` construction, `ofCocharacter`, `coinvariants`, `map`, Weyl invariance and independence of the chosen maximal torus | ReductiveGroupsPartII §RG2.1.5, including its canonical change-of-torus identification. Mentioned in Scope, with no duplicate target subsection. |
| `AlgebraicPiOne.innerInvariant` name | Renamed to the kept variant `PiOneTransport.innerInvariant`, §1.1: transport between inner forms, beyond the already supplied identification between maximal tori of one group. |
| `SlopeProtorus.weight` | Corestriction followed by `TauCeti.DiagonalizableGroup.weightSpace`, in `Algebra/AlgebraicGroup/DiagonalizableGroup/Weight.lean`. |
| `SlopeProtorus.mem_weight` | `TauCeti.DiagonalizableGroup.mem_weightSpace` in the same module. |
| `SlopeProtorus.finite_weights` | `TauCeti.DiagonalizableGroup.finite_setOf_weightSpace_ne_bot` and its internal direct-sum decomposition. The retained common-denominator theorem adds integrality of n·q, beyond finite support. |

The current `AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean` supplies finite locally free sheaves, free objects, symmetric monoidal structure, finite biproducts and pullbacks; `Functoriality.lean` supplies `pullbackId` and `pullbackComp`. These are now explicitly consumed. They do not supply analytic relative-curve bundle moduli or the valuation-boundary comparison. No new definition has been moved to an unlisted higher roadmap, and no packet edits are needed to apply this review. The maintainer should port the corrected README and Suggested.lean together, preserving the new §2.19 before the topology theorem. This report is the handoff, within PACKAGE_REVIEW's permitted paths.

## Lean signatures and examples

`Suggested.lean` elaborated with `lean-check` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`: exit 0, 41 warnings, all `declaration uses sorry`. The only subsequent Lean edit wrapped the closing comment and listed its remaining heavy targets more explicitly. The file is under 500 lines. No data carrier or data field has an admitted body. Theorems and proof fields retain the intended roadmap admissions. All 20 retained examples have proof bodies; the Witt class-separation examples use the stated classification theorem, so they test its normalization without independently proving classification.

| Signature checked | README comparison |
| --- | --- |
| `SigmaClass.mk_eq_iff` | §0.6: quotient equality is c=g b σ(g)⁻¹, with the same orientation. |
| `WittRankOne.classification` | §0.5: prime p, algebraically closed characteristic-p residue field, Q_p Witt coefficients, p^m↦m. The all-E version remains a separate README target. |
| `SigmaCentralizer.conjugate_points` | §§1.13–1.14: changing b by g transports h by g h g⁻¹. |
| `frobeniusNorm_twisted` | §1.9: exactly r factors and terminal σ^r(g)⁻¹; at r=0 both sides are 1. Decency separately requires r>0. |
| `GLnSlopeData` and `dominance_antisymm` | §§1.5, 1.8, 1.21: decreasing rational slopes, integral total and multiplicity divisibility, equal κ in dominance. |
| `GLnSlopeData.rank_one_half_impossible` | §1.8: multiplicity one cannot carry denominator two. |
| `SlopeProtorus.character` | §1.4: actual bialgebra map E[ℤ]→E[ℚ], [n]↦[nq], not a numerical proxy for a missing protorus carrier. |
| `SlopeProtorus.finite_weights_and_denominators` | §1.4: finite comodule over the actual diagonalizable group algebra; positive common denominator. |
| `SlopeProtorus.half_not_integral` | §1.4: field E and distinct images of the generator; excludes collapse in a zero coefficient ring. |
| `KottwitzDescent.descent` and `abelian_classification` | §1.8: genuinely equivariant homomorphism and integral cyclic coinvariants. The abstract algebraic specialization is stated as such. |
| `ComponentCoset.translate`, `sign_coinvariants` | §1.42: a chosen solution trivializes the affine fibre; τ=−1 gives ℤ/2, not zero. |
| `FamilyDescentControls.shear_violates_bound` | §2.17: nonintegrality of scale·a contradicts the stable over-lattice bound by applying Frobenius to the second basis vector. |
| `FamilyDescentControls.ambient_lift_not_tensor_lift` | §2.17: the explicit invertible rational matrix is not any diag(t,t⁻¹). The theorem does not deny existence of a different tensor-preserving lift. |

The four checks that remain named admitted theorems, rather than admitted examples, are `rank_one_half_impossible`, `half_not_integral`, `sign_zero_ne_one` and `sign_two_eq_zero`. Removed the redundant acceptability example, the uniformizer coercion example, the third component-coset example and the three generic twisted-conjugacy examples; their mathematics remains in the README. The retained examples concern definitions this roadmap actually introduces, with at most two per definition.

## Adversarial mathematics pass

The following table covers every numbered subsection, including the definitions, theorem statements, identities, normalizations and interfaces within each range. Instances were computed against the stated formulas and source arguments; only the twenty Lean examples are claimed as elaborated proof bodies. A nonexistent local field with q=1 is excluded by the standing finite-residue-field hypothesis. Rank zero is used for numerical GL_n data; it is not used to infer a GL_n assertion whose hypothesis is n≥1.

| Statements checked | Instances and computations | Outcome / correction |
| --- | --- | --- |
| §§0.1–0.4 tensor bundles, reconstruction, descent | G=1 gives the terminal torsor groupoid; GL_n gives frames; determinant is covariant extension despite contravariant restriction. Euler filtration on P¹ is locally split but O²≄O(−1)⊕O(1). | Exactness, rational representations and affine/local splitting hypotheses retained. |
| §§0.5–0.6 isocrystals and sigma classes | G_m: 1,p,p⁻¹ have slopes 0,1,−1; σ=id gives ordinary conjugacy, abelian σ=id gives equality; p=2 still has nonzero p in the Witt fraction field. | Units are taken after localization; algebraic closedness is present in Witt classification. |
| §§0.7–0.8 twisting and families | A frame torsor twists GL_n to GL(V); G=1 is terminal. A schematic constant family and a curve bundle have different automorphism sheaves. | Added API/tests and inverse-precomposition arrow convention. |
| §§1.1–1.3 resolutions, Weil cohomology, abelianization | Norm-one torus has induced resolution with G_m kernel; SL_n complex is contractible; PGL_n retains ℤ/n; μ_p over Q_p detects inertia. | Fixed source and T_sc description; no integral averaging or L-only coefficients. |
| §§1.4–1.5 slope protorus and dominance | q=1/2 sends [2] to [1]; q=0 sends every generator to the unit. Rank-one half slope is impossible. GL_2 half tuple lies below (1,0). | Native finite weight theory imported; common denominator is positive; positive coroots retained. |
| §§1.6–1.8 Levi descent, Hodge average, invariants | Split GL_2 diag(π,1): ν=(1,0), κ=1. Norm-one torus: both Newton vectors zero but κ differs modulo 2. Finite Galois orbit has nonzero cardinality. | Both-characteristic elliptic input sourced; integral κ remains indispensable. |
| §§1.9–1.12 decency and classification | N₀=1, N₁=b, N₂=bσ(b); b=π needs r factors, not r+1. Identity straight class is a point when σ=id. | r>0 required for decency; representative norms and orbit classification distinguished. |
| §§1.13–1.17 centralizers, defect, central Newton | b=1 gives σ-fixed points; σ=id gives the whole group. GL_2 basic half-slope gives a division inner form; split slopes give a torus. Defect uses split ranks; denominator clearing gives an actual cocharacter of J_b. | Representative conjugation and centralizer descent directions agree. |
| §§1.18–1.20 basic classes, inner form and Morita | A torus with two character slopes is still basic. Rank-one π^m maps to O(−m). Slope 1/3 gives arithmetic Brauer invariant −1/3, distinguished from +1/3; half slope alone would miss the sign. | Right A-modules use Hom(E_b,E) and precomposition. |
| §§1.21–1.24 order, representation criterion, bounds, Levi formula | Half tuple≤(1,0), converse fails at the first partial sum. Norm-one torus classes with different κ are incomparable. Torus acceptance fixes κ. | Fixed-κ order retained; Newton inequalities alone do not define acceptance. |
| §§1.25–1.26 maximum and ordinary | GL_2 maximum attains the Hodge tuple; quaternion inner form can have a maximum without an ordinary class. Empty tuple is basic and ordinary. | Corrected the general-maximum wording; quasi-split hypothesis remains on ordinary existence. |
| §§1.27–1.30 ordinary transport and products | Split translation has its expected κ; derived isogeny preserves the Newton comparison but not an arbitrary change of μ; products split both invariants; restriction of scalars averages the Frobenius orbit with positive degree. | Unramified, integral-model and compatibility hypotheses retained. |
| §§1.31–1.34 Levi fibres, finiteness, rational witnesses | Basic GL_n class has central Newton in G; noncentral anisotropic orbit need not have a rational representative. Finite acceptable fibre retains its unique basic member. | Rational witness is required where used, rather than inferred from a Galois-fixed orbit. |
| §§1.35–1.39 minuscule lifting and special tori | GL_3 blocks 1+2 require a Weyl transposition outside W(M,T); split torus norm averages trivially; ellipticity makes the relevant transferred class basic. | Corrected the Weyl group; no false normalizer quotient or unproved rational-Newton assertion. |
| §§1.40–1.45 abelianized comparison, cosets and adjoint torsors | τ=−1: τx−x=2 has x=−1; difference 1 has no solution; integral quotient is ℤ/2. GL_2→PGL_2 tests z-extension lifting; connected centre is required for the adjoint result. | Cosets have no canonical origin; added the missing H¹/basic source chain. |
| §§2.1–2.4 site map, torsion, stack and smallness | G=1 yields a point stack. The site pullback sends T/S to X_T; no geometric projection X_S→S is needed. Prime-to-p proper base change and p-primary Artin–Schreier arguments are different. | Correct scopes retained. |
| §§2.5–2.8 point classification, HN and trivial locus | π^m gives O(−m); dominant bundle tuple is w₀(−ν), not componentwise −ν. The trivial locus is open, rather than every constant class being open. | Normalizations and strict-total-disconnectedness hypotheses agree with the sources. |
| §§2.9–2.10 Weil–curve and crossed-module comparison | Split G_m recovers degree; finite μ_p coefficients use L^sep and the separate p-primary calculation. Simply connected complex has no abelianized class. | No p-adic coefficient comparison extended silently to characteristic p. |
| §§2.11–2.14 Grassmannian lifting and uniformization | G_m modifications give all degrees; central-torus quotient tests the lift; a geometric point lift alone does not establish a stack v-cover. | Effective descent and the specified lattice-gluing supplier remain explicit. |
| §§2.15–2.18 κ, family descent and components | Norm-one torsion classes remain separated. Rank-two shear π^−N forces a denominator ≥N. A tensor-line pth-power action with fixed basis can have μ_p stabilizer. ξ^m modification gives κ=−m. | Added smooth pair-orbit lift and finitely presented Newton closed locus; kept denominator and sign witnesses. |
| §§2.19–2.20 boundary comparison and topology | [ϖ]=0 is retained at the outer boundary but excluded in the usual period domain. R⁺⊊R^circ is a negative control for full faithfulness. Rank-one π and 1 give O(−1), O; GL_2 ordinary is a specialization of basic. | Added complete forward route and the R⁺=R^circ hypothesis; no full meromorphic comparison assumed. |
| §§2.21–2.23 modification bounds and quotient group | G_m ξ^m gives the inverse Hodge κ; minuscule GL_2 reaches basic and ordinary classes. Tensor data for G^c determine B(G^c), not a lift to B(G). | Inverse Hodge class and quotient-group restriction retained. |
| §§3.1–3.3 graded and filtered automorphisms | O⊕O(1) graded automorphisms are E××E×. Weights 0,3/2 have a root quotient at 3/2, none at 1 or 2. λ=0 gives a Levi quotient, not a vector group. Euler filtration is not globally split. | Clarified the standard object versus its forms; kept affine splitting and λ>0. |
| §§3.4–3.6 full positive kernel | With ordered columns O,O(1), lower-left H⁰(O(1)) is nonzero and upper-right H⁰(O(−1))=0; diag(a,d) acts by d/a. | Corrected matrix and character; total positive dimension is 1 in this example. |
| §§3.7–3.11 semistability, tori and strata | Basic torus may have two standard-character slopes. G_m gives [*/E×] at each κ. Nonbasic GL_2 has a positive kernel and stratum dimension −1; basic adjoint slopes give dimension 0. | No replacement of full J̃_b by J_b(E) in a nonbasic stratum; no canonical multiplicative torsion splitting. |
| §§3.12–3.15 flag strata | μ=0 gives a point and dimension 0; minuscule GL_2 has the two expected Newton classes; unitary dimension is d−d_b, ordinary is open with the specified density statement. | Upper Newton unions are closed with the fixed order. |
| §§3.16–3.18 diagonal, smoothness, components | G=1 gives smooth dimension 0; the G_m diagonal retains E× automorphisms. κ=0 and κ=1 cannot be connected; norm-one torus detects torsion components. | Stack dimension, automorphism dimension and component indexing remain distinct. |
| §§4.1–4.3 filtered charts | Graded O,O(1) gives Ext¹(O(1),O)=H¹(O(−1)); basic b has no opposite unipotent part and chart [*/J_b(E)]. | Opposite filtration and relative-versus-absolute diamond distinction retained. |
| §§4.4–4.5 split point and contraction | Zero extension gives O⊕O(1); nonzero gives stable O(1/2). U_π contracts by a positive power; its inverse escapes. Basic chart has empty punctured part. | Proper quotient requires removing the fixed origin. |
| §§4.6–4.8 Jacobian, image and GL_2 chart | Positive tangent slopes give the smooth section locus. GL_2 chart contains its basic generalization and split specialization; the image is the fixed-κ down-set. | Combinatorial image uses §2.20, not openness alone; chart dimension is +1 in the rank-two example. |

## Validation and remaining work

- `lean-check Suggested.lean`: exit 0 at the required pins, only the 41 admitted-proof warnings described above.
- `python3 scripts/check_sorry_data.py` on the suggested file: exit 0.
- `python3 scripts/check_blueprint.py` on the unchanged BunGAndNewtonStrata packet: 0 errors, 0 warnings; 98 nodes, 191 API entries, 119 tests, 29 planets, 12 gap records and 47 requests.
- `python3 research/blueprint/intake.py check-files` on the revised README, Suggested.lean, review JSON and this report: 0 problems.
- Internal-link and section-order audit: all packet-node anchors retained, no unresolved internal anchor, every numbered subsection has a source and Needs, no forward numbered prerequisite. JSON parses and `git diff --check` passes.

No unresolved defect requires another package revision before the draft upstream PR. The intended future work is the formalization stated by this roadmap, including its named admitted theorems; this review does not replace that work with weak carrier substitutes. No second job was claimed.
