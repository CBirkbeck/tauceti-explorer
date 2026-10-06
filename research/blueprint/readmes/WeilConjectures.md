# Weil conjectures and cohomological zeta functions

*Roadmap `WeilConjectures`: the complete blueprint, assembled from its two reviewed parts.*

This document is definitive. Its machine form is two part packets, and its node text is generated from them as their independent reviews left them, so that the two agree node for node:

- `research/blueprint/packets/WeilConjectures--WC.0.json`: stages WC.0–WC.5 with the two WC.5 children WC.5:power-sum-converse and WC.5:surface-alternative, 54 nodes. Written by BP-WeilConjectures--WC.0 on top of two checkpoints, corrected in place and accepted by REV-WeilConjectures--WC.0 on 6 October 2026 (10 nodes verified and 44 corrected, most of them locators and literal excerpts). It leaves WC.5:power-sum-converse `closed` and the other seven stages `planned`.
- `research/blueprint/packets/WeilConjectures--WC.6.json`: stages WC.6 and WC.7, 20 nodes. Written by BP-WeilConjectures--WC.6 on top of a checkpoint, corrected in place and accepted by REV-WeilConjectures--WC.6 on 6 October 2026 (16 nodes verified, 4 corrected). Both stages are `planned`.

The two packets share no node id. The WC.0 part never refers to the WC.6 part. The WC.6 part was planned while the WC.0 part's nodes did not yet exist, so it cites the layers WC.1–WC.5 by stage id and files requests for what it needs from them; the section "Cross-part prerequisites" says which WC.0-part node answers each of those citations, and an **Assembly note** after each affected node says the same where it is read. Assembly notes change no packet.

REV-WeilConjectures--WC.0 asked that its part's reader be brought in line with the corrected packet: four API items and a unit test it added, and three claims it removed (a flatness hypothesis in the sieve, a Layer 15 supplier for twisted forms, and a sign remark on Mustață's (3.10)). Generating the node text from the corrected packets does this, so none of the WC.0 part document's node text is reused. The WC.6 part document is prose organised by topic; the explanations it gives that its nodes do not carry (the valuation pair, the crystalline interface, the acceptance matrix) are carried into the overviews of WC.6 and WC.7 below.

The suggested Lean file `research/blueprint/suggested/WeilConjectures.lean` joins the two parts' files. It is a naming proposal, not an implementation, and `implementationStatus` is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This roadmap owns the zeta-function side of the Weil conjectures over a finite field. Let k be a finite field with q = #k = p^f elements (q need not be prime), k_r its extension of degree r, X a separated scheme of finite type over k and N_r = #X(k_r). The point-counting family of Tau Ceti's open pull request 196 (CohomologicalPointCounting, "PR196" below) constructs the points, the Frobenius actions, rational ℓ-adic cohomology with compact support, the Grothendieck–Lefschetz trace formula and the zeta function

Z(X, T) = ∏_{x ∈ |X|} (1 − T^{deg x})^{−1} = exp(Σ_{r≥1} N_r T^r / r).

This roadmap compares those objects with its notation and carries them to the four classical conclusions, first for smooth projective and then for smooth proper X of pure dimension d: rationality over ℚ, with a normalised integral numerator and denominator; the functional equation Z(X, 1/(q^d T)) = (−1)^χ Δ T^χ Z(X, T) with Δ² = q^{dχ} and an exactly determined sign; integral degree factors P_i ∈ ℤ[T], independent of ℓ, whose reciprocal roots have every complex conjugate of absolute value q^{i/2}; and the comparison of deg P_i with Betti numbers in a supplied family. Weights and purity themselves are proved in DeligneWeightsAndPurity; this roadmap extracts their consequences for zeta functions and point counts. The order is Deligne's: the rationality and duality prefix WC.0–WC.2 precedes purity and never uses it, and the extraction of the integral factors (WC.3) follows it.

Around that spine it plans the point-count consequences (all-extension bounds, recurrences, complete intersections, weighted counts on stacks, the Hasse–Weil sieve, polynomial point counts and Tate cohomology after van den Bogaart–Edixhoven and Bergström–Faber–Payne), an independent finite-spectrum theory, an independent proof of the Riemann hypothesis for curves by intersection theory on C × C, the extensions of Weil II (smooth proper, mixed, rational homology manifolds, Deligne–Mumford stacks), and worked realizations.

- **WC.0, the actual geometric inputs.** N_r is the cardinal of Hom_k(Spec k_r, X), independent of the chosen extension and compatible with towers and with q-power Frobenius; a closed point is an orbit of arithmetic Frobenius on X(k̄) of length its residue degree; this roadmap's degree-i space and operator are PR196's rational H_c^i(X_k̄, Q_ℓ) and continuous geometric Frobenius, with the pullback convention, base change F ↦ F^r and the Tate-twist normalisation. The audit of the private repository the stage text names is a recorded gap.
- **WC.1, zeta arithmetic.**
  - The integral Euler product and its laws (disjoint unions, open–closed decomposition, base extension), the arithmetic zeta of a scheme of finite type over ℤ and its finite-field specialisation; N_r = Σ_{m|r} m·a_m and its Möbius inversion; the cohomological determinant formula.
  - Rationality over ℚ by Hankel descent along Q ⊂ Q_ℓ, local Fatou integrality at every prime including p, and the unique normalised integral reduced presentation.
  - The counting tools of Bergström–Faber–Payne: the mass of a finite groupoid, weighted counts on stacks (stratifications, quotients by connected groups through Lang's theorem, coarse spaces, the stack trace formula), twisted forms and their traces, signed Frobenius configurations and the inverse-zeta formula, its termination for proper Y with no odd cohomology, the Hasse–Weil sieve for families of curves, and equivariant point-count characters.
  - The curve numerator before any root bound.
- **WC.2, Poincaré duality and the exact functional equation.** From the actual graded perfect pairing: b_i = b_{2d−i} and the signed equation with Δ² = q^{dχ}; the parity of dχ through the alternating middle pairing, ℓ = 2 included; descent of the multiplier to ℚ and the sign ε = ±1 of the usual form ε q^{dχ/2} T^χ, with ε = (−1)^N for even d; the sign after base extension, ε_r = (−1)^{(r+1)χ} ε^r; and equivariant palindromicity of polynomial counts.
- **WC.3, integral factors, all-conjugates RH and ℓ-independence.** The generic extraction (Weil I, proof of (1.7) ⇒ (1.6)) for any degreewise pure realization of a normalised integral rational function, keeping multiplicities and every embedding, and its application to smooth projective X with the purity of DWP.4.
- **WC.4, Betti numbers in families.** Étale and singular Betti numbers agree along a supplied smooth proper family with a chosen étale path; no variety over a finite field is assumed to lift. Equivariant polynomial point counts of smooth proper schemes over ℤ (Bergström–Faber–Payne, Proposition 9.3).
- **WC.5, point-count bounds and curves.**
  - |N_r − (1 + q^{dr})| ≤ Σ_{i=1}^{2d−1} b_i q^{ir/2} for every r; permuted components and dimension zero.
  - Compatibility with the independent curve estimate of DWP.1 and the Hasse bound of Tau Ceti's EllipticCurves; Newton identities and recurrences; Deligne's complete-intersection estimate.
  - Polynomial point counts: the predicate, the little-o vanishing criterion, Tate semisimplification over an open U ⊂ Spec ℤ, and full Tate cohomology over Spec ℤ.
- **WC.5:power-sum-converse, the finite-spectrum lemma.** Sixteen numerical statements over normed fields: weighted exponentials from consecutive moments (inverse Vandermonde), roots bounded by an eventual bound C·R^n on the moments, grouping of coincident roots, the unweighted converse in characteristic zero, the nonarchimedean negative-power obstruction, the rational generating function in its formal, Laurent and convergent forms with its pole criterion, equality under a reciprocal pairing, the strict little-o lemma and the graded approximation lemma of van den Bogaart–Edixhoven. No geometry enters.
- **WC.5:surface-alternative, curve RH by intersection theory.** |N_r − 1 − q^r| ≤ 2g q^{r/2} from SF.5's Hodge index theorem on C × C, compared with the point tower; then curve RH through the finite-spectrum converse and the duality of WC.2, with no purity input.
- **WC.6, broader geometry.** Integral ℓ-independent factors and the signed functional equation for smooth proper, not necessarily projective, schemes (Weil II 3.3.9); weights of the reduced divisor of a mixed L-function (3.3.4); proper rational homology manifolds (3.3.11); purity for smooth proper Deligne–Mumford stacks. The finite-field crystalline comparison is imported from RD.7.
- **WC.7, worked realizations and the assembled endpoint.** Projective spaces, finite étale schemes, Künneth products, curves, y² = x³ − x over F_5, the genus-two curve y² + y = x⁵ over F_2, the sign for P², G_m with compact support; Schröer's base-field cycle classes and surface counts (constant numerical Picard group, the 25-point surfaces, the rational-surface criterion); and the assembled smooth proper theorem with its separate APIs.

The blueprint has 74 nodes: 54 in the WC.0 part and 20 in the WC.6 part, of which 3 are definitions, 61 theorems, 4 lemmas, 2 comparisons and 4 applications. It shows 41 planets. WC.5:power-sum-converse is `closed`; the other nine layers are `planned`: every target is a node whose prerequisite chains end in the libraries, in another roadmap's node or requested stage, or in a recorded gap. None is `closed`, because the geometric carriers they consume (rational ℓ-adic cohomology with its Frobenius, duality, cycle maps, stacks) are planned elsewhere and recorded here as requests and gaps.

**What is not here.**

- Finite-extension points, Frobenius actions, closed points and orbits, rational ℓ-adic cohomology with compact support, the trace formula, and the zeta and L-function objects: PR196 (FrobeniusGeometry, EllAdicRealization, TraceFormula, EtaleBaseChange, ComplexComparison), which SchemeAndStackFoundations SF.2 integrates into the atlas. No second zeta function, cohomology theory or point type is built here.
- Weights and purity: DeligneWeightsAndPurity. Reciprocal-spectrum linear algebra and Weil numbers are DWP.0's, the curve estimate through the Jacobian DWP.1's, purity for smooth projective varieties DWP.4's, Weil II's weight bounds and smooth proper purity DWP.7's, and the weight-facing examples DWP.10's.
- Duality, cycle classes, weak Lefschetz and trace formulas for correspondences: EtaleDualityAndPerverseSheaves EDC.1–EDC.4 and EDC.8.
- Descent, twisted forms, quotient stacks and coarse spaces: SF.1. Intersection theory on surfaces (Riemann–Roch, adjunction, the Hodge index theorem): SF.5.
- Rigid and crystalline cohomology and their comparison with ℓ-adic Weil factors: PadicDifferentialEquationsAndRigidCohomology RD.7.
- ℓ-adic cohomology, duality and trace formulas on Deligne–Mumford stacks, numerical Picard local systems, and the Enriques and rational elliptic surfaces: proposed roadmaps that have no stages yet (see Boundaries).
- Point counts of particular moduli spaces: MotivicStructuresInModuliOfCurves.
- Analytic continuation of global Hasse–Weil L-functions over number fields: no node asserts it. The finite-field "functional equation" is an identity of rational functions in T.

## Boundaries

The roadmap's ownership follows the restructuring proposal RS-17, which REV-RS-17 accepted on 23 September 2026. RS-17 keeps WeilConjectures as a roadmap of its own, because its rationality and functional-equation prefix precedes general purity, and narrows every layer to what is listed under "Purpose and scope". PR196 remains the unchanged owner of the zeta and trace objects. The reviewed library audit (AUDIT-19) finds WC.0–WC.6 not built and WC.7 a process layer; the WC.6 part's structural proposal keeps WC.7's mathematics (see "Structural proposals").

**Suppliers.** These are the prerequisites of the nodes below that lie outside the roadmap.

- **The pinned libraries.**
  - Mathlib supplies genuine finite-field extensions with their cardinality and embedding counts, Möbius inversion, power series, Laurent series and rational functions with their comparison maps, det(1 − T·M) as `Matrix.charpolyRev` with its value at zero and its linear coefficient, Vandermonde matrices and nonsingular inverses, norms of finite sums and geometric series, the p-adic norm, fixed fields of Galois extensions, the Gauss lemma over integrally closed domains, groupoids with their automorphism groups and isomorphism classes, orbit relations, the prime-power predicate, number-field discriminants, Weierstrass equations, and the integral pro-étale ℓ-adic sheaf and cohomology groups.
  - Tau Ceti supplies the point count and Frobenius trace of a Weierstrass curve over a finite field, and the representation ring with its character map and virtual-character lattice.
  - The 65 declarations are listed under "What the pinned libraries have". Neither library has the zeta function of a scheme, rational ℓ-adic cohomology with a Frobenius action, or a trace formula.
- **PR196, CohomologicalPointCounting** (TauCetiRoadmap pull request 196, read at head `4bd7237`).
  - FrobeniusGeometry Layers 4–5 (point sets, extension transport, closed points and orbits) and Layer 7 (the bridge between pullback by the scheme q-Frobenius, the arithmetic descent action and geometric Frobenius).
  - EllAdicRealization Layers 4–10 (rational ℓ-adic cohomology, compact support, the continuous Galois action, Tate twists).
  - TraceFormula Layers 7, 8 and 11–15 (permutation and curve/Jacobian cohomology, products, projective space and localization, the zeta function, sheaf L-functions, worked examples).
  - EtaleBaseChange Layers 7–9 and ComplexComparison Layers 10–12 (transport along a family, Artin comparison).
  - These layers have no atlas identifiers. The WC.0 part therefore records them as gaps ("PR196 … registration"), with exactly what each node consumes; the WC.6 part reaches the same material through its request to SF.2, which integrates PR196 into the atlas. The two routes name the same upstream layers.
- **Tau Ceti roadmaps.** LocalFieldsRamification Layer 0 (finite extensions of Q_ℓ with the extended norm, for local Fatou); EllipticCurves Layer 3 (the Hasse bound, for a compatibility theorem only); NumberFieldArithmetic Layer 6 (an everywhere-unramified finite extension of ℚ is trivial, for full Tate cohomology); AlgebraicCurves Layers 7, 10 and 12 (Hurwitz, Artin–Schreier covers, the model and places dictionary), directly and through FA.3, for the genus-two curve. JacobianChallenge enters through DWP.1 and PR196 TraceFormula Layer 15.
- **DeligneWeightsAndPurity.**
  - Nodes of the DWP.0 part: `DWP.0/characteristic-power-series-and-traces`, `DWP.0/reciprocal-pairing-of-eigenvalues`, `DWP.0/weil-q-number`, `DWP.1/weil-estimate-for-curves` and `DWP.1/weights-of-the-cohomology-of-curves`. That part's review (REV-DeligneWeightsAndPurity--DWP.0) corrected its packet but returned it for a revision of its reader, so these statements are reviewed but not yet accepted.
  - Nodes of the accepted DWP.7 part: `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, `DWP.7/cohomological-bounds-3-3-2-3-3-6` and `DWP.7/weights-mixed-sheaves-definitions`.
  - Stages DWP.4 (purity for smooth projective varieties, for WC.3) and DWP.10 (the nonprojective, Jordan-block and Tate-twist examples, for WC.6 and WC.7). LefschetzPencilsAndVanishingCycles supplies DWP.4 and is not cited directly.
- **EtaleDualityAndPerverseSheaves.** EDC.2:pairings (the graded Frobenius-equivariant Poincaré pairing), EDC.8 (reciprocal polynomials with the q^d scaling and the determinant relation, with the middle-degree sign), EDC.1:biduality (Verdier duality, for rational homology manifolds and stacks), EDC.3 (cycle classes, for Schröer's theorems) and EDC.4 (weak Lefschetz, for complete intersections).
- **SchemeAndStackFoundations.** SF.1 (finite-type point carriers and residue fields, effective Galois descent for twisted forms, quotient stacks, coarse spaces), SF.2 (the integration of the PR196 cohomology and trace formula), SF.5 (intersection theory on surfaces and the whole graph–diagonal Hodge index argument on C × C).
- **Further suppliers.**
  - ReductiveGroupsPartII RG2.3: Lang's theorem H¹(k, G) = 1 for smooth connected G.
  - ArithmeticGaloisRepresentations R01.5: recognition by Frobenius polynomials (Chebotarev and Brauer–Nesbitt).
  - PadicHodgeTheory R06.2 (a potentially semistable extension of trivial representations is unramified) and the node `R06.5/crystalline-comparison-good-reduction` of an unreviewed packet.
  - PadicDifferentialEquationsAndRigidCohomology RD.7: three imported nodes of an unreviewed packet (see WC.6).
  - FunctionFieldArithmetic FA.3: the Artin–Schreier ramification of y² + y = x⁵.
  - FoundationsAndLibraryIntegration LI.1–LI.2 are listed by the atlas as inputs of WC.5:power-sum-converse; the layer's nodes end directly in Mathlib declarations and cite neither.
- **Proposed roadmaps without stages.** These are recorded as gaps, because no stage id exists to cite.
  - "Étale duality, cycle classes and perverse sheaves, Part II: stacks", routed by PAPER-BERGSTROM-FABER-PAYNE-24 (route 7) and proposed again in the EDC.0 part's structural record.
  - NumericalPicardAndContractionDescent, EnriquesSurfacesAndIntegralNonexistence and GenusOneFibrationsAndRationalEllipticSurfaces, routed by PAPER-SCHROER-23.

**Consumers.** These come from the atlas stage links (WC.1 → RD.7, WC.2 → ExcursionOperatorsAndSpectralAction ES7:function-field-automorphic, WC.3 → FiniteFieldsAndCharacterSums FF.2), the RS-17 links, and the packets of other roadmaps that cite this roadmap's nodes or file requests with it. Every request filed with this roadmap is answered by the nodes in the last column, except where the column says otherwise.

| Consumer | What it asks of WeilConjectures | Answered here by |
|---|---|---|
| DeligneWeightsAndPurity DWP.2, DWP.3, DWP.10 (request to WC.1) | Rationality over ℚ of Z(V, t) from the integral point-count series, by the Hankel and Fatou arguments of Weil I §1 | `WC.1/rationality-over-q-via-hankel-determinants`, `WC.1/local-fatou-normalization`, `WC.1/normalized-integral-zeta-presentation` |
| DWP.10/weight-acceptance-suite (request to WC.7) | The Pᴺ and G_m factor conventions | `WC.7/projective-space-degree-factors`, `WC.7/multiplicative-group-compact-support-agreement` |
| DWP.10/compatible-realization-export (prerequisites) | Cited by id | `WC.3/degreewise-pure-factor-extraction`, `WC.3/integral-factors-and-ell-independence-from-purity`, `WC.5/all-extension-point-count-bound`, `WC.5/components-and-dimension-zero` |
| DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11 (request to WC.3) | The algebraic factor lemma of Weil I for an arbitrary degreewise pure realization, for smooth proper X₀ | `WC.3/degreewise-pure-factor-extraction`; its smooth proper application is `WC.6/purity-for-proper-smooth-varieties` (see "Structural proposals") |
| DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification (prerequisite) | Cited by id | `WC.6/purity-for-smooth-proper-dm-stacks` |
| PadicDifferentialEquationsAndRigidCohomology RD.6, RD.7 (request to WC.1) | Closed points of each degree, N_r = Σ_{m\|r} m·a_m, the Euler product and exponential in 1 + tℤ[[t]], the determinant–exponential identity, rational descent, Fatou's lemma, and the ℓ-adic expression of Z(X_{F_{q^r}}, t) for every r | `WC.0/closed-point-degree-comparison`, `WC.1/closed-point-counts-mobius-inversion`, `WC.1/zeta-function-euler-product-and-point-counts`, `WC.1/cohomological-formula-from-the-trace-formula` (with DWP.0's determinant identity), `WC.1/rationality-over-q-via-hankel-determinants`, `WC.1/local-fatou-normalization`, `WC.1/normalized-integral-zeta-presentation`, and `WC.0/geometric-frobenius-realization-comparison` for F ↦ F^r |
| RD.7 (request to WC.3) | The weight-separation lemma over any coefficient field of characteristic zero, with multiplicities and independence of the presentation | `WC.3/degreewise-pure-factor-extraction` |
| FiniteFieldsAndCharacterSums FF.2 (request to WC.0) | #X₀(L) finite and dependent only on [L : F_q] | `WC.0/finite-extension-point-tower-comparison` |
| FF.2 (request to WC.3) | The Riemann hypothesis for curves in all-conjugates form, with P₁ ∈ ℤ[T] of degree 2g | `WC.5:surface-alternative/curve-rh-from-surface-bound` (independent of DWP), and `WC.3/integral-factors-and-ell-independence-from-purity` for curves |
| FF.2 (request to WC.5:power-sum-converse) | The finite-spectrum lemma (Kowalski, Lemma 4.15) | `WC.5:power-sum-converse/power-sum-converse`, with N = 1 |
| FF.3 (request to WC.5) | The curve bound 2g q^{r/2}, the general bound with dimension zero separate, the point/cohomology comparison and the Frobenius convention | `WC.5/all-extension-point-count-bound`, `WC.5/components-and-dimension-zero`, `WC.5/curve-and-elliptic-bound-comparison`, `WC.0/finite-extension-point-tower-comparison`, `WC.0/geometric-frobenius-realization-comparison` |
| EllipticRegulators ER.7/manin-drinfeld (request to WC.5) | \|a_ℓ(f)\| ≤ 2√ℓ for weight-two newforms, through point counts on reductions and Eichler–Shimura | The curve bound for the reduction of X₁(N) is `WC.5/curve-and-elliptic-bound-comparison`. The Eichler–Shimura identification of a_ℓ(f) with a Frobenius trace on the Jacobian is not planned here; it belongs to the owner of the modular curves |
| NeronModelsAndSemistableAbelianVarietiesPartII G.4/picard-point-count (request to WC.7) | The trace formula of a smooth proper rational surface, with H⁰, H⁴ contributing 1, q² and H¹ = H³ = 0 | `WC.7/rational-surface-picard-count-criterion` (its first step), for smooth projective geometrically rational surfaces |
| ExcursionOperatorsAndSpectralAction ES7 (request to WC.2, no consumer node named) | "The Weil conjectures in the form used for the purity and the eigenvalue arguments" | Duality: `WC.2/signed-zeta-functional-equation`. Purity is DWP's; RS-17 links DWP.0 and WC.3 to ES7 for it |
| FunctionFieldArithmetic FA.5 (RS-17 link from WC.1) | The rational and integral zeta descent used by the function-field realization | `WC.1/rationality-over-q-via-hankel-determinants`, `WC.1/normalized-integral-zeta-presentation` |

**Owners.** RS-17 gives each piece of mathematics that more than one roadmap planned exactly one owner. The rows that concern this roadmap:

| Mathematics | Owner | Formerly also planned in |
|---|---|---|
| Geometric Frobenius and rational-point tower; continuous adic realization carriers | PR196 FrobeniusGeometry | WC.0 |
| General Hasse–Weil zeta object, orbit-to-closed-point Euler product, cohomological rationality before weights | PR196 TraceFormula 13 | WC.1, FunctionFieldArithmetic FA.5 |
| The rational and integral zeta descent and comparison API used by the function-field realization | **WC.1** | FunctionFieldArithmetic FA.5 |
| Weil-number and ι-weight definitions; Frobenius-equivariant reciprocal-spectrum linear algebra | DeligneWeightsAndPurity DWP.0 | WeightsInEtaleCohomology R34.1, WC.2, DWP.5, R34.5 |
| The actual graded Poincaré pairing and the geometric reciprocal characteristic-polynomial and determinant relation | EtaleDualityAndPerverseSheaves EDC.8 | WC.2 |
| Smooth projective RH (Weil I) | DeligneWeightsAndPurity DWP.4 | R34.5, WC.3 |
| Factor separation and descent from a common rational zeta function and degreewise all-conjugates purity | **WC.3** | RD.7, WC.6 |
| Weil II weight bounds, valuation triangles and proper smooth purity | DeligneWeightsAndPurity DWP.7 | R34.5, WC.6, FF.2 |
| The curve and abelian all-conjugates estimate and the all-power curve bound | DeligneWeightsAndPurity DWP.1 | R34.2, WC.5, WC.5:surface-alternative |
| The genus-one Hasse bound | Tau Ceti EllipticCurves Layer 3 | DWP.1, R34.2, WC.5 |
| Higher-dimensional all-power point-count inequalities and recurrence normalisation | **WC.5** | DWP.10 |
| The independent power-sum converse, with all positive powers and multiplicities | **WC.5:power-sum-converse** | WC.5, WC.5:surface-alternative |
| Hodge index, surface Riemann–Roch, adjunction and the graph–diagonal computation on a product of curves | SchemeAndStackFoundations SF.5 | WC.5:surface-alternative |
| The finite-field rational rigid–crystalline and ℓ-adic factor comparison, with the f-th iterate of p-Frobenius | PadicDifferentialEquationsAndRigidCohomology RD.7 | WC.6 |
| Weight-facing projective, curve, Jordan, Tate and nonprojective constructions | DeligneWeightsAndPurity DWP.10 | WC.7, which keeps the distinct zeta-facing comparisons |

**Reconciliation notes.**

- **One supplier, two routes.** The two parts reach PR196 differently: the WC.0 part names its layers in four gaps, the WC.6 part asks SF.2 to integrate them. Nothing in the mathematics differs. When PR196's layers receive atlas identifiers (or SF.2 nodes export them), both parts' citations become node prerequisites in one step; the gap and request texts already say which layer each node consumes.
- **The decomposition's WC.2 node.** The atlas's earlier decomposition of this roadmap had a WC.2 node `WC.2/lefschetz-trace-formula-proper-smooth-via-duality` (the Lefschetz formula for correspondences, SGA 4½ Cycle 3). The blueprint does not keep it: trace formulas for correspondences are EDC.8's, and the Frobenius trace formula is PR196's. Its other integrated ids (the three WC.1 nodes, `WC.3/integral-factors-and-ell-independence-from-purity` and `WC.6/purity-for-proper-smooth-varieties`) are kept.
- **Overlaps that remain.** Four pairs of nodes plan nearly the same statement, three of them inside this roadmap, because the WC.6 part was planned before the WC.0 part's nodes existed. Each is described under "Structural proposals" with the narrowing that removes it. None is a contradiction: the statements agree.
- **Unreviewed suppliers.** The WC.0 part cites five nodes of the DWP.0 part (reviewed, not yet accepted), one node of the unreviewed R06.5 part, and the WC.6 part imports three nodes of the unreviewed RD packet. If their final reviews change those statements, the consuming nodes must be rechecked.

## Conventions

The two parts use the same conventions with different spellings. The WC.0 part writes Unicode formulas, q = p^a and X for a scheme over k with X_k̄ its base change; the WC.6 part writes ASCII formulas, q = p^f and, following Deligne, X_0 for the scheme over F_q and X for its base change to F̄_q. This document writes q = p^f in its own prose. In the node text it keeps each part's X and X_0, which mean the same, and prints the WC.6 part's ASCII in the WC.0 part's notation: ℓ, Q_ℓ, F̄_q, χ, Δ, ≤, ≥, ≠, →, ⊗, ∏, Σ, P¹, Pⁿ, étale, Künneth, Schröer. The WC.0 packet's prose lost the spaces before many numerals ("Proposition1.3", "is1"); they are restored here. Ids, Lean names, locators and the literal source excerpts keep the packets' form exactly.

- **Fields and points.** k is an actual finite field with q = #k = p^f, f ≥ 1; F_4 is a field of degree two over F_2, never `ZMod 4`. k_r is Mathlib's `FiniteField.Extension k r`, r ≥ 1. N_r = #Hom_k(Spec k_r, X), a natural cardinal; no `Fintype` structure on the underlying space of X is assumed, and finiteness is a theorem. A closed point x has degree deg x = [κ(x) : k], and a_m counts closed points of degree m.
- **Frobenius.** F is geometric Frobenius, the inverse of the arithmetic substitution (Deligne I, (1.15)), matched by PR196 FrobeniusGeometry Layer 7 with pullback by the scheme q-Frobenius. It acts by q^{−1} on Q_ℓ(1) and by q^d on Q_ℓ(−d). Base change to k_r replaces F by F^r. At a closed point of degree m the local operator F_x is the q^m-Frobenius, and no further power is applied to it. The Tate twist (1) replaces T by T/q in an L-function.
- **Degree factors.** P_i(T) = det(1 − T·F | H^i), with H^i_c when X is not proper; in a basis this is Mathlib's `Matrix.charpolyRev`, with value one at zero and linear coefficient minus the trace. The reciprocal roots α of P_i are the eigenvalues of F; the roots of P_i are the α^{−1}. Multiplicities are algebraic multiplicities, and Frobenius is never assumed semisimple. b_i = dim H^i = deg P_i, because F is invertible. The WC.0 part writes Π_i for the unique integral polynomial whose coefficient image is P_i; the WC.6 part calls that polynomial itself the canonical integral degree factor P_i.
- **Zeta functions.** Z(X, T) = ∏_i P_i(T)^{(−1)^{i+1}}, an identity in Q_ℓ(T) whose expansion at zero is the integral Euler series, and then in ℚ(T) after descent. The exponential form needs characteristic-zero coefficients; integrality comes from the Euler product. Comparisons of power series with rational functions take place in the Laurent-series field: a formal power series is never evaluated at T^{−1}. The reduced presentation is the coprime pair P/Q in ℤ[T] with P(0) = Q(0) = 1.
- **Functional equation.** For X smooth proper of pure dimension d: χ = Σ_i (−1)^i b_i ∈ ℤ and Δ = ∏_i det(F | H^i)^{(−1)^i}. Then Z(X, 1/(q^d T)) = (−1)^χ Δ T^χ Z(X, T) and Δ² = q^{dχ}, with integer powers, so negative χ is allowed. The integer m = dχ/2 exists by the parity theorem, and ε = (−1)^χ Δ / q^m ∈ {±1} is defined after the multiplier has been descended to ℚ; then Z(X, 1/(q^d T)) = ε q^m T^χ Z(X, T). Over k_r one has ε_r = (−1)^{(r+1)χ} ε^r. A geometric point has ε = −1; P² has multiplier −q³T³.
- **Weights.** An algebraic number α has weight w when every complex conjugate of α has absolute value q^{w/2}; one chosen embedding is not enough ("all-conjugates"). Mixed sheaves and their weights are those of `DWP.7/weights-mixed-sheaves-definitions` (Weil II §1.2: a finite filtration whose graded pieces are pure), with integral weights taken for every complex conjugate. For an additive valuation v with v(q) = 1, an eigenvalue α of weight w has the valuation pair (v(α), v(q^w/α)), whose sum is w.
- **Point-count bounds.** The bound for connected X of dimension d ≥ 1 subtracts the endpoint terms 1 + q^{dr} and sums only the interior degrees 1 ≤ i ≤ 2d − 1. With geometric components permuted by Frobenius the endpoint is c_r(1 + q^{dr}), where c_r counts the components fixed by F^r. In dimension zero there is only H⁰ and N_r = c_r.
- **Finite spectra.** A root of a weighted family is visible when the total weight of all its occurrences is nonzero; coincident roots are grouped first. The unweighted converse needs characteristic zero, the weighted one does not. The case R = 0 is separate. The little-o lemma is strict: visible roots on the boundary are excluded too.
- **Configurations.** c_n(σ) sums over the σ-stable sets of n distinct points, with sign (−1)^{number of orbits}, not the parity of the number of points. A two-cycle contributes −1 in degree two.
- **Polynomial counts.** A polynomial count is exact for every prime power q, not only primes, one field or asymptotically. An approximate count determines only the coefficients in degrees at least half the cutoff: for P², P = T² + T has error 1 = o(p^n), while the exact palindromic completion is T² + T + 1. Over an open U ⊂ Spec ℤ the conclusion is a Tate semisimplification; over Spec ℤ it is an isomorphism with Tate representations.
- **Identifiers and names.** Node ids are `WeilConjectures:<layer>/<slug>` and are written below without the roadmap prefix. The packets propose three namespaces: `TauCeti.PointCounting` for WC.0–WC.5 and the surface child (modules `TauCeti/AlgebraicGeometry/WeilConjectures/WC0` … `WC5`), `TauCeti.FiniteSpectrum` for the numerical child (module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`), and `TauCeti.AlgebraicGeometry.WeilZeta` for the declarations of WC.6 and WC.7, which record no module. The Lean file keeps the packets' names; the handoff note proposes one namespace for the geometric declarations of both parts.

## Sources

Every node cites its source passages with a locator and a literal excerpt of at most 300 characters. The two parts gave some documents different ids; each node keeps the id its packet uses, and the list below gives every alias, the edition and file read, its SHA-256 where a file was read, and what each part read. Excerpts were read from the PDF text layer and checked on the page images where the text layer is unreliable (Deligne I’s Numdam scan, Milne’s and Mustață’s displayed formulas).

- **Pierre Deligne, *La conjecture de Weil. I*, Publ. Math. IHÉS 43 (1974), 273–307.**
  - `deligne-i` (WC.0 part); Publications mathématiques de l’IHÉS 43 (1974), 273–307; Numdam scan; <https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf>; SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`.
    - Read: §1.1–1.7 pp.273–277, including full descent proof (1.7)⇒(1.6); §1.15 p.279, complete trace/determinant conversion; §2.1–2.6 pp.280–282, full duality/reciprocity argument; §8.1 pp.301–302, complete complete-intersection application and its cohomological inputs.
  - `deligne-weil-i` (WC.6 part); Publications Mathematiques de l'IHES 43 (1974), 273-307; <https://numdam.org/item/PMIHES_1974__43__273_0.pdf>; SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`.
    - Read: 1.1-1.14.3, printed 273-279: point counts, rational descent, 1.7 implies 1.6 with its proof, and sheaf L-functions. The projective purity proof is an imported DWP result, not reverified here.
    - Read: 2026-10-06: freshly re-read 1.5.4 and the full 1.7 implies 1.6 proof, printed 276-277; fresh download has the recorded hash.
    - Read: 2026-10-06: 1.2-1.5.4 and all of 2.1-2.6, printed 274-276 and 280-282, freshly read for the Tate orientation, equivariant perfect pairing, q^d reciprocity and sign.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: 1.3-1.15 including the proof of 1.7 implies 1.6, printed 274-279; 2.3-2.6, printed 281-282. The projective-purity proof remains at DWP. Fresh bytes match the recorded SHA-256.
- **Pierre Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52 (1980), 137–252.**
  - `deligne-weil-ii` (WC.6 part); Publications Mathematiques de l'IHES 52 (1980), 137-252; <https://numdam.org/item/PMIHES_1980__52__137_0.pdf>; SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`.
    - Read: 3.3.1-3.3.11, statements and proofs, printed 203-207; rendered printed 206 to read the valuation diagram. The heavy inputs 1.8.4 and 3.2.3 remain DWP supplier proof obligations, not closed in this packet.
    - Read: 2026-10-06: freshly read 3.3.2-3.3.11, printed 204-207; full displayed homology-manifold condition, not an inference from a theorem name. Fresh download has the recorded hash.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: 3.3.2-3.3.11, printed 204-207, including the rendered valuation diagram on printed p.206. Heavy preceding weight-theory inputs remain supplier obligations. Fresh bytes match the recorded SHA-256.
- **Pierre Deligne, *Rapport sur la formule des traces*, SGA 4½, LNM 569 (1977).**
  - `sga4half-rapport` (WC.6 part); SGA 4 1/2, Lecture Notes in Mathematics 569 (1977), author-hosted scan; <https://publications.ias.edu/sites/default/files/Number32.pdf>; SHA-256 `fb2939521f4c0ea0cdd55a90bec2e618e32fb433c78b194e705c6d989f4e42a6`.
    - Read: Rapport 2.11 and 3.1-3.7, including the proof deriving 3.1 from 3.2, determinant/trace Proposition 3.3, cyclic-block Corollary 3.4, finite-étale Remark 3.5 and compactification 3.6. The geometric proof of 3.2 in section 4 is imported, not read here. In 3.1 use T=t^f for q=p^f.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: Rapport 2.11 and 3.1-3.7, including determinant/logarithmic-derivative and cyclic-block proofs. The geometric proof of 3.2 remains at the supplier. Fresh bytes match the recorded SHA-256.
- **J. S. Milne, *Lectures on Étale Cohomology*, version 2.21 (2013).**
  - `milne-lec` (WC.0 part); Version 2.21, 22 March 2013, author’s course notes; <https://www.jmilne.org/math/CourseNotes/LEC.pdf>; SHA-256 `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077`.
    - Read: §27, Lemma 27.5 and full proof, printed pp. 155–156, text and page images: trace power sums and their formal logarithmic identity. The weighted positive-exponent geometric expression is the workers’ separate derivation, not a formula quoted from Milne.
    - Read: No claim to have read the whole course or to derive its geometric trace formula in this packet.
    - Read: §27.5–27.15 full relevant proofs: trace/logarithm, field descent 27.9, local Fatou 27.10, global integrality 27.11, functional equation 27.12–13 and summary 27.14. Printed pp.158–159 checked as images on 6 October 2026. Author LEC errata section checked the same day.
- **Jonas Bergström, Carel Faber, Sam Payne, *Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves*, Ann. of Math. 199 (2024), 1323–1365.**
  - `bfp` (WC.0 part); arXiv:2206.07759v2, 17 October 2023; relevant passages collated with the published Annals version recorded separately; <https://arxiv.org/pdf/2206.07759v2>; SHA-256 `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758`.
    - Read: §1 Proposition 1.3 and weighted groupoid counts; §3 Proposition 3.1 statement/full proof and local/global polynomial-count context; §7 pp.10–13, full inverse-zeta and sieve arguments, Propositions 7.1,7.4,7.5 and Remark 7.6; §9.1–9.2 pp.21–22, twists, Definition 9.1, Proposition 9.3 full proof and Remark 9.4. Moduli-specific counts and §4 spectral sequences are outside this packet.
  - `bfp24` (WC.6 part); arXiv:2206.07759v2, 17 October 2023; Annals 199 (2024), 1323-1365 is the bibliographic version of record, not collated here; <https://arxiv.org/pdf/2206.07759v2>; SHA-256 `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758`.
    - Read: Introduction and Proposition 3.1 with its proof, pp.1-6; Proposition 4.2 proof, p.7, for the purity/invariant-cohomology uses. The stack purity assertion is a prerequisite used there, not a separately proved general theorem in this paper. Other sections belong to the separately routed WC.1-WC.5 and moduli jobs.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: Proposition 3.1 and its proof, p.6; Proposition 4.2 proof, p.7. These consume stack purity; the published Annals text was not collated. Fresh bytes match the recorded SHA-256.
  - `bfp-published` (WC.0 part); Published Annals of Mathematics 199(2024),1323–1365; author-hosted version of record; <https://web.ma.utexas.edu/users/sampayne/pdf/PolynomialPointCounts.pdf>; SHA-256 `9843c296d6f775472ca718be1520c2152d13f5a37dd6928e8e454c2b2d134bd3`.
    - Read: Proposition 1.3 statement and cited stack-theory interfaces, printed pp.1324–1325; Proposition 3.1 and proof, p.1330; §7 full sieve arguments, pp.1336–1339; §9.1–9.2 Definition 9.1, Proposition 9.3 full proof and Remark 9.4, pp.1351–1352. The cutoff typo and generic representation-ring qualification persist in this version. The nonreduced-fibre generality of Proposition 7.5 is included in the corrected sieve node.
  - `bfp` and `bfp24` are the same arXiv v2 file (same hash); `bfp-published` is the author-hosted version of record, collated by the WC.0 part.
- **Theo van den Bogaart, Bas Edixhoven, *Algebraic stacks whose number of points over finite fields is a polynomial*, arXiv:math/0505178v3.**
  - `vdbe` (WC.0 part); arXiv:math/0505178v3, 1 November 2008; v1 (2005) also compared; journal text not collated; <https://arxiv.org/pdf/math/0505178v3>; SHA-256 `46559f0499ac0c96192bcee9ec11f1d4933bff2285c6d29e97e008f8a8442b3b`.
    - Read: §1 updated open-U generality; §2 Theorem 2.1 and precise semisimplification/full-isomorphism distinction; §3 cohomology/comparison/purity inputs; §4 complete proof, finite-spectrum Lemma 4.1 and full local extension Lemma 4.2. §5 examples read only for context.
  - `vdbe05-v3` (WC.6 part); arXiv:math/0505178v3, 1 November 2008; distinct from the 2005 publication; <https://arxiv.org/pdf/math/0505178v3>; SHA-256 `46559f0499ac0c96192bcee9ec11f1d4933bff2285c6d29e97e008f8a8442b3b`.
    - Read: Introduction, Theorem 2.1 and section 3 through Lemma 3.2 and Proposition 3.3, pp.1-5. Lemma 3.2 is explicitly over characteristic zero; the finite-characteristic comparison needed here is recorded as a supplier gap, not claimed to follow from its written hypotheses.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: Section 3, especially Lemma 3.2 and its proof on printed p.5 and its characteristic-zero hypothesis. Fresh bytes match the recorded SHA-256.
  - Both ids name the same arXiv v3 file (same hash). The WC.0 packet gives it the title “On the cohomology of moduli spaces of curves”, which is not this paper’s title; the arXiv record and the WC.6 packet give the title above.
- **Mircea Mustață, *Zeta functions in algebraic geometry*, author’s notes.**
  - `mustata-zeta` (WC.0 part); Author-hosted notes; undated PDF as accessed, printed pp.21–22; <https://public.websites.umich.edu/~mmustata/zeta_book.pdf>; SHA-256 `d83d5617b180d490de60286ca61f07d349c2dadba6d0b61eac1af2f628253b45`.
    - Read: §3.3 Theorem 3.6, Remarks 3.7, Lemma 3.8 and complete proof, Theorem 3.6 complete graph/adjunction proof, Proposition 3.9 complete Hodge-index reduction and Example 3.10. Surface theorem is imported from SF.5, not redeveloped here.
- **Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*, arXiv:1807.04659v5, Appendix C.**
  - `yu-2022-app-c` (WC.0 part); arXiv:1807.04659v5, 18 July 2022; preprint, not collated with the journal version; <https://arxiv.org/pdf/1807.04659v5>; SHA-256 `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.
    - Read: Appendix C, printed pp. 79–81: application context, unnumbered negative-power lemma and complete proof. Page 81 visually checked on 26 September 2026; the coefficient and root ring is the integral closure of Z_p in an algebraic closure of Q_p (overbars confirmed). No journal collation is claimed.
    - Read: The general normed-field Vandermonde proof in this packet is an explicit alternative argument by this worker, not a transcription of Yu’s elimination proof.
    - Read: Appendix C pp.79–81 full lemma/context re-read on 6 October 2026; downloaded v5 hash agrees with prior visually verified copy.
- **Kiran S. Kedlaya, *Two approaches to RH for curves* (lecture notes, chapter 5 of *Weil cohomology in practice*).**
  - `kedlaya-rh` (WC.0 part); Weil cohomology in practice, online Lecture 5 as accessed 6 October 2026; Math 206A lecture 14 October 2019; <https://kskedlaya.org/weil-cohom/chapter-5.html>; SHA-256 `d87e898142aa11e9d96044cd25ff2d0a7ed2a1a9f85acd14cdec323f7482877f`.
    - Read: Definition 5.1.3 and full Lemma 5.1.4 numerical converse; §5.2 full surface proof. The source was an independent check only; the packet uses corrected Mustață and its own finite-spectrum proof. The Bombieri–Stepanov §5.1 argument is outside this job.
  - Read as an independent check only; the packet’s arguments follow Mustață and its own finite-spectrum proof.
- **Kiran S. Kedlaya, *Fourier transforms and p-adic Weil II*, Compositio Math. 142 (2006), 1426–1450.**
  - `kedlaya-weil-preprint` (WC.6 part); arXiv:math/0210149v3; distinct from the published paper; <https://arxiv.org/pdf/math/0210149v3>; SHA-256 `b678f13ceb5b0d0b528e927a20187e344f2fd40552819a5d528f7d52ab3f1599`.
    - Read: 6.6, printed 50-52: theorem 6.6.2 and its proof, remark 6.6.3, and the Weil-conjecture consequences. Collated with published section 5.3.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: 6.6.2 proof and 6.6(a)-(c), printed 50-52, collated against published 5.3. Fresh bytes match the recorded SHA-256.
  - `kedlaya-weil-published` (WC.6 part); Compositio Mathematica 142 (2006), 1426-1450, DOI 10.1112/S0010437X06002338; <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9084E895C148851EC7422B716B2F6E65/S0010437X06002338a.pdf/fourier-transforms-and-dollarpdollar-adic-weil-ii.pdf>; SHA-256 `482b4e20d0b950a67444ef835ef11971645cf5e9ea62bdf081a2449e71a34529`.
    - Read: 5.3, printed 1445-1446: Proposition 5.3.1, Theorem 5.3.2 and its whole proof, Remark 5.3.3 and consequences (a)-(c). Earlier geometric/Fourier proof inputs remain RD supplier obligations.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: Section 5.3, printed 1445-1446, including the full 5.3.2 proof and consequences (a)-(c). Earlier Fourier/geometric inputs remain supplier obligations. Fresh PDF bytes differ from the historical receipt; historical hash retained in sourceVersions. The reviewed printed passages are unchanged.
  - The preprint (arXiv v3) and the version of record are distinct documents and were collated. The published PDF fetched on 6 October 2026 has a different hash from the receipt of 26 September; both are kept, and the printed passages read are unchanged.
- **Kiran S. Kedlaya, *Notes on isocrystals*, arXiv:1606.01321v6.**
  - `kedlaya-isocrystals` (WC.6 part); arXiv:1606.01321v6; <https://arxiv.org/pdf/1606.01321v6>; SHA-256 `7fa7ab3126dcb5b25a77b97b5d7930983e2305fbfebc71b2e5f92697e6cab886`.
    - Read: 8.1-8.8 and 9.1-9.7, printed 20-22: actual cohomology, Ogus comparison statement, finite-field coefficients and trace conventions; 10.1-10.3 and its cited-proof boundary, printed 27. The Ogus original proof was not read.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: 8.1-8.8, 9.1-9.7, and 10.1-10.3 with the cited-proof boundary. The cited Ogus original proof was not read. Fresh bytes match the recorded SHA-256.
- **Stefan Schröer, *There is no Enriques surface over the integers*, arXiv:2004.07025v3 (Ann. of Math. 197 (2023)).**
  - `schroer23` (WC.6 part); arXiv:2004.07025v3, 9 August 2022; published Annals 197 (2023), 1-63 not collated here; <https://arxiv.org/pdf/2004.07025v3>; SHA-256 `ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61`.
    - Read: All of section 7, printed 19-21: definitions, Tate/Frobenius conventions, Proposition 7.1 and proof, Corollaries 7.2 and 7.3 with their proofs. The surrounding surface classification is imported from the paper routes, not reverified.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: All of section 7, printed 19-21, including Proposition 7.1 and Corollaries 7.2-7.3 proofs. The published Annals text was not collated. Fresh bytes match the recorded SHA-256.
  - The published text was not collated; the three source issues against it are scoped to arXiv v3.
- **Tau Ceti Roadmap pull request 196, CohomologicalPointCounting, head 4bd72379658126cbe9be935656396f0c9dac4de0.**
  - `pr196` (WC.0 part); TauCetiProject/TauCetiRoadmap PR196, head 4bd72379658126cbe9be935656396f0c9dac4de0, 6 October 2026; <https://github.com/TauCetiProject/TauCetiRoadmap/pull/196>.
    - Read: FrobeniusGeometry Layers 4–5 complete; EllAdicRealization Layers 4–10 complete; TraceFormula Layers 13–15 complete; EtaleBaseChange Layers 7–9 complete; ComplexComparison Layers 10–12 complete. These are mathematical suppliers, not baseline implementations. Their layer IDs are absent from the current atlas.
    - Read: Read again by the independent review REV-WeilConjectures--WC.0 at the same head on 6 October 2026: FrobeniusGeometry Layers 3–7 (Layer 7 is the cohomological convention bridge), TraceFormula Layers 5–15, EllAdicRealization Layers 7–10, EtaleBaseChange Layer 8, ComplexComparison Layer 10 and the family README’s successor note.
  - `pr196-trace` (WC.6 part); PR196 TraceFormula README at commit 4bd72379658126cbe9be935656396f0c9dac4de0; <https://raw.githubusercontent.com/TauCetiProject/TauCetiRoadmap/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md>; SHA-256 `1ab2e7b8462e70f1609d09a7207ff1ad03027023ebe5f3644af59b7a14ac970f`.
    - Read: Layers 11-15, worked examples, design notes and scope boundaries read at the pinned PR head. This is a supplier specification, not a formalized library result.
    - Read: Introduction, conventions and dependency map; layers 4-15, worked examples, design and scope. Layers 0-3 are unchanged upstream inputs, not re-planned. In particular layers 7,8,12,13,15 construct the finite-étale, curve, projective-space and compact-support examples independently of RH.
    - Read: Independent review REV-WeilConjectures--WC.6, 2026-10-06: Introduction/conventions, supplier/source map, Layers 7-15 and worked acceptance examples at the pinned PR head. This is an upstream plan, not formalization. Fresh bytes match the recorded SHA-256.
  - `pr196` is the family as a whole; `pr196-trace` is its TraceFormula README at the same commit. These are upstream plans, not library results.
- **Tau Ceti Roadmap, AlgebraicCurves README at fa4d0309ae1d68d274091a647f7cd7fe80608205.**
  - `upstream-algebraic-curves` (WC.6 part); Merged AlgebraicCurves README at commit fa4d0309ae1d68d274091a647f7cd7fe80608205; <https://raw.githubusercontent.com/TauCetiProject/TauCetiRoadmap/fa4d0309ae1d68d274091a647f7cd7fe80608205/TauCetiRoadmap/AlgebraicCurves/README.md>; SHA-256 `8696d432a66c7a374619fc5ccb139248c0a1cf41bf7cba6d55a6af2f1fb1a7a5`.
    - Read: Layers 7 (different and Hurwitz), 10 (Artin–Schreier reduced representatives, ramification, genus and model classes), and 12A-12E (normalization, projective model, places/points dictionary and cohomological genus comparison). An upstream specification, not an implemented library result.
- **Mathlib and Tau Ceti at the pins.**
  - `mathlib-vandermonde-pin` (WC.0 part); Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; <https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174>.
    - Read: Mathlib/LinearAlgebra/Vandermonde.lean: definition, determinant criterion and finite moment uniqueness.
    - Read: Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean: inverse definition and mul_nonsing_inv.
  - `mathlib-formal-series-pin` (WC.0 part); Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; <https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174>.
    - Read: PowerSeries/Basic.lean: coefficient constructor, extensionality, coefficient shift, rescale and polynomial inclusion.
    - Read: PowerSeries/WellKnown.lean: mk_one_mul_one_sub_eq_one and its proof.
    - Read: HahnSeries/PowerSeries.lean: ofPowerSeries and its injectivity.
    - Read: LaurentSeries.lean: the PowerSeries fraction-field instance, embeddings, coefficient comparison, RatFunc.coe_coe and RatFunc.algebraMap_apply_div.
  - `baseline-wc-interfaces` (WC.0 part); Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369; <https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174>.
    - Read: Actual statements and surrounding typeclass hypotheses read in Finite/Extension.lean, Finite/GaloisField.lean, ArithmeticFunction/Moebius.lean, Matrix/Charpoly/Coeff.lean, CategoryTheory/IsomorphismClasses.lean, Endomorphism.lean, SingleObj.lean, Discrete/Basic.lean, Polynomial/GaussLemma.lean, FieldTheory/Galois/Basic.lean, Polynomial/Roots.lean, IsPrimePow.lean and NumberField/Discriminant/Basic.lean; Tau Ceti EllipticCurve/PointCount.lean and RepresentationRing/Basic.lean.
  - Library files read for the baseline declarations; see “What the pinned libraries have”.

**Versions read.** The packets record, under `sourceVersions`, which text each finding against a stated result was read in:

- WC.0 part: preprint; <https://arxiv.org/pdf/1807.04659v5>; read 2026-10-06; SHA-256 `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c`.
- WC.0 part: author copy; <https://www.jmilne.org/math/CourseNotes/LEC.pdf>; read 2026-10-06; SHA-256 `ac4f122f371d38a44c58c296b7dbf88081d89d2de2334070bff3606771c01077`.
- WC.0 part: published; <https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf>; read 2026-10-06; SHA-256 `8392b345d4854e6dc55fb42cfc0b616d941935983723627237239a87348f42e5`.
- WC.0 part: preprint; <https://arxiv.org/pdf/2206.07759v2>; read 2026-10-06; SHA-256 `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758`.
- WC.0 part: published; <https://web.ma.utexas.edu/users/sampayne/pdf/PolynomialPointCounts.pdf>; read 2026-10-06; SHA-256 `9843c296d6f775472ca718be1520c2152d13f5a37dd6928e8e454c2b2d134bd3`.
- WC.0 part: preprint; <https://arxiv.org/pdf/math/0505178v3>; read 2026-10-06; SHA-256 `46559f0499ac0c96192bcee9ec11f1d4933bff2285c6d29e97e008f8a8442b3b`.
- WC.0 part: author copy; <https://public.websites.umich.edu/~mmustata/zeta_book.pdf>; read 2026-10-06; SHA-256 `d83d5617b180d490de60286ca61f07d349c2dadba6d0b61eac1af2f628253b45`.
- WC.0 part: author copy; <https://kskedlaya.org/weil-cohom/chapter-5.html>; read 2026-10-06; Online Lecture 5, Math 206A,14 October 2019; the displayed source was read through the web tool. A direct HTML download returned 406, so no file hash is claimed.
- WC.0 part: author copy; <https://kskedlaya.org/weil-cohom/chapter-5.html>; read 2026-10-06; SHA-256 `d87e898142aa11e9d96044cd25ff2d0a7ed2a1a9f85acd14cdec323f7482877f`; Fetched by the independent review REV-WeilConjectures--WC.0 with browser request headers (the plain request is refused with 406); the hash is of the HTML served that day.
- WC.6 part: published; <https://numdam.org/item/PMIHES_1980__52__137_0.pdf>; read 2026-09-26; SHA-256 `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71`.
- WC.6 part: preprint; <https://arxiv.org/pdf/math/0210149v3>; read 2026-09-26; SHA-256 `b678f13ceb5b0d0b528e927a20187e344f2fd40552819a5d528f7d52ab3f1599`.
- WC.6 part: published; <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9084E895C148851EC7422B716B2F6E65/S0010437X06002338a.pdf/fourier-transforms-and-dollarpdollar-adic-weil-ii.pdf>; read 2026-09-26; SHA-256 `5fb0b647f89a06156fadfdeb353048ff5c8f0f9170d9181b4b65c7dc5bf2cc46`.
- WC.6 part: preprint; <https://arxiv.org/pdf/2206.07759v2>; read 2026-10-06; SHA-256 `36beb2d3eccb42161a0b6190a653b060337f08fed5866f6b578888d503346758`.
- WC.6 part: preprint; <https://arxiv.org/pdf/2004.07025v3>; read 2026-10-06; SHA-256 `ae6481f25627867473ba40db3b08e5f4b861de8aa103204eefc5ad1123a46d61`.
- WC.6 part: preprint; <https://arxiv.org/pdf/math/0505178v3>; read 2026-10-06; SHA-256 `46559f0499ac0c96192bcee9ec11f1d4933bff2285c6d29e97e008f8a8442b3b`.
- WC.6 part: published; <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9084E895C148851EC7422B716B2F6E65/S0010437X06002338a.pdf/fourier-transforms-and-dollarpdollar-adic-weil-ii.pdf>; read 2026-10-06; SHA-256 `482b4e20d0b950a67444ef835ef11971645cf5e9ea62bdf081a2449e71a34529`.

## What the pinned libraries have

The 65 baseline declarations the two parts cite, read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` (both parts record the same pins; `Matrix.charpolyRev` is cited by both). Each is cited by a node for exactly what is listed.

**Mathlib.**

- `mathlib:Matrix.vandermonde` (Mathlib/LinearAlgebra/Vandermonde.lean): The matrix with row i, column j equal to β_i^j.
- `mathlib:Matrix.det_vandermonde_ne_zero_iff` (Mathlib/LinearAlgebra/Vandermonde.lean): Over a domain its determinant is nonzero exactly when β is injective.
- `mathlib:Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero` (Mathlib/LinearAlgebra/Vandermonde.lean): For distinct β_i, vanishing weighted moments at exponents 0 through d−1 forces every coefficient to vanish.
- `mathlib:Matrix.mul_nonsing_inv` (Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean): A times its nonsingular inverse is the identity when det A is a unit.
- `mathlib:norm_sum_le` (Mathlib/Analysis/Normed/Group/Basic.lean): The norm of a finite sum is at most the sum of the norms.
- `mathlib:pow_unbounded_of_one_lt` (Mathlib/Algebra/Order/Archimedean/Basic.lean): In an Archimedean ordered semiring, powers of y>1 exceed every prescribed bound; used over the real numbers.
- `mathlib:hasSum_geometric_of_norm_lt_one` (Mathlib/Analysis/SpecificLimits/Normed.lean): In a normed division ring, the geometric series for ξ of norm less than one has sum (1−ξ) inverse; no completeness assumption is needed.
- `mathlib:hasProd_prod` (Mathlib/Topology/Algebra/InfiniteSum/Basic.lean): Finite products of convergent infinite products in a commutative topological monoid with continuous multiplication. Apply it to Multiplicative K, whose multiplication is addition in K, to obtain the finite-sum rule for convergent series. This is also the source of the generated hasSum_sum theorem.
- `mathlib:PowerSeries.mk` (Mathlib/RingTheory/PowerSeries/Basic.lean): The existing coefficient-function constructor; no new formal-series object is introduced.
- `mathlib:PowerSeries.coeff_mk` (Mathlib/RingTheory/PowerSeries/Basic.lean): The n-th coefficient of mk f is f n.
- `mathlib:PowerSeries.ext` (Mathlib/RingTheory/PowerSeries/Basic.lean): Coefficientwise equality implies equality of formal power series over a semiring.
- `mathlib:PowerSeries.mk_one_mul_one_sub_eq_one` (Mathlib/RingTheory/PowerSeries/WellKnown.lean): Over a commutative ring, the series with all coefficients one times 1−X equals one.
- `mathlib:PowerSeries.rescale` (Mathlib/RingTheory/PowerSeries/Basic.lean): Existing ring homomorphism f(X) ↦ f(aX), over a commutative semiring.
- `mathlib:PowerSeries.rescale_mk` (Mathlib/RingTheory/PowerSeries/Basic.lean): Rescaling mk f by a gives mk(n ↦ a^n f(n)).
- `mathlib:PowerSeries.rescale_X` (Mathlib/RingTheory/PowerSeries/Basic.lean): Rescaling X by a gives C(a)X; its statement is in the commutative-ring section.
- `mathlib:PowerSeries.coeff_succ_mul_X` (Mathlib/RingTheory/PowerSeries/Basic.lean): The coefficient at n+1 of fX is the coefficient at n of f.
- `mathlib:PowerSeries.coeff_C_mul` (Mathlib/RingTheory/PowerSeries/Basic.lean): The coefficient at n of C(a)f is a times the coefficient at n of f.
- `mathlib:Polynomial.coe_mul` (Mathlib/RingTheory/PowerSeries/Basic.lean): The existing polynomial-to-power-series inclusion preserves multiplication.
- `mathlib:Polynomial.coe_injective` (Mathlib/RingTheory/PowerSeries/Basic.lean): The polynomial-to-power-series inclusion is injective.
- `mathlib:HahnSeries.ofPowerSeries_injective` (Mathlib/RingTheory/HahnSeries/PowerSeries.lean): The existing power-series-to-Hahn-series ring homomorphism is injective; specialize the exponent semiring to the integers.
- `mathlib:PowerSeries.coe_mul` (Mathlib/RingTheory/LaurentSeries.lean): The existing power-series-to-Laurent-series inclusion preserves multiplication.
- `mathlib:RatFunc.coe_coe` (Mathlib/RingTheory/LaurentSeries.lean): A polynomial has the same image in LaurentSeries whether mapped through PowerSeries or RatFunc.
- `mathlib:RatFunc.algebraMap_apply_div` (Mathlib/RingTheory/LaurentSeries.lean): The RatFunc-to-LaurentSeries algebra map sends the quotient of two mapped polynomials to their quotient in LaurentSeries.
- `mathlib:PowerSeries.coeff_coe` (Mathlib/RingTheory/LaurentSeries.lean): The Laurent coefficient of an embedded power series vanishes at a negative index and equals the power-series coefficient at a nonnegative index.
- `mathlib:FiniteField.Extension` (Mathlib/FieldTheory/Finite/Extension.lean): A genuine finite extension of the given finite field, with positive-degree hypothesis, not ZMod of a composite prime power.
- `mathlib:FiniteField.finrank_extension` (Mathlib/FieldTheory/Finite/Extension.lean): The extension has the specified positive degree.
- `mathlib:FiniteField.natCard_extension` (Mathlib/FieldTheory/Finite/Extension.lean): The extension cardinal is (Nat.card k)^r.
- `mathlib:FiniteField.algEquivExtension` (Mathlib/FieldTheory/Finite/Extension.lean): Finite extensions of the same degree are k-algebra equivalent.
- `mathlib:FiniteField.natCard_algHom_of_finrank_dvd` (Mathlib/FieldTheory/Finite/GaloisField.lean): The number of k-embeddings of finite fields when the degree divides the target degree.
- `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq` (Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean): Existing Möbius inversion for additive-group valued arithmetic functions.
- `mathlib:Matrix.charpolyRev` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean): Existing determinant polynomial det(1−T F), with constant coefficient one.
- `mathlib:Matrix.reverse_charpoly` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean): Comparison with the reverse of the characteristic polynomial.
- `mathlib:Matrix.charpoly_inv` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean): The characteristic polynomial of the inverse, with determinant and sign.
- `mathlib:CategoryTheory.isIsomorphicSetoid` (Mathlib/CategoryTheory/IsomorphismClasses.lean): Existing isomorphism relation and quotient of category objects.
- `mathlib:CategoryTheory.Aut` (Mathlib/CategoryTheory/Endomorphism.lean): Existing automorphism group of an object.
- `mathlib:CategoryTheory.Aut.autMulEquivOfIso` (Mathlib/CategoryTheory/Endomorphism.lean): Isomorphic objects have isomorphic automorphism groups.
- `mathlib:CategoryTheory.SingleObj.groupoid` (Mathlib/CategoryTheory/SingleObj.lean): Existing one-object groupoid for a group.
- `mathlib:Units.toAut` (Mathlib/CategoryTheory/SingleObj.lean): Units in a monoid identify with automorphisms in its one-object category.
- `mathlib:CategoryTheory.Discrete` (Mathlib/CategoryTheory/Discrete/Basic.lean): Existing discrete category of a type.
- `mathlib:IsPrimePow` (Mathlib/Algebra/IsPrimePow.lean): Existing prime-power predicate includes positive exponent and prime base.
- `mathlib:Polynomial.eq_of_infinite_eval_eq` (Mathlib/Algebra/Polynomial/Roots.lean): Polynomials over a domain agreeing on infinitely many arguments are equal.
- `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd` (Mathlib/RingTheory/Polynomial/GaussLemma.lean): Monic-divisor Gauss lemma over an integrally closed domain and its fraction field.
- `mathlib:IsGalois.mem_range_algebraMap_iff_fixed` (Mathlib/FieldTheory/Galois/Basic.lean): Over a finite Galois extension, fixed elements are exactly base-field elements.
- `mathlib:NumberField.abs_discr_gt_two` (Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean): A number field of degree greater than one has absolute discriminant greater than two; global unramified-to-discriminant comparison still required.
- `mathlib:Summable.of_norm_bounded` (Mathlib/Analysis/Normed/Group/InfiniteSum.lean): Direct comparison test in a complete normed additive group, with a summable real majorant.
- `mathlib:summable_geometric_of_abs_lt_one` (Mathlib/Analysis/SpecificLimits/Normed.lean): Existing real geometric-series summability for ratio of absolute value less than one.
- `mathlib:padicNorm` (Mathlib/NumberTheory/Padics/PadicNorm.lean): Existing rational p-adic norm, defined using the rational valuation and with a separate zero case.
- `mathlib:MulAction.orbitRel` (Mathlib/GroupTheory/GroupAction/Defs.lean): Existing orbit equivalence relation for a group action.
- `mathlib:Subgroup.zpowers` (Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean): Existing cyclic subgroup of integer powers, acting on the geometric point carrier.
- `mathlib:Matrix.eval_charpolyRev` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean): Evaluation of det(1-X M) at zero is one, including the empty matrix.
- `mathlib:Matrix.coeff_charpolyRev_eq_neg_trace` (Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean): The coefficient of X in det(1-X M) is minus the trace.
- `mathlib:RatFunc` (Mathlib/FieldTheory/RatFunc/Defs.lean): The existing rational-function carrier, wrapping the fraction ring of the polynomial ring. No parallel zeta carrier is introduced.
- `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf` (Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean): The existing pro-étale sheaf of continuous Z_ℓ-valued maps for a scheme and prime ℓ. The SF.2 integration must compare with it, not rebuild it.
- `mathlib:AlgebraicGeometry.Scheme.EllAdicCohomology` (Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean): Existing integral pro-étale cohomology as an additive group, with an empty-scheme subsingleton instance. This is a real existing carrier, but not by itself the finite-dimensional Q_ℓ representation with Frobenius and compact support needed here.
- `mathlib:WeierstrassCurve` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): Existing five-coefficient Weierstrass equation over a ring; used for y^2=x^3-x over F_5, without a new elliptic-curve carrier.
- `mathlib:WeierstrassCurve.Δ` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): Existing discriminant -b_2^2 b_8-8 b_4^3-27 b_6^2+9 b_2 b_4 b_6; the chosen example has 64=4 in F_5.
- `mathlib:WeierstrassCurve.Affine.Equation` (Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean): Existing affine membership predicate obtained by evaluating the bivariate Weierstrass polynomial. It does not yet supply the proper scheme/cohomology comparison needed by this application.

**Tau Ceti.**

- `tauceti:WeierstrassCurve.pointCount` (TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean): Existing affine-solution count plus the point at infinity.
- `tauceti:WeierstrassCurve.pointCount_eq_card_point` (TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean): For a nonsingular elliptic equation over a finite field, exact comparison with its Point type.
- `tauceti:WeierstrassCurve.frobeniusTrace` (TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean): Existing trace card(k)+1−pointCount, with integer codomain.
- `tauceti:TauCeti.repRing` (TauCeti/RepresentationTheory/RepresentationRing/Basic.lean): Existing split Grothendieck ring of finite-dimensional representations; no competing representation ring.
- `tauceti:TauCeti.repRingCharacter` (TauCeti/RepresentationTheory/RepresentationRing/Basic.lean): Existing character homomorphism into functions on the group.
- `tauceti:TauCeti.mem_range_repRingCharacter_iff` (TauCeti/RepresentationTheory/RepresentationRing/Basic.lean): Image is the virtual-character lattice, not all integral class functions.
- `tauceti:TauCeti.repRingCharacter_injective` (TauCeti/RepresentationTheory/RepresentationRing/Injective.lean): Actual finite-group characteristic-zero injectivity, with no algebraic-closedness assumption in the pinned theorem.
- `tauceti:TauCeti.mem_virtualCharacters_iff` (TauCeti/RepresentationTheory/CharacterTable/VirtualCharacter.lean): For a finite group over an algebraically closed field with group order invertible, virtual characters are exactly integer combinations of irreducible characters.

## Layer overview

Each layer section opens with the coverage record of the packet that covers it and an overview of the layer. It then states every node, in an order in which each node comes after the nodes of the same layer it uses: its statement and hypotheses, the proof or construction, for definitions the API and the unit tests, the acceptance checks, the uses that justify the API, the dependencies (and the nodes of this roadmap that use it), the proposed library location and the sources. Where a cross-part fact or a reviewer’s instruction concerns a node, an **Assembly note** follows it; it changes nothing in the packet.

| Layer | Title | Nodes | Planets | Coverage | Packet |
|---|---|---|---|---|---|
| WC.0 | Source reconciliation and real geometric inputs | 3 | 2 | planned | `WeilConjectures--WC.0.json` |
| WC.1 | Zeta arithmetic and finite-extension API | 15 | 6 | planned | `WeilConjectures--WC.0.json` |
| WC.2 | Poincaré duality and exact functional equation | 5 | 4 | planned | `WeilConjectures--WC.0.json` |
| WC.3 | Integral factors, all-conjugates RH and ℓ-independence | 2 | 2 | planned | `WeilConjectures--WC.0.json` |
| WC.4 | Betti-number comparison in families | 2 | 2 | planned | `WeilConjectures--WC.0.json` |
| WC.5 | Point-count bounds and curves | 9 | 6 | planned | `WeilConjectures--WC.0.json` |
| WC.5:power-sum-converse | Independent finite-spectrum lemma | 16 | 6 | closed | `WeilConjectures--WC.0.json` |
| WC.5:surface-alternative | Independent curve bound by intersection theory | 2 | 2 | planned | `WeilConjectures--WC.0.json` |
| WC.6 | Broader geometry and cohomology interfaces | 5 | 5 | planned | `WeilConjectures--WC.6.json` |
| WC.7 | Worked realizations and final assembly | 15 | 6 | planned | `WeilConjectures--WC.6.json` |

In all, 74 nodes and 41 planets; every layer shows at most six planets.

**The path to the main theorems.** The spine runs WC.0 → WC.1 → WC.2 → WC.3 → WC.5 → WC.7. WC.0 fixes the points and the Frobenius realization; WC.1 proves rationality with a normalised integral presentation; WC.2 proves the signed functional equation from duality, still without purity; WC.3 uses DWP.4’s purity to extract the integral, ℓ-independent factors; WC.5 turns them into point-count bounds and recurrences; WC.7 assembles the conclusions on actual geometry. WC.4 adds the Betti comparison for a supplied family, and WC.6 repeats WC.3’s extraction with DWP.7’s purity for smooth proper schemes and adds the mixed, homology-manifold and stack cases. The two WC.5 children stand apart: the power-sum converse uses only Mathlib, and the surface branch reaches curve RH from WC.0–WC.2, SF.5 and the converse, without DWP or WC.3. The counting tools of Bergström–Faber–Payne (groupoid mass, configurations, the sieve, polynomial counts) form a second strand through WC.1, WC.4 and WC.5.

## WC.0 — Source reconciliation and real geometric inputs

*Coverage in `WeilConjectures--WC.0.json`: planned, 3 nodes.* Every stated target and key definition/theorem has a declaration-level plan. Closure awaits the exact recorded owner inputs: Private WC snapshot audit, PR196 point, orbit and twist interface registration, PR196 rational realization and trace interface registration. Blueprint completeness is not implementation or geometric closure.

The layer fixes the carriers every later statement uses and identifies them with PR196's, so that no later node works with a stand-in.

- **Points.** N_r is the cardinal of Hom_k(Spec k_r, X), with k_r Mathlib's `FiniteField.Extension k r`. Any k-isomorphism of degree-r extensions transports points and preserves N_r; the inclusions k_r ⊂ k_s for r | s commute with transport and with q-power Frobenius. Finiteness comes from PR196 FrobeniusGeometry Layers 4–5.
- **Closed points.** A closed point is an orbit of arithmetic Frobenius on X(k̄), of length its residue degree; it contributes m points over k_r exactly when its degree m divides r. The exponent in the Euler product is the residue degree, not the residue cardinality.
- **Cohomology and Frobenius.** The degree-i space is PR196's rational H^i_c(X_k̄, Q_ℓ) (H^i for proper X), and the operator is continuous geometric Frobenius, matched with pullback by the scheme q-Frobenius by FrobeniusGeometry Layer 7. Base change to k_r gives F^r; Q_ℓ(1) has eigenvalue q^{−1}.

The stage text also asks for an audit of the maintainer's private Weil-conjectures repository. That repository is not available to the planning jobs, so the audit is the gap "Private WC snapshot audit"; no private declaration was guessed. The three nodes have no Lean signatures, because their carriers (PR196's points and cohomology) do not exist at the pins.

### Actual rational points and the finite-extension tower

`WC.0/finite-extension-point-tower-comparison` · theorem · planet “Finite-extension point tower” · WC.0 part · declaration `TauCeti.PointCounting.finite_extension_point_tower_comparison`

Let k be a finite field of characteristic p, q=Nat.card k=p^a with a≥1, X→Spec k a finite-type scheme, and r≥1. Identify the WC point set with Hom over Spec k from Spec(FiniteField.Extension k r) to X. Transport the supplied finite-point theorem to this exact carrier, so N_r is its natural cardinal. Every k-algebra isomorphism between degree-r extensions induces the same N_r; chosen inclusions for r|s commute with point transport and with q-power Frobenius. No global Fintype of the underlying topological space of X is installed.

**Proof.**

1. Use the upstream FrobeniusGeometry Layers 4–5 fixed-point/extension dictionary and finite-type point finiteness, keeping structural maps to Spec k in every Hom.
2. Apply the pinned finite-field extension cardinal and same-degree algebra-equivalence results. Contravariance of Spec and composition of scheme morphisms prove identity/composition and tower coherence.
3. Compare natural cardinalities under the resulting bijections; field isomorphisms need not be unique and the equality of numbers does not claim unique transport maps.

**Acceptance.**

- For k=F₄, degree r gives q^r=4^r; ZMod 4 is not a field and is rejected.
- For A¹, N_r=q^r; for Spec of a degree-m finite extension, N_r=m if m|r and zero otherwise.
- A field isomorphism changes coordinates but preserves the count and commutes with q-power Frobenius.

**Depends on.** libraries: `mathlib:FiniteField.Extension`, `mathlib:FiniteField.finrank_extension`, `mathlib:FiniteField.natCard_extension`, `mathlib:FiniteField.algEquivExtension`.

**Used here by.** `WC.0/closed-point-degree-comparison`, `WC.0/geometric-frobenius-realization-comparison`, `WC.1/zeta-function-euler-product-and-point-counts`, `WC.1/twisted-frobenius-point-comparison`, `WC.1/hasse-weil-sieve-for-curve-families`, `WC.5:surface-alternative/surface-all-extension-bound-comparison`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC0`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, (1.4) a)–d) and (1.4.1), pp.274–275: “b) De même, l'ensemble X^{F^n} des points fermés de X fixes sous le n-ième itéré de F s'identifie à X₀(F_{q^n}).” — Extension counts are fixed points of iterated Frobenius, identified with the actual finite-extension point sets.
- `pr196`, FrobeniusGeometry Layers 4–5: “Prove that the rational-point type of a finite-type scheme over a finite field is finite, by reduction to a finite affine cover and finiteness of solutions in finite coordinate rings” — Supplier constructs the point carriers and finiteness; WC exports their notation and choice comparison.

### Closed points and arithmetic Frobenius orbits

`WC.0/closed-point-degree-comparison` · theorem · WC.0 part · declaration `TauCeti.PointCounting.closed_point_degree_comparison`

For finite-type X/k as above, identify each imported closed point x with its arithmetic-q-Frobenius orbit on X(k̄), with orbit length [κ(x):k]. The WC degree-m closed-point count a_m is finite and equals the imported orbit count; a point above x is fixed by F_q^r exactly when m|r, and then contributes m. The residue-field degree, not the cardinality q^m, is the Euler-product exponent.

**Proof.**

1. Apply the upstream closed-point/orbit bijection and actual finite-field residue extensions.
2. Use the existing finite-field algebra-embedding count to verify the fibre contribution and transfer the finite degree-m orbit enumeration.
3. Check that changing algebraic closures and chosen extension fields transports the bijection; numbers are independent of these choices.

**Acceptance.**

- Spec F_(q²) has a₂=1 and N₂=2; it has no degree-one point.
- A rational closed point has degree one, regardless of q.

**Depends on.** this roadmap: `WC.0/finite-extension-point-tower-comparison`; libraries: `mathlib:FiniteField.natCard_algHom_of_finrank_dvd`.

**Used here by.** `WC.1/zeta-function-euler-product-and-point-counts`, `WC.1/closed-point-counts-mobius-inversion`, `WC.1/signed-frobenius-configuration-coefficient`, `WC.5/components-and-dimension-zero`, `WC.5:surface-alternative/surface-all-extension-bound-comparison`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC0`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, (1.4) c)–d), p.275: “c) L'ensemble |X₀| des points fermés de X₀ s'identifie à l'ensemble |X|_F des orbites de F (ou de φ) dans |X|. Le degré deg(x) de x∈|X₀| est le nombre d'éléments de l'orbite correspondante.” — Comparison with the already-owned orbit decomposition.
- `pr196`, TraceFormula Layer 13; FrobeniusGeometry Layer 4: “Build the combinatorics relating rational points over extensions to closed points and Frobenius orbits.” — Orbit combinatorics belongs to these suppliers, not a second closed-point theory.

### Rational coefficients and geometric Frobenius

`WC.0/geometric-frobenius-realization-comparison` · theorem · planet “Geometric Frobenius comparison” · WC.0 part · declaration `TauCeti.PointCounting.geometric_frobenius_realization_comparison`

For separated finite-type X/k and a prime ℓ≠p, identify the WC degree-i space with the imported finite-dimensional rational ℓ-adic H_c^i(X_k̄,Q_ℓ), and with H^i for proper X. Identify its WC operator with continuous geometric Galois Frobenius, inverse to the arithmetic generator, and with pullback by the scheme q-Frobenius under the supplied convention bridge. After degree-r base extension the operator is F_q^r. The geometric action on Q_ℓ(1) is q⁻¹ and on Q_ℓ(−d) is q^d. Coefficient extensions preserve characteristic polynomials by scalar extension, dimensions and traces; no rational space is inferred merely from an integral derived carrier.

**Proof.**

1. Consume EllAdicRealization Layers 4–10, including perfect finite rational cohomology and the continuous Galois action, and the FrobeniusGeometry Layer 7 bridge between scheme q-Frobenius pullback, the arithmetic descent action and geometric Frobenius (consumed by EllAdicRealization Layer 8).
2. Compose these supplied identifications with the WC notation; apply their scalar-extension, restriction and proper-support comparisons.
3. Keep the coefficient prime, cohomological degree, structural map and choice of geometric point visible.

**Acceptance.**

- On P¹ the two even-degree eigenvalues are 1 and q, not 1 and q⁻¹.
- Degree-two base change sends F_q to F_q².
- ℓ=p fails the stated coefficient hypothesis; ℓ=2 with p odd remains allowed.

**Depends on.** this roadmap: `WC.0/finite-extension-point-tower-comparison`; libraries: `mathlib:Matrix.charpolyRev`.

**Used here by.** `WC.1/cohomological-formula-from-the-trace-formula`, `WC.1/stack-count-comparison`, `WC.2/functional-equation-base-extension`, `WC.3/integral-factors-and-ell-independence-from-purity`, `WC.4/betti-comparison-in-a-supplied-family`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC0`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, (1.15) p.279; (2.2) p.281: “Ceci amène à définir le Frobenius géométrique F∈Gal(F̄_q/F_q) comme étant φ⁻¹.” — Geometric Frobenius is the inverse of the arithmetic substitution; (2.2) fixes its action on Q_ℓ(1).
- `pr196`, EllAdicRealization Layers 4–10 (Layer 8: continuous Galois and Frobenius actions); FrobeniusGeometry Layer 7 (convention bridge): “Prove the pinned Tate-twist convention: geometric Frobenius acts on \(\mathbf Q_\ell(1)\) by \(q^{-1}\), with the arithmetic-Frobenius formulation given explicitly.” — Constructed rational coefficients and Galois action are inputs; the pullback/descent/geometric-Frobenius conversion is FrobeniusGeometry Layer 7, consumed by EllAdicRealization Layer 8.

## WC.1 — Zeta arithmetic and finite-extension API

*Coverage in `WeilConjectures--WC.0.json`: planned, 15 nodes.* Every stated target and key definition/theorem has a declaration-level plan. Closure awaits the exact recorded owner inputs: PR196 point, orbit and twist interface registration, PR196 rational realization and trace interface registration, DM stack Part II carriers and trace/purity/comparison, Kisin–Lehrer source collation and realization compatibility, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions, SchemeAndStackFoundations:SF.1, ReductiveGroupsPartII:RG2.3. Blueprint completeness is not implementation or geometric closure.

The layer has three groups of nodes.

- **The zeta function and its rationality.**
  - `zeta-function-euler-product-and-point-counts` identifies PR196's Z_X with the integral Euler product, coefficientwise finite in ℤ[[T]] (integrality comes from the product, since PR196 defines Z over ℚ by the exponential). It records the disjoint-union, open–closed and base-extension laws, and the arithmetic zeta ζ_X(s) of a scheme of finite type over ℤ with its finite-field specialisation ζ_X(s) = Z_X(q^{−s}).
  - `closed-point-counts-mobius-inversion` gives N_r = Σ_{m|r} m·a_m and r·a_r = Σ_{m|r} μ(m) N_{r/m} as integer identities, from Mathlib's Möbius inversion.
  - `cohomological-formula-from-the-trace-formula` states PR196's trace and determinant formulas in this roadmap's notation, in Q_ℓ(T).
  - `rationality-over-q-via-hankel-determinants` descends a rational presentation along any field extension K ⊂ L (Milne 27.9, Deligne's Hankel argument); `local-fatou-normalization` proves integrality at one prime, including ℓ = p, with the non-strict inequality (Milne 27.10, source issue E-WC0-2); `normalized-integral-zeta-presentation` combines them into the unique reduced pair P/Q in ℤ[T] with constant terms one. None of this uses purity, and the reduced pair cannot yet be split by degree.
- **Counting tools of Bergström–Faber–Payne.**
  - `finite-groupoid-mass` (a definition with API and tests) is Σ over isomorphism classes of 1/#Aut, on Mathlib's isomorphism quotient. `stack-count-comparison` identifies it with the weighted count of a stack: additive over stratifications, #Y(F_q)/#G(F_q) for [Y/G] with G connected (Lang's theorem from RG2.3), the coarse count for a Deligne–Mumford stack, and the stack trace formula.
  - `twisted-frobenius-point-comparison` counts the twisted form X^σ by the trace of F_q^*σ^* on H_c^*. The twisted form needs σ of finite order and effective descent (source issue E-WC0-12), which is requested from SF.1.
  - `signed-frobenius-configuration-coefficient` (a definition) sums over Frobenius-stable sets of distinct points with sign (−1)^{orbits}. `inverse-zeta-configuration-formula` identifies it with the coefficients of Z^{−1} (Vakil–Wood), `inverse-zeta-even-cohomology-termination` shows that for proper nonempty Y with no odd cohomology the coefficients stop at the even Betti sum and add up to zero, and `hasse-weil-sieve-for-curve-families` turns this into the exact sieve for the smooth fibres of a family of curves (Bergström–Faber–Payne 7.5, without the flatness hypothesis the review removed).
  - `equivariant-count-character-lattice` treats σ ↦ #X^σ(F_q) as a class function; it lifts to the integral representation ring exactly when its irreducible coordinates are integers, which an arbitrary twisted count need not satisfy (source issue E-WC0-10).
- **The curve numerator.** `curve-zeta-numerator-without-rh` writes Z_C = Π_C/((1 − T)(1 − qT)) with Π_C ∈ ℤ[T] of degree 2g and N_r = 1 + q^r − Σ α_j^r, without any bound on the α_j. It feeds both the recurrence of WC.5 and the independent surface proof.

### Integral Euler-product comparison

`WC.1/zeta-function-euler-product-and-point-counts` · theorem · WC.0 part · declaration `TauCeti.PointCounting.zeta_euler_comparison`

For separated finite-type X/k, the upstream point-count zeta Z_X, normalized by Z_X(0)=1, identifies coefficientwise with ∏_(closed x)(1−T^deg(x))⁻¹ in Z[[T]]. In Q[[T]] it identifies with exp(Σ_(r≥1) N_r T^r/r). The product is coefficientwise locally finite. Under the same comparison, finite disjoint unions give products, X=U∐Y with U open and Y closed gives Z_X=Z_U Z_Y, and degree-s base change replaces the point-count sequence N_r by N_(sr). This node compares existing constructions and does not define a zeta object. For finite-type X over Z, the requested arithmetic-zeta interface uses N(x)=#κ(x) for closed x and ζ_X(s)=∏_x(1−N(x)^(−s))⁻¹, with constant-one formal Dirichlet expansion and absolute convergence in a supplied right half-plane. For X over F_q, N(x)=q^deg(x), so ζ_X(s)=Z_X(q^(−s)) wherever these products converge. The general arithmetic object is imported from the point-counting owner extension specified in the gap; its existence is not asserted to be already in PR196 Layer 13.

**Proof.**

1. Transport the upstream TraceFormula Layer 13 exponential/Euler equality along the WC.0 point and degree comparisons.
2. PR196 Layer 13 defines Z over Q by the exponential and proves the Euler product. Each factor (1−T^deg x)⁻¹ lies in 1+T·Z[[T]] and only finitely many closed points have each degree, so the product is coefficientwise a finite product in Z[[T]] and the coefficients are integers; the exponential formulation is only over characteristic-zero coefficients.
3. Transport the supplier’s decomposition and extension identities; normalization removes a multiplicative constant.
4. For the arithmetic comparison import the finite-residue-field/bounded-norm finiteness and actual norm-Euler Dirichlet construction with its convergence theorem. Reindex the finite-field specialization by residue degree, then use equality of convergent Euler factors to identify ζ_X(s) with Z_X(q^(−s)). This does not substitute a complex scalar into an arbitrary formal power series outside its convergence domain.

**Acceptance.**

- A¹ has Z=1/(1−qT); P¹ has Z=1/((1−T)(1−qT)).
- An empty scheme has Z=1; Spec F_(q²) has Z=1/(1−T²).
- Test P¹=A¹∐point and finite-base-extension q↦q^s.
- For Spec Z the arithmetic product is the Riemann zeta function; for Spec F_q its specialization is 1/(1−q^(−s)).

**Depends on.** this roadmap: `WC.0/finite-extension-point-tower-comparison`, `WC.0/closed-point-degree-comparison`; stages: `SchemeAndStackFoundations:SF.1`.

**Used here by.** `WC.1/cohomological-formula-from-the-trace-formula`, `WC.1/normalized-integral-zeta-presentation`, `WC.1/inverse-zeta-configuration-formula`, `WC.1/curve-zeta-numerator-without-rh`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, (1.1)–(1.1.3), pp.273–274: “Soient X un schéma de type fini sur Z, |X| l'ensemble des points fermés de X et, pour x∈|X|, soit N(x) le nombre d'éléments du corps résiduel k(x) de X en x.” — The arithmetic Hasse–Weil zeta (1.1.1) and its finite-field specialization (1.1.2)–(1.1.3).
- `pr196`, TraceFormula Layer 13: “as a formal power series over \(\mathbf Q\), and prove the equivalent Euler product” — PR196 defines Z over Q by the exponential and proves the Euler product and decomposition/extension laws; integrality of coefficients follows from the Euler product.

**Assembly note.** This node, with `WC.1/normalized-integral-zeta-presentation` and `WC.1/cohomological-formula-from-the-trace-formula`, answers the WC.6 part’s request to WC.1 (normalised rational descent with integral expansion, agreement with PR196 TraceFormula 13, the determinant realization for all powers), which four WC.6-part nodes cite as the stage `WC.1`.

### Closed-point Möbius inversion

`WC.1/closed-point-counts-mobius-inversion` · theorem · planet “Closed-point Möbius inversion” · WC.0 part · declaration `TauCeti.PointCounting.closed_point_counts_mobius`

For the actual extension counts N_r and degree-m closed-point counts a_m, for every r≥1, N_r=Σ_(m|r) m a_m and r a_r=Σ_(m|r) μ(m)N_(r/m), as equalities of integers. Consequently the latter sum is nonnegative and divisible by r, and a_r is recovered without rational-rounding conventions. The formulas include non-geometrically-connected and empty schemes.

**Proof.**

1. Apply the already-owned Frobenius orbit decomposition via the WC.0 closed-point comparison: an orbit of length m contributes m precisely when m divides r.
2. Apply ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq to f(m)=m a_m with f(0)=N(0)=0; specialize to positive indices.
3. Transfer nonnegativity and divisibility from the actual finite count a_r rather than adding them as hypotheses on arbitrary sequences.

**Acceptance.**

- For A¹/F₄, a₁=4, a₂=(16−4)/2=6 and a₃=(64−4)/3=20.
- For Spec F_(q²), the inverse recovers only a₂=1.
- For arbitrary fake N₁=0,N₂=1 the divided result is not integral, so actual point counts are essential.

**Depends on.** this roadmap: `WC.0/closed-point-degree-comparison`; libraries: `mathlib:ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: signature (Integer divisor sums prototype; geometric identification remains the preceding comparison).

**Sources.**

- `deligne-i`, (1.4) d) and (1.4.1), p.275: “(pour x∈|X₀| et deg(x)|n, x définit deg(x) points à coordonnées dans F_{q^n}, tous conjugués sur F_q).” — The relation N_r = Σ_{m|r} m a_m; Möbius inversion is the WC arithmetic export.
- `baseline-wc-interfaces`, ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq: “theorem sum_eq_iff_sum_smul_moebius_eq [AddCommGroup R] {f g : ℕ → R} :” — Use the existing general inversion theorem.

### Cohomological zeta comparison

`WC.1/cohomological-formula-from-the-trace-formula` · theorem · planet “Cohomological zeta formula” · WC.0 part · declaration `TauCeti.PointCounting.cohomological_zeta_comparison`

For separated finite-type X/k and ℓ≠p, set P_i(T)=det(1−T F_q | H_c^i(X_k̄,Q_ℓ)). The WC notation identifies the upstream trace and determinant formulas N_r=Σ_i (−1)^i Tr(F_q^r|H_c^i) and Z_X(T)=∏_i P_i(T)^((−1)^(i+1)) in Q_ℓ(T), whose expansion at zero agrees with the integral Euler series. Only finitely many degrees occur. For proper X use ordinary cohomology. Invertibility gives deg P_i=dim H_c^i; the zero space has P_i=1. No RH or semisimplicity is required.

**Proof.**

1. Apply upstream TraceFormula Layer 14 using the exact compact-support/rational-coefficient/Frobenius adapter.
2. Use the existing characteristic-polynomial reversal and the DWP.0 determinant/trace interface only in characteristic zero; its generic formal-log statement needs the qualification recorded in the source issues.
3. Compare in the common Laurent-series carrier and use zero normalization. Do not compose a formal series with T⁻¹.

**Acceptance.**

- For a proper geometrically connected curve the denominator is (1−T)(1−qT).
- For A¹ use H_c²=Q_ℓ(−1); substituting ordinary H⁰ gives the wrong count.
- A nontrivial Jordan block contributes algebraic multiplicity to traces and determinant, without diagonalization.

**Depends on.** this roadmap: `WC.0/geometric-frobenius-realization-comparison`, `WC.1/zeta-function-euler-product-and-point-counts`; other roadmaps: `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`; libraries: `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.reverse_charpoly`.

**Used here by.** `WC.1/rationality-over-q-via-hankel-determinants`, `WC.1/twisted-frobenius-point-comparison`, `WC.1/inverse-zeta-even-cohomology-termination`, `WC.2/signed-zeta-functional-equation`, `WC.3/integral-factors-and-ell-independence-from-purity`, `WC.1/curve-zeta-numerator-without-rh`, `WC.5/all-extension-point-count-bound`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, (1.5)–(1.5.4), pp.275–276; (1.15), p.279: “Cette formule est l'interprétation cohomologique de Grothendieck de la fonction Z.” — Trace formula gives the determinant expression.
- `pr196`, TraceFormula Layers 12–13 (constant coefficients: point count and zeta determinant formula); Layer 14 (sheaf coefficients): “Using Grothendieck--Lefschetz and the determinant identity, prove” — General trace and determinant/rationality theorem remains upstream; Layer 13 is the constant-sheaf zeta formula.

**Assembly note.** Step 2 relies on `DWP.0/characteristic-power-series-and-traces` only in characteristic zero. The WC.0 part asked that node’s owner to separate the division-free form from the formal logarithm; REV-DeligneWeightsAndPurity--DWP.0 has made that correction, so the qualification is now in the supplier’s statement.

### Rational-series descent

`WC.1/rationality-over-q-via-hankel-determinants` · theorem · planet “Rational-series descent” · WC.0 part · declaration `TauCeti.PointCounting.rational_series_descent`

Let K⊂L be fields, f∈K[[T]], and suppose its coefficient image in L[[T]] has a rational presentation P/Q with P,Q∈L[T] and Q(0)≠0, meaning Q f=P after scalar extension. Then f admits such a presentation over K. Applied to the integral WC zeta series and its actual Q_ℓ determinant realization, this yields Z_X∈Q(T), with unique relatively prime numerator and denominator normalized to constant term one. No purity is used.

**Proof.**

1. A rational presentation gives an eventual finite linear recurrence, hence a uniform bound on ranks of finite Hankel matrices (including the finitely many initial exceptional columns).
2. Every relevant minor lies in K; its vanishing is equivalent after the injective field extension. Choose a finite spanning set of columns of the infinite shift/Hankel system over K.
3. Finite-dimensional stabilization gives a nonzero polynomial recurrence over K and a polynomial product Q₀ f. If Q₀ has an initial power of T, cancel it to make Q₀(0) nonzero; normalize its constant.
4. Over a field divide numerator and denominator by their gcd. For f(0)=1 both normalized constants are one, and cross multiplication plus coprimality proves uniqueness.

**Acceptance.**

- The constant series 1 has reduced pair (1,1).
- A denominator with initial T-factor must have it cancelled before expansion at zero.
- Over Q⊂Q_ℓ, the descended object has rational coefficients; this does not yet imply individual degree factors are rational.

**Depends on.** this roadmap: `WC.1/cohomological-formula-from-the-trace-formula`; libraries: `mathlib:PowerSeries.ext`.

**Used here by.** `WC.1/normalized-integral-zeta-presentation`, `WC.2/functional-equation-multiplier-descent`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: signature (Concrete PowerSeries over a field extension and denominator-cleared equality).

**Sources.**

- `milne-lec`, Lemma 27.9 and proof, pp.156–157: “Let k ⊂ K be fields, and let f(t) ∈ k[[t]]; if f(t) ∈ K(t), then f(t) ∈ k(t).” — Rationality descends along a field extension.
- `deligne-i`, Preuve de (1.7) ⇒ (1.6), p.276: “Cette nullité est vraie dans Q_ℓ si et seulement si elle l'est dans Q” — Hankel rationality descent used in Weil I.

### Local Fatou integrality

`WC.1/local-fatou-normalization` · theorem · WC.0 part · declaration `TauCeti.PointCounting.local_fatou_normalization`

For a prime ℓ, let f∈1+T Z_ℓ[[T]] and P,Q∈Q_ℓ[T] be relatively prime, P(0)=Q(0)=1, with Qf=P in Q_ℓ[[T]]. Then every coefficient of P and Q has ℓ-adic norm at most one, so both lie in Z_ℓ[T]. The conclusion is non-strict. The prime may equal the geometric characteristic p.

**Proof.**

1. Pass to a finite splitting extension with the extended ℓ-adic norm, supplied by LocalFieldsRamification Layer 0.
2. If Q has a reciprocal root α with norm greater than one, its zero α⁻¹ lies in the open unit disc, where the bounded-coefficient series converges. Evaluate Qf=P there to contradict coprimality.
3. Thus reciprocal roots of Q have norm at most one; the ultrametric inequality bounds its elementary symmetric coefficients. Since f is a unit over Z_ℓ[[T]], apply the same argument to f⁻¹ and P.
4. Retain ≤1 at the boundary, correcting the printed <1 in Milne 27.10.

**Acceptance.**

- f=1/(1−T) has denominator reciprocal root 1 of norm exactly one.
- A common factor in P,Q invalidates the pole argument and must be cancelled.
- Normalize constants to one; arbitrary scalar multiples need not be integral.

**Depends on.** stages: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`; libraries: `mathlib:Summable.of_norm_bounded`, `mathlib:summable_geometric_of_abs_lt_one`, `mathlib:PowerSeries.ext`.

**Used here by.** `WC.1/normalized-integral-zeta-presentation`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: signature (Q_ℓ PowerSeries with bounded coefficients and normalized coprime polynomials).

**Sources.**

- `milne-lec`, Lemma 27.10 and proof, p.158: “If g and h are relatively prime, then they have coefficients in Zℓ.” — Corrected local integrality argument, including ℓ=p.

### Normalized integral rational zeta

`WC.1/normalized-integral-zeta-presentation` · theorem · WC.0 part · declaration `TauCeti.PointCounting.normalized_integral_zeta_presentation`

For separated finite-type X/k, the reduced Q(T) zeta presentation is uniquely P/Q with P,Q∈Z[T], P(0)=Q(0)=1 and coprime over Q. Its formal image in Z[[T]] is the imported Euler product. Reduction, numerator, denominator and normalization commute with field embeddings. These P,Q are parity products only after cancellation; this theorem does not identify individual cohomological P_i.

**Proof.**

1. Use rational-series descent and normalize the coprime rational presentation.
2. For every prime ℓ, including p, apply local Fatou to the integral Euler-series coefficients.
3. Write each rational coefficient in reduced numerator/denominator form. If its denominator exceeds one, a prime divisor of the denominator gives ℓ-adic norm greater than one, contradicting local integrality. Hence each coefficient is an integer.
4. Cross multiplication proves uniqueness of the normalized reduced pair and its coefficient embeddings.

**Acceptance.**

- P¹ has numerator 1 and denominator (1−T)(1−qT).
- A cancelled eigenvalue is absent from the reduced pair; reduced pair alone cannot label degrees without purity.
- Include ℓ=p in the integrality check, although étale realization used only ℓ≠p.

**Depends on.** this roadmap: `WC.1/rationality-over-q-via-hankel-determinants`, `WC.1/local-fatou-normalization`, `WC.1/zeta-function-euler-product-and-point-counts`; libraries: `mathlib:padicNorm`.

**Used here by.** `WC.3/degreewise-pure-factor-extraction`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `milne-lec`, Proposition 27.11 and proof, p.158: “The hypotheses of the preceding lemma hold for all primes ℓ (including p).” — Global integrality from all primes.
- `deligne-i`, Preuve de (1.7) ⇒ (1.6), p.276: “D'après un lemme de Fatou, que Z(X₀, t) soit dans Z[[t]] et de terme constant un implique que les termes constants de P et Q sont 1.” — Integral normalized reduced presentation precedes weight extraction.

### Finite groupoid mass

`WC.1/finite-groupoid-mass` · definition · planet “Finite groupoid mass” · WC.0 part · declaration `TauCeti.PointCounting.groupoidMass`

For a groupoid C with finitely many isomorphism classes and finite automorphism groups, define mass(C)∈Q as Σ_[x] 1/#Aut_C(x). The quotient is Mathlib’s existing isIsomorphicSetoid; the denominator is the cardinality of its existing Aut x. Each denominator is positive since it contains the identity. The sum is independent of representatives. Applied to the actual finite-field point groupoid of a finite-type stack with finite mass data, this is its weighted point count; finiteness must be proved before application.

**Construction.**

1. Use the existing quotient of isomorphic objects, choose representatives only to form the finite sum, and use rational inverses of positive cardinalities.
2. Conjugation along an isomorphism gives the existing automorphism-group equivalence, proving independence of choices.
3. An equivalence of groupoids bijects classes and preserves automorphism cardinalities. Discrete and one-object computations follow from the existing category constructions.

**API.**

- `TauCeti.PointCounting.groupoidMass_aut_card_iso` (compatibility): If x≅y then #Aut(x)=#Aut(y), so their mass summands agree.
- `TauCeti.PointCounting.groupoidMass_equivalence` (functoriality): A groupoid equivalence C≌D between finite-mass groupoids preserves mass.
- `TauCeti.PointCounting.groupoidMass_discrete` (compatibility): For a finite type A, mass(Discrete A)=#A.
- `TauCeti.PointCounting.groupoidMass_singleObj` (simp): For a finite group G, mass(SingleObj G)=1/#G.
- `TauCeti.PointCounting.groupoidMass_product` (compatibility): For finite-mass groupoids C,D, mass(C×D)=mass(C)mass(D).
- `TauCeti.PointCounting.groupoidMass_sum` (relation): For finite-mass groupoids C and D, mass(C ⊕ D)=mass(C)+mass(D); this is the additivity used for a finite locally closed stratification of a stack.
- `TauCeti.PointCounting.groupoidMass_actionCategory` (compatibility): For a finite group G acting on a finite type Y, the mass of Mathlib’s action groupoid ActionCategory G Y is #Y/#G (orbit–stabiliser); this is the numerical content of the quotient-stack count #Y(F_q)/#G(F_q).

**Unit tests.**

- `TauCeti.PointCounting.groupoidMass_empty` (degenerate): mass(Discrete Empty)=0.
- `TauCeti.PointCounting.groupoidMass_three` (computation): mass(Discrete(Fin 3))=3.
- `TauCeti.PointCounting.groupoidMass_cyclic_two` (computation): For the group Multiplicative(ZMod 2), the one-object groupoid has mass 1/2.
- `TauCeti.PointCounting.groupoidMass_cyclic_two_not_one` (non-example): The same groupoid’s mass is not its number 1 of isomorphism classes.
- `TauCeti.PointCounting.groupoidMass_regular_action` (non-example): For G=Multiplicative(ZMod 2) acting on itself by left multiplication, ActionCategory G G has two objects but mass 1, not 2: summing over objects instead of isomorphism classes is wrong.

**Acceptance.**

- Summation is over classes, not all representatives; automorphisms are in the denominator.

**Used by.**

- BFP Proposition 1.3: Weights stack rational points and finite quotient/twisted forms.
- BFP §7 and §9; MotivicStructuresInModuliOfCurves: Transfers additive counts and automorphism weights to sieve and equivariant applications.
- BFP Proposition 1.3(i)–(ii): Stratification additivity and the quotient formula #X(F_q)/#G(F_q) are additivity of mass and the action-groupoid mass.

**Depends on.** libraries: `mathlib:CategoryTheory.isIsomorphicSetoid`, `mathlib:CategoryTheory.Aut`, `mathlib:CategoryTheory.Aut.autMulEquivOfIso`, `mathlib:CategoryTheory.SingleObj.groupoid`, `mathlib:Units.toAut`, `mathlib:CategoryTheory.Discrete`.

**Used here by.** `WC.1/stack-count-comparison`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: signature (The actual Mathlib Groupoid, isomorphism quotient, Aut, Discrete and SingleObj carriers).

**Sources.**

- `bfp`, §1, the displayed definition of #X(F_q) before Proposition 1.3, p.2: “Recall that if X is an algebraic stack and Fq is the finite field with q elements, then X(Fq) is a finite groupoid.” — The numerical weighted count; stack and quotient geometry remain suppliers.

### Stack mass, quotients and the trace formula

`WC.1/stack-count-comparison` · theorem · WC.0 part · declaration `TauCeti.PointCounting.stack_count_comparison`

For a finite-type stack X/F_q whose rational-point groupoid has finite mass data, compare its weighted count with groupoidMass. It is additive over a finite locally closed stratification. For [Y/G] with Y finite type and G a connected smooth linear algebraic group, the count is #Y(F_q)/#G(F_q), by Lang’s torsor triviality. For a finite-type DM stack with coarse space X_c it equals #X_c(F_q). For a separated finite-type DM stack with bounded finite-dimensional rational compact-support cohomology it equals Σ_i(−1)^i Tr(F_q|H_c^i). These are comparisons with imported stack constructions; a disconnected group requires its torsor forms and is not covered by the connected quotient formula.

**Proof.**

1. Construct the comparison using the supplier’s actual point groupoid and finite-mass theorem, then partition classes by strata.
2. For the connected quotient use Lang’s H¹(F_q,G)=1 and orbit–stabilizer to sum inverse stabilizer orders.
3. For DM coarse spaces use the supplier’s rational cohomology/coarse-space comparison or its finite fibre mass-one theorem, including nonsplit residual gerbes.
4. Apply the stack compact-support trace formula with geometric Frobenius. General Artin-stack unbounded cohomological traces are not substituted for the stated bounded DM case.

**Acceptance.**

- For B(C₂), rational torsor classes each have weight 1/2; total mass is 1, agreeing with the coarse point, not 1/2.
- For [A¹/G_m], q/(q−1) is the mass, rather than the number of geometric orbits.
- For a scheme regarded as a stack all automorphism groups are trivial.

**Depends on.** this roadmap: `WC.1/finite-groupoid-mass`, `WC.0/geometric-frobenius-realization-comparison`; stages: `SchemeAndStackFoundations:SF.1`, `ReductiveGroupsPartII:RG2.3`.

**Used here by.** `WC.5/local-polynomial-count-cutoff`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, Proposition 1.3(i)–(iv), p.2: “If X is a quotient stack [X/G], where X is a scheme and G is a connected linear algebraic group, then” — Numerical applications of independently constructed stack theory.

### Twists and Frobenius traces

`WC.1/twisted-frobenius-point-comparison` · theorem · WC.0 part · declaration `TauCeti.PointCounting.twisted_frobenius_point_comparison`

Let X/F_q be separated finite type, with a finite group G of F_q-automorphisms and effective finite descent for the twists under consideration (for example quasiprojective X). For σ∈G, let X^σ be the form for which the transported arithmetic descent operator on geometric points is σF_q. Its rational points are Fix(σF_q); its compact-support count is Σ_i(−1)^i Tr(F_q^*σ^*|H_c^i). For proper X ordinary cohomology suffices. After degree-r extension this same twist has descent operator σ^rF_q^r, which differs in general from the new σ-twist of X/F_(q^r).

**Proof.**

1. Use the supplier’s effective finite descent and the actual Frobenius convention bridge; declare the transported operator to fix the possible inverse-twist convention.
2. The fixed-point bijection and upstream automorphism/trace formula give the count with commuting operators.
3. Iterate the descent cocycle r times; σ is defined over k, hence commutes with F_q. The corresponding cohomological pullbacks commute as well.

**Acceptance.**

- σ=1 gives ordinary counts.
- The nonsplit smooth quadric becomes split over F_(q²): its original involution twist has σ²=1 after extension.
- An arbitrary automorphism over k̄ without finite descent data does not meet the hypotheses.

**Depends on.** this roadmap: `WC.0/finite-extension-point-tower-comparison`, `WC.1/cohomological-formula-from-the-trace-formula`; stages: `SchemeAndStackFoundations:SF.1`.

**Used here by.** `WC.1/equivariant-count-character-lattice`, `WC.4/equivariant-polynomial-point-counts`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, §9.1, pp.21–22 (published p.1351): “Then there is a unique twisted form of X, denoted X^σ with an isomorphism” — Twisted point counts; existence needs σ of finite order and effective descent (source issue E-WC0-12); the geometric construction is imported.
- `pr196`, TraceFormula Layer 11 (compatibility with finite group actions) and Layer 14 (finite group equivariance and isotypic factors): “finite group equivariance and isotypic factors when the coefficient field permits them.” — Group-action trace compatibility is upstream. The read PR196 head does not construct the twisted forms X^σ themselves; that descent input stays in the gap ledger.

### Signed Frobenius configurations

`WC.1/signed-frobenius-configuration-coefficient` · definition · planet “Signed Frobenius configurations” · WC.0 part · declaration `TauCeti.PointCounting.signedConfigurationCoefficient`

Let A be a type with a permutation σ and suppose that for each n the set C_n(σ) of σ-stable finite subsets S⊂A of cardinal n is finite. Define c_n(σ)=Σ_(S∈C_n(σ)) (−1)^o(S)∈Z, where o(S) is the number of σ-orbits contained in S. Use the existing orbit equivalence for the cyclic subgroup generated by σ; o(S) is the cardinality of the image of S in that quotient. The sign counts orbits, not geometric points. For A=X(k̄), σ=arithmetic Frobenius, WC.0 supplies the finite configuration condition from finite closed-point counts of degrees ≤ n.

**Construction.**

1. Take the existing finite-subset and orbit-quotient carriers; form the finite sum using the stated finiteness of C_n.
2. If n=0, there is only the empty subset and its orbit number is 0; if n=1, stable subsets are fixed points and each has sign −1.
3. When A is finite, no configuration of size greater than #A exists. Conjugating σ transports subsets and orbit images, proving invariance.

**API.**

- `TauCeti.PointCounting.signedConfigurationCoefficient_zero` (simp): For every σ satisfying finite-configuration hypotheses, c₀(σ)=1.
- `TauCeti.PointCounting.signedConfigurationCoefficient_one` (characterisation): c₁(σ)=−#Fix(σ).
- `TauCeti.PointCounting.signedConfigurationCoefficient_conjugate` (functoriality): A bijection e:A≃B gives c_n(eσe⁻¹)=c_n(σ).
- `TauCeti.PointCounting.signedConfigurationCoefficient_above_card` (simp): For finite A and n>#A, c_n(σ)=0.
- `TauCeti.PointCounting.signedConfigurationCoefficient_sumCongr` (structure): For permutations σ of A and τ of B, c_n(σ⊕τ)=Σ_{i+j=n} c_i(σ)c_j(τ): the coefficients multiply as polynomials under disjoint union, matching BFP (9).
- `TauCeti.PointCounting.signedConfigurationCoefficient_generating` (characterisation): For finite A, Σ_{n≤#A} c_n(σ)T^n=∏_{O orbit of σ}(1−T^{#O}) in Z[T]; this is the finite form of the inverse-zeta Euler product.

**Unit tests.**

- `TauCeti.PointCounting.signedConfigurationCoefficient_empty` (degenerate): The empty permutation has c₀=1 and c₁=0.
- `TauCeti.PointCounting.signedConfigurationCoefficient_fixed_two` (computation): For the identity on Bool, (c₀,c₁,c₂)=(1,−2,1).
- `TauCeti.PointCounting.signedConfigurationCoefficient_two_cycle` (computation): For the transposition of Bool, c₁=0 and c₂=−1.
- `TauCeti.PointCounting.signedConfigurationCoefficient_two_cycle_sign` (non-example): The two-cycle’s c₂ is not +1; geometric-cardinality parity is the wrong sign.

**Acceptance.**

- A closed orbit of length 2 contributes −1 to c₂, not +1.

**Used by.**

- BFP §7 Proposition 7.4: Identifies c_n with the inverse-zeta coefficient and controls finite termination.
- BFP Propositions 7.1,7.5 and Remark 7.6: Sums singularity configurations over the parameter fibre for the Hasse–Weil sieve.

**Depends on.** this roadmap: `WC.0/closed-point-degree-comparison`; libraries: `mathlib:MulAction.orbitRel`, `mathlib:Subgroup.zpowers`.

**Used here by.** `WC.1/inverse-zeta-configuration-formula`, `WC.1/hasse-weil-sieve-for-curve-families`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: signature (Actual Finset, Equiv.Perm, Subgroup.zpowers and MulAction.orbitRel, with finite stable-configuration subtypes).

**Sources.**

- `bfp`, §7, formula (8) and Definition 7.3, pp.11–12: “be the coefficient of t^d in the inverse Hasse–Weil zeta function of Y.” — The weighted configuration coefficient used by the inverse-zeta sieve.

### Inverse zeta and configurations

`WC.1/inverse-zeta-configuration-formula` · theorem · WC.0 part · declaration `TauCeti.PointCounting.inverse_zeta_configuration_formula`

For separated finite-type Y/F_q, the coefficient of T^n in Z_Y(T)⁻¹ equals c_n(F_q on Y(k̄)). Equivalently it is the sum over partitions λ of n of (−1)^length(λ) times the number of Frobenius-stable distinct-point configurations of orbit lengths λ. A length-m orbit contributes a factor 1−T^m. Every coefficient sum is finite; configurations with repeated geometric points are excluded.

**Proof.**

1. Apply the imported locally finite Euler product, invert its unit, and expand ∏_(closed x)(1−T^deg x) coefficientwise.
2. A monomial selects a finite collection of distinct closed points. Under WC.0 it corresponds to a stable geometric subset; total degree is geometric subset size and the sign is the number of selected orbits.
3. Group these subsets by their multiset of orbit lengths; this is the partition formula used by Vakil–Wood. The geometric configuration schemes and finite quotients realizing Y(λ) are supplied by the scheme/quotient owner.

**Acceptance.**

- One rational point gives 1−T; one degree-two closed point gives 1−T².
- Two rational points give (1−T)², while a two-cycle gives 1−T².
- The coefficient at 0 is 1 even for empty Y.

**Depends on.** this roadmap: `WC.1/signed-frobenius-configuration-coefficient`, `WC.1/zeta-function-euler-product-and-point-counts`; stages: `SchemeAndStackFoundations:SF.1`.

**Used here by.** `WC.1/inverse-zeta-even-cohomology-termination`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, §7, formula (8) (Vakil–Wood), p.11: “where #Y(λ) denotes the number of Frobenius-stable subsets of Y(F̄q) with orbit type λ” — Vakil–Wood inverse-zeta formula as used in the paper.

### Termination of the inverse-zeta sieve

`WC.1/inverse-zeta-even-cohomology-termination` · theorem · planet “Inverse-zeta termination” · WC.0 part · declaration `TauCeti.PointCounting.inverse_zeta_even_termination`

For a nonempty proper Y/F_q with bounded finite-dimensional rational cohomology and H^odd=0, put b=Σ_(i even) dim H^i. Then Z_Y⁻¹=∏_(i even) det(1−T F|H^i) is a polynomial of degree b, c_n=0 for n>b, and Σ_(n=0)^b c_n=0. Nonempty H⁰ contains a Frobenius-fixed vector, even if components are permuted, so the polynomial vanishes at 1. The empty case instead has inverse zeta 1, b=0 and sum 1.

**Proof.**

1. Apply the cohomological zeta comparison; properness identifies compact supports and vanishing removes the odd denominator.
2. Use invertible Frobenius to compute the exact degree as the sum of even dimensions.
3. The sum of constant functions on all geometric connected components is a nonzero fixed vector; hence the H⁰ factor vanishes at 1. Evaluate the inverse-zeta polynomial there and identify its coefficients by the configuration formula.

**Acceptance.**

- A point has c₀=1,c₁=−1 and total 0.
- A degree-two finite étale point has c₀=1,c₂=−1 and total 0.
- Empty Y has total 1 and is excluded from the vanishing assertion.

**Depends on.** this roadmap: `WC.1/cohomological-formula-from-the-trace-formula`, `WC.1/inverse-zeta-configuration-formula`.

**Used here by.** `WC.1/hasse-weil-sieve-for-curve-families`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, Proposition 7.4 and proof, p.12: “Let Y be a nonempty algebraic variety (possibly reducible or disconnected) that is proper over Fq” — Finite termination and sum at 1, for nonempty Y as in the source.

### Hasse–Weil sieve

`WC.1/hasse-weil-sieve-for-curve-families` · theorem · WC.0 part · declaration `TauCeti.PointCounting.hasse_weil_sieve`

Let a finite-type parameter scheme V/F_q carry a surjective family of curves, allowing nonreduced fibres, with each scheme-theoretic singular locus proper of finite type and having no odd rational cohomology. The loci may have positive dimension. For v∈V(F_q), let s_d(v)=c_d(F_q on Sing(C_v)); set S_d=Σ_v s_d(v) and B=max_v Σ_even dim H^i(Sing(C_v)), taking B=0 if V(F_q) is empty. Then #V_smooth(F_q)=#V(F_q)+Σ_(d=1)^B S_d. For k<B, the truncated expression #V(F_q)+Σ_(d=1)^k S_d has exact error Σ_(d=k+1)^B S_d; the tail is supported only on fibres whose even Betti sum exceeds k. Finite type gives finitely many Frobenius-stable configurations of each fixed degree, without a finite geometric point-set assumption. The reduced-curve finite-singular-locus case is a specialization. All terms and weights are explicit; no uniform asymptotic constant is asserted without a supplied bound on these tail configurations.

**Proof.**

1. For a smooth fibre the singular locus is empty and its total signed coefficient sum is 1. For every singular fibre the nonempty inverse-zeta termination theorem makes that total 0.
2. Sum this indicator over the finite parameter point set and interchange finite sums to obtain the exact sieve formula.
3. Subtract the truncated finite sum. Fibres with Betti bound ≤ k have no tail; use triangle inequality if a quantitative tail estimate is subsequently supplied.
4. For the finite-singular-locus case, inclusion–exclusion over closed Frobenius orbits agrees with the signs in Proposition 7.1; summing geometric-point parity would fail for a degree-two singularity.

**Acceptance.**

- One degree-two singular orbit contributes −1 at d=2 and excludes the fibre.
- A smooth fibre contributes only d=0, exactly once.
- When V(F_q) is empty every S_d and the smooth count vanish.
- A nonreduced double P¹ has singular support P¹, with inverse zeta (1−T)(1−qT); coefficients 1,−(1+q),q sum to 0 and terminate at degree 2.

**Depends on.** this roadmap: `WC.1/inverse-zeta-even-cohomology-termination`, `WC.1/signed-frobenius-configuration-coefficient`, `WC.0/finite-extension-point-tower-comparison`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, Propositions 7.1,7.5 and Remark 7.6 pp.10–13 full proofs: “Suppose H^odd_ét((C_v^sing)_F̄q, Qℓ) = 0, for all v ∈ V(Fq).” — General sieve tools only; genus-four model counts belong to MotivicStructuresInModuliOfCurves.

### Equivariant point-count characters

`WC.1/equivariant-count-character-lattice` · theorem · WC.0 part · declaration `TauCeti.PointCounting.equivariant_count_character_lattice`

Let X/F_q have a finite F_q-defined group G of automorphisms and effective finite-order twists as in the twist comparison. Let f(σ)=#X^σ(F_q), a conjugacy-invariant function. After choosing a characteristic-zero complex realization of the finite cohomological trace data, expand f=Σ_λ a_λ χ_λ in the complex irreducible-character basis; a_λ is the alternating Frobenius trace on the multiplicity spaces Hom_G(V_λ,H_c^i). Then f has a unique lift to the existing integral complex representation ring R_C(G) if and only if every a_λ is an integer. Under this precise integrality condition its identity value is the ordinary count; additivity and products transport to the ring whenever their summands satisfy that condition. Arbitrary twisted counts need only lie in the complex span of characters, not in the integral virtual-character lattice. The all-Spec-Z polynomial application supplies integrality from actual rational Betti representation classes.

**Proof.**

1. The twist comparison identifies f with the graded Frobenius trace and shows conjugacy invariance. Over C finite-group semisimplicity decomposes cohomology into irreducible types and Frobenius commutes with G, giving the stated coefficients on multiplicity spaces.
2. Apply the pinned virtual-character lattice characterization: integer coordinates are exactly membership in virtualCharacters C G. The existing character-image theorem gives a preimage and finite-group characteristic-zero injectivity gives uniqueness.
3. Use the existing character ring homomorphism for disjoint-union and product identities. An arbitrary integer-valued class function does not satisfy the lattice criterion; BFP Definition 9.1 needs this qualification or a complexified ring.
4. For smooth proper all-Spec-Z polynomial counts use the separately proved WC.4 theorem, whose coefficients are actual rational Betti representations. Do not assume general Kisin–Lehrer integrality or rational Schur-index descent.

**Acceptance.**

- For the trivial group this recovers the scalar count.
- For a degree-two point with its involution, the values (0,2) give trivial minus sign.
- An arbitrary integer class function is rejected without lattice membership.
- For X=Spec F_(q³), G=C₃ its deck group generated by arithmetic Frobenius g, the three twist counts are (0,0,3). Their complex irreducible-character coordinates are (1,ζ₃,ζ₃²); the count is not an integral virtual character.

**Depends on.** this roadmap: `WC.1/twisted-frobenius-point-comparison`; libraries: `tauceti:TauCeti.repRing`, `tauceti:TauCeti.repRingCharacter`, `tauceti:TauCeti.mem_range_repRingCharacter_iff`, `tauceti:TauCeti.repRingCharacter_injective`, `tauceti:TauCeti.mem_virtualCharacters_iff`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, §9.2, Definition 9.1, p.22 (published p.1351): “The G-equivariant point count #_G X(Fq) is the element of the representation ring of G associated to the class function σ ↦ #X^σ(Fq).” — The character-valued point count; its integrality qualification is source issue E-WC0-10; Kisin–Lehrer must be collated.

**Assembly note.** Step 4 refers to the all-Spec ℤ application `WC.4/equivariant-polynomial-point-counts`, which supplies integral coordinates from Betti representations. That node is a consumer of this one, not a prerequisite.

### Curve numerator before RH

`WC.1/curve-zeta-numerator-without-rh` · theorem · WC.0 part · declaration `TauCeti.PointCounting.curve_zeta_numerator_without_rh`

For a smooth projective geometrically connected curve C/k of genus g and ℓ≠p, the supplied curve/Jacobian cohomology comparison gives H⁰=Q_ℓ, H²=Q_ℓ(−1), dim H¹=2g and compatible Frobenius action. There is a normalized integral polynomial Π_C(T) of degree 2g whose Q_ℓ image is det(1−TF|H¹), and Z_C=Π_C/((1−T)(1−qT)). For every r≥1, N_r=1+q^r−Σ_(j=1)^(2g)α_j^r, with α_j the reciprocal roots counted with multiplicity. This theorem uses curve cohomology, rationality and the integral Euler series, without any root-modulus assertion.

**Proof.**

1. Consume the upstream TraceFormula Layers 8,15 curve/Jacobian and endpoint cohomology comparisons; a coherent genus formula alone does not give the rational étale dimension.
2. Specialize the cohomological zeta formula. Multiply its formal integral series by (1−T)(1−qT). Its image is the degree-2g determinant polynomial, so coefficients above degree 2g vanish already in Z by injectivity, and the remaining coefficients give Π_C.
3. Use the upstream characteristic-power/trace theorem over characteristic zero to identify every positive extension count with the full algebraic-multiplicity root sum.
4. The curve numerator’s reciprocity comes from the independent WC.2 pairing, not from a purity or Jacobian RH theorem.

**Acceptance.**

- For genus 0, Π_C=1 and all positive N_r=1+q^r.
- The eigenvalues here are reciprocal roots; polynomial roots are α_j⁻¹.
- No DWP.1/DWP.4 or WC.3 is an input.

**Depends on.** this roadmap: `WC.1/cohomological-formula-from-the-trace-formula`, `WC.1/zeta-function-euler-product-and-point-counts`; other roadmaps: `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`.

**Used here by.** `WC.5/extension-count-recurrence`, `WC.5:surface-alternative/curve-rh-from-surface-bound`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC1`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, (1.5)–(1.5.4), pp.275–276: “Une formule analogue vaut pour les itérés de F” — Trace/rationality and curve degree interfaces without RH.
- `mustata-zeta`, Remark 3.7 and equations (3.8)–(3.10), p.21: “It follows from the definition of the zeta function and from (3.8) that” — Normalized integral curve numerator and positive power sums; correct the source’s g/q typos in Lemma 3.8.

**Assembly note.** `WC.7/curve-zeta-jacobian-agreement` (WC.6 part) restates this identification from the same PR196 layers and adds the canonical-factor and reciprocity statements; structural proposal 6 makes it cite this node.

## WC.2 — Poincaré duality and exact functional equation

*Coverage in `WeilConjectures--WC.0.json`: planned, 5 nodes.* Every stated target and key definition/theorem has a declaration-level plan. Closure awaits the exact recorded owner inputs: DM stack Part II carriers and trace/purity/comparison, EtaleDualityAndPerverseSheaves:EDC.2:pairings, EtaleDualityAndPerverseSheaves:EDC.8. Blueprint completeness is not implementation or geometric closure.

The layer assembles the exact functional equation from duality, before any purity.

- `signed-zeta-functional-equation`: for X smooth proper of pure dimension d, the perfect equivariant pairing H^i × H^{2d−i} → Q_ℓ(−d) of EDC.2:pairings and the determinant relation of EDC.8 give, degree by degree, P_i(1/(q^d T)) = (−1)^{b_i} det(F_i) q^{−d b_i} T^{−b_i} P_{2d−i}(T) and det(F_i)·det(F_{2d−i}) = q^{d b_i}; multiplying with alternating exponents gives Z(1/(q^d T)) = (−1)^χ Δ T^χ Z(T) and Δ² = q^{dχ} in Q_ℓ(T). Projectivity, geometric connectedness and semisimplicity are not assumed.
- `middle-degree-parity`: dχ is even, through the alternating middle pairing for odd d, also for Q_2 coefficients when p is odd.
- `functional-equation-multiplier-descent`: the multiplier A = (−1)^χ Δ lies in ℚ, because it is the constant ratio of two rational functions over ℚ; then ε = A/q^{dχ/2} satisfies ε² = 1. For odd d, ε = +1; for even d, ε = (−1)^N with N the algebraic multiplicity of the eigenvalue +q^{d/2} in middle degree (Deligne I (2.6), Milne 27.13).
- `functional-equation-base-extension`: over k_r, Δ_r = Δ^r and ε_r = (−1)^{(r+1)χ} ε^r, not ε^r: a geometric point has ε_r = −1 for every r.
- `equivariant-polynomial-duality`: for a smooth proper scheme over ℤ with polynomial point count and a finite group G, Poincaré duality gives A(T) = T^d A(T^{−1})^∨ in the representation ring, pairing each irreducible with its dual (Bergström–Faber–Payne Remark 9.4). It depends on `WC.4/equivariant-polynomial-point-counts`, which comes later in the layer order (see "Dependencies").

The examples fix the signs: a geometric point has Z(1/T) = −T·Z(T); a degree-two point has multiplier −T²; P¹ has ε = +1 and P² has ε = −1 with exponent 3; a genus-two curve has multiplier q^{−1}T^{−2}.

### Exact signed functional equation

`WC.2/signed-zeta-functional-equation` · theorem · planet “Signed zeta functional equation” · WC.0 part · declaration `TauCeti.PointCounting.signed_zeta_functional_equation`

Let X/k be smooth proper of pure dimension d and ℓ≠p. For its actual graded rational cohomology let b_i=dim H^i, P_i=det(1−TF_i), χ=Σ_(i=0)^(2d)(−1)^i b_i∈Z, and Δ=∏_(i=0)^(2d) det(F_i)^((−1)^i)∈Q_ℓ×. From the supplied perfect graded Frobenius pairing to Q_ℓ(−d), obtain b_i=b_(2d−i), invertibility and reciprocal spectra with multiplicities. Assemble Z_X(1/(q^dT))=(−1)^χ Δ T^χ Z_X(T) and Δ²=q^(dχ) in Q_ℓ(T). The powers of T, q and determinants with integer exponents are field powers, including negative χ. This is not substitution into an ordinary power series.

**Proof.**

1. Import the actual EDC.2 perfect equivariant pairing and EDC.8 degreewise reciprocal-polynomial/determinant relation; instantiate the DWP.0 reciprocal-spectrum algebra.
2. For each P_i write P_i(1/(q^dT))=(−1)^(b_i) det(F_i) q^(−db_i) T^(−b_i) P_(2d−i)(T). Multiply with exponent (−1)^(i+1), keeping every sign and negative exponent.
3. The determinant pairing gives det(F_i)det(F_(2d−i))=q^(db_i); multiply with parity exponents to obtain Δ²=q^(dχ). Use this to replace q^(dχ)/Δ by Δ in the assembled multiplier.
4. For component permutations retain the actual H⁰/H^(2d) determinants; geometric connectedness is unnecessary for this endpoint.

**Acceptance.**

- For a geometric point (d=0), χ=1, Δ=1 and Z(1/T)=−T Z(T).
- For a degree-two finite étale point, χ=2, Δ=−1 and Z(1/T)=−T² Z(T).
- A genus-two curve has χ=−2 and multiplier q⁻¹ T⁻², testing integer negative powers.
- A Jordan block is allowed; no diagonalization is used.

**Depends on.** this roadmap: `WC.1/cohomological-formula-from-the-trace-formula`; other roadmaps: `DeligneWeightsAndPurity:DWP.0/reciprocal-pairing-of-eigenvalues`; stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.8`; libraries: `mathlib:Matrix.charpoly_inv`.

**Used here by.** `WC.2/middle-degree-parity`, `WC.2/functional-equation-multiplier-descent`, `WC.5/approximate-counts-and-tate-semisimplification`, `WC.5:surface-alternative/curve-rh-from-surface-bound`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC2`, namespace `TauCeti.PointCounting`; suggested file: signature (Algebraic assembly is prototyped on finite graded polynomial/determinant data; the geometric instantiation is omitted).

**Sources.**

- `deligne-i`, (2.3)–(2.6), pp.281–282: “Si les (α_j) sont les valeurs propres du Frobenius géométrique F agissant sur H^i(X, Q_ℓ), les valeurs propres de F agissant sur H^{2n−i}(X, Q_ℓ) sont donc les (q^n α_j^{−1}).” — Actual duality and exact multiplier before shorthand signs.
- `milne-lec`, Theorem 27.12 and proof, p.158: “Therefore, the eigenvalues of F* acting on H^r(X) are the same as the eigenvalues of F acting on H^{2d−r}(X).” — Functional-equation consequence of reciprocal pairing.

**Assembly note.** This is the export the WC.6 part requests from WC.2 for smooth proper schemes: the signed product formula with Δ, Δ² = q^{dχ}, (−1)^χ and integer powers, with no projectivity. `WC.6/smooth-proper-functional-equation` cites it as the stage `WC.2` and restates it (structural proposal 5). It does not cover `WC.6/homology-manifold-weil-assembly`, whose pairing comes from biduality rather than smoothness (see “Cross-part prerequisites”).

### Middle degree and integral half exponent

`WC.2/middle-degree-parity` · theorem · planet “Middle-degree parity” · WC.0 part · declaration `TauCeti.PointCounting.middle_degree_parity`

For smooth proper pure-d X/k, dχ is even. If d is even this is immediate; if d is odd, the characteristic-zero rational middle pairing on H^d is alternating and nondegenerate, hence b_d is even, and duality pairs every remaining degree with the same parity, so χ is even. Consequently m=dχ/2 is an integer, including χ<0. This argument works for Q₂ coefficients when p≠2; residue characteristic two of Z₂ does not make the coefficient field have characteristic two.

**Proof.**

1. Use EDC.2 graded symmetry and perfectness to obtain an alternating middle form for odd d.
2. The supplied determinant/Pfaffian algebra for a nondegenerate alternating form over characteristic zero forces even dimension; use the degree pairs to compute χ modulo 2.
3. Define the integer m using the divisibility conclusion, not a fractional rational power.

**Acceptance.**

- For curves χ=2−2g is even.
- For d=0, m=0 irrespective of the number of components.
- Retain ℓ=2,p odd.

**Depends on.** this roadmap: `WC.2/signed-zeta-functional-equation`; stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.8`.

**Used here by.** `WC.2/functional-equation-multiplier-descent`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC2`, namespace `TauCeti.PointCounting`; suggested file: signature (Integer parity consequence with the explicit even middle-dimension input; construction of the alternating cohomology form is omitted).

**Sources.**

- `deligne-i`, (2.6), p.281: “Si n est impair, la forme Tr(x∪y) sur H^n(X, Q_ℓ) est alternée; l'entier nχ(X) est donc toujours pair.” — Parity and middle-form sign.
- `milne-lec`, Theorem 27.12 p.158 and Remark 27.13 p.159: “The sign is + if d is odd or q^{d/2} occurs an even number of times as an eigenvalue of F acting on H^d(X, Qℓ)” — Usual half-exponent and its sign require this justification.

### Rational multiplier and exact sign

`WC.2/functional-equation-multiplier-descent` · theorem · planet “Functional-equation sign” · WC.0 part · declaration `TauCeti.PointCounting.functional_equation_multiplier_descent`

The scalar A=(−1)^χΔ in the signed functional equation descends from Q_ℓ× to Q×: the nonzero quotient Z_X(1/(q^dT))/(T^χ Z_X(T)) is a rational function over Q and is constant after scalar extension, hence constant over Q. With m=dχ/2 integral, ε=A/q^m∈Q satisfies ε²=1, so ε=±1 and Z_X(1/(q^dT))=ε q^m T^χ Z_X(T). For odd d the alternating middle determinant makes ε=+1. For even d, ε=(−1)^N, where N is the algebraic multiplicity of the eigenvalue +q^(d/2) in middle cohomology, equivalently the dimension of its generalized eigenspace. Semisimplicity is not assumed.

**Proof.**

1. Use the normalized rational zeta presentation and the signed equation. Comparing a nonzero coefficient in the rational-function numerator/denominator identity descends the constant scalar.
2. Use Δ²=q^(dχ) and the integral exponent m to prove ε²=1 in Q, and factor ε²−1.
3. Use EDC.8 middle determinant: the symplectic case gives the positive sign; in the even-dimensional symmetric case, pair reciprocal generalized eigenspaces away from ±q^(d/2), leaving ε=(−1)^N.
4. Descend A before dividing by q^m. This avoids selecting a square root of q in Q_ℓ or Q.

**Acceptance.**

- P¹ has ε=+1 and exponent 1; P² has ε=−1 and exponent 3.
- A geometric point has ε=−1, testing d=0.
- A unipotent middle operator with eigenvalue +1 uses generalized multiplicity, not only eigenspace dimension.

**Depends on.** this roadmap: `WC.2/signed-zeta-functional-equation`, `WC.2/middle-degree-parity`, `WC.1/rationality-over-q-via-hankel-determinants`; stages: `EtaleDualityAndPerverseSheaves:EDC.8`.

**Used here by.** `WC.2/functional-equation-base-extension`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC2`, namespace `TauCeti.PointCounting`; suggested file: signature (The rational scalar descent and ε²=1 core are prototyped; actual middle cohomology is omitted).

**Sources.**

- `deligne-i`, (2.6), pp.281–282: “Si n est pair, notons N la multiplicité de la valeur propre q^{n/2} de F* agissant sur H^n(X, Q_ℓ) (i.e. la dimension du sous-espace propre généralisé correspondant).” — Exact sign through the middle determinant.
- `milne-lec`, Remark 27.13, p.159: “The sign is + if d is odd or q^{d/2} occurs an even number of times as an eigenvalue of F acting on H^d(X, Qℓ)” — Multiplicity of +q^(d/2), not an unspecified sign.

### Functional equation under finite extension

`WC.2/functional-equation-base-extension` · theorem · WC.0 part · declaration `TauCeti.PointCounting.functional_equation_base_extension`

For degree-r extension k_r/k, the same Betti dimensions and χ occur, Frobenius becomes F^r, Δ_r=Δ^r and the exact multiplier becomes (−1)^χΔ^r. Thus the half-power sign is ε_r=(−1)^((r+1)χ)ε^r, with q replaced by q^r. It is not generally ε^r alone. Component-cycle changes are handled by the actual determinant of the powered permutation.

**Proof.**

1. Use the WC.0 restriction/Frobenius-power comparison and determinant of powers to compute Δ_r.
2. Substitute these values into the exact signed formula and cancel the integral powers q^(rm).
3. Retain the factor (−1)^χ rather than powering the whole original multiplier blindly.

**Acceptance.**

- For a geometric point, ε_r=−1 for every r.
- A two-cycle d=0 splits over a quadratic extension and Δ₂=1.
- For curves χ is even, so ε_r=ε^r=+1.

**Depends on.** this roadmap: `WC.0/geometric-frobenius-realization-comparison`, `WC.2/functional-equation-multiplier-descent`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC2`, namespace `TauCeti.PointCounting`; suggested file: signature (Scalar Δ/sign identity on the real integer exponent carrier).

**Sources.**

- `deligne-i`, (2.6) pp.281–282, with (7.2)⇒(1.7) assertion a), p.301: “étendre les scalaires revient à remplacer α par α^n et q par q^n.” — Assembly with the already supplied extension operator.

### Equivariant palindromicity

`WC.2/equivariant-polynomial-duality` · theorem · planet “Equivariant palindromicity” · WC.0 part · declaration `TauCeti.PointCounting.equivariant_polynomial_duality`

Under the smooth proper pure-d polynomial-count hypotheses of the preceding theorem, G-equivariant Poincaré duality gives A_i=[H^(2i)_Betti]=[H^(2d−2i)_Betti]^∨ in the existing rational representation ring. Thus A(T)=T^d A(T⁻¹)^∨ as a Laurent-polynomial identity, with dual applied coefficientwise. Multiplicities of dual irreducibles match; an individual multiplicity polynomial is palindromic when the irreducible is self-dual. For smooth proper DM stacks use the stack duality supplier, not scheme duality.

**Proof.**

1. Apply the supplied finite-group-equivariant actual Poincaré pairing and the WC.4 comparison to rational Betti cohomology.
2. Remove the Tate scalar twist from the G-action since G acts over the base and trivially on that one-dimensional twist.
3. Take representation classes and reverse coefficients. A self-dual character permits scalar palindromicity; otherwise pair dual characters.

**Acceptance.**

- The scalar polynomial of P² is 1+T+T².
- Two non-self-dual complex characters must be paired with each other, not each made separately palindromic.

**Depends on.** this roadmap: `WC.4/equivariant-polynomial-point-counts`; stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`; libraries: `tauceti:TauCeti.repRing`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC2`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, Remark 9.4 p.22: “When X is irreducible of relative dimension d over Z, equivariant Poincaré duality tells us that P_{V∨}(t) = t^d P_V(t^{−1}).” — Representation-valued duality, with self-duality qualification.

**Assembly note.** This node depends on `WC.4/equivariant-polynomial-point-counts`, a later layer. The node graph is acyclic, but the stage-level edge runs backwards; structural proposal 8 moves both equivariant nodes into WC.5.

## WC.3 — Integral factors, all-conjugates RH and ℓ-independence

*Coverage in `WeilConjectures--WC.0.json`: planned, 2 nodes.* Every stated target and key definition/theorem has a declaration-level plan. Closure awaits the exact recorded owner inputs: DeligneWeightsAndPurity:DWP.4. Blueprint completeness is not implementation or geometric closure.

The layer extracts the individual factors once purity is known.

- `degreewise-pure-factor-extraction` is the generic theorem that RS-17 makes WC.3's export. Given finitely many normalised factors over a characteristic-zero field whose reciprocal roots in degree i are algebraic with every conjugate of absolute value q^{i/2}, and whose alternating product is a fixed rational function R ∈ ℚ(T) with normalised integral reduced numerator and denominator, each factor is the image of a unique Π_i ∈ ℤ[T] with Π_i(0) = 1 and deg Π_i = b_i. The proof follows Deligne's (1.7) ⇒ (1.6): distinct weights prevent cancellation, the weight-i multiset is Galois-stable because every embedding is controlled, fixed coefficients descend to ℚ, and the Gauss lemma over ℤ gives integrality. Algebraic integrality of the roots alone is not enough (1 ± √2·T; source issue E-WC0-3). The theorem applies to any supplied degreewise pure realization: rigid cohomology in RD.7, smooth proper schemes in WC.6 and DWP.7, and the projective case here.
- `integral-factors-and-ell-independence-from-purity` keeps the integrated id and applies the extraction to smooth projective X with the purity of DWP.4: integral Π_i, independent of ℓ, of degree b_i, with algebraic-integer reciprocal roots of weight i.

### Degreewise pure factor extraction

`WC.3/degreewise-pure-factor-extraction` · theorem · planet “Degreewise pure factor extraction” · WC.0 part · declaration `TauCeti.PointCounting.degreewise_pure_factor_extraction`

Let q>1 be an integer and let finitely many normalized factors P_i over a characteristic-zero realization field have degree b_i and nonzero reciprocal roots α_(i,j), counted with algebraic multiplicity. Suppose each α is algebraic over Q and every Q-embedding Q(α)→C has modulus q^(i/2). Suppose their alternating product equals a fixed normalized integral-series rational function R∈Q(T), whose reduced numerator and denominator have integer coefficients and constant one. Then each P_i is the coefficient image of a unique polynomial Π_i∈Z[T], Π_i(0)=1 and deg Π_i=b_i. The Π_i are pairwise coprime and uniquely characterized by their weight-i reciprocal-root multiset in the reduced numerator (odd i) or denominator (even i), hence independent of the realization. The assertion applies to any supplied degreewise-pure realization, not only projective étale cohomology.

**Proof.**

1. Distinct weights have distinct positive complex moduli q^(i/2), so no root lies in two P_i and no odd/even cancellation occurs. Multiplicities in the reduced parity products are retained.
2. Take a finite normal splitting field K/Q of the reduced rational numerator and denominator. Galois automorphisms permute each full root multiset, including multiplicity. The all-conjugates weight hypothesis keeps the weight-i submultiset invariant; a single chosen complex embedding would not suffice.
3. Each coefficient of the normalized P_i is fixed by Gal(K/Q); the pinned fixed-element theorem descends it to Q. This is the missing step in the shorthand proof of Milne 27.14(c).
4. Reverse the normalized factors to monic polynomials in reciprocal roots; each divides a monic reverse of an integral parity product. Apply the integrally-closed Gauss lemma over Z⊂Q, then reverse back. Uniqueness of the weight partition gives equality across coefficient fields.

**Acceptance.**

- Factors (1−√2T) and (1+√2T) are coprime and multiply to 1−2T², but individually are not rational; root integrality alone is insufficient.
- Two degree labels with the same claimed weight cannot be separated by this theorem; q=1 is excluded.
- Repeated roots within one degree keep their multiplicities; a Jordan block need not be semisimple.
- A zero-dimensional finite étale permutation factor is integral although its roots are not all 1.

**Depends on.** this roadmap: `WC.1/normalized-integral-zeta-presentation`; other roadmaps: `DeligneWeightsAndPurity:DWP.0/weil-q-number`; libraries: `mathlib:IsGalois.mem_range_algebraMap_iff_fixed`, `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd`.

**Used here by.** `WC.3/integral-factors-and-ell-independence-from-purity`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC3`, namespace `TauCeti.PointCounting`; suggested file: signature (Finite normal splitting-field polynomial core with all complex embeddings and a common reduced integral rational function).

**Sources.**

- `deligne-i`, Preuve de (1.7) ⇒ (1.6), pp.276–277: “Les racines de P_i(t) sont celles des racines de R(t) ayant la propriété que tous leurs conjugués complexes sont de valeur absolue q^{−i/2}. Cet ensemble est stable sous Gal(K/Q).” — All-conjugates Galois-stable extraction with multiplicities.
- `milne-lec`, 27.14(c)–(d) and their proof, p.159: “Therefore the inverse roots of Pr,ℓ(t) are algebraic integers, which implies that Pr,ℓ(t) ∈ 1 + tZ[t], whence (c).” — Milne’s shorthand inference (source issue E-WC0-3) is completed here by the Galois-stability descent of Deligne I.

**Assembly note.** This is the generic extraction that RS-17 makes WC.3’s export and that four consumers request: the WC.6 part (for `WC.6/purity-for-proper-smooth-varieties` and `WC.6/homology-manifold-weil-assembly`, which cite the stage `WC.3`), DWP.7, RD.7 and DWP.10 (which cites this node). Its hypotheses mention no projectivity or smoothness, so it serves all of them.

### Integral projective Weil factors

`WC.3/integral-factors-and-ell-independence-from-purity` · theorem · planet “Integral Weil factors” · WC.0 part · declaration `TauCeti.PointCounting.integral_projective_weil_factors`

For actual smooth projective X/k, not assumed geometrically connected, import the proved DWP.4 smooth-projective purity theorem. For each i obtain a unique Π_i∈Z[T], Π_i(0)=1, with coefficient image det(1−TF_q|H^i(X_k̄,Q_ℓ)) for every ℓ≠p. Its degree is b_i, its reciprocal roots are algebraic integers, and every complex conjugate of every reciprocal root has modulus q^(i/2). Factors of distinct degrees are coprime and the integral Π_i and b_i are independent of ℓ. Frobenius semisimplicity is not part of the conclusion.

**Proof.**

1. Use the WC.0 constructed rational realization and DWP.4 theorem, not a proposition-valued realization carrying purity as an assumption.
2. The WC.1 normalized integral zeta supplies the common rational function. Apply the generic factor-extraction theorem to the actual cohomological factors.
3. Invertibility supplies the exact degree. Read all conjugate moduli from DWP.4 and algebraic integrality from the extracted monic reciprocal polynomial.

**Acceptance.**

- Pⁿ has Π_(2i)=1−q^iT and Π_odd=1.
- No complex fibre or characteristic-zero lift is required.
- Compare coefficient embeddings for two primes ℓ and ℓ′; the integer polynomial is the same.

**Depends on.** this roadmap: `WC.0/geometric-frobenius-realization-comparison`, `WC.1/cohomological-formula-from-the-trace-formula`, `WC.3/degreewise-pure-factor-extraction`; stages: `DeligneWeightsAndPurity:DWP.4`.

**Used here by.** `WC.5/all-extension-point-count-bound`, `WC.5/extension-count-recurrence`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC3`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, Théorème (1.6) and Lemme (1.7), p.276: “Pour chaque i, le polynôme caractéristique det(t.1 − F*, H^i(X, Q_ℓ)) est à coefficients entiers indépendants de ℓ (ℓ≠p).” — Geometric projective application of the generic extractor, preserving its integrated ID.

**Assembly note.** This is the integrated node the WC.6 part calls “projective-only”. It stays projective, as the WC.0 part’s upstream note asks; the smooth proper case is `WC.6/purity-for-proper-smooth-varieties`, through the generic extraction.

## WC.4 — Betti-number comparison in families

*Coverage in `WeilConjectures--WC.0.json`: planned, 2 nodes.* Every stated target and key definition/theorem has a declaration-level plan. Closure awaits the exact recorded owner inputs: PR196 supplied-family rational Artin comparison registration, DM stack Part II carriers and trace/purity/comparison. Blueprint completeness is not implementation or geometric closure.

- `betti-comparison-in-a-supplied-family`: for f : X → S smooth proper over a connected base with ℓ invertible, a specified finite-field fibre, a specified complex fibre and an étale path between them, the PR196 transport (EtaleBaseChange Layers 7–8) and Artin comparison (ComplexComparison Layers 10–12) identify H^i_et of the first with H^i_sing of the second tensored with Q_ℓ. The isomorphism depends on the path; dimensions do not. No variety over a finite field is assumed to lie in such a family; when none is supplied, WC.3 still applies.
- `equivariant-polynomial-point-counts`: for a smooth proper scheme over Spec ℤ with a finite group G and polynomial point count, the polynomial A(T) of rational Betti representations of the complex fibre has character #X^σ(F_q) at σ (Bergström–Faber–Payne Proposition 9.3). It uses the all-Spec ℤ Tate theorem of WC.5, which comes later in the layer order (see "Dependencies").

### Betti comparison in a supplied family

`WC.4/betti-comparison-in-a-supplied-family` · theorem · planet “Betti comparison in families” · WC.0 part · declaration `TauCeti.PointCounting.betti_comparison_supplied_family`

Let f:X→S be smooth proper with connected base S, ℓ invertible on S, a specified geometric finite-field fibre X_s̄ and a specified complex geometric fibre X_t̄, together with an étale transport path γ:s̄→t̄. Compose the supplied rational ℓ-adic fibre transport and Artin comparison to identify H^i_et(X_s̄,Q_ℓ) with H^i_sing(X_t(C),Q)⊗Q Q_ℓ. The isomorphism depends on γ, but dimensions and Betti numbers do not. The composition is compatible with cup products, Tate twists and finite group actions on the family. No assertion says an arbitrary finite-field variety has such a family or complex fibre.

**Proof.**

1. Verify the hypotheses of EtaleBaseChange Layers 7–8 on the supplied family and lift its finite-coefficient transports through EllAdicRealization to rational coefficients.
2. At the specified complex fibre use ComplexComparison Layers 10–12 and EllAdicRealization Layer 10 to pass from finite to rational singular coefficients.
3. Compose the path-aware maps and use their identity/concatenation laws. Different paths differ by monodromy automorphisms and give the same finite dimension.
4. Outside the smooth-proper case use only a supplied lisse stratum and the compact-support comparison appropriate to it; do not extend the numerical theorem across a jumping stratum.

**Acceptance.**

- For a supplied Pⁿ family, b_(2i)=1, b_odd=0 in both fibres.
- Changing γ can change a vector identification but cannot change its dimension.
- If no complex fibre is supplied this theorem cannot be applied; WC.3 still applies.

**Depends on.** this roadmap: `WC.0/geometric-frobenius-realization-comparison`.

**Used here by.** `WC.4/equivariant-polynomial-point-counts`, `WC.5/complete-intersection-point-count`, `WC.5/local-polynomial-count-cutoff`, `WC.5/approximate-counts-and-tate-semisimplification`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC4`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `milne-lec`, 27.14(e), p.159, with §20.5 and §25.1: “and if X0 lifts to a variety X1 in characteristic zero, then the βr are the Betti numbers of X1 considered as a variety over the complex numbers.” — Comparison only through an actual family.
- `pr196`, EtaleBaseChange Layers 7–8; ComplexComparison Layers 10–12; EllAdicRealization Layer 10: “After choosing an étale path \(\gamma:\bar s_0\leadsto\bar s_1\), construct the transport isomorphism” — Transport and Artin equivalences are supplied, not reconstructed.

**Assembly note.** This node answers the WC.6 part’s request to WC.4, which `WC.7/geometric-weil-assembly` cites as the stage `WC.4`.

### Equivariant polynomial point counts

`WC.4/equivariant-polynomial-point-counts` · theorem · planet “Equivariant polynomial point counts” · WC.0 part · declaration `TauCeti.PointCounting.equivariant_polynomial_point_counts`

Let X be a smooth proper finite-type scheme over Spec Z with a finite group G acting over Z, and suppose its weighted/scalar point counts are polynomial for every finite field. For the complex fibre put A(T)=Σ_i[H^(2i)_sing(X(C),Q)]T^i∈R_Q(G)[T], using the existing representation ring and the actual rational Betti representations. Odd cohomology vanishes; for every q and σ∈G, the character of A(q) at σ is #X^σ(F_q). Coefficients are actual representation classes, hence their complex irreducible multiplicities are nonnegative integers. For rational irreducibles retain Schur indices: dimensions or character inner products over C are not automatically rational-irrep multiplicities. The smooth proper DM version has the same conclusion only after importing the stack comparison/purity/duality contracts recorded in the gap ledger.

**Proof.**

1. Apply the all-Spec-Z polynomial-count/Tate theorem in WC.5, including its full isomorphism conclusion rather than only semisimplification.
2. Use the supplied-family comparison for Spec Z[1/ℓ] and the finite-group-compatible rational Artin theorem to identify the G-action with the actual rational Betti representation.
3. Geometric Frobenius acts by q^i on even Tate cohomology; the twist trace gives Σ_i q^i Tr(σ|H^(2i)_Betti). Construct the polynomial with existing representation-ring classes.
4. Finite-group semisimplicity over Q and extension to C explain multiplicities. For the DM version substitute actual stack carriers and comparison theorems, not scheme carriers.

**Acceptance.**

- For P¹ with trivial G, A(T)=1+T.
- For a G-set of rational components, the degree-zero coefficient is the actual permutation representation.
- The nonsplit quadric’s involution sign on its middle classes reproduces 1+q², while the split form has 1+2q+q².

**Depends on.** this roadmap: `WC.4/betti-comparison-in-a-supplied-family`, `WC.5/polynomial-counts-over-z-and-tate-cohomology`, `WC.1/twisted-frobenius-point-comparison`; libraries: `tauceti:TauCeti.repRing`, `tauceti:TauCeti.repRingCharacter`.

**Used here by.** `WC.2/equivariant-polynomial-duality`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC4`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, Proposition 9.3 and proof, p.22: “Moreover, if we write P_V = Σ_i P_{V,i} t^i then P_{V,i} is the multiplicity of V in H^{2i}(X_C, Q).” — Equivariant arithmetic consequence of polynomial count and comparison.

**Assembly note.** This node depends on `WC.5/polynomial-counts-over-z-and-tate-cohomology`, a later layer, and is used by `WC.2/equivariant-polynomial-duality`, an earlier one. Structural proposal 8 moves it into WC.5.

## WC.5 — Point-count bounds and curves

*Coverage in `WeilConjectures--WC.0.json`: planned, 9 nodes.* Every stated target and key definition/theorem has a declaration-level plan. Closure awaits the exact recorded owner inputs: DM stack Part II carriers and trace/purity/comparison, Elliptic scheme/Point carrier comparison, EtaleDualityAndPerverseSheaves:EDC.2:pairings, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1, EtaleDualityAndPerverseSheaves:EDC.4, ArithmeticGaloisRepresentations:R01.5, PadicHodgeTheory:R06.2, tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences. Blueprint completeness is not implementation or geometric closure.

- **The bound and its variants.** `all-extension-point-count-bound` is |N_r − (1 + q^{dr})| ≤ Σ_{i=1}^{2d−1} b_i q^{ir/2} for smooth projective geometrically connected X of dimension d ≥ 1 and every r ≥ 1, from the canonical factors of WC.3; for a curve the constant is b_1 = 2g, not 2b_1. `components-and-dimension-zero` handles geometric components permuted by Frobenius (endpoint c_r(1 + q^{dr})) and dimension zero (N_r = c_r). `curve-and-elliptic-bound-comparison` identifies the estimate with the independent curve bound of DWP.1 and, for a nonsingular Weierstrass curve, with Tau Ceti's `WeierstrassCurve.pointCount` and `frobeniusTrace` and the Hasse bound of EllipticCurves Layer 3; it proves nothing about elliptic curves again.
- **Recurrences.** `extension-count-recurrence` states Newton's identities and the linear recurrence of the moments S_{i,n} = Tr(F_i^n) attached to each canonical factor, with N_0 = χ as the algebraic continuation of the counts.
- **Complete intersections.** `complete-intersection-point-count` is Deligne's Theorem (8.1) for every extension: |#X(k_r) − #Pⁿ(k_r)| ≤ b·q^{nr/2}, with b the primitive middle Betti number (b′ or b′ − 1), from EDC.4's weak Lefschetz and a supplied comparison family.
- **Polynomial point counts.** `polynomial-point-count` is the predicate (a definition with API and tests): N(q) = P(q) for every prime power q, with a unique witness. `local-polynomial-count-cutoff` (Bergström–Faber–Payne 3.1 with the cutoff s, source issue E-WC0-4) kills odd cohomology above s and forces the even eigenvalues there to be p^j. `approximate-counts-and-tate-semisimplification` (van den Bogaart–Edixhoven 2.1) gives, over an open U ⊂ Spec ℤ, a unique palindromic exact count C and Tate semisimplified cohomology, through R01.5's Chebotarev and Brauer–Nesbitt recognition. `polynomial-counts-over-z-and-tate-cohomology` gives over all of Spec ℤ the full isomorphism H^{2j} ≅ Q_ℓ(−j)^{C_j}, using R06.2's local lemma and the triviality of everywhere-unramified extensions of ℚ.

The layer imports the curve bound and the Hasse bound as compatibility cases and the finite-spectrum lemma from its child, as RS-17 requires; it owns the higher-dimensional inequalities and the recurrence normalisation.

### All-extension Weil bound

`WC.5/all-extension-point-count-bound` · theorem · planet “All-extension Weil bound” · WC.0 part · declaration `TauCeti.PointCounting.all_extension_point_count_bound`

For smooth projective geometrically connected X/k of dimension d≥1, for every r≥1, |N_r−(1+q^(dr))|≤Σ_(i=1)^(2d−1) b_i q^(ir/2). The b_i are the canonical degree-factor degrees from WC.3. The constant is their explicit weighted sum, not 2b_1 in the curve case. Every extension is included.

**Proof.**

1. Use the actual trace formula, H⁰ eigenvalue 1 and H^(2d) eigenvalue q^d from the geometric pairing and connectedness.
2. Apply the imported all-conjugates projective purity through the canonical integral factors, after choosing a common complex splitting field.
3. For each degree use norm of a power and the finite-sum triangle inequality. No diagonalization is needed because trace uses algebraic multiplicities.

**Acceptance.**

- For P² the error is q^r and the bound is exactly b₂q^r=q^r.
- The theorem excludes d=0; subtracting two endpoint terms there would double-count H⁰.
- For a curve the right side is b₁q^(r/2)=2gq^(r/2).

**Depends on.** this roadmap: `WC.3/integral-factors-and-ell-independence-from-purity`, `WC.1/cohomological-formula-from-the-trace-formula`; stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`; libraries: `mathlib:norm_sum_le`.

**Used here by.** `WC.5/components-and-dimension-zero`, `WC.5/curve-and-elliptic-bound-comparison`, `WC.5/complete-intersection-point-count`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: signature (The finite complex spectral inequality, with the endpoint term separated, is prototyped; the actual geometric application is omitted).

**Sources.**

- `deligne-i`, Lemme (1.7), p.276; Théorème (8.1) and proof, pp.301–302: “les valeurs propres de l'endomorphisme F* de H^i(X, Q_ℓ) sont des nombres algébriques dont tous les conjugués complexes α sont de valeur absolue |α| = q^{i/2}.” — Point-count consequence of degreewise purity.

### Component permutations and dimension zero

`WC.5/components-and-dimension-zero` · theorem · WC.0 part · declaration `TauCeti.PointCounting.component_and_dimension_zero_counts`

For smooth projective pure-d X/k with d≥1 and geometric connected components permuted by σ, let c_r be the number fixed by σ^r. The endpoint trace is c_r(1+q^(dr)); the same interior Betti sum bounds |N_r−c_r(1+q^(dr))|. For d=0, X is finite étale and N_r=c_r exactly; Z_X=∏_(cycles of σ)(1−T^length)⁻¹. A single geometric point has N_r=1, while a degree-m closed point has N_r=m when m|r and zero otherwise.

**Proof.**

1. Identify H⁰ with the permutation representation on geometric components and H^(2d) with its Tate-twisted dual. Both powered permutation traces equal c_r.
2. Subtract these actual endpoint traces for d≥1 and use the interior degreewise root bound.
3. For d=0 there is only H⁰, so use its single trace and the finite étale Euler product rather than subtracting both endpoints.

**Acceptance.**

- A degree-two finite étale point has counts 0,2,0,2,… .
- Two rational projective lines have endpoint 2(1+q^r).
- Two lines interchanged by Frobenius contribute endpoint 0 for odd r and 2(1+q^r) for even r.

**Depends on.** this roadmap: `WC.5/all-extension-point-count-bound`, `WC.0/closed-point-degree-comparison`; stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, (1.4)–(1.5), pp.274–275; (2.5), p.281: “(2.5) Supposons pour simplifier X connexe.” — Deligne simplifies to connected X; the node keeps the Frobenius permutation of geometric components and separates dimension zero.

**Assembly note.** Its dimension-zero half is restated by `WC.7/finite-etale-permutation-factors`; structural proposal 7 makes that node cite this one.

### Curve and elliptic compatibility

`WC.5/curve-and-elliptic-bound-comparison` · theorem · WC.0 part · declaration `TauCeti.PointCounting.curve_elliptic_bound_comparison`

For a smooth projective geometrically connected genus-g curve, identify the WC all-extension estimate with the independent DWP.1 Jacobian/Rosati estimate using the actual H¹/Jacobian cohomology comparison b₁=2g. For a nonsingular Weierstrass elliptic curve over k, identify its scheme count with the existing WeierstrassCurve.pointCount and Point carrier, and its a_q=q+1−N₁ with the existing frobeniusTrace. The inequality |a_q|≤2√q agrees with the independent EllipticCurves Layer 3 Hasse theorem. Its degree-r counterpart uses the same finite-extension count; agreement is a compatibility theorem, not another elliptic or Jacobian proof.

**Proof.**

1. Apply the explicit DWP.1 curve-count and cohomology interfaces, retaining the genus and cohomological-degree identification.
2. Use the nonsingular projective Weierstrass model/Point comparison supplied by the elliptic geometric owner; apply the pinned pointCount_eq_card_point and trace definition.
3. Translate the independent elliptic inequality and recurrence through this equality of point carriers, not through an abstract integer named N.

**Acceptance.**

- For g=0 the error is 0.
- For g=1, Π₁=1−a_qT+qT² and S₂=a_q²−2q.
- A singular Weierstrass cubic is excluded from the elliptic Point comparison.
- A coherent genus comparison alone is insufficient to establish b₁=2g.

**Depends on.** this roadmap: `WC.5/all-extension-point-count-bound`; other roadmaps: `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-curves`, `DeligneWeightsAndPurity:DWP.1/weights-of-the-cohomology-of-curves`; stages: `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`; libraries: `tauceti:WeierstrassCurve.pointCount`, `tauceti:WeierstrassCurve.pointCount_eq_card_point`, `tauceti:WeierstrassCurve.frobeniusTrace`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `milne-lec`, Theorem 27.15, p.159, specialized to curves: “Let X0 be a nonsingular projective variety over Fq. Then the eigenvalues of F acting on H^r(X, Qℓ) are algebraic numbers, all of whose complex conjugates have absolute value q^{r/2}” — Compatibility application of already-owned curve and elliptic estimates.
- `mustata-zeta`, Example 3.10, pp.22–23: “Consider the case when X is an elliptic curve (that is, g = 1).” — Curve numerator and elliptic trace convention.

**Assembly note.** The Weierstrass-equation-to-scheme bridge this node needs (the gap “Elliptic scheme/Point carrier comparison”) is also needed by `WC.7/elliptic-curve-over-f5`, which requests it from SF.2. One bridge serves both.

### Recurrences from canonical Weil factors

`WC.5/extension-count-recurrence` · theorem · planet “Weil-factor recurrence” · WC.0 part · declaration `TauCeti.PointCounting.extension_count_recurrence`

For canonical Π_i(T)=1+c_(i,1)T+…+c_(i,b_i)T^(b_i), put S_(i,n)=Tr(F_i^n) with S_(i,0)=b_i. For n≥b_i, S_(i,n)+Σ_(j=1)^(b_i)c_(i,j)S_(i,n−j)=0; for 1≤n≤b_i, Newton’s identity is S_(i,n)+Σ_(j=1)^(n−1)c_(i,j)S_(i,n−j)+n c_(i,n)=0. In characteristic zero the first b_i moments recover Π_i. For curves S_n=1+q^n−N_n, S₀=2g. In all dimensions Q_tot=∏_i Π_i is an annihilating recurrence polynomial for the positive point counts, with the algebraic continuation N₀=χ, not a count over F₁. Its order is Σ_i b_i, and cancellations can lower the minimal recurrence order.

**Proof.**

1. Apply the upstream DWP.0 determinant/power-trace/Newton theorem to the canonical factors, using their reverse characteristic-polynomial convention.
2. For each reciprocal root α, the recurrence follows by multiplying its monic reciprocal polynomial by α^(n−b_i) and summing with multiplicity; zero-root and empty-family boundary cases remain legitimate.
3. The characteristic-zero Newton formulas recover each coefficient successively from the moments. Translate to curve extension counts through the root-bound-free curve comparison.
4. Each root moment is annihilated by Q_tot; sum with the cohomological signs. N₀ must be χ to preserve this algebraic sequence.

**Acceptance.**

- An elliptic curve has S_n=a_qS_(n−1)−qS_(n−2), S₀=2, S₁=a_q.
- Π₁ is 1−aT+qT²; charpoly(F) is X²−aX+q.
- A repeated root may give minimal recurrence order smaller than b_i; multiplicities still determine Π_i.
- For an empty spectrum b=0, every S_n is 0.

**Depends on.** this roadmap: `WC.3/integral-factors-and-ell-independence-from-purity`, `WC.1/curve-zeta-numerator-without-rh`; other roadmaps: `DeligneWeightsAndPurity:DWP.0/characteristic-power-series-and-traces`; libraries: `mathlib:Matrix.reverse_charpoly`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: signature (Exact finite-spectrum polynomial recurrence and Newton identities; no fake finite-field degree-zero count).

**Sources.**

- `milne-lec`, Lemma 27.5 p.155 and Theorem 27.6, p.156: “If Pφ(t) = Π(1 − ci t), then Tr(φ^m|V) = Σ ci^m.” — Characteristic-power series and extension traces; new export is the canonical count recurrence.
- `deligne-i`, (1.5.3), pp.275–276; (1.15), p.279: “le vérifier pour dim(V)=1, et observer que les deux membres sont additifs en V dans une suite exacte courte” — Trace/determinant conversion applied to canonical factors.

**Assembly note.** With `WC.1/cohomological-formula-from-the-trace-formula` for the all-power trace identity and the weight-separated reduced presentation of `WC.3/degreewise-pure-factor-extraction` for pole orders, this node answers the WC.6 part’s request to WC.5, which seven WC.7 nodes cite as the stage `WC.5`. Its identities are algebra on the factors, so they apply to the smooth proper factors of WC.6 as well as to the projective factors of WC.3 that the node cites.

### Complete-intersection Weil estimate

`WC.5/complete-intersection-point-count` · theorem · planet “Complete-intersection Weil estimate” · WC.0 part · declaration `TauCeti.PointCounting.complete_intersection_point_count`

Let X/k be a smooth projective geometrically connected complete intersection of dimension n≥1 and fixed multidegree. Let b′ be the middle Betti number of a smooth complex complete intersection with that same dimension and multidegree, supplied through the complete-intersection cohomology comparison; put b=b′ for n odd and b=b′−1 for n even. For every r≥1, |#X(k_r)−#Pⁿ(k_r)|≤b q^(nr/2). Equivalently only the middle primitive cohomology contributes to the error, with sign (−1)^n and exactly b reciprocal roots. The complex comparison is part of the geometric supplier, not an arbitrary lift assumption.

**Proof.**

1. Import the repeated ample weak-Lefschetz/projective-space complete-intersection decomposition with its Frobenius/Tate maps from EDC.4. The middle primitive dimension is determined by the same multidegree and the supplied comparison family.
2. Use WC.4 for the actual supplied finite-field/complex family or the EDC.4 complete-intersection comparison contract; exclude an unsupported appeal to arbitrary liftability.
3. Cancel the ambient Pⁿ Tate traces in the actual point-count formula and apply projective purity only to the b primitive middle roots.
4. Replace F_q by F_q^r to obtain every extension rather than only the printed r=1 case.

**Acceptance.**

- A projective linear subspace has b=0 and identical counts to Pⁿ.
- A smooth plane genus-g curve gives b=2g.
- For even n subtract the ambient middle Tate class once; using b′ would lose the sharp constant.

**Depends on.** this roadmap: `WC.5/all-extension-point-count-bound`, `WC.4/betti-comparison-in-a-supplied-family`; stages: `EtaleDualityAndPerverseSheaves:EDC.4`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `deligne-i`, Théorème (8.1) and proof, pp.301–302: “Soit b′ le n-ième nombre de Betti des intersections complètes non singulières complexes, de mêmes dimension et multidegré. Posons b = b′ pour n impair, et b = b′ − 1 pour n pair.” — Requested worked corollary with precise primitive Betti constant.

### Polynomial point count

`WC.5/polynomial-point-count` · definition · planet “Polynomial point count” · WC.0 part · declaration `TauCeti.PointCounting.HasPolynomialPointCount`

For an isomorphism-invariant finite-field count function N:Nat→Q and P∈Q[T], HasPolynomialPointCount(N,P) means N(q)=P(q) for every positive prime power q. The count function is obtained from actual finite-field point sets or finite-mass groupoids by the WC.0/1 comparisons; values at 0,1 or non-prime-powers are immaterial. A polynomial count is exact on every finite field, not only prime fields, a single field, or an asymptotic sequence. The witness polynomial is unique.

**Construction.**

1. Use the existing IsPrimePow predicate and polynomial evaluation; no new finite-field carrier is introduced.
2. Derive addition and multiplication pointwise and compare exact counts through the geometric sum/product interfaces.
3. For uniqueness use agreement at the infinitely many rational integers 2^n, n≥1, and the existing polynomial root theorem over Q.

**API.**

- `TauCeti.PointCounting.HasPolynomialPointCount_eval` (simp): If HasPolynomialPointCount(N,P) and q is a prime power, N(q)=P(q).
- `TauCeti.PointCounting.HasPolynomialPointCount_unique` (extensionality): Two polynomial witnesses for the same N are equal.
- `TauCeti.PointCounting.HasPolynomialPointCount_zero` (simp): The zero count has witness 0.
- `TauCeti.PointCounting.HasPolynomialPointCount_add` (compatibility): Witnesses P,Q for N,M give witness P+Q for N+M.
- `TauCeti.PointCounting.HasPolynomialPointCount_mul` (compatibility): Witnesses P,Q for N,M give witness P Q for the pointwise product.
- `TauCeti.PointCounting.HasPolynomialPointCount_congr` (characterisation): Two functions agreeing on prime powers have the same polynomial-count witnesses.

**Unit tests.**

- `TauCeti.PointCounting.polynomialPointCount_projective_line` (computation): N(q)=q+1 has witness T+1.
- `TauCeti.PointCounting.polynomialPointCount_empty` (degenerate): N(q)=0 has witness 0.
- `TauCeti.PointCounting.polynomialPointCount_multiplicative_group` (compatibility): N(q)=q−1 has witness T−1, which has a negative constant coefficient.
- `TauCeti.PointCounting.polynomialPointCount_prime_fields_insufficient` (non-example): Changing only the value at q=4 to 0 in N(q)=q+1 destroys the witness T+1 despite agreement at every prime.
- `TauCeti.PointCounting.polynomialPointCount_one_field_insufficient` (non-example): T and T+(T−2) agree at q=2 but cannot both witness the same count function.

**Acceptance.**

- No sign constraint on coefficients follows for nonproper varieties; G_m has polynomial T−1.

**Used by.**

- vdBE Theorem 2.1 and BFP Proposition 3.1: Supplies exact or approximate count hypotheses for Tate/vanishing consequences.
- BFP Proposition 9.3 and Remark 9.4: Produces representation-valued polynomial counts and duality.
- MotivicStructuresInModuliOfCurves: Consumes certified global polynomial witnesses for moduli counts, without placing the moduli enumeration in this packet.

**Depends on.** libraries: `mathlib:IsPrimePow`, `mathlib:Polynomial.eq_of_infinite_eval_eq`.

**Used here by.** `WC.5/polynomial-counts-over-z-and-tate-cohomology`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: signature (Genuine arithmetic predicate with its full body: all existing IsPrimePow indices, rational Polynomial evaluation).

**Sources.**

- `bfp`, §1, p.2 (polynomial point count property); Proposition 9.3, p.22: “We will be especially interested in stacks with the polynomial point count property, i.e., the property that #X(Fq) is a polynomial in q.” — The exact arithmetic predicate used by the cited cohomology consequences.
- `vdbe`, Theorem 2.1, hypothesis (∗), p.3: “there exists a polynomial P(t) = Σ_{i≥0} Pi t^i, with Pi ∈ Q, such that #X(F_{p^n}) = P(p^n) + o(p^{nd/2}) (n → ∞) for all p ∈ S.” — Distinguish exact polynomial count from its weaker approximate hypothesis.

### Polynomial approximation and odd vanishing

`WC.5/local-polynomial-count-cutoff` · theorem · planet “Polynomial-count vanishing criterion” · WC.0 part · declaration `TauCeti.PointCounting.local_polynomial_count_cutoff`

Let X be a smooth proper pure-d scheme or DM stack over Z_p, s≥d an integer, and choose the geometric/coefficient/comparison data needed to identify its generic rational Betti spaces, with ℓ≠p. Suppose P∈Q[T] and #X(F_(p^n))−P(p^n)=o(p^(sn/2)) for n→∞, using mass for stacks. Then H^k=0 for every odd k≥s. For every j with s≤2j≤2d, P_j=dim H^(2j), every reciprocal Frobenius root there is p^j, and no Frobenius semisimplicity is asserted. The source’s proof must use s in the error exponent. The DM case requires its actual trace, purity and coarse/comparison supplier.

**Proof.**

1. Apply proper smooth base change to the generic/special fibres and the chosen complex comparison; do not declare an arbitrary complex fibre without an embedding/family.
2. Use proper-smooth purity (DWP.7 for schemes; the documented DM/coarse-space/alteration contract for stacks) and the actual trace formula.
3. Apply the independent graded polynomial-approximation lemma with degree range 0..2d and cutoff s. If s>2d, all claimed cohomological ranges are empty.
4. Translate multiplicities to dimensions through the actual finite cohomology comparison. Eigenvalue equality does not remove Jordan blocks.

**Acceptance.**

- The stronger cutoff s>d leaves low odd degrees unconstrained until a duality argument is separately applied.
- A −p eigenvalue at degree 2 fails little-o(p^n).
- Replacing little-o by O at the boundary would permit visible roots and is rejected.

**Depends on.** this roadmap: `WC.5:power-sum-converse/graded-polynomial-approximation-lemma`, `WC.4/betti-comparison-in-a-supplied-family`, `WC.1/stack-count-comparison`; other roadmaps: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`.

**Used here by.** `WC.5/approximate-counts-and-tate-semisimplification`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `bfp`, Proposition 3.1, statement and proof, p.6 (published p.1330): “Fix an integer s ≥ d and assume there is a polynomial P(t) = Σ_i Pi t^i with rational coefficients such that #X(F_{p^m}) = P(p^m) + o(p^{ms/2}) as m → ∞.” — Exact cutoff s≥d; the imported extraction already confirmed its d→s misprint.
- `vdbe`, §4, Lemma 4.1, p.6: “Let us be given the following integers: d ≥ 0, d ≤ r ≤ 2d, and for 0 ≤ i ≤ r also di ≥ 0.” — Numerical core of the argument.

### Approximate counts and Tate semisimplification

`WC.5/approximate-counts-and-tate-semisimplification` · theorem · WC.0 part · declaration `TauCeti.PointCounting.approximate_counts_tate_semisimplification`

Let U⊂Spec Z be a nonempty open, X/U smooth proper pure-d of finite type (scheme, or DM stack with the documented stack inputs), and S⊂primes(U) have density 1. Suppose P∈Q[T] and, for each p∈S, #X(F_(p^n))=P(p^n)+o(p^(nd/2)) as n→∞. There is a unique palindromic C∈Z[T], C_j=C_(d−j), with nonnegative coefficients, deg C≤d, and C_j=P_j for 2j≥d; for every p∈U and n≥1 the exact count is C(p^n). For every ℓ, H^odd(X_Q̄,Q_ℓ)=0 and H^(2j)(X_Q̄,Q_ℓ)^ss≅Q_ℓ(−j)^(C_j) as continuous G_Q-representations, restricted to the good-reduction open. If the generic fibre is nonempty then deg C=d; for an empty family C=0. The input P need not equal C in degrees below d/2.

**Proof.**

1. At each p∈S apply the graded moment lemma at cutoff d using the actual purity/trace theorem and constant fibre dimensions. This kills odd high degrees and identifies even high coefficients and eigenvalues.
2. Apply Frobenius-equivariant Poincaré duality to obtain low-degree vanishing and scalar eigenvalues, and complete the polynomial by C_j=C_(d−j). Comparison fixes dimensions across the supplied connected family.
3. At the density-one good primes, characteristic polynomials agree with the corresponding Tate sum. Apply Chebotarev and characteristic-zero Brauer–Nesbitt recognition from R01.5; only semisimplifications are concluded.
4. Trace is unchanged under semisimplification, so the actual trace formula gives exact counts for every good finite field. The infinitely many values prove uniqueness of C; dimensions make its coefficients nonnegative integers.

**Acceptance.**

- For P², P(T)=T²+T approximates counts with error 1=o(p^n), but the exact palindromic polynomial is C(T)=T²+T+1.
- An empty family has C=0, so claiming degree exactly d without nonemptiness is rejected.
- Density-one trace agreement cannot by itself prove that extensions of identical Tate constituents split.

**Depends on.** this roadmap: `WC.5/local-polynomial-count-cutoff`, `WC.4/betti-comparison-in-a-supplied-family`, `WC.2/signed-zeta-functional-equation`; stages: `ArithmeticGaloisRepresentations:R01.5`; libraries: `mathlib:Polynomial.eq_of_infinite_eval_eq`.

**Used here by.** `WC.5/polynomial-counts-over-z-and-tate-cohomology`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `vdbe`, Theorem 2.1, p.3, and §4 proof, pp.6–9: “Here H^i(X_{Q̄,ét}, Q_l)^ss denotes the semi-simplification of H^i(X_{Q̄,ét}, Q_l).” — The v3 open-U statement gives semisimplification; the corrected input-polynomial interpretation preserves its exact conclusion.

### Polynomial counts and full Tate cohomology

`WC.5/polynomial-counts-over-z-and-tate-cohomology` · theorem · planet “Polynomial counts and Tate cohomology” · WC.0 part · declaration `TauCeti.PointCounting.polynomial_counts_over_z_tate_cohomology`

For a smooth proper pure-d finite-type scheme X over all Spec Z (or DM stack with the documented extra inputs), exact polynomial point count over every finite field is equivalent to the existence of nonnegative integers C_j such that, for every ℓ, H^odd(X_Q̄,Q_ℓ)=0 and H^(2j)(X_Q̄,Q_ℓ)≅Q_ℓ(−j)^(C_j) as actual continuous G_Q-representations. The unique count polynomial is Σ_j C_j T^j and is palindromic. The full isomorphism conclusion uses all Spec Z, local potential semistability at the coefficient prime and global absence of everywhere-unramified nontrivial finite extensions of Q; it is stronger than the open-U semisimplification conclusion.

**Proof.**

1. Apply the approximate-count theorem with zero error and U=Spec Z to obtain the Tate semisimplification in each degree.
2. Twist H^(2j) by j, so its Jordan–Hölder constituents are trivial. At primes different from ℓ it is unramified by smooth proper base change. At ℓ apply good-reduction crystalline comparison for schemes; the DM route uses the supplier’s potential semistability theorem.
3. Import the local trivial-extension theorem from p-adic Hodge theory: a potentially semistable extension of trivial representations is unramified. Its filtered (φ,N) proof has Fil⁰=D, Fil¹=0 and N=0, and accounts for the unramified extension class; do not assume Frobenius is semisimple.
4. The resulting representation is unramified at every finite prime. Every finite quotient factors through an everywhere-unramified number-field extension. The global discriminant comparison plus the pinned Hermite–Minkowski inequality makes such extensions trivial; continuity then makes the entire representation trivial. This yields the actual Tate isomorphism.
5. Conversely, apply the actual trace formula at each finite-field prime using a different coefficient prime; the Tate traces give the polynomial, and equivariant duality gives palindromicity.

**Acceptance.**

- Pⁿ over Z has actual even Tate cohomology and count 1+q+…+qⁿ.
- For a single Jordan block, scalar eigenvalues and trace moments alone do not establish this conclusion; the local/global proof is indispensable.
- Removing primes from the base retains the stated semisimplification theorem and loses the all-primes argument.

**Depends on.** this roadmap: `WC.5/polynomial-point-count`, `WC.5/approximate-counts-and-tate-semisimplification`; other roadmaps: `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`; stages: `PadicHodgeTheory:R06.2`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences`; libraries: `mathlib:NumberField.abs_discr_gt_two`.

**Used here by.** `WC.4/equivariant-polynomial-point-counts`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `vdbe`, Theorem 2.1 last clause, p.3; §4, Lemma 4.2 and the end of the proof, pp.8–10: “If U = Spec Z, then H^i(X_{Q̄,ét}, Q_l)^ss ≃ H^i(X_{Q̄,ét}, Q_l).” — The all-Spec-Z full Tate conclusion and its local/global splitting inputs.
- `bfp`, §3, p.6; Proposition 9.3, p.22: “Suppose X is smooth and proper over Z and has polynomial point count.” — The global cohomology consequence needed for equivariant counts.

## WC.5:power-sum-converse — Independent finite-spectrum lemma

*Coverage in `WeilConjectures--WC.0.json`: closed, 16 nodes.* All sixteen finite-spectrum key theorem plans terminate in internal nodes and checked baseline declarations; no geometric or purity input.

This child is purely numerical and closed: every chain ends in this layer or in Mathlib. It keeps the fourteen node ids of its first checkpoint and adds two lemmas.

- **From moments to roots.** `recover-consecutive-moments` recovers each weighted exponential c_k β_k^n from d consecutive moments through the inverse Vandermonde matrix (rows are roots, columns exponents). `consecutive-moment-bound` turns a bound C·R^m on the moments from some point on into a bound on ‖c_k‖·‖β_k‖^n. `distinct-spectrum-bound` concludes ‖β_k‖ ≤ R for every visible root, over any normed field. `grouped-spectrum-bound` groups coincident roots first, so that only the total weight of a root matters, and `power-sum-converse` is the unweighted case in characteristic zero, where multiplicities cannot vanish. `power-sum-bound-iff` is the equivalence with C = d in the easy direction.
- **The nonarchimedean case.** `reciprocal-moments-escape-unit-ball` is Yu's lemma, strengthened to arbitrary nonzero coefficients: for distinct γ_i with 0 < ‖γ_i‖ < 1 some negative-power sum leaves the unit ball, at arbitrarily large exponents.
- **The generating function.** `power-sum-generating-series` sums Σ_n S_{n+1} z^{n+1} to Σ_i c_i β_i z/(1 − β_i z) where ‖β_i z‖ < 1; `generating-numerator-denominator` writes it as N/D with D(0) = 1; `formal-power-sum-product` proves D·G = N over any commutative ring; `formal-rational-comparison` identifies G with N/D in Mathlib's Laurent series; `pole-cancellation-criterion` shows that N vanishes at β_k^{−1} exactly when c_k = 0; `no-pole-in-bounded-disc` excludes poles in the disc of radius 1/R. This is the argument of Mustață's (3.11)–(3.12), in weighted and grouped form.
- **Equality and little-o.** `reciprocal-pairing-forces-equality`: an upper bound R together with a pairing α_i α_{τ(i)} = R² forces ‖α_i‖ = R (Mustață's Remark 3.7). `little-o-visible-root-vanishing` is the strict version for o(R^n), and `graded-polynomial-approximation-lemma` is van den Bogaart–Edixhoven's Lemma 4.1 with an arbitrary cutoff s, which WC.5 uses for polynomial counts.

The test cases are the ones that defeat plausible wrong statements: the roots 2 and −2, whose first moment vanishes; four roots of unity with three vanishing moments; p equal roots in characteristic p, whose moments vanish; and two occurrences of one root with weights 1 and −1.

### Recover one weighted exponential from consecutive moments

`WC.5:power-sum-converse/recover-consecutive-moments` · lemma · WC.0 part · declaration `TauCeti.FiniteSpectrum.recover_consecutive_moments`

Let K be a field, d a natural number, and β: Fin d → K injective. Put V_ij=β_i^j, with rows indexed by roots and columns by exponents, and A=V⁻¹, the existing nonsingular inverse. For c: Fin d → K, n≥0 and k in Fin d, c_k β_k^n = Σ_{j<d} A_jk (Σ_{i<d} c_i β_i^(n+j)).

**Hypotheses.**

- No completeness, norm, nonzero-root or characteristic-zero hypothesis. The empty family has no k.

**Proof.**

1. The determinant criterion makes det V nonzero and hence a unit in K. Apply the existing V V⁻¹=I theorem.
2. Expand the right side and commute the two finite sums. Use β_i^(n+j)=β_i^n β_i^j. The inner sum Σ_j β_i^j A_jk is the (i,k) entry of V A, hence the Kronecker delta.
3. The formula includes β_i=0 and n=0 with the usual zeroth-power convention.

**Acceptance.**

- For d=1 the inverse matrix is [1], so the identity is tautological.
- For β=(2,−2), the k=0 formula is c_0 2^n = S_n/2 + S_(n+1)/4; transposing the inverse would give a wrong formula.
- For β=(0,1) test n=0 and n=1 separately.

**Depends on.** libraries: `mathlib:Matrix.vandermonde`, `mathlib:Matrix.det_vandermonde_ne_zero_iff`, `mathlib:Matrix.mul_nonsing_inv`.

**Used here by.** `WC.5:power-sum-converse/consecutive-moment-bound`, `WC.5:power-sum-converse/distinct-spectrum-bound`, `WC.5:power-sum-converse/little-o-visible-root-vanishing`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `mathlib-vandermonde-pin`, Vandermonde.lean: det_vandermonde_ne_zero_iff; NonsingularInverse.lean: mul_nonsing_inv: “theorem det_vandermonde_ne_zero_iff [IsDomain R] {v : Fin n → R} : det (vandermonde v) ≠ 0 ↔ Function.Injective v” — The pinned algebraic input. This node applies the existing inverse to consecutive moments; it does not rebuild the Vandermonde theorem.

### A quantitative bound from a moment window

`WC.5:power-sum-converse/consecutive-moment-bound` · lemma · WC.0 part · declaration `TauCeti.FiniteSpectrum.consecutive_moment_bound`

Let K be a normed field, β: Fin d → K injective, c: Fin d → K, C,R≥0, and N,n natural with N≤n. Suppose ‖Σ_i c_i β_i^m‖≤C R^m for every m≥N. Then for each k, ‖c_k‖ ‖β_k‖^n ≤ C R^n Σ_{j<d} ‖(V⁻¹)_jk‖ R^j, where V_ij=β_i^j.

**Hypotheses.**

- The constant depends on the distinct roots and on R, not on n. R=0 is permitted; use positive n when drawing conclusions from that case.

**Proof.**

1. Apply recover-consecutive-moments and the finite-sum norm inequality. Each n+j is at least N, so each moment has the assumed bound.
2. Use multiplicativity of the field norm and R^(n+j)=R^n R^j. Extract the nonnegative common factors C R^n.

**Acceptance.**

- For β=(2,−2), the k=0 constant is 1/2+R/4 in the usual real norm.
- At R=0 and n≥1, the right side is zero.
- Allow c_k=0 without division.

**Depends on.** this roadmap: `WC.5:power-sum-converse/recover-consecutive-moments`; libraries: `mathlib:norm_sum_le`.

**Used here by.** `WC.5:power-sum-converse/distinct-spectrum-bound`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `mathlib-vandermonde-pin`, Vandermonde.lean: det_vandermonde_ne_zero_iff; NonsingularInverse.lean: mul_nonsing_inv: “theorem det_vandermonde_ne_zero_iff [IsDomain R] {v : Fin n → R} : det (vandermonde v) ≠ 0 ↔ Function.Injective v” — The pinned algebraic input. This node applies the existing inverse to consecutive moments; it does not rebuild the Vandermonde theorem.

### An eventual exponential bound controls each visible root

`WC.5:power-sum-converse/distinct-spectrum-bound` · theorem · planet “Finite-spectrum bound” · WC.0 part · declaration `TauCeti.FiniteSpectrum.norm_le_of_distinct_moment_bound`

Let K be a normed field, β: Fin d → K injective, c: Fin d → K, C,R≥0 and N≥0. If ‖Σ_i c_i β_i^n‖≤C R^n for every n≥N, then c_k≠0 implies ‖β_k‖≤R for every k.

**Hypotheses.**

- No characteristic-zero or completeness hypothesis. Distinct roots and a nonzero coefficient at the root in question are essential. The estimate may begin at any fixed N.

**Proof.**

1. For R>0, apply consecutive-moment-bound, divide by ‖c_k‖ R^n, and bound (‖β_k‖/R)^n by the fixed nonnegative real number C Σ_j ‖(V⁻¹)_jk‖ R^j / ‖c_k‖.
2. If ‖β_k‖>R, the real base is greater than one. Its powers exceed that number by pow_unbounded_of_one_lt; enlarge the exponent to be at least N, using monotonicity of powers of a base greater than one. This contradicts the bound.
3. For R=0 choose n=max(N,1). Every moment in the window is zero. Recovery gives c_k β_k^n=0, so β_k=0. Equivalently use the existing finite-moment uniqueness theorem on coefficients c_i β_i^n.

**Acceptance.**

- A zero coefficient gives no bound on its root.
- The weighted pair of distinct roots 2 and −2 may have S_1=0; S_2 detects growth.
- A zero-radius estimate forces every visible root to be zero, even when N>1.

**Depends on.** this roadmap: `WC.5:power-sum-converse/consecutive-moment-bound`, `WC.5:power-sum-converse/recover-consecutive-moments`; libraries: `mathlib:pow_unbounded_of_one_lt`, `mathlib:Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero`.

**Used here by.** `WC.5:power-sum-converse/grouped-spectrum-bound`, `WC.5:power-sum-converse/reciprocal-moments-escape-unit-ball`, `WC.5:power-sum-converse/no-pole-in-bounded-disc`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: “Soient γ1, . . . , γr ∈ Z̄p deux à deux distincts de valuation p-adique vp(γi) > 0, i = 1, . . . , r. Alors il existe k ∈ N∗, tel que Σ ci γi^(−k) ∉ Z̄p.” — Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

### Combine coincident roots before applying the bound

`WC.5:power-sum-converse/grouped-spectrum-bound` · theorem · WC.0 part · declaration `TauCeti.FiniteSpectrum.norm_le_of_grouped_moment_bound`

Let K be a normed field, α,w: Fin d → K, C,R≥0 and N≥0. Suppose ‖Σ_i w_i α_i^n‖≤C R^n for every n≥N. For any j such that Σ_{i:α_i=α_j} w_i is nonzero, one has ‖α_j‖≤R.

**Hypotheses.**

- Weights may have either sign or cancel. The nonzero hypothesis is on the total weight of the entire fibre, not an individual occurrence.

**Proof.**

1. Take the finite image B of α. For b in B put its coefficient equal to the sum of w_i over α_i=b. Expanding the finite double sum shows that these grouped coefficients have exactly the original moments at every exponent.
2. Enumerate B by Fin(card B), giving an injective root family, and apply distinct-spectrum-bound to the coefficient of α_j. The argument is invariant under the enumeration.

**Acceptance.**

- Two occurrences of 100 with weights 1 and −1 have zero aggregate coefficient and all moments vanish; no bound on 100 is inferred.
- Two occurrences of 2 with weights 1 and 1 contribute 2·2^n, not 2^n.
- Adding a zero-weight occurrence does not change the conclusion.

**Depends on.** this roadmap: `WC.5:power-sum-converse/distinct-spectrum-bound`.

**Used here by.** `WC.5:power-sum-converse/power-sum-converse`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: “Soient γ1, . . . , γr ∈ Z̄p deux à deux distincts de valuation p-adique vp(γi) > 0, i = 1, . . . , r. Alors il existe k ∈ N∗, tel que Σ ci γi^(−k) ∉ Z̄p.” — Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

### The unweighted power-sum converse in characteristic zero

`WC.5:power-sum-converse/power-sum-converse` · theorem · planet “Power-sum converse” · WC.0 part · declaration `TauCeti.FiniteSpectrum.norm_le_of_power_sum_bound`

Let K be a normed field of characteristic zero, α: Fin d → K, C,R≥0 and N≥0. If ‖Σ_i α_i^n‖≤C R^n for every n≥N, then ‖α_i‖≤R for every i. In particular this holds for every finite multiset of complex numbers, counting multiplicities, with bounds on all positive powers.

**Hypotheses.**

- Characteristic zero is used only to ensure that the positive multiplicity of each distinct root is nonzero in K. No distinctness or nonzero-root condition is imposed on α.

**Proof.**

1. Use grouped-spectrum-bound with every w_i=1. The coefficient at any root is the natural cardinal of a nonempty fibre; its image in K is nonzero by characteristic zero.
2. Represent a finite multiset by any finite enumeration. The sums and conclusion are invariant under a permutation, so no root-set replacement loses multiplicity.

**Acceptance.**

- The empty family is allowed.
- The pair (2,2) has multiplicity two.
- In characteristic p, p copies of the same nonzero root have zero moments: the characteristic-zero hypothesis cannot be dropped.

**Depends on.** this roadmap: `WC.5:power-sum-converse/grouped-spectrum-bound`.

**Used here by.** `WC.5:power-sum-converse/power-sum-bound-iff`, `WC.5:power-sum-converse/reciprocal-pairing-forces-equality`, `WC.5:surface-alternative/curve-rh-from-surface-bound`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: “Soient γ1, . . . , γr ∈ Z̄p deux à deux distincts de valuation p-adique vp(γi) > 0, i = 1, . . . , r. Alors il existe k ∈ N∗, tel que Σ ci γi^(−k) ∉ Z̄p.” — Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

### Root bounds are equivalent to all-power bounds

`WC.5:power-sum-converse/power-sum-bound-iff` · theorem · WC.0 part · declaration `TauCeti.FiniteSpectrum.power_sum_bound_iff`

For a characteristic-zero normed field K, a finite family α and R≥0, the following are equivalent: there exists C≥0 with ‖Σ_i α_i^n‖≤C R^n for every n≥1; every ‖α_i‖≤R. In the reverse direction the explicit choice C=d works.

**Hypotheses.**

- An all-positive-power bound is required, not a bound for one exponent or an arbitrary finite initial segment.

**Proof.**

1. The forward direction is power-sum-converse with N=1.
2. For the reverse direction use norm_sum_le, multiplicativity of the norm, monotonicity of natural powers on nonnegative real numbers, and the finite cardinal d. The argument also covers d=0 and R=0.

**Acceptance.**

- For d=0 choose C=0.
- For roots ±M, the first moment vanishes for arbitrary M; the full condition still bounds M.
- Scaled m-th roots of unity have zero moments at exponents 1 through m−1, showing that no fixed finite initial test suffices.

**Depends on.** this roadmap: `WC.5:power-sum-converse/power-sum-converse`; libraries: `mathlib:norm_sum_le`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: “Soient γ1, . . . , γr ∈ Z̄p deux à deux distincts de valuation p-adique vp(γi) > 0, i = 1, . . . , r. Alors il existe k ∈ N∗, tel que Σ ci γi^(−k) ∉ Z̄p.” — Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

### The nonarchimedean negative-power obstruction

`WC.5:power-sum-converse/reciprocal-moments-escape-unit-ball` · theorem · WC.0 part · declaration `TauCeti.FiniteSpectrum.reciprocal_moments_escape`

Let K be a normed field, d>0, γ: Fin d → K injective, 0<‖γ_i‖<1 for every i, and c_i≠0 for every i. For every N≥0 there exists n≥max(N,1) with ‖Σ_i c_i (γ_i⁻¹)^n‖>1. For a p-adic field this says that some positive negative-power sum is outside its valuation ring, and that this happens at arbitrarily large exponents.

**Hypotheses.**

- The source assumes integral coefficients; the explicit argument here proves the stronger statement for arbitrary nonzero coefficients. The index type is nonempty. No completeness assumption is needed.

**Proof.**

1. If all terms in some tail had norm at most one, apply distinct-spectrum-bound with β_i=γ_i⁻¹, C=R=1 and threshold max(N,1). Inversion is injective on nonzero elements.
2. It follows that ‖γ_i⁻¹‖≤1 for every i, contradicting 0<‖γ_i‖<1. Pick any index using d>0.
3. For the source application use the equivalence between membership in the p-adic valuation ring and norm at most one. This node exports the norm statement and does not construct another valuation ring.

**Acceptance.**

- For γ=1/3 in the 3-adic norm this hypothesis fails; use γ=3 instead.
- For γ=(p,−p) and c=(1,1), the first moment is zero but an even negative moment eventually leaves the unit ball, including p=2.
- An empty family would contradict the stated existence and is explicitly excluded.

**Depends on.** this roadmap: `WC.5:power-sum-converse/distinct-spectrum-bound`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `yu-2022-app-c`, Appendix C, unnumbered lemma and proof, printed p. 81: “Soient γ1, . . . , γr ∈ Z̄p deux à deux distincts de valuation p-adique vp(γi) > 0, i = 1, . . . , r. Alors il existe k ∈ N∗, tel que Σ ci γi^(−k) ∉ Z̄p.” — Source motivation and nonarchimedean special case. The precise normed-field generalization and proof below are supplied explicitly by this worker; Yu uses successive elimination.

### The convergent rational generating expression

`WC.5:power-sum-converse/power-sum-generating-series` · theorem · planet “Power-sum generating function” · WC.0 part · declaration `TauCeti.FiniteSpectrum.hasSum_power_sum_generating`

Let K be a normed field, β,c: Fin d → K and z in K with ‖β_i z‖<1 for every i. Then Σ_{n≥0} (Σ_i c_i β_i^(n+1)) z^(n+1) converges with sum Σ_i c_i β_i z/(1−β_i z). This is an equality with a specified sum, not a convention for a divergent infinite sum.

**Hypotheses.**

- This expression starts at exponent one. Zero roots and repeated roots are allowed. The geometric-series theorem used here does not require K to be complete.

**Proof.**

1. For each i use the existing geometric series at ξ=β_i z and multiply by c_i β_i z. Its n-th term is c_i β_i^(n+1) z^(n+1).
2. View the additive group of K as the commutative topological monoid Multiplicative K. Its multiplication is addition in K and is continuous. Apply the pinned hasProd_prod theorem to the finite family of convergent series in this wrapper, then translate back: this is the finite-sum rule also generated under the name hasSum_sum. Distribute the finite sums and multiplication by z^(n+1). Each denominator is nonzero because ‖β_i z‖<1.

**Acceptance.**

- At z=0 both sides are zero.
- For one root β the value is cβz/(1−βz), not c/(1−βz).
- Repeated roots add their weights in the rational expression.

**Depends on.** libraries: `mathlib:hasSum_geometric_of_norm_lt_one`, `mathlib:hasProd_prod`.

**Used here by.** `WC.5:power-sum-converse/no-pole-in-bounded-disc`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: “Define the characteristic polynomial of an endomorphism φ: V → V of a vector space over a field k to be Pφ(t) = det(1 − φt | V).” — Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.
- `mustata-zeta`, Proof of Lemma 3.8, equations (3.11)–(3.12), p.21: “Note that (3.11) implies that the rational function Σ_{m≥1} a_m t^r has a pole at t = 1/ωi. The estimate in (3.12) implies that 1/|ωi| ≥ q^{−1/2}, as required.” — The rational generating function of power sums and the exclusion of poles from the disc of convergence; the weighted, grouped and normed-field form is the packet’s own argument.

### A common polynomial denominator for the generating function

`WC.5:power-sum-converse/generating-numerator-denominator` · lemma · WC.0 part · declaration `TauCeti.FiniteSpectrum.generating_common_denominator`

For a field K and β,c: Fin d → K put D(T)=∏_i(1−β_i T) and N(T)=Σ_i c_i β_i T ∏_{j≠i}(1−β_j T). Then D(0)=1. Whenever all 1−β_i z are nonzero, N(z)/D(z)=Σ_i c_i β_i z/(1−β_i z). Thus N/D in the existing rational-function field is the rational expression of power-sum-generating-series wherever that series is evaluated.

**Hypotheses.**

- This is an algebraic identity over any field. D is nonzero since its value at zero is one. The empty product is one and the empty numerator is zero.

**Proof.**

1. For each summand factor D=(1−β_i T)∏_{j≠i}(1−β_j T). The denominator conditions allow cancellation after evaluation.
2. Distribute the sum and divide by the same nonzero D(z). Evaluation at zero gives D(0)=1 directly.

**Acceptance.**

- For β=(b,b), N=2cbT (1−bT) when both weights are c; reduction cancels one repeated denominator factor in characteristic zero.
- For d=0, N/D=0/1.
- The numerator has constant term zero.

**Depends on.** nothing outside the node.

**Used here by.** `WC.5:power-sum-converse/formal-rational-comparison`, `WC.5:power-sum-converse/pole-cancellation-criterion`, `WC.5:power-sum-converse/no-pole-in-bounded-disc`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: “Define the characteristic polynomial of an endomorphism φ: V → V of a vector space over a field k to be Pφ(t) = det(1 − φt | V).” — Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.
- `mustata-zeta`, Proof of Lemma 3.8, equations (3.11)–(3.12), p.21: “Note that (3.11) implies that the rational function Σ_{m≥1} a_m t^r has a pole at t = 1/ωi. The estimate in (3.12) implies that 1/|ωi| ≥ q^{−1/2}, as required.” — The rational generating function of power sums and the exclusion of poles from the disc of convergence; the weighted, grouped and normed-field form is the packet’s own argument.

### The formal power-sum numerator identity

`WC.5:power-sum-converse/formal-power-sum-product` · theorem · WC.0 part · declaration `TauCeti.FiniteSpectrum.formal_power_sum_product`

Let K be a commutative ring, β,c: Fin d → K, D(T)=∏_i(1−β_i T), and N(T)=Σ_i c_i β_i T ∏_{j≠i}(1−β_j T). Let G be the existing PowerSeries.mk with coefficient zero at index zero and coefficient Σ_i c_i β_i^n at every n>0. Then (D:PowerSeries K) G=(N:PowerSeries K).

**Hypotheses.**

- No field, norm, convergence, distinctness, nonzero-root or characteristic-zero assumption. In particular the equality holds over rings with zero divisors. D and N are local polynomial expressions, not newly defined carriers.

**Proof.**

1. Apply PowerSeries.rescale β_i to mk_one_mul_one_sub_eq_one. Its ring-homomorphism laws, rescale_mk and rescale_X give H_i(1−C(β_i)X)=1, where H_i=mk(n↦β_i^n). No geometric-series object is reconstructed.
2. Put G_i=C(c_i β_i)X H_i. Coefficient extensionality, coeff_mk, coeff_C_mul and coeff_succ_mul_X show G=Σ_i G_i: degree zero is zero, and degree n+1 is Σ_i c_i β_i^(n+1). This explicitly removes the zeroth moment, including for zero roots.
3. For each i write D=(1−β_i T)D_i with D_i=∏_{j≠i}(1−β_j T). Map this finite product to PowerSeries via its existing ring inclusion. Commutativity and the preceding inverse identity give D G_i=C(c_i β_i)X D_i.
4. Distribute the finite sum and use that the polynomial inclusion preserves finite sums and products. Its result is exactly the image of N. For d=0 both sides are zero.

**Acceptance.**

- For a single root b and weight c, (1−bT)G=cbT, including b=0.
- Two identical roots with weights 1 and −1 give G=N=0 although the unreduced denominator is (1−bT)^2.
- In characteristic two, two copies of the root one with unit weights give G=N=0; no logarithm or division by a positive index is used.

**Depends on.** libraries: `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.mk_one_mul_one_sub_eq_one`, `mathlib:PowerSeries.rescale`, `mathlib:PowerSeries.rescale_mk`, `mathlib:PowerSeries.rescale_X`, `mathlib:PowerSeries.coeff_succ_mul_X`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:Polynomial.coe_mul`.

**Used here by.** `WC.5:power-sum-converse/formal-rational-comparison`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `mathlib-formal-series-pin`, PowerSeries/WellKnown.lean: mk_one_mul_one_sub_eq_one; LaurentSeries.lean: RatFunc.coe_coe and algebraMap_apply_div: “theorem mk_one_mul_one_sub_eq_one : (mk 1 : S⟦X⟧) * (1 - X) = 1” — Existing formal geometric series and embeddings; the weighted finite-sum specialization and denominator clearing are the explicit argument supplied here.

### The rational function has the prescribed formal expansion

`WC.5:power-sum-converse/formal-rational-comparison` · theorem · WC.0 part · declaration `TauCeti.FiniteSpectrum.formal_power_sum_eq_ratFunc`

Let K be a field and β,c: Fin d → K. With D,N,G as in formal-power-sum-product, the image of G in the existing LaurentSeries K equals the image of N/D from the existing RatFunc K under its algebra map to LaurentSeries K. Thus this rational function has no negative coefficients at the origin, coefficient zero in degree zero, and coefficient Σ_i c_i β_i^n in every degree n>0.

**Hypotheses.**

- No characteristic-zero, norm, distinctness or convergence assumption. The comparison uses a common Laurent-series field: it does not assert a nonexistent direct inclusion of every RatFunc into PowerSeries.

**Proof.**

1. By the existing common-denominator node, D(0)=1, hence D is not the zero polynomial. The injective Polynomial-to-PowerSeries and PowerSeries-to-HahnSeries maps show its Laurent image is nonzero.
2. Map formal-power-sum-product into LaurentSeries using the existing ring homomorphism and PowerSeries.coe_mul. This gives image(D)·image(G)=image(N). Divide by the nonzero image(D) in the Laurent series field.
3. RatFunc.coe_coe identifies both polynomial images through RatFunc with their images through PowerSeries; RatFunc.algebraMap_apply_div identifies the resulting quotient with the image of N/D.
4. Apply the existing PowerSeries.coeff_coe and coeff_mk to read off the coefficients. Negative coefficients vanish. The degree-zero coefficient is zero, not Σ_i c_i. All equalities are formal; evaluating at a point requires the separately stated convergence conditions.

**Acceptance.**

- The empty spectrum maps 0 to the rational function 0/1.
- For b=2,c=3 the positive coefficients begin 6,12,24 while the constant coefficient is zero.
- A zero root and arbitrary weight contribute no positive coefficients and no denominator factor other than one.
- The comparison still holds in characteristic two with cancellation of two identical roots.

**Depends on.** this roadmap: `WC.5:power-sum-converse/formal-power-sum-product`, `WC.5:power-sum-converse/generating-numerator-denominator`; libraries: `mathlib:Polynomial.coe_injective`, `mathlib:HahnSeries.ofPowerSeries_injective`, `mathlib:PowerSeries.coe_mul`, `mathlib:RatFunc.coe_coe`, `mathlib:RatFunc.algebraMap_apply_div`, `mathlib:PowerSeries.coeff_coe`, `mathlib:PowerSeries.coeff_mk`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `mathlib-formal-series-pin`, PowerSeries/WellKnown.lean: mk_one_mul_one_sub_eq_one; LaurentSeries.lean: RatFunc.coe_coe and algebraMap_apply_div: “theorem mk_one_mul_one_sub_eq_one : (mk 1 : S⟦X⟧) * (1 - X) = 1” — Existing formal geometric series and embeddings; the weighted finite-sum specialization and denominator clearing are the explicit argument supplied here.

### The exact criterion for cancelling a reciprocal root

`WC.5:power-sum-converse/pole-cancellation-criterion` · lemma · WC.0 part · declaration `TauCeti.FiniteSpectrum.generating_pole_cancellation_iff`

Let β: Fin d → K be injective over a field K and let β_k≠0. For the numerator N of generating-numerator-denominator, N(β_k⁻¹)=c_k ∏_{j≠k}(1−β_j/β_k). Consequently N(β_k⁻¹)=0 if and only if c_k=0. The denominator D has a simple zero there, so the reduced rational function has a pole there exactly when c_k≠0.

**Hypotheses.**

- Coincident roots must first be grouped; c_k then means their total weight. The zero root does not define a finite reciprocal pole.

**Proof.**

1. Evaluate the numerator sum. Every i≠k summand includes the factor 1−β_k T and vanishes. The k-th summand has β_k T=1.
2. Each remaining factor is nonzero by injectivity of β and β_k≠0. A product in a field is zero exactly when a factor is zero, giving the criterion.
3. Factor D=(1−β_k T)∏_{j≠k}(1−β_j T). The second factor is nonzero at β_k⁻¹ and the first has degree one. This proves the simple-zero and no-cancellation interpretation algebraically.

**Acceptance.**

- For one root b≠0 the numerator at b⁻¹ equals c.
- Two weights 1 and −1 on the same root cancel after grouping; a claimed pole must disappear.
- A zero root contributes no positive moment or denominator zero.

**Depends on.** this roadmap: `WC.5:power-sum-converse/generating-numerator-denominator`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: “Define the characteristic polynomial of an endomorphism φ: V → V of a vector space over a field k to be Pφ(t) = det(1 − φt | V).” — Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.
- `mustata-zeta`, Proof of Lemma 3.8, equations (3.11)–(3.12), p.21: “Note that (3.11) implies that the rational function Σ_{m≥1} a_m t^r has a pole at t = 1/ωi. The estimate in (3.12) implies that 1/|ωi| ≥ q^{−1/2}, as required.” — The rational generating function of power sums and the exclusion of poles from the disc of convergence; the weighted, grouped and normed-field form is the packet’s own argument.

### An all-power bound excludes poles in the convergence disc

`WC.5:power-sum-converse/no-pole-in-bounded-disc` · theorem · WC.0 part · declaration `TauCeti.FiniteSpectrum.no_pole_of_power_sum_bound`

Let K be a normed field, β: Fin d → K injective, every c_i nonzero, C,R≥0 and N≥0. Suppose ‖Σ_i c_i β_i^n‖≤C R^n for n≥N. If R‖z‖<1, then every 1−β_i z is nonzero and the generating series in power-sum-generating-series has its stated rational sum at z. For R>0 this is the open disc of radius 1/R; for R=0 every visible root is zero and the expression is identically zero.

**Hypotheses.**

- This proof uses finite-spectrum algebra to establish the bound first; it does not use a pole assertion circularly to prove that same bound. Weights zero after grouping are removed before this denominator assertion.

**Proof.**

1. Apply distinct-spectrum-bound to obtain ‖β_i‖≤R. Then ‖β_i z‖≤R‖z‖<1, proving all denominator conditions and allowing power-sum-generating-series.
2. Use generating-numerator-denominator to identify the sum with N(z)/D(z). The denominator is nonzero on the disc, excluding a rational pole. At R=0 every β_i=0 and each summand vanishes.

**Acceptance.**

- The disc is open; roots of norm R may give poles on its boundary.
- At R=0 the zero rational function is regular everywhere.
- Invisible zero-weight roots are removed; they do not constrain the disc.

**Depends on.** this roadmap: `WC.5:power-sum-converse/distinct-spectrum-bound`, `WC.5:power-sum-converse/power-sum-generating-series`, `WC.5:power-sum-converse/generating-numerator-denominator`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `milne-lec`, §27, Lemma 27.5 and proof, printed pp. 155–156: “Define the characteristic polynomial of an endomorphism φ: V → V of a vector space over a field k to be Pφ(t) = det(1 − φt | V).” — Milne supplies the trace/power-sum identity and, in characteristic zero, a formal logarithmic expression. This weighted geometric-series calculation is a separate explicit worker argument using the pinned library; it does not import the logarithmic formula over an arbitrary field or any geometric cohomology theorem.
- `mustata-zeta`, Proof of Lemma 3.8, equations (3.11)–(3.12), p.21: “Note that (3.11) implies that the rational function Σ_{m≥1} a_m t^r has a pole at t = 1/ωi. The estimate in (3.12) implies that 1/|ωi| ≥ q^{−1/2}, as required.” — The rational generating function of power sums and the exclusion of poles from the disc of convergence; the weighted, grouped and normed-field form is the packet’s own argument.

### Reciprocal pairing turns the upper bound into equality

`WC.5:power-sum-converse/reciprocal-pairing-forces-equality` · theorem · planet “Reciprocal spectrum equality” · WC.0 part · declaration `TauCeti.FiniteSpectrum.norm_eq_of_reciprocal_pairing`

Let α: Fin d → ℂ, τ a permutation of Fin d, R>0, C≥0 and N≥0. Suppose α_i α_(τ(i))=R² for every i and ‖Σ_i α_i^n‖≤C R^n for every n≥N. Then ‖α_i‖=R for every i. Taking R=√q with q>0 yields the all-conjugates curve-RH numerical conclusion from an all-extension bound and a separately supplied reciprocal pairing.

**Hypotheses.**

- The pairing and power-sum bound are explicit inputs, not geometric purity hypotheses hidden in a structure. The theorem is instantiated separately in each complex embedding. It does not construct the curve or its cohomology.

**Proof.**

1. Apply power-sum-converse over ℂ to bound both ‖α_i‖ and ‖α_(τ(i))‖ by R.
2. Taking norms in the pairing gives their product R². Since R>0, either strict upper inequality would force a product strictly below R². Thus equality holds for each i.
3. For q>0, R=√q is positive and R²=q. No assertion about all algebraic conjugates is inferred from checking only one embedding.

**Acceptance.**

- For α=(3+4i,3−4i) and R=5, conjugate pairing has product 25 and both moduli are 5.
- The pair (2,8) has product 16 but cannot satisfy a tail bound C·4^n with a fixed C.
- The empty family is a valid vacuous case.

**Depends on.** this roadmap: `WC.5:power-sum-converse/power-sum-converse`.

**Used here by.** `WC.5:surface-alternative/curve-rh-from-surface-bound`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`.

**Sources.**

- `mustata-zeta`, Remark 3.7, p.21: “since the multiset {ω1, . . . , ω2g} is invariant by the map x → q/x (see Remark 3.4) we conclude that we also have |ωi| ≥ q^{1/2}, hence |ωi| = q^{1/2} for every i.” — The upper bound plus the reciprocal pairing α ↦ q/α forces equality; the node states this for an abstract permutation pairing in each complex embedding.

### Little-o finite-spectrum lemma

`WC.5:power-sum-converse/little-o-visible-root-vanishing` · theorem · planet “Little-o finite-spectrum lemma” · WC.0 part · declaration `TauCeti.FiniteSpectrum.norm_lt_of_moments_little_o`

Let K be a normed field, β:Fin d→K injective, c:Fin d→K, R>0, and S_n=Σ_i c_i β_i^n. If ‖S_n‖/R^n→0 as n→∞, then every visible β_k with c_k≠0 satisfies ‖β_k‖<R. For repeated roots first group the full fibre weights; the same strict conclusion holds exactly for nonzero grouped weights. Neither completeness nor characteristic zero is needed for the weighted statement.

**Proof.**

1. Use recover-consecutive-moments. Divide its norm bound by R^n; the j-th shifted moment is a fixed inverse-Vandermonde coefficient times R^j times ‖S_(n+j)‖/R^(n+j).
2. The finite sum tends to zero, so ‖c_k‖(‖β_k‖/R)^n tends to zero. If ‖β_k‖≥R, this is bounded below by the positive constant ‖c_k‖, a contradiction.
3. Combine repeated roots before applying the argument. Vanishing grouped weights are invisible and yield no conclusion about those roots.

**Acceptance.**

- β=R,c=1 gives normalized moments 1, so is not little-o.
- The two equal roots β=2R with weights 1 and −1 have identically zero moments; visibility excludes them.
- For a single root 0<R and nonzero coefficient the conclusion is strict.

**Depends on.** this roadmap: `WC.5:power-sum-converse/recover-consecutive-moments`; libraries: `mathlib:norm_sum_le`.

**Used here by.** `WC.5:power-sum-converse/graded-polynomial-approximation-lemma`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`; suggested file: signature (Actual NormedField, finite indexed sums and Filter.Tendsto of normalized norms).

**Sources.**

- `vdbe`, §4, Lemma 4.1 and its proof, pp.6–7: “Then di = 0 for i ≥ d odd, Pi = 0 for i > r/2, while for d/2 ≤ i ≤ r/2 we have Pi = d2i ; for these i also α2i,j = p^i.” — Worker’s inverse-Vandermonde proof of its numerical vanishing step; no geometric purity theorem enters.
- `mathlib-vandermonde-pin`, Vandermonde.lean: vandermonde: “def vandermonde (v : Fin n → R) : Matrix (Fin n) (Fin n) R := .of fun i j ↦ (v i) ^ j.1” — Reuse the existing moment recovery.

### Polynomial approximation of graded moments

`WC.5:power-sum-converse/graded-polynomial-approximation-lemma` · theorem · planet “Graded moment approximation” · WC.0 part · declaration `TauCeti.FiniteSpectrum.graded_polynomial_approximation`

Let p>1 be real, r,s natural numbers, b_i finite nonnegative integers for 0≤i≤r, α_(i,j)∈C with modulus p^(i/2), and P∈Q[T]. Suppose Σ_i(−1)^i Σ_j α_(i,j)^n−P(p^n)=o(p^(sn/2)) as n→∞. For every odd i≥s, b_i=0. For every even i=2j≥s with i≤r, all α_(i,k)=p^j and P_j=b_i. For every j with 2j≥s and 2j>r, P_j=0. If s≤r≤2s this includes the exact van den Bogaart–Edixhoven Lemma 4.1 range; the high-cutoff conclusion stated here also handles s>r without claiming anything about low polynomial coefficients.

**Proof.**

1. Expand P(p^n) as finitely many weighted exponentials with roots p^j. Combine equal α’s and these polynomial roots, then apply the strict little-o visible-root lemma with R=p^(s/2).
2. Different cohomological degrees have distinct moduli. In an odd degree ≥ s every grouped coefficient is the negative of a positive multiplicity and cannot cancel a polynomial root of an even weight; it must be absent.
3. In even degree ≥ s a root other than p^j has positive visible multiplicity and is impossible. At p^j the grouped coefficient is b_(2j)−P_j, hence zero; for degrees beyond r it is −P_j.
4. No eigenvalue semisimplicity is inferred; only roots and algebraic multiplicities occur.

**Acceptance.**

- For p=4 and two even-degree roots 4, the coefficient of T is 2.
- A root −p in even degree 2 is excluded by little-o(p^n), though its norm has the correct weight.
- A nontrivial Jordan block with sole eigenvaluep is not excluded by its trace moments.
- Coefficients strictly below s/2 may change without changing the hypothesis.

**Depends on.** this roadmap: `WC.5:power-sum-converse/little-o-visible-root-vanishing`.

**Used here by.** `WC.5/local-polynomial-count-cutoff`.

**Library.** module `TauCeti/Analysis/ExponentialSum/FiniteSpectrum`, namespace `TauCeti.FiniteSpectrum`; suggested file: signature (Finite dependent families of complex roots, rational Polynomial and explicit normalized-limit condition).

**Sources.**

- `vdbe`, §4, Lemma 4.1 and its proof, pp.6–7: “Let us be given the following integers: d ≥ 0, d ≤ r ≤ 2d, and for 0 ≤ i ≤ r also di ≥ 0.” — The explicit numerical lemma supporting both the global theorem and BFP’s larger cutoff.
- `bfp`, Proposition 3.1 proof, p.6 (published p.1330): “Then [vdBE05, Lemma 4.1] tells us that di = 0 for all odd i ≥ s” — Apply the cutoff s, correcting the printed d in the error term.

## WC.5:surface-alternative — Independent curve bound by intersection theory

*Coverage in `WeilConjectures--WC.0.json`: planned, 2 nodes.* Every stated target and key definition/theorem has a declaration-level plan. Closure awaits the exact recorded owner inputs: SchemeAndStackFoundations:SF.5. Blueprint completeness is not implementation or geometric closure.

This child is an independent proof of the Riemann hypothesis for curves, alongside the Jacobian route of DWP.1. Its ancestors avoid DWP.1, DWP.4, WC.3 and the RH-based nodes of WC.5.

- `surface-all-extension-bound-comparison` imports from SF.5 the whole computation on C × C, with A = {P} × C, B = C × {P}, the diagonal Δ and the graph Γ_r of F^r: A² = B² = 0, A·B = 1, Δ² = 2 − 2g, Γ_r² = (2 − 2g)q^r, Δ·Γ_r = N_r, and the Hodge index inequality for D = Δ − A − B and E = Γ_r − q^r A − B. It identifies the fixed points with the point tower of WC.0 and obtains |N_r − 1 − q^r| ≤ 2g q^{r/2} for every r, including g = 0.
- `curve-rh-from-surface-bound` turns these bounds into |Σ_j α_j^r| ≤ 2g q^{r/2} through the curve numerator of WC.1, applies the power-sum converse with R = √q, and gets equality from the reciprocal pairing α ↦ q/α of WC.2. Because the integral numerator contains every conjugate with its multiplicity, this is the all-conjugates statement.

### Surface bound and the extension tower

`WC.5:surface-alternative/surface-all-extension-bound-comparison` · theorem · planet “Surface proof of the Weil bound” · WC.0 part · declaration `TauCeti.PointCounting.surface_all_extension_bound_comparison`

For a smooth projective geometrically connected genus-g curve C/k and every r≥1, import SF.5’s graph/diagonal Hodge-index theorem with q replaced by q^r. Compare its graph fixed-point count with the actual WC N_r to obtain |N_r−1−q^r|≤2g q^(r/2). The SF.5 contract fixes A={P}×C, B=C×{P}, Γ_r=(x,F_q^r x), A²=B²=0, A·B=1, Δ·A=Δ·B=1, Γ_r·A=1, Γ_r·B=q^r, Δ²=2−2g, Γ_r²=(2−2g)q^r and Δ·Γ_r=N_r. With D=Δ−A−B and E=Γ_r−q^rA−B, D²=−2g, E²=−2gq^r,D·E=N_r−1−q^r, and both are orthogonal to ample A+B. SF.5 owns the surface constructions, adjunction and Hodge-index/Cauchy inequality; WC owns the comparison with the extension tower.

**Proof.**

1. Apply the exact SF.5 theorem over k_r or use its r-th Frobenius graph. Fixed intersections are transverse because the differential of the Frobenius power is 0.
2. Use WC.0 to identify these fixed points with Hom(Spec k_r,C) and its finite cardinal, including nonprime q.
3. The supplied surface inequality (D·E)²≤D²E² gives the stated sharp 2g bound; retain the g=0 zero-form case without division by g.

**Acceptance.**

- Genus 0 gives equality N_r=1+q^r.
- Swapping the fibre convention swaps Γ·A and Γ·B; the displayed centered divisors must change too.
- A degree-two Frobenius power uses q², not q, in Γ² and the fibre intersection.

**Depends on.** this roadmap: `WC.0/finite-extension-point-tower-comparison`, `WC.0/closed-point-degree-comparison`; stages: `SchemeAndStackFoundations:SF.5`.

**Used here by.** `WC.5:surface-alternative/curve-rh-from-surface-bound`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5/surface-alternative`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `mustata-zeta`, Proof of Theorem 3.6 and Proposition 3.9, p.22: “Since this holds for all integer (or rational) a and b, it follows that (q + 1 − N1)² ≤ 4qg².” — Complete graph/adjunction/Hodge-index calculation read; the whole intersection proof remains owned by SF.5.

### Curve RH from the surface bound

`WC.5:surface-alternative/curve-rh-from-surface-bound` · theorem · planet “Curve RH by intersection theory” · WC.0 part · declaration `TauCeti.PointCounting.curve_rh_from_surface_bound`

For the same curve, take the normalized integral degree-2g numerator Π_C from WC.1 and its full reciprocal-root multiset in C. The surface bound for every r≥1 and the root-bound-free trace formula give |Σ_j α_j^r|≤2g q^(r/2). The independent finite-spectrum converse yields |α_j|≤√q for all j. The WC.2 purity-independent reciprocal pairing α↦q/α yields |α_j|=√q. Since the integral numerator includes every conjugate with multiplicity, this proves the all-conjugates curve RH statement and agrees with the exact WC.1 numerator and WC.2 functional equation. No DWP.1/DWP.4 or WC.3/WC.5 estimate is an ancestor of this branch.

**Proof.**

1. Use the root-bound-free curve numerator/trace comparison to translate the supplied all-extension surface inequality into all-positive power-sum bounds.
2. Apply power-sum-converse with R=√q,C=2g,N=1; characteristic zero protects positive multiplicities when equal roots are grouped.
3. Use the actual WC.2 curve duality and the independent reciprocal-pairing equality theorem. Nonzero roots follow from Frobenius invertibility.
4. Apply the result to all roots of the integral numerator in a complex splitting field. Each algebraic conjugate is among these roots, so no single-embedding shortcut occurs.

**Acceptance.**

- Equal-modulus roots ±√q cancel odd moments but are recovered by even moments.
- A bound at r=1 alone cannot constrain every root; require all positive r.
- For genus 0 the empty root family gives a vacuous RH assertion and the correct rational zeta.

**Depends on.** this roadmap: `WC.5:surface-alternative/surface-all-extension-bound-comparison`, `WC.1/curve-zeta-numerator-without-rh`, `WC.2/signed-zeta-functional-equation`, `WC.5:power-sum-converse/power-sum-converse`, `WC.5:power-sum-converse/reciprocal-pairing-forces-equality`.

**Library.** module `TauCeti/AlgebraicGeometry/WeilConjectures/WC5/surface-alternative`, namespace `TauCeti.PointCounting`; suggested file: omitted (The actual imported geometric cohomology/stack/transport carrier and its named supplier conditions are absent at the baseline. The full statement is retained here; section 13 forbids replacing it by arbitrary propositions).

**Sources.**

- `mustata-zeta`, Remark 3.7, Lemma 3.8 and Theorem 3.6, pp.21–22: “since the multiset {ω1, . . . , ω2g} is invariant by the map x → q/x (see Remark 3.4) we conclude that we also have |ωi| ≥ q^{1/2}” — Independent numerical converse combined with the imported surface proof; source typos corrected.

## WC.6 — Broader geometry and cohomology interfaces

*Coverage in `WeilConjectures--WC.6.json`: planned, 5 nodes.* Remaining: Replace the WC.1/WC.3/SF.2 and EDC stage requests by exact exported nodes, on actual adic carriers. Receive finite-field coarse-space/stack and algebraic-space weight exports from the routed stacks Part II; recheck quotient hypotheses and Frobenius equivariance. Close imported RD/DWP original-proof obligations at their owners, and state the geometric signatures on their actual carriers.

Of the remaining items above, the WC.1 and WC.3 stage requests are now answered by nodes of the WC.0 part (see “Cross-part prerequisites”); the SF.2 and EDC requests stand.

The layer combines the weight theory of DWP.7, the generic extraction of WC.3 and the duality of EDC and WC.2 for schemes that are smooth and proper but not necessarily projective, and for some that are not smooth. Every node is a consumer: no cohomology, weight or duality theory is constructed here, and none of the five geometric signatures can be typed at the pins.

- **Smooth proper schemes.** `purity-for-proper-smooth-varieties` (the integrated id, kept as RS-17 requires) gives the unique integral factor P_i ∈ ℤ[T] whose image is det(1 − T F_q | H^i) for every ℓ ≠ p, for X smooth proper of dimension at most d, by DWP.7's purity (Weil II 3.3.9) and the extraction of WC.3. `smooth-proper-functional-equation` gives the signed functional equation for pure dimension d, with Δ ∈ ℚ independent of ℓ.
- **Mixed L-functions.** `mixed-l-function-divisor-weights`: for X separated of finite type of dimension at most d and F mixed of integral weights ≤ n, every zero or pole of the *reduced* L-function has inverse an algebraic number of integral weight w ≤ n + 2d (Weil II 3.3.4 through DWP.7). Cancellation removes roots without creating new ones; the degree of a surviving root is not determined, and individual factors need not be integral (G_m: the reciprocal zero 1 has weight 0 although it comes from H^1_c).
- **Rational homology manifolds.** `homology-manifold-weil-assembly`: if X is proper of pure dimension d and its dualizing object is Q_ℓ(d)[2d] Frobenius-equivariantly (Weil II 3.3.11), the same conclusions hold. The hypothesis concerns the dualizing complex, not purity. An étale-local finite quotient of a smooth scheme qualifies once its dualizing calculation is supplied; an arbitrary proper singular scheme does not.
- **Deligne–Mumford stacks.** `purity-for-smooth-proper-dm-stacks`: the cohomology of a smooth proper Deligne–Mumford stack over F_q is pure of weight i in degree i, through the coarse space C and Rπ_*Q_ℓ = Q_ℓ, with characteristic-zero coefficients, so that ℓ may divide the stabiliser orders. Stack cohomology, the coarse comparison over a finite field and the extension of 3.3.11 to algebraic spaces belong to the proposed stacks Part II and are a recorded gap; van den Bogaart–Edixhoven's Lemma 3.2 is written over a field of characteristic zero and does not close it.

**Valuations.** DWP.7's node `hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11` supplies the p-adic valuation triangles of Weil II 3.3.7–3.3.8, which the WC.6 part records as an import. For an eigenvalue α of weight w and an additive valuation with v(q) = 1, the pair is (r, s) = (v(α), v(q^w/α)), so r + s = w; the pair (v(α), v(q/α)) of the earlier decomposition is wrong (at weight zero and α = 1 it gives (0, 1) instead of (0, 0)). For constant coefficients in degree i on a scheme of dimension d, compact support puts (r, s) in the triangle below r + s = i and smooth ordinary cohomology in the triangle above it; for smooth proper X both apply, so (r, s) lies on the diagonal with max(0, i − d) ≤ r, s ≤ min(i, d). The tests are the Tate line and ordinary (0, 1) and supersingular (1/2, 1/2) elliptic curves. A complex weight does not determine a p-adic slope.

**The finite-field crystalline comparison.** The WC.6 part imports three nodes of RD.7 and plans no comparison of its own.

- `RD.7/rigid-crystalline-comparison`: H^i_rig(X/K_0) ≅ H^i_crys(X/W(F_q)) ⊗ K_0 for smooth proper X, rationally; it says nothing about lattices or torsion.
- `RD.7/frobenius-compatibility-of-comparison`: crystalline φ is σ-semilinear, and the determinant uses the K_0-linear φ^f. On a Tate vector, φ(a·e) = p·σ(a)·e, so φ^f acts by q: over F_4 the degree-two factor of P¹ is 1 − 4T, not 1 − 2T.
- `RD.7/ell-adic-comparison-smooth-proper`: the rigid determinant equals the image of the integral P_i of `purity-for-proper-smooth-varieties`; equality follows from the supplier's comparison and the uniqueness of P_i, so no second comparison theorem is planned.

No characteristic-zero lift or de Rham comparison is used to identify the Frobenius of a variety over a finite field, and equality of dimensions in a lift would not suffice. RD.7 consumes WC.1 and WC.3 only, so importing it here makes no cycle.

### Integral degree factors for smooth proper schemes

`WC.6/purity-for-proper-smooth-varieties` · theorem · planet “Proper smooth Weil factors” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.exists_unique_integral_degree_factors_of_smooth_proper`

Let q=p^f, f≥1, and let X_0 be a smooth proper finite-type scheme over F_q, of dimension at most d. For every i there is a unique polynomial P_i in Z[T] such that, for every prime ℓ different from p, its coefficient image in Q_ℓ[T] equals det(1-T F_q | H^i(X_0 × F̄_q,Q_ℓ)), with geometric Frobenius convention. In particular this same normalized integral factor is independent of ℓ. Use the actual cohomology and Frobenius constructed by the suppliers, not an assumed realization with the conclusion as a field. Projectivity, geometric connectedness, and semisimplicity are not hypotheses. For i>2d and for the empty scheme the polynomial is 1.

**Hypotheses.**

- The scheme is smooth *and* proper over the finite field; coefficients are constant Q_ℓ, ℓ≠p. A general mixed sheaf does not satisfy this conclusion.

**Proof.**

1. SF.2 integrates the PR196 finite-dimensional cohomology, proper comparison H_c^i=H^i, coherent F_q, and the all-power determinant formula for the arithmetically defined Z(X_0,T). WC.1 supplies the normalized rational function with integral power-series expansion.
2. Import the purity portion of DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11: each degree i has algebraic eigenvalues pure of weight i for every complex conjugate. This uses smooth proper, not projective, hypotheses. Do not reprove direct-image bounds or duality in WC.6.
3. Apply the requested general algebraic extraction theorem in WC.3 to this degreewise pure realization of the common rational zeta function. It yields integral normalized factors with multiplicities. Its proof uses different absolute values to prevent cancellation and Galois stability of each weight multiset. The currently integrated WC.3 node is only stated for projective X; that exact statement alone does not discharge this application.
4. Uniqueness follows from injectivity of Z into any Q_ℓ. In zero degrees and for the empty scheme the determinant of the zero-dimensional endomorphism is 1. In a chosen finite basis use the existing charpolyRev, whose value at zero is 1.

**Acceptance.**

- Projective space: P_(2j)=1-q^j T for 0≤j≤d, odd-degree factors 1; agreement with the independently constructed PR196 hyperplane-class computation.
- For Spec F_(q^m), P_0=1-T^m, not (1-T)^m; degree above zero is trivial. Connected over F_q is not geometrically connected.
- Empty scheme: every P_i=1 and Z=1. This tests normalized degree-zero conventions.
- Import a genuine smooth proper nonprojective test variety from DWP.10; do not certify this acceptance using only projective spaces or an assumed cohomology package. Its construction remains an explicit gap.

**Depends on.** other roadmaps: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`; stages: `SchemeAndStackFoundations:SF.2`, `WC.1`, `WC.3`; libraries: `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.eval_charpolyRev`.

**Used here by.** `WC.6/smooth-proper-functional-equation`, `WC.7/projective-space-degree-factors`, `WC.7/finite-etale-permutation-factors`, `WC.7/kunneth-product-agreement`, `WC.7/curve-zeta-jacobian-agreement`, `WC.7/zeta-from-base-field-algebraic-cycles`, `WC.7/geometric-weil-assembly`.

**Sources.**

- `deligne-weil-ii`, Corollary 3.3.9 and its proof, printed 207: “propre et lisse” — Supplies nonprojective purity; the proof explicitly invokes the same factor-descent argument as Weil I.
- `deligne-weil-i`, Proof of 1.7 implies 1.6, printed 276-277: “à coefficients rationnels” — The algebraic factor extraction belongs to WC.3 and is applied here, not copied as a second proof.

**Assembly note.** The stage citations `WC.1` and `WC.3` and step 3’s remark that “the currently integrated WC.3 node is only stated for projective X” predate the WC.0 part. The generic extraction it requests is `WC.3/degreewise-pure-factor-extraction`, whose input is `WC.1/normalized-integral-zeta-presentation`; the determinant identity for all powers is `WC.1/cohomological-formula-from-the-trace-formula`. Those three nodes are the exact prerequisites. Separately, the accepted DWP.7 part proposes narrowing this node to an adapter of DWP.7 (ii) (structural proposal 2).

### Weights of reciprocal zeros and poles of a mixed L-function

`WC.6/mixed-l-function-divisor-weights` · theorem · planet “Mixed L-functions” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.reciprocal_divisor_weight_le`

Let X_0 be separated finite type over F_q of dimension at most d, let ℓ≠p, and let F_0 be a constructible Q̄_ℓ-sheaf descending to a finite extension E of Q_ℓ, mixed of integral weights ≤n in the all-complex-conjugates sense. Use the arithmetic closed-point Euler product L(X_0,F_0,T) and its rational realization in E(T). If β≠0 is a zero or pole of the *reduced* rational function over Q̄_ℓ, then α=β^(-1) is algebraic over Q and has an integral weight w≤n+2d: every complex conjugate of α has absolute value q^(w/2). No assertion is made that individual cohomological factors lie in Z[T], are independent of ℓ, or have weight exactly their cohomological degree.

**Hypotheses.**

- Use compactly supported cohomology for the determinant formula; no smoothness or properness is assumed. Mixedness here is integral, algebraic mixedness, not merely a chosen real ι-weight.

**Proof.**

1. The SF.2 integration of PR196 TraceFormula 14 identifies the closed-point Euler product with the alternating product of det(1-T F_q | H_c^i(X,F)), for 0≤i≤2d, after finite coefficient descent and extension to Q̄_ℓ. Finiteness and vanishing outside these degrees belong to that supplier, not to a new WC object.
2. A zero or pole surviving reduction must be a root of at least one of these finite factors. Cancellation can remove roots but cannot introduce new ones. The reciprocal α is therefore an eigenvalue of Frobenius on some H_c^i.
3. Import DWP.7/cohomological-bounds-3-3-2-3-3-6, specifically Weil II 3.3.4, to obtain an integer weight w≤n+i. Since i≤2d, w≤n+2d. This does not identify the cohomological degree of a root surviving cancellation.

**Acceptance.**

- For G_m with the constant sheaf, L=(1-T)/(1-qT); reciprocal zero 1 has weight 0 and reciprocal pole q has weight 2. H_c^1 has weight 0, not degree 1.
- On Spec F_q, a rank-one sheaf with Frobenius scalar q^(-1) has L=(1-q^(-1)T)^(-1), weight -2. Its factor need not lie in Z[T].
- The zero sheaf and the empty scheme have L=1 and empty divisor; there is no invented weight or root.
- Tate twist (1) gives L(F(1),T)=L(F,T/q), not L(F,qT). Test the scalar q against scalar 1 on a point.

**Depends on.** other roadmaps: `DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions`, `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`; stages: `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:Matrix.charpolyRev`, `mathlib:RatFunc`.

**Used here by.** `WC.7/multiplicative-group-compact-support-agreement`, `WC.7/geometric-weil-assembly`.

**Sources.**

- `deligne-weil-ii`, Corollary 3.3.4, printed 206: “mixte de poids” — The degreewise compact-support upper bound supplies the surviving divisor weights.
- `sga4half-rapport`, Rapport 3.1-3.4 and 3.6: “formule des traces” — The Euler-product/determinant identity is an imported theorem; 3.6 explains compact support.

### Signed functional equation for smooth proper schemes

`WC.6/smooth-proper-functional-equation` · theorem · planet “Smooth proper functional equation” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_of_smooth_proper`

Let X_0/F_q be smooth proper of pure dimension d, ℓ≠p, and let P_i be its canonical integral degree factors. Put b_i=deg P_i, χ=Σ_i (-1)^i b_i and Δ=∏_i det(F_q|H^i)^((-1)^i). Then Δ is the same nonzero rational number for every ℓ, Δ^2=q^(d χ), and Z(X_0,1/(q^d T))=(-1)^χ Δ T^χ Z(X_0,T) in Q(T), using integer powers for possibly negative χ. No projectivity, geometric connectedness or Frobenius semisimplicity is required.

**Proof.**

1. Import the actual Frobenius-equivariant perfect pairing H^i × H^(2d-i)(d)→Q_ℓ from EDC.2:pairings. EDC.8 gives reciprocal factors with q^d scaling and the determinant relation.
2. Apply the requested WC.2 signed determinant-product functional equation, not a second proof of generic reciprocal linear algebra. Proper comparison identifies the compact-support determinant product with Z.
3. Each det(F_i)=(-1)^b_i times the top coefficient of P_i, so the alternating product Δ descends to Q and is independent of ℓ. The duality determinant identity gives its square. Retain the actual Δ rather than choosing an unjustified positive square root.

**Acceptance.**

- P²: χ=3, Δ=q^3, so the multiplier is -q^3 T^3.
- A genus-two curve: χ=-2, Δ=q^(-1), so the multiplier is q^(-1)T^(-2).
- Finite étale schemes retain determinant signs of Frobenius permutations; no geometric-connectedness shortcut.

**Depends on.** this roadmap: `WC.6/purity-for-proper-smooth-varieties`; stages: `SchemeAndStackFoundations:SF.2`, `WC.2`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.8`.

**Used here by.** `WC.7/curve-zeta-jacobian-agreement`, `WC.7/projective-plane-functional-equation-sign`, `WC.7/geometric-weil-assembly`.

**Sources.**

- `deligne-weil-i`, 2.3-2.6, printed 281-282, with 1.5.4: “dualité parfaite” — The perfect equivariant pairing, q^d reciprocal eigenvalues and zeta functional equation are explicit. WC.2 refines the sign to the actual determinant Δ before WC.6 applies it.

**Assembly note.** The stage citation `WC.2` is answered by `WC.2/signed-zeta-functional-equation` and `WC.2/functional-equation-multiplier-descent`, which prove the same theorem for smooth proper X of pure dimension d and descend the multiplier to ℚ. Step 2’s phrase “the requested WC.2 signed determinant-product functional equation” refers to them. What this node adds is the identification of Δ through the leading coefficients of the canonical integral factors (structural proposal 5).

### Weil factors for proper rational homology manifolds

`WC.6/homology-manifold-weil-assembly` · theorem · planet “Rational homology manifolds” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.weil_factors_of_dualizing_constant`

Let X_0/F_q be proper finite type of pure dimension d, ℓ≠p. Suppose its actual dualizing object has a Frobenius-equivariant isomorphism a^! Q_ℓ = Q_ℓ(d)[2d], where a:X_0→Spec F_q, for each ℓ under consideration. Then its constant cohomology is pure of weight i; applying WC.1 and the generic WC.3 extraction gives canonical normalized P_i in Z[T], independent of ℓ, and the signed functional equation with the actual duality determinant Δ and integer Euler exponent χ. The isomorphism is a geometric hypothesis, not an assumed purity or RH conclusion.

**Proof.**

1. DWP.7 imports Weil II 3.3.11: the lower-weight argument requires precisely the stated dualizing identification; proper upper weights and that lower bound meet at i.
2. Use WC.1/SF.2 arithmetic rationality and the same generic WC.3 extraction as the smooth-proper theorem; smoothness is not needed by that algebraic extraction.
3. EDC.1:biduality supplies duality for this actual complex. Apply EDC.8 and WC.2 with the Frobenius normalization specified over the base, not just an isomorphism over the algebraic closure.

**Acceptance.**

- A smooth pure-dimensional scheme recovers the previous two consumer results via EDC smooth purity.
- A proper scheme étale-locally a finite quotient of a smooth d-dimensional scheme qualifies only after the geometric dualizing export is proved.
- A general proper singular scheme is not admitted merely by its properness.

**Depends on.** other roadmaps: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`; stages: `SchemeAndStackFoundations:SF.2`, `WC.1`, `WC.3`, `WC.2`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`, `EtaleDualityAndPerverseSheaves:EDC.8`.

**Sources.**

- `deligne-weil-ii`, 3.3.11, printed 207: “rational homology” — The explicit dualizing-complex condition replaces smoothness, and the source gives étale-local finite quotients as examples.

**Assembly note.** The stage citations `WC.1` and `WC.3` are answered as for `WC.6/purity-for-proper-smooth-varieties`; the extraction needs no smoothness. The citation `WC.2` is not answered: `WC.2/signed-zeta-functional-equation` assumes X smooth and takes its pairing from EDC.2:pairings, while this node’s pairing comes from EDC.1:biduality. The algebra is the same, but WC.2 has no node stating it for a pairing that does not come from smoothness, so the WC.6 part’s WC.2 request stays open for this node.

### Purity for smooth proper Deligne–Mumford stacks

`WC.6/purity-for-smooth-proper-dm-stacks` · theorem · planet “Deligne-Mumford stack purity” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.pure_cohomology_of_smooth_proper_dm_stack`

Let X/F_q be a smooth proper finite-type Deligne–Mumford stack and ℓ≠p. For every i, the genuine finite-dimensional H^i(X_{F̄_q},Q_ℓ) with geometric Frobenius is pure of weight i in the all-complex-conjugates sense. No global quotient presentation and no condition ℓ not dividing stabilizer orders is imposed for these characteristic-zero coefficients. This is a purity application only; weighted stack counts, stack zeta rationality and stack duality remain the routed stacks Part II exports.

**Proof.**

1. Import the actual stack cohomology carrier, proper coarse algebraic space C and Frobenius-equivariant H^i(C,Q_ℓ)→H^i(X,Q_ℓ) isomorphism from the proposed EDC stacks Part II. Its proof needs Rπ_*Q_ℓ=Q_ℓ with exact finite-group invariants and étale-local presentations.
2. Import the quotient-chart dualizing calculation and the algebraic-space extension of the Weil II 3.3.11 weight argument. Apply proper rational-homology-manifold purity to C, component by dimension if necessary, and transport along the comparison.
3. For an actual global quotient [Y/G] with Y smooth proper, compare with H^i(Y,Q_ℓ)^G; this is a check on the general result, not a hypothesis restricting all DM stacks. Van den Bogaart–Edixhoven Lemma 3.2 as written proves only characteristic-zero comparison, so it leaves the finite-field export open.

**Acceptance.**

- For a scheme regarded as a DM stack, recover DWP.7 smooth proper purity.
- For [Y/G] smooth proper with finite G, invariants of a pure representation stay pure, even when ℓ divides |G|.
- A smooth nonproper stack is not admitted by this theorem; a coarse space need not be a scheme.

**Depends on.** other roadmaps: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`; stages: `SchemeAndStackFoundations:SF.1`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality`.

**Sources.**

- `bfp24`, Proof of Proposition 3.1, p.6; Proposition 4.2 proof, p.7: “smooth and proper” — The point-count/cohomology argument consumes DM purity; it does not supply the missing general stack formalism.
- `deligne-weil-ii`, 3.3.11, printed 207: “groupe fini” — Coarse quotient charts motivate the dualizing calculation; the extension from schemes to algebraic spaces is a recorded input.
- `vdbe05-v3`, Section 3, Lemma 3.2 and its proof, printed p.5 (characteristic zero): “characteristic zero” — The written coarse comparison has a narrower base than the desired finite-field application; it cannot be used without an additional theorem.

**Assembly note.** DeligneWeightsAndPurity’s node `DWP.8/weight-spectral-sequence-of-a-normal-crossings-compactification` cites this node. Its stack inputs wait for the proposed stacks Part II (structural proposal 4); the WC.0 part’s gap “DM stack Part II carriers and trace/purity/comparison” waits for the same owner.

## WC.7 — Worked realizations and final assembly

*Coverage in `WeilConjectures--WC.6.json`: planned, 15 nodes.* Remaining: Receive actual PR196/SF.2 curve, Weierstrass-scheme, Künneth and all-power recurrence bridges and the DWP.10 nonprojective/Jordan/Tate test exports. Receive the routed numerical Picard and surface invariant/descent inputs, then replace those recorded gaps by exact nodes. Recheck the complete supplier graph and run the geometric acceptance matrix on constructed objects; algebraic Suggested checks alone are not geometric certification.

Of the remaining items above, the all-power recurrence is now `WC.5/extension-count-recurrence` (see “Cross-part prerequisites”); the PR196/SF.2 bridges, the DWP.10 examples and the surface inputs stand.

RS-17 narrows WC.7 to zeta-facing worked realizations; the generic examples (projective, curve, Jordan, Tate, nonprojective cohomology) are constructed by PR196 and DWP.10, and each node here identifies their factors with the canonical integral factors of WC.6 and the counts with the point tower. The routing of Schröer's paper adds six theorems about cycles and surfaces. Process bookkeeping (source receipts, publication, closure accounting) has no node.

- **Realizations.** Projective space has P_{2j} = 1 − q^j T and N_r = Σ_j q^{jr} (`projective-space-degree-factors`; P¹ over F_4 has counts 5 and 17, not 3 and 5). A finite étale scheme with Frobenius orbits of lengths m_a has P_0 = ∏(1 − T^{m_a}) (`finite-etale-permutation-factors`; Spec F_{q²} has counts 0, 2, 0, 2 and simple poles at ±1). Products have the factors of the tensor product, det(1 − T(F_i ⊗ G_j)), which is not the product of the two zeta functions (`kunneth-product-agreement`; P¹ × P¹ over F_2 has counts 9 and 25). A curve has deg P_1 = 2g and P_1(T) = q^g T^{2g} P_1(1/(qT)) (`curve-zeta-jacobian-agreement`).
- **Explicit curves.** y² = x³ − x over F_5 has 8 points, P_1 = 1 + 2T + 5T² and 32 points over F_25 (`elliptic-curve-over-f5`). The smooth projective model of y² + y = x⁵ over F_2 has genus 2 by Artin–Schreier ramification and Riemann–Hurwitz, P_1 = 1 + 4T⁴, counts 3, 5, 9, 33 and χ = −2, with functional equation Z(1/(2T)) = ½·T^{−2}·Z(T) (`genus-two-negative-euler-example`). Both counts were checked by exhaustive enumeration in the planning pass and again by its review; the enumeration checks the arithmetic, not the geometric bridges.
- **Signs and compact support.** Z(P², 1/(q²T)) = −q³T³ Z(P², T) (`projective-plane-functional-equation-sign`). G_m has compact-support factors 1 − T and 1 − qT, Z = (1 − T)/(1 − qT) and N_r = q^r − 1; substituting ordinary cohomology inverts the rational function (`multiplicative-group-compact-support-agreement`).
- **Cycles and surfaces (Schröer §7).** If the base-field cycle map CH^j(X_0) ⊗ Q_ℓ → H^{2j}(X, Q_ℓ(j)) is surjective, Frobenius is the scalar q^j on H^{2j} (`scalar-frobenius-from-base-field-cycles`); geometric cycles do not suffice, as the two exchanged points of Spec F_{q²} show. With odd cohomology zero this gives Z = ∏_j (1 − q^j T)^{−b_{2j}} (`zeta-from-base-field-algebraic-cycles`) and N_r = Σ_j b_{2j} q^{jr} for every r (`all-extension-counts-from-cycles`), an extension of the printed r = 1. For surfaces with b_1 = 0, b_2 = ρ and constant numerical Picard group, N_r = 1 + b_2 q^r + q^{2r} (`surface-count-constant-numerical-picard`, with the source's F_p corrected to F_q); Enriques surfaces and relatively minimal rational genus-one fibrations with constant Num have 25 points over F_2 and 57 over F_4 (`twenty-five-point-surfaces`). For a geometrically rational surface, constant Picard group is equivalent to N_1 = 1 + ρq + q², because Frobenius acts on the Picard lattice with finite order (`rational-surface-picard-count-criterion`, the derived supplement /241).
- **The assembled endpoint.** `geometric-weil-assembly` states the conclusions for actual smooth proper geometrically connected X_0 of pure dimension d: normalised rationality, the factorization by integral ℓ-independent P_i, the all-conjugates weights, the signed functional equation and the all-power trace identity, with Betti comparison only for a supplied family and the mixed bound as a separate API.

The acceptance matrix of the WC.6 part, kept as one table:

| Test | What it discriminates |
|---|---|
| Empty scheme, zero sheaf | All factors one; Z or L one; empty divisor |
| Pⁿ, including n = 0 | Hyperplane-generated factors agree with geometric counts |
| q = 4 | The Tate line has scalar 4; P¹ has counts 5 and 17 |
| A finite étale orbit | 1 − T^m and counts that depend on divisibility |
| Curves and the elliptic recurrence | The actual Jacobian H¹, multiplicities and powers of the same Frobenius |
| y² = x³ − x over F_5 | Discriminant 4, eight points, trace −2, N_2 = 32 |
| y² + y = x⁵ over F_2 | Model and genus inputs, P_1 = 1 + 4T⁴, counts 3, 5, 9, 33 |
| P¹ × P¹ | The tensor Künneth action, not a product of zeta functions |
| The sign of P² | The multiplier −q³T³ |
| A negative Euler characteristic | The integer power T^{−2} and the rational determinant q^{−1} |
| A Jordan block | Same factor and traces as its semisimplification, without equal endomorphisms |
| A Tate twist | Substitution T/q and weight shift −2 |
| Ordinary and compact support | The direction of the quotient for G_m |
| A smooth proper nonprojective scheme | Needs DWP.10's actual scheme; projective cases cannot certify it |
| Crystalline q-Frobenius | Rational comparison and semilinear iteration, with no lattice claim |
| Base-field cycles | Geometric spanning alone fails on a permutation of components |
| The surface formula | Constant Num and b_2 = ρ explicit, q possibly nonprime |
| The 25-point surfaces | The geometric invariants give ten middle classes |
| The rational Picard criterion | Maximal trace of a finite-order action on a free lattice |
| The family comparison | A complex fibre is supplied, never invented |

### Projective-space factors and all-extension counts

`WC.7/projective-space-degree-factors` · theorem · planet “Projective space” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_projective_space`

For n≥0 and q=p^f, the canonical integral degree factors of Pⁿ/F_q are P_(2j)=1-q^j T for 0≤j≤n and P_i=1 otherwise. They agree with the independently constructed PR196 hyperplane-class cohomology and give Z=∏_(j=0)^n(1-q^j T)^(-1) and #Pⁿ(F_(q^r))=Σ_(j=0)^n q^(jr) for every r≥1.

**Proof.**

1. Import PR196 TraceFormula 12 projective-space cohomology, hyperplane generator, Tate twist and Frobenius scalar q^j through SF.2. This calculation is not derived from the RH theorem being tested.
2. Use uniqueness of the WC.6 canonical factor to identify its integral image with 1-q^j T. The upstream arithmetic count and determinant formula agree for every power.

**Acceptance.**

- n=0: Z=1/(1-T) and all counts are 1.
- P¹/F_4: factors 1-T and 1-4T; counts 5 and 17 over F_4,F_16, rather than 3 and 5.
- P²/F_2: degrees 0,2,4 have scalars 1,2,4, and the first counts are 7 and 21.

**Depends on.** this roadmap: `WC.6/purity-for-proper-smooth-varieties`; stages: `SchemeAndStackFoundations:SF.2`, `WC.5`.

**Used here by.** `WC.7/kunneth-product-agreement`, `WC.7/projective-plane-functional-equation-sign`.

**Sources.**

- `pr196-trace`, Layer 12 projective-space computation; Layers 13 and worked examples: “hyperplane” — Identifies actual cohomology generators and arithmetic zeta, so the missing item here is their agreement with canonical Weil factors.

**Assembly note.** The stage citation `WC.5` stands for the all-power trace identity, `WC.1/cohomological-formula-from-the-trace-formula`, and the recurrence `WC.5/extension-count-recurrence`.

### Finite étale Frobenius orbit factors

`WC.7/finite-etale-permutation-factors` · theorem · planet “Finite etale schemes” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.degree_factor_finite_etale_orbits`

Let X_0/F_q be finite étale, with geometric point set decomposing into Frobenius orbits of lengths m_1,...,m_s. Then canonical P_0=∏_a (1-T^(m_a)), P_i=1 for i>0, and #X_0(F_(q^r))=Σ_(a:m_a divides r) m_a. In particular Spec F_(q^m) has factor 1-T^m and count m if m divides r and 0 otherwise.

**Proof.**

1. Use PR196 TraceFormula 7 permutation cohomology on the finite geometric point set. In each cyclic block det(1-TF)=1-T^m and Tr(F^r) counts fixed points.
2. Identify the factor with WC.6 by uniqueness, including the empty union. This is a compatibility consumer of the existing permutation construction.

**Acceptance.**

- m=2: P_0=1-T^2, N_1=0,N_2=2,N_3=0,N_4=2.
- A split pair instead has P_0=(1-T)^2 and N_r=2 always.
- Empty finite étale scheme: product=1 and N_r=0.
- For Spec F_(q^2), Z=(1-T^2)^(-1) has simple poles at T=1 and T=-1; the split pair instead has a double pole at T=1. Pole multiplicities use reduced factors.

**Depends on.** this roadmap: `WC.6/purity-for-proper-smooth-varieties`; stages: `SchemeAndStackFoundations:SF.2`.

**Sources.**

- `pr196-trace`, Layer 7 and finite-étale worked examples: “permutation” — The orbit calculation belongs to the supplier; this comparison fixes the canonical integral factor and all-power arithmetic interpretation.

**Assembly note.** The counts and the zeta function are the dimension-zero case of `WC.5/components-and-dimension-zero`; structural proposal 7 makes this node cite it and keep the identification of P_0.

### Zeta factors of products via Künneth

`WC.7/kunneth-product-agreement` · theorem · planet “Kunneth formula” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.degree_factors_product_of_smooth_proper`

For smooth proper X_0,Y_0/F_q and each n, the coefficient image of the canonical factor P_n(X_0 × Y_0,T) is ∏_(i+j=n) det(1-T(F_i ⊗ G_j) | H^i(X) ⊗ H^j(Y)). This agrees with # (X_0 × Y_0)(F_(q^r))=#X_0(F_(q^r)) #Y_0(F_(q^r)) for every r. For P¹ × P¹ the factors are P_0=1-T, P_2=(1-qT)^2, P_4=1-q^2T, all odd factors 1.

**Proof.**

1. Import the actual Frobenius-equivariant Künneth isomorphism from SF.2/PR196, and direct-sum determinant compatibility on the finite-dimensional spaces.
2. Apply canonical factor uniqueness and the all-power trace formula. Tensor-product traces multiply, with the two alternating degree signs yielding the product of point counts. This is not multiplication of the two zeta rational functions.

**Acceptance.**

- P¹ × P¹: N_r=(1+q^r)^2, not 2+2q^r.
- q=2: N_1=9,N_2=25.
- Multiplying Z(P¹,T) by itself omits the degree-four factor and fails these counts.

**Depends on.** this roadmap: `WC.6/purity-for-proper-smooth-varieties`, `WC.7/projective-space-degree-factors`; stages: `SchemeAndStackFoundations:SF.2`, `WC.5`.

**Sources.**

- `pr196-trace`, Layer 11 products/Künneth compatibility; Layer 12 compact-support Künneth and Layer 13 determinant formula: “Künneth” — The supplier gives geometric ⊗ compatibility; its consumer computes degree factors and all-power counts.

**Assembly note.** The stage citation `WC.5` stands for the all-power trace identity `WC.1/cohomological-formula-from-the-trace-formula` and `WC.5/extension-count-recurrence`.

### Curve degree factors and recurrence

`WC.7/curve-zeta-jacobian-agreement` · comparison · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.degree_one_factor_curve`

For a smooth proper geometrically connected curve C_0/F_q of genus g, identify the canonical P_1 with det(1-TF | H^1_et(C_{F̄_q},Q_ℓ)) and the Frobenius polynomial provided by PR196 curve/Jacobian realization. Then P_0=1-T, P_2=1-qT, deg P_1=2g, P_1(T)=q^g T^(2g)P_1(1/(qT)), and N_r=1+q^r-Tr(F^r|H^1) for every r≥1. WC.5 supplies the all-power recurrence of these traces and pole orders; no semisimplicity assumption is used.

**Proof.**

1. Import PR196 TraceFormula 8 and 15 genuine smooth-projective-curve/Jacobian cohomology. Over a finite field, the smooth proper curve is projective; this bridge belongs to the curve supplier.
2. Use WC.6 purity/integral uniqueness and duality, and the requested WC.5 Newton/recurrence interface to interpret all powers, not only r=1.

**Acceptance.**

- Genus zero gives P_1=1 and N_r=1+q^r.
- Genus one gives P_1=1-aT+qT^2 and recurrence S_r=aS_(r-1)-qS_(r-2), S_0=2,S_1=a.
- A trace at r=1 alone does not determine a higher-genus factor.
- For q>1 a geometrically connected smooth proper curve has simple poles at T=1 and T=q^(-1); pure weight-one numerator roots cannot cancel either extreme-degree factor.

**Depends on.** this roadmap: `WC.6/purity-for-proper-smooth-varieties`, `WC.6/smooth-proper-functional-equation`; stages: `SchemeAndStackFoundations:SF.2`, `WC.5`.

**Used here by.** `WC.7/elliptic-curve-over-f5`, `WC.7/genus-two-negative-euler-example`.

**Sources.**

- `pr196-trace`, Layers 8 and 15, curve test: “curves” — Independent curve cohomology supplies dimensions and the factor before the weight conclusion is used.

**Assembly note.** This node restates `WC.1/curve-zeta-numerator-without-rh` (same PR196 layers, same conclusions before any root bound) and adds the canonical-factor identification and the reciprocity P_1(T) = q^g T^{2g} P_1(1/(qT)) from `WC.6/smooth-proper-functional-equation`. The stage citation `WC.5` is `WC.5/extension-count-recurrence`, which already states the curve and elliptic recurrences S_0 = 2g, S_n = 1 + q^n − N_n (structural proposal 6).

### The curve y² = x³ − x over F_5

`WC.7/elliptic-curve-over-f5` · application · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.zeta_weierstrass_five`

Let E_0/F_5 be the smooth proper Weierstrass curve with a_1=a_2=a_3=a_6=0,a_4=-1, so y^2=x^3-x and Δ=64≠0 mod 5. On the actual scheme, #E_0(F_5)=8, canonical P_1=1+2T+5T^2, and Z(E_0,T)=(1+2T+5T^2)/((1-T)(1-5T)). The trace recurrence has S_0=2,S_1=-2,S_r=-2S_(r-1)-5S_(r-2); in particular #E_0(F_25)=32.

**Proof.**

1. Instantiate the existing Mathlib WeierstrassCurve, discriminant and affine Equation. Use the supplier bridge from this nonsingular equation plus the point at infinity to its actual smooth proper genus-one scheme.
2. For x=0,1,2,3,4 the affine y-fiber sizes are 1,1,2,2,1. Add the unique point at infinity to get 8.
3. Apply the curve comparison: a=5+1-8=-2 and determinant q=5 give P_1. All-extension recurrence gives S_2=-6 and N_2=32; independent enumeration in F_5[u]/(u^2-3) confirms the arithmetic number.

**Acceptance.**

- Δ=4 in F_5; the singular curve y^2=x^3 is not substituted.
- The 8-point enumeration fixes a=-2, not +2.
- N_2=32 tests the same Frobenius squared; it cannot be certified by the first trace alone.

**Depends on.** this roadmap: `WC.7/curve-zeta-jacobian-agreement`; stages: `SchemeAndStackFoundations:SF.2`; libraries: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.Affine.Equation`.

**Sources.**

- `pr196-trace`, Layers 8 and 15, specialize the elliptic-curve case: “Frobenius” — The curve trace and determinant justify this explicit computed application; the concrete enumeration is given in the proof sketch.

**Assembly note.** The equation-to-scheme bridge in step 1 is the same as the WC.0 part’s gap “Elliptic scheme/Point carrier comparison” for `WC.5/curve-and-elliptic-bound-comparison`.

### A genus-two Artin–Schreier curve over F_2

`WC.7/genus-two-negative-euler-example` · application · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.zeta_artin_schreier_genus_two`

Let C_0/F_2 be the smooth projective model of the function field F_2(x,y), y^2+y=x^5, constructed by the existing curve dictionary. It is geometrically connected of genus 2 with one F_2-rational point at infinity. Its canonical factor is P_1=1+4T^4 and Z(C_0,T)=(1+4T^4)/((1-T)(1-2T)). Counts over F_2,F_4,F_8,F_16 are 3,5,9,33. Here χ=-2 and Z(C_0,1/(2T))=(1/2)T^(-2)Z(C_0,T).

**Proof.**

1. Import the function-field supplier Artin–Schreier ramification calculation: x^5 has a single reduced pole of order 5, not divisible by 2; the degree-two extension is separable and nontrivial, with different exponent 6 at infinity, unramified elsewhere. Riemann–Hurwitz gives 2g-2=2(-2)+6=2. The curve dictionary supplies the smooth projective model over the perfect finite field and identifies its points with places.
2. The affine y-derivative is 1. Enumerating y^2+y=x^5 over F_2 and F_4 gives 2 and 4 affine points; infinity gives N_1=3,N_2=5. Thus S_1=S_2=0. Newton identities and the degree-four reciprocal relation from the curve comparison force P_1=1+4T^4.
3. The all-power recurrence yields S_3=0,S_4=-16 and counts 9,33; independent field enumeration confirms them. Apply the WC.6 signed functional equation with g=2 rather than assuming a nonnegative Euler exponent.

**Acceptance.**

- Pole order 5 is prime to characteristic; the unreduced formula for a pole of even order is not used.
- Actual N_1=3,N_2=5 distinguish this realization from a formal reciprocal polynomial.
- The T^(-2) multiplier and N_4=33 discriminate an unsigned or natural-power functional equation.

**Depends on.** this roadmap: `WC.7/curve-zeta-jacobian-agreement`; stages: `FunctionFieldArithmetic:FA.3`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

**Sources.**

- `pr196-trace`, Layer 15 curve factors, combined with the Artin–Schreier supplier contract: “curve” — The supplied curve factor and trace statements prove the zeta assertion after the explicitly requested geometric-model/genus computation; these are not assumed fields of a cohomology structure.
- `upstream-algebraic-curves`, Layer 10 Artin–Schreier covers (reduced local invariant, different and genus); Layer 7 Hurwitz; Layer 12B-12E model/places/genus dictionary: “reduced local invariant” — The unchanged owner specifies the reduced-pole characteristic-p calculus and actual normalized projective model. WC.7 specializes its exports through FA.3 instead of defining a second ramification or curve-model theory.

### The sign for the projective plane

`WC.7/projective-plane-functional-equation-sign` · application · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.functional_equation_projective_plane`

For P²/F_q the arithmetic zeta function satisfies Z(P²,1/(q^2T))=-q^3 T^3 Z(P²,T). It is the specialization of the smooth-proper functional equation with χ=3 and Δ=q^3 on the independently realized factors 1-T,1-qT,1-q^2T.

**Proof.**

1. Use the projective-space comparison and the signed smooth-proper theorem. Compute the alternating determinant from the even degrees 0,2,4 as 1*q*q^2=q^3.
2. Check the same identity by substitution in the normalized rational function, using the transcendental T to avoid denominator-zero issues.

**Acceptance.**

- q=2: multiplier -8T^3.
- The coefficient sign is negative because χ=3.
- T is invertible in Q(T); a pointwise identity at T=0 would be ill-typed.

**Depends on.** this roadmap: `WC.7/projective-space-degree-factors`, `WC.6/smooth-proper-functional-equation`; libraries: `mathlib:RatFunc`.

**Sources.**

- `deligne-weil-i`, 2.6, printed 281-282; specialize the projective-space factors: “équation fonctionnelle” — The explicit sign is an application of duality to the actual even-degree example, not a new generic functional-equation proof.

### The multiplicative group and compact support

`WC.7/multiplicative-group-compact-support-agreement` · comparison · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.l_function_multiplicative_group`

For G_m/F_q with constant Q_ℓ coefficients the actual compact-support factors are P_1,c=1-T and P_2,c=1-qT, other factors 1, and L=Z=(1-T)/(1-qT), with N_r=q^r-1. The reciprocal zero 1 has weight 0, and the reciprocal pole q has weight 2. This agrees with the DWP.10 ordinary/compact example and PR196 localization computation; H_c^1 has weight 0 despite degree 1.

**Proof.**

1. Use PR196 TraceFormula 12 localization for P¹, A¹ and the missing point to construct compact cohomology; compare its Frobenius normalization with DWP.10.
2. Apply the mixed-divisor theorem and upstream all-power trace. Ordinary H^0 has scalar 1 and H^1 has scalar q, so substituting ordinary cohomology into the compact-support determinant formula gives the inverse rational function and wrong counts.

**Acceptance.**

- q=2: L=(1-T)/(1-2T), counts 1 and 3.
- Tate twist (1) changes T to T/q, hence shifts both weights by -2.
- The reduced divisor removes canceled equal factors; it does not retain a spurious root.

**Depends on.** this roadmap: `WC.6/mixed-l-function-divisor-weights`; stages: `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.10`, `WC.5`.

**Sources.**

- `pr196-trace`, Layer 12 localization and worked G_m test: “localization” — Independent compact-support calculation tests the mixed divisor conclusion, as distinct from the supplier weight-facing assertion.

**Assembly note.** The stage citation `WC.5` stands for the all-power trace identity `WC.1/cohomological-formula-from-the-trace-formula`.

### Scalar Frobenius from base-field cycle classes

`WC.7/scalar-frobenius-from-base-field-cycles` · theorem · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.frobenius_scalar_of_surjective_base_cycle_map`

Let X_0/F_q be smooth proper and j≥0, ℓ≠p. If the base-field cycle map CH^j(X_0) ⊗ Q_ℓ → H^(2j)(X_{F̄_q},Q_ℓ(j)) is surjective, then geometric Frobenius acts as identity on this twisted cohomology, and as q^j times identity on untwisted H^(2j). Surjectivity from geometric cycles alone is insufficient.

**Proof.**

1. Import EDC.3 cycle map, base-change and Galois-equivariance on the actual Chow group modulo rational equivalence. Every class of a cycle defined over F_q is fixed by geometric Frobenius in the twisted target.
2. Surjectivity forces the endomorphism to be identity on the target. The EDC/PR196 Tate twist has Frobenius q^(-j), so untwisting gives q^j. This proves scalar action, stronger than merely finding eigenvalues; no RH-to-semisimplicity inference is made.

**Acceptance.**

- Hyperplanes on Pⁿ give scalar q^j.
- Spec F_(q^2) has geometric degree-zero cycles spanning cohomology but a nontrivial Frobenius permutation; the base-field map cannot be surjective.
- A rank-zero target is admitted; surjectivity is then automatic and the factor is 1.

**Depends on.** stages: `EtaleDualityAndPerverseSheaves:EDC.3`, `SchemeAndStackFoundations:SF.2`.

**Used here by.** `WC.7/zeta-from-base-field-algebraic-cycles`, `WC.7/all-extension-counts-from-cycles`.

**Sources.**

- `schroer23`, Section 7, Tate-twist discussion p.20 and Proposition 7.1 proof p.21: “homothety” — The source proves the scalar action by base-defined cycle classes and explicitly records f_(i,j)=f_i ⊗ q^(-j).

### Zeta product from algebraic cycles

`WC.7/zeta-from-base-field-algebraic-cycles` · theorem · planet “Zeta functions from algebraic cycles” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.zeta_of_surjective_base_cycles`

Let X_0/F_q be smooth proper geometrically connected of dimension d, ℓ≠p. Assume H^(2j+1)(X_{F̄_q},Q_ℓ)=0 for every j, and each base-field map CH^j(X_0) ⊗ Q_ℓ → H^(2j)(X_{F̄_q},Q_ℓ(j)) is surjective. Then Z(X_0,T)=∏_(j=0)^d (1-q^j T)^(-b_(2j)), where b_(2j)=dim H^(2j). These are the canonical integral degree factors from WC.6, and their ranks are ℓ-independent.

**Proof.**

1. Apply the scalar-Frobenius application in each even degree, yielding det(1-TF)=(1-q^j T)^b_(2j); the odd factors are 1.
2. Use proper compact-support comparison and WC.1 trace determinant identity for the arithmetic zeta; use WC.6 uniqueness to identify the canonical factors and their degrees.

**Acceptance.**

- P² gives three simple denominator factors.
- P¹ × P¹ gives exponent two at 1-qT.
- Odd vanishing cannot be dropped: an elliptic curve has a degree-one numerator.

**Depends on.** this roadmap: `WC.7/scalar-frobenius-from-base-field-cycles`, `WC.6/purity-for-proper-smooth-varieties`; stages: `SchemeAndStackFoundations:SF.2`, `WC.1`.

**Used here by.** `WC.7/all-extension-counts-from-cycles`, `WC.7/surface-count-constant-numerical-picard`.

**Sources.**

- `schroer23`, Proposition 7.1 and proof, printed 20-21: “surjective” — Precisely its base-defined cycle hypothesis and odd vanishing produce the product. Geometric connectedness specifies the b_0=1 used in its nonemptiness conclusion.

**Assembly note.** The stage citation `WC.1` is `WC.1/cohomological-formula-from-the-trace-formula` (the proper determinant identity).

### Counts over every extension from cycle classes

`WC.7/all-extension-counts-from-cycles` · theorem · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.count_extension_of_surjective_base_cycles`

Under the hypotheses of zeta_of_surjective_base_cycles, for every r≥1, #X_0(F_(q^r))=Σ_(j=0)^d b_(2j) q^(jr). In particular #X_0(F_q)≥1 since b_0=1. The same base-field cycles determine all powers of the same Frobenius.

**Proof.**

1. Use the scalar endomorphisms already proved before taking eigenvalues. Their rth powers are scalar q^(jr) with traces b_(2j)q^(jr).
2. Apply the all-power arithmetic trace formula. Equivalently use the formal logarithmic derivative of the established zeta product and compare every coefficient, not only the coefficient of T.

**Acceptance.**

- r=1 recovers the printed formula.
- P¹ × P¹: N_2=(1+q^2)^2.
- At r=0 the trace dimension is not asserted to count points over an undefined F_(q^0).

**Depends on.** this roadmap: `WC.7/scalar-frobenius-from-base-field-cycles`, `WC.7/zeta-from-base-field-algebraic-cycles`; stages: `SchemeAndStackFoundations:SF.2`, `WC.5`.

**Used here by.** `WC.7/surface-count-constant-numerical-picard`.

**Sources.**

- `schroer23`, Proposition 7.1 point-count conclusion and proof, printed 20-21: “linear terms” — The printed conclusion treats r=1; the recorded derivation applies its scalar-action proof to every power, a source-qualified extension rather than a claim that the source states all r.

**Assembly note.** The stage citation `WC.5` stands for the all-power trace identity `WC.1/cohomological-formula-from-the-trace-formula`.

### Surface counts with constant numerical Picard group

`WC.7/surface-count-constant-numerical-picard` · application · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.count_surface_of_constant_num`

Let X_0/F_q be smooth proper geometrically connected of dimension 2. Assume b_1=0, b_2=ρ(X_{F̄_q}), and the numerical Picard local system Num_(X_0/F_q) is constant. Then its canonical factors are P_0=1-T, P_2=(1-qT)^b_2,P_4=1-q^2T, odd factors 1; hence for all r≥1, #X_0(F_(q^r))=1+b_2 q^r+q^(2r). The count at r=1 is over F_q, including nonprime q.

**Proof.**

1. Import the surface-specific numerical-cycle/cohomology comparison: Num(X_{F̄_q}) ⊗ Q_ℓ injects into H^2(X_{F̄_q},Q_ℓ(1)); b_2=ρ makes it an isomorphism. Constancy and finite-field descent give surjectivity from base-defined rational divisor classes. This comparison is not a general equality of numerical and homological equivalence and remains an explicit pending-owner gap.
2. Poincaré duality gives b_3=0 from b_1=0 and b_4=b_0=1. Degree-zero and top-degree cycle classes span after rational coefficients (a positive-degree closed point suffices). Apply the cycle zeta product and all-extension count theorem.

**Acceptance.**

- q=4,b_2=10: N_1=57, not 25.
- Without constant Num, Frobenius may permute divisor classes and trace need not be ρ.
- b_2=ρ is an assumption here, not a consequence of smooth proper purity.

**Depends on.** this roadmap: `WC.7/zeta-from-base-field-algebraic-cycles`, `WC.7/all-extension-counts-from-cycles`; stages: `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `EtaleDualityAndPerverseSheaves:EDC.3`, `SchemeAndStackFoundations:SF.5`.

**Used here by.** `WC.7/twenty-five-point-surfaces`.

**Sources.**

- `schroer23`, Corollary 7.2 and proof, printed 21: “local system” — The corrected field is F_q and the duality deduction is b_3=0. The Num-to-cycle/cohomology passage is imported rather than silently axiomatized.

### Twenty-five points on the surface examples over F_2

`WC.7/twenty-five-point-surfaces` · theorem · planet “Twenty-five point surfaces” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.count_enriques_or_rational_genus_one`

Let X_0/F_q be either an Enriques surface or a smooth projective geometrically rational surface with a relatively minimal genus-one fibration X_0→P¹. Assume its numerical Picard local system is constant. Then #X_0(F_(q^r))=1+10q^r+q^(2r) for every r≥1, and Z=1/((1-T)(1-qT)^10(1-q^2T)). In particular #X_0(F_2)=25 and #X_0(F_4)=57. Relatively minimal genus-one and geometric rationality are both retained in the second case.

**Proof.**

1. Import from the paper-routed surface owners the hypotheses b_1=0 and b_2=ρ=10, together with the genuine Enriques/geometrically-rational definitions. For the rational genus-one case the source uses K^2=0 and a sequence of nine blowups of P²; those invariants and birational constructions are not rebuilt in WC.7.
2. Apply the surface-count consumer and substitute q=2. The arbitrary-r formula is derived from the preceding all-power theorem, extending the source single-count conclusion.

**Acceptance.**

- q=2,r=1:1+20+4=25; r=2:1+40+16=57.
- Blowing up one extra point changes b_2 and the count; it is not a relatively minimal instance.
- The theorem does not assert that every Enriques surface has constant Num.

**Depends on.** this roadmap: `WC.7/surface-count-constant-numerical-picard`.

**Sources.**

- `schroer23`, Corollary 7.3 and proof, printed 21: “25” — The printed geometric hypotheses give the ten-dimensional middle cohomology. The pending paper routes own these surface classes and their invariant computation.

### Maximal count and constant Picard group for rational surfaces

`WC.7/rational-surface-picard-count-criterion` · theorem · planet “Constant Picard group criterion” · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.constant_picard_iff_maximal_count_rational_surface`

Let X_0/F_q be a smooth projective geometrically rational surface (dimension two), with ρ=rank Pic(X_{F̄_q}). Then its étale Picard local system is constant if and only if #X_0(F_q)=1+ρ q+q^2. The associated Frobenius action on the finite-rank free Picard group has finite order. This criterion is for rational surfaces; it is not an assertion about arbitrary Picard schemes with nonzero Pic^0 or torsion.

**Proof.**

1. Import the rational-surface Picard/free-lattice and H^2(1) comparison from the pending numerical-Picard/surface owners; b_1=b_3=0 and b_0=b_4=1. The all-power trace formula gives N_1=1+q Tr(F|Pic ⊗ Q_ℓ)+q^2.
2. A continuous action of the procyclic finite-field Galois group on a discrete finite-rank lattice has finite image, so F has finite order. Its characteristic-zero eigenvalues are roots of unity and it is semisimple for this specific reason.
3. Trace ρ is maximal: after a complex embedding every eigenvalue has real part ≤1, equality of the sum forces every eigenvalue 1; finite-order semisimplicity forces F=1. Conversely constant Picard gives the maximal count by the scalar action. Finite-rank lattice faithfulness passes identity over Q_ℓ back to the lattice.

**Acceptance.**

- A split rational surface satisfies the maximal count.
- For a quadric with exchanged rulings, ρ=2 and trace=0, so N_1=1+q^2 rather than (q+1)^2.
- Purity alone does not imply semisimplicity; the finite-order lattice hypothesis is essential to the converse.

**Depends on.** stages: `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.3`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`, `WC.5`.

**Sources.**

- `schroer23`, Section 7, Corollary 7.2, printed 21; derived converse recorded as paper item /241: “constant” — This is the extraction review supplement, not a printed iff proposition. The proof adds the finite-order lattice/maximal-trace argument to the surface trace formula.

**Assembly note.** The stage citation `WC.5` stands for the trace identity `WC.1/cohomological-formula-from-the-trace-formula`. NeronModelsAndSemistableAbelianVarietiesPartII’s node `G.4/picard-point-count` requests exactly this node’s first step from WC.7.

### Assembled Weil conclusions on actual smooth proper geometry

`WC.7/geometric-weil-assembly` · theorem · WC.6 part · declaration `TauCeti.AlgebraicGeometry.WeilZeta.weil_conclusions_of_smooth_proper`

For an actual smooth proper geometrically connected X_0/F_q of pure dimension d, the arithmetic zeta series equals a normalized rational function in Q(T), equals ∏_i P_i(T)^((-1)^(i+1)) for the canonical P_i in Z[T], and each reciprocal root α of P_i satisfies |σ(α)|=q^(i/2) for every complex embedding. The factors are ℓ-independent and Z has the signed functional equation with Δ and integer χ above; for every r≥1, #X_0(F_(q^r))=Σ_i(-1)^i Tr(F_q^r|H^i). Each assertion has a separate supplier/consumer API. Betti comparison is exported only for an actual smooth proper lifting/comparison family satisfying WC.4, not claimed for every finite-field scheme. The mixed-sheaf API remains the separate reciprocal-divisor upper bound, not an integral-factor assertion.

**Proof.**

1. Combine WC.1 arithmetic rationality/trace, the smooth-proper integral factor consumer, DWP.7 all-conjugates purity, the signed functional equation and WC.5 all-power trace/recurrence. No new cohomology package or assumption equal to RH is introduced.
2. For a supplied WC.4 smooth proper specialization to characteristic zero and a chosen complex comparison fiber, transport dimensions to singular Betti numbers; an arbitrary finite-field scheme need not have such a lifting.
3. Use the concrete comparison/application nodes as mathematical acceptance, including nonprime fields, permutation components, products, signed and negative Euler tests. DWP.10 remains responsible for actual nonprojective/Jordan/Tate realizations. Bookkeeping of source receipts and closure has no declaration.

**Acceptance.**

- Each stated finite-field conclusion uses a genuine scheme and the constructed cohomology.
- The Betti API requires a genuine family; it does not choose a lift for an arbitrary X_0.
- G_m uses the separate mixed theorem; it does not acquire smooth-proper integral pure-degree factors.

**Depends on.** this roadmap: `WC.6/purity-for-proper-smooth-varieties`, `WC.6/smooth-proper-functional-equation`, `WC.6/mixed-l-function-divisor-weights`; other roadmaps: `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`; stages: `SchemeAndStackFoundations:SF.2`, `WC.1`, `WC.4`, `WC.5`.

**Sources.**

- `deligne-weil-ii`, 3.3.9 and 3.3.11, printed 207: “entiers” — Extends the constant-coefficient proper conclusions; the theorem is an application of the independently owned rationality, duality and weights inputs.
- `pr196-trace`, Layers 13-15 and scope boundary: “rationality” — Arithmetic zeta and all-power cohomological trace are supplied upstream. RH and Betti comparison are distinct exports with their own hypotheses.

**Assembly note.** Its stage citations are answered by `WC.1/normalized-integral-zeta-presentation` and `WC.1/cohomological-formula-from-the-trace-formula` (WC.1), `WC.4/betti-comparison-in-a-supplied-family` (WC.4) and `WC.5/extension-count-recurrence` (WC.5).

## Cross-part prerequisites

The WC.0 part plans WC.0–WC.5 and cites nothing in WC.6 or WC.7. The WC.6 part cites the earlier layers only by stage id, 16 times in all (WC.1 four times, WC.2 twice, WC.3 twice, WC.4 once, WC.5 seven times — counting each node once per stage), and files a request with each of those stages. The planning pass of the WC.0 part has since produced the nodes those requests describe. This table gives, for every such citation, the node that answers it, checked statement against statement. The packets are not edited by this job (they are not its deliverables, and they are reviewed); the handoff note lists the replacements for a job that owns them.

| Citation in the WC.6 part | Cited by | What the WC.6 part's request asks | Answering node(s) in the WC.0 part | Fit |
|---|---|---|---|---|
| `WC.3` | `WC.6/purity-for-proper-smooth-varieties`, `WC.6/homology-manifold-weil-assembly` | The generic extraction: from a normalised rational Z with integral expansion and degreewise factors of distinct all-conjugates weights, unique integral factors with multiplicities, independent of the realization, with no projectivity | `WC.3/degreewise-pure-factor-extraction` | Exact. Its hypotheses are a characteristic-zero realization field, nonzero algebraic reciprocal roots of weight i in every embedding, and an alternating product equal to a normalised integral reduced R ∈ ℚ(T); nothing is projective or smooth. Both WC.6 nodes supply these. |
| `WC.1` | `WC.6/purity-for-proper-smooth-varieties`, `WC.6/homology-manifold-weil-assembly`, `WC.7/zeta-from-base-field-algebraic-cycles`, `WC.7/geometric-weil-assembly` | Normalised rational descent of the arithmetic zeta series with integral expansion, for separated finite-type schemes, agreeing with PR196 TraceFormula 13, and the determinant realization for all powers | `WC.1/normalized-integral-zeta-presentation`, `WC.1/zeta-function-euler-product-and-point-counts`, `WC.1/cohomological-formula-from-the-trace-formula` | Exact. The first is stated for separated finite-type X; the second identifies the series with PR196's Layer 13 object; the third is the determinant and trace formula N_r = Σ_i (−1)^i Tr(F_q^r \| H^i_c), all r. |
| `WC.2` | `WC.6/smooth-proper-functional-equation` | The signed determinant-product functional equation on graded Frobenius cohomology with equivariant pairings, tracking Δ, Δ² = q^{dχ}, (−1)^χ and T^χ with integer powers, independent of projectivity | `WC.2/signed-zeta-functional-equation`, with `WC.2/functional-equation-multiplier-descent` for Δ ∈ ℚ | Exact for smooth proper X of pure dimension d, which is this node's hypothesis. The WC.6 node then restates the theorem (see "Structural proposals"). |
| `WC.2` | `WC.6/homology-manifold-weil-assembly` | The same, for a proper X whose dualizing object is Q_ℓ(d)[2d] | none | Not answered. `WC.2/signed-zeta-functional-equation` assumes X smooth and takes its pairing from EDC.2:pairings; the homology-manifold case takes the pairing from EDC.1:biduality. The algebra is the same (the WC.0 part's Lean core `signed_zeta_functional_equation` assumes only graded factor data with the reciprocity and determinant relations), but no node states it for a pairing that does not come from smoothness. The WC.6 part's WC.2 request stays open for this node. |
| `WC.4` | `WC.7/geometric-weil-assembly` | Equality of étale and singular Betti dimensions for an actual smooth proper comparison family, with base, invertible ℓ, geometric fibres and complex embedding named; no universal lifting | `WC.4/betti-comparison-in-a-supplied-family` | Exact. |
| `WC.5` | `WC.7/projective-space-degree-factors`, `WC.7/kunneth-product-agreement`, `WC.7/curve-zeta-jacobian-agreement`, `WC.7/multiplicative-group-compact-support-agreement`, `WC.7/all-extension-counts-from-cycles`, `WC.7/rational-surface-picard-count-criterion`, `WC.7/geometric-weil-assembly` | All-positive-power trace and point-count identities, Newton identities and the recurrence with multiplicities, exact pole orders from the reduced factorization; for curves P_1 = 1 − aT + qT², S_0 = 2, S_1 = a, and reciprocal numerators of degree four | `WC.5/extension-count-recurrence` (Newton identities, recurrences with multiplicities, the curve and elliptic cases); the all-power trace identity is `WC.1/cohomological-formula-from-the-trace-formula`; pole orders come from the reduced pair of `WC.1/normalized-integral-zeta-presentation`, separated by weight in `WC.3/degreewise-pure-factor-extraction` | Answered, in three nodes rather than one. `WC.5/extension-count-recurrence` is algebra on the canonical factors, so it applies to the smooth proper factors of WC.6 as well, although its own prerequisite is the projective node of WC.3. The degree-four reciprocity of the genus-two curve is WC.2's. |

Two further WC.6-part requests concern this roadmap's suppliers and are not cross-part: the SF.2 request (PR196 integration) and the EDC requests (general pairings) stand as filed.

Apart from these citations, three WC.6-part nodes restate WC.0-part nodes without citing them. They are not missing prerequisites, since each WC.6 node reaches the same supplier directly, but the WC.0-part node is the natural prerequisite:

- `WC.7/curve-zeta-jacobian-agreement` restates `WC.1/curve-zeta-numerator-without-rh` (both from PR196 TraceFormula Layers 8 and 15: deg P_1 = 2g, the factors 1 − T and 1 − qT, N_r = 1 + q^r − Tr(F^r | H¹)), adding the identification with WC.6's canonical factor and the reciprocity of the functional equation.
- `WC.7/finite-etale-permutation-factors` restates the dimension-zero half of `WC.5/components-and-dimension-zero` (N_r = c_r and Z = ∏_cycles (1 − T^length)^{−1}), adding the identification of P_0 with WC.6's canonical factor.
- `WC.7/elliptic-curve-over-f5` needs the bridge from a nonsingular Weierstrass equation to its smooth proper scheme, which is also the WC.0 part's gap "Elliptic scheme/Point carrier comparison" for `WC.5/curve-and-elliptic-bound-comparison`. One bridge serves both.

The node graph of the two parts together is acyclic, also through every other packet's nodes that the parts cite.

## Gaps

The two parts record eleven gaps: seven in the WC.0 part and four in the WC.6 part. Each is quoted from its packet, followed by its status in the assembled roadmap.

1. **Private WC snapshot audit** (WC.0 part). The issue names private F.008/F.009/F.010, B.000–B.015, PointCounting.lean, ZetaFunction.lean, Abstract/ and Statement.lean. The private CBirkbeck/WeilConjectures tree is unavailable to this worker. Reconcile its actual declarations, assumptions and statement interfaces against the public source-backed plan before calling WC.0 closed; no private code has been guessed. Needed by: `WC.0/finite-extension-point-tower-comparison`, `WC.0/closed-point-degree-comparison`, `WC.0/geometric-frobenius-realization-comparison`.

   *Status:* Open. The repository is the maintainer’s and is not available to the planning jobs; the maintainer can supply it or release the stage from the audit.

2. **PR196 point, orbit and twist interface registration** (WC.0 part). PR196 at head 4bd72379658126cbe9be935656396f0c9dac4de0 owns FrobeniusGeometry Layers 4–5: finite Hom over Spec k point sets, same-degree extension transport, arithmetic/geometric Frobenius conventions, closed-point/orbit equivalence and residue degree. TraceFormula Layer 13 owns the Euler/exponential zeta and its decomposition/tower laws; Layers 11 and 14 own trace compatibility with finite group actions (equivariance, isotypic factors). The read PR196 head does not construct twisted forms X^σ: effective finite Galois descent for a finite-order σ is requested from SchemeAndStackFoundations:SF.1 (ModularCurves 0E proves effective descent only for affine schemes, polarised relative curves and its other listed cases). Register their stable atlas identifiers, then replace this gap by exact prerequisite links. For twists supply effective descent data (e.g. quasiprojective X), not universal effectiveness. Deligne I (1.1.1) also needs the global finite-type-over-Z norm-Euler/Dirichlet zeta and its convergence interface. The read PR196 TraceFormula Layer 13 only supplies the finite-field series. Request this arithmetic extension from that same zeta owner, with actual Dirichlet/analytic carriers and a proved right half-plane of convergence; do not infer it from the finite-field construction. Needed by: `WC.0/finite-extension-point-tower-comparison`, `WC.0/closed-point-degree-comparison`, `WC.1/zeta-function-euler-product-and-point-counts`, `WC.1/twisted-frobenius-point-comparison`, `WC.1/inverse-zeta-configuration-formula`.

   *Status:* Open until PR196’s layers have atlas identifiers. Its twisted-form part is now also an explicit request to SF.1 (effective descent for a finite-order σ, source issue E-WC0-12), and its arithmetic part (Deligne I (1.1.1) over ℤ) stays with the zeta owner.

3. **PR196 rational realization and trace interface registration** (WC.0 part). EllAdicRealization Layers 4–10 own actual Q_ℓ cohomology, bounded finite dimensions, proper/compact support comparison, continuous Galois actions, Tate twists and rational scalar extensions; FrobeniusGeometry Layer 7 owns the conversion between scheme q-Frobenius pullback, the arithmetic descent action and geometric Frobenius. TraceFormula Layers 8,12–15 own trace/determinant/rationality and curve/Jacobian endpoint/dimension comparisons. Register exact identifiers and supply these actual carriers/maps, not abstract spaces assuming Weil conclusions. Needed by: `WC.0/geometric-frobenius-realization-comparison`, `WC.1/cohomological-formula-from-the-trace-formula`, `WC.1/curve-zeta-numerator-without-rh`.

   *Status:* Open until PR196’s layers have atlas identifiers. The WC.6 part reaches the same layers through its SF.2 request.

4. **PR196 supplied-family rational Artin comparison registration** (WC.0 part). EtaleBaseChange Layers 7–9 own lisse finite-level higher direct images and path transport in a supplied smooth proper family with ℓ invertible. ComplexComparison Layers 10–12 own Artin comparison and products/action compatibility; EllAdicRealization Layer 10 passes to rational coefficients. Supply the actual specified finite-field and complex fibres and path, register their identifiers and prove identity/composition compatibility. No arbitrary characteristic-zero lifting theorem is requested. Needed by: `WC.4/betti-comparison-in-a-supplied-family`.

   *Status:* Open until PR196’s layers have atlas identifiers.

5. **DM stack Part II carriers and trace/purity/comparison** (WC.0 part). The accepted BFP route 7 requests EtaleDualityAndPerverseSheavesPartIIStacks ST.0–ST.6, not yet registered. Needed are actual finite-type DM point groupoids with finite isomorphism classes and automorphisms, weighted trace formula, proper-smooth stack/coarse rational cohomology comparison, all-conjugates Frobenius purity, equivariant perfect Poincaré duality, finite-group twists and local potential semistability. Supply the stated hypotheses of vdBE §3 and BFP §§3,9. This is an additional stack case, not an inference from scheme SF.2 or DWP.7. Needed by: `WC.1/stack-count-comparison`, `WC.1/twisted-frobenius-point-comparison`, `WC.5/local-polynomial-count-cutoff`, `WC.5/approximate-counts-and-tate-semisimplification`, `WC.5/polynomial-counts-over-z-and-tate-cohomology`, `WC.4/equivariant-polynomial-point-counts`, `WC.2/equivariant-polynomial-duality`.

   *Status:* Open. The owner is the proposed stacks Part II (structural proposal 4), the same owner as the WC.6 part’s gap “Finite-field DM stack and algebraic-space exports”.

6. **Kisin–Lehrer source collation and realization compatibility** (WC.0 part). The cited paper is Kisin–Lehrer, Equivariant Poincaré polynomials and counting points over finite fields, J. Algebra 247 (2002), 435–451, DOI 10.1006/jabr.2001.9029. The publisher abstract and citation were checked, but the full primary text was unavailable for collation. Reconcile Proposition 1.2’s exact equivariant comparison hypotheses with the PR196 supplied-family contract. General count lifting in this packet uses the explicit integer irreducible-coordinate criterion already in the pinned virtual-character API, not an assumed general integrality theorem. Needed by: `WC.1/equivariant-count-character-lattice`.

   *Status:* Open. The paper was not available in full; the node uses the integer-coordinate criterion of the pinned virtual-character API instead of Kisin–Lehrer’s integrality.

7. **Elliptic scheme/Point carrier comparison** (WC.0 part). The pinned WeierstrassCurve.pointCount_eq_card_point supplies the exact finite Point cardinal under nonsingularity. The actual projective Weierstrass scheme-to-Point bijection remains needed for the WC scheme-count compatibility. Import it from the elliptic geometry owner rather than constructing a second elliptic curve. Needed by: `WC.5/curve-and-elliptic-bound-comparison`.

   *Status:* Open. The same bridge is needed by `WC.7/elliptic-curve-over-f5`, which requests it from SF.2.

8. **Actual geometric carriers and suggested signatures** (WC.6 part). Pinned matrices, RatFunc, WeierstrassCurve and integral pro-étale cohomology are real existing carriers, but the requested rational adic cohomology, Frobenius, mixed sheaf, cycle-map and scheme/elliptic comparisons are not supplied at the pins. Geometric signatures are omitted in Suggested, explicitly listed there; convention and equation tests use existing carriers. No structure with the desired theorem as proposition fields is introduced. Resolve the requests at their owners before formal signatures can use them. Needed by: `WC.6/purity-for-proper-smooth-varieties`, `WC.6/mixed-l-function-divisor-weights`, `WC.6/smooth-proper-functional-equation`, `WC.6/homology-manifold-weil-assembly`, `WC.6/purity-for-smooth-proper-dm-stacks`, `WC.7/projective-space-degree-factors`, `WC.7/finite-etale-permutation-factors`, `WC.7/kunneth-product-agreement`, `WC.7/curve-zeta-jacobian-agreement`, `WC.7/elliptic-curve-over-f5`, `WC.7/genus-two-negative-euler-example`, `WC.7/projective-plane-functional-equation-sign`, `WC.7/multiplicative-group-compact-support-agreement`, `WC.7/scalar-frobenius-from-base-field-cycles`, `WC.7/zeta-from-base-field-algebraic-cycles`, `WC.7/all-extension-counts-from-cycles`, `WC.7/surface-count-constant-numerical-picard`, `WC.7/twenty-five-point-surfaces`, `WC.7/rational-surface-picard-count-criterion`, `WC.7/geometric-weil-assembly`.

   *Status:* Open. All twenty WC.6-part signatures stay omitted from the Lean file until rational ℓ-adic cohomology with Frobenius, mixed sheaves, cycle maps and the scheme bridges exist.

9. **Finite-field DM stack and algebraic-space exports** (WC.6 part). PAPER-BERGSTROM-FABER-PAYNE-24 route 7 proposes EtaleDualityAndPerverseSheavesPartIIStacks, but no atlas stage IDs or blueprint for it exist in this snapshot. It must supply actual stack cohomology, Rπ_*Q_ℓ=Q_ℓ over F_q, Frobenius/coefficient compatibility, quotient-chart dualizing normalization and the algebraic-space extension of Weil II 3.3.11. SF.1 supplies geometry only. The written vdBE v3 Lemma 3.2 is characteristic zero, so finite-field comparison is not closed by that citation. Use the future exact stage/node ID when created; do not invent an invalid prerequisite now. Needed by: `WC.6/purity-for-smooth-proper-dm-stacks`.

   *Status:* Open; the same owner as the WC.0 part’s gap “DM stack Part II carriers and trace/purity/comparison”.

10. **Numerical Picard and surface realization inputs** (WC.6 part). PAPER-SCHROER-23 routes NumericalPicardAndContractionDescent, EnriquesSurfacesAndIntegralNonexistence and GenusOneFibrationsAndRationalEllipticSurfaces have no stage definitions in this snapshot. Require base-defined divisor descent up to nonzero integer multiples over finite fields, the surface-specific Num ⊗ Q_ℓ → H^2(1) injection and b_2=ρ isomorphism, projective hypotheses or a justified extension for merely proper surfaces, Enriques/rational-genus-one b_1=0,b_2=ρ=10, and rational-surface Pic^0=0/free Picard/H^2 comparison with finite-order Galois action. These geometric/lattice constructions stay at those owners, not in WC.7. Needed by: `WC.7/surface-count-constant-numerical-picard`, `WC.7/twenty-five-point-surfaces`, `WC.7/rational-surface-picard-count-criterion`.

   *Status:* Open. The three Schröer routes have no stages yet.

11. **Supplier proof and example closure** (WC.6 part). The exact generic WC.3 extraction, EDC/WC.2 general signed pairing interface, upstream curve-model/cohomology bridge and DWP.10 nonprojective example remain requested. RD.7 rational rigid-crystalline comparisons retain their owner-recorded original-proof/coefficient gaps; DWP.7 retains its heavy weight-theory source obligations. Imports count as planned ends, not proofs closed by this packet. Verify actual instances and the combined declaration graph when the exports arrive. Needed by: `WC.6/purity-for-proper-smooth-varieties`, `WC.6/homology-manifold-weil-assembly`, `WC.7/genus-two-negative-euler-example`, `WC.7/multiplicative-group-compact-support-agreement`, `WC.7/geometric-weil-assembly`.

   *Status:* Partly answered. Its first item, the generic WC.3 extraction, is now `WC.3/degreewise-pure-factor-extraction`, and the signed WC.2 interface exists for smooth proper schemes (`WC.2/signed-zeta-functional-equation`). Still open: the WC.2 statement for pairings that do not come from smoothness, the general EDC pairing export, the upstream curve-model bridge, DWP.10’s nonprojective example, and the original proofs kept by RD.7 and DWP.7.

## Requests

The two parts file 27 requests: 12 in the WC.0 part and 15 in the WC.6 part. Five of the WC.6 part’s are addressed to this roadmap’s own layers and are answered by the WC.0 part (see “Cross-part prerequisites”). The others stand with their suppliers. They are grouped here by supplier.

- **`WC.1`**
  - (WC.6 part) Normalized rational descent of the arithmetic zeta series, with integral expansion, for separated finite-type F_q schemes; exact agreement with PR196 TraceFormula 13. Supply the finite-dimensional determinant realization for all powers without building a second zeta definition. Needed by: `WC.6/purity-for-proper-smooth-varieties`, `WC.6/homology-manifold-weil-assembly`, `WC.7/zeta-from-base-field-algebraic-cycles`, `WC.7/geometric-weil-assembly`.
    *Status:* Answered by `WC.1/normalized-integral-zeta-presentation`, `WC.1/zeta-function-euler-product-and-point-counts` and `WC.1/cohomological-formula-from-the-trace-formula`.
- **`WC.2`**
  - (WC.6 part) Export the signed determinant-product functional equation on genuine finite-dimensional graded Frobenius cohomology with equivariant Poincaré pairings, tracking Δ, Δ^2=q^(d χ), (-1)^χ and integer powers T^χ, independently of projectivity. The integrated WC.2 trace-of-correspondence node is not this export. Needed by: `WC.6/smooth-proper-functional-equation`, `WC.6/homology-manifold-weil-assembly`.
    *Status:* Answered for smooth proper X by `WC.2/signed-zeta-functional-equation` and `WC.2/functional-equation-multiplier-descent`; open for `WC.6/homology-manifold-weil-assembly`.
- **`WC.3`**
  - (WC.6 part) Refine the stable integrated integral-factors-and-ell-independence-from-purity node to export the RS-17 generic algebraic lemma: from a normalized rational Z with integral expansion and finite degreewise factors of pairwise distinct all-conjugates pure weights, retain multiplicities and obtain unique integral factors independent of the realization. Do not require that the realization arise from a projective scheme. The current exact node is projective-only; keep its ID and separate the generic statement from the projective application. Needed by: `WC.6/purity-for-proper-smooth-varieties`, `WC.6/homology-manifold-weil-assembly`.
    *Status:* Answered by `WC.3/degreewise-pure-factor-extraction`.
- **`WC.4`**
  - (WC.6 part) Export equality of étale cohomology dimensions with singular Betti numbers for an actual smooth proper specialization/comparison family, naming its base trait, invertible ℓ, geometric fibers and characteristic-zero complex embedding. Do not infer that every finite-field scheme lifts. Needed by: `WC.7/geometric-weil-assembly`.
    *Status:* Answered by `WC.4/betti-comparison-in-a-supplied-family`.
- **`WC.5`**
  - (WC.6 part) Export all-positive-power trace/point-count identities, Newton identities and the characteristic-polynomial recurrence with multiplicities, plus exact rational pole orders from the reduced factorization. Specialize to curves including P_1=1-aT+qT^2, S_0=2,S_1=a, and degree-four reciprocal numerators; no one-trace or semisimple shortcut. Needed by: `WC.7/projective-space-degree-factors`, `WC.7/kunneth-product-agreement`, `WC.7/curve-zeta-jacobian-agreement`, `WC.7/multiplicative-group-compact-support-agreement`, `WC.7/all-extension-counts-from-cycles`, `WC.7/rational-surface-picard-count-criterion`, `WC.7/geometric-weil-assembly`.
    *Status:* Answered by `WC.5/extension-count-recurrence`, with `WC.1/cohomological-formula-from-the-trace-formula` and `WC.3/degreewise-pure-factor-extraction` for the trace identity and the pole orders.
- **`ArithmeticGaloisRepresentations:R01.5`**
  - (WC.0 part) Density-one good-prime Frobenius characteristic-polynomial equality for continuous finite-dimensional characteristic-zero G_Q representations implies isomorphic semisimplifications after a common coefficient field, via Chebotarev density and Brauer–Nesbitt. Require the representations unramified at those good primes, include continuity and lattice/finite-quotient input; no splitting of extensions is inferred. Needed by: `WC.5/approximate-counts-and-tate-semisimplification`.
- **`DeligneWeightsAndPurity:DWP.10`**
  - (WC.6 part) Provide actual smooth proper nonprojective, Jordan-block, Tate-twist and ordinary-versus-compact-support examples with the DWP.7 Frobenius normalization, so the zeta-facing assertions in the WC.7 acceptance matrix compare the same objects. This request does not transfer or duplicate their cohomology constructions. Supply an actual smooth proper nonprojective scheme with verified hypotheses and normalization; matrix-only tests are insufficient. The zeta comparisons are distinct consumers. Needed by: `WC.6/purity-for-proper-smooth-varieties`, `WC.7/multiplicative-group-compact-support-agreement`, `WC.7/geometric-weil-assembly`.
- **`DeligneWeightsAndPurity:DWP.4`**
  - (WC.0 part) The proved smooth-projective all-conjugates purity theorem for every reciprocal Frobenius root of actual rational ℓ-adic H^i, with algebraicity and weight i. Do not assume integral/ℓ-independent factors as a premise; WC.3 derives these from the common integral rational zeta. No purity dependency is added to the independent surface branch. Needed by: `WC.3/integral-factors-and-ell-independence-from-purity`.
- **`EtaleDualityAndPerverseSheaves:EDC.1:biduality`**
  - (WC.6 part) Export Verdier duality on the actual constructible adic derived category and the Frobenius-equivariant duality consequence when a^!Q_ℓ=Q_ℓ(d)[2d] over F_q. Its extension to algebraic spaces and DM stacks belongs to the proposed stacks Part II and is recorded separately as a gap. Needed by: `WC.6/homology-manifold-weil-assembly`, `WC.6/purity-for-smooth-proper-dm-stacks`.
- **`EtaleDualityAndPerverseSheaves:EDC.2:pairings`**
  - (WC.0 part) Actual finite-dimensional H^i for smooth proper pure-d schemes, perfect graded Frobenius-equivariant cup pairing H^i×H^(2d−i)→Q_ℓ(−d), graded symmetry and alternating middle pairing in odd d. Supply tensor, finite-group-action and component compatibility; stack cases use their separately recorded Part II. Needed by: `WC.2/signed-zeta-functional-equation`, `WC.2/middle-degree-parity`, `WC.2/equivariant-polynomial-duality`, `WC.5/all-extension-point-count-bound`, `WC.5/components-and-dimension-zero`.
  - (WC.6 part) On actual smooth separated finite-type schemes over F_q, export perfect Frobenius-equivariant H_c^i × H^(2d-i)(d)→Q_ℓ, proper comparison and the q^d untwisted similitude. Include curve/surface extreme-degree and odd-degree dimensions with component hypotheses. The inspected EDC packet only supplies a curve-specific pairing node, not this general export. Needed by: `WC.6/smooth-proper-functional-equation`, `WC.7/surface-count-constant-numerical-picard`, `WC.7/rational-surface-picard-count-criterion`.
- **`EtaleDualityAndPerverseSheaves:EDC.3`**
  - (WC.6 part) Export the actual CH^j cycle map modulo rational equivalence, base-field-to-geometric-base-change and geometric-Frobenius equivariance in Q_ℓ(j), with the Tate normalization q^(-j). For divisor applications supply its intersection-pairing compatibility, but do not assume general equality of numerical and homological equivalence. Needed by: `WC.7/scalar-frobenius-from-base-field-cycles`, `WC.7/surface-count-constant-numerical-picard`, `WC.7/rational-surface-picard-count-criterion`.
- **`EtaleDualityAndPerverseSheaves:EDC.4`**
  - (WC.0 part) For smooth projective complete intersections, repeated ample weak Lefschetz with Frobenius-equivariant ambient Tate classes, middle primitive decomposition and same-multidegree complex Betti dimension comparison. Supply a genuine comparison family or the complete-intersection comparison contract; WC imports it, computes b=b′ (odd n) or b′−1 (even n), and proves the point-count corollary. Needed by: `WC.5/complete-intersection-point-count`.
- **`EtaleDualityAndPerverseSheaves:EDC.8`**
  - (WC.0 part) Instantiate the actual perfect pairing to reciprocal determinant-polynomial identities, invertibility, Δ²=q^(dχ), middle alternating-dimension parity, and the exact middle determinant sign using generalized eigenspaces at ±q^(d/2); retain ℓ=2 characteristic-zero coefficients and no semisimplicity premise. Own the geometric duality theorem, not the WC signed zeta assembly. Needed by: `WC.2/signed-zeta-functional-equation`, `WC.2/middle-degree-parity`, `WC.2/functional-equation-multiplier-descent`.
  - (WC.6 part) Export the degreewise reciprocal polynomials with q^d scaling, full determinant multiplier including middle degree/Koszul sign, and determinant square relation, for the pairings used above. Do not create a zeta object or require smooth projectivity. Needed by: `WC.6/smooth-proper-functional-equation`, `WC.6/homology-manifold-weil-assembly`.
- **`FunctionFieldArithmetic:FA.3`**
  - (WC.6 part) For the existing F_2(x,y), y^2+y=x^5 model, export degree two/separability/nontriviality from its odd reduced pole, the unique rational place over infinity, no finite ramification and different exponent 6, and Riemann–Hurwitz genus 2. Reuse AlgebraicCurves Layer 10 Artin–Schreier covers and reduced local invariants over perfect residue fields, together with Layer 7 different/Hurwitz theory, rather than proving a second ramification theory here. Needed by: `WC.7/genus-two-negative-euler-example`.
- **`PadicHodgeTheory:R06.2`**
  - (WC.0 part) The local extension lemma of vdBE 4.2: a potentially semistable continuous p-adic representation of G_Qp whose Jordan–Hölder constituents are trivial is unramified. Supply the finite-extension/descent hypotheses, filtered (φ,N) calculation Fil⁰=D, Fil¹=0,N=0, and unramified extension-class recognition. Crystalline good reduction is the stronger available scheme input; do not assume Frobenius semisimplicity. Needed by: `WC.5/polynomial-counts-over-z-and-tate-cohomology`.
- **`ReductiveGroupsPartII:RG2.3`**
  - (WC.0 part) Supply Lang’s theorem H¹(k,G)=1 for every smooth connected linear algebraic group over a finite field k, in the generality already routed to RG2.3 by PAPER-LIPNOWSKI-TSIMERMAN-18/lang-theorem. The WC quotient-mass comparison requires nonreductive connected groups as well. No Lang or torsor construction is replanned in WC. Needed by: `WC.1/stack-count-comparison`.
- **`SchemeAndStackFoundations:SF.1`**
  - (WC.0 part) The actual finite-type rational-point carrier/finiteness, finite étale residue extensions and component objects needed by the consuming point comparison; PR196 retains ownership of point/Frobenius/zeta constructions. For the stack-mass comparison supply actual quotient stacks [Y/G], their F_q-point torsor/action groupoids, equivalence with the action groupoid when H¹(F_q,G)=1, and finite locally closed stratification compatibility. This quotient construction is separate from the unregistered DM cohomology Part II. Also supply finite residue fields of closed points of finite-type Z-schemes and finiteness of closed points with bounded residue norm, for the arithmetic Euler-product comparison. Also supply effective Galois descent along F_{q^n}/F_q for quasi-projective F_q-schemes with a finite-order descent datum, so that the twisted form X^σ of a quasi-projective X by a finite-order F_q-automorphism σ exists with X^σ⊗F̄_q≅X⊗F̄_q carrying geometric Frobenius to σF, and is unique up to isomorphism (added by the independent review REV-WeilConjectures--WC.0; no infinite-order σ: see source issue E-WC0-12). Needed by: `WC.1/stack-count-comparison`, `WC.1/inverse-zeta-configuration-formula`, `WC.1/zeta-function-euler-product-and-point-counts`, `WC.1/twisted-frobenius-point-comparison`.
  - (WC.6 part) Export proper coarse algebraic spaces and étale-local finite-quotient charts for finite-type separated DM stacks over F_q with the precise stabilizer hypotheses. This request is for the geometric carrier/coarse construction only; stack cohomology and duality belong to the paper-routed EDC stacks Part II. Needed by: `WC.6/purity-for-smooth-proper-dm-stacks`.
- **`SchemeAndStackFoundations:SF.2`**
  - (WC.6 part) Integrate PR196 TraceFormula 11-15 and EllAdicRealization: actual constructible E-adic sheaves for finite E/Q_ℓ, finite-dimensional compact-support cohomology vanishing above 2 dim X, coherent geometric q-Frobenius and coefficient extension, proper H_c=H comparison, and the determinant formula for the same closed-point Euler-product L-function. Confirm finite coefficient descent into the DWP mixed-sheaf carrier, and agreement of constant coefficients with the existing pro-étale ellAdicSheaf and EllAdicCohomology after the requisite coefficient and classical-étale comparisons. Import upstream constructions, do not replan them or the existing integral cohomology carrier. No suitable SF.2 blueprint node exists in the inspected snapshot. Also export exact agreement with PR196 TraceFormula 7,8,12,15 finite-étale permutation, curve/Jacobian, projective-space, localization and Frobenius-equivariant Künneth examples. No existing SF.2 node has these exact statements. Integrate the existing WeierstrassCurve/affine Equation into the actual smooth proper elliptic scheme without a rival equation carrier. Needed by: `WC.6/purity-for-proper-smooth-varieties`, `WC.6/mixed-l-function-divisor-weights`, `WC.6/smooth-proper-functional-equation`, `WC.6/homology-manifold-weil-assembly`, `WC.7/projective-space-degree-factors`, `WC.7/finite-etale-permutation-factors`, `WC.7/kunneth-product-agreement`, `WC.7/curve-zeta-jacobian-agreement`, `WC.7/elliptic-curve-over-f5`, `WC.7/multiplicative-group-compact-support-agreement`, `WC.7/scalar-frobenius-from-base-field-cycles`, `WC.7/zeta-from-base-field-algebraic-cycles`, `WC.7/all-extension-counts-from-cycles`, `WC.7/rational-surface-picard-count-criterion`, `WC.7/geometric-weil-assembly`.
- **`SchemeAndStackFoundations:SF.5`**
  - (WC.0 part) Own the whole curve-surface theorem: construct Δ and Γ_(F_q^r) on C×C, the two fibre classes and ample A+B; prove graph fixed intersections are transverse and counted by actual extension points, adjunction gives Δ²=2−2g and Γ²=(2−2g)q^r, and the fibre intersections match the chosen orientation. Apply Hodge index to centered divisors D=Δ−A−B,E=Γ−q^rA−B; conclude (N_r−1−q^r)²≤4g²q^r, including g=0 without division. The algebraically closed fibre point P need not be k-rational. No DWP purity, RH or WC.5 root estimate is an input. Needed by: `WC.5:surface-alternative/surface-all-extension-bound-comparison`.
  - (WC.6 part) Supply the surface intersection/Hodge-index inputs needed by the numerical-divisor-to-H^2(1) comparison, with projectivity where its theorem requires it; the numerical Picard local system and descent themselves remain the pending NumericalPicardAndContractionDescent route. Do not apply a projective Hodge-index theorem to an arbitrary proper surface without its separate justification. Needed by: `WC.7/surface-count-constant-numerical-picard`.
- **`tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`**
  - (WC.6 part) Consume the unchanged Layer 12 normalization-of-P¹ model and point/place dictionary for the existing F_2(x,y), y^2+y=x^5 Artin–Schreier extension. In this perfect-base separably-generated instance export the actual smooth projective geometrically connected model and its genus comparison, without re-planning the Tau Ceti construction. This records required availability of its existing interface, not a request to change upstream. Needed by: `WC.7/genus-two-negative-euler-example`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`**
  - (WC.0 part) The existing independent elliptic Hasse theorem for a nonsingular Weierstrass curve over any finite field, with its integer pointCount/frobeniusTrace convention; use only compatibility, not a new elliptic proof or an arbitrary-genus inference. Needed by: `WC.5/curve-and-elliptic-bound-comparison`.
- **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`**
  - (WC.0 part) A finite splitting extension L/Q_ℓ with the extended ℓ-adic norm restricting exactly to the given base norm and complete as a normed field; do not use a separately normalized valuation that rescales its restriction. Supply existence, isometric coefficient embedding, finite polynomial splitting and evaluation in the open unit disc. Needed by: `WC.1/local-fatou-normalization`.
- **`tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences`**
  - (WC.0 part) Using the local/global different comparison and exact tame exponent at every finite prime, prove an everywhere-unramified finite extension L/Q has abs(discr L)=1, including norm/discriminant identification. Combine with the pinned NumberField.abs_discr_gt_two to get degree 1. A continuous representation unramified at every finite prime then has trivial finite quotients; use its stable lattice and congruence quotients to conclude triviality. Needed by: `WC.5/polynomial-counts-over-z-and-tate-cohomology`.

**Imports.** The WC.6 part imports four nodes of other roadmaps by id, recording how it uses each:

- `PadicDifferentialEquationsAndRigidCohomology:RD.7/rigid-crystalline-comparison`: Rational comparison for smooth proper X only; torsion is removed. Ogus with coefficients is recorded there with an unread-original-proof gap.
- `PadicDifferentialEquationsAndRigidCohomology:RD.7/frobenius-compatibility-of-comparison`: Match linear q-Frobenius to φ^f. On the Tate line φ(ae)=p σ(a)e, not the linear map p when f>1.
- `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-proper`: Compare the RD determinant factor with the coefficient image of the unique integral P_i above. Equality follows by the supplier comparison and uniqueness; no duplicate WC comparison theorem is planned.
- `DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`: Import valuation triangles, real-ι qualifications and the dualizing-complex extension. Correct the stale WC pair to (v(α),v(q^w/α)), with v(q)=1, sum w.

## Source issues

The two parts record nineteen mistakes in their sources: twelve in the WC.0 part (two of them added by its review) and seven in the WC.6 part. Every one has an independent verdict, and every one is confirmed; the review of the WC.0 part confirmed E-WC0-5 only in part and removed its second claim. The nodes use the corrected statements. Each entry gives the printed text, the correction, the reason, what it affects, whether a correction was already known, and the verdict.

- **WeilConjectures/E-WC0-1** (error; source `milne-lec`; Author course notes v2.21, Lemma 27.5, printed p. 155, final displayed formal logarithmic identity; proof p. 156). Printed: “over a field k; log(1/Pφ(t)) = Σ_{m≥1} Tr(φ^m|V)t^m/m”. Correction: For the logarithmic identity, require the coefficient field k to have characteristic zero (and the vector space to be finite-dimensional, already implicit in its determinant). The preceding trace/power-sum identity is valid in arbitrary characteristic. The geometric application uses Q_ℓ and is unaffected. Reason: For k=F_p and φ the identity on a one-dimensional space, the m=p coefficient asks for 1/p in F_p, which does not exist; the ordinary formal logarithm is not defined there. The division-free identity (1−T)·Σ_{n≥1}T^n=T does remain valid and is the route used in this packet. This finding concerns the standalone lemma’s stated coefficient generality, not the rationality theorem over Q_ℓ. Affects: a stated result. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-2** (misprint; source `milne-lec`; v2.21 Lemma 27.10 proof, printed p.158). Printed: “|c_i|_ℓ < 1”. Correction: Replace the strict inequality by ≤1. Reason: The normalized denominator 1−T of f=1/(1−T) has coefficient −1 of norm 1. The preceding elementary-symmetric ultrametric argument only gives ≤1; that suffices for the intended integrality conclusion. Affects: the proof. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-3** (gap; source `milne-lec`; v2.21 Summary 27.14(c) proof, printed p.159). Printed: “which implies that P_r,ℓ(t)∈1+tZ[t]”. Correction: Algebraic-integral roots alone give algebraic-integral coefficients, not rational coefficients. Add a Galois-stability/rational descent argument before integrally closed Gauss descent. The WC.3 generic theorem explicitly assumes all-conjugates degreewise weights, as in Deligne I 1.7⇒1.6. Reason: The coprime factors 1−√2T and 1+√2T have integral reciprocal roots and integral product 1−2T², but their individual coefficients are irrational. This witnesses failure of the stated algebraic inference, not a counterexample to the geometric Weil theorem. Affects: the proof. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-4** (misprint; source `bfp-published`; Published Annals 199(2024), Proposition 3.1 proof, printed p.1330 (also arXiv 2206.07759v2 p.6)). Printed: “o(p^(md/2))”. Correction: Use o(p^(ms/2)) in the invocation of vdBE Lemma 4.1. Reason: The proposition assumes cutoff s≥d and its conclusion is in degrees≥s; the exponent d silently strengthens its hypothesis. The generalized graded-moment lemma uses exactly s. Affects: the proof. Known: Already confirmed as PAPER-BERGSTROM-FABER-PAYNE-24/E2; imported finding, not a newly claimed erratum. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-5** (misprint; source `mustata-zeta`; Author-hosted zeta_book.pdf printed p.21, Lemma 3.8 statement and proof; SHA recorded). Printed: “|ω_i|≤g^(1/2); |a_m|≤2g^(m/2)”. Correction: In Lemma 3.8 use q^(1/2) for g^(1/2) and 2g q^(m/2) for 2g^(m/2). Reason: The stated root criterion and following triangle estimate use q, as confirmed by equations 3.8,3.9,3.11–3.12. For genus 0 the correct condition is vacuous; for genus 1,q=4, a root of norm 2 violates the printed norm≤1 while obeying the intended bound. Printed page inspected as an image. Affects: a stated result. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-6** (misprint; source `kedlaya-rh`; Online Lecture 5 Definition 5.1.3 and Lemma 5.1.4 proof). Printed: “|α_i|=q^(−1/2)”. Correction: The α_i are reciprocal roots. Pole exclusion gives |α_i|≤q^(1/2), reciprocal pairing is α↦q/α, and equality is q^(1/2). With indices 1..2g the partner index is 2g+1−i after a compatible reordering, not 2g−i; the logarithmic sum begins N=1, not 0. Reason: A pole of (1−α_i^dT)⁻¹ has modulus |α_i|^(−d), so no poles in |T|<q^(−d/2) implies the upper bound q^(1/2). Positive multiplicities prevent cancellation. The definition and root-radius convention otherwise disagree; the N=0 term divides by 0. Affects: the proof. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-7** (misprint; source `kedlaya-rh`; Online Lecture 5 §5.2, final matrix and determinant). Printed: “q(2g−1); 2(q+1)−2ab#X(F_q)”. Correction: The preceding quadratic is 2gq a²+2(q+1−N)ab+2g b². Its matrix is [[2gq,q+1−N],[q+1−N,2g]], independent of a,b; nonnegative determinant gives 4g²q−(q+1−N)²≥0. Reason: Expand the source’s immediately preceding inequality. The printed matrix coefficients depend on the test variables and do not represent that quadratic; its determinant bound would fail the genus 0 exact count. Affects: the proof. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-8** (error; source `kedlaya-rh`; Online Lecture 5 Lemma 5.2.3(2) and subsequent fibre calculations). Printed: “equality if and only if D=aσ(1,0)+bσ(0,1)”. Correction: Use normalized degree-one fibre classes over the algebraic closure. For pullbacks of hyperplane sections of degree e, divide the inequality’s right side by e² and replace subsequent intersections 1, q by e,eq. Equality concerns numerical equivalence in Néron–Severi⊗R, not equality of divisors. Reason: Hyperplane pullbacks have class eA,eB. Substitution in the degree-one fibre inequality gives precisely the e² correction. A nonzero principal divisor has numerical class 0 and equality, without being a literal linear combination of the two specified effective divisors. SF.5’s requested contract instead uses actual degree-one fibres and only the inequality. Affects: a stated result. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-9** (misprint; source `kedlaya-rh`; Online Lecture 5 Theorem 5.1.5 dimension bound and choice of l). Printed: “q+g/(g+1)√q < l < √q”. Correction: With m=√q+2g and p^μ=√q the Riemann–Roch lower bound uses l+1−g, not l+g−1. Expanding the dimension comparison gives g+g/(g+1)√q<l<√q. Reason: The printed lower bound exceeds its upper bound for every q>1, so no such l exists. With the corrected dimension expression (l+1−g)(m+1−g)−(l√q+m+1−g), positivity is l(g+1)−g(√q+g+1)>0. This proof is outside the packet’s mathematical targets and is not used. Affects: the proof. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-10** (gap; source `bfp-published`; Published Annals 199(2024), Definition 9.1, printed p.1351 (also arXiv 2206.07759v2 p.22)). Printed: “element of the representation ring”. Correction: A general class function gives an element of R_C(G)⊗_Z C, not necessarily R_C(G). To lift integrally require integer irreducible-character coordinates. In Proposition 9.3 these are supplied by actual Betti representation multiplicities; that conclusion is unchanged. Reason: Take the smooth proper finite étale variety Spec F_(q³), with deck group C₃ generated by q-Frobenius g. For σ=1,g,g², σF fixes 0, 0, 3 geometric points, respectively. With ζ₃ primitive, the irreducible-character coordinates are 1, ζ₃,ζ₃², so no integral virtual-character lift exists. This is an explicit counterexample to the generic inference from a class function, while the scalar counts remain integers. Affects: a stated result. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-11** (misprint; source `mustata-zeta`; Author-hosted zeta_book.pdf, printed p.22, proof of Theorem 3.6, the display after “After simplifying, we get”). Printed: “ga² − ab(q + 1 − N1) + gqb² ≥ 0”. Correction: ga² + ab(q + 1 − N1) + gqb² ≥ 0. Reason: Expanding the preceding display −a²(2g−2) − qb²(2g−2) + 2abN1 ≤ 2(a+bq)(a+b) gives 2ga² + 2ab(q+1−N1) + 2gqb² ≥ 0. Since the inequality is used for all integers a,b, replacing b by −b shows the conclusion (q+1−N1)² ≤ 4qg² is unaffected. Affects: nothing. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/E-WC0-12** (error; source `bfp-published`; Published Annals 199 (2024), §9.1, printed p.1351 (also arXiv 2206.07759v2 §9.1, p.21)). Printed: “Let X be a variety over Fq with σ ∈ Aut(X). Then there is a unique twisted form of X, denoted X^σ”. Correction: Require σ to have finite order and X to admit effective descent along F_{q^n}/F_q (for example X quasi-projective); then X^σ exists and is unique up to isomorphism. For σ in a finite group G, as in §9.2 and every application in the paper, nothing changes. Reason: An identification X^σ ⊗ F̄q ≅ X ⊗ F̄q is defined over some F_{q^n}, so it intertwines the n-th powers of the Frobenii: (σF)^n = σ^n F^n = F^n, forcing σ^n = 1. The automorphism σ(x,y) = (y, x + y²) of A² over Fq (inverse (x,y) ↦ (y − x², x)) has iterates of degree 2^{n−1}, so it has infinite order and no twisted form X^σ exists. Affects: nothing. Known: new. Verdict: confirmed by REV-WeilConjectures--WC.0.
- **WeilConjectures/EWC6-1** (misprint; source `deligne-weil-ii`; Proof of 3.3.5, printed 206, published 1980 scan). Printed: “D'apres (3.3.3)”. Correction: Use the upper-weight assertion of 3.3.4 (or 3.3.1), not the integrality refinement 3.3.3. Reason: The argument applies compact-support upper weights to the dual sheaf. That dual is not assumed integral; integrality is not needed for the desired lower-weight conclusion by duality. Affects: nothing. Known: Already recorded in the integrated WeightsInEtaleCohomology source-gap discussion; no published correction located in the searches below. Verdict: confirmed by REV-WeilConjectures--WC.6.
- **WeilConjectures/EWC6-2** (error; source `kedlaya-weil-published`; Section 5.3 consequence (b), printed 1446; also preprint v3 6.6(b), p.52). Printed: “P2n-i(t) = ct^j Pi(t^-1)”. Correction: P_(2n-i)(T)=c T^(b_i) P_i(q^(-n)T^(-1)), where c=(-1)^(b_i) q^(n b_i)/det(F|H^i) and b_i=dim H^i. Reason: Duality pairs α with q^n/α. For P¹ the canonical factors are 1-T and 1-qT: no monomial multiplier of 1-T^(-1) gives 1-qT for q>1. The missing scaling survives into the published paper. Affects: a stated result. Known: Preprint finding already recorded as PadicDifferentialEquationsAndRigidCohomology/E63; this checkpoint collates it against the version of record, not a new discovery claim. Verdict: confirmed by REV-WeilConjectures--WC.6.
- **WeilConjectures/EWC6-3** (gap; source `kedlaya-weil-published`; Section 5.3 proof of consequence (a), printed 1446; preprint v3 p.52). Printed: “Part (a) follows from the Lefschetz trace formula”. Correction: Trace and finiteness first give factors over K. Add rational descent and normalized integral rational-series factorization for the existential rationality statement. To identify the actual smooth-proper degree factors as integral, also use all-conjugates purity and degree separation. Reason: An alternating determinant product alone does not determine or prove integrality of its individual factors. Even equal nonintegral numerator and denominator factors can cancel to 1. WC.3 owns the missing algebraic extraction; no general mixed-factor integrality is inferred. Affects: the proof. Known: Already recorded against the preprint as PadicDifferentialEquationsAndRigidCohomology/E64; the same proof shortcut is present in the published version. Verdict: confirmed by REV-WeilConjectures--WC.6.
- **WeilConjectures/EWC6-4** (misprint; source `kedlaya-weil-preprint`; Last paragraph of proof of 6.6.2, preprint v3 p.51; corrected in published 5.3.2, printed 1446). Printed: “H^i_rig(X/K, f*E^vee)”. Correction: Use H^i_rig(X/K,E) in the injection into H^(i-1)_rig(W/K,F_1) and the concluding lower bound. Reason: F_1 is the cokernel of the vertical connection on E. The published proof states exactly the corrected injection and conclusion. Affects: nothing. Known: Corrected in the published Compositio 142 (2006) proof of Theorem 5.3.2, p.1446; this resolves the version question for RD packet E62. Verdict: confirmed by REV-WeilConjectures--WC.6.
- **WeilConjectures/EWC6-S10** (error; source `schroer23`; Section 7, p. 20 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)). Printed: “The characteristic polynomials of f_{i,j} have coefficients from ℚ, and the eigenvalues α ∈ ℚ^alg are algebraic integers, of length |α| = q^{i/2−j} in all complex embeddings.”. Correction: Untwisted eigenvalues are algebraic integers; after twist j they are scaled by q^(-j), so for j>0 integrality is not guaranteed. Reason: The point with Q_ℓ(1) has scalar q^(-1), which is not an algebraic integer. This packet keeps algebraic weights distinct from integrality. Affects: a stated result. Known: PAPER-SCHROER-23/E10; not a new discovery claim. Published persistence was not checked by this worker. Verdict: confirmed by REV-WeilConjectures--WC.6.
- **WeilConjectures/EWC6-S11** (misprint; source `schroer23`; Corollary 7.2 and its proof, p. 21 (arXiv v3, identical to the author version of 19 July 2022; the published pagination was not seen)). Printed: “If the local system Num_{X/k} is constant, we have Card X(F_p) = 1 + b₂q + q².”. Correction: Replace F_p by F_q in Corollary 7.2 and its count. Reason: q=p^f can be nonprime; q=4 gives 57 in the ten-dimensional example, while its F_2 count is 25. Affects: nothing. Known: PAPER-SCHROER-23/E11; not a new discovery claim. Published persistence was not checked by this worker. Verdict: confirmed by REV-WeilConjectures--WC.6.
- **WeilConjectures/EWC6-S35** (misprint; source `schroer23`; proof of Corollary 7.2, p. 21 (arXiv v3 = author version of 19 July 2022)). Printed: “We have b₀=1, and with Poincaré Duality get b₄=1 and b₁=0.”. Correction: In Corollary 7.2 proof, Poincaré duality gives b_3=0 from the assumed b_1=0. Reason: Repeating b_1=0 misses the odd-degree-3 vanishing used by Proposition 7.1. Affects: nothing. Known: PAPER-SCHROER-23/E35; not a new discovery claim. Published persistence was not checked by this worker. Verdict: confirmed by REV-WeilConjectures--WC.6.

## Structural proposals

The packets of this roadmap make one structural proposal. Three more proposals in other roadmaps' packets concern it, and the assembly finds four overlaps between nodes. None changes a stage of the atlas yet; all await the maintainer.

1. **WC.7 keeps its mathematics** (the WC.6 part, `rescope`). The reviewed library audit classifies WC.7 as a process layer. RS-17 narrows WC.7 rather than dropping it and keeps its zeta-facing comparisons, and PAPER-SCHROER-23 routes six theorems to it. The proposal removes only the process wording from the layer's display (source receipts, publication, closure accounting, which have no nodes) and keeps the fifteen nodes. It supersedes the WC.6 checkpoint's suggestion to move all of WC.7's mathematics away. Status: awaiting the maintainer; the atlas still shows WC.7's original text.
2. **Narrow `WC.6/purity-for-proper-smooth-varieties` to an adapter** (the DWP.7 part, `rescope`, in an accepted packet). DWP.7's node `hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`, part (ii), plans the integral ℓ-independent factors of Weil II 3.3.9 for smooth proper schemes, importing WC.3's lemma, and the WC.6 node derives the same factors from DWP.7's purity and WC.3. The proposal keeps the WC.6 id and reduces the node to its zeta-facing content: the degree-zero and empty-scheme conventions, uniqueness of P_i and the `charpolyRev` normalisation, with the factors imported from DWP.7 (ii). Status: awaiting the maintainer. RS-17 lists proper smooth purity under DWP.7 and the extraction under WC.3, which supports the proposal; the WC.6 node stays as it is until then.
3. **Link WC.3 → RD.7** (the RD packet, `rescope`, unreviewed). RD.7 must identify each characteristic polynomial by weight, which is WC.3's argument; the proposal states the lemma once for any coefficient field of characteristic zero, which `WC.3/degreewise-pure-factor-extraction` now does, and adds the stage link. RS-17 already records the link WC.3 → RD.7 as a one-owner handoff. Status: satisfied by this blueprint on the WeilConjectures side.
4. **A Part II of Étale duality for stacks** (the EDC.0 part, `rescope`, sent back by its review for other reasons). ℓ-adic sheaf theory on Artin and Deligne–Mumford stacks, with an edge to `WC.6/purity-for-smooth-proper-dm-stacks`. This is the owner the WC.6 part's gap "Finite-field DM stack and algebraic-space exports" and the WC.0 part's gap "DM stack Part II carriers and trace/purity/comparison" wait for. Status: awaiting the maintainer.

**Overlaps found in assembly.** Each pair below states compatible results; the narrowing makes one node cite the other.

5. `WC.6/smooth-proper-functional-equation` and `WC.2/signed-zeta-functional-equation` with `WC.2/functional-equation-multiplier-descent`. The WC.2 nodes already prove, for smooth proper X of pure dimension d, the signed equation with Δ² = q^{dχ} and the descent of (−1)^χ Δ to ℚ, which makes Δ rational and independent of ℓ. The WC.6 node adds only that Δ is ± the product of the leading coefficients of the canonical integral factors. Proposal: the WC.6 node cites the two WC.2 nodes in place of the stage WC.2 and keeps that identification.
6. `WC.7/curve-zeta-jacobian-agreement` and `WC.1/curve-zeta-numerator-without-rh`. Proposal: the WC.7 node cites the WC.1 node and keeps the identification with the canonical P_1, the reciprocity P_1(T) = q^g T^{2g} P_1(1/(qT)) and the recurrence.
7. `WC.7/finite-etale-permutation-factors` and `WC.5/components-and-dimension-zero` in dimension zero. Proposal: the WC.7 node cites the WC.5 node for the counts and the zeta function and keeps the identification of P_0.
8. The polynomial-count cluster sits across three layers against their order: `WC.2/equivariant-polynomial-duality` uses `WC.4/equivariant-polynomial-point-counts`, which uses `WC.5/polynomial-counts-over-z-and-tate-cohomology`. The node graph is acyclic, but read at stage level these edges run WC.5 → WC.4 → WC.2. Together with the atlas links WC.2 → WC.3 → WC.4 and the node edges WC.4 → WC.5 (`WC.4/betti-comparison-in-a-supplied-family` is used by three WC.5 nodes) they would close the stage cycles WC.2 → WC.3 → WC.4 → WC.2 and WC.4 → WC.5 → WC.4. Proposal: move the two equivariant nodes into WC.5 as `WC.5/equivariant-polynomial-point-counts` and `WC.5/equivariant-polynomial-duality`, after `WC.5/polynomial-counts-over-z-and-tate-cohomology`. They apply Bergström–Faber–Payne §9 to the polynomial counts that WC.5 owns, and no other packet cites them. Then every edge of the roadmap follows the layer order. WC.5 already shows six planets, so the moved nodes would either drop their planets ("Equivariant palindromicity", "Equivariant polynomial point counts") or join a proposed sub-layer of WC.5 for polynomial counts (PROTOCOL section 14).

Proposals 5–8 are packet edits for a job that owns the packets; the handoff note states them as edits.

## Upstream notes

The WC.0 part records three notes; the WC.6 part none.

- **PR196 (CohomologicalPointCounting).** Its layers have no atlas identifiers and are absent from `reserved-ids.json`; they must be registered before the WC.0 part's PR196 gaps can become prerequisite links. Twisted forms X^σ by a finite-order automorphism are used by the equivariant count but are not constructed at the head read; the family should say whether its descent API covers them. For the maintainer to pass upstream.
- **DeligneWeightsAndPurity, `DWP.0/characteristic-power-series-and-traces`** (atlas-internal). The logarithmic form of the determinant–trace identity needs characteristic zero; its division-free form −tD′/D does not. REV-DeligneWeightsAndPurity--DWP.0 has since corrected that node in exactly this way, so the note is answered at its owner.
- **WeilConjectures WC.6** (atlas-internal). WC.6 consumes the generic extraction of WC.3 while DWP.7 owns proper smooth purity, and the projective application of WC.3 is not to be strengthened to proper schemes without DWP.7. The assembled roadmap does this: `WC.3/degreewise-pure-factor-extraction` is the generic theorem, and `WC.3/integral-factors-and-ell-independence-from-purity` stays projective.

## Dependencies

**Inside the roadmap.** The node graph of the two parts is acyclic. Read at stage level, its edges are:

- WC.0 → WC.1, WC.2, WC.3, WC.4, WC.5 and WC.5:surface-alternative (the point tower, closed points and the Frobenius realization);
- WC.1 → WC.2, WC.3, WC.4, WC.5 and WC.5:surface-alternative (the zeta comparison, the normalised integral presentation, the curve numerator and twists);
- WC.2 → WC.5 and WC.5:surface-alternative (the signed functional equation);
- WC.3 → WC.5 (the projective integral factors);
- WC.4 → WC.5 (the family comparison);
- WC.5:power-sum-converse → WC.5 (the graded approximation lemma) and → WC.5:surface-alternative (the converse and the reciprocal-pairing equality);
- WC.6 → WC.7 (eleven edges);
- and, through the stage citations of the WC.6 part, WC.1, WC.2 and WC.3 → WC.6 and WC.1, WC.4 and WC.5 → WC.7.

Two edges run against the layer order: WC.5 → WC.4 (`WC.5/polynomial-counts-over-z-and-tate-cohomology` → `WC.4/equivariant-polynomial-point-counts`) and WC.4 → WC.2 (→ `WC.2/equivariant-polynomial-duality`). Structural proposal 8 removes them. The atlas's own stage links (WC.0 → WC.1 → WC.2 → WC.3 → WC.4, WC.5, WC.6; WC.4, WC.5, WC.6 → WC.7; WC.5:power-sum-converse → WC.5:surface-alternative; WC.1, WC.2 → WC.5:surface-alternative) are otherwise consistent with the node graph. RS-17 adds WC.5:power-sum-converse → WC.5, which the nodes realise.

**The independence of the surface branch.** The ancestors of `WC.5:surface-alternative/curve-rh-from-surface-bound` are WC.0's point and closed-point comparisons, WC.1's Euler product, cohomological formula and curve numerator, WC.2's signed functional equation, the power-sum converse and SF.5. None of DWP.1, DWP.4, WC.3 or the RH-dependent nodes of WC.5 is among them, as RS-17 requires.

**Across roadmaps.** The incoming edges are listed under "Suppliers", the outgoing ones under "Consumers". RD.7 is both: it consumes WC.1 and WC.3 and supplies WC.6, so the WC.3 → RD.7 → WC.6 path runs in the layer order. No cycle through another packet reaches a node of this roadmap.

## What this blueprint does not claim

- It does not claim that anything is formalised. Every node is `unchecked`. The suggested Lean file proves nothing: its declarations are proved by `sorry`, and elaboration checks only that the statements typecheck.
- It does not prove the Weil conjectures from scratch. Purity is DWP's; points, cohomology and the trace formula are PR196's; duality and cycle classes are EDC's. Their own proofs are their owners' obligations, and the WC.6 part's gap "Supplier proof and example closure" keeps that boundary visible.
- It does not close the geometric layers. WC.0–WC.5, WC.5:surface-alternative, WC.6 and WC.7 are `planned`, with the gaps and requests above; only the numerical WC.5:power-sum-converse is `closed`.
- It does not assert that every variety over a finite field lifts to characteristic zero, that Frobenius acts semisimply, or anything about the analytic continuation of Hasse–Weil L-functions over number fields.
- It does not type the geometric statements. 45 node declarations (25 of the WC.0 part, all 20 of the WC.6 part) are omitted from the Lean file, because their carriers do not exist at the pins; no structure with the desired conclusion as a field replaces them.

## The suggested Lean file

`research/blueprint/suggested/WeilConjectures.lean` joins the two parts' files into one, with one standard note, one import block and the packets' declaration names. It imports Mathlib modules only: neither part's file imported a Tau Ceti module, and the Tau Ceti declarations the packets cite (`WeierstrassCurve.pointCount`, the representation ring) appear only in omitted geometric statements.

- **Order.** The file follows the layers: the WC.1 definitions and algebraic cores (`groupoidMass`, `signedConfigurationCoefficient`, rational-series descent, local Fatou, Möbius inversion), the WC.2 cores (parity, the signed assembly, multiplier descent, base extension), the WC.3 extraction core, the WC.5 definition and cores (`HasPolynomialPointCount`, the all-extension bound, the recurrence), the numerical child in `TauCeti.FiniteSpectrum`, and the WC.6 part's convention examples last.
- **Namespaces.** `TauCeti.PointCounting` and `TauCeti.FiniteSpectrum` as in the WC.0 part. The WC.6 part's examples, which name no declaration, move from the working namespace `TauCetiRoadmap.WeilConjectures.WC6` to `TauCeti.AlgebraicGeometry.WeilZeta`, the namespace its packet gives its declarations.
- **Omitted declarations.** The note at the head of the file lists all 45 omitted node declarations by name, so that every declaration name of the two packets appears in the file.
- **Names.** Every API name and unit-test name of the three definitions appears in the file: API items as theorem names, unit tests as the comment naming the `example` that states them. No name changed.
