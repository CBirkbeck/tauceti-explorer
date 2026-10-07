# Polylogarithms, explicit regulators and Zagier statements

*Roadmap `Polylogarithms`: the complete blueprint, assembled from its six parts.*

This document is definitive. Its machine form is six part packets, and the node sections below are generated from them as their independent reviews left them, so that the two agree node for node:

- `research/blueprint/packets/Polylogarithms.json`: stages P.1–P.6, 75 nodes. Written by BP-Polylogarithms, corrected in place and accepted by REV-Polylogarithms on 24 September 2026, then brought in line with the confirmed red-team findings on the K-theory and topology areas by later fix rounds, the last accepted by REV-FIX-RT-AREA-topology~3 on 2 October 2026. It leaves P.1 `source_decomposed` and P.2–P.6 `partial`.
- `research/blueprint/packets/Polylogarithms--P.2.json`: stage P.2, 14 nodes. Milnor's volume formula with the Lobachevsky function, a certified rational algorithm for D through Kummer's reduction to the unit circle, and the calibration of the weight-two Borel comparison. Written by BP-Polylogarithms--P.2, corrected in place and accepted by REV-Polylogarithms--P.2 on 6 October 2026.
- `research/blueprint/packets/Polylogarithms--P.3.json`: stage P.3, 27 nodes. Goncharov's configuration complexes, the comparison maps from K-theory, the descent of L_3 and the every-family special value in weight three. Written by BP-Polylogarithms--P.3 and corrected in place by REV-Polylogarithms--P.3 on 6 October 2026, whose verdict is `needs_changes`: its mathematics, as corrected, is given here, and a revision is to bind its suggested Lean signatures to the first packet's objects and add discriminating tests (see the P.3 section).
- `research/blueprint/packets/Polylogarithms--P.4.json`: stage P.4, 18 nodes. Specialisation and analytic descent, the logical forms of Zagier's conjecture, the period normalisation in every weight, and the explicit-to-inductive question in weight four. Written by BP-Polylogarithms--P.4, corrected in place and accepted by REV-Polylogarithms--P.4 on 6 October 2026.
- `research/blueprint/packets/Polylogarithms--P.5.json`: stage P.5, 33 nodes. Currents and Green classes, the proof route of Burgos Gil–Feliu–Takeda's comparison with Beilinson's regulator, and the weight-three elliptic formula. Written by BP-Polylogarithms--P.5, corrected in place and accepted by REV-Polylogarithms--P.5 on 6 October 2026.
- `research/blueprint/packets/Polylogarithms--P.6.json`: stage P.6, 2 nodes. The real differential of the single-valued trilogarithm and its exact tests. Written by BP-Polylogarithms--P.6, corrected in place and accepted by REV-Polylogarithms--P.6 on 6 October 2026.

The follow-up packets import the first packet's nodes by id and never restate them; no node id occurs in two packets. This document replaces the six part documents. Each follow-up review corrected its packet and asked that the reader be brought in line at assembly, so the node text here is generated from the corrected packets and none of the part documents' node text is reused. Where a reviewer asked the assembly to carry a correction or a cross-part fact into a node of another packet, an **Assembly note** follows that node; it changes nothing in the packet. The suggested Lean file `research/blueprint/suggested/Polylogarithms.lean` joins the six parts' files. It is a naming proposal, not an implementation, and `implementationStatus` is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This roadmap owns the classical and single-valued polylogarithms and the explicit regulators built from them: the analytic functions Li_n, Zagier's L_n and the Bloch–Wigner dilogarithm D; the weight-two regulator of a number field through the Bloch group, its comparison with Borel's regulator and the volume of ideal tetrahedra; Goncharov's polylogarithmic motivic complexes in weight three and in general weight, with their comparison maps from K-theory; the precise statement of Zagier's conjecture, separated into its existence, comparison and every-family assertions, with the weight-three and weight-four theorems; the regulator complexes of curves and higher cycles, Goncharov's regulator into his Deligne complex and its comparison with Beilinson's regulator, the Chow dilogarithm and the reciprocity laws; and, as precise statements, Leopoldt's conjecture with the p-adic regulator. Its proved endpoints are the low-weight regulator constructions, their K-theory comparisons and their established special-value consequences: Zagier's conjecture for ζ_F(3) and ζ_F(4) (Goncharov; Goncharov–Rudenko). General Zagier, Leopoldt and higher elliptic statements are conjecture declarations with actual source and target objects; they are never assumptions.

- **P.1, classical and single-valued polylogarithms.** Li_n for every integer n, with its principal branch on ℂ ∖ [1, ∞), the jump across the cut, the distribution and inversion relations; Zagier's L_n with the Bernoulli coefficients, its continuity on ℙ¹(ℂ); D with its differential, positivity and five-term relation.
- **P.2, the weight-two regulator.** Descent of D through K3BlochGroups V.3's Bloch group; the embedding-wise regulator of a number field; the Bloch–Wigner cocycle and the comparison with the Borel class up to an explicit rational scalar, whose exact value this layer owns and has not yet computed; the oriented volume of an ideal tetrahedron, vol I(z_1, …, z_4) = D(r(z_1, …, z_4)), with Milnor's Lobachevsky formula; certified rational evaluation of D with an error theorem.
- **P.3, weight-three polylogarithmic complexes.** The explicit groups B_2 and B_3 with the 22-term relation, the complexes B(F; n), n ≤ 3, their residues; Goncharov's configuration complexes and the maps from rational K-theory with their rank-graded domain, the top-degree comparison with Milnor K-theory; the trilogarithm regulator and the weight-three special-value theorem, with its every-family form.
- **P.4, general polylogarithmic statement infrastructure.** Goncharov's inductive groups B_n(F) and δ_n, specialisation, the general complex, the descent of L_n, the Zagier determinant with its normalisation in every weight, Zagier's three assertions and their logical relations, the regulator-compatible comparison, and the weight-four theorem with the explicit complex, the explicit-to-inductive chain map and its lifting obstruction, the weight-four residues and the homotopy conjecture.
- **P.5, curves and regulator complexes** (displayed as three sub-layers). Currents, Poincaré–Lelong, Goncharov's forms r_{m−1}, Chow parameter loci, the Chow polylogarithm and Green currents (P.5:currents); the polylogarithmic complexes of a curve, η(f, g), unramified classes, the Chow dilogarithm and the reciprocity laws (P.5:curves); Goncharov's Deligne complex and regulator, the Arakelov motivic complex, the comparison with Beilinson's regulator through Wang forms, and the weight-three curve regulator with its elliptic Fourier formula (P.5:regulators).
- **P.6, other precise statements and tests.** Leopoldt's conjecture as I.2's statement read through the p-adic regulator, the equivalence of its forms, and the tests the roadmap requires, including the real differential of L_3.

The blueprint has 169 nodes: 75 in the first packet and 14, 27, 18, 33 and 2 in the follow-up packets for P.2–P.6. Every layer is planned:

- P.1 is `source_decomposed` in the first packet.
- P.2–P.6 are `planned` by their follow-up packets. None is `closed`: each still records gaps or supplier requests, listed under Gaps and Requests.
- The first packet's coverage records for P.2–P.6 still read `partial`, with the remaining items the follow-ups answer or refine; each layer section says which remain.

**What is not here.**

- The Bloch group, Suslin's exact sequence, K_3^ind and the Bloch-element certificates: K3BlochGroups V.3–V.6. The pre-Bloch group's five-term relation is imported; D's five-term identity is planned here.
- Borel's classes, regulator, lattice and the proportionality with ζ_F(n): BorelRegulators R.3–R.5, with the normalisation tests of R.7.
- Milnor K-theory, tame symbols, Milnor transfers and Weil reciprocity: K2SymbolsBrauer T.2–T.4.
- Bloch's cycle complexes, the rational Chern character and the general real Deligne–Beilinson complex with its universal regulator: MotivicEtaleKTheory M.4, M.6 and an early part of M.8.
- Adams operations and the coniveau spectral sequence: SchemeKTheoryOperations S.4 and S.6; the plus construction and rational Hurewicz map: GeneralAlgebraicKTheory K.2.
- Hyperbolic 3-space, its metric and volume: Tau Ceti's GeometricTopology layers 7 and 8, with the ideal-boundary interface requested from a Part II of it.
- The completed global-to-local unit map, the strong Leopoldt proposition and its defect: IntegralIwasawaTheory I.2. The p-adic logarithm: ColemanIntegration L0, with the regulator comparison of PadicHodgeRegulators D.1.
- Elliptic specialisations of the curve regulator (dimension, embeddings, periods, torsion): EllipticRegulators ER.2–ER.8.
- Manifold-level hyperbolic volume and Bloch invariants: ArithmeticQuantumTopology QT.5.
- The proof of the weight-four theorem through motivic correlators and cluster polylogarithms: the proposed roadmap "Polylogarithms, explicit regulators and Zagier statements, Part II: weight four via motivic correlators and cluster polylogarithms" (see Structural proposals).
- The real Rogers dilogarithm: planned nowhere yet; this roadmap's P.1 is its proposed owner (see Gaps).

## Boundaries

The roadmap's boundaries follow the atlas stage links, the confirmed red-team findings on the K-theory and topology areas (RT-AREA-ktheory-2/7, /18, /23–/27 and /51; RT-AREA-topology/7 and /8), and the parts' structural proposals. No link map in `research/blueprint/links/` records a link or overlap for this roadmap: every screen that examined it was negative, so the boundaries below rest on the stage links, the packets' prerequisites and requests, and the other packets that cite this roadmap's node ids.

**Suppliers.** These are the prerequisites of the nodes below that lie outside the roadmap.

- **The pinned libraries.** Mathlib supplies the complex logarithm and argument with their derivatives, the series and integrals of analysis (interval integrals, the log-sine integral, the Basel and Riemann zeta values, p-series bounds, Taylor series of the logarithm), Bernoulli numbers and polynomials, the Fourier series of Bernoulli polynomials on the circle, finitely supported functions, quotients, tensor and exterior powers, determinants and traces, cochain complexes with homology, mapping cones and quasi-isomorphisms, representation coinvariants and group homology, projective spaces, chart test functions and distributions, ℤ-lattices, number fields with their infinite places, embeddings, discriminants and Dedekind zeta functions, Dirichlet's unit theorem, valuations and discrete valuation rings, rational functions, p-adic valuations, the algebraic closure of ℚ_p, and Weierstrass curves. Tau Ceti supplies the places of a function field with their orders, residue fields and residue units, the finiteness of the places where a function has a zero or pole, the degree of a principal divisor, and the unit filtration of a local field. The declarations are listed under "What the pinned libraries have". Neither library has Li_n for n ≥ 2, the Bloch–Wigner function, Lobachevsky's function, polylogarithmic complexes or Goncharov's regulator (library audit AUDIT-30: every layer not built).
- **K3BlochGroups V.3, V.4, V.6.** The pre-Bloch group, its five-term relation, the Bloch group and its boundary, the comparison of the antisymmetric tensor quotient with ⋀² (V.3); the cross-ratio, Suslin's exact sequence and map ψ, homological stability and the configuration hyperhomology map (V.4); Bloch-element constructors and five-term certificates (V.6). Cited by node id, and by stage where a Part II export is requested (V.4: Suslin's rigidity B(F) ≅ B(F(t)) and the rational symmetrised resolution).
- **BorelRegulators R.3, R.4, R.5, R.7.** Borel's rank theorem and the compact dual (R.3); the Borel regulator, its universal class, trace cocycle, Tate-divided target coordinates, lattice, determinant and real isomorphism (R.4); the zeta proportionality, functional equation and positive period (R.5); the normalisation adapters and small cases (R.7). The exact weight-two scalar flows the other way: P.2 owns it and R.7 consumes it. R.7 is asked for the conversion of Goncharov's original real normalisations to R.4's coordinates in weights three and n.
- **K2SymbolsBrauer T.2, T.3, T.4.** Milnor K-theory and Matsumoto's theorem (T.2); tame symbols, higher Milnor residues and the norm residue transfer (T.3); Milnor transfers, their transitivity and projection formula, and Weil reciprocity (T.4). T.3 is asked for the degree-three Milnor–Quillen transfer compatibility.
- **MotivicEtaleKTheory M.4, M.6, M.8.** Bloch's simplicial, cubical and mixed cycle complexes with the Levine comparison and the top-two Gersten graph map (M.4); the rational higher Chern character with its weight normalisation (M.6); the general real Deligne–Beilinson complex, products, supports, universal Chern classes and the unit regulator, requested once from an early archimedean prefix of M.8 that the maintainer has to split from M.8's late comparisons.
- **SchemeKTheoryOperations S.4, S.6.** The coniveau differentials and the coniveau Chow group (S.4); Adams operations and number-field rational Adams purity (S.6).
- **GeneralAlgebraicKTheory K.2:plus and KTheoryLowDegrees U.1.** The plus construction, rational primitive Hurewicz, the rank filtration, and the stable general linear group.
- **IntegralIwasawaTheory I.2 and L4; PadicHodgeRegulators D.1; ColemanIntegration L0.** The completed unit map, strong Leopoldt and its defect (I.2); the abelian case by Baker–Brumer (L4); the regulator-specific comparison with the Coleman logarithm (D.1, with ColemanIntegration L0's logarithm nodes).
- **ComplexComparisonPartII C0 and C5; AlgebraicModuliForArithmeticGeometry R09.2 and R09.7.** Analytification and analytic subsets (C0) and an early smooth-manifold interface for global forms, integration, Stokes and torus Fourier expansion (C5, requested as a Part II); Chow parameter spaces and incidence (R09.2, requested as a Part II) and characteristic-zero embedded resolution (R09.7).
- **Tau Ceti GeometricTopology layers 7 and 8; AutomorphicFormsOnReductiveGroups AF.1a.** The curvature −1 metric, Riemannian volume and the hyperbolic model, with the ideal boundary, ideal regions and orientation requested from a GeometricTopology Part II; the degree-three van Est comparisons for GL_2(ℂ), with a measurable-cocycle extension requested.

**Consumers.** These come from the atlas stage links and from the nodes of other packets that cite this roadmap's node ids.

- **EllipticRegulators** ER.2–ER.4, ER.7 and ER.8 cite `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-differential`, `P.1/classical-polylogarithm`, `P.1/distribution-and-inversion`, `P.1/single-valued-continuity`, `P.2/certified-numerics`, `P.5/chow-dilogarithm`, `P.5/chow-dilogarithm-projective-line`, `P.5/chow-dilogarithm-steinberg`, `P.5/regulator-induces-beilinson`, `P.5/unramified-weight-two-class` and `P.5/weight-two-regulator-form`. The atlas links P.2 → ER.2. ER.2 specialises η(f, g) and its Chern comparison to an elliptic curve; it is not a supplier of P.5.
- **HabiroNahmSeries** HB.3, HB.4 and HB.8 cite P.1's classical polylogarithm, distribution relation, D and five-term relation, and `P.2/borel-comparison`; **HabiroNumberFields** HB.2 cites `P.1/classical-polylogarithm`. The atlas links P.1 → HB.3 and P.1 → HB.8.
- **K3BlochGroups** V.3, V.5 and V.6 cite D, its five-term relation, `P.2/borel-comparison`, `P.2/weight-two-regulator` and `P.4/specialization-and-delta`. V.6/regulator-agreement is transport along V.6's algebraic comparison of the P.2 comparison.
- **BorelRegulators** R.7 cites `P.1/bloch-wigner-positivity`, `P.2/bloch-wigner-cocycle`, `P.2/bloch-wigner-descent` and `P.2/weight-two-regulator`; the atlas links P.2 → R.7.
- **ArithmeticQuantumTopology** QT.5–QT.7 cite P.1 and `P.1/bloch-wigner-dilogarithm`, `P.2/bloch-wigner-descent`; QT.5 imports the ideal-tetrahedron identity of P.2 (proposed link P.2 → QT.5).
- **ColemanIntegration** L1–L3 cite P.1's classical polylogarithm, distribution and inversion relations and the stage P.4 (for de Jeu's complexes, see Gaps); **PadicHodgeRegulators** D.2 cites the stage P.4 for the same.
- **NoncommutativeAndEquivariantIwasawa** NE.7 cites `P.6/leopoldt-statement`, which belongs to IntegralIwasawaTheory I.2 under RT-AREA-ktheory-2/26; it should cite I.2.
- **PeriodsAndSpecialValues** PS.9 (link P.1 → PS.9) and **SpecialValuesBirchTate** B.8 take the conjecture statements and the normalised determinant, which P.4 owns (links P.6 → B.8, and P.4, P.6 → B.8's conjecture checkpoint).

**Owners.** Each piece of mathematics that more than one roadmap planned has exactly one owner. The rows that concern this roadmap:

| Mathematics | Owner | Also planned or requested by |
|---|---|---|
| The Bloch–Wigner function and its five-term identity | **P.1** | K3BlochGroups V.3 (reserved ids to retire) |
| The real Rogers dilogarithm, both normalisations | **P.1** (proposed, not yet planned) | K3BlochGroups V.5, HabiroNahmSeries HB.3/HB.4, ArithmeticQuantumTopology QT.5 |
| The analytic weight-two regulator comparison and its exact scalar | **P.2** | K3BlochGroups V.6 (transport), BorelRegulators R.7 (consumer) |
| The oriented ideal-tetrahedron volume D(r) and Milnor's formula | **P.2** | ArithmeticQuantumTopology QT.5 (consumer) |
| Ideal boundary and ideal regions of hyperbolic 3-space | GeometricTopology, Part II (proposed) | P.2, QT.5 |
| Explicit B_2, B_3 and the complexes of weight ≤ 3 | **P.3** | — |
| Inductive B_n, the general complex and the normalised Zagier determinant | **P.4** | SpecialValuesBirchTate B.8 (consumer) |
| The weight-four theorem's proof | Polylogarithms, Part II (proposed) | P.4 (statement and interface) |
| The general weight-two curve form η(f, g) and its Chern comparison | **P.5** | EllipticRegulators ER.2 (elliptic specialisation) |
| The general real Deligne–Beilinson complex and universal regulator | MotivicEtaleKTheory M.8, early prefix (to be split) | P.5, ER.2, PeriodsAndSpecialValues PS.3, BorelRegulators R.7 |
| Goncharov's explicit Deligne complex C_D(X; n) and regulator | **P.5** | — |
| Completed unit map, strong Leopoldt and its defect | IntegralIwasawaTheory I.2 | P.6 (adapter), L4, AutomorphicPadicLFunctions L0 |
| The p-adic regulator and the equivalence of Leopoldt's forms | **P.6** | — |

## Conventions

The six parts wrote the same objects in different notations: the first packet and the P.2 and P.6 parts mostly in ASCII (`pi`, `infinity`, `>=`, `Q^x`, `Lambda^3`), the P.3, P.4 and P.5 parts in Unicode. The node prose below writes π, ∞, ζ(, ≥, ≤, ≠, → and ℚ^× for those ASCII forms; it is converted only outside code spans. Elsewhere each node keeps its packet's letters, and this list fixes their meaning: C, R, Q, Z in the first packet's prose are ℂ, ℝ, ℚ, ℤ; F^x and Q^x are the unit groups F^× and ℚ^×; Lambda^n and Λ^n are exterior powers ⋀^n; Q-bar is ℚ̄. Lean names, code spans, API and test names, locators and the literal source excerpts keep their own form.

- **Branches and Mathlib's conventions.** Li_n is the principal branch on ℂ ∖ [1, ∞), equal on the cut (1, ∞) to its limit from the lower half-plane, because Mathlib's arg of a negative real number is π. Mathlib's log 0 = 0 and arg 0 = 0 are used as they stand: D(0) = D(1) = 0 need no special case. d arg z always means the global one-form v ↦ Im(v/z), never a derivative of the discontinuous principal argument.
- **Single-valued polylogarithms.** L_n(z) = π_n(Σ_{k<n} (2^kB_k/k!) Li_{n−k}(z) log^k|z|) for n ≥ 2, with π_n the real part for odd n and the imaginary part for even n and Mathlib's Bernoulli numbers, B_1 = −1/2. The P.4 and P.6 parts write L̂_n = L_n for odd n and iL_n for even n, and β_k = 2^kB_k/k!; Goncharov's L̂_2 = iD. L_n(∞) = 0. In weight one GR's map {z}_1 ↦ log|z| is a separate convention, not the formula at n = 1.
- **The Bloch–Wigner dilogarithm** is D(z) = Im Li_2(z) + arg(1 − z) log|z| = L_2(z): positive on the upper half-plane, zero on ℝ, D(1/z) = D(1 − z) = D(z̄) = −D(z).
- **Lobachevsky's function** is Milnor's Λ(θ) = −∫₀^θ log|2 sin t| dt, which the first packet writes L(θ). Clausen's function is Cl_2(2θ) = 2Λ(θ). The letter L with a subscript always means a single-valued polylogarithm.
- **Cross-ratios.** Three conventions occur, and each node names the one it uses. GR's [s_1, s_2, s_3, s_4] = (s_1 − s_2)(s_3 − s_4)/((s_1 − s_4)(s_3 − s_2)), with [∞, −1, 0, z] = −z (P.1's five-term relation); Goncharov's r, normalised by r(∞, 0, 1, x) = x (P.2's cocycle and volume, P.5's Chow dilogarithm); and K3BlochGroups V.4's cr, normalised by cr(0, ∞, 1, x) = x. They satisfy r = 1/cr and [a, b, c, d] = 1 − 1/cr(a, b, c, d), so D ∘ r = −D ∘ cr = −D ∘ [ , , , ]. The P.3 part's projected cross-ratio r(i|j, k, l, m) = |ijl||ikm|/(|ijm||ikl|) is GR §7's, the inverse of V.4's; its geometric r′(u, v, w, x) = (u − w)(v − x)/((u − x)(v − w)) is GR's (148).
- **Units and exterior powers.** F^×_ℚ = F^× ⊗ ℚ, written U_F or U in the P.3–P.5 parts and `unitsQ`/`UnitsQ` in Lean, with u(x) the class of x; −1 and roots of unity vanish in it. Alt is the unnormalised signed sum over permutations.
- **Groups and complexes.** B_2(F) = P(F) ⊗ ℚ for K3BlochGroups V.3's pre-Bloch group P(F), with δ_2{x} = (1 − x) ∧ x, the negative of V.3's boundary [x] ↦ x ∧ (1 − x). B_3(F) is P.3's explicit group, written B_3^exp in the P.4 part; B_n(F) in P.4 is the inductive group, written B_n^ind there when both occur. The first packet writes the complexes B(F; n), the P.3 and P.4 parts Γ(F, n): the same complexes, in degrees [1, n] with differential of degree +1 and B_n(F) in degree one. The P.4 part's Γ_exp(F, 4) uses B_4^comb, B_3^exp and B_2. Residues put the uniformiser first: res_v(π ∧ u_1 ∧ … ∧ u_{n−1}) = ū_1 ∧ … ∧ ū_{n−1}.
- **Number fields.** F has r_1 real and r_2 complex places, N = [F : ℚ], discriminant d_F (the P.3–P.5 parts write D_F), real embeddings σ_1, …, σ_{r_1} and one embedding σ_{r_1+1}, …, σ_{r_1+r_2} from each conjugate pair, Mathlib's `InfinitePlace.embedding` choosing it. In weight n the determinant has d_n = r_1 + r_2 rows for odd n and r_2 for even n, and Z_n(y) = π^e |d_F|^{−1/2} det(L_n(σ_i(y_j))) with e = n(N − d_n). The weight-three special value is written either ζ_F(3) = q π^{3r_2}|d_F|^{−1/2} det or det = q √|d_F| π^{−3r_2} ζ_F(3); the second, with q ∈ ℚ possibly zero, is the every-family form.
- **Tate twists and regulators.** ℝ(n) = (2πi)^n ℝ. BorelRegulators R.4's coordinates divide ℝ(n − 1) by its Tate generator, so a comparison of L_n with R.4's regulator carries an explicit π^{n−1} (π² in weight three); the scalar is rational only for Borel's original real normalisation.
- **Currents and Deligne complexes.** Raw currents evaluate as ∫ α ∧ φ. Burgos Gil–Feliu–Takeda's normalisation, used by the P.5 part, is [α](ω) = (2πi)^{−d} ∫ ω ∧ α on a d-fold, δ_Y = (2πi)^{−(d−p)} ∫_Y for codimension p, top Deligne differential −2∂∂̄, and T_m = (−1)^m r_{m−1}; dd^c = (i/π)∂∂̄. Goncharov's C_D(X; n) takes values in ℝ(n − 1) with ℝ(n)-valued closed currents in degree 2n. Converting between the raw and the normalised model in every degree is a recorded gap.
- **Cycles.** Goncharov's affine simplices are Δ^i = ℙ^i ∖ {z_1 + … + z_i = z_0}; BFT's mixed complexes use Δ^m = ℙ^m ∖ {Σ z_i = 0}, matched by z_0 ↦ −z_0. Cubes are □ = ℙ¹ ∖ {1}, with infinity-face normalisation.
- **Elliptic curves.** E = ℂ/(ℤu + ℤv) with A = Im(ū v) > 0, characters χ_γ(z) = exp(2πi Im(z γ̄)/A), Haar measure of mass one, and dz ∧ dz̄ = −2iA μ.
- **p-adic.** log_p is the Iwasawa logarithm on ℂ_p, log_p(p) = 0 (ColemanIntegration L0); the regulator matrix has a column for each of the [K : ℚ] embeddings into ℂ_p.
- **Numbering.** Goncharov–Rudenko is cited at arXiv v3 by the first packet and at v5 (15 July 2026, the version accepted by the Annals; no version of record was available) by all parts; Goncharov's Arakelov-motivic paper at arXiv v3 and at its JAMS version, whose pages and equations differ; Goncharov 1995 by its published page numbers; Burgos Gil–Feliu–Takeda at arXiv v1 (the IMRN text was not served); Goncharov's Deninger paper at arXiv v2. Every source issue says which text it was read in.
- **Identifiers.** Node ids are `Polylogarithms:<layer>/<slug>`; below they are written without the roadmap prefix. P.5:currents, P.5:curves and P.5:regulators are display sub-layers only, and their nodes keep their P.5 ids. Each node's **Library** line gives the module and namespace its packet proposes. The suggested Lean file keeps the parts' namespaces: `TauCeti.Polylog` for the first packet and the P.2 and P.6 parts, `TauCeti.Polylog.WeightThree` for the P.3 part, `TauCeti.Polylog.WeightFour` for the P.4 part and `TauCeti.CurveRegulator` for the P.5 part; the first packet records `TauCeti.Regulator` and `TauCeti.Leopoldt` as namespaces of some modules, and the file places those declarations in `TauCeti.Polylog`.

## Sources

Every statement below is taken from these sources, at the versions recorded. The parts gave the same document different source ids, and each node keeps the id its packet uses; this list groups the ids by file (the same SHA-256, or the same URL where no hash is recorded), and gives the sections each part read. Excerpts are quoted literally from the version named. The primary sources are Goncharov–Rudenko (P.3, P.4), Goncharov's papers of 1994, 1995, 2000 and 2005 and his Deninger paper (P.3–P.6), Zagier's dilogarithm survey and his 1990 paper (P.2, P.4), Milnor's survey (P.2), Burgos Gil–Feliu–Takeda and Burgos's thesis (P.5), Suslin (P.4), Demailly (P.5), Neukirch–Schmidt–Wingberg (P.6) and Weibel's K-book (P.2).

- **Alexander Goncharov and Daniil Rudenko, *Motivic correlators, cluster varieties and Zagier's conjecture on ζ_F(4)*.** arXiv:1803.08585v3, 26 April 2022
  - Source ids: `GR.2022` (first packet).
  - URL: https://arxiv.org/abs/1803.08585
  - SHA-256 `9a64439247df10f0d0f41a2a304c8b152392d1521a4051b1fe4fd9239c78b093`.
  - Read by the first packet: Abstract and 1.1, items 1 to 6: the classical n-logarithm, the single-valued L_n, Zagier's conjecture, functional equations, the polylogarithmic motivic complexes, the condition o_n and Theorems 1.1, 1.2 and 1.3 (PDF pp. 2-6); Review (REV-Polylogarithms): pp. 1-16, the opening of Section 5 and Section 9.3; footnotes 1, 2, 4 and 6; page images checked for the glyph *_n and for 'n > 1'.
- **Alexander B. Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes*.** arXiv:math/0207036v3, 17 June 2004; published as J. Amer. Math. Soc. 18 (2005) 1-60, with the same theorem numbering and different equation numbers
  - Source ids: `Gonch.Arakelov.2004` (first packet), `goncharov-v3` (P.2 part).
  - URL: https://arxiv.org/abs/math/0207036
  - SHA-256 `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db`.
  - Read by the first packet: Abstract and the introduction, on the weight-n regulator to the Deligne complex, the Grassmannian polylogarithms, the recovery of Lobachevsky's volume formula at n = 2 and the Chow dilogarithm with its reciprocity law strengthening Suslin's for Milnor K_3 on curves (PDF p. 1); Section 1 (Introduction) read in full from the arXiv e-print LaTeX source, whose SHA-256 is fa6ea8977eb6e95d07110f170e158511cde856fb40d2c3f05e350206978432be and whose PDF hash is the one recorded above: Beilinson's conjectures and the one case in which the regulator comparison is known; the regulator map on motivic complexes, the Arakelov motivic complex in its complex, real and number-field forms, the higher Arakelov Chow groups and the two Problems, of which the first is the comparison with Beilinson's regulator; the Chow n-logarithm function; the Chow dilogarithm with the explicit cross-ratio formula on the projective line and the functional equations from the boundary; and the Grassmannian n-logarithm; Section 2 (Arakelov motivic complexes): Theorem-Construction 2.3 (the canonical map of complexes and its real form), the definition of the forms r_{m-1} in item 4, Theorem 2.4 with Lemma 2.5 (convergence and the distribution homomorphism), Definition 2.13 (the higher Arakelov Chow groups) and Proposition 2.14 with its proof (the identification with the Gillet-Soule arithmetic Chow group); Section 3 (The Chow polylogarithms) read in full: the spaces of cycles with their face and vertex maps, Theorem-Construction 3.1 with the three identities and the Radon-transform proof, the cocycle interpretation, Theorem 3.3 (torus invariance of the top member) with the remark that it fails below the top, and its reformulation; Section 6 (The Chow dilogarithm and a reciprocity law) read in full: the polylogarithmic complexes and their residues, Proposition 6.1, Conjecture 6.2 with its two conditions and the remark comparing it with Suslin's law, Conjecture 6.3 in general weight, Theorem 6.5 and Proposition 6.6 (the projective line, modulo 6-torsion), Theorem 6.10 (families of curves and the differential identity), Theorem 6.12 (an arbitrary curve over the algebraic numbers) with Lemma 6.13, and Theorem 6.14 with Lemmas 6.15 and 6.16 and Propositions 6.17 and 6.18 (the elliptic curve, explicitly); Not read: Sections 4 and 5 (the Grassmannian polylogarithms and their relation with the symmetric space of the special linear group, through which the source constructs the Borel regulator) and Section 7 (the appendix on volumes of simplices in symmetric spaces). Those are the content of BorelRegulators and are recorded as a gap; Review (REV-Polylogarithms): Sections 1, 2, 3 and 6 re-read from the e-print TeX source and the PDF, with the published JAMS text compared at every source issue (SHA-256 of the JAMS PDF 36de73ac0fbc242e52f858e20c7e22839b050bc65cab54426505b662f36617be).
  - Read by the P.2 part: Sections 5.4–5.6 and Appendix 7; compared with the published version at the elementary-matrix calibration.
- **Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*.** Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
  - Source ids: `Kbook.2013` (first packet).
  - URL: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf
  - SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
  - Read by the first packet: VI.5.1 to VI.5.4.1: the pre-Bloch group, the antisymmetric tensor quotient, the Bloch group and the element c (PDF pp. 495-497); Review (REV-Polylogarithms): VI.5.1 to VI.5.4.1 re-read (PDF pp. 486-497).
- **Alexander Goncharov and Daniil Rudenko, *Motivic correlators, cluster varieties and Zagier's conjecture on ζ_F(4)*.** arXiv:1803.08585v5, 15 July 2026, final version, accepted for publication in Annals of Mathematics
  - Source ids: `GR.2026` (first packet), `GR5` (P.3 part, P.4 part).
  - URL: https://arxiv.org/abs/1803.08585v5
  - SHA-256 `d7694f411ff344af087768a951a871aef6ebd4bbed571af6d6c045560d6ed8df`.
  - Read by the first packet: pp. 1-16: Conventions, Section 1.1 (items 1 to 6, Theorems 1.1 to 1.3, Conjecture 1.4), Section 1.2 (the explicit groups B_2 and B_3, the 22-term relation), Definition 1.11 and Theorem 1.14; Sections 7.2 and 7.3 (pp. 64-65).
  - Read by the P.3 part: §1.2 B3 presentation and Theorem 1.8; §5.1 pp. 53–56, Lemmas 5.1–5.2 and Proposition 5.4; §7.1–7.3 pp. 61–68, including the normalization footnote 16.
  - Read by the P.4 part: §1.1 pp. 3–8: inductive groups, determinant, theorem and conjectural comparison; §1.2 pp. 9–18: explicit presentations, Theorems 1.13–1.14 and complex (44); §8.1–8.2 pp. 72–78: complex and real period conventions; L₄* differs pointwise from L₄; §9.3 pp. 91–94: proof completion and regulator interfaces; full §§2–7 and §10 proof remains with the Part II owner.
- **J. I. Burgos Gil, E. Feliu and Y. Takeda, *On Goncharov's regulator and higher arithmetic Chow groups*.** arXiv:0909.5296v1; published in Int. Math. Res. Not. IMRN 2011, no. 1, 40-73
  - Source ids: `BFT.2011` (first packet), `BFT` (P.5 part).
  - URL: https://arxiv.org/abs/0909.5296
  - SHA-256 `63155506c01244497f732d6d57cf78b979a18cbbe24cbca8fade1da99f359cd5`.
  - Read by the first packet: Abstract, introduction, Section 5.2 with Remark 5.12 and Theorem 5.13, Section 6.1, Theorem 6.18.
  - Read by the P.5 part: Sections 1–7, complete 24-page text.
- **J. Neukirch, A. Schmidt and K. Wingberg, *Cohomology of Number Fields*.** Second edition, Grundlehren 323; electronic edition 2.3 (18 May 2020), hosted by the authors
  - Source ids: `NSW.2013` (first packet).
  - URL: https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf
  - SHA-256 `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91`.
  - Read by the first packet: Chapter X, Section 3, (10.3.3) to (10.3.6), pp. 626-628.
- **John Milnor, *Hyperbolic geometry: The first 150 years*.** Bulletin of the AMS 6 (1982), 9–24, publisher PDF
  - Source ids: `milnor1982` (P.2 part).
  - URL: https://www.ams.org/journals/bull/1982-06-01/S0273-0979-1982-14958-8/S0273-0979-1982-14958-8.pdf
  - SHA-256 `d444d7a61af54c7c3be374149917560103b614bd2afa02c6d0cb54fb06c4063f`.
  - Read by the P.2 part: Appendix, pp.17–20: definition, Lemma 1 and Fourier equation (2), Lemma 2 and its complete half-space integral proof.
- **Don Zagier, *The Dilogarithm Function*.** Frontiers in Number Theory, Physics, and Geometry II (Springer, 2007), 3–65; author-hosted chapter
  - Source ids: `zagier-dilog` (P.2 part).
  - URL: https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf
  - SHA-256 `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0`.
  - Read by the P.2 part: I.3, pp.10–11: D, Kummer equation (2), unit-circle Fourier series, symmetries and five-term identity; I.4, pp.13–14: ideal tetrahedra, cross-ratio convention, equations (5)–(8).
- **Alexander B. Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes*.** JAMS 18 (2005), 1–60, version of record; DOI 10.1090/S0894-0347-04-00472-2
  - Source ids: `goncharov-jams` (P.2 part), `G05` (P.5 part).
  - URL: https://www.ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf
  - SHA-256 `36de73ac0fbc242e52f858e20c7e22839b050bc65cab54426505b662f36617be`.
  - Read by the P.2 part: Introduction, weight-two formula (11); section 2 definition of unnormalized Alt; Section 5.1–5.6, pp.32–42: boundary cohomology, beta_DR, trace class, equations (63)–(74), complete proof of Theorem 5.7; Appendix 7.1–7.2, pp.55–57: Theorem 7.1, its proof and distributional volume calculation.
  - Read by the P.5 part: Section 2, pp. 9–22; Section 3, pp. 22–25; Section 6, pp. 45–56, compared with accepted parent nodes.
- **A. B. Goncharov, *Geometry of Configurations, Polylogarithms, and Motivic Cohomology*.** Advances in Mathematics 114 (1995), 197–318; author-hosted published scan
  - Source ids: `G95` (P.3 part, P.4 part).
  - URL: https://sasha-goncharov.github.io/Advances1995.pdf
  - SHA-256 `434fd9093d2e27e96fae240f8f591ca532baa2f9cc7cdfeb8bc087f5235f5344`.
  - Read by the P.3 part: §1 pp. 197–222; §1 transfers pp. 239–241; §2.5–2.6 pp. 256–259; §3 pp. 264–266; §5 conclusion pp. 291–293; §6 pp. 295–298; §7 pp. 298–303; §8 pp. 304–308; §9 pp. 308–311; §10 Lemma 10.1 p. 312.
  - Read by the P.4 part: §1.9 published pp. 220–225, especially Lemma 1.16, Proposition 1.18, Corollary 1.19 and quotient model; §1.14–1.15 residues and Conjecture 1.39, published pp. 236–241.
- **Jianqiang Zhao, *Supplement to: Goncharov’s Relations in Bloch’s higher Chow Group CH³(F,5)*.** arXiv:math/0311111v1 (7 November 2003)
  - Source ids: `Z03` (P.3 part).
  - URL: https://arxiv.org/pdf/math/0311111
  - SHA-256 `1d52004a29beeee815b1a25fa90e9ea2092226338623801329d4936c3680a5e2`.
  - Read by the P.3 part: p. 2 formula (3) and its nondegeneracy conditions; used only to cross-check the coordinate sign.
- **A. B. Goncharov, *Polylogarithms and motivic Galois groups*.** Author-hosted 50-page typeset manuscript of the 1994 Proceedings of Symposia in Pure Mathematics 55, Part 2, contribution; locators use manuscript pagination and numbering.
  - Source ids: `G94` (P.4 part).
  - URL: https://sasha-goncharov.github.io/SeattleMotives.pdf
  - SHA-256 `e664e340573fcadd339e46c8d4a105a00f4cae0700622884455c4c9c60c55225`.
  - Read by the P.4 part: §1.4 Definitions and inversion pp. 6–7; §1.5 Theorem-motivation 1.15 and complete scalar descent proof pp. 7–9; Example 1.18 p. 10; §2.3 Remark 2.4 and Conjecture 2.5 pp. 13–14.
- **Don Zagier, *Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields*.** Arithmetic Algebraic Geometry (Texel, 1989), Progress in Mathematics 89 (1990), pp. 391–430; author-hosted published scan.
  - Source ids: `Z90` (P.4 part).
  - URL: https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf
  - SHA-256 `96bbb5f616dfac26e28c1da4657b2c5ae9cefa462213279797ccd44b71e1bb19`.
  - Read by the P.4 part: Introduction pp. 391–394: completed-zeta equation (1) and polylogarithm series (2), p. 392; Borel rank equation (3) and subsequent unnumbered regulator/period formula, p. 393; §7 pp. 410–415: polynomial/Bernoulli normalization, Proposition 3, endpoint convention; §8 pp. 415–417: two relation models and final regulator-compatible conjecture.
- **A. A. Suslin, *K₃ of a field and the Bloch group*.** English translation, Proceedings of the Steklov Institute of Mathematics (1991), issue 4, pp. 217–239; scan hosted by Herbert Gangl. Original Russian article is volume 183 (1990), pp. 180–199.
  - Source ids: `S91` (P.4 part).
  - URL: https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf
  - SHA-256 `ef16d5d93f6f9f6509f93e9b748f5cf06bda2a2a2da852404375638bab12994c`.
  - Read by the P.4 part: §5 pp. 233–238, particularly Theorem 5.2, Corollary 5.6 and Remarks 5.1–5.2 p. 237–238.
- **A. B. Goncharov, *Deninger’s conjecture on L-function of elliptic curves at s=3*.** arXiv:alg-geom/9512016v2 (2 February 1996); regenerated PDF internal date November 5, 2018
  - Source ids: `D96` (P.5 part).
  - URL: https://arxiv.org/pdf/alg-geom/9512016v2
  - SHA-256 `8e0798f9d67fbbd4ca14a2da386e130e8efb5785a5f01304ac3c268a6e0d3712`.
  - Read by the P.5 part: Section 1 definitions; Section 2 residue construction; Section 3 complete regulator and Fourier proof; appendix sign correction.
- **A. B. Goncharov, *Explicit regulator maps on polylogarithmic motivic complexes*.** arXiv:math/0003086, public text
  - Source ids: `G00` (P.5 part), `Goncharov.2000.explicit` (P.6 part).
  - URL: https://arxiv.org/pdf/math/0003086
  - SHA-256 `47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea`.
  - Read by the P.5 part: Section 2, Theorem 2.2 and explicit n=3 formula; Section 3 construction; Section 4 pp. 17–22, differential calculation and descent proof of Theorem 2.5(i).
  - Read by the P.6 part: §2 item 1, printed p. 3: polylogarithms, parity projection, coefficients and Lhat_2 = iD; §2 item 4, printed pp. 4–5: alpha and the weight-three example; §2 item 6, equation (15), printed p. 7: Lhat_{p,q}; §4 Proposition 4.1 and its complete proof, equations (28)–(38), printed pp. 17–20.
- **Jean-Pierre Demailly, *Complex Analytic and Differential Geometry*.** Public author manuscript, version served on 2026-10-06
  - Source ids: `DEM` (P.5 part).
  - URL: https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf
  - SHA-256 `d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1`.
  - Read by the P.5 part: Chapter I §2, pp. 13–20; §3.E, pp. 28–29; Chapter III §2.B–C, pp. 140–144.
- **José Ignacio Burgos Gil, *Anillos de Chow aritméticos*.** Universitat de Barcelona PhD thesis, 1994; public author PDF
  - Source ids: `BUR` (P.5 part).
  - URL: https://www.icmat.es/miembros/burgos/files/tesis.pdf
  - SHA-256 `65a531b4ed7cc8d0f1318645aaa7003a0d685e65ae7706fc01249fdb3fe8457c`.
  - Read by the P.5 part: Chapter II §3 complete, pp. 72–78; §4.1–4.7, pp. 79–82; local basic-Green representative proof.
- **Peter Schneider, *Introduction to the Beilinson conjectures*.** Beilinson’s Conjectures on Special Values of L-Functions, Perspectives in Mathematics 4 (1988), published chapter scan
  - Source ids: `SCH` (P.5 part).
  - URL: https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf
  - SHA-256 `9693e4a34e8aa8d6c92899b2ba2ce9735615de4758d536d8dc25d9b20f9ea88b`.
  - Read by the P.5 part: Section 4, pp. 27–29, higher Chern character and its product normalisation.
- **Jan Nekovář, *Beilinson’s conjectures*.** Public author copy, chapter §§7.3–7.4; printed page 23
  - Source ids: `NEK` (P.5 part).
  - URL: https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf
  - SHA-256 `3b6ba59cb8338b59fd8206318b2a91c3588ca09545522d6fb33717287924eacd`.
  - Read by the P.5 part: Sections 7.3–7.4, equations (7.3.1),(7.3.2),(7.4.1); not the erroneous degree-two display in §7.5.

**The versions read.** Each part records the files it opened. A finding about a stated result is scoped to the version it was read in (see Mistakes found in the sources).

- preprint: https://arxiv.org/pdf/1803.08585v3, SHA-256 `9a64439247df10f0d0f41a2a304c8b152392d1521a4051b1fe4fd9239c78b093`, read 2026-09-24 (first packet).
- preprint: https://arxiv.org/pdf/1803.08585v5, SHA-256 `d7694f411ff344af087768a951a871aef6ebd4bbed571af6d6c045560d6ed8df`, read 2026-09-24, 2026-10-06 (first packet, P.3 part, P.4 part). The final version, accepted by the Annals of Mathematics; the journal version was not yet available. v5 dated 15 July 2026. Independently checked PDF and public metadata; no correction to (142) or (144) located. Annals forthcoming listing checked on 2026-10-06; findings concern this preprint version.
- preprint: https://arxiv.org/pdf/math/0207036v3, SHA-256 `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db`, read 2026-09-24, 2026-10-05 (first packet, P.2 part).
- published: https://www.ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf, SHA-256 `36de73ac0fbc242e52f858e20c7e22839b050bc65cab54426505b662f36617be`, read 2026-09-24, 2026-10-05 (first packet, P.2 part).
- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, read 2026-09-24 (first packet).
- preprint: https://arxiv.org/pdf/0909.5296v1, SHA-256 `63155506c01244497f732d6d57cf78b979a18cbbe24cbca8fade1da99f359cd5`, read 2026-09-24, 2026-10-06 (first packet, P.5 part).
- author copy: https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf, SHA-256 `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91`, read 2026-09-24 (first packet).
- published: https://www.ams.org/journals/bull/1982-06-01/S0273-0979-1982-14958-8/S0273-0979-1982-14958-8.pdf, SHA-256 `d444d7a61af54c7c3be374149917560103b614bd2afa02c6d0cb54fb06c4063f`, read 2026-10-05 (P.2 part).
- author copy: https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf, SHA-256 `05079cf525c6ba0f0d00b5c0d948bad202d291bc4910149d5d4abbab0515e7a0`, read 2026-10-05 (P.2 part).
- published: https://sasha-goncharov.github.io/Advances1995.pdf, SHA-256 `434fd9093d2e27e96fae240f8f591ca532baa2f9cc7cdfeb8bc087f5235f5344`, read 2026-10-06 (P.3 part, P.4 part). Published author-hosted scan; section list records exactly the passages read.
- preprint: https://arxiv.org/pdf/math/0311111, SHA-256 `1d52004a29beeee815b1a25fa90e9ea2092226338623801329d4936c3680a5e2`, read 2026-10-06 (P.3 part).
- author copy: https://sasha-goncharov.github.io/SeattleMotives.pdf, SHA-256 `e664e340573fcadd339e46c8d4a105a00f4cae0700622884455c4c9c60c55225`, read 2026-10-06 (P.4 part).
- published: https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf, SHA-256 `96bbb5f616dfac26e28c1da4657b2c5ae9cefa462213279797ccd44b71e1bb19`, read 2026-10-06 (P.4 part).
- published: https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf, SHA-256 `ef16d5d93f6f9f6509f93e9b748f5cf06bda2a2a2da852404375638bab12994c`, read 2026-10-06 (P.4 part).
- published: https://ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf, SHA-256 `36de73ac0fbc242e52f858e20c7e22839b050bc65cab54426505b662f36617be`, read 2026-10-06 (P.5 part).
- preprint: https://arxiv.org/pdf/alg-geom/9512016v2, SHA-256 `8e0798f9d67fbbd4ca14a2da386e130e8efb5785a5f01304ac3c268a6e0d3712`, read 2026-10-06 (P.5 part).
- preprint: https://arxiv.org/pdf/math/0003086, SHA-256 `47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea`, read 2026-10-06 (P.5 part).
- author copy: https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf, SHA-256 `d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1`, read 2026-10-06 (P.5 part).
- author copy: https://www.icmat.es/miembros/burgos/files/tesis.pdf, SHA-256 `65a531b4ed7cc8d0f1318645aaa7003a0d685e65ae7706fc01249fdb3fe8457c`, read 2026-10-06 (P.5 part).
- published: https://academic.oup.com/imrn/article-pdf/2011/1/40/1882629/rnq066.pdf, read 2026-10-06 (P.5 part).
- published: https://link.springer.com/content/pdf/10.1007/BF02362333.pdf, read 2026-10-06 (P.5 part).
- published: https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf, SHA-256 `9693e4a34e8aa8d6c92899b2ba2ce9735615de4758d536d8dc25d9b20f9ea88b`, read 2026-10-06 (P.5 part).
- author copy: https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf, SHA-256 `3b6ba59cb8338b59fd8206318b2a91c3588ca09545522d6fb33717287924eacd`, read 2026-10-06 (P.5 part).
- preprint: https://arxiv.org/pdf/math/0003086v1, SHA-256 `47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea`, read 2026-10-06 (P.6 part).

## What the pinned libraries have

The reviewed library audit AUDIT-30 records every layer of this roadmap as not built. The pinned Mathlib has the complex logarithm and argument, the Taylor series of −log(1 − z), the Basel value and Riemann zeta, the log-sine integral, the Fourier series of Bernoulli polynomials and Bernoulli numbers, but no Li_n for n ≥ 2, no Bloch–Wigner function, no Lobachevsky function, no polylogarithmic complex and nothing named after Goncharov's regulators; its distributions are scalar objects on open subsets of normed spaces, not currents on manifolds. Mathlib's dilogarithm appears only in the documentation of the log-sine integral. Tau Ceti has function-field places and the unit filtration of local fields, used by P.5's curve complexes, P.5's reciprocity on ℙ¹ and P.6's Leopoldt statement. An open Mathlib pull request (#44531) proposes `Complex.polylog` with the lower-side cut convention used here; it is not a baseline, and P.1 should follow its design, as the P.6 part records.

Each declaration below was read at its module at the pinned commits by the part that cites it, and confirmed by that part's review. The description is the citing packet's `provides` field; where several parts cite a declaration, the first part's description is given and the other parts are named.

**Mathlib** (104 declarations).

- `mathlib:Additive` (Mathlib/Algebra/Group/TypeTags/Basic.lean): The additive type tag, turning F^x into a Z-module and, after tensoring, a Q-vector space. Cited by the first packet.
- `mathlib:AlgebraicGeometry.Scheme` (Mathlib/AlgebraicGeometry/Scheme.lean): Schemes, the setting of the varieties, cycles and curves of P.5. Cited by the first packet.
- `mathlib:AnalyticOn` (Mathlib/Analysis/Analytic/Basic.lean): Analyticity on a set, asserted for Li_n on C - [1, ∞). Cited by the first packet.
- `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (Mathlib/Analysis/Analytic/Uniqueness.lean): The identity theorem, extending identities from the disc to the star-shaped domain. Cited by the first packet.
- `mathlib:bernoulli` (Mathlib/NumberTheory/Bernoulli.lean): The Bernoulli numbers with B_1 = -1/2, the convention that gives 2 B_1/1! = -1 in L_2 = Im Li_2 + arg(1 - z) log|z|. Cited by the first packet.
- `mathlib:CategoryTheory.ShortComplex.homology` (Mathlib/Algebra/Homology/ShortComplex/Homology.lean): Homology of a short complex with HasHomology, not a replacement cohomology theory. Cited by the P.3 part.
- `mathlib:CategoryTheory.ShortComplex.homologyMap` (Mathlib/Algebra/Homology/ShortComplex/Homology.lean): Homology functor on morphisms of short complexes. Cited by the P.3 part.
- `mathlib:CochainComplex` (Mathlib/Algebra/Homology/HomologicalComplex.lean): Cochain complexes, the shape of the polylogarithmic, cycle and Deligne complexes. Cited by the first packet.
- `mathlib:CochainComplex.mappingCone` (Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean): The mapping cone of a map of cochain complexes, which gives the Arakelov motivic complex and the curve complexes. Cited by the first packet, P.5 part.
- `mathlib:CochainComplex.mappingCone.triangle` (Mathlib/Algebra/Homology/HomotopyCategory/Pretriangulated.lean): The distinguished triangle of a mapping cone. Cited by the first packet.
- `mathlib:CochainComplex.of` (Mathlib/Algebra/Homology/HomologicalComplex.lean): Native complex from specified objects, differentials and square-zero proofs. Cited by the P.4 part.
- `mathlib:CochainComplex.ofHom` (Mathlib/Algebra/Homology/HomologicalComplex.lean): Native map of cochain complexes from the adjacent commuting squares. Cited by the P.4 part.
- `mathlib:Complex` (Mathlib/Basic/Complex/Basic.lean): Native complex numbers with real and imaginary coordinates. Cited by the P.2 part.
- `mathlib:Complex.arg` (Mathlib/Analysis/SpecialFunctions/Complex/Arg.lean): The principal argument, discontinuous on (-∞, 0]; arg(1 - z) is discontinuous on (1, ∞), where its jump cancels that of Im Li_2. Cited by the first packet, P.2 part.
- `mathlib:Complex.continuousAt_arg` (Mathlib/Analysis/SpecialFunctions/Complex/Arg.lean): Continuity of the argument on the slit plane, used for the argument term of D off the cut. Cited by the first packet.
- `mathlib:Complex.exp_add` (Mathlib/Analysis/Complex/Exponential.lean): The complex exponential of a sum is the product of the exponentials. Cited by the P.5 part.
- `mathlib:Complex.hasStrictDerivAt_log` (Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean): The derivative of the principal log on the slit plane, the base of the recursion z d/dz Li_{n+1} = Li_n. Cited by the first packet.
- `mathlib:Complex.hasStrictFDerivAt_log_real` (Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean): On the slit plane the real derivative of complex log is multiplication by z inverse. This baseline theorem is used only locally off its cut, never asserted on the cut. Cited by the P.6 part.
- `mathlib:Complex.hasSum_taylorSeries_neg_log` (Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean): For |z| < 1, sum z^n/n = -log(1 - z): exactly Li_1 on the disc. Cited by the first packet.
- `mathlib:Complex.log` (Mathlib/Analysis/SpecialFunctions/Complex/Log.lean): The principal complex logarithm (arg in (-π, π]); Li_1 = -log(1 - z) everywhere, which fixes the value of every Li_n on the cut (1, ∞). Cited by the first packet.
- `mathlib:Complex.log_re` (Mathlib/Analysis/SpecialFunctions/Complex/Log.lean): Re(log z) = log(norm z), used to differentiate log moduli on local branches. Cited by the P.6 part.
- `mathlib:Complex.mul_im` (Mathlib/Basic/Complex/Basic.lean): Imaginary coordinate of multiplication is ad+bc. Cited by the P.2 part.
- `mathlib:Complex.mul_re` (Mathlib/Basic/Complex/Basic.lean): Real coordinate of multiplication is ac-bd. Cited by the P.2 part.
- `mathlib:Complex.norm_def` (Mathlib/Analysis/Complex/Norm.lean): The norm is the square root of the sum of the squares of the two coordinates. Cited by the P.2 part.
- `mathlib:Complex.slitPlane` (Mathlib/Analysis/Complex/Basic.lean): The slit plane C - (-∞, 0], on which the principal log is analytic; the cut domain of the principal Li_n is its preimage {z | 1 - z in slitPlane} = C - [1, ∞). Cited by the first packet.
- `mathlib:DifferentiableAt` (Mathlib/Analysis/Calculus/FDeriv/Defs.lean): Existence of a real continuous-linear Fréchet derivative; excludes a spurious formula for the totalised derivative of a nondifferentiable function. Cited by the P.6 part.
- `mathlib:DirectSum.lof` (Mathlib/Algebra/DirectSum/Module.lean): Native linear inclusion of each module into its dependent direct sum. Cited by the P.3 part.
- `mathlib:Distribution` (Mathlib/Analysis/Distribution/Distribution.lean): Distributions on an open subset of a normed space: the nearest baseline carrier for currents, which are a gap. Cited by the first packet, P.5 part.
- `mathlib:Distribution.delta` (Mathlib/Analysis/Distribution/Distribution.lean): Evaluation distribution, including zero outside the open set. Cited by the P.5 part.
- `mathlib:Distribution.lineDerivCLM` (Mathlib/Analysis/Distribution/Distribution.lean): Distribution derivative is minus precomposition with the test-function derivative; the order constraint is enforced. Cited by the P.5 part.
- `mathlib:Distribution.ofFun` (Mathlib/Analysis/Distribution/Distribution.lean): Locally integrable functions give distributions by integral of test function times function; without local integrability the construction is zero. Cited by the P.5 part.
- `mathlib:ExteriorAlgebra` (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): Exterior algebra of a module over a commutative ring, via the zero quadratic form. Cited by the P.5 part.
- `mathlib:ExteriorAlgebra.exteriorPower` (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): The exterior powers Lambda^n of the rationalised units. Cited by the first packet.
- `mathlib:ExteriorAlgebra.gradedAlgebra` (Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean): The graded algebra structure, giving the wedge product (1 - x) wedge x wedge y across degrees. Cited by the first packet.
- `mathlib:ExteriorAlgebra.map` (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): A linear map of modules induces an algebra homomorphism on exterior algebras; used by the coefficient-level Wang pullback signature. Cited by the P.5 part.
- `mathlib:ExteriorAlgebra.ι_add_mul_swap` (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): Products of degree-one generators anticommute. Cited by the P.5 part.
- `mathlib:ExteriorAlgebra.ι_sq_zero` (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): The square of a degree-one generator is zero. Cited by the P.5 part.
- `mathlib:exteriorPower.alternatingMapLinearEquiv` (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): The universal property of Lambda^n: alternating multilinear maps are linear maps out of it; used for r_{m-1}, the Chow dilogarithm and the residue. Cited by the first packet, P.3 part.
- `mathlib:exteriorPower.linearMap_ext` (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Extensionality on wedges. Cited by the P.3 part.
- `mathlib:exteriorPower.map` (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): Functorial native exterior powers. Cited by the P.4 part.
- `mathlib:exteriorPower.ιMulti` (Mathlib/LinearAlgebra/ExteriorPower/Basic.lean): The wedge of n vectors in Lambda^n. Cited by the first packet, P.3 part, P.4 part.
- `mathlib:fderiv` (Mathlib/Analysis/Calculus/FDeriv/Defs.lean): The real Fréchet derivative, a continuous linear map, totalised to zero outside differentiability. Cited by the P.6 part.
- `mathlib:Fin.append` (Mathlib/Data/Fin/Tuple/Basic.lean): Ordered concatenation of a Fin m tuple and a Fin n tuple into Fin(m+n), via Fin.addCases. Cited by the P.5 part.
- `mathlib:Finsupp` (Mathlib/Data/Finsupp/Defs.lean): Finitely supported functions: Q[F] = F →0 Q, the space of formal combinations the Bloch groups are quotients of. Cited by the first packet.
- `mathlib:Finsupp.linearCombination` (Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean): Evaluation of a finite rational formal sum in a rational module. Cited by the P.3 part, P.4 part.
- `mathlib:Finsupp.lmapDomain` (Mathlib/LinearAlgebra/Finsupp/Defs.lean): Linear pushforward of a finite formal sum along a function. Cited by the P.3 part.
- `mathlib:groupHomology` (Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean): Native group homology of a bundled representation, as ModuleCat objects. Cited by the P.3 part.
- `mathlib:hasSum_one_div_nat_pow_mul_fourier` (Mathlib/NumberTheory/ZetaValues.lean): The Fourier series of the Bernoulli polynomials: the unit-circle case of the inversion formula of Li_n. Cited by the first packet.
- `mathlib:hasSum_zeta_two` (Mathlib/NumberTheory/ZetaValues.lean): sum 1/n^2 = π^2/6, the value Li_2(1). Cited by the first packet.
- `mathlib:HomologicalComplex.homology` (Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean): Cohomology of a complex; H^1 B(F; n) = Ker delta_n. Cited by the first packet.
- `mathlib:HomologicalComplex₂.total` (Mathlib/Algebra/Homology/TotalComplex.lean): Native totalization with two anticommuting signed differential components. Cited by the P.3 part.
- `mathlib:integral_log_sin_zero_pi` (Mathlib/Analysis/SpecialFunctions/Integrals/LogTrigonometric.lean): Integral from 0 to π of log(sin x) is -π log 2. Cited by the P.2 part.
- `mathlib:intervalIntegrable_log_sin` (Mathlib/Analysis/SpecialFunctions/Integrability/LogMeromorphic.lean): log(sin t) is interval integrable on every real interval; Real.log uses absolute value on negative inputs. Cited by the P.2 part.
- `mathlib:intervalIntegral` (Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean): The interval integral, the form Li_{n+1}(z) = integral_0^1 Li_n(tz) t^{-1} dt of the continuation. Cited by the first packet, P.2 part.
- `mathlib:intervalIntegral.hasDerivAt_integral_of_dominated_loc_of_deriv_le` (Mathlib/Analysis/Calculus/ParametricIntervalIntegral.lean): Differentiation under the integral sign, for the analyticity of the recursive integral. Cited by the first packet.
- `mathlib:IsDiscreteValuationRing` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): Discrete valuation rings, the local rings of the residues. Cited by the first packet.
- `mathlib:IsLocalRing.ResidueField` (Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean): Residue fields of the valuations. Cited by the first packet.
- `mathlib:IsPrimitiveRoot.geom_sum_eq_zero` (Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean): The sum of the powers of a primitive root of unity vanishes, the coefficient identity behind the distribution relation. Cited by the first packet.
- `mathlib:IsZLattice` (Mathlib/Algebra/Module/ZLattice/Basic.lean): A discrete Z-submodule spans the ambient normed real vector space; discreteness is a separate typeclass assumption. The two-generator positive-area lattice must be shown to satisfy these native conditions. Cited by the P.5 part.
- `mathlib:LinearIndependent` (Mathlib/LinearAlgebra/LinearIndependent/Defs.lean): Injectivity of the finite linear-combination map; used on each subset of a vector tuple. Cited by the P.3 part.
- `mathlib:LinearMap.ker` (Mathlib/Algebra/Module/Submodule/Ker.lean): Native kernel submodule, not a substitute for cohomology. Cited by the P.4 part.
- `mathlib:LinearMap.range` (Mathlib/Algebra/Module/Submodule/Range.lean): Native image submodule for the cycle-lifting obstruction. Cited by the P.4 part.
- `mathlib:Matrix.det` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): The determinant of the regulator matrices. Cited by the first packet, P.3 part, P.4 part.
- `mathlib:Matrix.det_mul` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean): Determinant multiplicativity, including the GL change-of-volume factor. Cited by the P.3 part, P.4 part.
- `mathlib:Matrix.GeneralLinearGroup` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean): GL_2(C), on whose configurations the Bloch-Wigner cocycle is defined. Cited by the first packet, P.3 part.
- `mathlib:Matrix.trace` (Mathlib/LinearAlgebra/Matrix/Trace.lean): The sum of diagonal entries of a square matrix. Cited by the P.2 part.
- `mathlib:Matrix.trace_mul_comm` (Mathlib/LinearAlgebra/Matrix/Trace.lean): Trace AB equals trace BA, including compatible rectangular matrices. Cited by the P.2 part.
- `mathlib:MeasureTheory.integral` (Mathlib/MeasureTheory/Integral/Bochner/Basic.lean): The Bochner integral, for the convergent integrals of the forms r_{m-1}. Cited by the first packet.
- `mathlib:Multipliable` (Mathlib/Topology/Algebra/InfiniteSum/Defs.lean): Its generated additive declaration Summable asserts existence of an unordered HasSum in a topological additive monoid. For complex terms absolute summability yields summability and licenses index rearrangement. Cited by the P.5 part.
- `mathlib:NumberField.ComplexEmbedding.conjugate` (Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean): The conjugate of a complex embedding, which negates the weight-two regulator component. Cited by the first packet.
- `mathlib:NumberField.ComplexEmbedding.isReal_iff` (Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean): A complex embedding is real iff it equals its conjugate; the real-place vanishing. Cited by the first packet.
- `mathlib:NumberField.dedekindZeta` (Mathlib/NumberTheory/NumberField/DedekindZeta.lean): The Dedekind zeta function as an L-series, whose values the Zagier statements are about. Cited by the first packet, P.3 part.
- `mathlib:NumberField.discr` (Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean): The discriminant of a number field, the normalising factor of the Zagier determinant. Cited by the first packet, P.3 part.
- `mathlib:NumberField.InfinitePlace` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): The infinite places of a number field. Cited by the first packet.
- `mathlib:NumberField.InfinitePlace.embedding` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): The embedding attached to an infinite place (Mathlib's choice in a conjugate pair). Cited by the first packet, P.3 part.
- `mathlib:NumberField.InfinitePlace.IsComplex` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): Complex places. Cited by the first packet.
- `mathlib:NumberField.InfinitePlace.IsReal` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): Real places. Cited by the first packet.
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): The invariant r_2. Cited by the first packet, P.3 part.
- `mathlib:NumberField.InfinitePlace.nrRealPlaces` (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean): The invariant r_1. Cited by the first packet, P.3 part.
- `mathlib:NumberField.Units.fundSystem` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): A fundamental system of units, the basis eps_i of the p-adic regulator. Cited by the first packet.
- `mathlib:NumberField.Units.rank` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): The unit rank r_1 + r_2 - 1. Cited by the first packet.
- `mathlib:NumberField.Units.torsion` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): The torsion subgroup of the units, removed in Leopoldt's statement. Cited by the first packet.
- `mathlib:PadicAlgCl` (Mathlib/NumberTheory/Padics/Complex.lean): An algebraic closure of Q_p, where the values log_p sigma(eps) of the p-adic regulator lie. Cited by the first packet.
- `mathlib:padicValRat` (Mathlib/NumberTheory/Padics/PadicVal/Basic.lean): Integer prime valuations of rational numbers; the coordinate test uses only primes 2 and 3, and the native zero convention at triple ratio 1. Cited by the P.3 part.
- `mathlib:Polynomial.bernoulli` (Mathlib/NumberTheory/BernoulliPolynomials.lean): The Bernoulli polynomials, which appear in the inversion formula of the classical polylogarithm. Cited by the first packet.
- `mathlib:Projectivization` (Mathlib/LinearAlgebra/Projectivization/Basic.lean): The native quotient of nonzero vectors by scalar units; provides the points of P² used in the geometric presentation. Cited by the P.3 part.
- `mathlib:quasiIso_iff` (Mathlib/Algebra/Homology/QuasiIso.lean): Characterizes the existing global QuasiIso predicate, left conjectural for the weight-four residue map. Cited by the P.4 part.
- `mathlib:RatFunc` (Mathlib/FieldTheory/RatFunc/Defs.lean): The rational function field F(t), over which the relation subspace R_n(F) is defined. Cited by the first packet.
- `mathlib:Real.summable_nat_pow_inv` (Mathlib/Analysis/PSeries.lean): The real natural p-series is summable exactly when p>1. Cited by the P.2 part.
- `mathlib:Rep.trivial` (Mathlib/RepresentationTheory/Rep/Basic.lean): Trivial coefficient representation for rational GL homology. Cited by the P.3 part.
- `mathlib:Representation.Coinvariants` (Mathlib/RepresentationTheory/Coinvariants.lean): Native representation coinvariants V/span{ρ(g)x−x}; generic configurations use this existing quotient. Cited by the P.3 part.
- `mathlib:riemannZeta` (Mathlib/NumberTheory/LSeries/RiemannZeta.lean): The Riemann zeta function; Li_n(1) = ζ(n) and L_n(1) = ζ(n) for odd n. Cited by the first packet.
- `mathlib:riemannZeta_two_mul_nat` (Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean): ζ(2k) through the Bernoulli numbers, used to fix the constant in the inversion formula. Cited by the first packet.
- `mathlib:Set.Countable.isConnected_compl_of_one_lt_rank` (Mathlib/Analysis/Normed/Module/Connected.lean): The complement of a countable set in a real vector space of dimension at least two is connected; used for C - {0, 1, x} in the five-term proof. Cited by the first packet.
- `mathlib:Submodule.liftQ` (Mathlib/LinearAlgebra/Quotient/Basic.lean): A linear map vanishing on a submodule factors through the native quotient. Cited by the P.3 part, P.4 part.
- `mathlib:sum_Ioc_inv_sq_le_sub` (Mathlib/Analysis/PSeries.lean): For nonzero natural k≤n in an ordered field, sum over k<i≤n of i^-2 is at most k^-1-n^-1. Cited by the P.2 part.
- `mathlib:TensorProduct` (Mathlib/LinearAlgebra/TensorProduct/Defs.lean): Tensor products over Q in the terms of the polylogarithmic complexes. Cited by the first packet.
- `mathlib:TensorProduct.lift` (Mathlib/LinearAlgebra/TensorProduct/Basic.lean): Native bilinear-to-linear universal property. Cited by the P.3 part, P.4 part.
- `mathlib:TensorProduct.map` (Mathlib/LinearAlgebra/TensorProduct/Map.lean): Tensor product of linear maps with evaluation on pure tensors. Cited by the P.3 part, P.4 part.
- `mathlib:TestFunction` (Mathlib/Analysis/Distribution/TestFunction.lean): Test functions on an open subset of a normed space. Cited by the first packet, P.5 part.
- `mathlib:TestFunction.continuous_iff_continuous_comp` (Mathlib/Analysis/Distribution/TestFunction.lean): A linear map into a locally convex space is continuous exactly when every fixed-compact restriction is continuous; includes algebra/scalar-tower hypotheses. Cited by the P.5 part.
- `mathlib:TestFunction.ext` (Mathlib/Analysis/Distribution/TestFunction.lean): Pointwise equality implies equality of bundled test functions. Cited by the P.5 part.
- `mathlib:Valuation` (Mathlib/RingTheory/Valuation/Basic.lean): Valuations, for the residue maps and the specialisation lemma. Cited by the first packet.
- `mathlib:WeierstrassCurve` (Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean): Weierstrass curves, the plane cubics of the elliptic Chow dilogarithm. Cited by the first packet.

**Tau Ceti** (7 declarations).

- `tauceti:TauCeti.Divisor.degree_principal` (TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean): A principal divisor has degree zero; used for the independence of the auxiliary point on the projective line. Cited by the first packet.
- `tauceti:TauCeti.Place` (TauCeti/FieldTheory/FunctionField/Place/Basic.lean): Places of a function field, the closed points of the curve complexes. Cited by the first packet.
- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero` (TauCeti/FieldTheory/FunctionField/Place/Zeros.lean): A function has nonzero order at only finitely many places (Stichtenoth Cor. 1.3.4); finiteness of the total residue. Cited by the first packet.
- `tauceti:TauCeti.Place.ord` (TauCeti/FieldTheory/FunctionField/Place/Basic.lean): The order of a function at a place. Cited by the first packet.
- `tauceti:TauCeti.Place.ResidueField` (TauCeti/FieldTheory/FunctionField/Place/Basic.lean): The residue field at a place. Cited by the first packet.
- `tauceti:TauCeti.Place.residueUnit` (TauCeti/FieldTheory/FunctionField/Place/Residue.lean): The residue of a function that is a unit at a place. Cited by the first packet.
- `tauceti:TauCeti.unitFiltration` (TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean): The unit filtration of a local field; the principal units U^1 in Leopoldt's statement. Cited by the first packet.

## Layer overview

Each layer section opens with the coverage records of the packets that cover it and an overview of the layer. It then states every node, the first packet's and the follow-up's together, in an order in which every node comes after the nodes of the same layer (or sub-layer) it uses: its statement and hypotheses, the proof or construction, for definitions and constructions the API and the unit tests, the acceptance checks, the uses that justify the API, the dependencies, the nodes of this roadmap that use it, the library placement and the sources. Where a reviewer asked the assembly to carry a correction or a cross-part fact into a node of another packet, an **Assembly note** follows the node.

| Layer | Title | Nodes | Planets | Coverage | Packets |
|---|---|---|---|---|---|
| P.1 | Classical and single-valued polylogarithms | 12 | 4 | source_decomposed | `Polylogarithms.json` (12) |
| P.2 | The weight-two regulator | 22 | 6 | planned | `Polylogarithms.json` (8), `Polylogarithms--P.2.json` (14) |
| P.3 | Weight-three polylogarithmic complexes | 36 | 4 | planned | `Polylogarithms.json` (9), `Polylogarithms--P.3.json` (27) |
| P.4 | General polylogarithmic statement infrastructure | 30 | 6 | planned | `Polylogarithms.json` (12), `Polylogarithms--P.4.json` (18) |
| **P.5** | **Curves and regulator complexes** | **63** | **12** | planned | `Polylogarithms.json` (30), `Polylogarithms--P.5.json` (33) |
| P.5:currents | Currents, Chow parameters and Green classes (proposed) | 16 | 4 | part of P.5 | `Polylogarithms.json` (6), `Polylogarithms--P.5.json` (10) |
| P.5:curves | Curve symbols and reciprocity (proposed) | 16 | 3 | part of P.5 | `Polylogarithms.json` (15), `Polylogarithms--P.5.json` (1) |
| P.5:regulators | Higher-cycle and elliptic regulator comparisons (proposed) | 31 | 5 | part of P.5 | `Polylogarithms.json` (9), `Polylogarithms--P.5.json` (22) |
| P.6 | Other precise statements and tests | 6 | 2 | planned | `Polylogarithms.json` (4), `Polylogarithms--P.6.json` (2) |

In all, 169 nodes and 34 planets. The coverage column gives the latest record: the follow-up packet's for P.2–P.6, the first packet's for P.1. P.5 is displayed as the three sub-layers the P.5 part proposes, because its 63 nodes carry twelve planets; the split is awaiting the maintainer, the node ids are unchanged, and every displayed layer stays within six planets. The first packet's planet on `P.6/leopoldt-statement` belongs at IntegralIwasawaTheory I.2 under the accepted ownership (see P.6).

**The paths to the main theorems.** The weight-two path runs P.1 → P.2: D, its five-term relation and differential (P.1) give the descent to the Bloch group, the regulator and the cocycle (P.2), which with K3BlochGroups V.4 and BorelRegulators R.4 give the Borel comparison, and with Milnor's formula the volume of ideal tetrahedra. The weight-three path runs P.1 → P.3: the explicit B_3 and the configuration maps give the comparison from K-theory, and L_3 with Borel's theorem (R.5) gives ζ_F(3). The general path runs P.3 → P.4: the inductive groups, the descent of L_n and the determinant state Zagier's conjecture, and the explicit weight-four complex states Goncharov–Rudenko's theorem, whose proof is the proposed Part II. The curve path runs P.1, P.3 → P.5: the residues of P.3 make the curve complexes, the forms r_{m−1} and currents make the regulators, and BFT's comparison identifies Goncharov's regulator with Beilinson's. P.6 states Leopoldt through I.2 and collects the tests. One edge runs against the layer order: `P.3/conditional-complex-transfer` uses `P.4/general-polylog-complex` and the stage P.4 (see Dependencies).

## P.1 — Classical and single-valued polylogarithms

*Coverage in `Polylogarithms.json`: source_decomposed, 12 nodes.* The classical n-logarithm on the disc and its principal branch on C - [1, ∞), with the jump across the cut proved before L_n is defined; the distribution and inversion formulas; the single-valued L_n (n ≥ 2) with its continuity on the projective line; the Bloch-Wigner function with its differential, its positivity and the five-term relation with the cross-ratio identity behind it. Positivity rests on a Mathlib gap (a minimum principle for superharmonic functions).

The layer has 12 nodes, all in the first packet, which decomposes the stage text completely (`source_decomposed`). No follow-up part was needed.

- **The classical polylogarithm.** Li_n is defined for every integer n: for n ≥ 1 by its series on the unit disc and, on all of ℂ, by the principal branch Li_1(z) = −log(1 − z) and Li_{n+1}(z) = ∫₀¹ Li_n(tz) dt/t, analytic on ℂ ∖ [1, ∞) and equal on the cut to its limit from the lower half-plane (Mathlib's arg of a negative real is π); for n ≤ 0 by the rational function (z d/dz)^{−n}(z/(1 − z)), which HabiroNahmSeries HB.4 uses. The multivalued continuation of the sources enters only through the explicit jump Li_n(x + i0) − Li_n(x − i0) = 2πi (log x)^{n−1}/(n − 1)! across (1, ∞) (`P.1/branch-change-and-monodromy`), so no statement needs homotopy invariance of path integrals, which the pinned Mathlib lacks. The distribution relations and the inversion formula through the Bernoulli polynomials are lemma nodes of their own, because HabiroNahmSeries, ColemanIntegration and EllipticRegulators cite them.
- **Zagier's single-valued polylogarithm.** L_n(z) = π_n(Σ_{k<n} (2^k B_k/k!) Li_{n−k}(z) log^k|z|), n ≥ 2, with π_n the real part for odd n and the imaginary part for even n and Mathlib's Bernoulli numbers (B_1 = −1/2). The jump formula shows exactly which coefficient sequences cancel the monodromy (the odd coefficients of (Σ c_k s^k) e^s must vanish below degree n); the Bernoulli choice is one of them, not the only one. Continuity on the projective line with L_n(∞) = 0, L_n(1) = ζ(n) for odd n and 0 for even n, and the inversion, reality and distribution relations follow. The inversion relation fails for the formula at n = 1, which is why L_1 is not part of the definition.
- **The Bloch–Wigner dilogarithm.** D(z) = Im Li_2(z) + arg(1 − z) log|z| equals L_2. Mathlib's conventions give D(0) = D(1) = 0 without a special case, the jumps of the two terms across (1, ∞) cancel, and D is real-analytic on ℂ ∖ {0, 1} with dD = log|z| d arg(1 − z) − log|1 − z| d arg z. Its Laplacian −2 Im z/(|z|²|1 − z|²) makes it strictly superharmonic on the upper half-plane, hence positive there; this last step needs a strong minimum principle for superharmonic functions, which the pinned Mathlib does not contain (gap below).
- **The five-term relation.** The cross-ratio identity 1 − x_i = −x_i x_{i+2}^{−1} x_{i+3}^{−1} for the five cyclic cross-ratios of five distinct points makes the one-form Σ dD(x_i) vanish, and connectedness of the configuration space fixes the constant. The relation is stated for five distinct points of ℙ¹(ℂ) in GR's cross-ratio and in the two-variable K-book form that K3BlochGroups V.3 uses for its pre-Bloch group.

**What other roadmaps take from this layer.** EllipticRegulators ER.2–ER.4 and ER.8 take D, its differential and the distribution relations; HabiroNahmSeries HB.3, HB.4 and HB.8 take Li_n (including n ≤ 0), the distribution relations, D and the five-term relation; ColemanIntegration L1–L3 take Li_n and the five-term relation; ArithmeticQuantumTopology QT.5–QT.7 take D and the branch conventions of Li_2; K3BlochGroups V.3 and V.5 take D and its five-term relation; BorelRegulators R.7 takes positivity; HabiroNumberFields HB.2 takes Li_n. Four requests addressed to this layer are not answered by any node, and each is listed under Gaps:

- **The Rogers dilogarithm.** K3BlochGroups V.3 and V.5 (Suslin's normalisation Li_2(x) + ½ log x log(1 − x) on (0, 1), its values, derivative, reflection and the ordered five-term expression), HabiroNahmSeries HB.3 and HB.4 (Calegari–Garoufalidis–Zagier's normalisation π²/6 minus the standard one, on ℙ¹(ℝ) modulo π²/2, with its five-term descent and the A_n identity) and ArithmeticQuantumTopology QT.5 each need the real Rogers dilogarithm. The first packet proposes to plan it once, as `P.1/rogers-dilogarithm`, with both normalisations (see Structural proposals). No packet contains that node.
- **The five-term relation of Li_2 itself.** HabiroNumberFields HB.2 needs the complex identity −Li_2(X/(YZ)) + Li_2(YZ) + Li_2(1/(YZ)) + Li_2(X/Y) + Li_2(1) − Li_2(X) − Li_2(1/Y) − Li_2(Z) = 0, Z = (1 − X)/(1 − Y), with compatible principal branches on a small simply connected neighbourhood of (1/5, 2). `P.1/bloch-wigner-five-term` gives only its single-valued imaginary-part counterpart.
- **The cross-ratio identities over a field.** ColemanIntegration L2 asks for the identities behind `P.1/five-cross-ratio-identity` (complement, inverse, adjacent permutations, fractional-linear invariance and the cyclic five-point identity, with the cases at infinity) for pairwise distinct points of ℙ¹ over an arbitrary field, for use over ℂ_p. The node states them for complex points.
- **Li_1 at roots of unity.** ColemanIntegration L2 and L3 ask for Σ ζ^n/n = −log(1 − ζ) at a nontrivial root of unity ζ, by the Dirichlet test and Abel's theorem. `P.1/classical-polylogarithm` proves continuity on the closed disc only for n ≥ 2.

The weight-three differential of L_3, which the first packet listed as the one remaining item of P.6, is planned in the P.6 part as `P.6/single-valued-trilogarithm-differential`: it is an API item of `P.1/single-valued-polylogarithm`, promoted to a theorem node of P.6 because only P.6's tests consume it. The differential of L_n in every weight is a step of the proof of `P.4/cycle-constancy` (with Goncharov's (1.28c) corrected, source issue E-P4-02); it has no node of its own.

### The classical n-logarithm

`P.1/classical-polylogarithm` · definition · planet “Classical n-logarithm” · first packet

For an integer n define the classical n-logarithm Li_n. For n ≥ 1 it is the absolutely convergent series Li_n(z) = sum_{k≥1} z^k/k^n on the open unit disc. Its principal branch is defined for every z in C by Li_1(z) = -log(1 - z), with Mathlib's principal logarithm, and Li_{n+1}(z) = integral_0^1 Li_n(tz) t^{-1} dt; it agrees with the series on the disc, satisfies z d/dz Li_{n+1} = Li_n, and is analytic on the star-shaped domain C - [1, ∞) = {z | 1 - z in slitPlane}. On the cut (1, ∞) its value is the limit from the lower half-plane, because Mathlib's argument of a negative real number is π. For n ≤ 0, Li_n(z) = (z d/dz)^{-n}(z/(1 - z)), a rational function on C - {1} that agrees with the series on the disc. The multivalued analytic continuation of the source along paths in C - {0, 1} is described only through the explicit jump across (1, ∞) (P.1/branch-change-and-monodromy): no statement uses homotopy invariance of path integrals, which the pinned Mathlib does not have.

**Hypotheses.**

- n is an integer; the source defines the weights n ≥ 1, and the case n ≤ 0 is the rational function that HabiroNahmSeries HB.4 uses.
- For the series, |z| < 1.
- For the principal branch z is arbitrary, and analyticity is asserted on C - [1, ∞). For the continuation of the source, z lies in C - {0, 1} and gamma : [0, 1] → C is a piecewise C^1 path with gamma(0) = 0, gamma(1) = z and gamma(t) not in {0, 1} for t > 0; only its effect across the cut, the jump formula, is planned.

**Construction.**

1. Prove absolute convergence of the series on the open unit disc by comparison with the geometric series; for n ≥ 2 it converges uniformly on the closed disc (comparison with sum 1/k^n), which gives continuity there.
2. Base case n = 1: on the disc sum z^k/k = -log(1 - z), which is mathlib:Complex.hasSum_taylorSeries_neg_log; take -log(1 - z) as the definition of Li_1 on all of C.
3. Define the principal branch on the star-shaped domain C - [1, ∞) (star-shaped about 0) by Li_{n+1}(z) = integral_0^1 Li_n(tz) t^{-1} dt, an intervalIntegral, and prove its analyticity there by differentiating under the integral sign (mathlib:intervalIntegral.hasDerivAt_integral_of_dominated_loc_of_deriv_le), starting from mathlib:Complex.hasStrictDerivAt_log. The multivalued continuation is described only through the explicit jump across (1, ∞) (P.1/branch-change-and-monodromy), never through homotopy invariance.
4. Prove the differentiation formula z d/dz Li_{n+1}(z) = Li_n(z) on C - [1, ∞), and agreement with the series on the disc by comparing coefficients.
5. Record the value on the cut: Li_1(x) = -log(1 - x) = -log(x - 1) - i π for x > 1, the limit from the lower half-plane, and so every Li_n on (1, ∞) is its lower-side limit.
6. Prove Li_n(1) = ζ(n) for n ≥ 2 from continuity on the closed disc and the series at z = 1; at n = 2 this is mathlib:hasSum_zeta_two.
7. For n ≤ 0 define Li_n by the rational function and prove agreement with the series on the disc by applying z d/dz to the geometric series.
8. The distribution relations and the inversion formula are the lemma nodes P.1/classical-distribution and P.1/classical-inversion.

**API.**

- `polylog` (constructor): polylog (n : Z) : C → C. For n ≥ 1 the principal branch described above (analytic on C - [1, ∞), lower-side values on (1, ∞)); for n ≤ 0 the rational function (z d/dz)^{-n}(z/(1 - z)).
- `polylog_hasSum` (characterisation): For |z| < 1 and every integer n, the series sum_{k≥1} z^k/k^n sums to Li_n(z).
- `polylog_one_eq_neg_log` (compatibility): For every z in C, Li_1(z) = -log(1 - z) with Mathlib's principal logarithm; on the disc this is mathlib:Complex.hasSum_taylorSeries_neg_log. This pins the value on the cut.
- `polylog_zero` (simp): Li_n(0) = 0 for every integer n.
- `polylog_deriv` (relation): For every integer n and z not in [1, ∞) with z ≠ 0: HasDerivAt (Li_{n+1}) (Li_n(z)/z) z, that is, z d/dz Li_{n+1} = Li_n.
- `polylog_analyticOn` (characterisation): For n ≥ 1, Li_n is analytic on {z | 1 - z in slitPlane} = C - [1, ∞); for n ≤ 0 it is analytic on C - {1}.
- `polylog_conj` (relation): Li_n(conj z) = conj(Li_n(z)) for z not in [1, ∞).
- `polylog_one_eq_zeta` (compatibility): For n ≥ 2, Li_n(1) = ζ(n) (mathlib:riemannZeta); in particular Li_2(1) = π^2/6 (mathlib:hasSum_zeta_two).
- `polylog_continuousOn_closedBall` (characterisation): For n ≥ 2, Li_n is continuous on the closed unit disc.
- `polylogSeries` (other): polylogSeries (n : Z) : Q[[X]], the formal power series with coefficient k^{-n} at X^k for k ≥ 1 and 0 at X^0; evaluated on the disc it is Li_n. This is the form HabiroNahmSeries HB.8 and HB.9 use.
- `polylog_jump` (relation): For n ≥ 1 and x > 1, Li_n(x + i eps) - Li_n(x - i eps) → 2π i (log x)^{n-1}/(n-1)! as eps → 0+. Promoted to Polylogarithms:P.1/branch-change-and-monodromy.
- `polylog_distribution` (relation): The distribution relation Li_n(z^m) = m^{n-1} sum_{zeta^m = 1} Li_n(zeta z). Promoted to Polylogarithms:P.1/classical-distribution.
- `polylog_inversion` (relation): The inversion formula Li_n(z) + (-1)^n Li_n(1/z) = -((2π i)^n/n!) B_n(1/2 + log(-z)/(2π i)). Promoted to Polylogarithms:P.1/classical-inversion.

**Unit tests.**

- `weight_one` (compatibility): polylog 1 z = -log(1 - z) for every z in C; for |z| < 1 this is the Mathlib series sum z^k/k.
- `value_at_half_weight_two` (computation): polylog 2 (1/2) = π^2/12 - (log 2)^2/2.
- `value_at_neg_one` (computation): polylog 2 (-1) = -π^2/12. A principal branch with the cut along (-∞, 0] instead of [1, ∞) fails this.
- `value_at_one` (computation): polylog 2 1 = π^2/6.
- `derivative_recursion` (characterisation): For z not in [1, ∞) and z ≠ 0: z * deriv (polylog 3) z = polylog 2 z.
- `nonpositive_index` (degenerate): polylog 0 z = z/(1 - z) and polylog (-1) z = z/(1 - z)^2 for z ≠ 1.
- `jump_across_cut` (non-example): polylog 1 (3 + i eps) - polylog 1 (3 - i eps) → 2π i as eps → 0+, so no continuous single-valued Li_1 exists on C - {0, 1}.

**Acceptance.**

- At n = 1 the principal branch is -log(1 - z) for every z in C; on the disc it is the pinned Mathlib series.
- The differentiation formula holds on C - [1, ∞), which pins the normalisation of the integral.
- Li_2(-1) = -π^2/12: a principal branch built with the cut along (-∞, 0] (Mathlib's slitPlane itself) instead of [1, ∞) fails this.
- Li_n is not a single-valued analytic function on C - {0, 1}: its principal values jump by 2π i (log x)^{n-1}/(n-1)! across x > 1.

**Used by.**

- P.1's single-valued polylogarithm: L_n is a finite combination of the Li_{n-k} against powers of log|z|
- P.3's trilogarithm regulator: the explicit weight-three regulator is written through Li_3
- ColemanIntegration L2: that layer builds the p-adic counterpart; the complex-analytic function planned here is its archimedean partner, and neither is derived from the other
- HabiroNahmSeries HB.3: uses Li_2 continuous at 1 with value π^2/6 (polylog_one_eq_zeta, polylog_continuousOn_closedBall)
- HabiroNahmSeries HB.4: uses sum_t Li_r(zeta^t w) = m^{1-r} Li_r(w^m) and the polylogarithms Li_{2-r} of non-positive index, r ≥ 2 (P.1/classical-distribution and polylog for n ≤ 0)
- HabiroNahmSeries HB.8 and HB.9: use Li_n(t) as a formal power series in Q[[t]] (polylogSeries)

**Depends on.** libraries: `mathlib:Complex.log`, `mathlib:Complex.slitPlane`, `mathlib:Complex.hasSum_taylorSeries_neg_log`, `mathlib:Complex.hasStrictDerivAt_log`, `mathlib:intervalIntegral`, `mathlib:intervalIntegral.hasDerivAt_integral_of_dominated_loc_of_deriv_le`, `mathlib:AnalyticOn`, `mathlib:hasSum_zeta_two`, `mathlib:riemannZeta`.

**Used in this roadmap by.** `P.1/classical-distribution`, `P.1/classical-inversion`, `P.1/single-valued-polylogarithm`, `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-differential`, `P.1/branch-change-and-monodromy`, `P.1/distribution-and-inversion`, `P.1/single-valued-continuity`, `P.2/certified-numerics`, `P.2/lobachevsky-fourier`, `P.2/unit-circle-fourier`, `P.3/trilogarithm-functional-relations`, `P.4/cycle-constancy`, `P.6/single-valued-trilogarithm-differential`.

**Library.** module `TauCeti/Analysis/SpecialFunctions/Polylogarithm`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, 1.1, item 1 (PDF p. 2): “Li_n(z) = sum_{k=1}^{infinity} z^k / k^n, |z| < 1. It is continued analytically to a multivalued analytic function on C - {0, 1} by induction, setting Li_n(z) = integral from 0 to z of Li_{n-1}(z) d log z, n >= 2.” — The definition and the inductive continuation, as displayed.

**Assembly note.** ColemanIntegration L2 and L3 also ask this node for Li_1 at a nontrivial root of unity on the unit circle, Σ ζ^n/n = −log(1 − ζ), by the Dirichlet test and Abel's theorem; continuity on the closed disc is planned here only for n ≥ 2. HabiroNumberFields HB.2 asks for the complex five-term identity of Li_2 near (1/5, 2). Both are listed under Gaps.

### The distribution relations of the classical polylogarithm

`P.1/classical-distribution` · lemma · first packet

For n ≥ 1, m ≥ 1 and z with zeta z not in [1, ∞) for every m-th root of unity zeta (so also z^m not in [1, ∞)): Li_n(z^m) = m^{n-1} sum_{zeta^m = 1} Li_n(zeta z). The same identity holds for n ≤ 0 whenever z^m ≠ 1.

**Hypotheses.**

- n is an integer, m ≥ 1.
- z lies in the star-shaped domain where every Li_n(zeta z) is analytic.

**Proof.**

1. On the disc compare coefficients, using sum_{zeta^m = 1} zeta^k = m if m divides k and 0 otherwise (mathlib:IsPrimitiveRoot.geom_sum_eq_zero).
2. Extend by the identity theorem on the domain, which is star-shaped about 0 and hence connected (mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq).

**Acceptance.**

- At n = 1, m = 2: -log(1 - z^2) = -log(1 - z) - log(1 + z) on the disc.
- At n = 2, m = 2, z = 1/2: Li_2(1/4) = 2(Li_2(1/2) + Li_2(-1/2)).

**Depends on.** this roadmap: `P.1/classical-polylogarithm`; libraries: `mathlib:IsPrimitiveRoot.geom_sum_eq_zero`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

**Used in this roadmap by.** `P.1/distribution-and-inversion`.

**Sources.**

- `GR.2022`, 1.1, item 3 (PDF p. 4): “Although we do not know explicitly functional equations for n-logarithms for large n except a trivial one L_n(z) + (-1)^n L_n(z^{-1}) = 0, and the distribution relations” — The source names the distribution relations; the form for Li_n stated here is the standard one, checked numerically by the reviewer for n = 1, ..., 4 and m = 2, 3.

### The inversion formula of the classical polylogarithm

`P.1/classical-inversion` · lemma · first packet

For n ≥ 1 and z in C - [0, ∞): Li_n(z) + (-1)^n Li_n(1/z) = -((2π i)^n/n!) B_n(1/2 + log(-z)/(2π i)), where B_n is the Bernoulli polynomial and log is the principal logarithm. On the unit circle this is Mathlib's hasSum_one_div_nat_pow_mul_fourier.

**Hypotheses.**

- n ≥ 1; z is not a non-negative real number.

**Proof.**

1. n = 1: -log(1 - z) + log(1 - 1/z) = -log(-z) on C - [0, ∞).
2. Apply z d/dz to both sides and use B_n' = n B_{n-1}; the two sides then differ by a constant.
3. Fix the constant at z = -1: B_n(1/2) = (2^{1-n} - 1) B_n and Li_n(-1) = (2^{1-n} - 1) ζ(n), with ζ(2k) from mathlib:riemannZeta_two_mul_nat; for odd n both sides vanish at z = -1.

**Acceptance.**

- At n = 2, z = -1: 2 Li_2(-1) = -π^2/6.
- Applying the parity projection gives the inversion relation of L_n in P.1/distribution-and-inversion.

**Depends on.** this roadmap: `P.1/classical-polylogarithm`; libraries: `mathlib:Polynomial.bernoulli`, `mathlib:riemannZeta_two_mul_nat`, `mathlib:hasSum_one_div_nat_pow_mul_fourier`.

**Used in this roadmap by.** `P.1/distribution-and-inversion`.

**Sources.**

- `GR.2022`, 1.1, item 3 (PDF p. 4): “Although we do not know explicitly functional equations for n-logarithms for large n except a trivial one L_n(z) + (-1)^n L_n(z^{-1}) = 0” — The source states the single-valued consequence; the classical formula is not stated in the sources read. It extends mathlib:hasSum_one_div_nat_pow_mul_fourier from the unit circle, and the reviewer checked it numerically for n = 1, ..., 4 at four points (error below 5e-41).

### The cross-ratio identity behind the five-term relation

`P.1/five-cross-ratio-identity` · lemma · first packet

For pairwise distinct s_1, ..., s_5 in C, let x_i = [s_i, s_{i+1}, s_{i+2}, s_{i+3}] (indices mod 5, the cross-ratio of GR (3)). Then x_i is not 0 or 1, and 1 - x_i = -x_i x_{i+2}^{-1} x_{i+3}^{-1}.

**Hypotheses.**

- The s_i are pairwise distinct complex numbers (points at ∞ by continuity).

**Proof.**

1. Clear denominators; the identity is a polynomial identity (field_simp; ring).

**Acceptance.**

- Checked exactly over Q(i) by the reviewer for 20 random 5-tuples.

**Depends on.** nothing outside the statement.

**Used in this roadmap by.** `P.1/bloch-wigner-five-term`.

**Sources.**

- `GR.2022`, 1.1, item 3, (3) and (4) (PDF pp. 3-4): “recall the cross-ratio of four points on P^1(F): [s_1, s_2, s_3, s_4] := (s_1 - s_2)(s_3 - s_4) / ((s_1 - s_4)(s_3 - s_2))” — The identity behind (4): with eta(f, g) = log|f| d arg g - log|g| d arg f, bilinear and antisymmetric with eta(f, -1) = 0, it gives sum eta(x_i, 1 - x_i) = 0.

**Assembly note.** ColemanIntegration L2 asks for these identities (complement, inverse, adjacent permutations, fractional-linear invariance and the cyclic five-point identity, with the cases at infinity) for pairwise distinct points of ℙ¹ over an arbitrary field, for use over ℂ_p; see Gaps.

### Branch change and the cancellation of monodromy

`P.1/branch-change-and-monodromy` · lemma · first packet

For n ≥ 1 the principal branch satisfies Li_n(x + i0) - Li_n(x - i0) = 2π i (log x)^{n-1}/(n-1)! for x > 1. Equivalently, continuation along a loop based in the unit disc that winds once counterclockwise around 1 and not around 0 sends Li_n to Li_n - 2π i (log z)^{n-1}/(n-1)!; the loop around 0 fixes the principal branch, which is analytic at 0, and sends log z to log z + 2π i. Consequently, for n ≥ 2 and real c_k, pi_n(sum_{k<n} c_k Li_{n-k}(z) log^k|z|) is continuous across (1, ∞) and real-analytic on C - {0, 1} if and only if the power series (sum_k c_k s^k) e^s has vanishing odd coefficients in degrees below n. The Bernoulli choice c_k = 2^k B_k/k! gives s/sinh s, which is even.

**Hypotheses.**

- n ≥ 1; x > 1 is a point of the cut; the c_k are real.

**Proof.**

1. The jump of Li_1 = -log(1 - z) across (1, ∞) is 2π i, by the jump of Complex.log across (-∞, 0); integrate it through the recursion Li_{n+1}(z) = integral_0^1 Li_n(tz) t^{-1} dt to get the jump 2π i (log x)^{n-1}/(n-1)!.
2. Substitute the jumps into sum_k c_k Li_{n-k}(z) log^k|z|: with a = log|z| the jump is 2π i [t^{n-1}] (sum_k c_k (at)^k) e^{at} evaluated at the cut, and pi_n kills it exactly when the odd coefficients vanish in degrees below n.
3. For c_k = 2^k B_k/k!, sum_k c_k s^k = 2s/(e^{2s} - 1), so the product with e^s is s/sinh s, which is even.
4. State the resulting single-valuedness as the input to the definition of L_n, not as a consequence of it.

**Acceptance.**

- At n = 2: Im Li_2(x +- i0) = +- π log x for x > 1, while arg(1 - z) jumps from -π to +π, so Im Li_2 + arg(1 - z) log|z| is continuous across the cut.
- The criterion does not single out the Bernoulli coefficients: Ramakrishnan's c_k = (-1)^k/k! give (sum c_k s^k) e^s = 1, also single-valued; continuity at ∞ is what pins the Bernoulli choice (P.1/single-valued-continuity).
- The lemma is about the jump of the principal branch and cannot be stated for a single-valued function.

**Depends on.** this roadmap: `P.1/classical-polylogarithm`; libraries: `mathlib:Complex.log`.

**Used in this roadmap by.** `P.1/single-valued-polylogarithm`, `P.1/bloch-wigner-dilogarithm`, `P.1/single-valued-continuity`, `P.6/single-valued-trilogarithm-differential`.

**Sources.**

- `GR.2022`, 1.1, item 1 (PDF p. 3): “The obtained multivalued analytic function has a single valued cousin. Namely, consider the projection given by pi_n ...” — The single-valued cousin whose existence this lemma proves; the jump formula and the criterion are the reviewer's, checked numerically for n = 1, ..., 4 at x = 3.

### Zagier's single-valued polylogarithm

`P.1/single-valued-polylogarithm` · definition · planet “Single-valued polylogarithm” · first packet

For n ≥ 2 let pi_n : C → R be z ↦ Re z for n odd and z ↦ Im z for n even (GR (1) writes the codomain as (2π i)^{n-1} R; see source issue Polylogarithms/E1). Define L_n(z) := pi_n(sum_{k=0}^{n-1} (2^k B_k/k!) Li_{n-k}(z) log^k|z|) for z in C, with the principal branches of P.1/classical-polylogarithm and Mathlib's Bernoulli numbers (B_1 = -1/2). The value does not depend on the branch: L_n is single-valued and real-analytic on C - {0, 1} (P.1/branch-change-and-monodromy). Its continuity on the projective line, with L_n(∞) = 0, is P.1/single-valued-continuity. Its weight-two case is the Bloch-Wigner dilogarithm. GR's weight-one map {z}_1 ↦ log|z| is a separate convention on B_1(C) and is not the case n = 1 of this formula, which gives -log|1 - z|.

**Hypotheses.**

- n ≥ 2 (the source prints n > 1).
- z lies in C; the point ∞ of the projective line is handled by the limit statement of P.1/single-valued-continuity.

**Construction.**

1. Define the parity projection pi_n and record which part it takes in each parity; the codomain is R.
2. Form the displayed combination with mathlib:bernoulli, whose convention B_1 = -1/2 gives 2 B_1/1! = -1, so that L_2 = Im Li_2 + arg(1 - z) log|z|; mathlib's bernoulli' (B_1 = +1/2) gives the wrong sign.
3. Prove single-valuedness from the jump formula of P.1/branch-change-and-monodromy: the jump of the combination across (1, ∞) is -2π i [t^{n-1}] (at/sinh(at)) e^{ibt} with a = log|z| and b = arg z, and pi_n kills it because at/sinh(at) is even with real coefficients.
4. Prove real-analyticity on C - {0, 1}: off the cut every term is real-analytic, and across the cut the two one-sided analytic continuations agree after pi_n by the previous step.
5. Record that the weight-two case is the Bloch-Wigner function, which is treated in its own node with its own API.

**API.**

- `singleValuedPolylog` (constructor): The function L_n : C → R for n ≥ 2, defined as above.
- `singleValuedPolylog_contDiffOn` (characterisation): L_n is real-analytic, in particular smooth, on C - {0, 1}.
- `singleValuedPolylog_zero` (simp): L_n(0) = 0 for n ≥ 2.
- `singleValuedPolylog_continuous` (characterisation): For n ≥ 2, L_n is continuous on C. Promoted to Polylogarithms:P.1/single-valued-continuity.
- `singleValuedPolylog_at_one` (simp): For n ≥ 2, L_n(1) = ζ(n) for n odd and 0 for n even. Promoted to Polylogarithms:P.1/single-valued-continuity.
- `singleValuedPolylog_tendsto_cocompact` (characterisation): For n ≥ 2, L_n(z) → 0 as z → ∞ (Tendsto L_n (cocompact C) (nhds 0)), the value at ∞ of the projective line. Promoted to Polylogarithms:P.1/single-valued-continuity.
- `singleValuedPolylog_conj` (relation): L_n(conj z) = (-1)^{n-1} L_n(z) for n ≥ 2. Promoted to Polylogarithms:P.1/distribution-and-inversion.
- `singleValuedPolylog_inv` (relation): For n ≥ 2 and z ≠ 0: L_n(z) + (-1)^n L_n(1/z) = 0. Promoted to Polylogarithms:P.1/distribution-and-inversion.

**Unit tests.**

- `weight_two_is_bloch_wigner` (compatibility): singleValuedPolylog 2 z = (polylog 2 z).im + arg(1 - z) * log |z| for every z.
- `reality` (characterisation): L_3(conj z) = L_3(z), while L_2(conj z) = -L_2(z).
- `value_at_one_odd` (computation): singleValuedPolylog 3 1 = ζ(3).
- `bernoulli_sign` (non-example): With bernoulli' (B_1 = +1/2) the weight-two formula Im Li_2(z) - arg(1 - z) log|z| jumps by 4π log x across x > 1 (about 13.806 at x = 3); with bernoulli it is continuous.
- `ramakrishnan_unbounded` (non-example): pi_3(Li_3 - log|z| Li_2 + (1/2) log^2|z| Li_1) is single-valued but unbounded as z → ∞, so it is not L_3.
- `not_analytic_at_one` (non-example): not (DifferentiableAt R (singleValuedPolylog 2) 1).

**Acceptance.**

- L_2 is the Bloch-Wigner function and satisfies the five-term relation.
- L_3(1) = ζ(3) ≠ 0: L_n does not vanish at 1 for odd n.
- L_n is not real-differentiable at 0 or at 1 (test not_analytic_at_one).
- The Bernoulli coefficients are pinned by single-valuedness together with continuity at ∞ (equivalently, the clean inversion relation), not by single-valuedness alone: Ramakrishnan's coefficients (-1)^k/k! also give a single-valued function, which for n = 3 is unbounded near ∞.

**Used by.**

- P.4's polylogarithm on the higher Bloch groups: L_n induces the map from B_n(C) to the reals (P.4/polylog-on-higher-bloch), which makes the relation subgroup a subgroup of functional equations
- P.4's Zagier determinant: the entries of the regulator matrix are values of L_n at the embeddings
- P.2's weight-two regulator: its weight-two case is the function descended through the Bloch group

**Depends on.** this roadmap: `P.1/classical-polylogarithm`, `P.1/branch-change-and-monodromy`; libraries: `mathlib:bernoulli`, `mathlib:Complex.log`, `mathlib:Complex.arg`.

**Used in this roadmap by.** `P.1/bloch-wigner-dilogarithm`, `P.1/distribution-and-inversion`, `P.1/single-valued-continuity`, `P.3/trilogarithm-regulator-borel`, `P.3/weight-three-special-value`, `P.4/polylog-on-higher-bloch`, `P.4/zagier-determinant`, `P.6/tests`, `P.3/trilogarithm-descent`, `P.4/cycle-evaluation`, `P.6/single-valued-trilogarithm-differential`.

**Library.** module `TauCeti/Analysis/SpecialFunctions/Polylogarithm`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, 1.1, item 1 (PDF p. 3): “the following expression is a single-valued function on CP^1 - {0, 1, infinity}: L_n(z) := pi_n( sum_{k=0}^{n-1} (2^k B_k / k!) Li_{n-k}(z) log^k |z| ), n > 1. Here B_k are the Bernoulli numbers ... For example, L_2(z) is the Bloch-Wigner dilogarithm. The function L_n(z) is continuous on CP^1.” — The definition, its single-valuedness, its continuity and the identification of the weight-two case, as displayed, for n > 1.

**Assembly note.** The P.6 part adds the API item `singleValuedPolylog_three_differential`, the real differential of L_3, as the theorem node `P.6/single-valued-trilogarithm-differential`. The differential in every weight is a proof step of `P.4/cycle-constancy`.

### The Bloch-Wigner dilogarithm

`P.1/bloch-wigner-dilogarithm` · definition · planet “Bloch-Wigner dilogarithm” · first packet

Define D : C → R by D(z) = Im Li_2(z) + arg(1 - z) log|z|, with the principal branch of P.1/classical-polylogarithm (lower-side values on (1, ∞)) and Mathlib's principal argument; since Mathlib sets log 0 = 0 and arg 0 = 0, the formula gives D(0) = D(1) = 0 with no special case. D equals L_2 of P.1/single-valued-polylogarithm, is real-analytic on C - {0, 1}, continuous on C, tends to 0 at ∞ and vanishes on R. Across (1, ∞) the imaginary part of Li_2 jumps by 2π log x and arg(1 - z) log|z| by -2π log x, so the jumps cancel; dropping the argument term leaves a function discontinuous on (1, ∞).

**Hypotheses.**

- z lies in C; the value at ∞ is the limit 0.

**Construction.**

1. Write the displayed expression for every z in C, with the value of Li_2 on the cut fixed by polylog_one_eq_neg_log and the recursion.
2. Prove that the jump of Im Li_2 across (1, ∞) (2π log x, P.1/branch-change-and-monodromy) cancels the jump of arg(1 - z) log|z| (-2π log x), so D is continuous across the cut; off the cut the argument term is continuous by mathlib:Complex.continuousAt_arg.
3. Prove that the expression agrees with the weight-two case of the single-valued polylogarithm (2 B_1/1! = -1).
4. Prove conjugation D(conj z) = -D(z), inversion D(1/z) = -D(z) and D(1 - z) = -D(z); deduce that D vanishes on R.
5. Continuity at 0 and 1 and the limit 0 at ∞ are the case n = 2 of P.1/single-valued-continuity.

**API.**

- `blochWigner` (constructor): The function D : C → R defined above.
- `blochWigner_eq_singleValued` (compatibility): D = L_2, the weight-two single-valued polylogarithm.
- `blochWigner_zero` (simp): D(0) = 0.
- `blochWigner_one` (simp): D(1) = 0.
- `blochWigner_conj` (relation): D(conj z) = -D(z).
- `blochWigner_inv` (relation): D(1/z) = -D(z).
- `blochWigner_one_sub` (relation): D(1 - z) = -D(z).
- `blochWigner_real` (simp): D(x) = 0 for every real x.
- `blochWigner_continuous` (characterisation): D is continuous on C.
- `blochWigner_tendsto_cocompact` (characterisation): D(z) → 0 as z → ∞.
- `blochWigner_differential` (relation): The differential formula dD = log|z| d arg(1 - z) - log|1 - z| d arg z on C - {0, 1}. Promoted to Polylogarithms:P.1/bloch-wigner-differential.
- `blochWigner_pos` (characterisation): D(z) > 0 for Im z > 0. Promoted to Polylogarithms:P.1/bloch-wigner-positivity.

**Unit tests.**

- `vanishes_on_reals` (computation): blochWigner x = 0 for every real x, including x > 1 on the cut.
- `value_at_i` (computation): blochWigner I = sum_{k≥0} (-1)^k/(2k+1)^2 (Catalan's constant, about 0.9159655941772190).
- `regular_tetrahedron` (computation): blochWigner (exp(i π/3)) = sum_{k≥1} sin(k π/3)/k^2, about 1.0149416064096536, the maximum of D.
- `five_term` (characterisation): D(i) - D(-1) + D(i) - D((1+i)/2) + D((1-i)/2) = 0, the two-variable five-term relation at x = i, y = -1 (each term is +-G or 0).
- `im_li2_jump` (non-example): (polylog 2 (3 + i eps)).im - (polylog 2 (3 - i eps)).im → 2π log 3 as eps → 0+, so Im Li_2 alone is not continuous across the cut.

**Acceptance.**

- D vanishes at 0 and 1, on the real line, and at ∞.
- D(i) = sum_{k≥0} (-1)^k/(2k+1)^2, Catalan's constant 0.9159655941772190...
- D is real analytic off 0 and 1 and continuous at them.
- Im Li_2 jumps by 2π log x across x > 1 and arg(1 - z) log|z| jumps by -2π log x there, so D is continuous across (1, ∞); dropping the argument term leaves a function discontinuous on (1, ∞).

**Used by.**

- P.2's weight-two regulator: the regulator is D descended through the Bloch group
- K3BlochGroups V.3: that layer's warning about torsion is about this function; its two reserved analytic nodes import from here, and the restructure entries of both packets propose that they become citations
- P.5's curve regulator: the differential formula is the weight-two logarithmic expression the curve complex produces
- P.2's certified numerics: the reduction steps use D(1 - z) = -D(z), D(1/z) = -D(z) and D(conj z) = -D(z)
- P.2's descent: D(x) + D(1 - x) = 0 is the statement that the element c is killed

**Depends on.** this roadmap: `P.1/classical-polylogarithm`, `P.1/single-valued-polylogarithm`, `P.1/branch-change-and-monodromy`; libraries: `mathlib:Complex.arg`, `mathlib:Complex.log`, `mathlib:Complex.continuousAt_arg`.

**Used in this roadmap by.** `P.1/bloch-wigner-differential`, `P.1/bloch-wigner-positivity`, `P.1/bloch-wigner-five-term`, `P.2/bloch-wigner-descent`, `P.2/bloch-wigner-cocycle`, `P.2/lobachevsky-identity`, `P.2/certified-numerics`, `P.2/certified-numerics-error`, `P.5/weight-two-regulator-form`, `P.5/chow-dilogarithm-steinberg`, `P.5/chow-dilogarithm-on-elliptic-curves`, `P.5/weight-three-curve-regulator`, `P.2/unit-circle-fourier`, `P.2/kummer-unit-reduction`, `P.5/weight-three-relation-descent`, `P.6/single-valued-trilogarithm-differential`, `P.6/trilogarithm-differential-regression-tests`.

**Library.** module `TauCeti/Analysis/SpecialFunctions/Polylogarithm`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, 1.1, item 1 (PDF p. 3): “For example, L_2(z) is the Bloch-Wigner dilogarithm.” — The identification of the weight-two single-valued polylogarithm with the Bloch-Wigner function.
- `Gonch.Arakelov.2004`, Introduction, item 4 (PDF p. 5): “It has a single-valued cousin, the Bloch-Wigner function: L2(z) := ImLi2(z) + arg(1 - z) log |z|” — The defining formula, as displayed.

### The differential of the Bloch-Wigner function

`P.1/bloch-wigner-differential` · lemma · first packet

For z in C - {0, 1}, D is real-differentiable at z, with fderiv R D z v = -log|z| Im(v/(1 - z)) - log|1 - z| Im(v/z) for v in C; that is, dD = log|z| d arg(1 - z) - log|1 - z| d arg z.

**Hypotheses.**

- z is neither 0 nor 1; off the cut the formula is computed directly, and on (1, ∞) it follows from continuity of D and of the right-hand side.

**Proof.**

1. Off [1, ∞) differentiate Im Li_2 with polylog_deriv (d Li_2 = -log(1 - z) dz/z) and arg(1 - z) log|z| with the derivatives of Complex.log and Complex.arg; the terms Im(-log(1 - z) dz/z) and log|z| d arg(1 - z) + arg(1 - z) d log|z| combine to the displayed form.
2. On (1, ∞) both sides are continuous and D is continuous across the cut, so the formula extends.

**Acceptance.**

- Checked numerically by the reviewer at twelve point-direction pairs, including z = 4 on the cut.

**Depends on.** this roadmap: `P.1/bloch-wigner-dilogarithm`, `P.1/classical-polylogarithm`; libraries: `mathlib:Complex.hasStrictDerivAt_log`, `mathlib:Complex.continuousAt_arg`.

**Used in this roadmap by.** `P.1/bloch-wigner-positivity`, `P.1/bloch-wigner-five-term`, `P.2/lobachevsky-identity`, `P.5/weight-two-regulator-form`, `P.5/chow-dilogarithm-steinberg`, `P.2/kummer-unit-reduction`, `P.4/cycle-constancy`, `P.5/weight-three-pairing`.

**Sources.**

- `Gonch.Arakelov.2004`, proof of Lemma 6.9, (85), p. 57: “dL2 (z) = - log |1 - z|d arg z + log |z|d arg(1 - z)” — The differential formula, as displayed.

### Positivity of the Bloch-Wigner function

`P.1/bloch-wigner-positivity` · lemma · first packet

On C - {0, 1}, the Laplacian of D is Delta D = -2 Im z/(|z|^2 |1 - z|^2). Consequently D is strictly superharmonic on the upper half-plane, where it is continuous up to the boundary with value 0 on R and at ∞, and so D(z) > 0 for Im z > 0 (and D(z) < 0 for Im z < 0).

**Hypotheses.**

- Im z > 0 for the positivity statement.

**Proof.**

1. Differentiate the formula of P.1/bloch-wigner-differential once more: Im Li_2 is harmonic, and the product arg(1 - z) log|z| of two harmonic functions has Laplacian 2 grad arg(1 - z) . grad log|z| = -2 Im z/(|z|^2 |1 - z|^2).
2. Apply the strong minimum principle for superharmonic functions on the upper half-plane with boundary values 0 (a gap: the pinned Mathlib has the mean-value property of harmonic functions but no minimum principle for superharmonic ones).

**Acceptance.**

- D(e^{i π/3}) = 1.0149... > 0 and D(i) = G > 0.
- Delta D at z = 0.3 + 0.7i is -2.4630541871..., as predicted.

**Depends on.** this roadmap: `P.1/bloch-wigner-differential`, `P.1/bloch-wigner-dilogarithm`.

**Used in this roadmap by.** `P.2/hyperbolic-volume`, `P.2/milnor-angle-volume`, `P.6/trilogarithm-differential-regression-tests`.

**Sources.**

- `Gonch.Arakelov.2004`, Introduction, item 5 (PDF p. 7): “formula relates its volume to the Bloch-Wigner function: vol I(z1 , ..., z4 ) = L2 (r(z1 , ..., z4 ))” — Positivity of the volume of a positively oriented ideal tetrahedron is the geometric meaning; the analytic proof through the Laplacian is the reviewer's, checked numerically at four points.

**Assembly note.** Positivity is used by `P.2/hyperbolic-volume` and `P.2/milnor-angle-volume` (the orientation sign), by the strict sign test of `P.6/trilogarithm-differential-regression-tests`, and by BorelRegulators R.7's small cases. None of them proves the minimum principle; the gap stays here.

### The five-term relation for the Bloch-Wigner function

`P.1/bloch-wigner-five-term` · theorem · planet “Five-term relation for D” · first packet

Let [s_1, s_2, s_3, s_4] := (s_1 - s_2)(s_3 - s_4)/((s_1 - s_4)(s_3 - s_2)) be the source's cross-ratio (so [∞, -1, 0, z] = -z; it is written out explicitly, not imported). For any five distinct points s_1, ..., s_5 of the complex projective line, sum_{i in Z/5} D([s_i, s_{i+1}, s_{i+2}, s_{i+3}]) = 0; equivalently sum_{i=1}^5 (-1)^i D([s_1, ..., s_i-hat, ..., s_5]) = 0. In particular, for x ≠ y in C - {0, 1}: D(x) - D(y) + D(y/x) - D((1 - x^{-1})/(1 - y^{-1})) + D((1 - x)/(1 - y)) = 0, which is the alternating form at (s_1, ..., s_5) = (∞, 0, 1, x, y) and the normalisation of the five-term relation in the K-book and K3BlochGroups V.3.

**Hypotheses.**

- The five points are distinct points of the complex projective line; in the two-variable form x, y are distinct points of C - {0, 1}.

**Proof.**

1. Fix x in C - {0, 1}. The function f(y) given by the two-variable sum is real-differentiable on C - {0, 1, x}, and df = 0 by P.1/bloch-wigner-differential together with the cross-ratio identity of P.1/five-cross-ratio-identity.
2. The set C - {0, 1, x} is connected (mathlib:Set.Countable.isConnected_compl_of_one_lt_rank, with rank_R C = 2), so f is constant.
3. As y → 0, f(y) → D(x) + D(1 - x) = 0, by continuity of D at 0 and blochWigner_one_sub.
4. The cyclic and alternating forms follow by the Mobius invariance of the cross-ratio and footnote 2 of the source ([s_2, s_3, s_4, s_1] = [s_1, s_2, s_3, s_4]^{-1}, with D(1/z) = -D(z)).
5. The descent through the pre-Bloch group is P.2/bloch-wigner-descent, not part of this node.

**Acceptance.**

- x = i, y = -1: D(i) - D(-1) + D(i) - D((1+i)/2) + D((1-i)/2) = 0, each term being +-G or 0.
- x = i/2, y = (1+i)/2: D(i/2) - D((1+i)/2) + D(1 - i) - D(2 - i) + D((3+i)/2) = 0, with terms of size 0.5 to 0.9 (P.6/tests).

**Depends on.** this roadmap: `P.1/bloch-wigner-dilogarithm`, `P.1/five-cross-ratio-identity`, `P.1/bloch-wigner-differential`; libraries: `mathlib:Set.Countable.isConnected_compl_of_one_lt_rank`.

**Used in this roadmap by.** `P.2/bloch-wigner-descent`, `P.2/bloch-wigner-cocycle`, `P.2/hyperbolic-volume`, `P.6/tests`, `P.5/weight-three-relation-descent`.

**Sources.**

- `GR.2022`, 1.1, item 3 (PDF pp. 3-4): “recall the cross-ratio of four points on P^1(F): [s_1, s_2, s_3, s_4] := (s_1 - s_2)(s_3 - s_4) / ((s_1 - s_4)(s_3 - s_2)), [infinity, -1, 0, z] = -z. Then for any five distinct points s_1, ..., s_5 on CP^1 we have: sum_{i=1}^{5} L_2([s_i, s_{i+1}, s_{i+2}, s_{i+3}]) = 0, i in Z/5Z.” — The cross-ratio normalisation and the cyclic five-term relation, as displayed; footnote 2 converts it into the alternating form.

### Inversion, reality and distribution relations

`P.1/distribution-and-inversion` · lemma · first packet

For n ≥ 2: the inversion relation L_n(z) + (-1)^n L_n(1/z) = 0 for z ≠ 0; the reality relation L_n(conj z) = (-1)^{n-1} L_n(z); and for m ≥ 1 the distribution relation L_n(z^m) = m^{n-1} sum_{zeta^m = 1} L_n(zeta z). The inversion relation fails for the formula at n = 1 (the defect is -log|z|). The reality relation is not an algebraic functional equation and is recorded separately, as the source insists.

**Hypotheses.**

- n ≥ 2 for every clause; z ≠ 0 for inversion.

**Proof.**

1. Derive the inversion relation from P.1/classical-inversion: after the parity projection the Bernoulli polynomial term cancels against the log|z| terms, which is where the Bernoulli coefficients are used.
2. Derive the reality relation from polylog_conj and the rationality of the Bernoulli coefficients, with the sign by which pi_n interacts with conjugation.
3. Derive the distribution relation from P.1/classical-distribution.
4. Record the classification: inversion and distribution are algebraic functional equations of L_n; whether the corresponding elements lie in R_n(F) is not established by the sources read, and P.4 must not assume it. The reality relation is not an algebraic functional equation.

**Acceptance.**

- At n = 2 inversion says D(1/z) = -D(z).
- L_3(1) = ζ(3) ≠ 0, so L_3 does not vanish on the reals, unlike L_2.
- At n = 1 the inversion relation fails: the defect is -log|z| (0.2724 at z = 0.3 + 0.7i).
- The reality relation is excluded from the list of algebraic functional equations.

**Depends on.** this roadmap: `P.1/single-valued-polylogarithm`, `P.1/classical-polylogarithm`, `P.1/classical-distribution`, `P.1/classical-inversion`.

**Used in this roadmap by.** `P.1/single-valued-continuity`, `P.2/certified-numerics`, `P.3/trilogarithm-descent`, `P.3/trilogarithm-functional-relations`.

**Sources.**

- `GR.2022`, 1.1, item 3 and footnote 4 (PDF p. 4): “Although we do not know explicitly functional equations for n-logarithms for large n except a trivial one L_n(z) + (-1)^n L_n(z^{-1}) = 0, and the distribution relations ... And the reality relation L_n(conjugate z) = (-1)^{n-1} L_n(z), which is not on the list of algebraic functional equations.” — The three relations and the classification, as displayed.

### Continuity of the single-valued polylogarithm on the projective line

`P.1/single-valued-continuity` · lemma · first packet

For n ≥ 2, L_n is continuous on C, L_n(0) = 0, L_n(1) = ζ(n) for n odd and 0 for n even, and L_n(z) → 0 as z → ∞, so L_n extends continuously to the projective line with L_n(∞) = 0. L_n is not differentiable at 0, at 1 or at ∞.

**Hypotheses.**

- n ≥ 2.

**Proof.**

1. Continuity on C - {0, 1} follows from the definition and the single-valuedness of P.1/single-valued-polylogarithm.
2. At 0 each term Li_{n-k}(z) log^k|z| tends to 0, since Li_{n-k}(z) = O(|z|) and |z| log^k|z| → 0.
3. At 1, Li_m is continuous at 1 for m ≥ 2 (continuity on the closed disc together with the jump formula, whose jump 2π i (log x)^{m-1}/(m-1)! tends to 0 as x → 1), log^k|z| → 0 for k ≥ 1, and Li_1(z) log^{n-1}|z| = -log(1 - z) log^{n-1}|z| → 0; so L_n(z) → pi_n(Li_n(1)) = pi_n(ζ(n)).
4. At ∞, by the inversion relation of P.1/distribution-and-inversion, L_n(z) = -(-1)^n L_n(1/z) → 0.
5. Non-differentiability: the derivative of the term carrying log|z| (at 0 and ∞) or log|1 - z| (at 1) is unbounded.

**Acceptance.**

- L_3(1) = ζ(3) and L_2(1) = 0.
- Without the Bernoulli coefficients a single-valued combination can be unbounded at ∞ (Ramakrishnan's L_3), so this lemma is what pins the definition.

**Depends on.** this roadmap: `P.1/single-valued-polylogarithm`, `P.1/distribution-and-inversion`, `P.1/classical-polylogarithm`, `P.1/branch-change-and-monodromy`; libraries: `mathlib:riemannZeta`.

**Used in this roadmap by.** `P.4/polylog-on-higher-bloch`, `P.2/unit-circle-fourier`, `P.2/kummer-unit-reduction`, `P.3/trilogarithm-descent`, `P.3/trilogarithm-functional-relations`, `P.4/higher-symbol-inversion`, `P.4/cycle-evaluation`, `P.4/cycle-constancy`.

**Sources.**

- `GR.2022`, 1.1, item 1 (PDF p. 3): “The function L_n(z) is continuous on CP^1.” — The continuity statement, for n > 1.

## P.2 — The weight-two regulator

*Coverage in `Polylogarithms.json`: partial, 8 nodes.* Descent through V.3's convention, the embedding-wise regulator, the Bloch-Wigner cocycle, the Borel comparison up to some q in ℚ^×, the volume formula with Lobachevsky's identity, and the certified numerics with their error theorem.

Remaining in this record:

- The exact scalar and sign of the Borel comparison (Goncharov Sections 5.4 and 5.5; BorelRegulators R.7)
- Goncharov Section 7 and the proof of Milnor's volume formula, owned by P.2
- The expansion of Li_2 near the unit circle (gap)
- The ideal-boundary/oriented-tetrahedron/finite-region-volume interface, beyond the stated GeometricTopology layers 7 and 8; early Part II supplier requested.

*Coverage in `Polylogarithms--P.2.json`: planned, 14 nodes.* Completed refinements: Milnor Appendix proof route and analytic normalization. Uniform rational Fourier evaluation and its error contract, including unit-circle inputs; no Li_2 near-circle expansion needed. Ownership boundaries for all three confirmed red-team findings.

Remaining in this record:

- Re-derive and export the exact Burgos/Suslin scalar after correcting the published matrix-unit calibration and fixing the measurable-to-continuous/Tate-coordinate map.
- Obtain the early GeometricTopology Part II ideal-boundary/oriented measurable-region interface; then instantiate the stated Milnor theorem and inherited hyperbolic-volume theorem on that carrier.

The layer has 22 nodes: the first packet's eight, which plan every target of the stage text, and the P.2 part's fourteen, which supply the proofs the first packet left open for the volume formula and the certified numerics, and audit the normalisation of the Borel comparison.

- **Descent and the regulator.** D descends to a homomorphism P(ℂ) → ℝ out of K3BlochGroups V.3's pre-Bloch group, through that convention and no other, and restricts to the Bloch group B(ℂ). For a number field F the embedding-wise regulator B(F) → ℝ^{complex places} takes D at Mathlib's chosen embedding of each complex place; the conjugate embedding negates the component, and the real embeddings contribute zero because D vanishes on ℝ, which is proved rather than assumed.
- **The Bloch–Wigner cocycle and the Borel comparison.** c_x(g_1, …, g_4) = D(r(g_1x, …, g_4x)), with Goncharov's cross-ratio r(∞, 0, 1, t) = t, is a measurable GL_2(ℂ)-invariant 3-cocycle whose class does not depend on x; its cocycle identity is the alternating five-term relation. Goncharov's Theorem 1.1 at n = 2 makes its class a nonzero rational multiple of the Borel class, so the regulator composed with Suslin's map K_3^ind(F)_ℚ → B(F)_ℚ is q times the Borel regulator of BorelRegulators R.4 for some q ∈ ℚ^×, only after rationalisation: a real regulator kills torsion and cannot identify two integral models.
- **The exact scalar.** The P.2 part owns the analytic comparison, including its exact scalar; BorelRegulators R.7 and K3BlochGroups V.6 consume it (confirmed red-team finding RT-AREA-ktheory-2/23). It computes the elementary calibration Goncharov's proof rests on and finds that the printed value fails: with the unnormalised alternation of his equations (66)–(67), C_2(e12 ∧ e21 ∧ e22) = −3/2, not 1, and Burgos's trace polynomial of R.4 gives +1/2 on the same matrices (source issue E22 of the P.2 part). The exact q is therefore re-derived from the boundary integral, not read from Theorem 5.7 or Corollary 5.10; it stays a gap.
- **Hyperbolic volume.** Milnor's normalisation of the Lobachevsky function, Λ(θ) = −∫₀^θ log|2 sin t| dt (not Clausen's Cl_2(2θ) = 2Λ(θ)), its Fourier series ½ Σ sin(2nθ)/n² and duplication formula give the volume of an ideal tetrahedron with dihedral angles α, β, γ at a vertex as Λ(α) + Λ(β) + Λ(γ), through the density h^{−3} of upper half-space and a signed sector decomposition. With `P.2/lobachevsky-identity` this proves the oriented identity vol I(z_1, …, z_4) = D(r(z_1, …, z_4)), positive for (∞, 0, 1, z) with Im z > 0. The ideal boundary ∂ℍ³ ≅ ℙ¹(ℂ), measurable ideal regions and ordered orientation are not stated by GeometricTopology layers 7–8, which own the metric and the volume; they are requested from a GeometricTopology Part II, and the theorem is stated on that carrier only. This layer is the only owner of the ideal-tetrahedron identity; ArithmeticQuantumTopology QT.5 imports it for its manifold volume sum (RT-AREA-ktheory-2/25, RT-AREA-topology/7).
- **Certified numerics.** On the unit circle D(w) = Σ Im(w^n)/n², with tail at most 1/N uniformly, including w = 1; Kummer's formula D(z) = ½(D(w_0) + D(w_1) + D(w_2)) with w_j = u_j/ū_j, (u_0, u_1, u_2) = (z, 1/(1 − z), 1 − 1/z), moves every point to the circle; and exact rational arithmetic computes the three shapes and the Fourier sums. A(z, p) = ½ Σ_j S_{3·2^p}(W_j(z)) is a total computable function ℚ² × ℕ → ℚ with |A(z, p) − D(z)| ≤ 1/(2·2^p). The construction uses exponentially many terms in p; no complexity claim is made. The numerical function is never the definition of the regulator, and a value proves D(z) ≠ 0 only when it exceeds the error bound.

**How the parts fit.** The P.2 part imports the first packet's eight nodes by id and redeclares none of them. Its Fourier construction implements the first packet's `P.2/certified-numerics`, replacing that node's near-circle expansion of Li_2, and its error theorem implies `P.2/certified-numerics-error`; `P.2/milnor-angle-volume` is the proof of Milnor's formula that `P.2/hyperbolic-volume` lacked; and `P.2/lobachevsky-function` is the function the first packet writes L(θ) in `P.2/lobachevsky-identity`. The first packet's nodes still describe these inputs as gaps; the Assembly notes after them say what now supplies them. The first packet's gaps on Milnor's formula and on the near-circle expansion are answered (see Gaps); its gap on the exact scalar is now the P.2 part's first gap, with the calibration error added; and the ideal-boundary interface is the P.2 part's second gap.

### Descent of the Bloch-Wigner function through the Bloch group

`P.2/bloch-wigner-descent` · construction · planet “Descent of D to the Bloch group” · first packet

Construct blochWignerPreHom : P(C) →+ R, the homomorphism out of the pre-Bloch group of K3BlochGroups V.3 (generators [x] for x in C - {0}, [1] = 0, the five-term relations in the K-book normalisation) induced by [x] ↦ D(x) through preBloch.lift, and blochWignerHom : B(C) →+ R, its restriction to the Bloch group, the kernel of the boundary into the antisymmetric tensor quotient. The descent is through that convention and no other; a second convention gives a different integral map with the same rationalisation. Both maps kill torsion, because R is torsion-free. The element c = [x] + [1 - x] is sent to D(x) + D(1 - x) = 0; in B(C) itself c = 0 (K-book Cor. VI.5.4.1 as corrected in K3BlochGroups/E10), while c has order six in B(Q) and B(R), and its image along Q → C is killed.

**Hypotheses.**

- The field is C; for naturality, F is a field with an embedding sigma : F → C.
- The pre-Bloch group and the Bloch group are those of K3BlochGroups V.3.

**Construction.**

1. Import the pre-Bloch group (K3BlochGroups:V.3/pre-bloch-group, with preBloch.lift), the five-term relation (V.3/five-term-relation) and the Bloch group (V.3/bloch-group, with blochGroup.map).
2. Apply preBloch.lift to x ↦ D(x): D(1) = 0, and every five-term element is killed by the two-variable form of P.1/bloch-wigner-five-term, which is stated in exactly V.3's normalisation.
3. Restrict the resulting homomorphism to the Bloch group.
4. Prove naturality for a field embedding sigma : F → C: the composite with preBloch.map sigma is [x] ↦ D(sigma x).
5. Record the consequences the roadmap insists on: the map kills torsion, so it cannot separate two integral conventions, and its composition with the comparison of conventions is the corresponding map for the other convention.

**API.**

- `blochWignerPreHom` (constructor): The homomorphism P(C) →+ R, preBloch.lift applied to D.
- `blochWignerPreHom_gen` (simp): blochWignerPreHom [x] = D(x).
- `blochWignerHom` (constructor): The homomorphism B(C) →+ R, the restriction of blochWignerPreHom.
- `blochWignerHom_gen` (simp): On an element of B(C) given by sum n_i [x_i], its value is sum n_i D(x_i).
- `blochWignerHom_torsion` (characterisation): It vanishes on every element of finite order.
- `blochWignerHom_map` (functoriality): For sigma : F → C, blochWignerHom (blochGroup.map sigma b) = blochWignerPreHom of the image of b, computed generator by generator as D(sigma x).

**Unit tests.**

- `kills_c` (characterisation): blochWignerPreHom ([x] + [1 - x]) = 0; at x = i this is D(i) + D(1 - i) = G - G.
- `vanishes_real_embedding` (degenerate): For sigma : F → C with real image, the composite with blochGroup.map sigma vanishes, since D vanishes on R.
- `conj_embedding` (characterisation): For sigma : F → C, the descent along conj o sigma is minus the descent along sigma.
- `nonzero` (computation): [exp(i π/3)] lies in B(C): its boundary w wedge (1 - w) = w wedge w^{-1} = -(w wedge w) vanishes, since C^x is 2-divisible and 2(a wedge a) = 0; and blochWignerHom [exp(i π/3)] = D(exp(i π/3)) = sum sin(k π/3)/k^2 > (sqrt 3/2)(1 + 1/4 - 1/16 - 1/25) > 0.
- `convention_blind` (non-example): Two conventions differing by 2-torsion give the same descended map, so equality of the real maps does not identify the integral groups.

**Acceptance.**

- The composite P(C) → R sends c = [x] + [1 - x] to D(x) + D(1 - x) = 0 for every x; the descended map kills every torsion element, for instance the image of c in B(Q), of order six, under Q → C.
- The map is natural for an embedding of a number field into C.
- The map does not distinguish the Suslin convention from the Calegari-Garoufalidis-Zagier convention, whose difference is 2-torsion.

**Used by.**

- P.2's embedding-wise regulator: the regulator matrix is built from this map at each embedding
- K3BlochGroups V.6: that layer exports the integral model through which this map is compared with the abstract regulator
- EllipticRegulators ER.2: the Steinberg relation through the Bloch-Wigner function is stated there against this descent

**Depends on.** this roadmap: `P.1/bloch-wigner-five-term`, `P.1/bloch-wigner-dilogarithm`; other roadmaps: `K3BlochGroups:V.3/pre-bloch-group`, `K3BlochGroups:V.3/five-term-relation`, `K3BlochGroups:V.3/bloch-group`.

**Used in this roadmap by.** `P.2/weight-two-regulator`, `P.3/trilogarithm-functional-relations`, `P.5/weight-three-relation-descent`.

**Library.** module `TauCeti/NumberTheory/Regulators/WeightTwo`, namespace `TauCeti.Regulator`.

**Sources.**

- `Kbook.2013`, VI.5.1 (PDF p. 495): “and Bloch's group B(F) is defined to be its kernel.” — The convention through which the function descends is the one fixed there.

### The embedding-wise weight-two regulator of a number field

`P.2/weight-two-regulator` · construction · planet “Weight-two regulator” · first packet

For a number field F construct weightTwoRegulator : B(F) → (complex places of F → R), whose component at a complex place w is blochWignerHom o blochGroup.map(w.embedding), with Mathlib's choice w.embedding (mathlib:NumberField.InfinitePlace.embedding) in the conjugate pair; replacing it by its conjugate negates the component. For a real embedding the same composite vanishes because D vanishes on R, and that vanishing is proved rather than assumed. Construct the determinant det(D(sigma_{r_1+i}(y_j)))_{1≤i,j≤r_2} on an r_2-tuple of elements of B(F), with the complex places enumerated.

**Hypotheses.**

- F is a number field; the places are the infinite places of F.
- The elements are in the Bloch group of F.

**Construction.**

1. Import the infinite places, their embeddings (InfinitePlace.embedding, IsReal, IsComplex) and the counts r_1, r_2.
2. Define the component at a complex place w by composing blochGroup.map(w.embedding) with blochWignerHom; prove that the conjugate embedding (ComplexEmbedding.conjugate) gives minus the component, by blochWigner_conj.
3. Prove that for a real embedding (ComplexEmbedding.isReal_iff) the composite vanishes, by blochWigner_real.
4. Assemble the map into the vector space indexed by the complex places and define the determinant of the resulting matrix on an r_2-tuple.
5. Prove naturality for a field embedding F → L: the component at a complex place of L over a complex place v of F is the v-component, up to the sign recording whether the embeddings agree or are conjugate on F, and it is 0 over a real place of F.

**API.**

- `weightTwoRegulator` (constructor): The map B(F) → (complex places → R), w ↦ blochWignerHom (blochGroup.map w.embedding b).
- `weightTwoRegulator_real_place` (simp): For a real embedding sigma, blochWignerHom (blochGroup.map sigma b) = 0.
- `weightTwoRegulator_det` (constructor): The determinant on an r_2-tuple of Bloch elements.
- `weightTwoRegulator_conj` (relation): blochWignerHom (blochGroup.map (conjugate sigma) b) = - blochWignerHom (blochGroup.map sigma b).
- `weightTwoRegulator_map` (functoriality): Naturality for a field embedding F → L, with the recorded signs.

**Unit tests.**

- `totally_real` (degenerate): For a totally real field the regulator vanishes identically.
- `determinant_sign` (characterisation): The determinant changes sign under a transposition of the chosen elements or of two complex places.
- `conj_component` (characterisation): Replacing the embedding at a complex place by its conjugate negates the component.
- `eisenstein_field` (computation): F = Q(sqrt -3), w = exp(i π/3) in F: 2[w] lies in B(F), since the boundary of [w] is w wedge w^{-1} = -(w wedge w), which 2 kills in the antisymmetric quotient; [w] itself does not, since w wedge w ≠ 0 there (compare K3BlochGroups V.6). The regulator of 2[w] is +-2 D(exp(i π/3)), about +-2.0298832128, and ζ_F(2) = (1/9) π^2 3^{-1/2} 2 D(exp(i π/3)).

**Acceptance.**

- For a totally real field the regulator is zero, because there is no complex place.
- For F = Q(sqrt -3) the regulator of 2[w], w = exp(i π/3), is +-2 D(exp(i π/3)), and ζ_F(2) = (1/9) π^2 3^{-1/2} 2 D(exp(i π/3)) (checked numerically to 30 digits).
- The determinant is well defined up to sign, and the sign convention is recorded rather than left to the reader.

**Used by.**

- P.2's Borel comparison: the comparison is stated for this map
- P.4's Zagier determinant: the weight-n determinant is defined by the same pattern, with L_n in place of D
- SpecialValuesBirchTate B.8: imports the normalised determinant pattern (the restructure entry records that P.4 owns it)
- HabiroNahmSeries HB.3: the torsion criterion evaluates this map on explicit Bloch classes

**Depends on.** this roadmap: `P.2/bloch-wigner-descent`; other roadmaps: `K3BlochGroups:V.3/bloch-group`; libraries: `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.embedding`, `mathlib:NumberField.InfinitePlace.IsReal`, `mathlib:NumberField.InfinitePlace.IsComplex`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.ComplexEmbedding.conjugate`, `mathlib:NumberField.ComplexEmbedding.isReal_iff`, `mathlib:Matrix.det`.

**Used in this roadmap by.** `P.2/borel-comparison`, `P.4/zagier-determinant`, `P.6/tests`.

**Library.** module `TauCeti/NumberTheory/Regulators/WeightTwo`, namespace `TauCeti.Regulator`.

**Sources.**

- `GR.2022`, Theorem 1.1 (PDF p. 3): “Then there exist elements y_1, ..., y_{r_2} in Q[F] satisfying a certain condition *_4 ... such that zeta_F(4) = pi^{4(r_1+r_2)} |d_F|^{-1/2} det(L_4(sigma_{r_1+i}(y_j))), 1 <= i, j <= r_2.” — The weight-four shape of the determinant; the map of this node has the same shape with L_2 = D. The weight-two theorem is cited in the source to Zagier's 1986 paper, which was not read.
- `GR.2022`, 1.1, item 2 (PDF p. 3): “Similar results about zeta_F(2) and zeta_F(3) were proved in [Zag86] and [Gon91], [Gon95], respectively.” — The weight-two case this regulator is built for.

### The Bloch-Wigner cocycle of GL_2(C)

`P.2/bloch-wigner-cocycle` · construction · first packet

For x in the complex projective line and g_1, ..., g_4 in GL_2(C), set c_x(g_1, ..., g_4) = D(r(g_1 x, ..., g_4 x)), where r is Goncharov's cross-ratio, normalised by r(∞, 0, 1, t) = t, and c_x = 0 when two of the points coincide. It is a measurable GL_2(C)-invariant homogeneous 3-cocycle, the cocycle identity being the alternating five-term relation, and its cohomology class does not depend on x.

**Hypotheses.**

- x is a point of the projective line; g_1, ..., g_4 are in GL_2(C).
- r(a, b, c, d) = 1/cr(a, b, c, d) for the cross-ratio of K3BlochGroups:V.4/cross-ratio (cr(0, ∞, 1, t) = t); since D(1/t) = -D(t), using cr instead flips every sign.

**Construction.**

1. Invariance: r is invariant under the diagonal action of PGL_2(C).
2. Cocycle identity: sum_{i=0}^4 (-1)^i c_x(g_0, ..., g_i-hat, ..., g_4) = 0 is the alternating five-term relation of P.1/bloch-wigner-five-term (degenerate tuples give 0 on both sides).
3. Measurability: c_x is continuous off the closed set of degenerate tuples.
4. Independence of x: c_x - c_y is the coboundary of (g_1, g_2, g_3) ↦ D(r(g_1 x, g_2 x, g_3 x, y))-type terms, as in the source's remark that different points give canonically cohomologous cocycles.

**API.**

- `blochWignerCocycle` (constructor): c_x(g_1, ..., g_4) := D(r(g_1 x, ..., g_4 x)), 0 on degenerate tuples.
- `blochWignerCocycle_smul` (characterisation): c_x(g g_1, ..., g g_4) = c_x(g_1, ..., g_4).
- `blochWignerCocycle_cocycle` (relation): The homogeneous cocycle identity.
- `blochWignerCocycle_measurable` (characterisation): c_x is measurable.
- `blochWignerCocycle_cohomologous` (characterisation): c_x and c_y differ by a coboundary, so the class does not depend on x.

**Unit tests.**

- `standard_quadruple` (computation): For x = 0, g_1 = (0 1; 1 0), g_2 = 1, g_3 = (1 1; 0 1), g_4 = (1 z; 0 1), the points are ∞, 0, 1, z, and c_x(g_1, ..., g_4) = D(z); at z = i this is Catalan's constant.
- `degenerate_tuple` (degenerate): If g_1 x = g_2 x then c_x(g_1, ..., g_4) = 0.
- `cocycle_is_five_term` (characterisation): The cocycle identity at (g_0, ..., g_4) sending x to ∞, 0, 1, a, b is the two-variable five-term relation at (a, b).
- `convention_sign` (non-example): With V.4's cross-ratio cr in place of r the cocycle is -c_x: D(cr(∞, 0, 1, z)) = -D(z).

**Acceptance.**

- The value at the standard quadruple (∞, 0, 1, z) is D(z).
- The cocycle identity is the alternating five-term relation.

**Used by.**

- P.2's Borel comparison: its class is compared with the Borel class b_3
- BorelRegulators R.4 and R.7: the Borel class it is compared with lives there

**Depends on.** this roadmap: `P.1/bloch-wigner-five-term`, `P.1/bloch-wigner-dilogarithm`; other roadmaps: `K3BlochGroups:V.4/cross-ratio`; libraries: `mathlib:Matrix.GeneralLinearGroup`.

**Used in this roadmap by.** `P.2/borel-comparison`.

**Library.** module `TauCeti/NumberTheory/Regulators/WeightTwo`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Introduction, item 6, (12) (PDF p. 8): “For any point x in CP^{n-1} the function c^n_{2n-1}(g_1, ..., g_{2n}) := L^G_n(g_1 x, ..., g_{2n} x) (12) is a measurable (2n-1)-cocycle of the Lie group GL_n(C).” — The cocycle at n = 2.
- `Gonch.Arakelov.2004`, Introduction, item 5, (11) (PDF p. 7): “It follows from (8) that the Grassmannian dilogarithm is given by the Bloch-Wigner function: L^G_2(z_1, ..., z_4) = L_2(r(z_1, ..., z_4)) (11)” — Why the n = 2 cocycle is D of the cross-ratio.

### Comparison of the weight-two regulator with the Borel class

`P.2/borel-comparison` · theorem · planet “Borel comparison at weight two” · first packet

There is q in ℚ^× such that, for every number field F, the composite K_3^ind(F)_Q → B(F)_Q → R^{complex places} (K3BlochGroups V.4's Suslin map, then P.2/weight-two-regulator) equals q times the Borel regulator of BorelRegulators R.4 at every complex place. The exact value of q and its sign are not established by the sources read: they need Goncharov's Sections 5.4 and 5.5 (unread) or Bloch's lectures, and BorelRegulators R.7 owns them (gap). The comparison holds only after rationalisation.

**Hypotheses.**

- F is a number field.

**Proof.**

1. Import Suslin's exact sequence (K3BlochGroups:V.4/suslin-exact-sequence) and the map to B(F) (V.4/psi-map), which identify B(F)_Q with K_3^ind(F)_Q.
2. Import the Borel classes and the Borel regulator at each complex place from BorelRegulators R.4 (reserved id BorelRegulators:R.4/borel-regulator).
3. By Goncharov's Theorem 1.1 at n = 2 with (11), the class of the Bloch-Wigner cocycle (P.2/bloch-wigner-cocycle) is a nonzero rational multiple of the Borel class b_3; pairing both with K_3(C) through the Hurewicz map gives the comparison with some q in ℚ^×. The proof of Theorem 1.1 is in Goncharov's Sections 4 and 5, which were not read (the gap on the Grassmannian half).
4. Record that the comparison is only after rationalisation: a real regulator kills torsion, so it cannot be used to identify two integral models, and the roadmap forbids doing so.
5. Record that the exact q and its sign are BorelRegulators R.7's (gap), so that no consumer reads them from this node.

**Acceptance.**

- Both sides vanish for a totally real field, which has no complex place.
- The statement gives some q in ℚ^× and no more; K3BlochGroups V.6/regulator-agreement must take the exact scalar and sign from BorelRegulators R.7.
- The comparison does not transfer to the integral groups, which is the limitation the statement records.

**Depends on.** this roadmap: `P.2/weight-two-regulator`, `P.2/bloch-wigner-cocycle`; other roadmaps: `K3BlochGroups:V.4/psi-map`, `K3BlochGroups:V.4/suslin-exact-sequence`, `BorelRegulators:R.4/borel-regulator`.

**Used in this roadmap by.** `P.5/reciprocity-algebraic-numbers`.

**Sources.**

- `Gonch.Arakelov.2004`, Introduction, item 6, Theorem 1.1 (PDF p. 8): “Theorem 1.1 The cohomology class of the Grassmannian cocycle (12) is a non zero rational multiple of the Borel class b2n-1 .” — At n = 2, by (11), the Grassmannian cocycle is D of the cross-ratio, so its class is a nonzero rational multiple of b_3.
- `Gonch.Arakelov.2004`, Introduction, item 6 (PDF p. 8): “For normalization of the Borel classes and precise relationship between the Grassmannian polylogarithms and the Borel regulator see Chapter 5, especially Sections 5.4 and 5.5.” — Why the exact scalar is not fixed here: those sections were not read.

**Assembly note.** The exact q and its sign belong to this layer: the P.2 part owns the analytic comparison and its scalar, and BorelRegulators R.7 and K3BlochGroups V.6/regulator-agreement consume it (confirmed red-team finding RT-AREA-ktheory-2/23). Where the statement and step 5 say that R.7 owns them, read: they are P.2's, still open as the P.2 part's gap 'Map-level Borel normalization'; no R.7 node is a premise here. The calibration Goncharov's proof rests on fails as printed (`P.2/goncharov-elementary-calibration`, source issue E22 of the P.2 part), so Theorem 5.7's 1/12 and Corollary 5.10's 1/24 are not taken as the scalar. Step 3 records Goncharov's §§4–5 as unread: the P.2 part has since read §§5.1–5.6 and Appendix 7 of the published paper; §4, the Grassmannian polylogarithms, is still not decomposed.

### The Bloch-Wigner function through Lobachevsky's function

`P.2/lobachevsky-identity` · lemma · first packet

Let L(theta) = -integral_0^theta log|2 sin t| dt be Lobachevsky's function. For Im z > 0, D(z) = L(arg z) + L(arg(1/(1 - z))) + L(arg(1 - 1/z)); the three arguments lie in (0, π), are the angles of the triangle with vertices 0, 1, z (at 0, at 1 and at z) and sum to π.

**Hypotheses.**

- Im z > 0.

**Proof.**

1. Both sides tend to 0 as z tends to a real point or to ∞: the angles degenerate to 0 or π, where L vanishes, and D vanishes on the boundary.
2. The differentials agree: dL(theta) = -log|2 sin theta| d theta, and by the law of sines the terms combine to log|z| d arg(1 - z) - log|1 - z| d arg z (P.1/bloch-wigner-differential).
3. Hence the difference is constant on the connected upper half-plane, and the constant is 0.

**Acceptance.**

- At z = exp(i π/3) the triangle is equilateral and D = 3 L(π/3) = 1.01494160640965...
- At z = i the angles are π/2, π/4, π/4 and D(i) = 2 L(π/4) = G.

**Depends on.** this roadmap: `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-differential`; libraries: `mathlib:intervalIntegral`.

**Used in this roadmap by.** `P.2/hyperbolic-volume`, `P.2/milnor-angle-volume`.

**Sources.**

- `Gonch.Arakelov.2004`, Abstract (PDF p. 1): “For n = 2 we recover Lobachevsky's formula expressing the volume of an ideal geodesic simplex in the hyperbolic space via the dilogarithm.” — The analytic half of Lobachevsky's formula; Goncharov's proof (Section 7) was not read, and the reviewer checked the identity numerically to 1e-40 at z = 0.3 + 0.7i.

**Assembly note.** The function written L(θ) here is `P.2/lobachevsky-function`, Milnor's Λ(θ); the Lean file has the single declaration `lobachevsky` for both.

### The cross-ratio cocycle and the volume of an ideal tetrahedron

`P.2/hyperbolic-volume` · theorem · planet “Lobachevsky's volume formula” · first packet

For distinct points z_1, ..., z_4 of the complex projective line, the boundary of hyperbolic 3-space, the ideal tetrahedron I(z_1, ..., z_4) has oriented volume vol I(z_1, ..., z_4) = D(r(z_1, ..., z_4)), with Goncharov's cross-ratio r(∞, 0, 1, x) = x, oriented so that (∞, 0, 1, z) with Im z > 0 has positive volume D(z). Equivalently it is -D(cr(z_1, ..., z_4)) with K3BlochGroups V.4's cr(0, ∞, 1, x) = x, and -D([z_1, ..., z_4]) with GR's cross-ratio (3). The five-term relation is additivity of volume: the two triangulations, into 2 and into 3 ideal tetrahedra, of the convex hull of five ideal points give sum_i (-1)^i I(z_1, ..., z_i-hat, ..., z_5) = 0 as chains. The Riemannian metric/volume foundations and the model hyperbolic geometry are requested from GeometricTopology layers 7 and 8. The ideal-boundary identification with the complex projective line, oriented ideal tetrahedra and their finite-volume geometry require an early extension of those suppliers, recorded as a gap and a GeometricTopology Part II proposal. The manifold-level comparison is ArithmeticQuantumTopology QT.5's. P.2 is the sole owner of this ideal-tetrahedron identity, including the Milnor/Lobachevsky formula needed in its proof; QT.5 imports the result for its manifold-level volume sum.

**Hypotheses.**

- The four points are distinct points of the complex projective line.
- The ambient volume is the Riemannian volume for the curvature -1 metric. GeometricTopology layers 7 and 8 supply the metric/measure foundations and model geometry, but do not state the ideal-boundary, ideal-tetrahedron and finite-region-volume interface. That early geometric extension and P.2's Milnor/Lobachevsky comparison proof are separate recorded gaps; closed-manifold Mostow invariance is not used to fill either gap.

**Proof.**

1. Import the cross-ratio from K3BlochGroups:V.4/cross-ratio and record the conversions r = 1/cr and [a, b, c, d] = 1 - 1/cr(a, b, c, d), so that D o r = -D o cr = -D o [ , , , ] (checked numerically).
2. By invariance, reduce to (∞, 0, 1, z) with Im z > 0; by Milnor's formula (gap) its volume is L(alpha) + L(beta) + L(gamma) over the angles of the triangle (0, 1, z), which is D(z) by P.2/lobachevsky-identity.
3. Identify the five-term relation with the two triangulations, into 2 and into 3 ideal tetrahedra, of the convex hull of five ideal points.
4. Import the Riemannian metric and volume foundations from GeometricTopology layer 7 and the hyperbolic model geometry from layer 8. Obtain the ideal-boundary/oriented-tetrahedron/finite-region-volume interface from an early GeometricTopology Part II extension (gap), independent of QT.5's manifold Bloch and volume comparisons. Prove the Milnor/Lobachevsky tetrahedron identity only in P.2, retaining its proof gap. ArithmeticQuantumTopology QT.5 consumes the identity; it is not an input to P.2.

**Acceptance.**

- The volume is positive for a positively oriented tetrahedron (P.1/bloch-wigner-positivity) and changes sign under an odd permutation of the vertices.
- The regular ideal tetrahedron, with cross-ratio a primitive sixth root of unity, has the maximal volume D(exp(i π/3)) = 1.01494160640965...
- The subdivision identity is the five-term relation.

**Used by.**

- ArithmeticQuantumTopology QT.5: imports this identity for the volume of a hyperbolic manifold through its Bloch class, rather than proving it again
- P.2's Borel comparison: Bloch's route to the identification of the regulator goes through this volume computation; the route planned here goes through the cocycle

**Depends on.** this roadmap: `P.1/bloch-wigner-five-term`, `P.1/bloch-wigner-positivity`, `P.2/lobachevsky-identity`; other roadmaps: `K3BlochGroups:V.4/cross-ratio`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition`.

**Sources.**

- `Gonch.Arakelov.2004`, Abstract and introduction (PDF p. 1): “For n = 2 we recover Lobachevsky's formula expressing the volume of an ideal geodesic simplex in the hyperbolic space via the dilogarithm.” — The volume formula in the weight-two case, as the source states it.
- `Gonch.Arakelov.2004`, Introduction, item 5 (PDF p. 7): “formula relates its volume to the Bloch-Wigner function: vol I(z1 , ..., z4 ) = L2 (r(z1 , ..., z4 ))” — The volume formula with Goncharov's cross-ratio, whose normalisation r(∞, 0, 1, x) = x is fixed in his Section 6 (p. 53).

**Assembly note.** Milnor's formula, which step 2 records as a gap, is `P.2/milnor-angle-volume`, built on `P.2/lobachevsky-function`, `P.2/lobachevsky-fourier` and `P.2/lobachevsky-duplication`; it is this node's direct proof input. Both theorems are stated on the ideal-region carrier of the requested GeometricTopology Part II (the P.2 part's gap 2), so neither has a Lean signature yet.

### Certified numerical evaluation of the Bloch-Wigner function

`P.2/certified-numerics` · construction · first packet

Construct blochWignerApprox : Q x Q → N → Q, a computable function taking a Gaussian rational z = a + bi in Q(i) - {0, 1} and a precision p, together with the error theorem of P.2/certified-numerics-error bounding |blochWignerApprox z p - D(z)| by 2^{-p}. The numerical function is not the definition of the regulator, and a numerical value is not a proof that an exact value is nonzero unless its absolute value exceeds the error bound; the statement says so. Because the input is exact and the output rational, the error theorem cannot be satisfied by defining the approximation to be D itself.

**Hypotheses.**

- The point is a Gaussian rational z in Q(i) - {0, 1}, given as a pair of rationals.
- The precision is a natural number p, and the target accuracy is 2^{-p}.

**Construction.**

1. Reduce the argument into a region of fast convergence using D(1/z) = -D(z), D(1 - z) = -D(z) and D(conj z) = -D(z) (P.1/bloch-wigner-dilogarithm), recording each reduction step as an exact identity.
2. Away from the unit circle truncate the series of Li_2 at a length determined by the precision and bound the tail explicitly. Near |z| = 1, where the reduction cannot help (the orbit of exp(+-i π/3) under z ↦ 1 - z and z ↦ 1/z stays on the circle and the series tail is about 1/N), use Li_2(e^w) = ζ(2) + w(1 - log(-w)) + sum_{k≥2} ζ(2 - k) w^k/k! for |w| < 2π, which converges geometrically (gap: not in the sources read; checked numerically to 2e-31 at w = i π/3).
3. Bound the error of the elementary terms, the logarithm and the argument, by rational interval arithmetic.
4. The error theorem and the separation lemma are P.2/certified-numerics-error.

**API.**

- `blochWignerApprox` (constructor): The computable approximation Q x Q → N → Q.
- `blochWignerApprox_error` (characterisation): |blochWignerApprox z p - D(z)| ≤ 2^{-p}. Promoted to Polylogarithms:P.2/certified-numerics-error.
- `blochWignerApprox_ne_zero` (characterisation): If |blochWignerApprox z p| > 2^{-p} then D(z) ≠ 0. Promoted to Polylogarithms:P.2/certified-numerics-error.
- `blochWignerApprox_mono` (compatibility): The error bound 2^{-p} decreases as p grows.

**Unit tests.**

- `known_value` (computation): |blochWignerApprox (0, 1) p - sum_{k<N} (-1)^k/(2k+1)^2| ≤ 2^{-p} + 1/(2N+1)^2 for all N.
- `bound_tends_to_zero` (characterisation): The error bound tends to zero as the precision grows.
- `zero_at_real` (degenerate): For a real rational a ≠ 0, 1: |blochWignerApprox (a, 0) p| ≤ 2^{-p}.
- `not_a_proof` (non-example): A numerical value whose absolute value is below the error bound does not prove nonvanishing: |blochWignerApprox (2, 0) p| ≤ 2^{-p}, and indeed D(2) = 0.

**Acceptance.**

- At a point where the true value is known exactly, for instance the imaginary unit, the numerical value agrees to the stated precision.
- The error bound tends to zero as the precision grows.
- A numerical value smaller than the error bound proves nothing, which is the non-example the roadmap asks for.

**Used by.**

- P.6's tests: the five-term relation at algebraic points is checked numerically only after this error theorem
- P.4's determinant identity: a numerical check of the Zagier determinant is meaningful only with this bound

**Depends on.** this roadmap: `P.1/bloch-wigner-dilogarithm`, `P.1/distribution-and-inversion`, `P.1/classical-polylogarithm`; libraries: `mathlib:riemannZeta`.

**Used in this roadmap by.** `P.2/certified-numerics-error`.

**Library.** module `TauCeti/NumberTheory/Regulators/WeightTwo`, namespace `TauCeti.Regulator`.

**Sources.**

- `GR.2022`, 1.1, item 2 (PDF p. 3): “Zagier's conjecture predicts that the classical regulator formula ... has analogs for zeta_F(n) for any positive integer n.” — The determinant identities these numerics are used to test; the source states them exactly, and the numerical evaluation is a separate object.

**Assembly note.** The P.2 part supplies the implementation: `P.2/rational-fourier-approximation`, A(z, p) = ½ Σ_j S_{3·2^p}(W_j(z)), through Kummer's reduction to the unit circle and exact rational Fourier sums, with |A(z, p) − D(z)| ≤ 1/(2·2^p) ≤ 2^{−p} (`P.2/rational-fourier-error`). Step 2's expansion of Li_2(e^w) near the circle, recorded as a gap, is not needed. The Lean file keeps `blochWignerApprox` for this contract and `blochWignerFourierApprox` for the construction.

### The error theorem for the certified Bloch-Wigner numerics

`P.2/certified-numerics-error` · theorem · first packet

For z in Q(i) - {0, 1} and p in N: |blochWignerApprox z p - D(z)| ≤ 2^{-p}. Consequently, if |blochWignerApprox z p| > 2^{-p} then D(z) ≠ 0, and if two approximations differ by more than 2^{-p} + 2^{-q} then the two values of D differ.

**Hypotheses.**

- z is a Gaussian rational other than 0 and 1; p is a natural number.

**Proof.**

1. Sum the error bounds of the reduction, the truncation (or the expansion near the circle) and the elementary terms.
2. The separation lemma follows by the triangle inequality.

**Acceptance.**

- At z = i and p = 20 the approximation lies within 2^{-20} of Catalan's constant.
- The five-term sum at the points of P.6/tests is within 5 * 2^{-p} of 0.

**Depends on.** this roadmap: `P.2/certified-numerics`, `P.1/bloch-wigner-dilogarithm`.

**Used in this roadmap by.** `P.6/tests`.

**Sources.**

- `GR.2022`, 1.1, item 2 (PDF p. 3): “Zagier's conjecture predicts that the classical regulator formula ... has analogs for zeta_F(n) for any positive integer n.” — The determinant identities these numerics are used to test; the source states them exactly, and the numerical evaluation is a separate object.

**Assembly note.** With the Fourier implementation of `P.2/certified-numerics` this bound follows from `P.2/rational-fourier-error`, which also gives the bound Σ|n_i|2^{−p_i} for integer combinations.

### Lobachevsky function

`P.2/lobachevsky-function` · definition · planet “Lobachevsky function” · P.2 part

For every real theta define Lambda(theta)=-integral from 0 to theta of log|2 sin t| dt, using the signed native interval integral and Real.log. The integrand is locally integrable despite its logarithmic singularities. The normalization is Milnor’s Lambda; the Clausen function Cl_2(2theta) is 2 Lambda(theta), not Lambda(theta).

**Construction.**

1. Use intervalIntegrable_log_sin and log|2 sin t|=log 2+log(sin t) away from sin t=0; the exceptional multiples of π have measure zero.
2. Define the signed interval integral. Its additivity and substitution t↦-t give oddness; π-periodicity follows from sin(t+π)=-sin t and integral_log_sin_zero_pi.
3. Local integrability gives continuity of the primitive; away from sin theta=0 the continuous-integrand fundamental theorem gives derivative -log|2 sin theta|.

**API.**

- `TauCeti.Polylog.lobachevsky_integrand_intervalIntegrable` (compatibility): log|2 sin t| is interval integrable between any two real endpoints.
- `TauCeti.Polylog.lobachevsky_zero` (simp): Lambda(0)=0.
- `TauCeti.Polylog.lobachevsky_pi_div_two` (simp): Lambda(π/2)=0.
- `TauCeti.Polylog.lobachevsky_neg` (relation): Lambda(-theta)=-Lambda(theta).
- `TauCeti.Polylog.lobachevsky_add_pi` (relation): Lambda(theta+π)=Lambda(theta).
- `TauCeti.Polylog.lobachevsky_continuous` (structure): Lambda is continuous on R.
- `TauCeti.Polylog.lobachevsky_hasDerivAt` (characterisation): If sin theta ≠ 0, Lambda has derivative -log|2 sin theta| at theta.
- `TauCeti.Polylog.lobachevsky_integral_compat` (compatibility): Lambda(π)=-(integral_0^π log(sin t)dt)-π log 2=0, using the native log-sine integral.

**Unit tests.**

- `lobachevsky_zero` (degenerate): Lambda(0)=0.
- `lobachevsky_half_period` (computation): Lambda(π/2)=0.
- `lobachevsky_catalan_half` (computation): Lambda(π/4)=(1/2) sum_{k≥0} (-1)^k/(2k+1)^2.
- `lobachevsky_native_integral` (compatibility): Lambda(π)=-(integral_0^π log(sin t)dt)-π log 2=0.

**Acceptance.**

- The π/4 test distinguishes Lambda from twice Lambda.
- No positivity assertion is made for all angles: Lambda(2pi/3)=-Lambda(π/3).

**Used by.**

- Milnor, Appendix Lemma 2; P.2/hyperbolic-volume: Its sum at the three dihedral angles is the tetrahedron volume.
- Polylogarithms:P.2/lobachevsky-identity: Its angle values identify the existing Bloch–Wigner function.

**Depends on.** libraries: `mathlib:intervalIntegral`, `mathlib:intervalIntegrable_log_sin`, `mathlib:integral_log_sin_zero_pi`.

**Used in this roadmap by.** `P.2/lobachevsky-fourier`, `P.2/milnor-angle-volume`.

**Library.** declaration `TauCeti.Polylog.lobachevsky`.

**Sources.**

- `milnor1982`, Appendix, p.17, definition and Lemma 1: “terms of the function” — The precise integral normalization and elementary symmetries.

### Lobachevsky Fourier series

`P.2/lobachevsky-fourier` · theorem · P.2 part

For every theta in R, the absolutely convergent series (1/2) sum_{n≥1} sin(2n theta)/n^2 has sum Lambda(theta); convergence is uniform in theta.

**Proof.**

1. For 0<r<1 expand -log(1-r exp(2it)) using P.1/classical-polylogarithm at weight one, and integrate its real part on a compact interval.
2. Let r increase to 1. For t away from π Z use the log-sine identity; near each zero use an integrable logarithmic bound. Native intervalIntegrable_log_sin supplies the limiting integral.
3. The integrated coefficients are bounded by 1/(2n^2). Real.summable_nat_pow_inv with p=2 yields absolute and uniform convergence, permitting the endpoint passage. Both sides vanish at theta=0.

**Acceptance.**

- The n=1 coefficient is sin(2theta)/2.
- At theta=π/4 this gives half the alternating odd reciprocal-square series.

**Depends on.** this roadmap: `P.2/lobachevsky-function`, `P.1/classical-polylogarithm`; libraries: `mathlib:intervalIntegrable_log_sin`, `mathlib:Real.summable_nat_pow_inv`.

**Used in this roadmap by.** `P.2/lobachevsky-duplication`, `P.2/kummer-unit-reduction`.

**Library.** declaration `TauCeti.Polylog.lobachevsky_fourier`.

**Sources.**

- `milnor1982`, Appendix, p.18, Fourier equation (2): “Fourier series” — The series is twice Lambda; its uniformity follows from the p-series majorant.

### Lobachevsky duplication identity

`P.2/lobachevsky-duplication` · theorem · P.2 part

For every real theta, Lambda(2theta)=2 Lambda(theta)+2 Lambda(theta+π/2).

**Proof.**

1. Use lobachevsky-fourier and absolute convergence to add the two series termwise.
2. sin(2n(theta+π/2))=(-1)^n sin(2n theta); odd n cancel. Reindex the even terms n=2k to obtain the factor 2.

**Acceptance.**

- Theta=π/6 is consistent with Lambda(2pi/3)=-Lambda(π/3).

**Depends on.** this roadmap: `P.2/lobachevsky-fourier`.

**Used in this roadmap by.** `P.2/milnor-angle-volume`.

**Library.** declaration `TauCeti.Polylog.lobachevsky_duplication`.

**Sources.**

- `milnor1982`, Appendix, Lemma 1, distribution identity with n=2: “odd” — The n=2 specialization used to evaluate the half-space sector integral.

### Bloch–Wigner Fourier series on the circle

`P.2/unit-circle-fourier` · theorem · P.2 part

For w in C with norm w=1, sum_{n≥1} Im(w^n)/n^2 is absolutely convergent and has sum D(w), including w=1. Here D is exactly the P.1 Bloch–Wigner function, extended by D(0)=D(1)=0.

**Proof.**

1. For r<1 use the P.1 Li_2 power series at rw. Bound its coefficients by 1/n^2 independently of r.
2. Pass to r=1 using P.1 closed-disc continuity and the summable p-series majorant; take imaginary parts.
3. Since log norm w=0, the Bloch–Wigner correction vanishes. At w=1 every imaginary coefficient and D(1) are zero.

**Acceptance.**

- w=i gives the alternating odd reciprocal-square series.
- w=-1 gives zero; conjugating w negates the series.

**Depends on.** this roadmap: `P.1/classical-polylogarithm`, `P.1/bloch-wigner-dilogarithm`, `P.1/single-valued-continuity`; libraries: `mathlib:Real.summable_nat_pow_inv`.

**Used in this roadmap by.** `P.2/unit-circle-fourier-tail`, `P.2/kummer-unit-reduction`.

**Library.** declaration `TauCeti.Polylog.blochWigner_unit_fourier`.

**Sources.**

- `zagier-dilog`, I.3, p.11, series immediately after equation (2): “unit circle” — The circle series, including endpoints by continuity.

### Uniform unit-circle Fourier error

`P.2/unit-circle-fourier-tail` · theorem · P.2 part

For w in C with norm w=1 and integer N≥1, |D(w)-sum_{n=1}^N Im(w^n)/n^2|≤1/N. The bound is uniform, including w=1 and points arbitrarily close to it.

**Proof.**

1. Use unit-circle-fourier to express the difference as the absolutely convergent tail.
2. Bound |Im(w^n)| by norm(w^n)=1. Apply the native sum_Ioc_inv_sq_le_sub with k=N and let the upper endpoint tend to ∞.
3. This gives sum_{n>N} 1/n^2≤1/N; no separation from 1 or the real axis is needed.

**Acceptance.**

- N starts at 1; no division-by-zero bound at N=0.
- The bound applies to the exact rational unit shapes.

**Depends on.** this roadmap: `P.2/unit-circle-fourier`; libraries: `mathlib:sum_Ioc_inv_sq_le_sub`.

**Used in this roadmap by.** `P.2/rational-fourier-error`.

**Library.** declaration `TauCeti.Polylog.blochWigner_unit_fourier_tail`.

**Sources.**

- `zagier-dilog`, I.3, p.11, unit-circle series: “unit circle” — The stated explicit tail is a proved consequence using the pinned p-series bound, not a quoted source bound.

### Kummer unit-circle reduction

`P.2/kummer-unit-reduction` · theorem · planet “Kummer’s formula” · P.2 part

For z in C minus {0,1}, put u0=z, u1=1/(1-z), u2=1-1/z and wj=uj/conj(uj). Then each wj has norm 1 and D(z)=(D(w0)+D(w1)+D(w2))/2. The identity holds in both half-planes and on the real axis; no argument branch or cut exclusion is added.

**Proof.**

1. All uj are nonzero for the stated z. Multiplicativity of the native complex norm proves that every wj lies on the unit circle.
2. Prove Kummer’s identity using P.1/bloch-wigner-differential: differentiate the difference on the upper and lower half-planes, substituting the three rational functions and the logarithm identities for their absolute values.
3. The derivative of the difference is zero on each half-plane. Its limit at a real point z not equal to 0 or 1 is zero by P.1/single-valued-continuity and the real-axis vanishing of D. Extend to all remaining real points by those same facts.
4. With wj=exp(2i arg uj), the unit-circle and Lobachevsky Fourier formulas give the global angle expression. Its upper-half-plane specialization agrees with the inherited P.2/lobachevsky-identity.

**Acceptance.**

- z=i has w0=-1 and w1=w2=i; the formula reads D(i)=(0+2D(i))/2.
- A real z not equal to 0 or 1 gives wj=1 and both sides zero.

**Depends on.** this roadmap: `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-differential`, `P.1/single-valued-continuity`, `P.2/unit-circle-fourier`, `P.2/lobachevsky-fourier`; libraries: `mathlib:Complex.norm_def`, `mathlib:Complex.arg`.

**Used in this roadmap by.** `P.2/rational-fourier-error`.

**Library.** declaration `TauCeti.Polylog.blochWigner_kummer`.

**Sources.**

- `zagier-dilog`, I.3, pp.10–11, equation (2): “Kummer” — Precisely the three conjugate ratios; division by 2 is essential.

### Rational unit-circle shapes

`P.2/rational-unit-shapes` · construction · P.2 part

For a rational pair z=(a,b), produce rational pairs W_j(z), j=0,1,2. For z=0 or 1 set all W_j=(1,0). Otherwise set rho(x,y)=((x^2-y^2)/(x^2+y^2),2xy/(x^2+y^2)), W0=rho(a,b), W1=rho(1-a,b), W2=rho(a-1,b) multiplied by the conjugate of W0, using (x,y)(s,t)=(xs-yt,xt+ys). This is a computable rational construction; its complex interpretation is established in rational-unit-shapes-correct.

**Construction.**

1. Check the two exceptional rational pairs by decidable equality and use the stated total extension.
2. On valid input, a^2+b^2 and (a-1)^2+b^2 are nonzero. The displayed rational formulas are therefore the exact conjugate ratios, not approximations.
3. Use native Complex.mul_re and mul_im for compatibility; the rational-square calculation gives x_j^2+y_j^2=1.

**API.**

- `TauCeti.Polylog.rationalUnitShapes_zero` (simp): W_j(0,0)=(1,0) for every j.
- `TauCeti.Polylog.rationalUnitShapes_one` (simp): W_j(1,0)=(1,0) for every j.
- `TauCeti.Polylog.rationalUnitShapes_conj` (functoriality): W_j(a,-b) is the rational conjugate of W_j(a,b).
- `TauCeti.Polylog.rationalUnitShapes_real` (simp): For every rational a, W_j(a,0)=(1,0).
- `TauCeti.Polylog.rationalUnitShapes_correct` (compatibility): For valid z, the embedded W_j are the Kummer ratios and have norm one.

**Unit tests.**

- `unit_shapes_i` (computation): At (0,1), (W0,W1,W2)=((-1,0),(0,1),(0,1)).
- `unit_shapes_exceptional` (degenerate): At both 0 and 1 every shape is (1,0).
- `unit_shapes_real_two` (computation): At (2,0) every shape is (1,0).
- `unit_shapes_native_norm` (compatibility): For every valid rational input, norm of the native complex embedding of every W_j is one.

**Acceptance.**

- All divisions take place in Q; no real-to-rational approximation is invoked.

**Used by.**

- P.2/kummer-unit-reduction: Replaces the three complex ratios by exact rational coordinates.
- P.2/rational-fourier-approximation: Provides inputs of norm one with rational powers.

**Depends on.** libraries: `mathlib:Complex`, `mathlib:Complex.mul_re`, `mathlib:Complex.mul_im`.

**Used in this roadmap by.** `P.2/rational-unit-shapes-correct`, `P.2/rational-fourier-approximation`.

**Library.** declaration `TauCeti.Polylog.rationalUnitShapes`.

**Sources.**

- `zagier-dilog`, I.3, equation (2), specialized to Q(i): “Kummer” — The displayed rho arithmetic is the explicit rational specialization of the source ratios.

### Exact complex interpretation of rational shapes

`P.2/rational-unit-shapes-correct` · lemma · P.2 part

If (a,b) is neither (0,0) nor (1,0), let z=a+bi in native C. Embedding W_j into C gives respectively z/conj z, (1/(1-z))/conj(1/(1-z)), and (1-1/z)/conj(1-1/z), and all three embedded pairs have norm one.

**Proof.**

1. Establish nonzero denominators from the rational input hypotheses.
2. For W0 and W1 use complex coordinate division; for W2 multiply the ratio of z-1 by the conjugate of the ratio of z.
3. Apply native coordinate multiplication and norm_def; the identities are rational polynomial calculations after clearing the nonzero denominators.

**Acceptance.**

- The second shape has plus 2(1-a)b in its imaginary coordinate; the opposite sign gives the wrong D(i) test.

**Depends on.** this roadmap: `P.2/rational-unit-shapes`; libraries: `mathlib:Complex.mul_re`, `mathlib:Complex.mul_im`, `mathlib:Complex.norm_def`.

**Used in this roadmap by.** `P.2/rational-fourier-error`.

**Library.** declaration `TauCeti.Polylog.rationalUnitShapes_correct`.

**Sources.**

- `zagier-dilog`, I.3, equation (2), the three ratios: “Kummer” — This comparison promotes the construction’s compatibility API used in the error theorem.

### Finite rational Fourier sum

`P.2/rational-fourier-sum` · definition · P.2 part

For w=(x,y) in Q^2 and N in N define q0=(1,0), q_{n+1}=(q_n.re*x-q_n.im*y,q_n.re*y+q_n.im*x), and S_N(w)=sum_{n=1}^N q_n.im/n^2 in Q. The recurrence is finite and uses exact rational arithmetic. No unit-norm hypothesis is required to define S_N; it is required for the uniform analytical error.

**Construction.**

1. Use a primitive recursion on n for the pair coordinates and a finite sum over indices 1 through N.
2. Induction using native Complex.mul_re and mul_im identifies q_n with the coordinates of (x+iy)^n.
3. Conjugation negates imaginary coordinates, so S_N(conj w)=-S_N(w); the zero-length sum is zero.

**API.**

- `TauCeti.Polylog.rationalFourierSum_zero` (simp): S_0(w)=0.
- `TauCeti.Polylog.rationalFourierSum_one` (simp): S_N(1,0)=0 for every N.
- `TauCeti.Polylog.rationalFourierSum_conj` (functoriality): S_N(x,-y)=-S_N(x,y).
- `TauCeti.Polylog.rationalFourierSum_succ` (relation): S_{N+1}(w)=S_N(w)+Im((x+iy)^{N+1})/(N+1)^2 after coercion to R.
- `TauCeti.Polylog.rationalFourierSum_coe` (compatibility): Coercing S_N(w) to R equals the finite sum of native Im((x+iy)^n)/n^2.

**Unit tests.**

- `fourier_sum_i_three` (computation): S_3(0,1)=8/9.
- `fourier_sum_empty` (degenerate): S_0(2,3)=0.
- `fourier_sum_one` (computation): S_7(1,0)=0.
- `fourier_sum_native_powers` (compatibility): For every rational pair and N, the coerced rational sum equals the native complex-power sum.

**Acceptance.**

- S_3(0,1)=8/9, S_0(w)=0.
- The recurrence computes powers, rather than repeating the first imaginary coordinate.

**Used by.**

- P.2/rational-fourier-approximation: Evaluates the three circle sums with a prescribed finite length.
- P.2/unit-circle-fourier-tail: The compatibility theorem converts the rational answer to a native real Fourier sum.

**Depends on.** libraries: `mathlib:Complex.mul_re`, `mathlib:Complex.mul_im`.

**Used in this roadmap by.** `P.2/rational-fourier-compatibility`, `P.2/rational-fourier-approximation`.

**Library.** declaration `TauCeti.Polylog.rationalFourierSum`.

**Sources.**

- `zagier-dilog`, I.3, p.11, unit-circle Fourier series: “unit circle” — Finite exact sums of the same coefficients, with a rational coordinate recurrence.

### Rational and native Fourier sums

`P.2/rational-fourier-compatibility` · comparison · P.2 part

For every rational pair w=(x,y) and N in N, the coercion of S_N(w) to R equals sum_{n=1}^N Im((x+iy)^n)/n^2, with powers and imaginary projection in Mathlib C.

**Proof.**

1. Prove the coordinate-recursion identity by induction; multiplication uses exactly the pinned mul_re and mul_im formulas.
2. Coercion Q→R preserves finite sums and quotients. Every denominator n^2 for 1≤n≤N is nonzero.
3. No norm restriction is used; the lemma separates algebraic correctness from the unit-circle analytic tail bound.

**Acceptance.**

- N=3 and w=i give 1-1/9, with the n=2 term zero.

**Depends on.** this roadmap: `P.2/rational-fourier-sum`; libraries: `mathlib:Complex.mul_re`, `mathlib:Complex.mul_im`.

**Used in this roadmap by.** `P.2/rational-fourier-error`.

**Library.** declaration `TauCeti.Polylog.rationalFourierSum_coe`.

**Sources.**

- `zagier-dilog`, I.3, p.11, Fourier coefficients: “unit circle” — Promotes the rational finite-sum compatibility API needed by the error proof.

### Certified rational Bloch–Wigner approximation

`P.2/rational-fourier-approximation` · construction · P.2 part

For every rational pair z and precision p in N define A(z,p)=(1/2) sum_{j=0}^2 S_{3*2^p}(W_j(z)). This is a total computable function Q^2×N→Q; the exceptional pairs 0 and 1 give zero. It is the explicit implementation proposed for the inherited P.2/certified-numerics contract, whose generic function is not redeclared here.

**Construction.**

1. Compute the three rational unit shapes, choose the positive integer N=3*2^p, and evaluate the three exact finite rational sums.
2. Combine them with coefficient 1/2. The construction has no choice of a rational close to an unknown real.
3. The error is supplied by rational-fourier-error. Runtime and bit sizes are not asserted polynomial in p: this deliberately simple uniform algorithm uses exponentially many terms.

**API.**

- `TauCeti.Polylog.blochWignerFourierApprox_formula` (characterisation): A(z,p)=(1/2) sum_{j=0}^2 S_{3*2^p}(W_j(z)).
- `TauCeti.Polylog.blochWignerFourierApprox_zero` (simp): A(0,p)=0.
- `TauCeti.Polylog.blochWignerFourierApprox_one` (simp): A(1,p)=0.
- `TauCeti.Polylog.blochWignerFourierApprox_real` (simp): For rational a, A((a,0),p)=0.
- `TauCeti.Polylog.blochWignerFourierApprox_conj` (functoriality): A((a,-b),p)=-A((a,b),p).
- `TauCeti.Polylog.blochWignerFourierApprox_error` (compatibility): For valid rational z, |A(z,p)-D(z)|≤2^-p, using the canonical native embedding.

**Unit tests.**

- `approx_i_precision_zero` (computation): A((0,1),0)=8/9.
- `approx_i_precision_one` (computation): A((0,1),1)=209/225.
- `approx_exceptional` (degenerate): A(0,p)=A(1,p)=0 for every p.
- `approx_real_two` (computation): A((2,0),p)=0 for every p.
- `approx_conjugate` (non-example): A((0,-1),0)=-8/9, ruling out an unsigned volume approximator.

**Acceptance.**

- The coefficient 1/2 and the length N=3*2^p are fixed, not parameters hidden in an existence assertion.
- At p=1 and z=i the answer exceeds 2^-1, giving a valid positive certificate.

**Used by.**

- Polylogarithms:P.2/certified-numerics and certified-numerics-error: Instantiates the inherited rational approximation and error contract.
- K3BlochGroups:V.6/bloch-element-constructor; P.2/weight-two-regulator: Rational enclosures certify values of finite sums of admissible Gaussian-rational generators.

**Depends on.** this roadmap: `P.2/rational-unit-shapes`, `P.2/rational-fourier-sum`.

**Used in this roadmap by.** `P.2/rational-fourier-error`.

**Library.** declaration `TauCeti.Polylog.blochWignerFourierApprox`.

**Sources.**

- `zagier-dilog`, I.3, equation (2) and following Fourier series: “Kummer” — Combines the source formulas with the proven uniform tail to specify an effective algorithm.

### Rational Fourier error certificate

`P.2/rational-fourier-error` · theorem · P.2 part

For a valid Gaussian-rational input z=a+bi and p in N, |(A((a,b),p):R)-D(z)|≤1/(2*2^p)≤2^-p. Hence A(z,p)>2^-p certifies D(z)>0, A(z,p)<-2^-p certifies D(z)<0, and |A(z,p)|>2^-p certifies D(z)≠0. For any finite integer combination sum n_i[z_i], the rational sum sum n_i A(z_i,p_i) has error at most sum |n_i|2^-p_i. This does not assert that an arbitrary combination lies in B(F); the algebraic boundary certificate stays V.6’s.

**Proof.**

1. Use rational-unit-shapes-correct to embed all three computed shapes as the Kummer ratios of norm one.
2. Apply Kummer reduction and rational-fourier-compatibility to rewrite D(z) and A(z,p) in the same three components.
3. Apply unit-circle-fourier-tail at N=3*2^p to each component. The triangle inequality gives 3/(2N)=1/(2*2^p), hence the inherited precision bound.
4. Derive the strict sign and nonvanishing implications by interval containment. For a finite integer combination, apply the triangle inequality with integer absolute values; never infer nonvanishing merely from a nonzero decimal.

**Acceptance.**

- At z=i,p=1, 209/225-1/2>0 proves a strictly positive lower bound.
- No |z|<1 assumption appears; the valid unit-circle input i is covered.
- A comparison of two outputs is decisive only when their difference exceeds the sum of the error radii.

**Depends on.** this roadmap: `P.2/rational-fourier-approximation`, `P.2/rational-unit-shapes-correct`, `P.2/rational-fourier-compatibility`, `P.2/kummer-unit-reduction`, `P.2/unit-circle-fourier-tail`.

**Library.** declaration `TauCeti.Polylog.blochWignerFourierApprox_error`.

**Sources.**

- `zagier-dilog`, I.3, equation (2) and p.11 series: “Kummer” — Error certification is a mathematical consequence of these identities and the pinned tail estimate, not a source claim of a fast algorithm.

### Milnor’s ideal-tetrahedron angle formula

`P.2/milnor-angle-volume` · theorem · P.2 part

Let T be a nondegenerate ideal geodesic tetrahedron in the explicit curvature -1 hyperbolic 3-space metric imported from GeometricTopology. For its three dihedral angles at any one vertex alpha,beta,gamma (opposite edges have equal angles), alpha,beta,gamma>0 and alpha+beta+gamma=π. Its unoriented Riemannian volume is finite and equals Lambda(alpha)+Lambda(beta)+Lambda(gamma). Ordered volume is its orientation sign times this value. Under r(∞,0,1,z)=z, Im z>0 is positive and these angles are arg z, arg(1/(1-z)), arg(1-1/z). Combined with the inherited lobachevsky-identity, this proves the inherited hyperbolic-volume target.

**Proof.**

1. Import the explicit hyperbolic metric, model isometries and Riemannian volume from GeometricTopology layers 7–8. The early Part II ideal-boundary, measurable region and orientation interface remains a precise supplier gap.
2. Move one ideal vertex to ∞ and make the opposite face the unit hemisphere in the upper-half-space model. The metric is (dx^2+dy^2+dh^2)/h^2 and volume density h^-3 dx dy dh; apply the supplied change-of-model compatibility, rather than defining a new unrelated volume.
3. Project to the triangle inscribed in the unit circle and split an acute triangle into six right sectors. For a sector with angle a in (0,π/2), integrate h from sqrt(1-x^2-y^2) to ∞, y from 0 to x tan a, x from 0 to cos a. The height integration supplies the essential factor 1/2.
4. After the elementary y integral and x=cos t substitution, the sector equals [-Lambda(π/2+a)+Lambda(2a)+Lambda(π/2-a)-Lambda(0)]/4. Oddness, periodicity and lobachevsky-duplication simplify it to Lambda(a)/2.
5. Sum the six sectors. For an obtuse inscribed triangle use the signed decomposition about its circumcentre: the difference of sector indicators equals the triangle indicator almost everywhere. Absolute integrability justifies subtraction; the same sector formula gives the sum for every positive alpha,beta,gamma summing to π.
6. Transport back by the imported orientation-preserving model isometry. Reflecting complex coordinates reverses ordered volume. Invoke the inherited P.2/lobachevsky-identity for the Bloch–Wigner identification; QT.5 consumes this result and supplies manifold triangulations and Bloch invariants.

**Acceptance.**

- The regular ideal tetrahedron has volume 3 Lambda(π/3)=D(exp(i π/3))>0.
- A reflected ordered tetrahedron has the negative volume.
- A real shape other than 0 and 1 is flat and has ordered volume zero; it is outside the nondegenerate angle hypotheses.

**Depends on.** this roadmap: `P.2/lobachevsky-function`, `P.2/lobachevsky-duplication`, `P.2/lobachevsky-identity`, `P.1/bloch-wigner-positivity`; libraries: `mathlib:Complex.arg`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`, `tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition`.

**Library.** declaration `TauCeti.Polylog.idealTetrahedron_volume_eq_lobachevsky`.

**Sources.**

- `milnor1982`, Appendix, Lemma 2 and complete proof, pp.18–20: “dihedral angles” — The independently calibrated half-space integral proves the volume normalization.
- `zagier-dilog`, I.4, pp.13–14, equations (5)–(8): “ideal tetrahedron” — The complex shape/angle interpretation and orientation convention.
- `goncharov-jams`, Appendix 7.2, p.57, equation (100): “sense of distributions” — Provides a second distributional route; its c3 derivation is not imported as a proved calibration. Independent review also found the factor-six error in the preceding Theorem 7.1 (source issue E24); Milnor supplies the volume scale.

### Corrected weight-two matrix-unit calibration

`P.2/goncharov-elementary-calibration` · comparison · P.2 part

Use the unnormalized Alt_3 of the published Goncharov paper: for E2=e12 wedge e21 wedge e22 in gl_2(C), Alt_3 Tr(e12 e21 e22)=-3 and C2(E2)=-3/2 when C2=(1/2)Alt_3 Tr as in equation (66). The Burgos trace polynomial Phi3=-(1/6)Alt_3 Tr of BorelRegulators:R.4 therefore evaluates to +1/2 on the same ordered matrices. These are explicit cochain evaluations, not an asserted equality of continuous, measurable or K-theory regulator classes.

**Proof.**

1. Read the source’s Alt definition, equation (66), equation (67) and the displayed evaluation on published p.39 together; see source issue Polylogarithms/E22.
2. Expand all six permutations using eij ekl=delta_jk eil. The three even terms have trace zero; the three odd terms have trace one. Thus the alternating trace is -3.
3. Multiply by 1/2 for the printed C2 convention and by -1/6 for the independently owned R.4 Phi3 convention.
4. The printed Theorem 5.7 yields a formal coefficient 1/12 at n=2 and Corollary 5.10 prints 1/24 against b2, but the proof calibration fails this test. Re-derive the class coefficient, beta_DR comparison, Tate division and the natural Suslin/Hurewicz map before concluding the inherited borel-comparison’s exact scalar. This is the recorded normalization gap, not a hidden prerequisite supplied by R.7.

**Acceptance.**

- Reversing e12 and e21 changes the sign to +3/2, which still does not give the printed 1.
- Do not use this calculation alone to assign a Borel-to-D scalar.

**Depends on.** other roadmaps: `BorelRegulators:R.4/trace-cocycle`; libraries: `mathlib:Matrix.trace`, `mathlib:Matrix.trace_mul_comm`.

**Library.** declaration `TauCeti.Polylog.goncharov_weightTwo_elementaryCalibration`.

**Sources.**

- `goncharov-jams`, Section 5.5, equations (66)–(67), pp.38–39; Theorem 5.7 proof: “direct computation” — The literal elementary-matrix test is corrected by an exact six-permutation calculation; source issue E22.

## P.3 — Weight-three polylogarithmic complexes

*Coverage in `Polylogarithms.json`: partial, 9 nodes.* The explicit weight ≤ 3 complexes on B_2 (V.3) and the trilogarithm group B_3 with the 22-term relation, d^2 = 0, the residue on exterior powers and on the complexes, the maps from K-theory with their degree range, the regulator compatibility, the top-degree comparison and the special-value theorem in its established form.

Remaining in this record:

- Goncharov 1995: the weight-three maps and their regulator comparison
- Transfers on the complexes (only on H^3)
- GR Proposition 5.4 (the 22-term relation and delta_3)
- Suslin 1984 (the top-degree comparison)
- Part (b) of the special-value theorem

*Coverage in `Polylogarithms--P.3.json`: planned, 27 nodes.*

Remaining in this record:

- Configuration normalization and duality verification: The independent reviewer read complete Gon95 §§4–5, including choice independence, reduction and Theorem A, and §§7–8 duality, as well as GR §§7.1–7.3. Necessary common coefficients are −3 Alt₄ and −(1/5) Alt₆, independently forced by rational valuation coordinates. Supply the full B₂-valued corrected chain square and an explicit adapter from the geometric presentation/old maps to the parent explicit B₃, tracking the printed 3/2 factor and rescaling −2/15. Reading a rational isomorphism and checking coordinates does not establish this normalization adapter.
- Analytic proof of corrected 22-term identity: Gon95 Theorem 1.3 states the needed functional identity. Supply the full derivative/constant/continuation argument for the corrected coordinate expression, or a primary detailed analytic proof; the source theorem and GR cobracket proof alone do not display this analytic step.
- Cycle-lifting higher differentials: Gon95 §9.2 asserts without displaying the unpleasant computation of higher differentials that ker δ₃ lifts to H₅(PGL₃(F),Q). Write those differentials and surviving-edge identification, then check PGL-to-stable-GL passage and primitive pairing. This is the decisive unresolved proof for the all-family conclusion; do not assume the stronger H¹Γ≃K₅^(3) conjecture.
- Suslin primary proof and primitive symbol adapter: The integral homology/Milnor statement is imported from K3BlochGroups:V.4/homological-stability, which already owns its missing Suslin 1984 source proof. The primary text was not obtained (MathNet access failed). The new work is the diagonal-symbol, primitive-Hurewicz and configuration normalization adapter. Do not claim a second proof or integral transfer compatibility. The original unscaled agreement of c₃ with the diagonal symbol was not justified: r₄ is 18 f₀, and the cited abstract quotient isomorphism does not compute the primitive/diagonal coefficient κ.
- Exact regulator-class normalization: R.4 uses Tate-divided R(2) coordinates and a Burgos-normalized class. Gon95’s original real Borel class has a different convention. The determinant exponents force a π² factor per coordinate; computing the exact universal class adapter is requested from R.7. Until then the parent plain rational-multiple wording cannot be applied to R.4 coordinates.
- Unconditional complex transfer: Only the H³ transfer is unconditional from Milnor norms. Gon95’s derived construction assumes the weight-four homotopy/residue quasi-isomorphism and does not establish tower independence of termwise B₃ transfers. P.4 owns the higher-weight hypothesis; a proof of it or a separate transfer construction is required. The required ∞ residue is a weight-four field-complex map killing constants, not the normal-complex-variety exterior residue in P.5. It must be supplied for the same complex model as the quasi-isomorphism.
- Faithful supplier interfaces in the suggested file: Comments do not restrict universally quantified Lean module variables to the parent objects. The review removes the false arbitrary-module theorems and marks them not stated under PROTOCOL §13. A revision must bind the actual parent B₂/B₃ quotient symbols, differential laws, Γ, single-valued L₃ and regulator; supply their genuine carrier/maps and quotient universal properties. Do not assume desired comparison conclusions as structure fields. Missing API/test signatures remain listed explicitly in the review.
- Discriminating comparison and descent tests: Finish the omitted API/test signatures against real supplier maps. Zero-map and type-only homology examples do not characterize the configuration comparison; its nonzero stabilized-cycle fixture is absent. The geometric relation submodule and triangle class need explicit native construction formulas, not only placeholder-defined objects. Ordinary Fin dimension transports do not justify omitting all general duality API. The review report inventories each omission; at least three meaningful tests per definition/construction must survive.

The layer has 36 nodes: the first packet's nine, which build the explicit weight-three complex and state the comparison theorems and the special-value theorem, and the P.3 part's twenty-seven, which decompose Goncharov's 1995 construction of the comparison maps from the geometry of configurations.

- **The explicit complexes.** For an infinite field F the complexes B(F; n), n ≤ 3, live in degrees [1, n] with differential of degree +1: B(F; 1) = F^×_ℚ, B(F; 2) : B_2(F) → ⋀²F^×_ℚ and B(F; 3) : B_3(F) → B_2(F) ⊗ F^×_ℚ → ⋀³F^×_ℚ, with d{x}_2 = (1 − x) ∧ x, d({x}_2 ⊗ y) = (1 − x) ∧ x ∧ y and d{x}_3 = {x}_2 ⊗ x. B_2(F) is K3BlochGroups V.3's pre-Bloch group tensored with ℚ, and B_3(F) = ℚ[F]/R_3(F) is the explicit trilogarithm group of GR v5 §1.2: inversion, the three-term relation, {0}_3 and Goncharov's 22-term relation. d² = 0 is visible on a generator because x ∧ x = 0. Residues on ⋀^n of the units and on the complexes commute with d rationally (integrally the weight-two residue needs 2 inverted), and are natural with the ramification index.
- **The 22-term relation in coordinates.** R(a, b, c) = Cyc_3([A] + [A/(ca)] + [c] + [B/(Ab)] − [A/c] + [−Ba/A] − [B/(Abc)] − [1]) + [−abc], with A = ca − a + 1 and B = bc − c + 1. Goncharov's printed (1.16) has the wrong sign in its sixth cyclic argument (source issue E-P3-04): with the printed sign, a = b = c = 1 gives 6[1] + [−1], whose L_3-value is 21ζ(3)/4, whereas the relation must give 3[1] + 4[−1], whose value is 0. δ_3 kills R(a, b, c) (GR Proposition 5.4), and the single-valued L_3 kills it, together with inversion and the three-term relation; so L_3 descends to B_3(ℂ) → ℝ, and its composites with the embeddings of a number field give the weight-three regulator on ker δ_3 = H¹B(F; 3).
- **Configurations.** Generic m-tuples of vectors in F^q modulo GL_q(F) form the free ℚ-modules C_m(q) (Mathlib's representation coinvariants); deletion and projection make the weight-three Bigrassmannian complex. Three maps compare it with B(F; 3): r_4 = −3 Alt_4(u|123| ∧ u|124| ∧ u|134|) into ⋀³, r_5 = Alt_5([r(1|2,3,4,5)]_2 ⊗ u|345|) into B_2 ⊗ F^×_ℚ with the projected cross-ratio of GR §7 (the inverse of K3BlochGroups V.4's), and r_6 = −(1/5) Alt_6[T]_3 into B_3 with the triple ratio T. The coefficients −3 and −1/5 are forced by the chain-map squares under the conventions above: GR v5 prints 2 Alt_4 and +1/5 (source issues E-P3-02 and E-P3-05, both checked by exact rational valuation coordinates). The seven-term relation, the configuration duality and Goncharov's geometric presentation G_3(F) ≅ B_3(F) (rationally; integrally up to 6-torsion) give the remaining components and the vanishing on the projection faces.
- **Comparison with K-theory.** Through the symmetrized generic-vector resolution these maps give c_i^{(n)} : H_{6−i}(GL_n(F), ℚ) → H^iB(F; 3), i = 1, 2, 3, n ≥ 3, compatible with stabilisation, restricted to K_{6−i}(F)_ℚ along the rational primitive Hurewicz map. They vanish on the image of GL_2 homology, so on K_{6−i} ∩ im H_{6−i}(GL_3) they factor through the quotient by K_{6−i} ∩ im H_{6−i}(GL_2): the rank-graded piece, which is neither an Adams eigenspace nor a quotient of all of K_{6−i}(F)_ℚ. In degree three the image of d is the Steinberg span, so H³B(F; 3) = K^M_3(F)_ℚ, and Milnor's norm gives a transfer on H³; a transfer on the whole complex exists only under the weight-four homotopy conjecture of P.4.
- **The special value.** Over ℂ the L_3-evaluation of the configuration map is a measurable 5-cocycle whose class lies in the conjugation-even primitive Borel line of H⁵_cts(GL_3(ℂ), ℝ). For Borel's original real normalisation the multiple is rational; for BorelRegulators R.4's coordinates, which divide ℝ(2) by its Tate generator, it is a nonzero rational multiple of π². If every cycle of ker δ_3 lifts to rational GL homology (Goncharov §9.2, whose higher-differential computation is not displayed: source issue E-P3-03), the regulator image lies in the ℚ-span of π² times the Borel image, and for every family det(L_3(σ_i z_j)) = q √|d_F| π^{−3r_2} ζ_F(3) with q ∈ ℚ, possibly zero. This orientation, the determinant as a rational multiple of the period, is the one that can hold for dependent families.

**How the parts fit.** The P.3 part imports the first packet's nine nodes by id. It constructs what the first packet's `P.3/k-theory-comparison-weight-three`, `P.3/trilogarithm-regulator-borel` and `P.3/milnor-degree-comparison` cite from Goncharov 1995, which the first packet had not obtained, and plans part (b) of `P.3/weight-three-special-value` as `P.3/every-family-special-value`. The Assembly notes after those nodes record three readings the P.3 part asks for: the rank-graded domain of the comparison, the π² factor against R.4's coordinates, and the orientation of the every-family formula. Of the first packet's remaining items for P.3, Goncharov 1995 and GR Proposition 5.4 are now read and planned; the transfer on the complexes stays a gap, made conditional; Suslin 1984 is still not obtained (K3BlochGroups V.4 owns that gap); and part (b) rests on the cycle-lifting gap.

**What the suggested file states.** The P.3 part's native constructions (the coordinate relation, configurations and coinvariants, the Bigrassmannian complex, cross-ratio and triple ratio, r_4 and r_6, duality and the H³ transfer) have Lean signatures. Its comparison theorems, the descent of L_3 and the special-value determinant do not: stating them faithfully needs the first packet's B_2 and B_3 quotient symbols, differential laws, complex Γ(F, 3), L_3 and regulator bound into the signatures, rather than arbitrary modules and maps, which would make the statements false (a zero map satisfies them). The file names each such declaration in a comment with its exact statement. Binding them, and adding the discriminating tests the configuration comparison and the descent need (a nonzero stabilised-cycle fixture, the quadratic transfer test, the nonzero geometric triangle class), is recorded among this part's gaps.

### The trilogarithm group B_3(F)

`P.3/trilogarithm-group` · definition · first packet

For an infinite field F let R_3(F) be the Q-subspace of Q[F] = (F →0 Q) spanned by {x}_3 - {x^{-1}}_3 and {x}_3 + {1 - x}_3 + {1 - x^{-1}}_3 - {1}_3 for x in F^x (GR v5 (19)), by {0}_3 (which the source's list omits; without it {0}_3 would be a free summand), and by the 22-term relation of Goncharov (1995, Formula 1.10), which GR v5 obtain by substituting (29) into their relation Q_3 (p. 12). Set B_3(F) := Q[F]/R_3(F) and delta_3 : B_3(F) → B_2(F) tensor F^x_Q, {x}_3 ↦ {x}_2 tensor x for x in F^x and {0}_3 ↦ 0.

**Hypotheses.**

- F is an infinite field.
- All groups are Q-vector spaces.

**Construction.**

1. Define R_3(F) by the displayed generators and B_3(F) as the quotient.
2. delta_3 kills (19): rationally {x^{-1}}_2 = -{x}_2 and {1 - x}_2 = -{x}_2 in B_2(F), so delta_3({x}_3 - {x^{-1}}_3) = ({x}_2 + {x^{-1}}_2) tensor x = 0 and the image of the three-term element is {x}_2 tensor (x (1 - x^{-1})/(1 - x)) = {x}_2 tensor (-1) = 0.
3. delta_3 kills the 22-term relation: GR, Proposition 5.4 (not read in full; gap).
4. The natural map to the inductive group of P.4 is P.4/explicit-to-inductive-comparison.

**API.**

- `trilogGroup` (data): The Q-vector space B_3(F).
- `trilogGroup.mk` (constructor): The class {x}_3 of x in F.
- `trilogGroup.mk_zero` (simp): {0}_3 = 0.
- `trilogGroup.mk_inv` (relation): {x}_3 = {x^{-1}}_3 for x in F^x.
- `trilogGroup.mk_three_term` (relation): {x}_3 + {1 - x}_3 + {1 - x^{-1}}_3 = {1}_3 for x in F^x.
- `trilogGroup.lift` (universal-property): A Q-linear map on Q[F] that kills R_3(F) descends to B_3(F), uniquely.
- `trilogGroup.map` (functoriality): A field homomorphism induces a map of trilogarithm groups.
- `trilogGroup.delta` (constructor): delta_3 : B_3(F) → B_2(F) tensor F^x_Q.
- `trilogGroup.delta_mk` (simp): delta_3 {x}_3 = {x}_2 tensor x for x in F^x.

**Unit tests.**

- `inversion` (characterisation): {x}_3 = {x^{-1}}_3 in B_3(F).
- `three_term` (computation): {x}_3 + {1 - x}_3 + {1 - x^{-1}}_3 = {1}_3; at x = 2 over Q: {2}_3 + {-1}_3 + {1/2}_3 = {1}_3.
- `zero_class` (degenerate): {0}_3 = 0.
- `one_ne_zero` (non-example): {1}_3 ≠ 0 in B_3(Q): L_3 kills R_3(C) (Goncharov 1995) and L_3(1) = ζ(3) ≠ 0.
- `delta_compat` (compatibility): delta_3 on B_3(F) equals delta_3 on the inductive group after the natural map.

**Acceptance.**

- {x}_3 = {x^{-1}}_3 and the three-term relation hold in B_3(F).
- L_3(1) = ζ(3) shows {1}_3 ≠ 0 in B_3(Q).

**Used by.**

- P.3's weight-three complex: B_3(F) is its degree-one term
- GR, weight-four proof: the complex (44) uses B_3(F), not the inductive group

**Depends on.** other roadmaps: `K3BlochGroups:V.3/pre-bloch-group`; libraries: `mathlib:Finsupp`, `mathlib:TensorProduct`, `mathlib:Additive`.

**Used in this roadmap by.** `P.3/polylogarithmic-complex`, `P.3/weight-three-complex`, `P.3/residues-and-transfers`, `P.3/k-theory-comparison-weight-three`, `P.3/weight-three-special-value`, `P.4/explicit-to-inductive-comparison`, `P.3/coordinate-relation`, `P.3/triple-ratio-map`, `P.3/seven-term-configuration-relation`, `P.3/trilogarithm-descent`, `P.3/geometric-trilogarithm-comparison`, `P.4/explicit-weight-four-complex`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/Complexes`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2026`, Section 1.2, (19) (PDF p. 9): “Let us denote by R3(F) the subspace of Q[F] generated by the elements {x}_3 - {x^{-1}}_3, {x}_3 + {1 - x}_3 + {1 - x^{-1}}_3 - {1}_3 for all x in F^x (19) and the 22-term relation [Gon95, Formula 1.10, Theorem 1.3] for the trilogarithm.” — The definition of R_3(F) and B_3(F).
- `GR.2026`, Section 1.2 (PDF p. 9): “It was conjectured in [Gon95] that the natural map B3(F) -> B3(F) is an isomorphism.” — The comparison with the inductive group, recorded in P.4/explicit-to-inductive-comparison.

**Assembly note.** The 22-term relation is written out in coordinates as `P.3/coordinate-relation`, R(a, b, c), with the sign of the sixth cyclic argument of Goncharov's (1.16) corrected (source issue E-P3-04); R_3(F) contains R(a, b, c) for every admissible (a, b, c). That δ_3 kills it, GR Proposition 5.4, is `P.3/relation-cobracket`.

### Goncharov's polylogarithmic complexes in weights at most three

`P.3/polylogarithmic-complex` · construction · planet “Trilogarithmic motivic complex” · first packet

For an infinite field F and n in {1, 2, 3}, the weight-n polylogarithmic motivic complex B(F; n) in degrees [1, n], with the group of weight n in degree 1 and the differential of degree +1, built on the explicit groups of GR v5 Section 1.2: B(F; 1) = F^x_Q; B(F; 2) : B_2(F) → Lambda^2 F^x_Q; B(F; 3) : B_3(F) → B_2(F) tensor F^x_Q → Lambda^3 F^x_Q. Here F^x_Q = F^x tensor Q, B_2(F) is P(F) tensor Q for the pre-Bloch group P(F) of K3BlochGroups V.3 (GR's explicit B_2(F) = Q[F]/R_2(F), with the same five-term relations), and B_3(F) is the group of P.3/trilogarithm-group. The differentials are d{x}_2 = (1 - x) wedge x, d({x}_2 tensor y) = (1 - x) wedge x wedge y and d{x}_3 = {x}_2 tensor x. The general weight, built on the inductive groups of P.4, is P.4/general-polylog-complex.

**Hypotheses.**

- F is an infinite field (GR v5, Conventions, p. 4).
- n is 1, 2 or 3.
- All groups are Q-vector spaces, following the source.

**Construction.**

1. Import P(F) tensor Q with its boundary from K3BlochGroups V.3 (pre-bloch-group, bloch-boundary, antisym-exterior-comparison) and set d{x}_2 = (1 - x) wedge x, which is -(toExterior o bloch-boundary) tensor Q because V.3's boundary is [x] ↦ x wedge (1 - x).
2. Import B_3(F) and delta_3 : B_3(F) → B_2(F) tensor F^x_Q from P.3/trilogarithm-group.
3. Define B_2(F) tensor F^x_Q → Lambda^3 F^x_Q by {x}_2 tensor y ↦ (1 - x) wedge x wedge y, using the wedge product of the graded exterior algebra (mathlib:ExteriorAlgebra.gradedAlgebra); it is well defined because d{x}_2 is.
4. Prove d o d = 0 in weight three (P.3/weight-three-complex); in weights one and two there is nothing to prove.
5. Assemble each weight as a cochain complex of Q-vector spaces concentrated in degrees 1 to n.
6. Record the convention difference: the source's groups are rational, and Goncharov's integral complexes Gamma(F, n) are different objects, not identified here.

**API.**

- `polylogComplex` (data): The weight-n complex for n ≤ 3, as a cochain complex of Q-vector spaces in degrees 1..n.
- `polylogComplex_d_gen` (simp): d{x}_2 = (1 - x) wedge x, d({x}_2 tensor y) = (1 - x) wedge x wedge y and d{x}_3 = {x}_2 tensor x.
- `polylogComplex_d_comp_d` (relation): d o d = 0. Promoted to Polylogarithms:P.3/weight-three-complex.
- `polylogComplex_one` (compatibility): The weight-one complex is F^x_Q in degree one.
- `polylogComplex_two` (compatibility): The weight-two complex is P(F) tensor Q → Lambda^2 F^x_Q with d = -(toExterior o bloch-boundary) tensor Q.
- `polylogComplex_map` (functoriality): A field homomorphism F → F' induces a map of complexes.
- `polylogComplex_map_id` (functoriality): The identity induces the identity.
- `polylogComplex_map_comp` (functoriality): Composition is preserved.
- `polylogComplex_H1_eq_ker` (characterisation): H^1 B(F; n) is the kernel of the first differential.

**Unit tests.**

- `d_gen_over_Q` (computation): Over Q: d({2}_2 tensor 3) = 0 and d({3}_2 tensor 5) = 2 wedge 3 wedge 5 ≠ 0.
- `d_squared_weight_three` (characterisation): d(d{x}_3) = 0 for every x.
- `degenerate_one` (degenerate): {1}_2 = 0 in B_2(F), so d({1}_2 tensor y) = 0.
- `weight_two_against_V3` (compatibility): Under B_2(F) = P(F) tensor Q, the weight-two differential is -(toExterior o bloch-boundary) tensor Q.
- `sign_convention` (non-example): The boundary convention x wedge (1 - x) gives the negative differential: with it, d({3}_2 tensor 5) = -(2 wedge 3 wedge 5).

**Acceptance.**

- The weight-one complex is F^x_Q in degree one.
- The weight-two complex is P(F) tensor Q → Lambda^2 F^x_Q, whose H^1 is B(F) tensor Q (K3BlochGroups V.3), with the differential of opposite sign to V.3's boundary.
- Over Q: d({2}_2 tensor 3) = (-1) wedge 2 wedge 3 = 0, while d({3}_2 tensor 5) = 2 wedge 3 wedge 5 ≠ 0.
- The complex is in degrees one to n; a shifted indexing changes every cohomology statement below.

**Used by.**

- P.3's weight-three special value: the elements of the theorem are cocycles of the weight-three complex
- P.3's residue maps: the residues are maps between these complexes
- P.4's general complex: for infinite F, the weight-three complex maps onto P.4's in degree one
- P.5's curve complexes: the curve complexes are built from these by residues along the places of the function field

**Depends on.** this roadmap: `P.3/trilogarithm-group`; other roadmaps: `K3BlochGroups:V.3/pre-bloch-group`, `K3BlochGroups:V.3/five-term-relation`, `K3BlochGroups:V.3/bloch-boundary`, `K3BlochGroups:V.3/antisym-exterior-comparison`; libraries: `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:exteriorPower.ιMulti`, `mathlib:ExteriorAlgebra.gradedAlgebra`, `mathlib:TensorProduct`, `mathlib:Additive`, `mathlib:CochainComplex`.

**Used in this roadmap by.** `P.3/weight-three-complex`, `P.3/residues-and-transfers`, `P.3/k-theory-comparison-weight-three`, `P.4/explicit-to-inductive-comparison`, `P.5/curve-polylogarithmic-complex`, `P.3/relation-cobracket`, `P.3/steinberg-boundary-image`, `P.3/trilogarithm-descent`, `P.4/explicit-weight-four-complex`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/Complexes`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2026`, Section 1.2 (PDF p. 9): “A deep result of Suslin ([Sus90, Corollary 5.6]) implies that the natural map B2(F) -> B2(F) is an isomorphism.” — The explicit weight-two group, identified with the inductive one for infinite fields.
- `GR.2026`, Section 1.2, (19) (PDF p. 9): “Let us denote by R3(F) the subspace of Q[F] generated by the elements {x}_3 - {x^{-1}}_3, {x}_3 + {1 - x}_3 + {1 - x^{-1}}_3 - {1}_3 for all x in F^x (19) and the 22-term relation [Gon95, Formula 1.10, Theorem 1.3] for the trilogarithm.” — The explicit weight-three group.
- `Gonch.Arakelov.2004`, Section 6.1 (PDF p. 52): “where delta_n({x}_k tensor Y) := {x}_{k-1} tensor x wedge Y for k > 2, and (1 - x) wedge x wedge y for k = 2, called the weight n polylogarithmic complex.” — The differentials on generators, including the case k = 2.

### The weight-three complex and its differential-square-zero proof

`P.3/weight-three-complex` · theorem · first packet

In the weight-three complex B_3(F) → B_2(F) tensor F^x_Q → Lambda^3 F^x_Q of P.3/polylogarithmic-complex the composite of the two differentials is zero: {x}_3 ↦ {x}_2 tensor x ↦ (1 - x) wedge x wedge x = 0.

**Hypotheses.**

- F is an infinite field; all groups are rational.

**Proof.**

1. Write the two differentials on generators.
2. Compute the composite on a generator: {x}_3 goes to {x}_2 tensor x and then to (1 - x) wedge x wedge x.
3. The result vanishes because x wedge x = 0 in Lambda^2 of any abelian group; rationality plays no role.
4. Extend from generators by linearity; the first differential is well defined on B_3(F) by P.3/trilogarithm-group.
5. The analogous computation in every weight is part of P.4/general-polylog-complex.

**Acceptance.**

- The composite vanishes on a generator, which is the whole content.
- Over the integers the same computation gives d o d = 0 in Goncharov's Gamma(F; 3), since x wedge x = 0 in Lambda^2 of any abelian group.

**Depends on.** this roadmap: `P.3/polylogarithmic-complex`, `P.3/trilogarithm-group`; libraries: `mathlib:ExteriorAlgebra.gradedAlgebra`.

**Used in this roadmap by.** `P.5/weight-three-curve-regulator`, `P.3/configuration-chain-comparison`, `P.5/weight-three-relation-descent`.

**Sources.**

- `GR.2022`, 1.1, item 4 (PDF p. 5): “Evidently, the following composition is zero for n >= 3: B_n(F) -> B_{n-1}(F) tensor F^x_Q -> B_{n-2}(F) tensor Lambda^2 F^x_Q.” — The vanishing, as displayed, specialised to weight three.

### The residue on exterior powers of the units

`P.3/exterior-residue` · construction · first packet

Let K be a field with a discrete valuation v, units U and residue field k. There is a unique homomorphism res_v : Lambda^n K^x → Lambda^{n-1} k^x (exterior powers of abelian groups, hence also after tensoring with Q) with res_v(π wedge u_1 wedge ... wedge u_{n-1}) = u_1-bar wedge ... wedge u_{n-1}-bar and res_v(u_1 wedge ... wedge u_n) = 0 for a uniformiser π and units u_i; it does not depend on π. For n = 2, res_v(f wedge g) = (-1)^{v(f)v(g)} tame_v{f, g}^{-1}, the inverse of the tame symbol of K2SymbolsBrauer T.3 up to that sign.

**Hypotheses.**

- v is a discrete valuation on K with residue field k; n ≥ 1.

**Construction.**

1. K^x = π^Z x U gives Lambda^n K^x = (π wedge Lambda^{n-1} U) + Lambda^n U; define res_v on the two summands through the universal property of the exterior power (mathlib:exteriorPower.alternatingMapLinearEquiv) and the reduction U → k^x.
2. Independence of π: for π' = π u_0 the difference is u_0 wedge u_1 wedge ..., which res_v kills.
3. The comparison at n = 2 with the tame symbol is a computation on the cases (π, u), (u, u') and (π, π).

**API.**

- `resExterior` (constructor): res_v : Lambda^n K^x → Lambda^{n-1} k^x.
- `resExterior_uniformizer` (simp): res_v(π wedge u_1 wedge ... wedge u_{n-1}) = u_1-bar wedge ... wedge u_{n-1}-bar.
- `resExterior_unit` (simp): res_v(u_1 wedge ... wedge u_n) = 0 for units u_i.
- `resExterior_indep` (characterisation): The map does not depend on the uniformiser.
- `resExterior_two` (compatibility): For n = 2, res_v(f wedge g) = (-1)^{v(f)v(g)} tame_v{f, g}^{-1} (K2SymbolsBrauer:T.3/tame-symbol).

**Unit tests.**

- `res_uniformizer` (computation): K = Q(t), v = ord_t: res(t wedge 2 wedge 3) = 2 wedge 3.
- `res_units` (degenerate): res(2 wedge 3 wedge 5) = 0.
- `res_other_uniformizer` (characterisation): res(2t wedge 3 wedge 5) = 3 wedge 5.
- `res_tame` (compatibility): res(t wedge u) = u-bar while the tame symbol of (t, u) is u-bar^{-1}; res(t wedge t) = 0 while the tame symbol of (t, t) is -1.

**Acceptance.**

- res(t wedge 2 wedge 3) = 2 wedge 3 for K = Q(t), v = ord_t.
- For n = 2 the residue is the tame symbol up to inversion and sign.

**Used by.**

- P.3's residue maps: the last term of the residue of the weight-three complex
- P.5's residue map: Goncharov's Res is the sum of these over the divisors of a variety

**Depends on.** other roadmaps: `K2SymbolsBrauer:T.3/tame-symbol`; libraries: `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:exteriorPower.alternatingMapLinearEquiv`, `mathlib:Additive`, `mathlib:Valuation`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsLocalRing.ResidueField`.

**Used in this roadmap by.** `P.3/residues-and-transfers`, `P.5/curve-polylogarithmic-complex`, `P.5/residue-map`, `P.4/weight-four-residue-map`, `P.5/wang-boundary-currents`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/Complexes`, namespace `TauCeti.Polylog`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 2, item 6 (PDF pp. 17-18): “There is a homomorphism resv : Lambda^n K* -> Lambda^{n-1} kv* uniquely defined by the properties (ui in U): resv(pi wedge u1 wedge ... wedge un-1) = u1 wedge ... wedge un-1 and resv(u1 wedge ... wedge un) = 0. It does not depend on the choice of pi.” — The definition and the independence of the uniformiser, as displayed.

### Residue maps of the polylogarithmic complexes

`P.3/residues-and-transfers` · construction · first packet

For an infinite field K with a discrete valuation v and infinite residue field k, define res_v : B(K; 3) → B(k; 2)[-1] by: zero on B_3(K); res_v({x}_2 tensor y) = v(y) {x-bar}_2 if v(x) = 0 and 0 otherwise; and P.3/exterior-residue on Lambda^3 K^x_Q. Likewise res_v : B(K; 2) → B(k; 1)[-1] is zero on B_2(K) and P.3/exterior-residue on Lambda^2 K^x_Q. These are maps of complexes of Q-vector spaces, natural for an extension of valued fields with ramification index e (the residue is multiplied by e). Integrally the weight-two residue is a map of complexes only after inverting 2: res_v((1 - x) wedge x) = (-1)^{v(x)} for v(x) < 0. No source read constructs transfers on these complexes; the only transfer available is the one on H^3 = K^M_3(F)_Q from K2SymbolsBrauer:T.3/transfer-and-norm-residue (gap).

**Hypotheses.**

- K is an infinite field with a discrete valuation v and infinite residue field k.
- All groups are rational; integrally the statement needs 2 inverted.

**Construction.**

1. Define res_v on each term as displayed, using P.3/exterior-residue on the exterior powers.
2. Check res_v o d = d o res_v on generators: on {x}_3 both sides vanish (d{x}_3 = {x}_2 tensor x has residue v(x){x-bar}_2 only when v(x) = 0); on {x}_2 tensor y with v(x) = v(1 - x) = 0 both sides are v(y) (1 - x-bar) wedge x-bar; when v(x) ≠ 0 both sides vanish rationally.
3. Prove naturality for an extension of valued fields, with the ramification index.
4. Record that transfers are not constructed (gap), and that the stage's transfers are available only on H^3.

**API.**

- `weightThreeResidue` (constructor): res_v : B(K; 3) → B(k; 2)[-1].
- `weightThreeResidue_trilog` (simp): res_v vanishes on B_3(K).
- `weightThreeResidue_tensor` (simp): res_v({x}_2 tensor y) = v(y){x-bar}_2 if v(x) = 0, and 0 otherwise.
- `weightThreeResidue_comm` (compatibility): res_v o d = d o res_v.
- `weightTwoResidue` (constructor): res_v : B(K; 2) → B(k; 1)[-1].
- `weightThreeResidue_natural` (functoriality): For an extension of valued fields with ramification index e, the residues are related by multiplication by e.

**Unit tests.**

- `res_unramified` (computation): K = k(t), v = ord_t: res_t({x}_2 tensor t) = {x}_2 for x in k^x - {1}.
- `res_ramified_zero` (non-example): res_t({t}_2 tensor a) = 0 for a in k^x; using v(x) in place of v(y) would give a nonzero value.
- `commutes_with_d` (characterisation): res_t(d({x}_2 tensor t)) = d(res_t({x}_2 tensor t)) = (1 - x) wedge x.
- `integral_two_torsion` (degenerate): Integrally, res_v((1 - x) wedge x) = (-1)^{v(x)} for v(x) < 0, while res_v{x}_2 = 0; after tensoring with Q the discrepancy vanishes.

**Acceptance.**

- res_t({x}_2 tensor t) = {x}_2 for x in k^x - {1} and K = k(t).
- Residue and differential commute, which is what makes the curve complexes of P.5 well defined.
- Transfers are not claimed.

**Used by.**

- P.5's curve complexes: the curve complex is assembled from the residues at the closed points
- P.5's strong reciprocity law: Res = sum_x res_x is one side of the law

**Depends on.** this roadmap: `P.3/polylogarithmic-complex`, `P.3/trilogarithm-group`, `P.3/exterior-residue`; libraries: `mathlib:Valuation`, `mathlib:IsLocalRing.ResidueField`.

**Used in this roadmap by.** `P.5/curve-polylogarithmic-complex`, `P.5/strong-reciprocity-conjecture`, `P.3/cohomology-transfer`.

**Library.** module `TauCeti/Algebra/KTheory/Polylogarithmic/WeightThree`, namespace `TauCeti.Polylog`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 6.1, (75) (PDF p. 52): “Here resv({x}2 tensor y) is zero unless v(x) = 0. In the latter case it is resv({x}2 tensor y) = v(y){x}2, where x denotes projection of x to the residue field of K.” — The residue on the middle term, as displayed.
- `Gonch.Arakelov.2004`, Section 6.1 (PDF p. 52): “If K is a field with a discrete valuation v and the residue field kv, then there is a homomorphism of complexes resv : Gamma(K, n) -> Gamma(kv, n - 1)[-1]” — That the residue is a map of complexes.

**Assembly note.** The P.3 part constructs the transfer on H³ by conjugating Milnor's norm (`P.3/cohomology-transfer`), and a transfer on the whole complex only under the weight-four homotopy conjecture (`P.3/conditional-complex-transfer`, with `P.4/homotopy-conjecture`). The gap on transfers stays.

### The maps from weight-three rational K-theory to the trilogarithmic complex

`P.3/k-theory-comparison-weight-three` · theorem · first packet

For an infinite field F there are homomorphisms K_{6-i}(F)_Q → H^i B(F; 3), i = 1, 2, 3 (with the explicit B_3 of P.3/trilogarithm-group), that vanish on the rank filtration F^rk_2 K_{6-i}(F)_Q and so induce gr^rk_3 K_{6-i}(F)_Q → H^i B(F; 3). The identification gr^rk_3 = gr^3_gamma is Suslin's conjecture, and isomorphy for i = 1, 2 is Goncharov's conjecture (P.4/goncharov-comparison-conjecture). The construction is Goncharov's (1995), which was not obtained; its weight-four analogue is GR Theorem 1.3(i). The regulator compatibility and the case i = 3 are P.3/trilogarithm-regulator-borel and P.3/milnor-degree-comparison.

**Hypotheses.**

- F is an infinite field; K-groups are rationalised.

**Proof.**

1. Import rational K-theory with its rank filtration (the plus construction and the Hurewicz map, GeneralAlgebraicKTheory K.2:plus) and its Adams eigenspaces (SchemeKTheoryOperations S.6; the atlas edge is MotivicEtaleKTheory M.6).
2. Construct the maps through the configuration complexes, as in Goncharov (1995) and, in weight four, GR Sections 7.1 to 7.3 (gap: Goncharov 1995 not obtained, GR Section 7 not decomposed).
3. Prove that they vanish on F^rk_2.
4. Record the conjectures: gr^rk = gr_gamma (Suslin) and isomorphy for i = 1, 2 (Goncharov).

**Acceptance.**

- The weight-four analogue is GR Theorem 1.3(i), with K_{8-i} and i = 1, ..., 4.
- Isomorphy for i = 1, 2 is a conjecture in the source and is recorded as one.
- No map is claimed out of gr_gamma: gr^rk = gr_gamma is Suslin's conjecture.

**Depends on.** this roadmap: `P.3/polylogarithmic-complex`, `P.3/trilogarithm-group`; stages: `MotivicEtaleKTheory:M.6`, `SchemeKTheoryOperations:S.6`, `GeneralAlgebraicKTheory:K.2:plus`.

**Used in this roadmap by.** `P.3/trilogarithm-regulator-borel`, `P.3/milnor-degree-comparison`, `P.3/weight-three-special-value`, `P.5/weight-three-motivic-comparison`.

**Sources.**

- `GR.2026`, Theorem 1.3(i) (PDF p. 6): “(i) Let F be an infinite field. Then there are canonical homomorphisms K_{8-i}(F)_Q -> H^i B(F; 4), i = 1, 2, 3, 4. Their restrictions to F^rk_3 K_{8-i}(F)_Q are zero.” — The weight-four form of the maps.
- `GR.2022`, 1.1, item 6 (PDF p. 5): “The conjecture states that one expects the following isomorphisms: gr^n_gamma K_{2n-i}(F)_Q = H^i B(F; n), i > 0.” — The conjecture, labelled as such, with i > 0 as printed.

**Assembly note.** The P.3 part constructs these maps (`P.3/stabilized-configuration-comparison`) from Goncharov 1995, which it read, and proves the vanishing on the image of GL_2 homology (`P.3/rank-two-vanishing`). Read the domain precisely, as the P.3 part asks: the induced map is defined on gr^rk_3 K_{6−i}(F)_ℚ = (K_{6−i} ∩ im H_{6−i}(GL_3))/(K_{6−i} ∩ im H_{6−i}(GL_2)), a rank quotient that is neither an Adams eigenspace nor a quotient of all of K_{6−i}(F)_ℚ; nothing here factors all of K_{6−i}(F)_ℚ through it.

### The trilogarithm regulator is a multiple of the Borel regulator

`P.3/trilogarithm-regulator-borel` · theorem · first packet

The composite K_5(C)_Q → H^1 B(C; 3) → R of the map of P.3/k-theory-comparison-weight-three with the map induced by {z}_3 ↦ L_3(z) (which kills R_3(C): Goncharov 1995, not obtained) is a nonzero rational multiple of the Borel regulator of BorelRegulators R.4.

**Hypotheses.**

- The field is C; K-groups are rationalised.

**Proof.**

1. Goncharov (1995), not obtained: gap.

**Acceptance.**

- The scalar is a nonzero rational, not computed here.

**Depends on.** this roadmap: `P.3/k-theory-comparison-weight-three`, `P.1/single-valued-polylogarithm`; other roadmaps: `BorelRegulators:R.4/borel-regulator`.

**Used in this roadmap by.** `P.3/weight-three-special-value`.

**Sources.**

- `GR.2022`, 1.1, item 2 (PDF p. 3): “Similar results about zeta_F(2) and zeta_F(3) were proved in [Zag86] and [Gon91], [Gon95], respectively.” — The weight-three theorem is attributed to Goncharov's 1991 and 1995 papers, which were not obtained; the weight-four form is GR Theorem 1.3(iv).
- `GR.2026`, Theorem 1.3(iv) (PDF p. 6): “(iv) The following composition is a non-zero rational multiple of the Borel regulator map [Bor77]: K7(C)Q -> H^1 B(C; 4) -> R.” — The weight-four shape of the statement.

**Assembly note.** Read with `P.3/rational-regulator-calibration`: the multiple is rational for Borel's original real normalisation, which Goncharov uses; against BorelRegulators R.4's coordinates, which divide ℝ(2) by its Tate generator, it is a nonzero rational multiple of π². The exact scalar is requested from R.7. The descent of L_3 through R_3(ℂ), taken here from Goncharov 1995, is `P.3/trilogarithm-descent` with `P.3/trilogarithm-functional-relations`.

### Weight-three cohomology in top degree is Milnor K-theory

`P.3/milnor-degree-comparison` · theorem · first packet

For an infinite field F, H^3 B(F; 3) = Lambda^3 F^x_Q / d(B_2(F) tensor F^x_Q) is K^M_3(F)_Q, and the map K_3(F)_Q → H^3 B(F; 3) of P.3/k-theory-comparison-weight-three induces gr^rk_3 K_3(F)_Q = K^M_3(F)_Q = H^3 B(F; 3) (Suslin).

**Hypotheses.**

- F is an infinite field; all groups are rational.

**Proof.**

1. Rationally, Milnor K-theory is the exterior algebra of F^x_Q modulo the Steinberg elements (1 - x) wedge x, which is the image of d.
2. The comparison with Quillen K_3 in the top rank-graded piece is Suslin's theorem (gap: Suslin 1984 not obtained).

**Acceptance.**

- For F algebraically closed both sides are uniquely divisible.

**Depends on.** this roadmap: `P.3/k-theory-comparison-weight-three`; other roadmaps: `K2SymbolsBrauer:T.2/milnor-k-theory`.

**Used in this roadmap by.** `P.4/goncharov-comparison-conjecture`, `P.3/cohomology-transfer`, `P.3/suslin-top-comparison`.

**Sources.**

- `GR.2026`, after Theorem 1.3 (PDF p. 7): “The map (12) for i = 4 is an isomorphism due to a theorem of Suslin [Sus84] relating Quillen's and Milnor's K-groups. Conjecture 1.4. The maps (12) are isomorphisms.” — The weight-four form of the top-degree case; the weight-three case is the same theorem of Suslin.

**Assembly note.** The presentation step, that the image of d is the Steinberg span, is `P.3/steinberg-boundary-image`. The comparison with Quillen K_3 imports Suslin's theorem from K3BlochGroups V.4 (`homological-stability`, which owns its primary-source gap); its normalisation coefficient κ for r_4 = 18 f_0 is the open adapter `P.3/suslin-top-comparison`.

### The weight-three special-value theorem for number fields

`P.3/weight-three-special-value` · theorem · planet “Zagier's conjecture for ζ_F(3)” · first packet

Let F be a number field with r_1 real and r_2 complex places, real embeddings sigma_1, ..., sigma_{r_1}, one embedding sigma_{r_1+1}, ..., sigma_{r_1+r_2} from each conjugate pair, and discriminant d_F. (a) There exist y_1, ..., y_{r_1+r_2} in Q[F] with delta_3 y_j = 0 in B_2(F) tensor F^x_Q and q in ℚ^× such that ζ_F(3) = q π^{3 r_2} |d_F|^{-1/2} det(L_3(sigma_i(y_j)))_{1≤i,j≤r_1+r_2}, where L_3 is extended linearly to Q[C]; q = 1 can be arranged by rescaling y_1. (b) The corresponding statement for every such family, with q in Q possibly 0, is not established by the sources read (gap). This is the weight-three case of Zagier's conjecture, attributed by the source to Goncharov (1991, 1995).

**Hypotheses.**

- F is a number field with r_1 real and r_2 complex places.

**Proof.**

1. State the determinant with the odd-weight normalisation π^{3 r_2} |d_F|^{-1/2}; the general normalisation is P.4/zagier-determinant, restated here because P.4 depends on P.3.
2. Borel's rank theorem (BorelRegulators:R.3/borel-rank-theorem) gives dim K_5(F)_Q = r_1 + r_2.
3. Borel's theorem (BorelRegulators R.5) relates ζ_F(3) to the Borel regulator up to ℚ^×.
4. Combine with P.3/trilogarithm-regulator-borel and the maps of P.3/k-theory-comparison-weight-three: the images of a basis of K_5(F)_Q are cocycles y_j with nonzero determinant, which gives (a).
5. Record that (b) needs every class of H^1 to come from K_5(F)_Q, which the sources read do not establish.

**Acceptance.**

- F = Q, y_1 = {1}_3: ζ(3) = L_3(1) exactly (q = 1).
- F = Q(i), y_1 = {1}_3: π^3 (1/2) L_3(1) = 16 zeta_{Q(i)}(3), since zeta_{Q(i)}(3) = ζ(3) π^3/32.
- The matrix has size r_1 + r_2 in weight three, not r_2: the parity of the weight changes which places contribute.
- Part (b) is not claimed.

**Depends on.** this roadmap: `P.3/k-theory-comparison-weight-three`, `P.3/trilogarithm-regulator-borel`, `P.3/trilogarithm-group`, `P.1/single-valued-polylogarithm`; other roadmaps: `BorelRegulators:R.3/borel-rank-theorem`; stages: `BorelRegulators:R.5`; libraries: `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.discr`, `mathlib:NumberField.InfinitePlace.embedding`.

**Used in this roadmap by.** `P.4/zagier-statement`, `P.3/every-family-special-value`.

**Sources.**

- `GR.2022`, 1.1, item 2 (PDF p. 3): “Similar results about zeta_F(2) and zeta_F(3) were proved in [Zag86] and [Gon91], [Gon95], respectively.” — The attribution and the existence of the weight-three theorem, as displayed; the shape of the identity is that of the weight-four formula the source states in full.

**Assembly note.** Part (b) is planned as `P.3/every-family-special-value`, in the orientation det(L_3(σ_i z_j)) = q √|d_F| π^{−3r_2} ζ_F(3), q ∈ ℚ possibly zero, which is the one that can hold for dependent families. It rests on `P.3/cycle-lifting` and the regulator-class normalisation, both gaps. For q ≠ 0 the two forms agree: (a)'s π^{3r_2}|d_F|^{−1/2} on the determinant side is π^{−3r_2}|d_F|^{1/2} on the ζ side.

### Coordinate 22-term relation

`P.3/coordinate-relation` · construction · P.3 part

In Q[F], write [z] for the basis vector. Set A=ca−a+1 and B=bc−c+1. Define R(a,b,c)=Cyc₃([A]+[A/(ca)]+[c]+[B/(Ab)]−[A/c]+[−Ba/A]−[B/(Abc)]−[1])+[−abc], with Cyc₃ over (a,b,c),(c,a,b),(b,c,a). Its admissible locus requires a,b,c and all three cyclic A,B to be nonzero. The [1] terms are retained; values 1 or −1 are allowed. This construction is a formal relation, not a second definition of B₃.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Use Finsupp.single for symbols and finite sums for the cyclic operator.
2. Expand (1.16), correcting the omitted minus sign inside the sixth argument: −a(bc−c+1)/(ca−a+1). The geometric relation (1.10) and the c=1 specialization fix this sign.
3. Relate its image to the parent quotient relation submodule.

**API.**

- `TauCeti.Polylog.WeightThree.relation22` (constructor): The finite formal sum R(a,b,c) in Q[F].
- `TauCeti.Polylog.WeightThree.relation22_cyclic` (relation): R(a,b,c)=R(c,a,b).
- `TauCeti.Polylog.WeightThree.relation22_map` (functoriality): An injective field map carries R(a,b,c) to R(fa,fb,fc).
- `TauCeti.Polylog.WeightThree.relation22_eval` (compatibility): Evaluation by Finsupp.linearCombination is the corresponding signed sum in any Q-module.
- `TauCeti.Polylog.WeightThree.relation22_quotient` (simp): The image of R(a,b,c) in the parent B₃ is zero on the admissible locus.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.relation222` (computation): R(2,2,2)=3[3]+3[3/4]+3[2]+3[1/2]+3[−2]−3[3/2]−3[1/4]−3[1]+[−8] over Q.
- `TauCeti.Polylog.WeightThree.relation111` (degenerate): R(1,1,1)=3[1]+4[−1], not the zero formal sum.
- `TauCeti.Polylog.WeightThree.relation11c` (characterisation): For c≠0, the image of R(1,1,c) modulo inversion [z]=[1/z] is −[c²]+4[c]+4[−c]; it is not this expression as a raw Finsupp sum.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- p. 208 (1.16), p. 210 (1.17): Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/trilogarithm-group`; libraries: `mathlib:Finsupp.linearCombination`, `mathlib:Finsupp.lmapDomain`.

**Used in this roadmap by.** `P.3/relation-cobracket`, `P.3/trilogarithm-functional-relations`, `P.3/geometric-trilogarithm-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, p. 208 (1.16)–(1.17); p. 210 unnumbered specialization: “R₃(a,b,c)” — The coordinate form of the parent relation, including its constant terms.
- `Z03`, p. 2 formula (3), sixth cyclic argument: “−(ca−a+1)” — Its negative denominator confirms the minus sign in the corresponding trilogarithmic argument. No higher-Chow constructions are planned in P.3.

### Cobracket of the 22-term relation

`P.3/relation-cobracket` · theorem · P.3 part

For every admissible R(a,b,c), δ₃(eval R)=0 in B₂(F)⊗U_F, where U_F=F×⊗Q and δ₃[z]₃=[z]₂⊗u(z), with u(1)=0. This proves that the explicit coordinate relation is killed, rather than replacing explicit B₃ by the conjecturally larger inductive B₃.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. Use GR Lemma 5.1 to replace each mixed symbol {x,y}₂,₁ by its six ordinary B₃ symbols, including −{1}₃.
2. Lemma 5.2 identifies Q₃ with the coordinate 22-term relation.
3. In Proposition 5.4 collect the determinant-unit coefficients; each remaining coefficient is two five-term relations or the displayed sum of three five-term relations.
4. Apply the supplier’s rational B₂ inversion and five-term identities; specialize only along the admissible locus.

**Acceptance.**

- R(1,1,1)=3[1]+4[−1] has zero cobracket and zero regulator, while [1] itself has nonzero regulator.
- The B₂ boundary convention is (1−x)∧x, the negative of V.3’s x∧(1−x).

**Depends on.** this roadmap: `P.3/coordinate-relation`, `P.3/polylogarithmic-complex`; other roadmaps: `K3BlochGroups:V.3/five-term-relation`, `K3BlochGroups:V.3/pre-bloch-group`.

**Used in this roadmap by.** `P.3/trilogarithm-functional-relations`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.relation_cobracket`.

**Sources.**

- `GR5`, §5.1 Lemmas 5.1–5.2, (109), Proposition 5.4 and (110)–(114): “Proposition 5.4.” — The printed proof supplies the required vanishing in B₂⊗U.

### Generic vector configurations

`P.3/generic-vector-configurations` · definition · planet “Grassmannian configurations” · P.3 part

A generic m-tuple in F^q has every subfamily of size at most q linearly independent. Let C_m(q) be Q[generic m-tuples] modulo the span of [g·l]−[l] for g∈GL_q(F). This is the free Q-module on GL-orbits. Individual vector rescalings are not quotiented out. Deletion removes a vector; projection removes l_i and projects the others to F^q/F l_i, whose identification with F^(q−1) is immaterial in the orbit quotient.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Define the generic subtype using native LinearIndependent on injectively indexed subfamilies.
2. Use native Representation.Coinvariants of the rational permutation representation on the generic subtype. Its kernel is the span of [g·l]−[l], so the source presentation agrees with that existing quotient.
3. Use a linear equivalence from the one-dimensional quotient complement to define each projection face; different choices differ by GL.

**API.**

- `TauCeti.Polylog.WeightThree.GenericTuple` (constructor): Subtype of generic m-tuples in F^q.
- `TauCeti.Polylog.WeightThree.Config` (structure): The rational GL-coinvariant quotient C_m(q).
- `TauCeti.Polylog.WeightThree.configMk` (constructor): A generic tuple gives its class.
- `TauCeti.Polylog.WeightThree.configMk_gl` (relation): Simultaneous GL change leaves the class unchanged.
- `TauCeti.Polylog.WeightThree.configLift` (universal-property): Every GL-invariant function to a Q-module extends uniquely linearly.
- `TauCeti.Polylog.WeightThree.config_ext` (extensionality): Linear maps agreeing on all tuple classes are equal.
- `TauCeti.Polylog.WeightThree.configDelete` (projection): Delete the indexed vector, when the target row is present.
- `TauCeti.Polylog.WeightThree.configProject` (projection): Project the remaining vectors along the indexed vector.
- `TauCeti.Polylog.WeightThree.config_coinvariants` (compatibility): Config is the native Representation.Coinvariants of the permutation representation on GenericTuple.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.generic_basis` (compatibility): The standard basis of Q³ is generic, using native LinearIndependent.
- `TauCeti.Polylog.WeightThree.generic_zero` (non-example): A tuple containing zero is not generic when q≥1.
- `TauCeti.Polylog.WeightThree.config_ratios` (non-example): The classes of (1,2) and (1,3) in C₂(1) over Q differ: their ratios 2 and 3 distinguish GL₁ orbits.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- §2.5 pp. 256–259; GR §7.1 (126)–(129): Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** libraries: `mathlib:LinearIndependent`, `mathlib:Submodule.liftQ`, `mathlib:Representation.Coinvariants`, `mathlib:Matrix.GeneralLinearGroup`.

**Used in this roadmap by.** `P.3/weight-three-bigrassmannian`, `P.3/projected-cross-ratio`, `P.3/exterior-configuration-map`, `P.3/middle-configuration-map`, `P.3/triple-ratio-map`, `P.3/configuration-duality`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, §2.5 p. 255, generic-vector module and GL coinvariants; §2.6 pp. 257–259, symmetrized resolution: “vectors in generic position” — Vector configurations modulo simultaneous GL; symmetrized resolutions are in §2.6.
- `GR5`, §7.1 (129) p. 62: “Cₘ(q)” — The vector configuration module; individual scales are retained.

### Weight-three Bigrassmannian complex

`P.3/weight-three-bigrassmannian` · construction · P.3 part

BC_m^(3)=⊕_{3≤q<m} C_m(q), in homological degree m, starting at degree 4. Set ∂=Σ_i(−1)^i deletion_i and p=Σ_i(−1)^i projection_i, with zero-based indices. Each lowers tuple size by one; projection also lowers q. With these face signs ∂p+p∂=0, so D=∂+p. Components leaving 3≤q<m are zero; this is the quotient by the lower rows, not a subcomplex obtained by simply dropping outgoing maps.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Prove the two same-kind face identities and the mixed identity before taking signed sums.
2. Use the native finite direct sum of the orbit modules and assemble the two differential components.
3. Check D²=0, including the q=3 boundary and the m=q+1 corner.

**API.**

- `TauCeti.Polylog.WeightThree.bigrassmannian` (constructor): Degree m is the indicated finite direct sum.
- `TauCeti.Polylog.WeightThree.bigrassmannianD` (data): The degree −1 linear differential ∂+p.
- `TauCeti.Polylog.WeightThree.bigrassmannianD_component` (simp): On row q, D has deletion in row q and projection in row q−1 with the stated signs.
- `TauCeti.Polylog.WeightThree.bigrassmannianD_sq` (structure): Consecutive differentials compose to zero.
- `TauCeti.Polylog.WeightThree.bigrassmannian_corner` (compatibility): Degree 4 is canonically C₄(3).
- `TauCeti.Polylog.WeightThree.bigrassmannian_map` (functoriality): Injective field maps induce degreewise maps commuting with D; identity and composition laws hold.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.bigrassmannian_degree3` (degenerate): Degree 3 is zero.
- `TauCeti.Polylog.WeightThree.bigrassmannian_degree4` (computation): Degree 4 has only row C₄(3); its outgoing differential is zero.
- `TauCeti.Polylog.WeightThree.bigrassmannian_mixed` (characterisation): On C₇(4), the C₅(3) component of D² is ∂p+p∂=0, not ∂p−p∂.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- GR §7.1 (129)–(130); Gon95 §6 (6.2): Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/generic-vector-configurations`; libraries: `mathlib:HomologicalComplex₂.total`, `mathlib:DirectSum.lof`.

**Used in this roadmap by.** `P.3/stabilized-configuration-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `GR5`, §7.1 (129)–(130) pp. 62–63: “BCₘ” — The quotient and degree convention specialized to weight three.
- `G95`, §6 (6.2) pp. 295–296: “(6.2)” — The original weight-three configuration complex.

### Projected cross-ratio

`P.3/projected-cross-ratio` · construction · P.3 part

For a generic five-tuple in F³ define r(i|j,k,l,m)=|ijl||ikm|/(|ijm||ikl|), using the native determinant and the chosen volume form. It lies outside {0,1}. This is GR §7’s convention and the inverse of the ordered cross-ratio supplied by K3BlochGroups V.4; it is not GR §1’s convention. The volume form and each of the five vector scales cancel.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Compute determinants of the quotient-plane vectors as the three-dimensional minors with the projection vector first.
2. Use Plücker to show 1−r is nonzero.
3. Compare the four-bracket order with the supplier cross-ratio before applying B₂ identities.

**API.**

- `TauCeti.Polylog.WeightThree.projectedRatio` (constructor): The displayed determinant ratio for a generic five-tuple.
- `TauCeti.Polylog.WeightThree.projectedRatio_ne` (characterisation): r≠0 and r≠1.
- `TauCeti.Polylog.WeightThree.projectedRatio_gl` (functoriality): Simultaneous GL changes leave r unchanged.
- `TauCeti.Polylog.WeightThree.projectedRatio_scale` (relation): Independent nonzero vector rescalings leave r unchanged.
- `TauCeti.Polylog.WeightThree.projectedRatio_blochCrossRatio` (compatibility): r is the inverse of the V.4 ordered cross-ratio on the four projected points.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.projectedRatio_moment` (computation): On v(t)=(1,t,t²) at t=(1,2,3,5,7), r(1|2,3,4,5)=6/5.
- `TauCeti.Polylog.WeightThree.projectedRatio_swap` (characterisation): Swapping projected indices 4 and 5 inverts the ratio, giving 5/6 on this fixture.
- `TauCeti.Polylog.WeightThree.projectedRatio_bad` (non-example): A zero projection vector fails genericity; no ratio theorem is asserted for that input.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- GR §7.2 (135), (142): Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/generic-vector-configurations`; other roadmaps: `K3BlochGroups:V.4/cross-ratio`; libraries: `mathlib:Matrix.det`, `mathlib:Matrix.det_mul`.

**Used in this roadmap by.** `P.3/middle-configuration-map`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `GR5`, GR §7.2 (135), (142): “r(1,2,3,4)” — The convention in §7 is explicit and differs from the introduction.

### Exterior configuration map

`P.3/exterior-configuration-map` · construction · P.3 part

Define r₄:C₄(3)→Λ³_Q U_F by −3 Alt₄(u|123|∧u|124|∧u|134|), with Alt the unnormalized signed sum. This is 18 times Gon95’s f₀^(3) of (3.3). The coefficient is chosen for r₅ of GR (142) and δ₂[x]=(1−x)∧x; the printed 2 Alt₄ in GR is incompatible with that square. Exterior powers are native Mathlib exteriorPower.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Rewrite Gon95’s four-term f₀ formula as a signed alternation: Alt₄=-6 f₀.
2. Use (3.3)–(3.4) for volume independence, and determinant multiplicativity for GL descent.
3. Descend the signed sum by Submodule.liftQ; use native exterior insertion for the wedge.

**API.**

- `TauCeti.Polylog.WeightThree.configExterior` (constructor): The Q-linear map r₄ on vector-configuration classes.
- `TauCeti.Polylog.WeightThree.configExterior_mk` (simp): Evaluation is −3 times the unnormalized alternation.
- `TauCeti.Polylog.WeightThree.configExterior_volume` (compatibility): Changing volume by λ∈F× does not change r₄.
- `TauCeti.Polylog.WeightThree.configExterior_alt` (relation): A permutation multiplies the value by its sign.
- `TauCeti.Polylog.WeightThree.configExterior_fieldMap` (functoriality): The native exterior cube of the rational unit map commutes with r₄.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.configExterior_small` (computation): For vectors (1,8,2),(7,3,11),(1,3,2),(9,4,3) over Q, r₄=18 u(5)∧u(67)∧u(197).
- `TauCeti.Polylog.WeightThree.configExterior_moment4` (degenerate): For v(t) at t=1,2,3,5 the value is zero.
- `TauCeti.Polylog.WeightThree.configExterior_native` (compatibility): The wedge in the small fixture is exteriorPower.ιMulti Q 3, not a tensor modulo only antisymmetry.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- Gon95 p. 264 formula for f₀^(3), (3.3)–(3.4); GR (142): Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/generic-vector-configurations`; libraries: `mathlib:exteriorPower.ιMulti`, `mathlib:exteriorPower.alternatingMapLinearEquiv`, `mathlib:Submodule.liftQ`, `mathlib:Matrix.det_mul`.

**Used in this roadmap by.** `P.3/configuration-chain-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, p. 264 f₀^(3); (3.3)–(3.4) pp. 264–265: “(3.3)” — Alt₄ is −6 times the original f₀; hence corrected r₄ is 18 f₀.
- `GR5`, §7.2 (142) p. 65: “2” — The printed coefficient is refuted by E-P3-02; the corrected common coefficient is −3.

### Middle configuration map

`P.3/middle-configuration-map` · construction · P.3 part

Define r₅:C₅(3)→B₂(F)⊗_Q U_F by Alt₅([r(1|2,3,4,5)]₂⊗u|345|), with the projected ratio just fixed. It is independent of the volume form and descends under simultaneous GL. The B₂ module and field maps come from V.3; its boundary is negated to match the parent complex.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Evaluate the projected cross-ratio on each ordered permutation and tensor its B₂ symbol with the determinant unit.
2. The extra u(λ) under a volume change has coefficient Alt₅[r(1|2,3,4,5)]₂, zero by the five-term relation.
3. Use the quotient universal property for GL descent and TensorProduct.map for field functoriality.

**API.**

- `TauCeti.Polylog.WeightThree.configMiddle` (constructor): The Q-linear map r₅.
- `TauCeti.Polylog.WeightThree.configMiddle_mk` (simp): Evaluation is the stated signed five-point sum.
- `TauCeti.Polylog.WeightThree.configMiddle_volume` (compatibility): The map is independent of the volume form.
- `TauCeti.Polylog.WeightThree.configMiddle_alt` (relation): Permuting the five vectors multiplies the value by the sign.
- `TauCeti.Polylog.WeightThree.configMiddle_fieldMap` (functoriality): The tensor product of the supplier B₂ and unit maps commutes with r₅.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.configMiddle_moment` (computation): For v(t) at 1,2,3,5,7, d₂r₅=36 u(2)∧u(3)∧u(5).
- `TauCeti.Polylog.WeightThree.configMiddle_scaleVolume` (characterisation): Multiplying the volume form by 2 contributes zero to r₅, despite changing every determinant unit.
- `TauCeti.Polylog.WeightThree.configMiddle_notProjective` (non-example): On the moment-five fixture, multiply only v(1) by 2. Its d₂r₅ becomes 18 u(2)∧u(3)∧u(5), rather than the original 36 times that wedge. Thus independent vector scaling can change r₅; quotienting to projective tuples would lose data.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- GR §7.2 (142); Gon95 Proposition 3.7: Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/projected-cross-ratio`, `P.3/generic-vector-configurations`; other roadmaps: `K3BlochGroups:V.3/five-term-relation`, `K3BlochGroups:V.3/pre-bloch-group`; libraries: `mathlib:TensorProduct.map`, `mathlib:Submodule.liftQ`.

**Used in this roadmap by.** `P.3/configuration-chain-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `GR5`, §7.2 (142) p. 65: “r₅(3)” — The middle component with unnormalized alternation.
- `G95`, §3 Proposition 3.7 p. 266: “Proposition 3.7.” — The original volume-invariance argument uses the Bloch five-term relation.

### Triple-ratio configuration map

`P.3/triple-ratio-map` · construction · P.3 part

Define T(l)=|124||235||136|/(|125||236||134|) for a generic six-tuple, and r₆:C₆(3)→B₃(F) as −(1/5) Alt₆[T(l)]₃. The symbol [1]₃ is permitted and generally nonzero. The ratio is invariant under independent vector rescalings; the resulting alternating map descends through GL. Use the explicit 22-term B₃ of the parent, not the conjectural equality with inductive B₃. This negative sign is forced by E-P3-05 under δ₃[z]₃=[z]₂⊗u(z), δ₂[z]₂=u(1−z)∧u(z) and the stated deletion signs.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. All six minors are nonzero by genericity.
2. Count the occurrences of each column scale and volume scale in numerator and denominator.
3. Use the parent B₃ generator and extend the alternating formula by Finsupp.linearCombination and quotient descent.

**API.**

- `TauCeti.Polylog.WeightThree.tripleRatio` (constructor): The determinant ratio T.
- `TauCeti.Polylog.WeightThree.configTrilog` (constructor): The rational map r₆=−(1/5) Alt₆[T]₃.
- `TauCeti.Polylog.WeightThree.configTrilog_mk` (simp): The formula holds on every generic tuple.
- `TauCeti.Polylog.WeightThree.tripleRatio_scale` (relation): Independent nonzero vector scales cancel in T.
- `TauCeti.Polylog.WeightThree.configTrilog_alt` (relation): A permutation multiplies r₆ by its sign.
- `TauCeti.Polylog.WeightThree.configTrilog_fieldMap` (functoriality): The parent B₃ field map commutes with r₆.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.tripleRatio_moment` (computation): For v(t) at 1,2,3,5,7,11 the raw triple ratio is 10/9.
- `TauCeti.Polylog.WeightThree.tripleRatio_one` (degenerate): For e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2), which is a generic six-tuple, the raw ratio is 1; this symbol is not discarded.
- `TauCeti.Polylog.WeightThree.configTrilog_normalization` (non-example): 5r₆=−Alt₆[T]₃; positive 1/5 has the wrong left-square sign, and magnitude 1/15 has the wrong factor of 3.
- `TauCeti.Polylog.WeightThree.configTrilog_cobracketCoordinate` (computation): For the generic tuple e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2), evaluate the raw corrected −(1/5) Alt₆ triple-ratio formula after δ₂⊗1. Its (v₂∧v₃)⊗v₂ coordinate is −60, equal to the corresponding r₅∂ coordinate; the printed positive formula gives +60. This raw rational computation requires no unimplemented B₃ interface.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- GR §7.2 (144), footnote 16; §7.3 Proposition 7.2: Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/generic-vector-configurations`, `P.3/trilogarithm-group`; libraries: `mathlib:Finsupp.linearCombination`, `mathlib:Submodule.liftQ`, `mathlib:padicValRat`.

**Used in this roadmap by.** `P.3/seven-term-configuration-relation`, `P.3/configuration-chain-comparison`, `P.3/geometric-trilogarithm-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `GR5`, GR §7.2 (144), footnote 16; §7.3 Proposition 7.2: “1/5” — The printed positive 1/5 is refuted by E-P3-05. The magnitude alone is explained by footnote 16; its sign must also match (143).

### Steinberg boundary image

`P.3/steinberg-boundary-image` · theorem · P.3 part

The image of d₂:B₂(F)⊗U_F→Λ³U_F is the span of u(1−x)∧u(x)∧u(y), x∉{0,1}, y∈F×. The canonical rational exterior-to-Milnor symbol map has exactly this kernel; hence H³Γ≃K₃^M(F)⊗Q. This is the presentation lemma supporting the imported parent comparison, not a second definition of Milnor K-theory.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. The supplier Milnor presentation is the tensor algebra modulo the two-sided Steinberg ideal.
2. Rational anticommutativity, including {a,a}={a,−1}, makes the degree-3 map factor through the native exterior cube; the −1 torsion disappears rationally.
3. In degree 3 the ideal is precisely the span of adjacent Steinberg pairs with one extra unit.
4. V.3 symbols generate B₂, so the differential has the same image.

**Acceptance.**

- {x,1−x,y} maps to zero.
- Repeating a rational unit gives zero in the rational exterior cube.

**Depends on.** this roadmap: `P.3/polylogarithmic-complex`; other roadmaps: `K2SymbolsBrauer:T.2/milnor-k-theory`, `K3BlochGroups:V.3/pre-bloch-group`, `K2SymbolsBrauer:T.2/milnor-alternating`; libraries: `mathlib:exteriorPower.alternatingMapLinearEquiv`.

**Used in this roadmap by.** `P.3/cohomology-transfer`, `P.3/suslin-top-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.steinberg_boundary_image`.

**Sources.**

- `G95`, Gon95 p. 218 Milnor presentation, p. 220 Suslin remark: “K₃^M(F)” — The top-degree computation uses the algebraic presentation independently of Suslin’s Quillen comparison.

### Transfer on top cohomology

`P.3/cohomology-transfer` · construction · P.3 part

For a finite extension E/F define N_H³=η_F⁻¹∘(N^M_{E/F}⊗Q)∘η_E, where η is the parent H³–Milnor equivalence. It is transitive, satisfies projection and N_H³∘res=[E:F], and obeys residue–norm compatibility under the supplier’s finite-integral-closure hypotheses. This construction gives neither a B₃ transfer nor a chain map on Γ; applying Λ³ to the ordinary field norm is not the Milnor transfer.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Use the Steinberg boundary-image lemma to identify η and its symbol normalization.
2. Import the Milnor transfer, its transitivity, projection and degree laws from T.4.
3. Conjugate these maps and laws by η; use the parent residues and T.3 transfer–residue theorem.
4. In degree 3 the supplier’s right-uniformizer convention and the parent’s left-uniformizer convention have the same sign.

**API.**

- `TauCeti.Polylog.WeightThree.h3Transfer` (constructor): The Q-linear conjugate of the Milnor degree-3 norm.
- `TauCeti.Polylog.WeightThree.h3Transfer_eta` (compatibility): η_F∘N_H³=N^M∘η_E.
- `TauCeti.Polylog.WeightThree.h3Transfer_id` (simp): The transfer for F/F is identity.
- `TauCeti.Polylog.WeightThree.h3Transfer_comp` (functoriality): For a finite tower, the transfers compose.
- `TauCeti.Polylog.WeightThree.h3Transfer_res` (relation): N_H³∘res=[E:F] times identity.
- `TauCeti.Polylog.WeightThree.h3Transfer_projection` (compatibility): The product projection formula holds through η and the lower Milnor degrees.
- `TauCeti.Polylog.WeightThree.h3Transfer_residue` (compatibility): Residue after transfer is the sum of residue-field transfers, with no extra ramification multiplier.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.h3Transfer_identity` (degenerate): The base-extension identity gives the identity map.
- `TauCeti.Polylog.WeightThree.h3Transfer_quadratic` (computation): For a quadratic extension, N_H³(res z)=2z for every z.
- `TauCeti.Polylog.WeightThree.h3Transfer_notExteriorNorm` (non-example): As maps on the exterior cube of rational units, Λ³(N₁)∘Λ³(res₁)=d³ id for degree d. On H³, the Milnor norm satisfies N_H³∘res=d id. This contrasts the coefficient laws before quotienting; for number fields H³_Q=0, so no nonzero quadratic counterexample is asserted there.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- Gon95 pp. 239–241 transfer discussion; parent top-degree comparison: Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/steinberg-boundary-image`, `P.3/milnor-degree-comparison`, `P.3/residues-and-transfers`; other roadmaps: `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.3/transfer-and-norm-residue`.

**Used in this roadmap by.** `P.3/conditional-complex-transfer`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, pp. 239–241 conditional complex transfer; top-degree Milnor comparison p. 220: “Γ(F;3)” — The unrestricted complex transfer is conditional there; top cohomology already has the supplier norm.

### Functional relations of the trilogarithm

`P.3/trilogarithm-functional-relations` · theorem · P.3 part

Over C, the parent single-valued L₃ kills the corrected coordinate R(a,b,c), as well as [x]−[x⁻¹] and [x]+[1−x]+[1−x⁻¹]−[1] for x≠0. Identities extend to the admissible degenerate configurations by continuity. In particular L₃(R(1,1,1))=3ζ(3)+4(−3ζ(3)/4)=0.

**Hypotheses.**

- All groups are rational. The displayed domain and hypotheses are part of the statement.

**Proof.**

1. Use the parent classical derivative identities and the B₂ Bloch–Wigner descent to turn the cobracket cancellation into vanishing of the differential of the corrected relation’s L₃ evaluation.
2. Compute the constant on the component through (1,1,1) using the distribution/inversion identities and continuity.
3. Verify continuation across the complement of the admissible divisor; this analytic constant argument needs a complete written treatment and is recorded as a gap.
4. Apply the same elementary differentiation and evaluation for the three-term identity; inversion is already P.1-owned.

**Acceptance.**

- The constant [1] has value ζ(3), not zero.
- The ordinary trilogarithm Li₃ alone does not satisfy this equation.

**Depends on.** this roadmap: `P.3/coordinate-relation`, `P.3/relation-cobracket`, `P.1/classical-polylogarithm`, `P.1/distribution-and-inversion`, `P.1/single-valued-continuity`, `P.2/bloch-wigner-descent`.

**Used in this roadmap by.** `P.3/trilogarithm-descent`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.trilogarithm_functional_relations`.

**Sources.**

- `G95`, Gon95 p. 205 Theorem 1.3, p. 208 (1.16), p. 210 specialization; §10 Lemma 10.1: “Theorem 1.3.” — The stated source input is isolated with its precise proof obligations.

### Trilogarithm descent

`P.3/trilogarithm-descent` · construction · P.3 part

The parent single-valued function L₃(z)=Re(Li₃(z)−log|z|Li₂(z)+(1/3)log²|z|Li₁(z)), continuously extended at 0 and 1, induces a Q-linear L₃:B₃(C)→R. It kills the explicit 22-term, inversion and three-term relations with their constants. For an embedding σ:F→C, its composite with B₃(σ), restricted to ker δ₃=H¹Γ, gives the σ-coordinate regulator. Conjugate embeddings have equal coordinates.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Import P.1’s single-valued function, continuity, inversion and distribution. Use the new functional-relation theorem for the 22-term identity; P.2 does not own this weight-three equation.
2. Extend to Q[C] by Finsupp.linearCombination and check each parent relation generator, retaining {1}₃.
3. Descend with Submodule.liftQ and use parent field functoriality for embeddings.

**API.**

- `TauCeti.Polylog.WeightThree.trilogDescent` (constructor): The induced Q-linear map B₃(C)→R.
- `TauCeti.Polylog.WeightThree.trilogDescent_mk` (simp): L₃([z]₃) equals the parent single-valued L₃(z).
- `TauCeti.Polylog.WeightThree.trilogDescent_sum` (compatibility): Evaluation of a formal finite sum is its rational linear combination of L₃ values.
- `TauCeti.Polylog.WeightThree.trilogDescent_conj` (relation): Complex conjugation leaves the descended functional invariant.
- `TauCeti.Polylog.WeightThree.trilogRegulatorAt` (data): The Q-linear functional on ker δ₃ obtained by pullback along σ.
- `TauCeti.Polylog.WeightThree.trilogRegulatorAt_conj` (compatibility): The σ and conjugate-σ coordinates agree.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.trilogDescent_zero` (degenerate): L₃([0]₃)=0.
- `TauCeti.Polylog.WeightThree.trilogDescent_one` (computation): L₃([1]₃)=ζ(3)>0; [1]₃ cannot be killed.
- `TauCeti.Polylog.WeightThree.trilogDescent_minusOne` (computation): L₃([−1]₃)=−3ζ(3)/4, so the image of R(1,1,1)=3[1]+4[−1] is zero.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- Gon95 p. 202 (1.4), p. 264 regulator descent: Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.1/single-valued-polylogarithm`, `P.3/trilogarithm-group`, `P.3/polylogarithmic-complex`, `P.3/trilogarithm-functional-relations`, `P.1/distribution-and-inversion`, `P.1/single-valued-continuity`; libraries: `mathlib:Finsupp.linearCombination`, `mathlib:Submodule.liftQ`.

**Used in this roadmap by.** `P.3/configuration-borel-class`, `P.3/cycle-lifting`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, p. 202 (1.3)–(1.4); p. 264 regulator descent: “ℒ₃” — The quotient functional and its archimedean pullback supplement the parent regulator-comparison target.

### Conditional transfer on the complex

`P.3/conditional-complex-transfer` · theorem · P.3 part

Assume the weight-four homotopy/residue resolution of Gon95 Conjecture 1.39: Γ(F(t),4)/Γ(F,4)→⊕_P Γ(F[t]/P,3)[−1] is a quasi-isomorphism, for monic irreducible P, with all maps interpreted in the derived category. For E=F[t]/P, insert its summand, invert this quasi-isomorphism and take minus the residue at ∞. After cancelling the shift this constructs a derived transfer Γ(E,3)→Γ(F,3). Its H³ map must agree with the previously constructed Milnor transfer. No unconditional B₃ or termwise transfer is inferred.

**Hypotheses.**

- F is a field; E=F[t]/P is a simple finite extension. All groups are rational. Assume the stated weight-four quasi-isomorphism and residue-at-∞ chain map killing constants, for the same explicit/inductive model.

**Proof.**

1. The residue-at-∞ map kills constants, hence factors through the quotient by Γ(F,4).
2. In the derived category compose the summand inclusion with the inverse of the assumed quasi-isomorphism and the negative ∞ residue.
3. Compare H³ with the supplier’s Bass–Tate formula. For general finite extensions use simple-extension towers only after proving tower independence; this is recorded as a gap.

**Acceptance.**

- Weight THREE transfer requires the weight FOUR resolution.
- The result is derived, not automatically a chain map on the displayed terms.

**Depends on.** this roadmap: `P.3/cohomology-transfer`, `P.4/general-polylog-complex`; other roadmaps: `K2SymbolsBrauer:T.4/simple-transfer`; stages: `Polylogarithms:P.4`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.conditional_complex_transfer`.

**Sources.**

- `G95`, Gon95 pp. 239–241, Conjecture 1.39 and subsequent conditional transfer discussion: “Γ(F;3)” — The stated source input is isolated with its precise proof obligations.

### Geometric trilogarithm presentation

`P.3/geometric-trilogarithm-presentation` · definition · P.3 part

Let G₃(F) be the rational module on PGL₃-orbits of arbitrary ordered six-tuples of native points of P²(F). Impose: a tuple is zero if two points coincide or four are collinear; the alternating seven-term deletion relation; and the intersection relation R3 of GR (148). For triangle vertices a₁,a₂,a₃ and b_i on a_i a_{i+1}, write T(z) for its tuple with invariant z=r′(b₁|a₂,a₃,b₂,b₃), where r′(u,v,w,x)=(u−w)(v−x)/((u−x)(v−w)). Put T₁(z)=−T(z)−2T(1−z)+T(1). For a type-B tuple y=(x₁,x₂,m,x₃,x₄,x₅) with m=x₁x₂∩x₃x₄, impose 3[y]=Σ_{i=1}⁵(−1)^(i−1) T₁(r′(y₆|y₁,…,ŷ_i,…,y₅)), wherever these projected configurations are defined. This auxiliary geometric group is compared with the parent B₃; it is not substituted for its definition.

**Hypotheses.**

- F is an infinite field; coefficient groups are rational.

**Construction.**

1. Use native Projectivization F (F³) for points and the native Finsupp module for ordered tuples.
2. Generate a rational relation submodule from simultaneous projective GL changes and the three displayed families; take the native quotient.
3. Degenerate T(1) is retained via the triangle specialization of the source; do not exclude it by requiring every six-tuple to be generic.
4. Derive permutation antisymmetry from the seven-term relation with a repeated point (Gon95 Lemma 1.7).

**API.**

- `TauCeti.Polylog.WeightThree.GeometricTrilog` (structure): The native rational quotient G₃(F) of formal projective six-tuples.
- `TauCeti.Polylog.WeightThree.geometricMk` (constructor): The class of an arbitrary ordered projective six-tuple.
- `TauCeti.Polylog.WeightThree.geometricMk_alt` (relation): Permuting its six points multiplies the class by the permutation sign.
- `TauCeti.Polylog.WeightThree.geometricLift` (universal-property): A rational linear evaluation killing all three relation families and projective GL changes factors uniquely through G₃.
- `TauCeti.Polylog.WeightThree.geometricTriangle` (constructor): The triangle-family class T(z), including its source specialization at z=1.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.geometric_repeat` (degenerate): A tuple with its first two points equal represents zero.
- `TauCeti.Polylog.WeightThree.geometric_fourCollinear` (degenerate): A tuple with four points on one projective line represents zero.
- `TauCeti.Polylog.WeightThree.geometric_triangle_nonzero` (non-example): Under the comparison below T(1) maps to [1]₃, with complex regulator ζ(3); the geometric group is not killed by its degeneration relations.

**Acceptance.**

- The displayed geometric and algebraic conventions agree with the stated source passage.

**Used by.**

- Gon95 Definition 1.5 and Lemma 1.7 pp. 211–214; GR §7.3 (146)–(148): Makes the geometric reduction in the chain-map and regulator proofs available as a named reusable object.

**Depends on.** libraries: `mathlib:Projectivization`, `mathlib:Submodule.liftQ`, `mathlib:Finsupp.linearCombination`.

**Used in this roadmap by.** `P.3/geometric-trilogarithm-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, Definition 1.5 and Lemma 1.7 pp. 211–214: “Definition 1.5.” — The geometric six-point quotient and skew symmetry.
- `GR5`, §7.3 (146)–(148) pp. 65–66: “Relation R3” — The rational intersection-relation formula adopted here.

### Geometric–symbol trilogarithm comparison

`P.3/geometric-trilogarithm-comparison` · comparison · P.3 part

There is a canonical rational isomorphism M₃:G₃(F)≃B₃(F). It sends T(z) to [z]₃. On type-B configurations use one third of the alternating five-term sum of T₁-values from (148), evaluated by T₁(z)=−[z]₃−2[1−z]₃+[1]₃. On generic six-tuples choose the intersection m of the first two and next two point lines, and use the seven-term relation to reduce to types B and C. The result is independent of the auxiliary intersection choice. Its unnormalized six-point alternation is (3/2) Alt₆[T_raw]₃, with T_raw the determinant triple ratio of the triple-ratio node. Integrally Gon95 states the comparison only modulo 6-torsion; rationalization removes that qualification.

**Hypotheses.**

- F is an infinite field; coefficient groups are rational.

**Proof.**

1. Use the triangle specialization to define the symbol-to-geometric map.
2. The corrected coordinate relation gives the relations among triangle classes; the geometric R3 gives the reverse evaluation.
3. Apply the seven-term reduction to the generic case and the projected five-point reduction to type C.
4. GR Lemmas 7.3–7.4 cancel the type-B alternating terms and identify the remaining type-C contribution with the triple ratio.
5. Track the printed 3/2 factor and the corrected r₆ coefficient −1/5: r₆=−(2/15) Alt M₃ if the displayed M₃ conventions agree. Establish that adapter in explicit B₃ before transferring seven-term and duality identities.

**Acceptance.**

- The displayed geometric and algebraic conventions agree with the stated source passage.

**Depends on.** this roadmap: `P.3/geometric-trilogarithm-presentation`, `P.3/coordinate-relation`, `P.3/triple-ratio-map`, `P.3/trilogarithm-group`; other roadmaps: `K3BlochGroups:V.3/five-term-relation`.

**Used in this roadmap by.** `P.3/seven-term-configuration-relation`, `P.3/trilogarithm-duality`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.geometric_trilogarithm_comparison`.

**Sources.**

- `G95`, Theorem A p. 293; construction pp. 286–287; Proposition 5.3 and Lemma 5.4 pp. 287–288: “Theorem A.” — The rational comparison and primary choice-independence argument were independently read.
- `GR5`, §7.3 Proposition 7.2 (149), Lemmas 7.3–7.4 pp. 67–68: “canonical isomorphism” — The skew-symmetrization is (3/2) Alt₆ of the raw ratio. This does not validate the sign of (144).

### Seven-term configuration relation

`P.3/seven-term-configuration-relation` · theorem · P.3 part

For every generic seven-tuple in F³, Σ_{i=0}^6(−1)^i r₆(l without l_i)=0 in explicit B₃(F).

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. Use Gon95’s configuration presentation G₃ only as the finite geometric proof device of GR §7.3: repeat/collinearity relations, deletion relation and the intersection-line relation.
2. The intersection construction M₃ reduces each generic six-tuple to three degenerate types; the B₂ five-term relation gives their permutation identities.
3. Proposition 7.2 identifies Alt₆ M₃ with 3/2 times the raw triple-ratio alternation.
4. Alternate the seven-point relation and divide by the nonzero rational factors.

**Acceptance.**

- The statement holds on the generic seven-point moment-curve fixture 1,2,3,5,7,11,13.
- No discarded {1}₃ constant is used.

**Depends on.** this roadmap: `P.3/triple-ratio-map`, `P.3/trilogarithm-group`, `P.3/geometric-trilogarithm-comparison`; other roadmaps: `K3BlochGroups:V.3/five-term-relation`.

**Used in this roadmap by.** `P.3/configuration-chain-comparison`, `P.3/trilogarithm-duality`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.seven_term_configuration_relation`.

**Sources.**

- `GR5`, GR Theorem 1.8 and §7.3 Proposition 7.2, Lemmas 7.3–7.4: “Theorem 1.8.” — A proof in the explicit B₃ presentation, not an appeal to the conjectural inductive comparison.

### Configuration duality

`P.3/configuration-duality` · construction · P.3 part

For 0<q<m, the kernel of the surjective column map F^m→F^q associated to a generic m-tuple has dimension m−q. Choosing a basis of that kernel and taking its coordinate columns gives a generic m-tuple in F^(m−q); another basis changes it by GL. This defines a linear equivalence *:C_m(q)≃C_m(m−q). Equivalently, annihilator duality on the generic Grassmannian gives the same map. Under the natural dimension identifications it is involutive. It exchanges deletion with projection and descends further through independent vector scaling to the projective configuration duality.

**Hypotheses.**

- F is an infinite field; coefficient groups are rational.

**Construction.**

1. Identify the tuple with the row subspace of its full-rank q×m matrix; the dual row subspace is its annihilator.
2. Nonzero complementary minors show the dual tuple is generic.
3. For a matrix (I_q,B), the dual is (−Bᵀ,I_{m−q}); in the square case, normalize the first block to get −(B⁻¹)ᵀ.
4. Double annihilation proves involutivity, and taking a coordinate hyperplane exchanges deletion with quotient projection.
5. Use Gon95 Proposition 7.1 and Lemmas 7.2–7.5 for the geometric intersection description and Corollary 7.6 for the face identity.

**API.**

- `TauCeti.Polylog.WeightThree.configurationDual` (equivalence): The native rational linear equivalence C_m(q)≃C_m(m−q), for 0<q<m.
- `TauCeti.Polylog.WeightThree.configurationDual_sq` (structure): Duality twice is identity after identifying m−(m−q)=q.
- `TauCeti.Polylog.WeightThree.configurationDual_matrix` (simp): The dual of the columns of (I_q,B) is represented by the columns of (−Bᵀ,I_{m−q}).
- `TauCeti.Polylog.WeightThree.configurationDual_faces` (compatibility): Duality exchanges deletion and projection on the rows where both sides are defined.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.configurationDual_four` (computation): For q=2,m=4 and vectors (1,0),(0,1),(1,2),(1,3), the dual class is represented by (−1,−1),(−2,−3),(1,0),(0,1).
- `TauCeti.Polylog.WeightThree.configurationDual_six` (characterisation): On C₆(3), applying the same-rank dual map twice returns the original class.
- `TauCeti.Polylog.WeightThree.configurationDual_notInverse` (non-example): On a normalized square matrix (I_q,B), duality uses negative inverse transpose after normalizing the first block, not B⁻¹ alone; the four-vector fixture distinguishes these matrices.

**Acceptance.**

- The displayed geometric and algebraic conventions agree with the stated source passage.

**Used by.**

- Gon95 §7 pp. 298–303, (7.1)–(7.2), Lemmas 7.2–7.5, Corollary 7.6: Makes the geometric reduction in the chain-map and regulator proofs available as a named reusable object.

**Depends on.** this roadmap: `P.3/generic-vector-configurations`; libraries: `mathlib:LinearIndependent`, `mathlib:Matrix.det`.

**Used in this roadmap by.** `P.3/trilogarithm-duality`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, Gon95 §7 pp. 298–303, (7.1)–(7.2), Lemmas 7.2–7.5, Corollary 7.6: “Corollary 7.6.” — The duality needed for the top projection identity, on actual vector configurations before projectivization.

### Trilogarithm antisymmetry under duality

`P.3/trilogarithm-duality` · theorem · P.3 part

For a projective six-tuple with no four collinear points, its dual represents the negative of its class in G₃(F). Consequently M₃(*x)=−M₃(x), and the alternating triple-ratio map satisfies r₆ p=0 on C₇(4). This is an equality in the geometric quotient and then in the parent explicit B₃, not merely a functional identity of real regulators.

**Hypotheses.**

- F is an infinite field; coefficient groups are rational.

**Proof.**

1. Expand the six-tuple by the seven-term relation and R3 into the 46 projected-cross-ratio terms of Gon95 (8.2).
2. Describe the dual as the six hyperplanes attached to the two triangles by Corollary 7.6.
3. Pair the 46 original terms with the dual terms; identical projected configurations have opposite signs.
4. For the remaining pairs use L′₃(x)=−[x]₃−2[1−x]₃+[1]₃ and the identities in (8.1); Lemma 8.2 supplies the three exceptional projection comparisons.
5. Use deletion/projection duality and the seven-term relation in the dual C₇(3) configuration to obtain top projection vanishing.

**Acceptance.**

- The displayed geometric and algebraic conventions agree with the stated source passage.

**Depends on.** this roadmap: `P.3/configuration-duality`, `P.3/geometric-trilogarithm-comparison`, `P.3/seven-term-configuration-relation`.

**Used in this roadmap by.** `P.3/configuration-chain-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.trilogarithm_duality`.

**Sources.**

- `G95`, Gon95 Theorem 8.1 and Lemma 8.2 pp. 304–308; Theorem 6.3 p. 297: “Theorem 8.1.” — The full source argument for top projection vanishing; its adapter to the common rational normalization is checked separately.

### Configuration chain comparison

`P.3/configuration-chain-comparison` · theorem · P.3 part

With the common normalization above, d₂r₅=r₄∂ on C₅(3), δ₃r₆=r₅∂ on C₆(3), and r₄p=r₅p=r₆p=0 on C₅(4), C₆(4), C₇(4) respectively. Together with the seven-term relation these components give a degree-reversed chain map BC_•^(3)→Γ(F,3), supported in degrees 6,5,4.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. For the right square use Plücker and expand determinant-unit wedges; Gon95 Proposition 3.8 supplies the primitive normalization, and the corrected r₄ matches GR’s r₅.
2. For the left square use the corrected −1/5 coefficient of E-P3-05, then supply the full B₂-valued identity. The nonzero valuation-coordinate computation detects the sign but is not a proof of the entire square.
3. The two lower projection identities use the five-term relation (Gon95 Lemma 6.2 and Lemma 3.6).
4. Apply the trilogarithm-duality node: Corollary 7.6 exchanges deletion and projection, and Theorem 8.1 identifies dual six-tuples with their negatives. Its 46-term cancellation is read on pp. 304–308; converting M₃ to the common r₆ normalization is part of the explicit adapter check.
5. Use the previous seven-term node for the incoming degree-7 differential.

**Acceptance.**

- The right square on the rational moment fixture gives 36 u(2)∧u(3)∧u(5) on both sides.
- Using printed 2 Alt₄ gives −24 u(2)∧u(3)∧u(5), a nonzero counterexample.
- D lowers tuple size while Γ degrees are 6−m.
- On the six-vector E-P3-05 fixture, applying δ₂⊗1 gives coordinate −60 on both sides; the printed positive r₆ gives +60.

**Depends on.** this roadmap: `P.3/exterior-configuration-map`, `P.3/middle-configuration-map`, `P.3/triple-ratio-map`, `P.3/seven-term-configuration-relation`, `P.3/weight-three-complex`, `P.3/trilogarithm-duality`.

**Used in this roadmap by.** `P.3/stabilized-configuration-comparison`, `P.3/configuration-borel-class`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.configuration_chain_comparison`.

**Sources.**

- `G95`, §6 Theorems 6.1 and 6.3 pp. 295–297: “Theorem 6.1.” — The original complex map and its projection identities.
- `GR5`, §7.2 (141)–(144) pp. 64–65: “(143)” — The common normalization must correct both r₄ and r₆; see E-P3-02 and E-P3-05.

### Stabilized configuration comparison

`P.3/stabilized-configuration-comparison` · construction · planet “Configuration comparison” · P.3 part

For infinite F and n≥3 construct c_i^(n):H_{6−i}(GL_n(F),Q)→H^iΓ(F,3), i=1,2,3, using the symmetrized generic-vector resolution C_•^{n−2}(n) of Gon95 §2.6 and its projection map φ to BC^(3). On GL₃ this restricts to the maps induced by r₆,r₅,r₄. The compatible stable map restricts along rational primitive Hurewicz from Quillen K_{6−i}.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Construction.**

1. Use tilde C_p(n), with the first k vectors fixed under d^k; average their permutations by 1/k!.
2. The operator λ^k inserts one of the remaining vectors among the first k+1 and then symmetrizes. Lemmas 2.12–2.16 give the acyclic augmented total resolution.
3. The component φ(l₁,…,l_m)=(l₁,…,l_k | l_{k+1},…,l_m) projects along the first k vectors and then applies the configuration comparison.
4. Use V.4/hyperhomology-map for the edge map, extending its coefficient/complex interface by the request below; groupHomology itself exists in Mathlib. Establish stabilization before taking the supplied stable GL colimit.

**API.**

- `TauCeti.Polylog.WeightThree.configurationComparison` (constructor): The rational group-homology map c_i^(n), for n≥3 and i∈{1,2,3}.
- `TauCeti.Polylog.WeightThree.configurationComparison_stabilize` (functoriality): c_i^(n+1)∘H(stabilize)=c_i^(n).
- `TauCeti.Polylog.WeightThree.configurationComparison_rank3` (compatibility): For n=3 it is the homology map induced by the three explicit configuration components.
- `TauCeti.Polylog.WeightThree.configurationComparison_fieldMap` (functoriality): The parent Γ field map intertwines c_i with injective field maps; identity and composition laws follow.
- `TauCeti.Polylog.WeightThree.configurationComparison_K` (data): Restriction along rational primitive Hurewicz gives the comparison on the rank≤3 piece of K_{6−i}.

**Unit tests.**

- `TauCeti.Polylog.WeightThree.configurationComparison_zero` (degenerate): Every c_i^(n) sends the zero homology class to zero.
- `TauCeti.Polylog.WeightThree.configurationComparison_degree2` (characterisation): At i=2 the actual configurationComparison has codomain H²Γ and group-homology degree 4, agreeing with the published final display on p. 298.
- `TauCeti.Polylog.WeightThree.configurationComparison_stableFixture` (compatibility): The class represented by a degree-5 GL₃ configuration cycle has identical H¹Γ image after block stabilization to GL₄.

**Acceptance.**

- The declaration has exactly the stated hypotheses, signs and normalization.

**Used by.**

- Gon95 §2.6 Lemmas 2.12–2.16; §6 (6.4)–(6.8): Provides the concrete formula used by the subsequent comparison and its normalization checks.

**Depends on.** this roadmap: `P.3/weight-three-bigrassmannian`, `P.3/configuration-chain-comparison`; other roadmaps: `K3BlochGroups:V.4/hyperhomology-map`, `KTheoryLowDegrees:U.1/stable-general-linear-group`; stages: `GeneralAlgebraicKTheory:K.2:plus`, `K3BlochGroups:V.4`; libraries: `mathlib:CategoryTheory.ShortComplex.homologyMap`, `mathlib:groupHomology`, `mathlib:Rep.trivial`.

**Used in this roadmap by.** `P.3/rank-two-vanishing`, `P.3/cycle-lifting`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`.

**Sources.**

- `G95`, Gon95 §2.6 Lemmas 2.12–2.16; §6 (6.4)–(6.8): “(6.8)” — The construction on group homology precedes the restriction to rational K-theory.

### Rank-two vanishing

`P.3/rank-two-vanishing` · theorem · P.3 part

For n≥3 and i=1,2,3, c_i^(n) vanishes on the image of H_{6−i}(GL₂(F),Q). Thus restriction to K_{6−i}∩im H_{6−i}(GL₃) factors through its quotient by K_{6−i}∩im H_{6−i}(GL₂). No assertion identifies this rank-three graded quotient with an Adams eigenspace, and no factorization of all K_{6−i} through that quotient follows without a rank≤3 theorem.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. Fix a vector outside the GL₂ plane; it gives a GL₂-fixed section in the generic-vector resolution used in Gon95 §6.
2. The edge map into the weight-three quotient is consequently zero on this subgroup.
3. Intersect the stable homology images with the rational primitive K-space and apply the quotient universal property.

**Acceptance.**

- The quotient is rank≤3/rank≤2, in degrees 5,4,3 respectively.
- Adams-weight equivalence stays a conjectural P.4 input.

**Depends on.** this roadmap: `P.3/stabilized-configuration-comparison`; other roadmaps: `KTheoryLowDegrees:U.1/stable-general-linear-group`; stages: `GeneralAlgebraicKTheory:K.2:plus`; libraries: `mathlib:Submodule.liftQ`.

**Used in this roadmap by.** `P.3/suslin-top-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.rank_two_vanishing`.

**Sources.**

- `G95`, Gon95 pp. 219–220 rank filtration; §6 pp. 297–298: “GL₂(F)” — The rank-two vanishing and the precise domain of the rank-graded comparison.

### Top-degree configuration–Milnor comparison

`P.3/suslin-top-comparison` · comparison · P.3 part

Under the imported Suslin integral homology/Milnor quotient isomorphism, compare η∘c₃ on the rank-three graded rational K₃ quotient with the diagonal Milnor symbol map restricted along primitive Hurewicz. Compute the nonzero rational normalization coefficient κ for r₄=18 f₀ and specify the rescaling that gives equality. The cited Suslin quotient theorem does not itself identify κ or the restriction to primitive K₃. This comparison is a normalization adapter, not a second proof of homological stability. Degree-three Quillen-transfer compatibility needs the separate T.3 request.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. Import V.4/homological-stability; its Suslin source-proof gap remains with that owner. Compute the diagonal-symbol configuration image in degree 3 and compare the η normalization.
2. Use the requested primitive Hurewicz/rank interface to restrict the homology quotient to K₃.
3. Evaluate the corrected configuration map on explicit diagonal bar-shuffle cycles and compare both symbol and primitive conventions; determine κ before asserting agreement.
4. The required primitive projection and symbol compatibility are requested below; Suslin’s own source was not obtained, and its existing V.4 source gap is inherited rather than duplicated.

**Acceptance.**

- The n=3 torsion allowance is 2-torsion, killed by Q.
- No integral isomorphism is asserted without that allowance.
- The coefficient κ is computed by the actual diagonal-symbol cycle, not inferred from Suslin’s abstract isomorphism or assumed to be one.

**Depends on.** this roadmap: `P.3/steinberg-boundary-image`, `P.3/rank-two-vanishing`, `P.3/milnor-degree-comparison`; other roadmaps: `K2SymbolsBrauer:T.2/milnor-k-theory`, `K3BlochGroups:V.4/homological-stability`; stages: `GeneralAlgebraicKTheory:K.2:plus`, `K2SymbolsBrauer:T.3`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.suslin_top_comparison`.

**Sources.**

- `G95`, Gon95 p. 220 remark after Theorem 1.14, citing Suslin 1984: “(n−1)!” — This is the primary Goncharov statement of the Suslin input; access to Suslin’s own proof remains explicit.

### Configuration Borel class

`P.3/configuration-borel-class` · theorem · P.3 part

Over C, evaluating M₃ (equivalently the correctly normalized configuration map) by L₃ gives a measurable alternating configuration 5-cocycle. Its class is the comparison image of a nonzero class in H⁵_cts(GL₃(C),R), in the conjugation-even primitive Borel line. The measurable configuration cohomology in this degree is two-dimensional; one must project to the indicated parity/primitive line before using one-dimensionality.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. Use Gon95 Theorem 9.1’s PGL₃-equivariant configuration spectral sequence; stabilizer cohomology is computed by measurable Shapiro.
2. The two classes are M₃ and the differential of the Bloch–Wigner face functional; track complex-conjugation parity.
3. Use Theorem 1.9 for the continuous-comparison lift and Proposition 1.11’s degenerate configuration test for non-coboundarity.
4. Import Borel’s primitive-line computation rather than constructing continuous group cohomology here.

**Acceptance.**

- The coefficient relating this class to Borel is initially a nonzero real number, not automatically rational.
- The degenerate {1} configuration evaluates to ζ(3).

**Depends on.** this roadmap: `P.3/configuration-chain-comparison`, `P.3/trilogarithm-descent`; other roadmaps: `BorelRegulators:R.3/compact-dual-cohomology`, `BorelRegulators:R.4/universal-borel-class`; stages: `BorelRegulators:R.7`.

**Used in this roadmap by.** `P.3/rational-regulator-calibration`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.configuration_borel_class`.

**Sources.**

- `G95`, Gon95 Theorem 1.9, Proposition 1.11 and §9.1 Theorem 9.1: “Theorem 9.1.” — The nonzero continuous class and the two-dimensional measurable calculation are kept distinct.

### Lifting trilogarithmic cycles

`P.3/cycle-lifting` · theorem · P.3 part

For every infinite F of characteristic zero, each z∈ker(δ₃:B₃(F)→B₂(F)⊗U_F) has a rational degree-5 stable GL homology class h whose configuration comparison equals z. For a number field the primitive projection of h has the same Borel pairing as h. This is the precise lifting input needed for all-family special values; it does not assert that H¹Γ is isomorphic to K₅^(3).

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. Use the alternating rational resolution by all projective configurations in Gon95 §9.2, not merely the generic orbit complex.
2. Filter its PGL₃-equivariant homology spectral sequence; identify the degenerate-generator group on the E₂ diagonal with the trilogarithmic symbols and δ₃.
3. Compute the higher differentials to show every kernel element survives to total degree 5; the paper asserts this computation but does not display it.
4. Pass from PGL₃ to stable GL and primitive projection via the requested K-theoretic interface; the decomposable part has zero primitive Borel pairing.

**Acceptance.**

- The cycle [1]₃ has a homology lift pairing to ζ(3).
- The needed conclusion concerns regulator images, not injectivity of the K-comparison.

**Depends on.** this roadmap: `P.3/stabilized-configuration-comparison`, `P.3/trilogarithm-descent`; other roadmaps: `BorelRegulators:R.4/universal-borel-class`; stages: `GeneralAlgebraicKTheory:K.2:plus`, `K3BlochGroups:V.4`.

**Used in this roadmap by.** `P.3/rational-regulator-calibration`, `P.3/regulator-image-containment`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.cycle_lifting`.

**Sources.**

- `G95`, Gon95 §9.2 pp. 310–311: “higher differentials” — The asserted cycle-lifting computation is isolated as a theorem with an explicit proof gap.

### Rational regulator calibration

`P.3/rational-regulator-calibration` · theorem · P.3 part

Let b₃^G be Borel’s original real configuration normalization used by Gon95. Then the L₃ configuration class is a nonzero rational multiple of b₃^G. With the R.4 target-coordinates normalization, dividing R(2) by its Tate generator, the adapter is instead a nonzero rational multiple of π² times that coordinate regulator. The exact rational coefficient depends on the two universal-class conventions; it must be computed, not inferred from real one-dimensionality.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. First obtain a nonzero real proportionality on the primitive parity-even line from the previous class node.
2. Lift [1]₃ over Q by §9.2 and evaluate L₃ to ζ(3).
3. Use Borel’s Q period statement in the same original real convention to prove the proportionality rational and nonzero.
4. Translate to R.4 using its universal-class normalization and Tate-coordinate adapter. Independently check the π² factor by R.5: its determinant period is sqrt|D| π^(−2r₁−5r₂)ζ_F(3), whereas the L₃ determinant period is sqrt|D| π^(−3r₂)ζ_F(3).
5. Record the exact class-level adapter as an open R.7 request; parent rational proportionality is not reused in a different normalization.

**Acceptance.**

- Over Q, L₃([1]₃)=ζ(3) and the normalized R.4 coordinate regulator has period π^(−2)ζ(3).
- The exponent discrepancy for general F is 2(r₁+r₂), the determinant of a π² coordinate adapter.

**Depends on.** this roadmap: `P.3/configuration-borel-class`, `P.3/cycle-lifting`; other roadmaps: `BorelRegulators:R.4/target-coordinates`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.5/borel-zeta-proportionality`, `BorelRegulators:R.5/leading-term-functional-equation`; stages: `BorelRegulators:R.7`.

**Used in this roadmap by.** `P.3/regulator-image-containment`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.rational_regulator_calibration`.

**Sources.**

- `G95`, §9.2 p. 311 rational calibration: “ζ_Q(3)” — The rationality proof uses a nonzero rational cycle and a period comparison, not dimension alone.

### Regulator image containment

`P.3/regulator-image-containment` · theorem · P.3 part

For a number field F, write d=r₁+r₂, select all real embeddings and one embedding from each complex pair, and let R_L:H¹Γ(F,3)→R^d have coordinates L₃∘σ. Then im_Q R_L is contained in the Q-span of π² times the R.4 Borel regulator image on K₅(F)⊗Q. This containment suffices for every-family determinant rationality. It neither needs nor proves that the K₅ comparison is surjective or an isomorphism on all H¹Γ.

**Hypotheses.**

- F is an infinite field; all coefficient modules are rational unless specified otherwise.

**Proof.**

1. Lift each cycle by the previous cycle-lifting theorem.
2. Apply the calibrated regulator-class equality at every selected embedding.
3. Replace stable homology by its primitive K-component, using the requested primitive Hurewicz interface and vanishing of primitive classes on decomposables.
4. Use the same coefficient at every embedding, since it is a universal class comparison over C.

**Acceptance.**

- Each regulator column has rational coordinates relative to a fixed Borel rational basis after the common π² adapter.

**Depends on.** this roadmap: `P.3/cycle-lifting`, `P.3/rational-regulator-calibration`; other roadmaps: `BorelRegulators:R.3/borel-rank-theorem`, `BorelRegulators:R.4/regulator-real-isomorphism`; stages: `GeneralAlgebraicKTheory:K.2:plus`.

**Used in this roadmap by.** `P.3/every-family-special-value`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.regulator_image_containment`.

**Sources.**

- `G95`, Gon95 §9.2 p. 311, applied at all embeddings: “Borel theorem” — The sufficient regulator-image statement separates the determinant argument from a stronger motivic comparison conjecture.

### Every-family special-value determinant

`P.3/every-family-special-value` · theorem · P.3 part

Let F be a number field, D_F its discriminant, d=r₁+r₂ and σ₁,…,σ_d the chosen embeddings. For ANY cycles z₁,…,z_d in ker δ₃, there exists q∈Q, possibly zero, with det(L₃(σ_i z_j))=q sqrt|D_F| π^(−3r₂) ζ_F(3). For some family q≠0, by the imported parent existence theorem. The orientation of this formula is essential: the reverse ζ_F(3)=q·det cannot hold for zero or dependent families.

**Hypotheses.**

- F is a number field.
- The cycle-lifting and normalization adapter gaps must be resolved to prove this planned theorem.

**Proof.**

1. Choose a rational Borel basis using the rank theorem and real regulator isomorphism.
2. Regulator-image containment writes every column as a rational matrix times π² times the Borel basis columns.
3. Use native Matrix.det_mul. R.5 gives the Borel determinant period sqrt|D| π^(−2r₁−5r₂)ζ_F(3) up to a nonzero rational scalar.
4. Multiply by π^(2d); the exponent becomes −3r₂. Singular rational coordinate matrices give q=0.
5. Import the parent existence theorem to obtain a family with nonzero determinant; do not duplicate its proof.

**Acceptance.**

- Taking all z_j=0 gives det=0 and q=0.
- For F=Q and z₁=[1]₃ the formula holds with q=1.
- Replacing a nonzero family by a rational matrix multiplies q by its determinant.

**Depends on.** this roadmap: `P.3/regulator-image-containment`, `P.3/weight-three-special-value`; other roadmaps: `BorelRegulators:R.4/regulator-determinant`, `BorelRegulators:R.5/borel-positive-zeta-period`; libraries: `mathlib:Matrix.det_mul`, `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.discr`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.InfinitePlace.embedding`.

**Library.** module `TauCeti/NumberTheory/Polylogarithms/WeightThree`, namespace `TauCeti.Polylog.WeightThree`, declaration `TauCeti.Polylog.WeightThree.every_family_special_value`.

**Sources.**

- `G95`, Theorem 1.1 p. 198; §9.2 pp. 310–311: “Theorem 1.1.” — The published existence theorem and the stronger every-family consequence have separate dependency chains.

## P.4 — General polylogarithmic statement infrastructure

*Coverage in `Polylogarithms.json`: partial, 12 nodes.* The inductive groups B_n and delta_n by one recursion, the descent through the specialisation lemma, L_n on B_n(C), the comparison with the explicit groups, the general complex, the condition *_n, the Zagier determinant with its general normalisation, Zagier's three propositions with their proved cases, the weight-four theorem and the Lie coalgebra extension.

Remaining in this record:

- The specialisation argument and the descent of L_n (Goncharov 1994, 1995)
- The general-weight normalisation (Zagier 1990)
- Part (b) of the weight-four theorem for the inductive B_3
- Suslin's rigidity (requested from K3BlochGroups V.4)

*Coverage in `Polylogarithms--P.4.json`: planned, 18 nodes.*

Remaining in this record:

- Degenerating rational-curve relation specialization: Supply a joint induction proving sp_a(R_n(F(t)))⊆R_n(F) in the exact GR/G94 rational-curve model, including degenerating two-variable kernel witnesses. G95 Lemma 1.16 is a smooth-curve model and its printed tensor specialization fails bilinearity. Angular components repair the generator boundary square but do not, without this family argument, prove preservation of the relation subspace. The scalar constancy proof has been read and is planned; its algebraic lower-weight specialization dependency inherits this gap.
- Explicit weight-four correlator and regulator proof owner: The named Polylogarithms Part II must supply GR Theorem 1.14(a),(c), Corollary 1.15, motivic-correlator realization (Theorem 1.13), the configuration/flag cocycles (Theorems 7.6,9.1), the cycle-level L₄* to L₄ period adapter and §9.3 regulator comparison. For part (b) include the explicit-cycle period-image containment, not only the map κ from K₇. This P.4 job owns the exact objects/statements and interface; it does not claim to have decomposed the full §§2–10 proof or invented an already-live extension id.
- Inductive weight-four every-family determinant: Prove all ω:ker δ₄^ind→ker(p₃⊗id)/δ₄^exp(ker p₄) vanish, or prove directly that embedding-wise periods of all inductive cycles lie in the calibrated rational K₇ regulator image. The explicit-to-inductive group surjections and GR complex (44) do not supply either assertion. Full p₃ bijectivity is a stronger conjectural sufficient condition, not a premise silently granted here.
- Finite-place symbol descent and signed residues: Extend the rational-point relation-preservation proof to polynomial-place residue fields k_p and prove the displayed residue maps descend through inductive relations and satisfy the signed native-shift chain squares. Parent P.3 exterior residue supplies only the unit wedge map. A proof must retain uniformizer-first orientation and finite support; neither follows merely from the scalar period theorem.
- Weight-four homotopy and derived transfer independence: The rational-curve analogue of Gon95 Conjecture 1.39 at n=4 remains conjectural. Once ρ₄ exists, prove its quasi-isomorphism or keep it as an explicit hypothesis. To deduce it from Gon95’s all-smooth-curve assertion, also supply a comparison of the two curve models compatible with the complexes, field inclusions and finite-place residue maps; G94 Definition 1.19 does not establish that comparison. A separate proof of primitive-element and tower independence, plus agreement with top Milnor cohomology, is still required for derived transfers. GR Corollary 1.15 is a different comparison and does not prove this homotopy statement.
- Resolve the three exact supplier exports (V.4 rigidity, R.7 scalar coordinate calibration, S.6 number-field Adams purity). General-weight motivic comparison and homotopy remain conjectures, not unfinished formal proofs claimed by this packet.

The layer has 30 nodes: the first packet's twelve, which build the inductive groups, the general complex and the determinant and state Zagier's conjecture and the weight-four theorem, and the P.4 part's eighteen, which supply the specialisation and analytic-descent proofs, separate the logical forms of the conjecture, audit the period normalisation in every weight, and make the weight-four presentation question exact.

- **The inductive groups.** B_n(F) = ℚ[F]/R_n(F) is defined for all fields at once, by recursion on n: R_n(F) is spanned by {0} and by the specialisations Σ n_i({f_i(1)} − {f_i(0)}) of elements Σ n_i{f_i(t)} of Ker δ_n over F(t), where δ_n{x} = {x}_{n−1} ⊗ x (n ≥ 3) and δ_2{x} = (1 − x) ∧ x, with δ_n{0} = δ_n{1} = 0 and a pole specialising to {∞} = 0. These are Goncharov–Rudenko's rational-curve groups (GR, G94); they are not the all-smooth-curve quotient of Goncharov 1995 §1.9, and no comparison of the two is assumed. Specialisation at a rational point with the angular unit map u_π commutes with δ_n, so δ_n descends to B_n(F) and R_n(F) ⊆ Ker δ_n; the joint induction over weights and fields has one step still open, the degenerating two-variable families (gap). Goncharov's printed tensor rule on p. 222 is not bilinear (source issue E-P4-01), which is why the specialisation uses u_π.
- **Comparison and the complex.** The explicit B_2 of P.3 is isomorphic to the inductive B_2 through Suslin's rigidity B(F) ≅ B(F(t)) for infinite F (K3BlochGroups V.4, Suslin Corollary 5.6); the explicit B_3 surjects onto the inductive one, bijectivity being Goncharov's conjecture. The general complex B(F; n) runs B_n → B_{n−1} ⊗ F^×_ℚ → … → ⋀^n F^×_ℚ in degrees [1, n] (GR's printed (5) and (6) have misprints, source issue E6), and its H¹ = Ker δ_n is the space of elements satisfying GR's condition *_n. Goncharov's conjecture gr^n_γ K_{2n−i}(F)_ℚ ≅ H^iB(F; n) is a conjecture, stated with its proved cases (n ≤ 2, i = n, and the maps for n = 3, 4).
- **Analytic descent.** Σ q_f L_n(f(a)) is constant in a ∈ ℙ¹(ℂ) for every cycle Σ q_f{f} ∈ Ker δ_n over ℂ(t): its differential factors through δ_n by the general-weight formula dL̂_n = L̂_{n−1} i d arg z − Σ_{k=2}^{n−2} β_k log^{k−1}|z| L̂_{n−k} d log|z| − β_{n−1} log^{n−2}|z| [log|z| d log|1 − z| − log|1 − z| d log|z|], L̂_n = L_n or iL_n by parity and β_k = 2^kB_k/k!. Goncharov's (1.28c) prints β_n log^{n−1} in the last term (source issue E-P4-02). Hence L_n descends to B_n(ℂ) → ℝ, which the first packet stated from Goncharov 1994 without proof. The inversion relation {x}_n + (−1)^n{x^{−1}}_n = 0 holds, so {1}_{2m} = 0, while {1}_n ≠ 0 for odd n because L_n(1) = ζ(n).
- **The determinant and the three assertions.** For a number field F with r_1 real and r_2 complex places, d_n = r_1 + r_2 (n odd) or r_2 (n even), and Z_n(y) = π^e |d_F|^{−1/2} det(L_n(σ_i(y_j))) with e = n(N − d_n), N = [F : ℚ], that is e = nr_2 for odd n and n(r_1 + r_2) for even n; for ℚ(i), e = n in both parities. Zagier's conjecture is three different propositions: existence of cycles with nonzero determinant, the comparison of H¹ with gr^n_γ K_{2n−1}, and the rationality of Z_n(y)/ζ_F(n) for every family. Rank-only existence implies the exact equality Z_n(y) = ζ_F(n) only together with rationality: the P.4 part's rational existence (a rational nonzero factor) is the correct form, and its implications with the other two are proved (`P.4/assertion-logic`). The period normalisation is audited against Borel's covolume (R.5) and R.4's Tate-divided coordinates: a regulator-compatible comparison has an explicit factor π^{n−1}, and number-field Adams purity is requested from SchemeKTheoryOperations S.6.
- **Weight four.** Goncharov–Rudenko's theorem is a theorem: ζ_F(4) is π^{4(r_1+r_2)}|d_F|^{−1/2} times a determinant of L_4 at cycles of the explicit complex Γ_exp(F, 4) = (B_4^comb → B_3^exp ⊗ U → B_2 ⊗ ⋀²U → ⋀⁴U), and for a totally real field the empty determinant gives ζ_F(4) ∈ ℚ^× π^{4r_1}|d_F|^{−1/2} (for ℚ, Z_4 = π⁴ = 90 ζ(4); the printed equality is false, source issue E2). Its proof (motivic correlators, cluster polylogarithms, GR Theorems 1.13–1.14, 7.6, 9.1 and §9.3) belongs to the proposed Part II. The P.4 part constructs the chain map Γ_exp(F, 4) → Γ_ind(F, 4) and the exact obstruction ω to lifting an inductive cycle to an explicit one: part (b) of the theorem holds for every inductive family if ω vanishes on it, or if all inductive periods lie in the calibrated K_7 regulator image, and neither is proved. Residues at the finite places of F(t) define ρ_4, and the homotopy conjecture that ρ_4 is a quasi-isomorphism, the rational-curve analogue of Goncharov 1995 Conjecture 1.39, is recorded as a conjecture; it is the hypothesis of P.3's conditional transfer.

**How the parts fit.** The P.4 part imports the first packet's twelve nodes by id. It proves what the first packet took from Goncharov 1994 and 1995 and Zagier 1990, which the first packet had not obtained: the specialisation lemma (`P.4/specialization-and-delta`, with its degeneration step still open), the descent of L_n (`P.4/polylog-on-higher-bloch`), the general-weight normalisation (`P.4/zagier-determinant`) and Suslin's rigidity input to `P.4/explicit-to-inductive-comparison`. The Assembly notes after `P.4/higher-bloch-group`, `P.4/zagier-statement` and `P.4/weight-four-theorem` carry the three corrections the P.4 part asks the assembly to preserve: the two curve models are not identified, rank-only existence does not give exact ζ equality, and part (b) of the weight-four theorem for inductive cycles rests on the obstruction gap.

### Goncharov's inductive groups B_n(F) and the maps delta_n on Q[F]

`P.4/higher-bloch-group` · definition · planet “Higher Bloch groups” · first packet

For every field F define simultaneously, by recursion on n ≥ 1, a Q-subspace R_n(F) of Q[F] = (F →0 Q) (generators {x}, x in F, with a generator {∞} set to 0), the quotient B_n(F) := Q[F]/R_n(F) with classes {x}_n, and the map delta_n : Q[F] → B_{n-1}(F) tensor F^x_Q for n ≥ 3, {x} ↦ {x}_{n-1} tensor x, respectively delta_2 : Q[F] → Lambda^2 F^x_Q, {x} ↦ (1 - x) wedge x, with delta_n{0} = delta_n{1} = 0 (the source fixes the value at 0 only for n = 2; source issue Polylogarithms/E3). R_1(F) is spanned by {xy} - {x} - {y} for x, y in F^x and by {0}, so that B_1(F) = F^x_Q. For n ≥ 2, R_n(F) is spanned by {0} and by sum_i n_i({f_i(1)} - {f_i(0)}) for every sum_i n_i {f_i(t)} in Ker delta_n over F(t). The recursion runs over all fields at once, since R_n(F) uses delta_n over F(t). That delta_n descends to B_n(F) is P.4/delta-map. These are GR's inductive groups, rational as in the source; the explicit groups B_2 and B_3 of P.3 are compared with them in P.4/explicit-to-inductive-comparison.

**Hypotheses.**

- F is a field; GR's results assume F infinite, but the definition makes sense for every field.
- n ≥ 1.
- All groups are Q-vector spaces.

**Construction.**

1. Define R_1(F) and check B_1(F) = F^x_Q, {x}_1 ↦ x tensor 1.
2. For n ≥ 2, given B_{n-1}(K) for every field K, define delta_n on Q[K] and then R_n(F) by specialising elements of Ker delta_n over F(t) at t = 1 and t = 0 (a pole specialises to {∞} = 0).
3. Prove functoriality: a field homomorphism F → F' induces B_n(F) → B_n(F') through F(t) → F'(t).
4. Prove {x}_n = (-1)^{n-1}{x^{-1}}_n for n ≥ 2 by induction: {xt}_n - (-1)^{n-1}{(xt)^{-1}}_n lies in Ker delta_n over F(t) by the case n - 1, and specialises to the relation at t = 1 and to 0 at t = 0.
5. Record that the source's groups are rational; Goncharov's integral groups (1995) are different objects.

**API.**

- `higherBloch` (data): The Q-vector space B_n(F).
- `higherBloch.module` (instance): B_n(F) is a Q-vector space.
- `higherBloch.mk` (constructor): The class {x}_n of x in F.
- `higherBloch.mk_zero` (simp): {0}_n = 0.
- `higherBloch.mk_infty` (simp): {∞}_n = 0.
- `higherBloch.induction_on` (characterisation): B_n(F) is spanned by the classes {x}_n.
- `higherBloch.mk_inv` (relation): {x}_n = (-1)^{n-1}{x^{-1}}_n for n ≥ 2 and x in F^x.
- `higherBloch.one` (compatibility): B_1(F) = F^x_Q.
- `higherBloch.two` (compatibility): For infinite F, B_2(F) = P(F) tensor Q, {x}_2 ↦ [x]. Promoted to Polylogarithms:P.4/explicit-to-inductive-comparison.
- `higherBloch.lift` (universal-property): A Q-linear map on Q[F] killing R_n(F) descends, uniquely.
- `higherBloch.map` (functoriality): A field homomorphism induces B_n(F) → B_n(F').
- `higherBloch.map_id` (functoriality): The identity induces the identity.
- `higherBloch.map_comp` (functoriality): Composition is preserved.
- `deltaQ` (constructor): delta_n : Q[F] → B_{n-1}(F) tensor F^x_Q (n ≥ 3) or Lambda^2 F^x_Q (n = 2).

**Unit tests.**

- `weight_one` (compatibility): B_1(F) = F^x_Q, {x}_1 ↦ x tensor 1.
- `inv_two` (characterisation): {x}_2 + {x^{-1}}_2 = 0: {xt} + {(xt)^{-1}} lies in Ker delta_2 over F(t) and specialises to {x} + {x^{-1}} at t = 1 and to {0} + {∞} = 0 at t = 0.
- `one_two` (computation): {1}_2 = 0 (the previous argument with x = 1).
- `one_three_ne_zero` (non-example): {1}_3 ≠ 0 in B_3(Q), since L_3(1) = ζ(3) ≠ 0 (P.4/polylog-on-higher-bloch).
- `not_kernel` (non-example): R_2(C) ≠ Ker delta_2: delta_2{exp(i π/3)} = (1 - w) wedge w = w^{-1} wedge w = 0, but L_2(exp(i π/3)) = 1.0149... ≠ 0.

**Acceptance.**

- B_1(F) = F^x_Q.
- For infinite F, B_2(F) = P(F) tensor Q (K3BlochGroups V.3 pre-Bloch group) by P.4/explicit-to-inductive-comparison; the rationalised Bloch group is Ker delta_2 in B_2(F).
- L_n descends to B_n(C) (P.4/polylog-on-higher-bloch), which shows that R_n consists of functional equations.
- R_n is not Ker delta_n: {exp(i π/3)}_2 lies in Ker delta_2 but L_2 of it is D(exp(i π/3)) ≠ 0.

**Used by.**

- P.4's general complex: every term is one of these groups tensored with an exterior power
- P.4's Zagier statement: the elements of the statement lie in Ker delta_n inside B_n(F)
- GR Theorems 1.1 and 1.2: the weight-four elements y_j lie in Ker delta_4 inside B_4(F)

**Depends on.** libraries: `mathlib:Finsupp`, `mathlib:RatFunc`, `mathlib:TensorProduct`, `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:exteriorPower.ιMulti`, `mathlib:Additive`.

**Used in this roadmap by.** `P.4/delta-map`, `P.4/specialization-and-delta`, `P.4/explicit-to-inductive-comparison`, `P.4/general-polylog-complex`, `P.4/polylog-on-higher-bloch`, `P.4/condition-o-n`, `P.4/freeness-extension`, `P.5/strong-reciprocity-conjecture`, `P.4/relation-specialization-induction`, `P.4/higher-symbol-inversion`, `P.4/suslin-rigidity-adapter`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/HigherBloch`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, 1.1, item 4 (PDF p. 4): “one defines inductively for each n >= 1 a subspace R_n(F) in Q[F] reflecting functional equations for the classical n-logarithm function, and set B_n(F) := Q[F] / R_n(F). ... The subgroup R_n(F) is generated by all elements obtained this way, and {0}.” — The definition, as displayed.
- `GR.2022`, 1.1, item 4 (PDF p. 4): “Any expression sum n_i {f_i(t)} which lies in the kernel of delta_n for the field F(t) gives rise to an element sum n_i ({f_i(1)} - {f_i(0)}).” — The specialisation recipe.
- `GR.2026`, Conventions (PDF p. 4): “Conventions. A few remarks about conventions are in order. First, we work everywhere with infinite fields. Second, we work modulo torsion, i.e., with Q-vector spaces.” — The standing hypotheses of the version of record.

**Assembly note.** The recursion is the rational-curve recursion of GR and Goncharov 1994, not the all-smooth-curve quotient of Goncharov 1995 §1.9. Goncharov 1995's constant-field rigidity does not identify the two models without an adapter compatible with the complexes, field inclusions and residues, and none is assumed.

### Specialisation commutes with delta_n

`P.4/specialization-and-delta` · lemma · first packet

Let K be a field with a discrete valuation v, residue field k and uniformiser π, and let u_pi : K^x_Q → k^x_Q, f ↦ (f π^{-v(f)})-bar. For every n ≥ 1 the map s_v : Q[K] → Q[k], {f} ↦ {f-bar} if v(f) = 0 and 0 otherwise ({0}, {∞} ↦ 0), induces s_v : B_n(K) → B_n(k) for n ≥ 2 (for n = 1 use u_pi), and (s_v tensor u_pi) o delta_n = delta_n o s_v for n ≥ 3 and Lambda^2(u_pi) o delta_2 = delta_2 o s_v. Consequently R_n(F) is contained in Ker delta_n for every field F: apply this at t = 1 and at t = 0 on F(t).

**Hypotheses.**

- v is a discrete valuation on K with residue field k; n ≥ 1.

**Proof.**

1. Joint induction on n. At n = 2 check the identity on {f} in the cases v(f) > 0, v(f) < 0, v(f) = 0 with f-bar ≠ 1, and f-bar = 1, using delta_2{1} = 0 and, rationally, (-1) wedge u = 0.
2. For n ≥ 3 the identity on generators is immediate from the definitions; that s_v kills R_n(K) is a two-variable specialisation argument over K(t) using the case n - 1 (gap: the argument of Goncharov 1995 was not obtained).
3. Apply the result to the valuations t and t - 1 of F(t) to get R_n(F) in Ker delta_n.

**Acceptance.**

- At n = 2, f = t in k(t) with v = ord_t: s_v{t} = 0 and Lambda^2(u_t)((1 - t) wedge t) = 1 wedge 1 = 0.

**Depends on.** this roadmap: `P.4/higher-bloch-group`; libraries: `mathlib:RatFunc`, `mathlib:Valuation`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsLocalRing.ResidueField`.

**Used in this roadmap by.** `P.4/delta-map`.

**Sources.**

- `GR.2026`, Section 1.1, item 4 (PDF p. 5): “One proves that the map delta_n induces a group homomorphism” — The source asserts the descent and refers to Goncharov (1995) for the proof, which was not obtained; this lemma is the specialisation argument that proves it (gap for the full induction).

**Assembly note.** Proved by `P.4/relation-specialization-induction`, with the angular unit map u_π (Goncharov's printed tensor rule on p. 222 is not bilinear, source issue E-P4-01), except the step for degenerating two-variable families, which is the P.4 part's gap 1.

### The map delta_n on the inductive groups

`P.4/delta-map` · construction · first packet

For a field F and n ≥ 2, the map delta_n of P.4/higher-bloch-group descends to homomorphisms delta_n : B_n(F) → B_{n-1}(F) tensor F^x_Q for n ≥ 3 and delta_2 : B_2(F) → Lambda^2 F^x_Q, {x}_n ↦ {x}_{n-1} tensor x, respectively (1 - x) wedge x; that is, R_n(F) is contained in Ker delta_n (P.4/specialization-and-delta). Under B_2(F) = P(F) tensor Q, delta_2 = -(toExterior o bloch-boundary) tensor Q, since K3BlochGroups V.3's boundary is [x] ↦ x wedge (1 - x).

**Hypotheses.**

- F is a field; n ≥ 2; all groups are rational.

**Construction.**

1. Take delta_n on Q[F] from P.4/higher-bloch-group.
2. R_n(F) is contained in Ker delta_n by P.4/specialization-and-delta.
3. Descend through higherBloch.lift.
4. Prove functoriality for a field homomorphism.
5. Record the weight-two sign against V.3 (P.4/explicit-to-inductive-comparison).

**API.**

- `deltaMap` (constructor): The descended map on B_n(F), in both cases.
- `deltaMap_gen` (simp): delta_n {x}_n = {x}_{n-1} tensor x (n ≥ 3) and delta_2 {x}_2 = (1 - x) wedge x.
- `deltaMap_degenerate` (simp): delta_n vanishes on {0}_n, {1}_n and {∞}_n.
- `deltaMap_descends` (characterisation): delta_n kills R_n(F). Promoted to Polylogarithms:P.4/specialization-and-delta.
- `deltaMap_map` (functoriality): Naturality for a field homomorphism.
- `deltaMap_two_eq_blochBoundary` (compatibility): delta_2 = -(toExterior o bloch-boundary) tensor Q under B_2(F) = P(F) tensor Q. Promoted to Polylogarithms:P.4/explicit-to-inductive-comparison.

**Unit tests.**

- `weight_two_boundary` (computation): Over Q: delta_2{3}_2 = 2 wedge 3 ≠ 0 and delta_2{1/2}_2 = 0.
- `weight_three_gen` (computation): delta_3{x}_3 = {x}_2 tensor x.
- `degenerate_zero` (degenerate): delta_n{0}_n = delta_n{1}_n = delta_n{∞}_n = 0 for every n ≥ 2.
- `descends` (characterisation): delta_n is well defined on B_n(F).
- `sign_against_V3` (non-example): V.3's boundary [x] ↦ x wedge (1 - x) is -delta_2 under B_2(F) = P(F) tensor Q, not delta_2.

**Acceptance.**

- Over Q: delta_2{3}_2 = (-2) wedge 3 = 2 wedge 3 ≠ 0 and delta_2{1/2}_2 = (1/2) wedge (1/2) = 0.
- delta_n{0}_n = delta_n{1}_n = delta_n{∞}_n = 0.
- The map is well defined on the quotient, which is the content of P.4/specialization-and-delta.

**Used by.**

- P.4's general complex: its differential is this map tensored with the identity
- P.4's condition *_n: the condition is that this map vanishes on the element

**Depends on.** this roadmap: `P.4/higher-bloch-group`, `P.4/specialization-and-delta`; libraries: `mathlib:TensorProduct`, `mathlib:ExteriorAlgebra.exteriorPower`, `mathlib:Additive`.

**Used in this roadmap by.** `P.4/explicit-to-inductive-comparison`, `P.4/general-polylog-complex`, `P.4/condition-o-n`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/HigherBloch`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, 1.1, item 4 (PDF p. 4): “We define by induction a map Q[F] -> delta_n : B_{n-1}(F) tensor F^x_Q for n >= 2, F^x_Q wedge F^x_Q for n = 2, {x} -> {x}_{n-1} tensor x for n >= 2, (1 - x) wedge x for n = 2, delta_2{1} = delta_2{0} = 0. It is handy to add a generator {infinity} together with the relation {infinity} = 0.” — The map and its degenerate conventions, as displayed.
- `GR.2026`, Section 1.1, item 4 (PDF p. 5): “One proves that the map delta_n induces a group homomorphism” — The descent, stated in the source with its proof in Goncharov (1995).

### The explicit groups B_2, B_3 against the inductive groups

`P.4/explicit-to-inductive-comparison` · comparison · first packet

For an infinite field F the identity on generators induces: B_2(F) → B_2^ind(F), an isomorphism compatible with delta_2 (GR v5 p. 9 and footnote 2, through Suslin's rigidity B(F) = B(F(t)), Corollary 5.6 of Suslin 1990); B_3(F) → B_3^ind(F), surjective, with bijectivity Goncharov's conjecture; and, for the span B_4(F) of the {x}_4 in GR's combinatorial L_4(F), a natural map B_4(F) → B_4^ind(F), conjecturally an isomorphism (GR v5 p. 12). Here B_n^ind is P.4/higher-bloch-group. Under B_2(F) = P(F) tensor Q ({x}_2 ↦ [x], matching the source's five-term relation with V.3's), delta_2 = -(toExterior o bloch-boundary) tensor Q.

**Hypotheses.**

- F is an infinite field; all groups are rational.

**Proof.**

1. The five-term relations lie in R_2^ind(F) (specialise the five-term element in a variable), so the identity on generators descends; surjectivity is clear.
2. Injectivity in weight two: an element of R_2^ind(F) is a specialisation of an element of Ker delta_2 over F(t), whose class lies in B(F(t)) tensor Q = B(F) tensor Q by Suslin's rigidity (requested from K3BlochGroups V.4; gap), so its two specialisations agree.
3. In weight three the relations (19) and the 22-term relation lie in R_3^ind(F), giving the surjection (GR v5 p. 9; the 22-term case is GR Proposition 5.4, not read in full).
4. The sign against V.3 is a computation on generators.

**Acceptance.**

- delta_2{x}_2 = (1 - x) wedge x = -(x wedge (1 - x)), the opposite of V.3's sign (K-book VI.5.1: '[x] to x wedge (1 - x)').
- Over Q, delta_2{3}_2 = 2 wedge 3 ≠ 0 and delta_2{2}_2 = (-1) wedge 2 = 0.

**Depends on.** this roadmap: `P.4/higher-bloch-group`, `P.4/delta-map`, `P.3/trilogarithm-group`, `P.3/polylogarithmic-complex`; other roadmaps: `K3BlochGroups:V.3/pre-bloch-group`, `K3BlochGroups:V.3/bloch-boundary`, `K3BlochGroups:V.3/antisym-exterior-comparison`; stages: `K3BlochGroups:V.4`.

**Used in this roadmap by.** `P.4/goncharov-comparison-conjecture`, `P.4/zagier-determinant`, `P.5/reciprocity-second-triangle`, `P.4/presentation-chain-map`.

**Sources.**

- `GR.2026`, Section 1.2 (PDF p. 9): “A deep result of Suslin ([Sus90, Corollary 5.6]) implies that the natural map B2(F) -> B2(F) is an isomorphism.” — The weight-two isomorphism.
- `GR.2026`, Section 1.2 (PDF p. 9): “It was conjectured in [Gon95] that the natural map B3(F) -> B3(F) is an isomorphism.” — The weight-three map and its conjectural bijectivity.

**Assembly note.** The two kernel containments of the weight-two isomorphism are `P.4/suslin-rigidity-adapter`, which imports Suslin's Corollary 5.6 (requested from K3BlochGroups V.4).

### The weight-n polylogarithmic motivic complex

`P.4/general-polylog-complex` · construction · planet “Polylogarithmic motivic complexes” · first packet

For a field F and n ≥ 1, the complex B(F; n) of GR (6): B_n(F) → B_{n-1}(F) tensor F^x_Q → B_{n-2}(F) tensor Lambda^2 F^x_Q → ... → B_2(F) tensor Lambda^{n-2} F^x_Q → Lambda^n F^x_Q in degrees [1, n], with the inductive groups of P.4/higher-bloch-group, B_n(F) in degree 1 and the differential {x}_k tensor Y ↦ {x}_{k-1} tensor (x wedge Y) for k ≥ 3 and {x}_2 tensor Y ↦ (1 - x) wedge x wedge Y (the printed (5) and (6) of GR v5 have misprints, source issue Polylogarithms/E6). d o d = 0 because x wedge x = 0.

**Hypotheses.**

- F is a field (infinite for GR's results); n ≥ 1; all groups rational.

**Construction.**

1. Define the terms and the differential through P.4/delta-map tensored with the wedge product.
2. d o d = 0: on {x}_k tensor Y the composite is {x}_{k-2} tensor (x wedge x wedge Y) = 0 for k ≥ 4, and (1 - x) wedge x wedge x wedge Y = 0 for k = 3.
3. Functoriality for field homomorphisms.

**API.**

- `generalPolylogComplex` (data): B(F; n) as a cochain complex of Q-vector spaces in degrees 1..n.
- `generalPolylogComplex_d_gen` (simp): The differential on generators, in the two cases.
- `generalPolylogComplex_d_comp_d` (relation): d o d = 0.
- `generalPolylogComplex_map` (functoriality): A field homomorphism induces a map of complexes.
- `generalPolylogComplex_H1` (characterisation): H^1 B(F; n) = Ker delta_n.
- `generalPolylogComplex_three_explicit` (compatibility): For infinite F the natural map from P.3's B(F; 3) is a map of complexes, surjective in degree 1.

**Unit tests.**

- `d_comp_d_weight_four` (characterisation): {x}_4 ↦ {x}_3 tensor x ↦ {x}_2 tensor (x wedge x) = 0.
- `weight_one` (degenerate): B(F; 1) is F^x_Q in degree 1.
- `H1_is_kernel` (compatibility): H^1 B(F; 2) = Ker delta_2.
- `not_a_cocycle` (non-example): {3}_2 in B_2(Q) is not a cocycle: delta_2{3}_2 = 2 wedge 3 ≠ 0.

**Acceptance.**

- For n ≤ 3 and infinite F it receives the explicit complex of P.3.
- H^1 is Ker delta_n.

**Used by.**

- P.4's condition *_n: the condition is membership in H^1
- P.4's Goncharov conjecture: the conjecture compares H^i of this complex with K-theory

**Depends on.** this roadmap: `P.4/higher-bloch-group`, `P.4/delta-map`; libraries: `mathlib:ExteriorAlgebra.gradedAlgebra`, `mathlib:TensorProduct`, `mathlib:CochainComplex`, `mathlib:HomologicalComplex.homology`.

**Used in this roadmap by.** `P.4/goncharov-comparison-conjecture`, `P.4/condition-o-n`, `P.5/general-weight-reciprocity-conjecture`, `P.3/conditional-complex-transfer`, `P.4/complex-specialization`, `P.4/presentation-chain-map`, `P.4/weight-four-residue-map`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/HigherBloch`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, 1.1, item 4 (PDF p. 5): “So we get a complex in the degrees [1, n], where B_n(F) is in the degree 1, and the differential has degree +1, called the weight n polylogarithmic motivic complex: B(F; n) : B_n(F) -> B_{n-1}(F) tensor F^x_Q -> ... -> Lambda^n F^x_Q.” — The complex and its indexing, as displayed.
- `Gonch.Arakelov.2004`, Section 6.1 (PDF p. 52): “where delta_n({x}_k tensor Y) := {x}_{k-1} tensor x wedge Y for k > 2, and (1 - x) wedge x wedge y for k = 2, called the weight n polylogarithmic complex.” — The differential on generators.

### Goncharov's conjecture on the polylogarithmic complexes

`P.4/goncharov-comparison-conjecture` · comparison · first packet

For an infinite field F, n ≥ 1 and i > 0, Goncharov's conjecture asserts gr^n_gamma K_{2n-i}(F)_Q = H^i B(F; n). It is recorded as a conjecture (a Prop-valued statement), never assumed. Proved cases: n = 1 (K_1(F)_Q = F^x_Q); n = 2 (Suslin, through P.4/explicit-to-inductive-comparison); i = n (Suslin: H^n = K^M_n(F)_Q, P.3/milnor-degree-comparison at n = 3); and for n = 3, 4 the existence of the maps out of K-theory (P.3/k-theory-comparison-weight-three, GR Theorem 1.3(i)). Suslin's conjecture that the rank and gamma filtrations agree rationally is a separate conjecture.

**Hypotheses.**

- F is an infinite field; n ≥ 1 and i > 0; K-groups are rationalised.

**Proof.**

1. State the conjecture as a Prop with its hypotheses.
2. Record the proved cases with their nodes.

**Acceptance.**

- No node of this packet assumes the conjecture.

**Depends on.** this roadmap: `P.4/general-polylog-complex`, `P.4/explicit-to-inductive-comparison`, `P.3/milnor-degree-comparison`; stages: `MotivicEtaleKTheory:M.6`, `SchemeKTheoryOperations:S.6`.

**Used in this roadmap by.** `P.4/zagier-statement`, `P.4/regulator-comparison`.

**Sources.**

- `GR.2022`, 1.1, item 6 (PDF p. 5): “The conjecture states that one expects the following isomorphisms: gr^n_gamma K_{2n-i}(F)_Q = H^i B(F; n), i > 0.” — The conjecture, as displayed.
- `GR.2026`, Section 1.1, item 6 (PDF p. 7): “The map (12) for i = 4 is an isomorphism due to a theorem of Suslin [Sus84] relating Quillen's and Milnor's K-groups. Conjecture 1.4. The maps (12) are isomorphisms.” — The proved top-degree case and Conjecture 1.4.

**Assembly note.** The regulator-compatible form of the comparison at i = 1, with its explicit factor π^{n−1} against R.4's coordinates, is `P.4/regulator-comparison`.

### The single-valued polylogarithm on B_n(C)

`P.4/polylog-on-higher-bloch` · theorem · first packet

For n ≥ 2 the assignment {z} ↦ L_n(z) (with L_n(∞) = 0) kills R_n(C) and so induces a homomorphism L_n : B_n(C) → R. For n = 1, {z}_1 ↦ log|z| is the map B_1(C) = C^x_Q → R; it is GR's weight-one convention, not the case n = 1 of the formula for L_n.

**Hypotheses.**

- n ≥ 1.

**Proof.**

1. R_n(C) is spanned by {0} and by specialisations of elements of Ker delta_n over C(t).
2. For sum n_i{f_i(t)} in Ker delta_n, the function t ↦ sum n_i L_n(f_i(t)) is constant on the projective line: its differential is expressed through delta_n (Goncharov 1994, Theorem 1.5; gap: not obtained, and the general-weight differential formula of L_n is not planned in P.1). Hence the values at t = 1 and t = 0 agree.

**Acceptance.**

- L_2({exp(i π/3)}_2) = D(exp(i π/3)) = 1.01494... ≠ 0, although delta_2 of it is 0: this refutes the wrong definition R_n := Ker delta_n.
- L_3({1}_3) = ζ(3).

**Depends on.** this roadmap: `P.4/higher-bloch-group`, `P.1/single-valued-polylogarithm`, `P.1/single-valued-continuity`.

**Used in this roadmap by.** `P.4/zagier-determinant`, `P.4/weight-four-theorem`, `P.4/regulator-comparison`, `P.4/presentation-chain-map`.

**Sources.**

- `GR.2026`, Section 1.1, item 4 (PDF p. 5): “One proves [Gon94a, Theorem 1.5] that there is a map of abelian groups L_n : B_n(C) -> R, {z}_n |-> L_n(z), n > 1. For n = 1 we have a map B_1(C) -> R, {z}_1 |-> log |z|.” — The theorem, cited by the source to Goncharov (1994).

**Assembly note.** Proved by `P.4/cycle-constancy` with `P.4/cycle-evaluation`: the evaluation of a cycle over ℂ(t) is constant on ℙ¹(ℂ). The first packet's source gap on Goncharov 1994, Theorem 1.5, is answered.

### The condition *_n: delta_n y = 0

`P.4/condition-o-n` · definition · first packet

An element y of B_n(F) satisfies GR's condition *_n when delta_n y = 0, that is, when y lies in H^1 B(F; n), the kernel of the first differential, since the complex starts in degree one. The elements satisfying it form the subspace Ker delta_n. The source's name is *_n (text extraction renders it as 'o_n'); GR v5 drops the name and speaks of Ker delta_4. Deciding the condition for n ≥ 3 needs equality in B_{n-1}(F), for which no algorithm is known, so a claimed element must carry a proof of its condition.

**Hypotheses.**

- F is a field; n is at least two; y lies in B_n(F).

**Construction.**

1. Define the condition as the vanishing of delta_n.
2. Identify the set of such elements with H^1 of the weight-n complex (P.4/general-polylog-complex).
3. Prove that the condition is preserved by the maps induced by field homomorphisms.
4. Record that Zagier's original formulation uses subgroups beta_n(F), defined for number fields only; they are not compared here (Zagier 1990 not obtained).

**API.**

- `ConditionStar` (characterisation): The predicate deltaMap n y = 0 on B_n(F).
- `conditionStar_iff_H1` (characterisation): It holds exactly for the elements of H^1 B(F; n).
- `conditionStar_subspace` (structure): The elements satisfying it form the subspace Ker delta_n.
- `conditionStar_map` (functoriality): It is preserved by the maps induced by field homomorphisms.

**Unit tests.**

- `fails_over_Q` (computation): {3}_2 in B_2(Q) fails *_2: delta_2{3}_2 = 2 wedge 3 ≠ 0.
- `one_three` (computation): {1}_3 satisfies *_3: delta_3{1}_3 = {1}_2 tensor 1 = 0.
- `weight_two_compat` (compatibility): *_2 holds iff y lies in Ker delta_2 = B(F) tensor Q.
- `subspace` (characterisation): The elements satisfying *_n form a Q-subspace.

**Acceptance.**

- At weight two the condition is membership in Ker delta_2 = B(F) tensor Q.
- The elements satisfying the condition form a subspace.
- {3}_2 in B_2(Q) does not satisfy the condition, so it is a real restriction.

**Used by.**

- P.4's Zagier statement: the elements of the determinant are required to satisfy it
- GR Theorem 1.1: the weight-four elements satisfy *_4

**Depends on.** this roadmap: `P.4/higher-bloch-group`, `P.4/delta-map`, `P.4/general-polylog-complex`.

**Used in this roadmap by.** `P.4/zagier-determinant`, `P.4/zagier-statement`, `P.4/weight-four-theorem`, `P.4/rational-existence`, `P.4/regulator-comparison`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/HigherBloch`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, 1.1, item 5 and footnote 7 (PDF p. 5): “The condition *_n. It simply says that delta y = 0 for an element y in B_n(F), i.e., y in H^1 B(F; n). ... Zagier's conjecture in its original formulation does not use groups B_n(F); it uses subgroups beta_n(F), defined for number fields only.” — The condition and the caveat about the original formulation; the asterisk was checked on the page image.

### The Zagier regulator determinant

`P.4/zagier-determinant` · construction · first packet

Let F be a number field, n ≥ 2, sigma_1, ..., sigma_{r_1} the real embeddings and sigma_{r_1+1}, ..., sigma_{r_1+r_2} one from each conjugate pair. Put d_n = r_1 + r_2 and I_n = {1, ..., r_1 + r_2} for n odd, and d_n = r_2 and I_n = {r_1 + 1, ..., r_1 + r_2} for n even. For y in B_n(F)^{d_n}, Z_n(y) := π^{n r_2} |d_F|^{-1/2} det(L_n(sigma_i(y_j)))_{i in I_n, j ≤ d_n} for n odd and π^{n(r_1+r_2)} |d_F|^{-1/2} det(...) for n even, with L_n the map of P.4/polylog-on-higher-bloch and the empty determinant equal to 1. The weight-four normalisation is the one GR display; the general-weight one is derived from the functional equation and Borel's theorem and checked on Q and Q(i) (gap: Zagier 1990 not obtained). The condition *_n is not needed to define Z_n.

**Hypotheses.**

- F is a number field; n ≥ 2.

**Construction.**

1. Order the embeddings as the source does, with conjugate embeddings paired.
2. Define the matrix entry at sigma_i and y_j as L_n(sigma_i(y_j)).
3. Define the determinant and the normalising factor, depending on the parity of n.
4. Prove that reordering changes the determinant by a sign, that it vanishes on a linearly dependent family, and that for n even a row at a real place would vanish, which is why real places are excluded.
5. Prove that in weight two Z_2 is π^{2(r_1+r_2)} |d_F|^{-1/2} times the determinant of P.2 on the image of B(F) tensor Q (P.4/explicit-to-inductive-comparison).

**API.**

- `zagierIndex` (data): The index set I_n and the size d_n, depending on the parity of n.
- `zagierMatrix` (constructor): The matrix (L_n(sigma_i(y_j)))_{i in I_n, j ≤ d_n}.
- `zagierDet` (constructor): Z_n(y), the normalised determinant.
- `zagierDet_dependent` (characterisation): Z_n vanishes on a linearly dependent family.
- `zagierDet_two` (compatibility): In weight two it is the normalised determinant of the weight-two regulator.
- `zagierDet_sign` (relation): Reordering the family or the places changes Z_n by a sign.

**Unit tests.**

- `Q_weight_three` (computation): F = Q, n = 3, y = ({1}_3): Z_3 = L_3(1) = ζ(3) = zeta_Q(3).
- `Qi_weight_two` (computation): F = Q(i), y = ({i}_2): Z_2 = π^2 (1/2) D(i) = π^2 G/2 = 3 zeta_{Q(i)}(2).
- `Qi_weight_three` (computation): F = Q(i), y = ({1}_3): Z_3 = π^3 (1/2) ζ(3) = 16 zeta_{Q(i)}(3), since zeta_{Q(i)}(3) = ζ(3) π^3/32.
- `Q_weight_four_empty` (degenerate): F = Q, n = 4: d_4 = 0 and Z_4 = π^4 = 90 ζ(4).
- `real_rows_vanish` (non-example): For n even, L_n(sigma(x)) = 0 at a real sigma, so a matrix indexed by all places would be singular.
- `dependent_vanishes` (characterisation): Z_n(y, y, ...) = 0 whenever two entries of the family coincide.

**Acceptance.**

- In weight two the construction is the normalised determinant of the weight-two regulator of P.2.
- The determinant vanishes on a dependent family.
- F = Q, n = 3, y = ({1}_3): Z_3 = L_3(1) = ζ(3); a factor π^{3(r_1+r_2)} would give π^3 ζ(3), not a rational multiple of ζ(3).

**Used by.**

- P.4's statement of Zagier's conjecture: the conjecture is an identity between this determinant and a zeta value
- P.3's weight-three theorem: the weight-three statement restates the odd-weight case of this normalisation
- SpecialValuesBirchTate B.8: imports this determinant (restructure entry: P.4 owns it)

**Depends on.** this roadmap: `P.4/condition-o-n`, `P.4/polylog-on-higher-bloch`, `P.4/explicit-to-inductive-comparison`, `P.1/single-valued-polylogarithm`, `P.2/weight-two-regulator`; libraries: `mathlib:NumberField.InfinitePlace`, `mathlib:NumberField.InfinitePlace.embedding`, `mathlib:NumberField.ComplexEmbedding.conjugate`, `mathlib:NumberField.discr`, `mathlib:Matrix.det`.

**Used in this roadmap by.** `P.4/zagier-statement`, `P.4/weight-four-theorem`, `P.4/rational-existence`, `P.4/period-calibration`, `P.4/weight-four-regulator-input`, `P.4/weight-four-totally-real`.

**Library.** module `TauCeti/NumberTheory/Polylogarithmic/HigherBloch`, namespace `TauCeti.Polylog`.

**Sources.**

- `GR.2022`, Theorem 1.2 (PDF p. 5): “Then there exist elements y_1, ..., y_{r_2} in Ker delta_4 in B_4(F) such that zeta_F(4) = pi^{4(r_1+r_2)} |d_F|^{-1/2} det(L_4(sigma_{r_1+i}(y_j))), 1 <= i, j <= r_2.” — The determinant and its normalisation, as displayed in weight four.

**Assembly note.** The general-weight normalisation, recorded here as a gap on Zagier 1990, is audited by the P.4 part, which read Zagier 1990: `P.4/period-calibration` derives the exponent e = n(N − d_n) from BorelRegulators R.5's covolume, conditional on a regulator-compatible comparison. For ℚ(i), e = n in both parities. For a totally real field in weight four the empty determinant is a nonzero rational multiple of ζ_F(4), not equal to it (`P.4/weight-four-totally-real`).

### The weight-four case is a theorem

`P.4/weight-four-theorem` · theorem · planet “Zagier's conjecture on ζ_F(4)” · first packet

Let F be a number field with [F : Q] = r_1 + 2 r_2, embeddings numbered so that conj(sigma_{r_1+i}) = sigma_{r_1+r_2+i}, and discriminant d_F. (a) If r_2 ≥ 1 there exist y_1, ..., y_{r_2} in Ker delta_4 in B_4(F) with ζ_F(4) = π^{4(r_1+r_2)} |d_F|^{-1/2} det(L_4(sigma_{r_1+i}(y_j)))_{1≤i,j≤r_2}; if r_2 = 0 the statement is ζ_F(4) in ℚ^× π^{4 r_1} |d_F|^{-1/2} (source issue Polylogarithms/E2: as printed, the case r_2 = 0 reads ζ_F(4) = π^{4 r_1} |d_F|^{-1/2}, false for F = Q). (b) For any y_1, ..., y_{r_2} in Ker delta_4 the right-hand side equals q ζ_F(4) for some q in Q. This is Goncharov and Rudenko's theorem (GR Theorem 1.2), not a conjecture. The paper proves it with the complex (44), which uses the explicit B_4(F) in L_4(F) and the 22-term group B_3(F); for Ker delta_4 computed with the inductive B_3(F), part (b) needs an argument the sections read do not contain (gap).

**Hypotheses.**

- F is a number field.

**Proof.**

1. State the theorem in the source's form, with the displayed normalisation and the correction for r_2 = 0.
2. Existence (a): from GR Theorem 1.3(iv) (the composite K_7(C)_Q → H^1 B(C; 4) → R is a nonzero rational multiple of the Borel regulator) and Borel's theorem (BorelRegulators R.5), as GR v5 p. 7 and Section 9.3 say.
3. Part (b): the source's argument was not located in the sections read (gap).
4. Record that this packet states the theorem and builds its statement infrastructure but does not plan its proof; the restructure entry names the Part II that would.
5. The further consequence, the extension describing L_4(F), is P.4/freeness-extension.

**Acceptance.**

- F = Q(i), y_1 = {i}_4 (delta_4{i}_4 = {i}_3 tensor i = 0, since i is torsion): π^4 (1/2) L_4(i) = π^4 beta(4)/2 = 45 zeta_{Q(i)}(4), because zeta_{Q(i)}(4) = ζ(4) beta(4) = π^4 beta(4)/90.
- It is a theorem: the restructure entry exists because no roadmap owns its proof.
- The proof is not a consequence of the weight-three construction.

**Depends on.** this roadmap: `P.4/zagier-determinant`, `P.4/condition-o-n`, `P.4/polylog-on-higher-bloch`; stages: `BorelRegulators:R.5`; libraries: `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.discr`.

**Used in this roadmap by.** `P.4/zagier-statement`.

**Sources.**

- `GR.2026`, Theorem 1.2 (PDF p. 5): “Let F be a number field, [F : Q] = r1 + 2r2, and the set {sigma_j} of all embeddings F -> C is numbered so that conj(sigma_{r1+i}) = sigma_{r1+r2+i}. Let dF be the discriminant of F. Then there exist elements y1, ..., yr2 in Ker delta4 in B4(F) such that” — The theorem, in the version of record.
- `GR.2026`, after Theorem 1.3 (PDF p. 7): “Theorem 1.2 follows from the part (iv) of Theorem 1.3 and Borel's theorem [Bor77].” — The architecture of the proof.
- `GR.2022`, Abstract (PDF p. 2): “We prove Zagier's conjecture on the value at s = 4 of the Dedekind zeta-function of a number field F: zeta_F(4) = pi^{4(r_1+r_2)} |d_F|^{-1/2} det(L_4(sigma_i(y_j))), 1 <= i, j <= r_2.” — The theorem as stated in the abstract.

**Assembly note.** The theorem keeps its status. Its proof interface is the explicit complex `P.4/explicit-weight-four-complex` with `P.4/weight-four-regulator-input`. Part (b) for cycles of the inductive Ker δ_4 follows when the lifting obstruction `P.4/cycle-obstruction` vanishes on them, or when their periods lie in the calibrated K_7 regulator image (`P.4/weight-four-determinant-lifting`); neither is proved (the P.4 part's gap 3). The case r_2 = 0 is `P.4/weight-four-totally-real`. The explicit and inductive B_3 are not asserted isomorphic.

### Zagier's statement, in three separate propositions

`P.4/zagier-statement` · theorem · planet “Zagier's conjecture” · first packet

For a number field F and n ≥ 2 (with d_n, I_n and Z_n as in P.4/zagier-determinant), three separate propositions: (Z1) there exist y_1, ..., y_{d_n} in Ker delta_n in B_n(F) with Z_n(y) ≠ 0 (equivalently, when d_n ≥ 1, Z_n(y) = ζ_F(n) after rescaling y_1); (Z2) H^1 B(F; n) = Ker delta_n is isomorphic to gr^n_gamma K_{2n-1}(F)_Q (P.4/goncharov-comparison-conjecture at i = 1); (Z3) for all y_1, ..., y_{d_n} in Ker delta_n, Z_n(y) = q ζ_F(n) with q in Q, where q = 0 is allowed. These are different propositions and are never collapsed into one.

**Hypotheses.**

- F is a number field; n is at least two.

**Proof.**

1. State (Z1) with the condition *_n and nonvanishing of the determinant.
2. State (Z2), the case i = 1 of Goncharov's conjecture.
3. State (Z3), the numerical identity for every family.
4. Record the proved cases: n = 2, (Z1) and (Z3) by Zagier (1986) with Suslin and Borel, and (Z2) by Suslin through P.4/explicit-to-inductive-comparison; n = 3, (Z1) by Goncharov (1991, 1995) as reported by GR (P.3/weight-three-special-value), with (Z2) and (Z3) not established by any source read; n = 4, (Z1) and (Z3) are GR Theorem 1.2 (P.4/weight-four-theorem), and (Z2) is GR Conjecture 1.4; n ≥ 5, all three conjectural.
5. Record what a conjectural equality may not be used for: it cannot supply a constructor of Bloch elements.

**Acceptance.**

- (Z3) allows q = 0: for a dependent family the determinant vanishes, so 'a nonzero rational multiple' would be false.
- In weight four (Z2) is GR's Conjecture 1.4, not a theorem; only injectivity of K_7(F)_Q → H^1 for number fields is proved there.
- For general n the second proposition is a conjecture in the source and is labelled as one here.

**Depends on.** this roadmap: `P.4/zagier-determinant`, `P.4/condition-o-n`, `P.4/goncharov-comparison-conjecture`, `P.4/weight-four-theorem`, `P.3/weight-three-special-value`; libraries: `mathlib:NumberField.dedekindZeta`.

**Used in this roadmap by.** `P.4/assertion-logic`.

**Sources.**

- `GR.2022`, Theorem 1.1 and item 6 (PDF pp. 3, 5): “Then there exist elements y_1, ..., y_{r_2} in Q[F] satisfying a certain condition *_4 ... For any y_1, ..., y_{r_2} satisfying *_4 the right-hand side of (2) is equal to q times zeta_F(4) for some q in Q.” — The two halves the source separates, existence and the identity for every family (with q in Q, not necessarily nonzero); the comparison is the conjecture of item 6.
- `GR.2022`, 1.1, item 2 (PDF p. 3): “Similar results about zeta_F(2) and zeta_F(3) were proved in [Zag86] and [Gon91], [Gon95], respectively.” — The proved weights two and three, as attributed.

**Assembly note.** Rank-only (Z1) does not by itself give Z_n(y) = ζ_F(n) after rescaling y_1: the parenthesis 'equivalently, when d_n ≥ 1, …' needs a rational ratio. Use `P.4/rational-existence` (a nonzero rational factor), or (Z1) with (Z3), as `P.4/assertion-logic` proves. The empty determinant, d_n = 0, is a separate case.

### The weight-four part of the motivic Lie coalgebra

`P.4/freeness-extension` · comparison · first packet

(a) Prediction (GR v5 (17), p. 8): assuming the category of mixed Tate motives of Beilinson's conjectures (GR Conjectures 1.5 to 1.7), there is an exact sequence 0 → B_4(F) → L_4(F) → Lambda^2 B_2(F) → 0 for the motivic Lie coalgebra. (b) Theorem (GR Theorem 1.14(c)): for the combinatorially defined Lie coalgebra, 0 → B_4(F) → L_4(F) → Lambda^2 L_2(F) → 0 is exact and functorial in F, with B_4(F) the span of the {x}_4 and the projection the (2,2)-component of the cobracket; the map from this B_4(F) to the inductive B_4(F) is conjecturally an isomorphism (GR v5 p. 12). The proof of (b) (GR Sections 4 to 6) belongs to the proposed Part II; no node here uses (a) or (b).

**Hypotheses.**

- F is a field.

**Proof.**

1. State (a) as the prediction it is, with its hypotheses.
2. State (b) as GR's theorem, with the combinatorial L_4 and B_4.
3. Record that nothing in this packet depends on either.

**Acceptance.**

- (a) is recorded as a prediction and not used as a hypothesis.
- In weight two the combinatorial L_2 equals B_2 by definition, while the motivic L_2 = B_2 is a prediction.
- No node of this packet has this node as a prerequisite.

**Depends on.** this roadmap: `P.4/higher-bloch-group`.

**Used in this roadmap by.** `P.4/explicit-weight-four-complex`.

**Sources.**

- `GR.2022`, Abstract (PDF p. 2): “We get a strong evidence for the part of Freeness Conjecture describing the weight four part L_4(F) of the motivic Lie coalgebra of F via higher Bloch groups as an extension: 0 -> B_4(F) -> L_4(F) -> Lambda^2 B_2(F) -> 0.” — The extension and its status, as displayed.
- `GR.2026`, Theorem 1.14(c) (PDF p. 16): “c) There is a short exact sequence of Q-vector space, functorial in F: 0 -> B4(F) -> L4(F) -> Lambda^2 L2(F) -> 0. (43) Here the map i is the natural embedding from Definition 1.11.” — The proved extension.

### Specialization preserves rational-curve relations

`P.4/relation-specialization-induction` · theorem · P.4 part

For an infinite field F, use exactly the simultaneous rational-curve recursion of the parent higher-bloch-group, not the all-smooth-curve quotient of Gon95. At a rational point a of P¹_F, projective specialization sp_a sends a rational function with a pole to the zero ∞ symbol. For every n≥2, sp_a(R_n(F(t)))⊆R_n(F). Choose π=t−a for a∈F and π=1/t at ∞. With u_π(g)=the residue of gπ^(−ord_a g), (sp_a⊗u_π)δ_n=δ_n sp_a for n≥3, and Λ²u_π δ₂=δ₂ sp_a. Hence sp_a(ker δ_n)⊆ker δ_n and δ_n(R_n(F))=0. The assertion is a joint induction over weights and fields; the unresolved degeneration step is recorded in the specialization gap.

**Hypotheses.**

- F is infinite; n≥2; a∈P¹(F); the relation spaces are the simultaneous rational-curve recursion of the accepted parent.

**Proof.**

1. At weight two compare each generator in the cases ord f>0, ord f<0, ord f=0 with residue f=1, and ordinary unit residue. In the pole case u(1−f)=−u(f), so their rational unit classes have equal image and the wedge vanishes.
2. For higher weights use the lower-weight relation-preserving specialization and the multiplicative angular component, not a map that kills nonunit tensor factors. The same four cases make the boundary square commute.
3. A relation over F(t) has a witness α(s) in ker δ_n over F(t)(s). Specializing t must produce a relation over F, including collisions, poles and bad fibres. Prove this by a two-variable degeneration/moving argument in the rational-curve model. Gon95 Lemma 1.16 instead uses smooth curves and a non-bilinear printed tensor rule; neither automatically supplies this step.
4. After that step, specialize a kernel witness at 0 and 1, subtract, and use the square to show the defining relation is killed by δ_n. This proves the descended parent δ_n without assuming its conclusion in the induction.

**Acceptance.**

- At f=t−a and f=(t−a)⁻¹ the specialized higher symbol is zero, while the unit angular component is generally nonzero.
- For f=1+(t−a), specialization of the symbol is {1}_n, not automatically zero at odd weight; its boundary still vanishes.
- No assertion identifies the rational-curve quotient with the all-smooth-curve quotient for every field.

**Depends on.** this roadmap: `P.4/higher-bloch-group`; libraries: `mathlib:Submodule.liftQ`.

**Used in this roadmap by.** `P.4/complex-specialization`, `P.4/cycle-constancy`, `P.4/suslin-rigidity-adapter`, `P.4/weight-four-residue-map`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `G94`, §1.4, Definition 1.10 and Lemma 1.11, manuscript p. 6: “Lemma 1.11” — Rational-curve model and the boundary-vanishing target; proof referred to G95.
- `G95`, §1.9, Lemma 1.16 and its proof, published pp. 221–222: “LEMMA 1.16.” — The specialization proof being refined, with its model difference and printed tensor defect retained explicitly.

### Specialization of polylogarithmic complexes

`P.4/complex-specialization` · construction · P.4 part

Given the relation-preserving symbol maps of relation-specialization-induction, the parent Γ(F,n) has a degree-preserving specialization S_(a,n):Γ(F(t),n)→Γ(F,n). Choose π=t−a at a finite point and π=1/t at ∞. In degree i<n it is sp_a on B_(n−i+1) tensored with Λ^(i−1)u_π; in degree n it is Λ^n u_π. This is a chain map, restricts to the identity on constant classes, and is natural under field embeddings preserving a and the chosen parameter. Its unit/exterior components depend on the uniformizer; the assertion does not claim a canonical uniformizer-free map on every degree.

**Hypotheses.**

- The preceding relation-preserving specialization is available; the chosen rational point and uniformizer are fixed.

**Construction.**

1. Use TensorProduct.map and exteriorPower.map degreewise, and the preceding boundary square on symbol generators.
2. For the remaining differentials use naturality of exterior insertion; both sides send {f}_k⊗Y to sp{f}_(k−1)⊗(u(f)∧Λu(Y)).
3. The maps on constants are identities; extend by linearity and quotient extensionality.

**API.**

- `TauCeti.Polylog.WeightFour.specializeTerm` (constructor): For sp:B→ₗ B′ and u:U→ₗ U′, specializeTerm_j=sp⊗Λ^j u.
- `TauCeti.Polylog.WeightFour.specializeTerm_tmul` (simp): specializeTerm_j(b⊗Y)=sp(b)⊗Λ^j u(Y).
- `TauCeti.Polylog.WeightFour.specializeLast` (constructor): The terminal specialization is Λ^n u.
- `TauCeti.Polylog.WeightFour.specializeTerm_comp` (functoriality): Composing two specialization pairs agrees with specialization for their composite maps.
- `TauCeti.Polylog.WeightFour.specializeTerm_id` (functoriality): Identity symbol and unit maps give the identity on B⊗Λ^j U.
- `TauCeti.Polylog.WeightFour.specializeLast_wedge` (simp): specializeLast_n(u₁∧…∧u_n)=u(u₁)∧…∧u(u_n).

**Unit tests.**

- `TauCeti.Polylog.WeightFour.specialize_unit_product` (compatibility): At t=0, specializing {1}_3⊗(t·(2/t)) gives {1}_3⊗u(2), equal to the sum of the correctly specialized tensor factors {1}_3⊗t and {1}_3⊗(2/t).
- `TauCeti.Polylog.WeightFour.specialize_uniformizer` (computation): For parameter t, u_t(t)=0 in the additive rational unit space, hence specializeTerm_1(b⊗u(t))=0 for every b.
- `TauCeti.Polylog.WeightFour.specialize_constant_tensor` (compatibility): Identity maps on constant classes send b⊗(u₁∧u₂) to the same native pure tensor.
- `TauCeti.Polylog.WeightFour.specialize_pole_symbol` (degenerate): If sp(b)=0, specializeTerm_j(b⊗Y)=0, even when Λ^j u(Y) is nonzero.

**Acceptance.**

- The tensor component uses a group homomorphism on all nonzero rational functions.
- At degree one the map agrees with the parent symbol specialization.

**Used by.**

- G94 Lemma 1.11; parent P.4/delta-map: Descends boundaries and specializes kernel witnesses.
- P.4/weight-four-residue-map and P.3 conditional-complex-transfer: Specializes the Bloch factor separately from the exterior residue.

**Depends on.** this roadmap: `P.4/general-polylog-complex`, `P.4/relation-specialization-induction`; libraries: `mathlib:TensorProduct.map`, `mathlib:exteriorPower.map`, `mathlib:CochainComplex.ofHom`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `G94`, §1.4 and §2.1, pp. 6, 10–11: “δn” — Combines the specified specialization with the explicit differentials of the general complex.
- `G95`, Lemma 1.16 proof, p. 222: “homomorphism” — The tensor correction is necessary for this construction.

### Polylogarithmic evaluation of rational families

`P.4/cycle-evaluation` · construction · P.4 part

For n≥2 and α=Σ_f q_f[f]∈Q[C(t)], define E_n(α,a)=Σ_f q_f L_n(f(a)), with f(a) evaluated on P¹(C) and L_n(∞)=0. This is a Q-linear map from raw finite sums to functions C→R. It agrees with ordinary rational evaluation where there are no poles, extends continuously across the finite union of poles by projective evaluation, and is a constant function when α is a boundary cycle (cycle-constancy). It is not a new definition of L_n or B_n.

**Hypotheses.**

- n≥2; L_n is the imported single-valued scalar with its continuous projective endpoint extension; α is a finite rational symbol sum.

**Construction.**

1. Extend f↦(a↦L_n(f(a))) by Finsupp.linearCombination.
2. For a pole, the rational map tends to ∞ on the projective line, where the imported L_n has value zero. Constant rational functions equal to 0 or 1 are evaluated using the imported endpoint values.
3. Take a finite sum of the continuous composite functions; differentiate only off the finite bad set.

**API.**

- `TauCeti.Polylog.WeightFour.cycleEvaluation` (constructor): E_n(α) is the Q-linear finite-sum evaluation function.
- `TauCeti.Polylog.WeightFour.cycleEvaluation_single` (simp): E_n(q[f],a)=q L_n(f(a)), with projective evaluation.
- `TauCeti.Polylog.WeightFour.cycleEvaluation_add` (simp): E_n(α+β,a)=E_n(α,a)+E_n(β,a).
- `TauCeti.Polylog.WeightFour.cycleEvaluation_smul` (simp): E_n(qα,a)=q E_n(α,a).
- `TauCeti.Polylog.WeightFour.cycleEvaluation_specialize` (compatibility): E_n(α,a)=the finite-sum L_n evaluation of sp_a α.
- `TauCeti.Polylog.WeightFour.cycleEvaluation_constant` (simp): A constant rational symbol c gives the constant function L_n(c).

**Unit tests.**

- `TauCeti.Polylog.WeightFour.evaluation_pole` (computation): At t=0 the family [1/t] evaluates to L_n(∞)=0.
- `TauCeti.Polylog.WeightFour.evaluation_odd_one` (computation): At weight three the constant family [1] evaluates to ζ(3), which is nonzero.
- `TauCeti.Polylog.WeightFour.evaluation_even_one` (degenerate): At weight four the constant family [1] evaluates to zero.
- `TauCeti.Polylog.WeightFour.evaluation_cancellation` (compatibility): The family [f]+[g]−[f] evaluates to L_n(g(a)), including at a common pole.

**Acceptance.**

- A rational-function pole contributes zero rather than an arbitrary residue.
- The construction is linear over Q, not claimed R-linear on the symbol group.

**Used by.**

- G94 Theorem-motivation 1.15; G95 Corollary 1.19: Turns an algebraic kernel witness into a constant analytic function and kills its endpoint difference.
- P.4/zagier-determinant: Ensures that evaluating a representative of a Bloch class is independent of its relation witness.

**Depends on.** this roadmap: `P.1/single-valued-polylogarithm`, `P.1/single-valued-continuity`; libraries: `mathlib:Finsupp.linearCombination`.

**Used in this roadmap by.** `P.4/cycle-constancy`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `G94`, Theorem-motivation 1.15 and proof, pp. 7–9: “constant” — The varying-point sum that the analytic descent proof makes constant.

### Constancy of higher polylogarithmic cycles

`P.4/cycle-constancy` · theorem · planet “Higher polylogarithmic functional relations” · P.4 part

For n≥2, α∈ker δ_n⊂Q[C(t)] and all a,b∈P¹(C), E_n(α,a)=E_n(α,b), using the same projective endpoint convention as cycle-evaluation. Consequently L_n kills each generator sp_1α−sp_0α of R_n(C) and the zero symbol; the unique quotient lift is exactly parent polylog-on-higher-bloch. This establishes analytic descent, not a converse classification of all functional identities.

**Hypotheses.**

- n≥2; α is a raw δ_n-cycle over C(t); use the imported analytic L_n and the lower-weight relation/quotient maps.

**Proof.**

1. For n=2 use dL₂(f)=−log|1−f|darg f+log|f|darg(1−f). This factors through δ₂ by r₂(f∧g)=−log|f|darg g+log|g|darg f.
2. For n≥3 put L̂_n=L_n for odd n and iL_n for even n and β_k=2^k B_k/k!. Off 0,1,∞, dL̂_n(z)=L̂_(n−1)(z)i darg z−Σ_(k=2)^(n−2)β_k log^(k−1)|z| L̂_(n−k)(z)dlog|z|−β_(n−1)log^(n−2)|z|[log|z|dlog|1−z|−log|1−z|dlog|z|]. Derive this from the imported Li derivative and Bernoulli coefficient identities. The final coefficient is β_(n−1) and its exponent is n−2, correcting both the coefficient index and exponent in G95 (1.28c).
3. Factor the first term through B_(n−1) using induction. Factor each log-power term through repeated lower δ maps and the symmetric multilinear product of log|·|; the last term factors through δ₂, r₂ and the remaining logarithms. These factors give the well-defined r_n of G94 p. 9 with dÊ_n=r_n δ_n.
4. Since δ_nα=0, the derivative vanishes off a finite bad set. The punctured complex sphere is connected; the finite-sum evaluation is therefore constant there. Imported projective continuity extends that same constant to every missing point, including 0,1,∞.
5. Kill the span of defining relations and use the native quotient universal property. Higher real Deligne complexes and current maps stay with P.5/M.8; no such complex is required for this scalar constancy proof.

**Acceptance.**

- The derivative assertion excludes the bad points; only the final equality is global.
- At n=3 and real x=1/2 the derivative is 4(log 2)²/3. The literal printed (1.28c) instead gives zero because β₃=0; correcting only its coefficient index would still give −4(log 2)³/3, detecting the independent exponent error.
- The quotient lift composes with the quotient map to the original finite-sum L_n evaluation and is unique.

**Depends on.** this roadmap: `P.4/cycle-evaluation`, `P.4/relation-specialization-induction`, `P.1/classical-polylogarithm`, `P.1/bloch-wigner-differential`, `P.1/single-valued-continuity`; libraries: `mathlib:Submodule.liftQ`.

**Used in this roadmap by.** `P.4/higher-symbol-inversion`, `P.4/weight-four-regulator-input`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `G94`, Theorem-motivation 1.15, (14), and r_n factorization, pp. 7–9: “Theorem-motivation 1.15” — Full differential/factorization/continuity descent proof.
- `G95`, Proposition 1.18 and Corollary 1.19, pp. 223–224: “COROLLARY 1.19.” — Published descent statement; its unified derivative display has the recorded coefficient-index and exponent misprints.

### Higher Bloch inversion and endpoint classes

`P.4/higher-symbol-inversion` · theorem · P.4 part

For n≥2, an infinite field F and x∈F×, {x}_n+(−1)^n{x⁻¹}_n=0 in the parent inductive B_n(F). Thus {1}_(2m)=0 rationally. For odd n≥3, {1}_n is a cycle and its image in B_n(C) is nonzero because L_n(1)=ζ(n)≠0. Endpoint conventions do not set {1}_n to zero in every weight.

**Hypotheses.**

- F is infinite; n≥2; x∈F×; odd endpoint nonvanishing is over C and uses analytic descent.

**Proof.**

1. Induct on n. At weight two compute δ₂({t}+{t⁻¹})=0 after rationalization because the class of −1 is torsion.
2. At the induction step the two lower symbols become equal up to the parity sign and u(t⁻¹)=−u(t), so the raw relation has zero boundary. Its specialization at ∞ is zero, and reparametrize to compare with x.
3. Put x=1 in even weight; rational coefficients cancel 2. For odd weight use the analytically descended map once cycle-constancy is established.

**Acceptance.**

- At weight three inversion is {x}_3={x⁻¹}_3; at weight four it is {x}_4=−{x⁻¹}_4.
- The nonvanishing conclusion over C is contingent on the descended analytic map, rather than used to construct that map.

**Depends on.** this roadmap: `P.4/higher-bloch-group`, `P.1/single-valued-continuity`, `P.4/cycle-constancy`.

**Used in this roadmap by.** `P.4/suslin-rigidity-adapter`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `G94`, Example 1.13, p. 7; Example 1.18, p. 10: “Example 1.13” — Inductive inversion argument and odd endpoint detected by ζ.

### Suslin rigidity in the weight-two presentation

`P.4/suslin-rigidity-adapter` · comparison · P.4 part

For an infinite field F, import the natural isomorphism B_Sus(F)→B_Sus(F(t)) of Suslin Corollary 5.6 and its specialization retractions. After tensoring with Q, every raw δ₂-cycle over F(t) gives a class in B_Sus(F(t))_Q whose specializations at 0 and 1 agree. Thus its difference is zero in the rational five-term pre-Bloch group. Conversely a five-term relation is obtained by varying a generic P¹ configuration through a rational parameter and specializing a zero-boundary witness, with degenerations justified by the rational inversion and endpoint relations. These are the two kernel containments needed by parent explicit-to-inductive-comparison at weight two, with δ₂ the negative of V.3’s boundary after the antisymmetric-to-exterior adapter.

**Hypotheses.**

- F is infinite; use the rational five-term presentation and the requested V.4 rigidity and compatible specialization retractions.

**Proof.**

1. Use the requested V.4 rational-function invariance, not the unrelated general constant-field rigidity conjecture of Gon95 Proposition 1.22.
2. Convert δ₂=0 into membership of the Suslin Bloch kernel using the rational sign/exterior adapter. Constants map isomorphically to that kernel over F(t), so both specialization retractions give the same constant class.
3. For the reverse containment, take the five-term expression in one variable with the other fixed: its boundary is zero by expansion, and specialize at a point where the expression degenerates to inversion/zero-symbol terms. A field embedding or generic auxiliary parameter handles exceptional choices over an infinite F.
4. Conclude equality of rational relation spaces, hence the parent isomorphism; the proof does not extend the all-smooth-curve quotient comparison to arbitrary fields.

**Acceptance.**

- The supplier statement is B(F(t))≃B(F); the word rationally in Suslin means rational-function invariance, not simply rational coefficients.
- Finite fields are outside this comparison’s hypotheses.
- The parent δ₂ sign relative to V.3 is retained.

**Depends on.** this roadmap: `P.4/higher-bloch-group`, `P.4/higher-symbol-inversion`, `P.4/relation-specialization-induction`; other roadmaps: `K3BlochGroups:V.3/pre-bloch-group`, `K3BlochGroups:V.3/bloch-boundary`, `K3BlochGroups:V.3/antisym-exterior-comparison`; stages: `K3BlochGroups:V.4`.

**Used in this roadmap by.** `P.4/presentation-chain-map`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `S91`, Corollary 5.6 and Remark 5.1, English translation p. 237; discussion p. 238: “rationally invariant” — Original rigidity statement and specialization discussion read.
- `GR5`, §1.2 p. 9, footnote 2: “Corollary 5.6” — Explicit identification of this precise input in the B₂ comparison.

### Rational existence in Zagier’s conjecture

`P.4/rational-existence` · definition · P.4 part

Refine the parent rank-only assertion without redefining its determinant: for F a number field and n≥2, RationalZagierExistence(F,n) means there exist d_n parent δ_n-cycles y and q∈Q× such that Z_n(y)=q ζ_F(n). Its field-free signature uses a Q-vector space M of actual cycles, a Q-linear period map p:M→R^d, a nonzero real normalization c and ζ≠0, with Z(y)=c det(p(y_j)). It includes the rational nonzero factor. If d>0 this is equivalent to the existence of y with Z(y)=ζ, by rationally scaling one column; at d=0 it means c/ζ∈Q× and does not force c=ζ.

**Hypotheses.**

- F is a number field; n≥2; the field-free prototype takes a Q-vector space of actual cycles, a specified linear period map and the actual real normalization and zeta value.

**Construction.**

1. Use the imported actual kernel and determinant, and quantify q∈Q with q≠0.
2. For positive d select a column and multiply it by q⁻¹; determinant multilinearity changes Z by q⁻¹.
3. At d=0 use the native empty determinant 1 and preserve c.

**API.**

- `TauCeti.Polylog.WeightFour.rationalExistence` (constructor): The concrete predicate ∃y,q∈Q, q≠0 and c det(p(y_j))=qζ.
- `TauCeti.Polylog.WeightFour.rationalExistence_of_witness` (constructor): A displayed family and nonzero rational factor establish the predicate.
- `TauCeti.Polylog.WeightFour.rationalExistence_nonzero` (projection): When ζ≠0, obtain a family with c det(p(y_j))≠0.
- `TauCeti.Polylog.WeightFour.rationalExistence_normalize` (equivalence): When d>0, rationalExistence iff ∃y,c det(p(y_j))=ζ.
- `TauCeti.Polylog.WeightFour.rationalExistence_empty` (characterisation): At d=0, rationalExistence iff ∃q∈Q×,c=qζ.
- `TauCeti.Polylog.WeightFour.rationalExistence_transport` (functoriality): A Q-linear equivalence M≃M′ transporting p preserves the predicate.

**Unit tests.**

- `TauCeti.Polylog.WeightFour.existence_empty_rational` (computation): For d=0,c=90,ζ=1, rationalExistence is true although the empty normalized determinant is 90, not 1.
- `TauCeti.Polylog.WeightFour.existence_zero_factor` (non-example): For d=1,p=0,c=1,ζ=1 the predicate is false, although the every-family identity holds with q=0.
- `TauCeti.Polylog.WeightFour.existence_rank_one` (computation): For M=Q,d=1,p(x)=x,c=2,ζ=1, the family y=1/2 establishes exact normalized equality.
- `TauCeti.Polylog.WeightFour.existence_transport_test` (compatibility): Replacing p by p∘e⁻¹ along a Q-linear equivalence leaves rationalExistence unchanged.

**Acceptance.**

- A nonzero determinant alone is not the definition.
- The zero rational factor is excluded here and allowed in the parent every-family identity.

**Used by.**

- Z90 main numerical assertion and GR5 Theorem 1.2(a): Captures the required nonzero rational proportionality and licenses rational rescaling.
- SpecialValuesBirchTate B.8 and parent P.4/zagier-statement: Separates determinant rank from a special-value identity.

**Depends on.** this roadmap: `P.4/zagier-determinant`, `P.4/condition-o-n`; libraries: `mathlib:Matrix.det`, `mathlib:Matrix.det_mul`.

**Used in this roadmap by.** `P.4/assertion-logic`, `P.4/weight-four-determinant-lifting`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `Z90`, Introduction, regulator/period paragraph following (3), p. 393; §8 final Main Conjecture, p. 417: “rational multiple” — The numerical rational proportionality and its distinction from K-theoretic comparison.
- `G94`, §2.3 Remark 2.4 and Conjecture 2.5, pp. 13–14: “Conjecture 2.5” — Equivalent general-weight period form subject to positive determinant size.

### Regulator-compatible Zagier comparison

`P.4/regulator-comparison` · definition · P.4 part

For F a number field and n≥2, let M=ker δ_n and K=gr^n_γ K_(2n−1)(F)_Q with the canonical regulator restricted from K-theory and R.4’s selected real Tate coordinates. RegulatorCompatibleComparison(F,n) means there exist a Q-linear equivalence φ:M≃K and λ∈Q× with p_L(y)=λ π^(n−1) r_Bo(φ y) for every y, where p_L is the embedding-wise L_n map. The π^(n−1) factor is explicit because R.4 uses Tate-divided Burgos coordinates. This strengthens the parent vector-space comparison by compatibility; its existence is a conjecture, and no arbitrary equivalence is declared canonical. A generic signature permits any specified nonzero real scale A in place of π^(n−1).

**Hypotheses.**

- F is a number field; n≥2; use the specified R.4 Tate-divided real regulator coordinates; the generic scale A is nonzero in the intended comparison.

**Construction.**

1. Quantify the actual equivalence and its nonzero rational calibration factor; use equality of Q-linear maps as the compatibility condition.
2. Functoriality transports both maps along an equivalence; changing the regulator by a nonzero rational factor changes λ inversely.
3. Do not supply the conjectural witness or replace it with expected rank. R.7 must audit the general-weight class normalization.

**API.**

- `TauCeti.Polylog.WeightFour.regulatorComparison` (constructor): ∃φ:M≃ₗ[Q]K,λ∈Q×, p(y)=λ A r(φ y) for all y.
- `TauCeti.Polylog.WeightFour.regulatorComparison_witness` (projection): Recover an equivalence and its calibration equation from the predicate.
- `TauCeti.Polylog.WeightFour.regulatorComparison_forget` (projection): The predicate implies Nonempty(M≃ₗ[Q]K).
- `TauCeti.Polylog.WeightFour.regulatorComparison_rescale` (compatibility): For b∈Q×, replacing r by b r replaces λ by λ/b and preserves the predicate.
- `TauCeti.Polylog.WeightFour.regulatorComparison_injective` (compatibility): If A≠0 and r is injective, a compatible p is injective.
- `TauCeti.Polylog.WeightFour.regulatorComparison_transport` (functoriality): Transporting the source along a Q-linear equivalence preserves the predicate.

**Unit tests.**

- `TauCeti.Polylog.WeightFour.comparison_identity` (computation): For M=K=Q,d=1,p=r the usual inclusion in R and A=1, the identity with λ=1 is a witness.
- `TauCeti.Polylog.WeightFour.comparison_zero_period` (non-example): For the same nonzero r and A=1, p=0 gives no compatible comparison.
- `TauCeti.Polylog.WeightFour.comparison_rational_scale` (compatibility): With p=3r and A=1, the identity and λ=3 give a witness.
- `TauCeti.Polylog.WeightFour.comparison_zero_spaces` (degenerate): For M=K the zero Q-vector space, p=r=0 and A≠0, the unique equivalence and λ=1 give a witness.

**Acceptance.**

- Forgetting compatibility gives the parent comparison assertion; the converse is not claimed.
- The scale is required nonzero for consequences about period-image rank.
- An isomorphism of vector spaces with incompatible irrationally rescaled period maps does not satisfy this predicate.

**Used by.**

- Z90 §8 final Main Conjecture: Supplies more than generation: it identifies the period with the K-theoretic regulator.
- BorelRegulators R.5; P.4/period-calibration: Converts the regulator covolume formula into the concrete Zagier determinant formula.

**Depends on.** this roadmap: `P.4/condition-o-n`, `P.4/polylog-on-higher-bloch`, `P.4/goncharov-comparison-conjecture`; other roadmaps: `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/target-coordinates`; stages: `BorelRegulators:R.7`.

**Used in this roadmap by.** `P.4/period-calibration`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `Z90`, §8 final Main Conjecture, p. 417: “Borel regulator” — The final conjecture includes agreement of the polylogarithm and K-theory regulator.
- `G94`, §2.3 Remark 2.4, p. 13: “Remark 2.4” — Original normalization used for the positive-value formula.
- `GR5`, Theorem 1.3(iv), pp. 6–7: “non-zero rational multiple” — Weight-four comparison is a calibrated map, not a proved isomorphism.

### Logical implications between Zagier assertions

`P.4/assertion-logic` · theorem · P.4 part

For the actual period map p on a Q-vector space M, c≠0 and ζ≠0: rational-existence implies rank existence; rank existence together with the parent every-family rational identity implies rational-existence. With d>0, rational-existence is equivalent to an exact normalized ζ family. If additionally dim_Q M=d, rational-existence implies the every-family identity: express each family in the rational basis furnished by its nonzero determinant. Without the dimension or rational image-span condition that converse is not claimed. At d=0 rank existence is automatic, whereas rational-existence still requires c/ζ∈Q×. These implications correct the parent’s unqualified rank-to-rescaling equivalence.

**Hypotheses.**

- The rank implication uses every-family rationality; the reverse implication uses dim_Q M=d and ζ≠0; exact normalization requires d>0.

**Proof.**

1. Apply the nonzero rational witness for the forward rank implication.
2. Apply the every-family assertion to the family furnished by rank existence; its factor cannot be zero.
3. Use the rational column rescaling API only at positive d.
4. Under dim M=d, the witness family is a Q-basis since its real period matrix has nonzero determinant. Every other matrix is right multiplication by a rational coefficient matrix; determinant multiplicativity gives q=det A times the witness factor, allowing det A=0.

**Acceptance.**

- A repeated-column or zero family has q=0; it is not a counterexample to the every-family statement.
- For d=0 the Q test gives c=π⁴ and ζ(4)=π⁴/90, so the necessary factor is 90.
- The vector-space comparison is logically separate from both numerical assertions.

**Depends on.** this roadmap: `P.4/rational-existence`, `P.4/zagier-statement`; libraries: `mathlib:Matrix.det_mul`.

**Used in this roadmap by.** `P.4/weight-four-determinant-lifting`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `Z90`, §8, pp. 416–417: “MAIN CONJECTURE” — Separates regulator lattice and motivic comparison.
- `GR5`, Theorem 1.2, its two assertions, p. 5: “For any” — Existence and all-family numerical forms.

### Borel-to-polylogarithm period normalization

`P.4/period-calibration` · comparison · P.4 part

Let F have r₁ real places, r₂ complex pairs, N=[F:Q] and n≥2. Put d=d_n and e=n(N−d), equal to n r₂ for odd n and n(r₁+r₂) for even n. Import R.5’s Burgos covolume R_Bo,n∼_(Q×)|D_F|^(1/2)π^(d−Nn)ζ_F(n). If the actual cycle period is calibrated by p_L=λπ^(n−1)r_Bo∘φ with λ∈Q× and φ:M≃gr^n_γK_(2n−1)(F)_Q, and this eigenspace is all rational K_(2n−1)(F), then every rational basis has det p_L∈Q×|D_F|^(1/2)π^(−e)ζ_F(n). Therefore parent Z_n=c_n det p_L has nonzero rational ratio to ζ_F(n), and every family has a rational ratio, possibly zero. This is a conditional implication, not a proof of the comparison conjecture.

**Hypotheses.**

- F is a number field; n≥2; regulator-compatible comparison, the R.5 covolume formula and number-field weight-n Adams purity are assumed.

**Proof.**

1. Use the number-field Adams purity supplier and localization to identify the actual rational K-group appearing in the regulator lattice.
2. Choose an integral free K-basis modulo torsion. A rational basis changes its covolume by a nonzero rational determinant; orientations change only a rational sign.
3. Multiply the R.5 formula by (λπ^(n−1))^d. The exponent is (n−1)d+d−Nn=−n(N−d)=−e, exactly Zagier p. 393 and G94 Remark 2.4.
4. Multiplying by π^e/√|D_F| gives the parent normalized determinant. Rational matrix changes give all-family proportionality. Empty products use 1.

**Acceptance.**

- For Q and odd n, e=0 and d=1; for Q and even n, e=n and d=0.
- For Q(i), N=2 and d=1 in either parity, so e=n in both odd and even weight.
- Using R.4 coordinates without the π^(n−1) conversion produces the wrong determinant exponent; a universal factor 2 cannot repair it.

**Depends on.** this roadmap: `P.4/regulator-comparison`, `P.4/zagier-determinant`; other roadmaps: `BorelRegulators:R.5/leading-term-functional-equation`, `BorelRegulators:R.5/borel-zeta-proportionality`, `BorelRegulators:R.4/regulator-lattice`, `BorelRegulators:R.4/regulator-real-isomorphism`; stages: `SchemeKTheoryOperations:S.6`; libraries: `mathlib:Matrix.det_mul`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `Z90`, Introduction, regulator/period paragraph following (3), p. 393: “π” — Original parity, period and discriminant factor checked in the scan.
- `G94`, §2.3 Remark 2.4, p. 13: “Remark 2.4” — The positive-value period relation in the original regulator convention.

### The explicit weight-four polylogarithmic complex

`P.4/explicit-weight-four-complex` · construction · planet “Explicit weight-four polylogarithmic complex” · P.4 part

For an infinite field F, form Γ_exp(F,4) using the parent freeness-extension’s actual combinatorial symbol span B₄^comb⊂L₄, P.3’s explicit 22-term B₃ and V.3/P.3’s rational five-term B₂. Its terms in degrees 1,2,3,4 are B₄^comb, B₃^exp⊗U, B₂^exp⊗Λ²U, Λ⁴U, where U=F×_Q. The differentials are {x}₄↦{x}₃⊗u(x), {x}₃⊗Y↦{x}₂⊗(u(x)∧Y), and {x}₂⊗Y↦(u(1−x)∧u(x))∧Y, with the parent endpoint conventions. The symbol span and cobracket relation descent come from GR’s combinatorial theorem, whose full proof is assigned to the named Part II extension. This definition does not replace B₃^exp by B₃^ind.

**Hypotheses.**

- F is infinite; import the parent combinatorial B4 symbol span, the explicit B3 and B2, and the descended boundary maps from the named GR proof owner.

**Construction.**

1. Import the combinatorial B₄ span and the descended cobracket from GR Theorem 1.14(a),(c); its proof boundary is the explicit-weight-four input gap.
2. Use the existing P.3 differential and tensor/exterior insertion in the remaining degrees.
3. Check d²=0 on generators by u(x)∧u(x)=0 and extend by linearity. Package the four terms in the native CochainComplex, with zero terms outside degrees 1–4.

**API.**

- `TauCeti.Polylog.WeightFour.explicitComplex` (constructor): Package the four specified terms and boundary maps into a native cochain complex.
- `TauCeti.Polylog.WeightFour.explicitComplex_X` (data): The object in degree i is the displayed term for i=1,2,3,4, and zero otherwise.
- `TauCeti.Polylog.WeightFour.explicitComplex_d` (simp): The maps in degrees 1→2,2→3,3→4 are the three specified native linear maps.
- `TauCeti.Polylog.WeightFour.explicitComplex_first_kernel` (characterisation): Since degree zero is zero, the cycle space in degree one is ker δ₄^exp.
- `TauCeti.Polylog.WeightFour.explicitComplex_map` (functoriality): Field embeddings act termwise on symbols and unit exterior powers, commuting with the differentials.

**Unit tests.**

- `TauCeti.Polylog.WeightFour.explicit_degree_one` (compatibility): The degree-one object is the supplied B₄^comb, not the whole L₄.
- `TauCeti.Polylog.WeightFour.explicit_zero_outside` (degenerate): The degree-zero and degree-five objects are zero modules.
- `TauCeti.Polylog.WeightFour.explicit_first_boundary` (compatibility): The native degree-one differential equals δ₄^exp.
- `TauCeti.Polylog.WeightFour.explicit_no_extra_summand` (non-example): The degree-two term is B₃^exp⊗U; Λ²B₂ is a summand of the comparison CE complex, not of Γ_exp itself.

**Acceptance.**

- There is no incoming differential at degree one, so H¹ is literally the first-boundary kernel.
- GR Corollary 1.15 identifies this complex with the weight-four Chevalley–Eilenberg complex; it does not identify its B₃ term with the inductive presentation.

**Used by.**

- GR5 (44) and Corollary 1.15: Specifies the complex whose comparison with the combinatorial Lie coalgebra is proved.
- P.4/presentation-chain-map and weight-four-regulator-input: Carries explicit cycles and the regulator maps without silently changing the lower relation model.

**Depends on.** this roadmap: `P.4/freeness-extension`, `P.3/trilogarithm-group`, `P.3/polylogarithmic-complex`; libraries: `mathlib:CochainComplex.of`, `mathlib:TensorProduct.map`, `mathlib:TensorProduct.lift`, `mathlib:exteriorPower.ιMulti`.

**Used in this roadmap by.** `P.4/presentation-chain-map`, `P.4/weight-four-regulator-input`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `GR5`, §1.2, Theorem 1.14, (44), Corollary 1.15, pp. 15–16: “quasi-isomorphism” — The exact explicit complex used in the proof.

### Explicit-to-inductive weight-four chain map

`P.4/presentation-chain-map` · construction · P.4 part

The parent comparison maps p₄:B₄^comb→B₄^ind, p₃:B₃^exp→B₃^ind and p₂:B₂^exp≃B₂^ind induce P:Γ_exp(F,4)→Γ_ind(F,4). Its components are p₄, p₃⊗id_U, p₂⊗id_(Λ²U), and id_(Λ⁴U). They commute with all differentials and send each symbol to the identically named inductive symbol. In particular p₄ is surjective because B₄^comb and B₄^ind are generated by single symbols; no injectivity of p₃ or p₄, no quasi-isomorphism, and no surjectivity on first-boundary kernels is asserted. Scalar L₄ evaluations agree under p₄.

**Hypotheses.**

- The parent natural comparison maps and their relation descent are available; lower groups use the fixed explicit/inductive presentations.

**Construction.**

1. Build the degreewise maps with TensorProduct.map and identity on exterior powers.
2. Check the chain squares on single symbols, using the parent comparison’s relation descent and sign adapter in weight two.
3. Lift a finite linear combination of inductive generators to the identical explicit combination to prove p₄ surjective on groups.
4. Evaluate a lifted representative by the same L₄ sum; inherited analytic descent ensures equality. Do not infer kernel surjectivity from surjectivity on groups.

**API.**

- `TauCeti.Polylog.WeightFour.presentationMap` (constructor): The cochain map with the four displayed components.
- `TauCeti.Polylog.WeightFour.presentationMap_first` (projection): Its degree-one component is p₄.
- `TauCeti.Polylog.WeightFour.presentationMap_second` (projection): Its degree-two component is p₃⊗id_U.
- `TauCeti.Polylog.WeightFour.presentationMap_square` (compatibility): (p₃⊗id)δ₄^exp=δ₄^ind p₄.
- `TauCeti.Polylog.WeightFour.presentationMap_cycles` (functoriality): Restrict p₄ to a Q-linear map ker δ₄^exp→ker δ₄^ind.
- `TauCeti.Polylog.WeightFour.presentationMap_period` (compatibility): Embedding-wise L₄ of p₄(x) equals embedding-wise L₄ of x.

**Unit tests.**

- `TauCeti.Polylog.WeightFour.presentation_zero_cycle` (degenerate): The restricted cycle map sends zero to zero.
- `TauCeti.Polylog.WeightFour.presentation_pure_tensor` (compatibility): The degree-two component sends b⊗u to p₃(b)⊗u.
- `TauCeti.Polylog.WeightFour.presentation_cycle_boundary` (compatibility): For an explicit δ₄-cycle x, δ₄^ind(p₄x)=0.
- `TauCeti.Polylog.WeightFour.presentation_top_identity` (compatibility): The degree-four component is exactly the identity on Λ⁴U.

**Acceptance.**

- The degree-two square is (p₃⊗id)δ₄^exp=δ₄^ind p₄.
- Replacing the generator lift by another lift changes its explicit boundary by δ₄^exp(ker p₄).

**Used by.**

- GR5 comparison of presentations, pp. 9,12; parent weight-four-theorem: Transfers explicit-cycle existence to the inductive presentation.
- P.4/cycle-obstruction: Its first square defines the obstruction to lifting an arbitrary inductive cycle.

**Depends on.** this roadmap: `P.4/explicit-weight-four-complex`, `P.4/general-polylog-complex`, `P.4/explicit-to-inductive-comparison`, `P.4/polylog-on-higher-bloch`, `P.4/suslin-rigidity-adapter`; libraries: `mathlib:TensorProduct.map`, `mathlib:CochainComplex.ofHom`.

**Used in this roadmap by.** `P.4/cycle-obstruction`, `P.4/weight-four-determinant-lifting`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `GR5`, §1.2, pp. 9, 12 and (44) p. 16: “conjecture” — Natural maps to the inductive presentations are stated; their higher bijectivity remains conjectural.

### Obstruction to lifting an inductive cycle

`P.4/cycle-obstruction` · construction · P.4 part

Write C=B₄^comb, D=B₄^ind, E=B₃^exp⊗U, J=B₃^ind⊗U, a=δ₄^exp, b=δ₄^ind, p=p₄ and q=p₃⊗id, so qa=bp and p is surjective. Let T=ker q and H be the image of ker p under a, regarded as a submodule of T by the square. Define the Q-linear obstruction ω:ker b→T/H by ω(y)=[a(x)] for any lift p(x)=y. It is independent of the lift. Then ω(y)=0 iff y has an explicit cycle lift; its kernel equals the image of ker a→ker b. The kernel of the latter cycle map is ker p∩ker a. This is a polylogarithmic application of native kernels, submodule image and quotient, not a new abstract homology theory.

**Hypotheses.**

- The displayed linear square commutes and p is surjective; no injectivity of q is assumed.

**Construction.**

1. The commuting square puts a(x) in T for y∈ker b and puts a(ker p) in T.
2. Choose a lift using surjectivity; two lifts differ by k∈ker p and their boundaries differ by a(k)∈H. Quotient extensionality gives independence and linearity.
3. If [a(x)]=0 choose k∈ker p with a(k)=a(x); then x−k is a cycle lifting y. The reverse follows by selecting a cycle lift.
4. Restrict p to ker a and compute its kernel by unfolding membership. No presentation-isomorphism conjecture is used.

**API.**

- `TauCeti.Polylog.WeightFour.obstructionSubmodule` (constructor): H=range of a restricted from ker p to ker q.
- `TauCeti.Polylog.WeightFour.cycleObstruction` (constructor): ω:ker b→ₗ[Q](ker q)/H, using the surjective p and its square.
- `TauCeti.Polylog.WeightFour.cycleObstruction_lift` (characterisation): If p x=y and b y=0, ω(y) is the quotient class of a x.
- `TauCeti.Polylog.WeightFour.cycleObstruction_zero_iff` (characterisation): ω(y)=0 iff ∃x,px=y and ax=0.
- `TauCeti.Polylog.WeightFour.cycleObstruction_image` (characterisation): ker ω equals the image of the restricted explicit-cycle map.
- `TauCeti.Polylog.WeightFour.cycleObstruction_injective_target` (compatibility): If q is injective, ω=0.

**Unit tests.**

- `TauCeti.Polylog.WeightFour.obstruction_explicit_cycle` (compatibility): If ax=0, ω(px)=0.
- `TauCeti.Polylog.WeightFour.obstruction_change_lift` (characterisation): For k∈ker p, the quotient classes of ax and a(x+k) in T/H agree.
- `TauCeti.Polylog.WeightFour.obstruction_missing_cycle` (non-example): For C=D=E=Q, J=0, p=id,a=id,b=0,q=0, the only explicit cycle is 0 but every y is an inductive cycle; ω(1) is nonzero.
- `TauCeti.Polylog.WeightFour.obstruction_injective_square` (degenerate): If q is injective, every inductive cycle has an explicit cycle lift.

**Acceptance.**

- The obstruction vanishes on images of explicit cycles.
- If q is injective then every ω is zero, which is a sufficient hypothesis; it is not asserted for p₃.
- Nonzero ω is not itself proof of an incorrect scalar period identity; excess cycles could still have appropriate periods.

**Used by.**

- Parent P.4/weight-four-theorem part (b) gap: Gives an exact liftability criterion instead of assuming B₃^exp≃B₃^ind.
- P.3 conditional-complex-transfer and P.4/homotopy-conjecture: Distinguishes a group presentation comparison from the cohomological input needed by transfers.

**Depends on.** this roadmap: `P.4/presentation-chain-map`; libraries: `mathlib:LinearMap.ker`, `mathlib:LinearMap.range`, `mathlib:Submodule.liftQ`.

**Used in this roadmap by.** `P.4/weight-four-determinant-lifting`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `GR5`, §1.2 comparison discussion, pp. 9,12; complex (44), p. 16: “conjecture” — The square to which the elementary quotient obstruction is applied; this exact obstruction is a planning refinement, not named in the source.

### Weight-four regulator interface of Goncharov–Rudenko

`P.4/weight-four-regulator-input` · comparison · P.4 part

For a number field F the explicit-complex proof input has two distinct pieces: (i) a natural Q-linear map κ:K₇(F)_Q→ker δ₄^exp whose L₄ period, in selected embeddings, is a nonzero rational multiple of the correctly converted Borel regulator; (ii) containment of the periods of all explicit δ₄-cycles in that same rational regulator image. Together these imply rational-existence and the every-family determinant identity for Γ_exp. Piece (i) does not imply piece (ii), nor does either assert κ is an isomorphism. The target P.4 theorem is published; the full motivic-correlator, cluster and period proof is the named Part II extension, recorded as a precise input gap here.

**Hypotheses.**

- F is a number field; the target is the explicit complex (44); both stated regulator-interface pieces are assigned to the named Part II proof owner.

**Proof.**

1. The Part II owner supplies GR Theorem 1.14, Corollary 1.15, Theorem 1.13’s motivic-correlator realization, and the flag/configuration cocycle of Theorems 7.6 and 9.1, with §9.3’s regulator comparison.
2. For all explicit cycles, use the motivic realization and its Hodge periods to place their scalar periods in the rational K₇ regulator image. This is an image-containment requirement and must be verified separately from κ’s construction.
3. Compare the source’s single-valued period L₄*=(5L₄+(1/3)L₂ log²|z|)/16 with L₄ on cycles. Do not assert they are scalar multiples pointwise: the lower-weight/log correction is killed using the cycle boundary and period-map factorization.
4. Apply Borel’s real isomorphism for existence and its R.5 lattice/positive-value formula for every-family rationality, using the R.7 cycle-level scalar conversion. Multiplying the covolume by π^(3r₂) gives exponent (3r₂)+r₂−4N=−4(r₁+r₂). This arithmetic uses the regulator formula directly and does not assume the equivalence premise of period-calibration; no H¹Γ≃K₇ conjecture is assumed.

**Acceptance.**

- The source’s Conjecture 1.4 remains a conjecture even at weight four.
- The statement that κ gives a nonzero Borel class is insufficient on its own to prove the every-family assertion.
- The promised input is stated for the explicit complex (44); no identification with the inductive B₃ is smuggled in.

**Depends on.** this roadmap: `P.4/explicit-weight-four-complex`, `P.4/zagier-determinant`, `P.4/cycle-constancy`; other roadmaps: `BorelRegulators:R.5/leading-term-functional-equation`, `BorelRegulators:R.5/borel-zeta-proportionality`, `BorelRegulators:R.4/regulator-real-isomorphism`, `BorelRegulators:R.4/regulator-lattice`; stages: `BorelRegulators:R.7`; libraries: `mathlib:Matrix.det_mul`.

**Used in this roadmap by.** `P.4/weight-four-determinant-lifting`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `GR5`, Theorems 1.13–1.14; (44); Theorem 1.3(iv); §8.2 (189)–(193); §9.3, pp. 15–16,6–7,76–78,94: “period” — Specified proof interfaces, including the lower-weight correction in the Hodge period.

### Transfer of the weight-four numerical theorem

`P.4/weight-four-determinant-lifting` · theorem · P.4 part

For a number field F, P:Γ_exp(F,4)→Γ_ind(F,4) preserves L₄ periods and maps explicit cycles to inductive cycles. Therefore any explicit nonzero rational ζ_F(4) determinant witness gives an inductive witness, and when r₂>0 can be rationally normalized to equality. For an arbitrary inductive family y with every ω(y_j)=0, lift each column to an explicit cycle; the explicit every-family theorem then gives Z₄(y)=qζ_F(4), q∈Q. Thus part (b) for all inductive cycles follows if ω=0. More weakly it suffices that every inductive cycle period lies in the same calibrated rational K₇ regulator image, even if ω≠0. Neither sufficient input is proved merely by the existence theorem; the general inductive part (b) remains a recorded gap.

**Hypotheses.**

- F is a number field; P preserves periods; the explicit numerical theorem is supplied. The every-family transfer requires cycle lifts or the weaker period-image containment.

**Proof.**

1. For existence push the explicit witness family forward and compare every matrix entry, hence determinant; use the explicit nonzero rational coefficient.
2. For a liftable family use cycleObstruction_zero_iff on each column and the period compatibility of the chain map.
3. For the weaker sufficient condition express each inductive period column in a rational basis of the calibrated regulator image and take its rational coefficient determinant.
4. Record the exact open input: vanishing of the obstruction for all cycles, or the weaker image containment. A conjectural full p₃ isomorphism would imply the former, but is not taken as a theorem.

**Acceptance.**

- At r₂=0 no column may be scaled; use weight-four-totally-real instead.
- At a dependent or zero family the coefficient may be zero.
- This conditional lifting theorem does not mislabel Zagier’s published theorem as a conjecture.

**Depends on.** this roadmap: `P.4/cycle-obstruction`, `P.4/presentation-chain-map`, `P.4/weight-four-regulator-input`, `P.4/rational-existence`, `P.4/assertion-logic`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `GR5`, Theorem 1.2, its two assertions, p. 5; (44), p. 16; §9.3, p. 94: “Theorem 1.2” — Refines the published statement’s presentation boundary without claiming the missing lift proof.

### The empty weight-four determinant

`P.4/weight-four-totally-real` · theorem · P.4 part

For a totally real number field F, r₂=0 and d₄=0. The parent normalized empty determinant is Z₄=π^(4r₁)/√|D_F|. The functional equation and Borel’s rank-zero covolume give ζ_F(4)∈Q×Z₄; equivalently Z₄=qζ_F(4) for a nonzero rational q. An exact equality Z₄=ζ_F(4) is not asserted. For F=Q, q=90. No Bloch cycle or first-column normalization exists in this case.

**Hypotheses.**

- F is a totally real number field; import the rank-zero Borel and zeta functional-equation statements.

**Proof.**

1. The rank-zero lattice has empty covolume 1. Specialize the R.5 period formula at n=4 and d=0.
2. Solve its nonzero rational proportionality for ζ_F(4).
3. Use ζ_Q(4)=π⁴/90 for the concrete empty-matrix check. This is the correction already recorded as parent source issue E2.

**Acceptance.**

- The Q example falsifies the uncorrected exact empty-determinant formula.
- The nonzero rational factor is retained both in rational-existence and every-family statements.

**Depends on.** this roadmap: `P.4/zagier-determinant`; other roadmaps: `BorelRegulators:R.5/leading-term-functional-equation`, `BorelRegulators:R.5/borel-zeta-proportionality`, `BorelRegulators:R.7/number-field-small-cases`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `Z90`, Introduction, regulator/period paragraph following (3), p. 393: “rational multiple” — Original rational factor survives empty determinant size.
- `GR5`, Theorem 1.2, first assertion, p. 5, inherited parent E2: “Theorem 1.2.” — Parent’s already recorded empty-case correction is reused, not reported as a new finding.

### Weight-four residues at finite polynomial places

`P.4/weight-four-residue-map` · construction · P.4 part

For a field F of characteristic zero and a monic irreducible p∈F[t], let v_p be the associated valuation on F(t), k_p=F[t]/(p), and U=F(t)×_Q. On the inductive Γ(F(t),4), define ∂_p:Γ(F(t),4)→Γ(k_p,3)[−1]: its degree-one component is zero, its degree-two component sends {f}₃⊗u(g) to v_p(g){f̄}₃ for valuation-unit f (zero otherwise), its degree-three component is sp_p⊗Res_p on B₂⊗Λ²U, and its degree-four component is the native exterior residue Λ⁴U→Λ³ k_p×_Q. Res_p puts the uniformizer first. Every finite family has finite residue support. Quotient by the image of constants gives ρ₄:Γ(F(t),4)/Γ(F,4)→⊕_p Γ(k_p,3)[−1]. Relation descent at non-rational places and the signed cochain-map assertion are explicit missing inputs, not assumed consequences of a rational-point specializer.

**Hypotheses.**

- F has characteristic zero; p is monic irreducible; use the finite-place symbol descent and signed residue maps whose proofs are recorded as a gap.

**Construction.**

1. Use the imported exterior residue and the polylogarithmic symbol specialization at the finite-place residue field. Such residue fields need not equal F, so the rational-point induction must be extended; this is recorded in the finite-place residue gap.
2. Use TensorProduct’s bilinear universal property in degree two and tensor/exterior residue in degree three. Sum only finitely many nonzero polynomial valuations in the support.
3. Check the sign by the native cochain shift: the displayed generator residue maps satisfy ∂d=−d∂ when Res places the uniformizer first. Hence they define a map to the shift [−1].
4. Constant symbols and constant unit wedges have zero residues, so the map factors through the quotient complex once the field inclusion and quotient are supplied by the parent specialization retraction.

**API.**

- `TauCeti.Polylog.WeightFour.residueTensor` (constructor): For sp:B→ₗB′ and v:U→ₗQ, residueTensor:B⊗U→ₗB′ sends b⊗u to v(u)·sp(b).
- `TauCeti.Polylog.WeightFour.residueTensor_tmul` (simp): residueTensor(sp,v)(b⊗u)=v(u)·sp(b).
- `TauCeti.Polylog.WeightFour.residueTensor_add` (simp): The residue is additive in the full native tensor product.
- `TauCeti.Polylog.WeightFour.residueTensor_zero_unit` (simp): If v(u)=0, the residue of b⊗u is zero.
- `TauCeti.Polylog.WeightFour.residueTensor_comp` (functoriality): Applying a linear map h to the residue equals residueTensor(h∘sp,v).
- `TauCeti.Polylog.WeightFour.residueTensor_uniformizer` (compatibility): If v(uπ)=1, the residue of b⊗uπ equals sp(b).

**Unit tests.**

- `TauCeti.Polylog.WeightFour.residue_uniformizer` (computation): With v(uπ)=1, the residue of b⊗uπ is sp(b), fixing the degree-two sign.
- `TauCeti.Polylog.WeightFour.residue_unit` (degenerate): With v(u)=0, the residue of b⊗u is zero even if sp(b)≠0.
- `TauCeti.Polylog.WeightFour.residue_inverse_uniformizer` (computation): With v(uπ)=1, the residue of b⊗(−uπ) is −sp(b).
- `TauCeti.Polylog.WeightFour.residue_symbol_pole` (degenerate): If sp(b)=0, the tensor residue vanishes regardless of the unit-factor valuation.

**Acceptance.**

- Infinity is omitted from the direct sum in Gon95 Conjecture 1.39.
- At degree two {c}₃⊗u(p) maps to {c}₃; swapping a uniformizer across a unit in an exterior wedge changes the sign.
- Neither finite residue support nor the chain-map property proves that ρ₄ is a quasi-isomorphism.

**Used by.**

- G95 Conjecture 1.39 and following transfer discussion: Supplies the rational-curve analogue of the finite-place residue map needed for conditional derived transfers; direct identification with Gon95’s model requires a compatible comparison.
- Polylogarithms:P.3/conditional-complex-transfer: Makes its weight-four homotopy hypothesis precise without claiming unconditional tower independence.

**Depends on.** this roadmap: `P.4/general-polylog-complex`, `P.4/relation-specialization-induction`, `P.3/exterior-residue`; libraries: `mathlib:TensorProduct.map`, `mathlib:TensorProduct.lift`, `mathlib:exteriorPower.ιMulti`, `mathlib:CochainComplex.ofHom`.

**Used in this roadmap by.** `P.4/homotopy-conjecture`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `G95`, §1.14 (1.45)–(1.47), pp. 236–238; §1.15 (1.48) and Conjecture 1.39, pp. 239–240: “Homotopy Invariance” — Residue formulas and finite-place quotient map in the all-smooth-curve model. The rational-curve analogue here needs its own relation descent; no equivalence of the models is asserted.

### Weight-four polylogarithmic homotopy conjecture

`P.4/homotopy-conjecture` · comparison · P.4 part

For every characteristic-zero field F, with the finite-place residue map ρ₄ of weight-four-residue-map, PolylogHomotopy₄(F) is the concrete proposition QuasiIso(ρ₄): Γ_ind(F(t),4)/Γ_ind(F,4)→⊕_(monic irreducible p)Γ_ind(k_p,3)[−1]. It is a conjecture, not an instance supplied to typeclass inference. The codomain has Γ(k_p,3) in degrees 2–4 and no degree-one term. This is the rational-curve analogue of Gon95 Conjecture 1.39 at n=4. Gon95 uses the all-smooth-curve quotient; identifying the two homotopy assertions requires a chain-compatible comparison, which is not supplied or assumed here. Even under this hypothesis, independence of the primitive-element choice, compatibility with towers and agreement with top-degree Milnor transfer must be established for P.3’s derived-transfer construction.

**Hypotheses.**

- F has characteristic zero; ρ4 is the specified descended finite-place quotient map. QuasiIso(ρ4) is conjectural, not asserted as an instance.

**Proof.**

1. Use the native QuasiIso property on the specified map; equivalently require every induced cohomology map to be an isomorphism.
2. Retain the conjectural status and the exact finite-place, shift and quotient conventions.
3. Under the hypothesis one may invert ρ₄ in the derived category and use the ∞ residue to define a candidate finite-extension transfer. The source says independence appears possible; its proof is not supplied by merely inverting the map.

**Acceptance.**

- The higher homotopy assertion is not a consequence of the scalar L₄ determinant theorem.
- The P.3 consumer may use this only as an explicit hypothesis, and cannot infer tower independence automatically.
- No equivalence with Gon95 Conjecture 1.39 is claimed without a comparison of curve models commuting with differentials, field maps and finite-place residues.

**Depends on.** this roadmap: `P.4/weight-four-residue-map`; libraries: `mathlib:quasiIso_iff`.

**Library.** module `TauCeti/NumberTheory/Polylog/WeightFour`, namespace `TauCeti.Polylog.WeightFour`.

**Sources.**

- `G95`, Conjecture 1.39, p. 240; subsequent paragraph p. 241: “quasi-isomorphism” — Conjecture and conditional transfer application in Gon95’s all-smooth-curve model; the displayed rational-curve assertion is its analogue, not an established equivalent formulation.
- `G94`, Definition 1.19 and following comparison discussion, manuscript p. 10: “Definition 1.19” — Distinguishes the rational-curve groups from the all-smooth-curve groups and describes their comparison as conjectural.

## P.5 — Curves and regulator complexes

*Coverage in `Polylogarithms.json`: partial, 30 nodes.* The curve complexes and unramified classes; the weight-two form with its exact Steinberg and residue identities and its period classes; the forms r_{m-1}, their currents, the residue and Proposition 2.8; Goncharov's Deligne complex and his regulator as a map of complexes with its real form; the comparison with Beilinson's regulator (Burgos Gil-Feliu-Takeda); the Chow polylogarithm; the Arakelov complex; the Chow dilogarithm, the strong reciprocity conjecture and its three proved cases; the weight-three curve regulator.

Remaining in this record:

- Real Deligne-Beilinson complex (requested from MotivicEtaleKTheory:M.8)
- Currents on complex manifolds and the Poincare-Lelong formula (gap)
- Chow varieties (gap)
- The group (36) and the Gersten comparison (gap)
- The elliptic trilogarithm (gap)
- The proof of Burgos Gil-Feliu-Takeda Theorem 6.18

*Coverage in `Polylogarithms--P.5.json`: planned, 33 nodes.*

Remaining in this record:

- Early M.8 supplier not yet split: All general Deligne carriers, support operations and universal-regulator inputs terminate at the exact request to M.8 above. Confirmed RT-AREA-ktheory-2/7 and /24 require an accepted early archimedean prefix before a dependency id can be used. Do not promote the request into an edge from the entire unsplit M.8.
- Global smooth analytic and torus Fourier interface: Mathlib scalar test functions/distributions are chart objects. The early C5 Part II interface requested here must supply global differential forms and integration before global current operations, and distributional Fourier coefficients before the elliptic formula. Existing proper de Rham–Betti nodes are a near miss, not a replacement. Analytic subsets and finite local projections also rest on C0/repair-analytification and its tracked, unintegrated PR196 carrier; the C0 request names this exact boundary. Also missing in P.5’s local current foundations are positive-current and locally complete pluripolar carriers with El Mir’s finite-mass extension theorem (Demailly III 2.3, pp. 139–140), and the normal-current support/dimension theorem (III 2.10–2.11, p. 141) with the order-zero hypotheses needed by Poincaré–Lelong. These are current-theory inputs owned by P.5, not assertions that C0 or R09.7 supplies arbitrary analytic resolution or current extension.
- Chow incidence carrier and singular-family Radon operation: R09.2 Part II must construct the requested parameter spaces. The parent Radon transform also needs a resolved, locally integrable pull–push through singular incidence families; a generic incidence projection need not be a submersion, so the arbitrary-current pullback API cannot justify this step. Provide a family-specific resolved-form construction and its independence proof.
- Top-two Gersten/Bloch graph comparison: The graph map and moving argument are specified by the M.4 request; an actual node proving isomorphism on CH^p(X,1) as well as ordinary CH^p is absent. S.4 divisor lengths, Gersten resolution and Bloch formula do not establish this stronger comparison by themselves.
- Inherited polylogarithmic complex transfers: The accepted parent gap remains: no source read constructs full B(F,3) complex transfers. Λ³ of a field norm composed with restriction scales by degree cubed; it is not the desired degree-one transfer. D96’s K4 transfer is not a construction of this missing chain map.
- Parent ordinary residue sign and raw-model conversion: The BFT model has been fixed explicitly, including Tm=(-1)^m r_(m-1), d_D=-2∂bar∂ at the top, and its dimension-dependent integration twists. The parent E21 ordinary-d sign issue remains to be reconciled in every degree and with G05’s (2πi)^(p-m) factors. Published G05 p.21 visibly uses bar∂∂; no missing-bar OCR allegation is made. Until the complete degreewise chain dictionary is checked, the raw-parent-to-universal comparison is conditional.
- Imported P.3 K4 comparison construction: The P.3 map is imported by id with the parent’s unresolved proof/source decomposition. D96 Theorem 2.1 gives a number-field compatibility diagram and its §3.7 proof; it is not a proof of the generic-field map’s construction or an isomorphism on all K4.
- Elliptic Fourier regularisation and normalization collation: The area/character convention and finite convolution determine the stated iA³/(4π²) scalar and -4/3 parent pairing factor. A rigorous approximation theorem controlling products near shared logarithmic poles and a comparison against the accessible version of record are still needed. The journal PDF was unavailable, and D96 v2 Theorem 3.4 has an impossible real-one integral convention; this pass records a target with proof obligations, not a completed analytic comparison.
- Inherited integral reciprocity carrier: The accepted parent states the general conjecture rationally. Its integral Goncharov group through rigidity and Suslin rigidity supplier remain unresolved there. Preserve the proved P1/elliptic/algebraic-number cases and do not promote the general conjecture to a theorem.

The layer has 63 nodes: the first packet's thirty, which plan every target of the stage text from Goncharov's *Polylogarithms, regulators, and Arakelov motivic complexes* and Burgos Gil–Feliu–Takeda, and the P.5 part's thirty-three, which supply the analytic foundations the first packet recorded as gaps (global currents, Poincaré–Lelong, Chow parameter spaces, Green currents), the full proof route of Burgos Gil–Feliu–Takeda's Theorem 6.18, and the weight-three elliptic formula. Together they carry twelve planets, more than one layer may show, so the layer is displayed as the three sub-layers the P.5 part proposes; the node ids are unchanged, and each sub-layer has at most six planets. The order below puts each sub-layer after those it uses: no node uses a node of a later sub-layer.

- **Currents, Chow parameters and Green classes** (P.5:currents). Test forms with their LF topology and currents on oriented manifolds, integration currents of analytic cycles, the quasi-isomorphism of forms into currents, and Poincaré–Lelong, (i/π)∂∂̄[log|f|] = [div f]; Goncharov's forms r_{m−1}, the currents they define on cycles, the residue on a normal variety and the differential d r_{n−1} = π_n(d log f_1 ∧ … ∧ d log f_n) + 2πi ε_n (r_{n−2} ∘ Res)(f_1 ∧ … ∧ f_n); the form of a simplex; admissible cycle parameter spaces and the Chow polylogarithm, their Radon transform; logarithmic Green forms, their integrability and residues, and the group GreenCH^p(X) of Green current classes.
- **Curve symbols and reciprocity** (P.5:curves). The weight-two and weight-three polylogarithmic complexes of a curve, as cones of the total residue; η(f, g) = log|f| d arg g − log|g| d arg f with η(f, 1 − f) = d(D ∘ f); closed currents and period classes of unramified elements, and their identification with the real Deligne regulator of K_2 of a curve; the Chow dilogarithm P_2(X; f_1 ∧ f_2 ∧ f_3) = −(2π)^{−1} ∫ r_2; Goncharov's strong reciprocity conjecture with its proved cases (the projective line modulo 6-torsion, families of curves, curves over ℚ̄, explicit formulas for elliptic and plane curves) and the general-weight conjecture.
- **Higher-cycle and elliptic regulator comparisons** (P.5:regulators). Goncharov's real Deligne complex C_D(X; n) and its comparison with truncated Deligne cohomology; his regulator Z(X; n) → C_D(X; n) on Bloch's cycle complex, a map of complexes, real over ℝ; the Arakelov motivic complex as its shifted cone, with degree zero the Green group; the comparison with Beilinson's regulator through Wang forms, the cubical and mixed regulators, the support complex and the homotopy ψ = P_c − π_{X*}[g • W_m] + φ, which is Burgos Gil–Feliu–Takeda's Theorem 6.18; and the weight-three curve regulator with its descent, its comparison with K_4 and the elliptic Fourier formula Σ_j ∫ ρ_2({f_j}_2 ⊗ g_j) ∧ dz̄ = −iA³/(3π²) Σ_j K_3(D_j, F_j, H_j).

**Ownership.** This layer owns the general weight-two form η(f, g) and its comparison with the Chern regulator of a curve; EllipticRegulators ER.2 specialises them to an elliptic curve and is never a supplier here. The real Deligne–Beilinson complex in general, its products, support operations and universal Chern classes belong to MotivicEtaleKTheory M.8, requested once as an early archimedean prefix, before M.8's late comparisons (confirmed red-team findings RT-AREA-ktheory-2/7 and /24). M.8 as it stands imports late BorelRegulators R.7 and PadicHodgeRegulators D.2 work, so no node depends on the whole stage: the chains that need it end in the request and a gap. Goncharov's explicit complex C_D(X; n) and his regulator into it are this layer's own.

**How the parts fit.** The P.5 part imports all thirty first-packet nodes by id. Its nodes answer the first packet's remaining items as follows: currents on complex manifolds and Poincaré–Lelong are planned (with El Mir's extension theorem and the support theorem for normal currents as a recorded foundation gap, and the global smooth forms requested from ComplexComparisonPartII C5); Chow varieties are requested from AlgebraicModuliForArithmeticGeometry R09.2, with the admissible loci planned here; the group (36) is `P.5/green-presentation`, and its Gersten comparison needs M.4's graph map in the last two degrees; the elliptic trilogarithm is planned as the generalized Eisenstein–Kronecker series with its convergence, pairing and Fourier formula, whose analytic regularisation stays a gap; and the proof of Theorem 6.18 is decomposed. The real Deligne–Beilinson complex is still requested from M.8. The Assembly notes after the first packet's nodes say which P.5-part nodes now supply their inputs.

## P.5:currents — Currents, Chow parameters and Green classes (proposed sub-layer)

Sixteen nodes: six of the first packet and ten of the P.5 part, with four planets. The first packet's forms r_{m−1} and their currents rest here on the P.5 part's global currents: `P.5/r-forms-and-distributions` defines currents by integration against compactly supported forms, which `P.5/compact-test-forms` and `P.5/manifold-currents` construct, and `P.5/analytic-cycle-current` gives the cycle currents δ_Y. Mathlib's test functions and distributions are chart objects; global smooth forms, integration and Stokes are requested from ComplexComparisonPartII C5, and analytic subsets from C0. The Chow polylogarithm needs parameter spaces of cycles, requested from AlgebraicModuliForArithmeticGeometry R09.2, and a resolved pull–push through a possibly singular incidence family (gap).

### Goncharov's forms r_{m-1}

`P.5/r-form` · definition · first packet

For rational functions f_1, ..., f_m on a complex variety, r_{m-1}(f_1, ..., f_m) := Alt_m sum_{j≥0, 2j+1≤m} c_{j,m} log|f_1| dlog|f_2| wedge ... wedge dlog|f_{2j+1}| wedge d(i arg f_{2j+2}) wedge ... wedge d(i arg f_m), with c_{j,m} = 1/((2j+1)!(m-2j-1)!), an R(m-1)-valued (m-1)-form off the divisors (the printed range '2j+1 ≤ 2m+1' is source issue E10). It is multilinear and alternating, so it defines a homomorphism out of Lambda^m C(Y)^x, and d r_{m-1} = pi_m(dlog f_1 wedge ... wedge dlog f_m) off the divisors (14).

**Hypotheses.**

- f_1, ..., f_m are nonzero rational functions; the form lives on the complement of their divisors.

**Construction.**

1. Define the alternating sum; it is multilinear in the log|f_i| and dlog|f_i|, d arg f_i, hence additive in each f_i and alternating.
2. Compute d r_{m-1} off the divisors, using d dlog|f| = d d arg f = 0 there (14).
3. The identity r_{m-1} = omega_{m-1}(log|f_1| wedge ... wedge log|f_m|) of (15).

**API.**

- `rForm` (constructor): r_{m-1}(f_1, ..., f_m), as a homomorphism out of Lambda^m.
- `rForm_zero` (simp): r_0(f) = log|f|.
- `rForm_one` (simp): r_1(f wedge g) = i eta(f, g).
- `rForm_two` (simp): r_2 = Alt_3((1/6) log|f_1| dlog|f_2| wedge dlog|f_3| - (1/2) log|f_1| d arg f_2 wedge d arg f_3).
- `rForm_d` (relation): d r_{m-1} = pi_m(dlog f_1 wedge ... wedge dlog f_m) off the divisors.
- `rForm_eq_omega` (characterisation): r_{m-1}(f_1 wedge ... wedge f_m) = omega_{m-1}(log|f_1| wedge ... wedge log|f_m|).

**Unit tests.**

- `rForm_zero` (computation): r_0(f) = log|f|.
- `rForm_one` (computation): r_1(z wedge (1 - z)) = i dD(z) on C - {0, 1}.
- `rForm_const` (non-example): r_1(c wedge z) = i log|c| d arg z ≠ 0 for |c| ≠ 1: the form does not kill constants.
- `rForm_range` (characterisation): For m = 3 exactly j in {0, 1} occur, with c_{0,3} = 1/2 and c_{1,3} = 1/6, matching the displayed r_2 of Section 1, item 4.

**Acceptance.**

- r_1 = i eta and r_0 = log|.|.
- For m = 3 the coefficients are 1/2 and 1/6.

**Used by.**

- P.5's distributions: Theorem 2.4 extends r_{m-1} across the divisors
- P.5's Chow dilogarithm: the case m = 3
- P.5's weight-two regulator form: the case m = 2

**Depends on.** libraries: `mathlib:exteriorPower.alternatingMapLinearEquiv`, `mathlib:Complex.log`, `mathlib:Complex.arg`.

**Used in this roadmap by.** `P.5/weight-two-regulator-form`, `P.5/chow-dilogarithm`, `P.5/r-forms-and-distributions`, `P.5/simplex-form`, `P.5/weight-three-curve-regulator`, `P.5/r-wang-comparison`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GoncharovRegulator`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 2, item 4, (13) (PDF p. 14): “r_{m-1}(f_1,..., f_m) := Alt_m sum_{j>=0, 2j+1<=2m+1} c_{j,m} log|f_1| d log|f_2| wedge ... wedge d log|f_{2j+1}| wedge d i arg f_{2j+2} wedge ... wedge d i arg f_m, where c_{j,m} = 1/((2j+1)!(m-2j-1)!)” — The definition, with the range corrected (E10).
- `Gonch.Arakelov.2004`, Section 2, item 4, (14) (PDF p. 14): “So rm-1(f1, ..., fm) is an R(m - 1)-valued (m - 1)-form and it is easy to check that drm-1(f1, ..., fm) = pi_m(d log f1 wedge ... wedge d log fm) (14)” — The values and the differential.

### The forms r_{m-1} and the distributions they define

`P.5/r-forms-and-distributions` · theorem · first packet

Let Y be an irreducible subvariety of a smooth complex variety X and f_1, ..., f_m in C(Y)^x. For every smooth compactly supported form omega on X(C), the integral of r_{m-1}(f_1, ..., f_m) wedge omega over the smooth locus of Y(C) off the divisors converges. Hence r_{m-1} defines a current r_{m-1}(f_1 wedge ... wedge f_m) on X(C), of degree m - 1 + 2 codim_X Y (the printed degree m - 1 is source issue E14), and the assignment is a homomorphism out of Lambda^m C(Y)^x.

**Hypotheses.**

- X is a smooth complex variety and Y an irreducible subvariety; the functions are nonzero rational functions on Y.
- Currents on X(C) are a gap: the pinned Mathlib has distributions on open subsets of normed spaces (mathlib:Distribution, mathlib:TestFunction) and no currents on complex manifolds.

**Proof.**

1. Reduce, by embedded resolution of singularities (Goncharov Theorem 2.6; AlgebraicModuliForArithmeticGeometry R09.7), to Y smooth projective and the divisors of the f_i with normal crossings.
2. Prove Lemma 2.5: on a smooth projective Y the integral converges, by the logarithmic growth of the factors.
3. Conclude that the form defines a current by pairing with test forms, and that the assignment is additive in each argument and alternating (P.5/r-form).

**Acceptance.**

- For m = 3 and Y a curve the current is the one integrated in the Chow dilogarithm.
- For m = 1, r_0(f) = log|f| is locally integrable on Y.

**Depends on.** this roadmap: `P.5/r-form`; stages: `AlgebraicModuliForArithmeticGeometry:R09.7`; libraries: `mathlib:exteriorPower.alternatingMapLinearEquiv`, `mathlib:MeasureTheory.integral`, `mathlib:Distribution`, `mathlib:TestFunction`.

**Used in this roadmap by.** `P.5/chow-dilogarithm`, `P.5/r-form-differential`, `P.5/regulator-map-on-higher-chow`, `P.5/chow-polylogarithm-forms`, `P.5/weight-three-pairing`, `P.5/r-wang-comparison`, `P.5/cubical-regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem 2.4 with Lemma 2.5, (18) (PDF p. 15): “Let Y be an arbitrary irreducible subvariety of a smooth complex variety X and f_1, ..., f_m in C^*(Y). Then for any smooth differential form omega with compact support on X(C) the following integral is convergent ... It provides a group homomorphism r_{m-1}: Lambda^m C(Y)^* -> D^{m-1}_{X(C)}(m-1).” — The convergence and the homomorphism; the degree printed in (18) is source issue E14.

**Assembly note.** The currents are those of `P.5/manifold-currents` on the test forms of `P.5/compact-test-forms`, and the cycle currents δ_Y are `P.5/analytic-cycle-current`. The first packet's gap on currents is answered by these nodes, up to the global-form interface requested from ComplexComparisonPartII C5 and the El Mir and support theorems (the P.5 part's gap 2).

### The residue on a normal variety

`P.5/residue-map` · construction · first packet

For a normal complex variety X, Res : Lambda^n C(X)^x → direct sum over the irreducible divisors Y of X of Lambda^{n-1} C(Y)^x is the sum of the residues of P.3/exterior-residue for the discrete valuations of the local rings of the divisors; for a non-normal subvariety Goncharov defines r_{n-2} o Res through the normalisation ((22), ii).

**Hypotheses.**

- X is a normal complex variety.

**Construction.**

1. For each irreducible divisor Y the local ring O_{X,Y} is a discrete valuation ring with residue field C(Y); apply P.3/exterior-residue.
2. Only finitely many divisors contribute, those in the support of the f_i.

**API.**

- `varietyResidue` (constructor): Res = sum_Y res_Y.
- `varietyResidue_finite` (characterisation): Only finitely many divisors contribute.
- `varietyResidue_normalization` (compatibility): The definition through the normalisation for non-normal subvarieties.

**Unit tests.**

- `res_line` (computation): X = A^1, Res(z wedge c) = c at the divisor 0 for a constant c.
- `res_units` (degenerate): Res(c wedge c') = 0 for constants.
- `res_curve_agrees` (compatibility): For a curve, Res is the total residue of P.5/curve-polylogarithmic-complex on Lambda^n.

**Acceptance.**

- Res(z wedge c) = c at 0 on A^1.

**Used by.**

- P.5's differential of the currents: Res is the residue term of Proposition 2.8
- P.5's regulator on the higher Chow complex: the chain-map proof passes through Res

**Depends on.** this roadmap: `P.3/exterior-residue`; libraries: `mathlib:AlgebraicGeometry.Scheme`.

**Used in this roadmap by.** `P.5/r-form-differential`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GoncharovRegulator`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 2, item 6 (PDF p. 18): “Let X be a normal variety. Then there is the residue homomorphism Res : Lambda^n C(X)* -> direct sum over Y in X^(1) of Lambda^{n-1} C(Y)*, where the sum is over all irreducible divisors of X.” — The residue, as displayed.

### The differential of the currents r_{n-1}

`P.5/r-form-differential` · theorem · first packet

For Y a subvariety of a regular complex variety X and f_1 wedge ... wedge f_n in Lambda^n C(Y)^x, as currents on X(C): d r_{n-1}(f_1 wedge ... wedge f_n) = pi_n(dlog f_1 wedge ... wedge dlog f_n) + 2π i eps_n (r_{n-2} o Res)(f_1 wedge ... wedge f_n) (Proposition 2.8 with Lemma 2.7). With Goncharov's residue convention res_v(π wedge u) = u-bar the printed sign eps_n = 1 is wrong at n = 2, where eps_2 = -1 (source issue E21); the sign for general n is to be fixed against Burgos Gil-Feliu-Takeda Section 5 (gap).

**Hypotheses.**

- X regular; currents on X(C) (gap).

**Proof.**

1. Lemma 2.7: the formula is compatible with blow-ups, so one may assume normal crossings.
2. Near a component of the divisors, integrate by parts and use the Poincare-Lelong formula 2 d d^c log|f| = 2π i delta(f) (17) (gap: not in Mathlib).

**Acceptance.**

- n = 2, X = P^1, f = z, g = c: r_1(z wedge c) = -i log|c| d arg z, so d r_1 = -2π i log|c| (delta_0 - delta_infinity), while the printed right side is +2π i log|c| (delta_0 - delta_infinity).

**Depends on.** this roadmap: `P.5/r-forms-and-distributions`, `P.5/residue-map`; stages: `AlgebraicModuliForArithmeticGeometry:R09.7`.

**Used in this roadmap by.** `P.5/unramified-weight-two-class`, `P.5/simplex-form`, `P.5/regulator-map-chain-map`, `P.5/chow-dilogarithm-steinberg`.

**Sources.**

- `Gonch.Arakelov.2004`, Proposition 2.8, (24) (PDF p. 19): “Proposition 2.8 Let Y be an arbitrary subvariety of a regular complex variety X and f1 wedge ... wedge fn in Lambda^n C(Y)*. Then drn-1(f1 wedge ... wedge fn) = pi_n(d log f1 wedge ... wedge d log fn) + 2 pi i (rn-2 o Res)(f1 wedge ... wedge fn) (24)” — The formula; the sign is source issue E21.

**Assembly note.** BFT's normalised model fixes T_m = (−1)^m r_{m−1} (`P.5/r-wang-comparison`) and the top Deligne differential −2∂∂̄. Reconciling the sign ε_n of source issue E21 with that model in every degree is the P.5 part's gap 6.

### The form r_{m-1}(L; H) of a simplex

`P.5/simplex-form` · construction · first packet

Let L be a simplex in CP^m with faces L_0, ..., L_m and H a hyperplane in general position; choose coordinates (z_0 : ... : z_m) with L_i = {z_i = 0} and H = {z_1 + ... + z_m = z_0}. Then r_{m-1}(L; H) := r_{m-1}(z_1/z_0 wedge ... wedge z_m/z_0) (25), skew-symmetric in the faces, with d r_{m-1}(L; H) = pi_m(Omega_L) on CP^m - L and, as currents, d r_{n-1}(L; H) = pi_n(Omega_L) + 2π i sum_i (-1)^i r_{n-2}(L-hat_i; H_i) delta_{L_i} (Corollary 2.9, with the sign caveat of P.5/r-form-differential).

**Hypotheses.**

- L is a simplex in CP^m and H a hyperplane in general position with respect to it.

**Construction.**

1. Define through the coordinates and check independence of the choices made (the invariant definition through the functions f_i with (f_i) = L_i - L_0 and f_i(l_i) = 1).
2. Corollary 2.9 follows from P.5/r-form-differential.

**API.**

- `simplexForm` (constructor): r_{m-1}(L; H).
- `simplexForm_perm` (relation): Skew-symmetry under permutations of the faces.
- `simplexForm_d` (relation): d r_{m-1}(L; H) = pi_m(Omega_L) off L.
- `simplexForm_d_current` (relation): Corollary 2.9 as currents.

**Unit tests.**

- `simplexForm_one` (computation): m = 1: A^1 = P^1 - {1}, L = {0} u {∞}: r_0(L; {1}) = log|z|.
- `simplexForm_depends_on_H` (non-example): m = 1 with the hyperplane {lambda} in place of {1}: the form is log|z/lambda|, so r_{m-1}(L; H) depends on H.
- `simplexForm_perm` (characterisation): Exchanging two faces of L changes the sign of r_{m-1}(L; H).

**Acceptance.**

- For m = 1, r_0(L; {1}) = log|z|.

**Used by.**

- P.5's regulator on the higher Chow complex: the values are push-forwards of r_{i-1}(L; H)
- P.5's Chow polylogarithm: omega^q_p is the Radon transform of r_{p+q-1}(L; H)

**Depends on.** this roadmap: `P.5/r-form`, `P.5/r-form-differential`.

**Used in this roadmap by.** `P.5/regulator-map-on-higher-chow`, `P.5/regulator-map-chain-map`, `P.5/chow-polylogarithm-forms`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GoncharovRegulator`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 2, item 7, (25) and Corollary 2.9 (PDF pp. 19-20): “r_{m-1}(L; H) := r_{m-1}(z1/z0 wedge ... wedge zm/z0) (25) ... Corollary 2.9 One has dr_{n-1}(L; H) = pi_n(Omega_L) + 2 pi i sum_i (-1)^i r_{n-2}(L-hat_i; H_i) delta_{L_i} (26)” — The definition and its differential.

### The Chow polylogarithm: a chain of distributions on the spaces of cycles

`P.5/chow-polylogarithm-forms` · construction · planet “Chow polylogarithm” · first packet

Fix a simplex L in projective space of dimension p+q and a hyperplane H in general position. On the variety of codimension q effective cycles meeting all faces of L properly there is an explicitly constructed chain of distributions omega^q_p, defined as the Radon transform of the current r_{p+q-1}(L; H) of P.5/simplex-form along the incidence variety, with the constant fixed so that identity (i) holds as printed (source issue E13), satisfying three identities: the differential of omega^q_0 is the pullback of the standard form; the differential of omega^q_p is the alternating sum of the pullbacks of omega^q_{p-1} along the face maps; and the alternating sum of the pullbacks of omega^q_p along the projections from the vertices vanishes. On smooth cycles in general position the distribution is a real-analytic form. The collection is the q-th Chow polylogarithm, and the first two identities say exactly that it is a cocycle computing the Deligne cohomology of the truncated simplicial variety of cycles. The top member omega^q_{q-1}, the Chow q-logarithm function, is torus invariant and independent of H (Theorem 3.3); these two statements fail for p < q - 1 (Remark), while identity (iii) holds for every p. Equivalently (Theorem 3.4), for dim X = n the integral (2π i)^{1-n} integral_{X(C)} r_{2n}(f_1, ..., f_{2n+1}) does not change when one f_i is multiplied by a nonzero constant.

**Hypotheses.**

- L is a simplex in projective space of dimension p+q and H a hyperplane in general position with respect to it.
- The face maps are the intersections with the codimension-one faces and the vertex maps are the projections from the vertices, both defined on the open part where the projection keeps the codimension.
- The Radon transform is the push-forward along the second projection of the restriction to the incidence variety of the pull-back of the distribution; the push-forward is defined because that projection is proper.

**Construction.**

1. Form the incidence variety of pairs of a point and a cycle containing it, with its two projections.
2. Pull back the current r_{p+q-1}(L; H), restrict it to the incidence variety, which is legitimate by the convergence theorem, and push it forward along the proper projection; the normalising constant is 1 if identity (i) is to hold as printed (the printed r_{p+q} and (2π i)^{-q} are source issue E13).
3. Prove identity (i) by the definition.
4. Prove identity (iii) from the identity satisfied by the alternating sum of the wedge of the coordinate ratios, which is the lemma the source isolates.
5. Prove identity (ii) from the fact that the push-forward of distributions commutes with the De Rham differential.
6. Prove the real-analyticity of the restriction to smooth cycles in general position.
7. Record the interpretation: (i) and (ii) say that the chain is a 2q-cocycle in the complex computing the Deligne cohomology of the simplicial variety of cycles.

**API.**

- `chowPolylog` (data): The chain of distributions omega^q_p on the spaces of cycles.
- `chowPolylog_d_zero` (characterisation): The first identity, for p = 0.
- `chowPolylog_d` (characterisation): The second identity, relating the differential to the face maps.
- `chowPolylog_vertex` (characterisation): The third identity, for the projections from the vertices.
- `chowPolylog_analytic` (characterisation): Real-analyticity on smooth cycles in general position.
- `chowPolylogFunction` (projection): The top member, the Chow q-logarithm function.
- `chowPolylogFunction_torus_invariant` (characterisation): Torus invariance of the top member, hence independence of the hyperplane.
- `chowPolylog_reformulation` (characterisation): Theorem 3.4: for dim X = n, (2π i)^{1-n} integral_{X(C)} r_{2n}(f_1, ..., f_{2n+1}) is unchanged when one f_i is multiplied by a nonzero constant.

**Unit tests.**

- `q_two_is_chow_dilogarithm` (compatibility): For q = 2 the top member at a curve Y in P^3 is a constant multiple of the Chow dilogarithm of (Y; z_1/z_0, z_2/z_0, z_3/z_0), the constant fixed by the normalisation of source issue E13.
- `torus_invariance` (characterisation): The top member is invariant under the torus and independent of H.
- `not_invariant_below_top` (non-example): For p < q - 1 torus invariance fails (Remark after Theorem 3.3).
- `cocycle` (characterisation): Identities (i) and (ii) make the chain a 2q-cocycle in the complex computing H^{2q}(Z^q(L), R_D(q)).
- `p_zero` (degenerate): For p = 0, omega^q_0 = r_{q-1}(L; H) and d omega^q_0 = pi_q(Omega_L).

**Acceptance.**

- For q = 2 the top member at a curve Y in P^3 meeting the faces properly is a constant multiple of integral_{Y(C)} r_2(z_1/z_0 wedge z_2/z_0 wedge z_3/z_0), that is of the Chow dilogarithm.
- For p = 0 the construction reduces to the simplex form r_{q-1}(L; H).
- Identity (iii) holds for every p; torus invariance and independence of H hold only for p = q - 1 (Theorem 3.3 and its Remark).

**Used by.**

- P.5's Chow dilogarithm: The Chow dilogarithm is the case q = 2 of the top member and every functional equation it satisfies comes from the identities here.
- P.5's weight-three regulator: The weight-three curve regulator is the case q = 3, and its functional equations are the same identities.
- BorelRegulators: Restricting the top member to the planes in general position gives the Grassmannian polylogarithm, through which the source builds the Borel regulator; that construction is not planned here.

**Depends on.** this roadmap: `P.5/r-forms-and-distributions`, `P.5/simplex-form`; libraries: `mathlib:MeasureTheory.integral`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GoncharovRegulator`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem-Construction 3.1, identities (i), (ii), (iii) (PDF p. 26): “For given q >= 0 there is an explicitly constructed chain of (q-p-1)-distributions omega^q_p = omega^q_p(L; H) on Z^q_p(L) such that i) d omega^q_0(L,H) = pi_q(Omega_L); ii) d omega^q_p(L; H) = sum_i (-1)^i a_i^* omega^q_{p-1}(L; H_i); iii) sum_j (-1)^j b_j^* omega^q_p(L; H) = 0.” — The construction with its three identities, verbatim.
- `Gonch.Arakelov.2004`, Section 3, after Theorem-Construction 3.1 (PDF p. 26): “The varieties Z^q_p(L) for p >= 0 form a truncated simplicial variety Z^q_bullet(L). The conditions i) and ii) just mean that the sequence of forms omega^q_p is a 2q-cocycle in the complex computing the Deligne cohomology H^{2q}(Z^q_bullet(L), R_D(q)).” — The cocycle interpretation, verbatim.
- `Gonch.Arakelov.2004`, Theorem 3.3, the Remark after it, and Theorem 3.4 (PDF pp. 27-28): “Theorem 3.3 The Chow polylogarithm function is invariant under the natural action of the torus (C*)^{p+q} on Z^q_p(C). In particular it does not depend on the choice of the hyperplane H. Remark. The statements of Theorem 3.3 are no longer true for the forms omega^q_p for p < q - 1.” — The torus invariance of the top function and the warning that it is special to it, verbatim.

**Assembly note.** The spaces of cycles are `P.5/admissible-chow-locus`, built on the Chow parameter spaces requested from AlgebraicModuliForArithmeticGeometry R09.2. The Radon transform needs a resolved, locally integrable pull–push through an incidence family that may be singular (the P.5 part's gap 3).

### Compactly supported test forms

`P.5/compact-test-forms` · definition · P.5 part

For a second countable smooth oriented real m-manifold M, TestForms^k(M) consists of smooth sections of Λ^k T* M with compact support. Its topology is the locally convex inductive limit over compact K of the Fréchet spaces of sections supported in K, with all coordinate derivative seminorms. Complexification gives complex test forms; complex manifolds have their canonical orientation. Extension by zero is defined for an open embedding only for support compactly contained in that open.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Import global smooth differential forms and their exterior derivative from the early analytic interface requested of C5.
2. Construct fixed-support seminorms chartwise, prove equivalence under changes of finite chart cover, and take the LF inductive limit.
3. In a single finite-dimensional chart use Mathlib TestFunction with alternating-form coefficients; prove extension-by-zero is continuous.

**API.**

- `TestForms.ext` (extensionality): Equality of sections at every point implies equality.
- `TestForms.chart` (compatibility): On an open finite-dimensional normed-space chart, k-forms identify with TestFunction with continuous alternating-map coefficients, with the same LF topology.
- `TestForms.extendZero` (functoriality): Open embeddings give continuous extension by zero; identity and composition hold when the support is compactly contained.
- `TestForms.d` (data): Exterior derivative is a continuous map TestForms^k→TestForms^(k+1), with square zero.

**Unit tests.**

- `TestForms.empty` (degenerate): TestForms^k of the empty manifold is zero.
- `TestForms.chart_scalar` (compatibility): Degree-zero real test forms on Ω are Mathlib TestFunction Ω R ∞, including its topology.
- `TestForms.support_escape` (non-example): Bump functions translated to disjoint balls escaping every compact subset of R do not converge to zero in the test LF topology, although they converge to zero in the compact-open smooth topology.

**Acceptance.**

- The LF topology, rather than the topology induced from all smooth forms, controls the dual.

**Used by.**

- DEM I §2.B: The correct continuous dual defines currents.
- BFT §2.2: Normalised currents test complementary-degree compact forms.

**Depends on.** stages: `ComplexComparisonPartII:C5`; libraries: `mathlib:TestFunction`, `mathlib:TestFunction.ext`, `mathlib:TestFunction.continuous_iff_continuous_comp`.

**Used in this roadmap by.** `P.5/manifold-currents`.

**Library.** module `TauCeti/Analysis/Currents/TestForms`, namespace `TauCeti.CurveRegulator`, declaration `TestForms`.

**Suggested Lean.** Signature omitted: absent carrier: global smooth differential-form bundle, compact-support LF topology and manifold chart gluing (early C5).

**Sources.**

- `DEM`, Chapter I §2.A, pp. 13–14: “seminorms” — The fixed-compact seminorms and inductive-limit topology.

### Currents on complex manifolds

`P.5/manifold-currents` · construction · planet “Currents” · P.5 part

On an oriented m-manifold M define a degree-q current as a continuous linear functional on TestForms^(m-q)(M), with real or complex coefficients as specified. Set dT(φ)=(-1)^(q+1)T(dφ). On a complex d-manifold this decomposes as ∂+bar∂ and has bidegrees (p,q). Locally L1 forms α define [α](φ)=∫ α∧φ. Pushforward exists for smooth maps proper on the support, with degree changed by the dimension difference; use holomorphic maps, whose real dimension difference is even, so d commutes. Pullback of arbitrary currents is restricted to submersions (and open embeddings); multiplication is by smooth forms, not by arbitrary currents.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Take the continuous dual of complementary-degree test forms.
2. Use chart coefficient decompositions into scalar Distribution; dualise d to obtain the signed differential and type decomposition.
3. Define proper-support pushforward by test-form pullback and submersion pullback by local fibre integration; verify chart independence and graded smooth multiplication.

**API.**

- `ManifoldCurrent.ext` (extensionality): Agreement on all test forms implies equality.
- `ManifoldCurrent.ofForm` (constructor): Locally L1 coefficients yield the integral current, additive and invariant under almost-everywhere equality.
- `ManifoldCurrent.d_apply` (simp): dT(φ)=(-1)^(degree T+1)T(dφ); d²=0.
- `ManifoldCurrent.pushforward` (functoriality): For holomorphic maps proper on support, pushforward is functorial and commutes with d, ∂ and bar∂.
- `ManifoldCurrent.pullback` (functoriality): Submersions admit pullback, with identity/composition and compatibility with smooth forms.
- `ManifoldCurrent.chart_top` (compatibility): A top-degree current in an oriented real chart is a scalar Mathlib Distribution under the complementary-degree-zero test-form identification.

**Unit tests.**

- `ManifoldCurrent.dirac` (computation): The top-degree Dirac current δx evaluates a scalar test function at x, agreeing with Distribution.delta.
- `ManifoldCurrent.derivative_sign` (compatibility): The derivative of a scalar chart distribution evaluates φ as -T(∂vφ), agreeing with Distribution.lineDerivCLM.
- `ManifoldCurrent.no_arbitrary_product` (non-example): The product δ0·δ0 has no canonical product in this API; smoothing δ0 by scale ε gives squares whose mass grows like ε^(-m).

**Acceptance.**

- On C, d(darg z)=2πδ0 in the positive complex orientation.

**Used by.**

- G05 Theorem 2.4 and Definition 2.11: Logarithmic forms on resolutions are pushed to currents on X.
- BFT §6: Proper projection and differential identities define regulator maps.

**Depends on.** this roadmap: `P.5/compact-test-forms`; libraries: `mathlib:Distribution`, `mathlib:Distribution.ofFun`, `mathlib:Distribution.lineDerivCLM`.

**Used in this roadmap by.** `P.5/analytic-cycle-current`, `P.5/current-resolution`, `P.5/poincare-lelong`, `P.5/logarithmic-current-estimate`.

**Library.** module `TauCeti/Analysis/Currents/Basic`, namespace `TauCeti.CurveRegulator`, declaration `ManifoldCurrent`.

**Suggested Lean.** Signature omitted: absent carrier: global TestForms continuous dual, differential/type grading, proper-support pushforward and submersion pullback.

**Sources.**

- `DEM`, Chapter I §2.B–C, pp. 14–18: “currents” — Duality, derivatives, local coefficient distributions and admissible operations.

### Integration currents of analytic cycles

`P.5/analytic-cycle-current` · construction · P.5 part

For a pure-dimensional closed complex analytic subset Y of a complex d-manifold X, integrate complementary test forms over Yreg with its complex orientation. This is locally finite and defines the closed current [Y]raw of bidegree (c,c), c=codim Y. Extend additively to integral cycles. Whenever a proper resolution of Y is supplied, it equals pushforward of its integration current; for algebraic cycles such resolutions are constructed by R09.7, and the normalised BFT current is δY=(2πi)^(-(d-c))[Y]raw.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Local finite ramified projections bound the mass near the singular locus (Demailly III Lemma 2.6).
2. Use positivity and the locally complete pluripolar singular locus to apply El Mir’s finite-mass extension theorem (Demailly III Theorem 2.3, pp. 139–140), as in III Theorem 2.7. The positive-current/pluripolar extension interface is an explicit unresolved P.5 input in the analytic-foundations gap; mere local integrability does not prove closedness.
3. For a resolution use change of variables away from a measure-zero analytic subset and proper pushforward.

**API.**

- `CycleCurrent.add` (simp): The current of Z+W is the sum of currents.
- `CycleCurrent.resolution` (compatibility): A proper resolution computes the same raw integration current.
- `CycleCurrent.closed` (characterisation): The integration current of a closed analytic cycle is d-closed.
- `CycleCurrent.bft` (coercion): In complex dimension d and codimension c the normalised current is (2πi)^(-(d-c)) times the raw current.

**Unit tests.**

- `CycleCurrent.point` (computation): In a complex curve the BFT current of a point is the ordinary Dirac current.
- `CycleCurrent.multiplicity` (computation): The current of div(z^r) on C is rδ0 for r a positive integer.
- `CycleCurrent.whole_space` (compatibility): For c=0, δX=(2πi)^(-d)[X]raw=[1] in BFT conventions.

**Acceptance.**

- Multiplicity is retained for a nonreduced divisor.

**Used by.**

- BFT §2.2 and Lemma 6.1: The degree-zero regulator is the cycle current.
- Green presentation: The Green equation uses integration over the cycle.

**Depends on.** this roadmap: `P.5/manifold-currents`; other roadmaps: `ComplexComparisonPartII:C0/repair-analytification`; stages: `AlgebraicModuliForArithmeticGeometry:R09.7`.

**Used in this roadmap by.** `P.5/poincare-lelong`, `P.5/admissible-chow-locus`, `P.5/green-presentation`, `P.5/bft-current-dictionary`, `P.5/cubical-regulator`.

**Library.** module `TauCeti/Analysis/Currents/AnalyticCycles`, namespace `TauCeti.CurveRegulator`, declaration `CycleCurrent`.

**Suggested Lean.** Signature omitted: absent carrier: analytic cycle carrier with dimensions/multiplicities and global current integration; C0 analytic-space and R09.7 algebraic resolution interfaces.

**Sources.**

- `DEM`, Chapter III §2.B, Lemma 2.6 and Theorem 2.7, p. 140: “finite mass” — Convergence and closedness of integration currents.
- `DEM`, Chapter III §2.A, Theorem 2.3 (El Mir), pp. 139–140: “closed positive current” — Finite mass and complete pluripolarity are the non-routine extension inputs to the cited proof of Theorem 2.7.

### Smooth forms and current cohomology

`P.5/current-resolution` · theorem · P.5 part

On a second countable smooth oriented manifold the inclusion of smooth forms into currents is a quasi-isomorphism of de Rham sheaf complexes. On a complex manifold the same inclusion is a quasi-isomorphism for each Dolbeault complex, compatibly with type and conjugation. Consequently the smooth and current Dolbeault models of real Deligne theory agree after the M.8 comparison is supplied.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Regularise chart currents by smoothing kernels and use the compactly supported homotopy to show a closed current is locally cohomologous to a smooth form.
2. Apply the Poincaré lemma for currents in positive degrees and equality of locally constant degree-zero kernels.
3. For bar∂ use the Bochner–Martinelli/Koppelman homotopy and its distributional limit; fine sheaves globalise the local quasi-isomorphisms.

**Acceptance.**

- On a star-shaped chart, every d-closed current of positive degree is locally exact; degree zero retains constants.

**Depends on.** this roadmap: `P.5/manifold-currents`; stages: `ComplexComparisonPartII:C5`.

**Used in this roadmap by.** `P.5/logarithmic-current-estimate`, `P.5/green-current-comparison`, `P.5/bft-current-dictionary`.

**Library.** module `TauCeti/Analysis/Currents/Dolbeault`, namespace `TauCeti.CurveRegulator`, declaration `currentResolution`.

**Suggested Lean.** Signature omitted: absent carrier: global de Rham/Dolbeault sheaf complexes of forms and currents, their cohomology and inclusion.

**Sources.**

- `DEM`, Chapter I §2.D.3–4, Theorem 2.24, pp. 19–20; §3.E, Lemma 3.29, pp. 28–29: “regularization” — Both local de Rham and Dolbeault resolutions are established.

### Poincaré–Lelong formula

`P.5/poincare-lelong` · theorem · planet “Poincaré–Lelong formula” · P.5 part

For a meromorphic function f on a complex manifold which does not vanish identically on any connected component, log|f| is locally L1 and (i/π)∂bar∂[log|f|]=[div f]raw. Define dd^c=(i/π)∂bar∂; this is equivalently bar∂∂[log|f|]=πi[div f]raw. On a complex curve d[darg f]=2π[div f]raw. The BFT degree-one Deligne differential is -2∂bar∂, hence d_D[-log|f|]=-δdiv f with its dimension/twist normalisation.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Prove the one-variable logarithm identity on a punctured disk by Stokes and the positive circle integral 2π.
2. Factor f at regular divisor points; units contribute no divisor current.
3. Extend across codimension at least two using Demailly III Theorem 2.10 and Corollary 2.11 for normal currents (order-zero current and derivative), after establishing the required order-zero property; apply linearity for meromorphic f. The missing local support/normality interface is recorded in the analytic-foundations gap.

**Acceptance.**

- dd^c log|z|=δ0 and dd^c(-log|z|)+δ0=0.
- The displayed bar∂∂ order matches the published G05 equation (38); replacing it by ∂bar∂ reverses the sign.

**Depends on.** this roadmap: `P.5/analytic-cycle-current`, `P.5/manifold-currents`.

**Used in this roadmap by.** `P.5/logarithmic-green-forms`, `P.5/elliptic-fourier-comparison`, `P.5/wang-boundary-currents`.

**Library.** module `TauCeti/Analysis/Currents/PoincareLelong`, namespace `TauCeti.CurveRegulator`, declaration `poincareLelong`.

**Suggested Lean.** Signature omitted: absent carrier: meromorphic functions/divisors on a complex manifold and typed global ∂,bar∂ current operators; only the scalar chart Laplacian is prototyped.

**Sources.**

- `DEM`, Chapter III §2.C, Theorem 2.15, pp. 143–144: “meromorphic” — The local integrability and divisor identity with i/π.
- `DEM`, Chapter III §2.C, Theorem 2.10 and Corollary 2.11, p. 141: “normal current” — The singular-locus extension uses the normal-current support theorem with its dimension and order-zero hypotheses.

### Admissible cycle parameter spaces

`P.5/admissible-chow-locus` · construction · P.5 part

Given P^N over C, finitely many specified simplex faces L_I and a general-position hyperplane H, let U_(c,e) be the open locus in the requested degree-e, codimension-c Chow parameter space whose cycles meet every L_I properly and have no irreducible component contained in H where the coordinate-ratio construction requires this (the zero cycle satisfies this condition vacuously). The analytic parameter space Z^c is the disjoint union over e≥0 of these finite-dimensional loci. Its incidence cycle has a proper projection to the parameter space. Face intersection maps and vertex projection maps exist only on the loci where they preserve the prescribed dimensions; their target degree is recorded.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Request the general Chow parameter space, universal incidence cycle and upper semicontinuity of fibre dimensions as R09.2 Part II; Hilbert/Quot representability alone does not supply them.
2. Express failure of proper face intersection by the relevant fibre-dimension closed loci and take their complement.
3. Restrict the incidence cycle and the dimension-preserving projection domains; the projective incidence projection is proper. This supplies the missing carrier of the parent Chow-polylogarithm construction.

**API.**

- `AdmissibleChowLocus.points` (characterisation): Complex points represent effective cycles of the fixed degree with all required proper face intersections.
- `AdmissibleChowLocus.incidence` (data): The incidence cycle projects properly to each finite-degree locus.
- `AdmissibleChowLocus.face` (functoriality): Proper intersection with a specified face induces its cycle map and respects iterated faces on the common domain.
- `AdmissibleChowLocus.vertex` (functoriality): Projection from a vertex is defined only when dimension and codimension are preserved; no unrestricted map is exported.

**Unit tests.**

- `AdmissibleChowLocus.zero` (degenerate): The degree-zero component consists of the zero cycle and has empty incidence cycle.
- `AdmissibleChowLocus.line` (computation): For lines in P², each line distinct from every fixed one-dimensional face and avoiding every vertex meets all faces properly.
- `AdmissibleChowLocus.face_line` (non-example): A line equal to a one-dimensional face fails proper intersection with that face and is excluded.

**Acceptance.**

- A line contained in a simplex face is excluded; a transverse line is included.

**Used by.**

- Polylogarithms:P.5/chow-polylogarithm-forms: Provides its parameter spaces and the proper incidence projection; the already planned Radon transform is imported.

**Depends on.** this roadmap: `P.5/analytic-cycle-current`; other roadmaps: `ComplexComparisonPartII:C0/repair-analytification`; stages: `AlgebraicModuliForArithmeticGeometry:R09.2`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/AdmissibleParameters`, namespace `TauCeti.CurveRegulator`, declaration `AdmissibleChowLocus`.

**Suggested Lean.** Signature omitted: absent carrier: R09.2 Part II Chow parameter/incidence cycle carrier, admissible face loci and their cycle maps.

**Sources.**

- `G05`, Section 3.1, p. 22, notation Z^q_p(L): “varieties” — The source describes the cycle parameter spaces and incidence construction.

### Logarithmic Green forms

`P.5/logarithmic-green-forms` · definition · P.5 part

For smooth projective complex X, a codimension-p cycle z and Y=supp z, a logarithmic Green form is a real Deligne support representative (ω,g) of cl(z) in degree 2p: ω is smooth on X, g is smooth on X\Y, and g pulls back on an embedded resolution of (X,Y) to a logarithmic form along a normal-crossings divisor. Representatives are taken modulo the support-complex boundaries, retaining the support class, not merely the off-support equation d_Dg=ω. A basic representative has g=Σλj αj+β on a resolution, with λj divisor Green functions, αj smooth of type (p-1,p-1), restrictions ∂ and bar∂ closed, and β smooth.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Request M.8 support Deligne classes and its logarithmic Dolbeault model; restrict to classes of cycles.
2. Use the weight-one representative and integration by parts to absorb differentiated logarithms into ∂/bar∂ boundary terms (Burgos II Lemma 4.5).
3. Impose the support class to pin the divisor residue coefficient; retain the resolution-independence proof via common refinements.

**API.**

- `LogGreenForm.class` (projection): The support Deligne class is cl(z), with the specified Tate twist.
- `LogGreenForm.basic` (constructor): Every Green-form class has a basic logarithmic representative as stated.
- `LogGreenForm.refine` (compatibility): Passing to a common resolution does not change its class.
- `LogGreenForm.change` (relation): Adding a support-complex boundary changes the representative but not its Green-form class.

**Unit tests.**

- `LogGreenForm.principal` (computation): For a rational function f, (0,-log|f|) is the Green representative for div f in BFT conventions.
- `LogGreenForm.zero` (degenerate): The zero cycle admits the zero pair.
- `LogGreenForm.residue_required` (non-example): On P¹ the zero form on the complement of a nonzero point satisfies d_Dg=0 there but is not a Green representative for that point: its support class is zero.

**Acceptance.**

- A pair with zero off-support curvature can still carry a nonzero support class.

**Used by.**

- BFT §6.3, equations (6.6)–(6.9): Controls local integrability and the precise cycle residue in products with Wm.

**Depends on.** this roadmap: `P.5/poincare-lelong`; stages: `AlgebraicModuliForArithmeticGeometry:R09.7`.

**Used in this roadmap by.** `P.5/logarithmic-current-estimate`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GreenCurrents`, namespace `TauCeti.CurveRegulator`, declaration `LogGreenForm`.

**Suggested Lean.** Signature omitted: absent carrier: early M.8 support Deligne classes and logarithmic representatives on embedded resolutions.

**Sources.**

- `BUR`, Chapter II Definition 4.2 and Lemma 4.5, pp. 79–81: “basic” — Support classes give logarithmic representatives with controlled singularities.

### Logarithmic current integrability and residues

`P.5/logarithmic-current-estimate` · theorem · P.5 part

Let Y have codimension p in a complex manifold X, and let α be a degree-r logarithmic form along Y, defined through a resolution of (X,Y). If r<2p, α is locally L1. If r<2p-1, d[α]=[dα]. In the borderline Green degree, a basic Green representative (ω,g) of cl(z) satisfies d_D[g]+δz=[ω]. These conclusions apply to currents modulo those annihilating test forms vanishing along the boundary used by the normalised cubical model.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. In normal-crossings charts, a test form vanishing on the divisor supplies one radial factor in each singular variable, leaving integrals of powers of log r against dr finite.
2. Duality with test forms vanishing on Y shows a possible residue annihilates them; such currents vanish below real degree 2p.
3. For a basic Green form compute the remaining exceptional-divisor residue by Stokes; the support class fixes its coefficient to the cycle, and higher-dimensional exceptional fibres contribute zero.

**Acceptance.**

- d(darg z)=2πδ0 shows the strict inequality r<2p-1 cannot be replaced by r≤2p-1.

**Depends on.** this roadmap: `P.5/logarithmic-green-forms`, `P.5/manifold-currents`, `P.5/current-resolution`.

**Used in this roadmap by.** `P.5/green-current-comparison`, `P.5/integration-comparison`, `P.5/green-wang-product`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GreenCurrents`, namespace `TauCeti.CurveRegulator`, declaration `logarithmicCurrentEstimate`.

**Suggested Lean.** Signature omitted: absent carrier: logarithmic form weight filtration, resolution pullback, local integrability and current residue on a global manifold.

**Sources.**

- `BUR`, Chapter II Proposition 3.1, Corollary 3.8, pp. 73–78, and proof of Theorem 4.3, pp. 80–82: “integrable” — Precise codimension bound and basic-representative residue calculation.

### Green forms give Green currents

`P.5/green-current-comparison` · comparison · P.5 part

For smooth projective complex X and a codimension-p cycle z, the map from logarithmic Green-form classes for z to Green current classes for z is an isomorphism. In BFT conventions its image satisfies d_D[g]+δz=[ω]; in unscaled conventions dd^c[g]+[z]raw is smooth. The map respects addition and pullback along morphisms for which the cycle pullback is defined and codimension p is preserved. No pullback of an arbitrary current is asserted.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Local integrability and the residue theorem show a representative produces a Green current.
2. Both spaces are affine spaces over smooth (p-1,p-1) forms modulo ∂ and bar∂ images; the current/smooth comparison identifies the translation spaces.
3. Use basic representatives and resolution changes to verify allowed pullbacks and independence of representatives.

**Acceptance.**

- A constant Green function for the zero divisor survives before principal rational-function relations are imposed.

**Depends on.** this roadmap: `P.5/logarithmic-current-estimate`, `P.5/current-resolution`.

**Used in this roadmap by.** `P.5/green-presentation`, `P.5/green-wang-product`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GreenCurrents`, namespace `TauCeti.CurveRegulator`, declaration `greenCurrentComparison`.

**Suggested Lean.** Signature omitted: absent carrier: logarithmic Green-form quotient, current ∂/bar∂ quotient and their translation spaces.

**Sources.**

- `BUR`, Chapter II Theorem 4.3(1),(3) and its proof, pp. 79–83: “isomorphism” — The source proves the comparison as an affine-space isomorphism.

### Green current cycle classes

`P.5/green-presentation` · definition · planet “Green current classes” · P.5 part

For a smooth projective complex X and p≥1, define GreenCH^p(X) as the abelian group of pairs (z,g), z an integral codimension-p cycle and g a real (p-1,p-1) raw current, with dd^c g+[z]raw smooth, modulo (0,∂u+bar∂v) with the required real condition and principal pairs (div_Y f,-ιY*log|f|), where Y has codimension p-1 and the pushforward uses a resolution if Y is singular. Here dd^c=(i/π)∂bar∂=bar∂∂/(πi). This is the degree-zero complex-variety presentation of G05 equation (38), which was equation (36) in the preprint; it does not define arithmetic Chow groups of an arbitrary arithmetic ring.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Use Poincaré–Lelong on the normalisation/resolution of Y to show every principal pair satisfies the Green condition with zero curvature.
2. The Green condition is additive; quotient by the stated subgroup, retaining integral cycles and real current coefficients.
3. Correct the prose dimension labels in G05: z is a codimension-p cycle and Y has codimension p-1, not invariably divisors.

**API.**

- `GreenCH.mk` (constructor): A pair satisfying the Green condition determines a class.
- `GreenCH.forget` (projection): Forget the Green current to obtain CH^p(X), respecting principal relations.
- `GreenCH.curvature` (projection): Curvature dd^c g+[z]raw is a well-defined smooth closed (p,p) form on the quotient.
- `GreenCH.principal` (simp): The principal pair on every codimension-(p-1) Y has zero class.
- `GreenCH.current_boundary` (relation): Adding ∂u+bar∂v does not change the class.

**Unit tests.**

- `GreenCH.P1_principal` (computation): On P¹, ([0]-[∞],-log|z|) represents zero.
- `GreenCH.point` (degenerate): GreenCH^1(Spec C)=0: cycles vanish and principal pairs for constant f kill every real constant Green function.
- `GreenCH.positive_curvature` (non-example): A pair on P¹ with z=[0] and curvature integral one cannot be zero, whereas a principal pair has zero curvature.

**Acceptance.**

- For p=1 the principal relation is (div f,-log|f|).

**Used by.**

- Polylogarithms:P.5/higher-arakelov-chow-degree-zero: Supplies the missing explicit target group of the parent comparison.
- BFT Theorem 7.4: Gives the complex component of the degree-zero identification; arithmetic-field descent uses the involution separately.

**Depends on.** this roadmap: `P.5/green-current-comparison`, `P.5/analytic-cycle-current`; other roadmaps: `SchemeKTheoryOperations:S.4/coniveau-weight-one-differential`.

**Used in this roadmap by.** `P.5/gersten-green-assembly`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GreenCurrents`, namespace `TauCeti.CurveRegulator`, declaration `GreenCH`.

**Suggested Lean.** Signature omitted: absent carrier: integral cycle group, real (p-1,p-1) global currents, smooth curvature and principal-cycle relation subgroup.

**Sources.**

- `G05`, Section 2.10, equation (38), p. 21 (preprint equation (36)): “arithmetic” — The numerator, boundary subgroup and principal relations.

## P.5:curves — Curve symbols and reciprocity (proposed sub-layer)

Sixteen nodes: fifteen of the first packet and one of the P.5 part, with three planets. The curve complexes use P.3's residues; η(f, g) and the Chow dilogarithm use the forms r_1 and r_2 of P.5:currents. The P.5 part adds `P.5/curve-symbol-chern-comparison`, which identifies iΣ_j η(f_j, g_j) with the weight-two real Deligne regulator of a K_2 class with vanishing tame symbols, in M.8's normalisation ch_{i,j} = (−1)^{j−1}c_{i,j}/(j − 1)!. Strong reciprocity is a conjecture in general and stays one; its proved cases keep their hypotheses (modulo 6-torsion on ℙ¹, rationally over ℚ̄).

### The low-weight polylogarithmic complexes of a curve

`P.5/curve-polylogarithmic-complex` · construction · planet “Curve polylogarithmic complexes” · first packet

Let X be a smooth curve over an infinite field k, with function field F and closed points x with residue fields k(x). For n = 2, 3 the weight-n polylogarithmic complex of X is the cone of the total residue Res = sum_x res_x : B(F; n) → (direct sum over x of B(k(x); n - 1))[-1] (P.3/residues-and-transfers), shifted so that B(F; n) keeps its degrees; for each element only finitely many res_x are nonzero. A class of B(F; n) is unramified when all its residues vanish. Coefficients are rational, as in P.3; integrally the weight-two residue is a map of complexes only after inverting 2.

**Hypotheses.**

- X is a smooth curve over an infinite field k; for a proper X the closed points are the places of F over k (tauceti:TauCeti.Place).
- Coefficients are Q (weight two needs 2 inverted integrally).

**Construction.**

1. Import the complexes of the function field and of the residue fields (P.3/polylogarithmic-complex) and the residues (P.3/residues-and-transfers, P.3/exterior-residue).
2. For f in F^x only finitely many places have ord f ≠ 0 (tauceti:TauCeti.Place.finite_setOf_ord_ne_zero), so each element of B(F; n) has finitely many nonzero residues and Res lands in the direct sum.
3. Res is a map of complexes because each res_x is (P.3/residues-and-transfers).
4. Define the curve complex as the cone of Res, and the unramified classes as the kernel of Res on cohomology.
5. Prove functoriality for pull-back along a finite morphism of curves, with residues multiplied by ramification indices; push-forward needs transfers, which no source read constructs (gap).

**API.**

- `curvePolylogComplex` (data): The cone of Res, in weights two and three.
- `curveResidue` (constructor): Res = sum_x res_x.
- `curveResidue_finite` (characterisation): Only finitely many res_x of an element are nonzero.
- `unramifiedClasses` (data): The kernel of Res on cohomology.
- `curvePolylogComplex_map` (functoriality): Pull-back along a finite morphism, with ramification indices.

**Unit tests.**

- `res_P1` (computation): On P^1 over k = k-bar, for f = t and g = t - a (a ≠ 0): res_0(f wedge g) = -a, res_a(f wedge g) = a^{-1}, res_infinity(f wedge g) = 1, and all other residues are 1.
- `res_delta_two_torsion` (non-example): Integrally, res_v(delta_2{x}_2) = res_v((1 - x) wedge x) = (-1)^{v(x)} for v(x) < 0, while res_v{x}_2 = 0: there is no integral map of complexes in weight two.
- `curveResidue_finite` (characterisation): For an element of Lambda^2 F^x, the set of places with nonzero residue is finite (TauCeti.Place.finite_setOf_ord_ne_zero).
- `weil_product` (compatibility): On a proper curve over k = k-bar, for f, g in F^x the product of the weight-two residues res_x(f wedge g) is +-1 (Weil reciprocity, K2SymbolsBrauer:T.4/weil-reciprocity, through the tame-symbol comparison of P.3/exterior-residue).

**Acceptance.**

- For the projective line over an algebraically closed k the weight-three complex with its residue is the one Goncharov's Conjecture 6.2 is about.
- Only finitely many residues of a given element are nonzero.
- The residue of an element of B_n(F) in degree one vanishes for degree reasons, so that statement is not a test.

**Used by.**

- P.5's unramified weight-two classes: the regulator form of an unramified class is closed
- EllipticRegulators ER.2: the elliptic case specialises this construction
- P.5's strong reciprocity conjecture: the conjecture asks for a homotopy for Res in weight three

**Depends on.** this roadmap: `P.3/residues-and-transfers`, `P.3/polylogarithmic-complex`, `P.3/exterior-residue`; other roadmaps: `K2SymbolsBrauer:T.3/tame-symbol`; libraries: `tauceti:TauCeti.Place`, `tauceti:TauCeti.Place.ord`, `tauceti:TauCeti.Place.ResidueField`, `tauceti:TauCeti.Place.residueUnit`, `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`, `mathlib:CochainComplex.mappingCone`.

**Used in this roadmap by.** `P.5/weight-two-regulator-form`, `P.5/unramified-weight-two-class`, `P.5/strong-reciprocity-conjecture`, `P.5/weight-three-curve-regulator`, `P.5/general-weight-reciprocity-conjecture`.

**Library.** module `TauCeti/AlgebraicGeometry/Curves/RegulatorComplexes`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 6.1, (75) (PDF p. 52): “Let X be a regular curve over an algebraically closed field k and F := k(X)*. Set Res := sum_x resx where resx is the residue homomorphism for the valuation on F corresponding to a point x of X.” — The total residue on a curve, as displayed (F := k(X)* is source issue E15).

### The weight-two regulator form of a curve

`P.5/weight-two-regulator-form` · construction · planet “Weight-two regulator form” · first packet

For a smooth complex curve X and f, g in C(X)^x, eta(f, g) := log|f| d arg g - log|g| d arg f is a real 1-form on the complement of the zeros and poles, and r_1(f wedge g) = i eta(f, g) is the form of (13) with m = 2 (values in R(1)). It is bilinear and antisymmetric, so it defines a homomorphism on Lambda^2 C(X)^x; eta(c, g) = log|c| d arg g for a constant c; it is closed off the divisors; for g = 1 - f it is exactly f^*(dD): eta(f, 1 - f) = d(D o f) on X - f^{-1}{0, 1, ∞} ((85)); and as a current d eta(f, g) = 2π sum_x log|tame_x{f, g}| delta_x, with the tame symbol tame_x{f, g} = (-1)^{v(f)v(g)} f^{v(g)}/g^{v(f)} (x) of K2SymbolsBrauer T.3. If X, f and g are defined over R then F_infinity^* eta(f, g) = -eta(f, g). This is the general curve formula; EllipticRegulators ER.2 specialises it.

**Hypotheses.**

- X is a smooth complex curve; f and g are nonzero rational functions on X.
- Currents on X(C) (a gap: Mathlib has distributions on open subsets of normed spaces only).

**Construction.**

1. Define eta on the complement of the divisors and prove bilinearity and antisymmetry.
2. Closedness off the divisors: d eta = d log|f| wedge d arg g - d log|g| wedge d arg f, which is the real part of dlog f wedge dlog g, a (2,0)-form, and so vanishes on a curve.
3. The Steinberg identity is (85) composed with f.
4. The residue formula: near x write f = π^a u, g = π^b w and use d(d arg π) = 2π delta_x.
5. Conjugation: log|f| is invariant and d arg f changes sign.

**API.**

- `regulatorForm` (constructor): eta(f, g) := log|f| d arg g - log|g| d arg f.
- `regulatorForm_add_left` (relation): eta(f_1 f_2, g) = eta(f_1, g) + eta(f_2, g).
- `regulatorForm_antisymm` (relation): eta(g, f) = -eta(f, g).
- `regulatorForm_const` (simp): eta(c, g) = log|c| d arg g for a constant c.
- `regulatorForm_closed` (characterisation): d eta(f, g) = 0 off the divisors.
- `regulatorForm_steinberg` (relation): eta(f, 1 - f) = d(D o f).
- `regulatorForm_residue` (relation): d eta(f, g) = 2π sum_x log|tame_x{f, g}| delta_x as currents.
- `regulatorForm_conj` (relation): F_infinity^* eta(f, g) = -eta(f, g) for f, g defined over R.
- `regulatorForm_eq_rForm` (compatibility): r_1(f wedge g) = i eta(f, g).

**Unit tests.**

- `regulatorForm_steinberg` (characterisation): eta(z, 1 - z) = dD(z) on C - {0, 1}.
- `regulatorForm_const` (non-example): eta(c, z) = log|c| d arg z, nonzero for |c| ≠ 1.
- `regulatorForm_antisymm` (characterisation): eta(g, f) = -eta(f, g).
- `regulatorForm_residue_P1` (computation): On P^1, d eta(z, c) = -2π log|c| (delta_0 - delta_infinity).
- `regulatorForm_constants` (degenerate): eta(c, c') = 0 for constants c, c'.

**Acceptance.**

- eta(z, 1 - z) = dD(z) on C - {0, 1}.
- On P^1, eta(z, c) = -log|c| d arg z and d eta(z, c) = -2π log|c| (delta_0 - delta_infinity), matching tame_0{z, c} = 1/c and tame_infinity{z, c} = c.
- The form is antisymmetric in the two functions.
- The construction gives the form, not a class: classes are P.5/unramified-weight-two-class.

**Used by.**

- EllipticRegulators ER.2: specialises the form to an elliptic curve and fixes the factor of 2π and the orientation
- P.5's unramified weight-two classes: the form of an unramified element is closed and gives a period class
- P.5's weight-three curve regulator: alpha(f, g) = log|f| dlog|g| - log|g| dlog|f| is its companion

**Depends on.** this roadmap: `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-differential`, `P.5/r-form`, `P.5/curve-polylogarithmic-complex`; other roadmaps: `K2SymbolsBrauer:T.3/tame-symbol`; libraries: `mathlib:Complex.log`, `mathlib:Complex.arg`.

**Used in this roadmap by.** `P.5/unramified-weight-two-class`, `P.5/curve-symbol-chern-comparison`.

**Library.** module `TauCeti/AlgebraicGeometry/Curves/RegulatorComplexes`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 2, item 4, (13) with m = 2 (PDF p. 14): “r_{m-1}(f_1,..., f_m) := Alt_m sum_{j>=0, 2j+1<=2m+1} c_{j,m} log|f_1| d log|f_2| wedge ... wedge d log|f_{2j+1}| wedge d i arg f_{2j+2} wedge ... wedge d i arg f_m, where c_{j,m} = 1/((2j+1)!(m-2j-1)!)” — At m = 2 the alternation gives r_1(f wedge g) = i(log|f| d arg g - log|g| d arg f) = i eta(f, g); the printed range '2j+1 ≤ 2m+1' is source issue E10.
- `Gonch.Arakelov.2004`, proof of Lemma 6.9, (85) (PDF p. 57): “dL2(z) = - log |1 - z|d arg z + log |z|d arg(1 - z) (85)” — The Steinberg identity.

### Unramified weight-two elements give closed currents and period classes

`P.5/unramified-weight-two-class` · theorem · first packet

Let X be a smooth projective complex curve and xi = sum_i f_i wedge g_i in Lambda^2 C(X)^x with |tame_x(xi)| = 1 at every point x (in particular if xi is unramified, Res xi = 0). Then eta(xi) = sum_i eta(f_i, g_i) extends to a closed 1-current on X(C); its class in H^1(X(C), R) depends only on xi; for a 1-cycle gamma avoiding the supports, integral_gamma eta(xi) depends only on the class of gamma in H_1(X(C), Z); if X and the f_i, g_i are defined over R, F_infinity^* eta(xi) = -eta(xi), so the class lies in H^1(X(C), R)^-. The identification of this class with the Beilinson regulator in H^2_D(X, R(2)) = H^1(X(C), R(1)) is conditional on MotivicEtaleKTheory M.8 and P.5/regulator-induces-beilinson.

**Hypotheses.**

- X is a smooth projective complex curve; xi has residues of absolute value one.

**Proof.**

1. d eta(xi) = 2π sum_x log|tame_x(xi)| delta_x (regulatorForm_residue), which vanishes under the hypothesis, so eta(xi) is a closed current.
2. Closed currents define de Rham classes; the period over gamma depends only on its homology class by Stokes (currents gap).
3. The conjugation statement is regulatorForm_conj.

**Acceptance.**

- For X = P^1 and xi = z wedge c with c constant: d eta(xi) = -2π log|c| (delta_0 - delta_infinity), so eta(xi) is closed iff |c| = 1.

**Depends on.** this roadmap: `P.5/weight-two-regulator-form`, `P.5/r-form-differential`, `P.5/curve-polylogarithmic-complex`; other roadmaps: `K2SymbolsBrauer:T.3/tame-symbol`.

**Used in this roadmap by.** `P.5/curve-symbol-chern-comparison`.

**Sources.**

- `Gonch.Arakelov.2004`, Proposition 2.8, (24) (PDF p. 19), n = 2: “Proposition 2.8 Let Y be an arbitrary subvariety of a regular complex variety X and f1 wedge ... wedge fn in Lambda^n C(Y)*. Then drn-1(f1 wedge ... wedge fn) = pi_n(d log f1 wedge ... wedge d log fn) + 2 pi i (rn-2 o Res)(f1 wedge ... wedge fn) (24)” — On a curve pi_2(dlog f wedge dlog g) = 0, so d eta(xi) is supported on the residues.

**Assembly note.** Its identification with the real Deligne regulator of the K_2 class is `P.5/curve-symbol-chern-comparison`, in the normalisation of the early M.8 prefix (requested).

### The Chow dilogarithm

`P.5/chow-dilogarithm` · definition · planet “Chow dilogarithm” · first packet

For a smooth projective complex curve X define P_2(X; .) : Lambda^3 C(X)^x → R by P_2(X; f_1 wedge f_2 wedge f_3) := -(2π)^{-1} integral_{X(C)} r_2(f_1 wedge f_2 wedge f_3), where r_2 = Alt_3((1/6) log|f_1| dlog|f_2| wedge dlog|f_3| - (1/2) log|f_1| d arg f_2 wedge d arg f_3) is the real 2-form of (13) with m = 3; the integral converges (P.5/r-forms-and-distributions). With this normalisation P_2 = D o h in every proved case (Prop. 6.8; Prop. 6.18 with (93)); the printed normalisation (2π i)^{-1} integral r_2 of (6) and (74) is purely imaginary and equals i P_2 (source issue E12).

**Hypotheses.**

- X is a smooth projective complex curve; f_1, f_2, f_3 are nonzero rational functions on X.

**Construction.**

1. The integral converges by Theorem 2.4 (P.5/r-forms-and-distributions) with Y = X.
2. Multilinearity and alternation of r_2 give a homomorphism out of Lambda^3 (mathlib:exteriorPower.alternatingMapLinearEquiv).
3. Fix the constant -(2π)^{-1} by (93) with Proposition 6.18, or by the corrected Lemma 6.9 with Proposition 6.6; the reviewer's quadrature gives integral_C r_2((1 - z) wedge z wedge (z - a)) = -2π D(a) at two points.

**API.**

- `chowDilog` (constructor): The homomorphism Lambda^3 C(X)^x → R defined above.
- `chowDilog_const` (relation): chowDilog(c wedge g wedge g') = 0 for c in C^x (Theorem 3.4 with n = 1).
- `chowDilog_P1` (characterisation): On X = P^1: chowDilog(f_1 wedge f_2 wedge f_3) = sum v_{x_1}(f_1) v_{x_2}(f_2) v_{x_3}(f_3) D(r(x_1, x_2, x_3, ∞)) with r(∞, 0, 1, x) = x. Promoted to Polylogarithms:P.5/chow-dilogarithm-projective-line.
- `chowDilog_steinberg` (relation): chowDilog((1 - f) wedge f wedge g) = sum_x v_x(g) D(f(x)). Promoted to Polylogarithms:P.5/chow-dilogarithm-steinberg.

**Unit tests.**

- `chowDilog_P1_line` (computation): On P^1, chowDilog((1 - z) wedge z wedge (z - a)) = D(a) for a in C - {0, 1}; numerically 0.99503 at a = 0.3 + 0.8i.
- `chowDilog_real` (degenerate): If X and f_1, f_2, f_3 are defined over R then chowDilog(f_1 wedge f_2 wedge f_3) = 0: F_infinity^* r_2 = r_2, while F_infinity reverses the orientation of X(C).
- `chowDilog_not_imaginary` (non-example): chowDilog takes real values; (2π i)^{-1} integral r_2 = i chowDilog is not the Chow dilogarithm of Conjecture 6.2(b).
- `chowDilog_alternating` (characterisation): chowDilog(f_2 wedge f_1 wedge f_3) = -chowDilog(f_1 wedge f_2 wedge f_3).

**Acceptance.**

- On P^1, chowDilog((1 - z) wedge z wedge (z - a)) = D(a).
- The value is real, and 0 for curves and functions defined over R.

**Used by.**

- P.5's strong reciprocity conjecture: condition (b) says chowDilog = D o h
- P.5's Chow polylogarithm: the top member for q = 2 is a multiple of this function

**Depends on.** this roadmap: `P.5/r-form`, `P.5/r-forms-and-distributions`; libraries: `mathlib:exteriorPower.alternatingMapLinearEquiv`.

**Used in this roadmap by.** `P.5/strong-reciprocity-conjecture`, `P.5/chow-dilogarithm-steinberg`, `P.5/chow-dilogarithm-projective-line`, `P.5/chow-dilogarithm-plane-curves`.

**Library.** module `TauCeti/AlgebraicGeometry/Curves/RegulatorComplexes`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 1, item 4, (6) and (7) (PDF p. 5); Section 6, (74) (PDF p. 52): “The Chow dilogarithm is a real function on its complex points defined by the formula P2(X; f1, f2, f3) := 1/(2 pi i) integral_{X(C)} r2(f1, f2, f3)” — The definition, with the normalisation corrected (source issue E12): r_2 is real, so the printed value is imaginary.

### Goncharov's strong reciprocity conjecture, as a statement

`P.5/strong-reciprocity-conjecture` · definition · first packet

Let X be a regular projective curve over an algebraically closed field k, F = k(X). For a homomorphism h : Lambda^3 F^x → B_2(k), IsReciprocityHom h means: (a) h(k^x wedge Lambda^2 F^x) = 0, delta_2 o h = Res on Lambda^3 F^x and h o delta_3 = Res on B_2(F) tensor F^x (both triangles of (77)); (b) for k = C, -(2π)^{-1} integral_{X(C)} r_2 = D o h, that is P.5/chow-dilogarithm = D o h (the printed (2π i)^{-1} is source issue E12). Conjecture 6.2 is the Prop: there is a canonical h with IsReciprocityHom h. It is recorded as a conjecture and never assumed. Here B_2 is rational (P.4/higher-bloch-group at n = 2) unless a proved case says otherwise; the source's integral group, defined by rigidity in Goncharov [G1], was not obtained (gap), and Goncharov's explicit integral B_2 with the cross-ratio r(∞, 0, 1, x) = x belongs to K3BlochGroups V.3, which owns 'the conventions used by Goncharov' (requested).

**Hypotheses.**

- X is a regular projective curve over an algebraically closed field k.

**Construction.**

1. State IsReciprocityHom as a Prop-valued definition and the conjecture as its existential; no proof is claimed.

**API.**

- `IsReciprocityHom` (characterisation): Conditions (a) and (b) on h.
- `StrongReciprocityConjecture` (other): The Prop: there exists a canonical h with IsReciprocityHom h.
- `isReciprocityHom_second_triangle` (relation): The first half of (a) implies h o delta_3 = Res. Promoted to Polylogarithms:P.5/reciprocity-second-triangle.

**Unit tests.**

- `P1_case` (compatibility): On P^1 the explicit h of P.5/reciprocity-projective-line satisfies IsReciprocityHom modulo 6-torsion.
- `res_nonzero` (non-example): h cannot take values in the Bloch group Ker delta_2: on P^1, Res(t wedge (t - 1) wedge (t - a)) = a wedge (1 - a) ≠ 0 modulo 2-torsion, so delta_2 o h = Res forces h outside the kernel.
- `imaginary_normalisation` (non-example): With the printed (2π i)^{-1} integral r_2, condition (b) equates a purely imaginary number with a real one and fails for every h unless both vanish.
- `real_curves` (degenerate): For X and the f_i defined over R, both sides of (b) vanish: chowDilog = 0 and D o h is 0 on real-defined data whose h lies in the image of B_2(R).

**Acceptance.**

- The conjecture is recorded as a Prop and assumed by no node.
- Its three proved cases are nodes of this layer.

**Used by.**

- P.5's proved cases: each proves IsReciprocityHom for an explicit h
- P.5's weight-three curve regulator: Conjecture 6.3 in weight three is condition (a)

**Depends on.** this roadmap: `P.5/chow-dilogarithm`, `P.5/curve-polylogarithmic-complex`, `P.3/residues-and-transfers`, `P.4/higher-bloch-group`; stages: `K3BlochGroups:V.3`.

**Used in this roadmap by.** `P.5/strong-reciprocity-implies-suslin`, `P.5/reciprocity-second-triangle`, `P.5/reciprocity-projective-line`, `P.5/chow-dilogarithm-on-elliptic-curves`.

**Library.** module `TauCeti/AlgebraicGeometry/Curves/RegulatorComplexes`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Conjecture 6.2 (PDF pp. 53-54): “Let X be a regular projective curve over an algebraically closed field k and F := k(X)^*. Then there exists a canonical homomorphism of groups h: Lambda^3 F^* -> B_2(k) satisfying the following two conditions” — The conjecture; condition (b) as printed has the normalisation error E12, and 'F := k(X)*' is E15.
- `Gonch.Arakelov.2004`, Section 6, the list of proved cases (PDF p. 54): “We prove this conjecture in the following cases: a) X = P^1 ... b) X is an elliptic curve over an algebraically closed field ... c) k = Q-bar, X is any curve.” — Exactly which cases are theorems.

### The strong reciprocity law implies Suslin reciprocity

`P.5/strong-reciprocity-implies-suslin` · lemma · first packet

Let X be a regular projective curve over an algebraically closed field k with function field F. If h : Lambda^3 F^x → B_2(k) satisfies Res = delta_2 o h on Lambda^3 F^x, then the image of Res in K_2(k) = Lambda^2 k^x / Im delta_2 (Matsumoto; the identification needs k algebraically closed, or 2 inverted) vanishes, which is Suslin's reciprocity law for K^M_3 of the curve. The converse fails: Ker delta_2 is nonzero, so the existence of h is not formal.

**Hypotheses.**

- X is a regular projective curve over an algebraically closed field k.

**Proof.**

1. Res(x) = delta_2(h(x)) lies in Im delta_2, which is the kernel of Lambda^2 k^x → K_2(k) by Matsumoto (K2SymbolsBrauer:T.2/matsumoto), since k^x is 2-divisible.
2. Compatibility of Res with the residues on Milnor K-theory (K2SymbolsBrauer:T.3/higher-milnor-residues).

**Acceptance.**

- Ker delta_2 contains {exp(i π/3)}_2 over C, which is not zero in B_2(C); so a lift h is not determined by Res.

**Depends on.** this roadmap: `P.5/strong-reciprocity-conjecture`; other roadmaps: `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.3/higher-milnor-residues`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 6, Remark 2 after Conjecture 6.2 (PDF p. 54): “According to Suslin's reciprocity law for the Milnor group K^M_3(F) the projection of Res(Lambda^3 F^*) in Lambda^2 k^* to K_2(k) is zero. Since by Matsumoto's theorem K_2(k) = Coker(delta_2), one has Res(Lambda^3 F^*) contained in Im(delta_2).” — The implication and why it is not an equivalence.

### The second triangle of the reciprocity law

`P.5/reciprocity-second-triangle` · lemma · first packet

If h(k^x wedge Lambda^2 F^x) = 0 and Res = delta_2 o h on Lambda^3 F^x, then h o delta_3 = Res on B_2(F) tensor F^x (Lemma 6.4).

**Hypotheses.**

- X is a regular projective curve over an algebraically closed field k, F = k(X); groups rational.

**Proof.**

1. h o delta_3 - Res takes values in Ker delta_2 and vanishes on B_2(F) tensor k^x.
2. Every element of k(X)^x is connected to a constant along a curve; rigidity of Ker delta_2 (rationally B(k) = B(k(t)), Suslin; requested from K3BlochGroups V.4) concludes.

**Acceptance.**

- On P^1 the explicit h satisfies both triangles modulo 6-torsion.

**Depends on.** this roadmap: `P.5/strong-reciprocity-conjecture`, `P.4/explicit-to-inductive-comparison`.

**Sources.**

- `Gonch.Arakelov.2004`, Lemma 6.4 (PDF p. 54): “Lemma 6.4 Assume that we have a map h such that h(k* wedge Lambda^2 F*) = 0 and Res = delta2 o h. Then h o delta3 = Res.” — The lemma, verbatim.

### The Chow dilogarithm on Steinberg elements

`P.5/chow-dilogarithm-steinberg` · lemma · first packet

For a smooth projective complex curve X and f, g in C(X)^x: integral_{X(C)} r_2((1 - f) wedge f wedge g) = -2π sum_x v_x(g) D(f(x)) (Lemma 6.9, corrected: the printed statement lacks 2π, source issue E11), that is chowDilog((1 - f) wedge f wedge g) = sum_x v_x(g) D(f(x)). The proof is the current identity d[D(f) d arg g - (1/3) alpha(1 - f, f) log|g|] = 2π D(f) delta(g) + r_2((1 - f) wedge f wedge g) ((83) and (84)), with alpha(f, g) = log|f| dlog|g| - log|g| dlog|f|.

**Hypotheses.**

- X is a smooth projective complex curve; f, g are nonzero rational functions, f not constant.

**Proof.**

1. Differentiate the 1-current (83) using d(d arg g) = 2π delta(g) and (85).
2. Integrate over X(C): the exact term integrates to 0.

**Acceptance.**

- X = P^1, f = z, g = z - a: integral r_2((1 - z) wedge z wedge (z - a)) = -2π D(a); the reviewer's quadrature gives ratios -6.28344 and -6.28355 at a = 0.3 + 0.8i and -0.45 + 0.6i.

**Depends on.** this roadmap: `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-differential`, `P.5/chow-dilogarithm`, `P.5/r-form-differential`.

**Used in this roadmap by.** `P.5/chow-dilogarithm-projective-line`, `P.5/chow-dilogarithm-families`, `P.5/weight-three-curve-regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Lemma 6.9 (PDF p. 57): “Lemma 6.9 Let X be an arbitrary curve over C. Then integral_{X(C)} r2((1 - f) wedge f wedge g) = - sum_{x in X(C)} vx(g) L2(f(x))” — The lemma as printed; the missing factor 2π is source issue E11.
- `Gonch.Arakelov.2004`, proof of Lemma 6.9, (83) and (84) (PDF p. 57): “Consider the following 1-form on X(C) L2(f)d arg g - (1/3) alpha(1 - f, f) log |g| (83) ... We claim that its derivative is equal to: 2 pi L2(f)delta(g) + r2((1 - f) wedge f wedge g) (84)” — The current identity that proves it.

### The Chow dilogarithm on the projective line

`P.5/chow-dilogarithm-projective-line` · theorem · first packet

On X = P^1: chowDilog(f_1 wedge f_2 wedge f_3) = sum over x_1, x_2, x_3 in P^1(C) of v_{x_1}(f_1) v_{x_2}(f_2) v_{x_3}(f_3) D(r(x_1, x_2, x_3, ∞)), with r(∞, 0, 1, x) = x (Proposition 6.8).

**Hypotheses.**

- X = P^1 over C.

**Proof.**

1. Reduce by multilinearity and projective invariance to f_1 = 1 - z, f_2 = z, f_3 = z - a.
2. Apply P.5/chow-dilogarithm-steinberg.

**Acceptance.**

- chowDilog((1 - z) wedge z wedge (z - a)) = D(a) (test chowDilog_P1_line).

**Depends on.** this roadmap: `P.5/chow-dilogarithm-steinberg`, `P.5/chow-dilogarithm`.

**Used in this roadmap by.** `P.5/reciprocity-projective-line`, `P.5/chow-dilogarithm-families`, `P.5/chow-dilogarithm-on-elliptic-curves`, `P.5/chow-dilogarithm-plane-curves`.

**Sources.**

- `Gonch.Arakelov.2004`, Proposition 6.8 (PDF p. 57): “P2(P1; f1, f2, f3) = sum_{xi in P1(C)} vx1(f1)vx2(f2)vx3(f3)L2(r(x1, x2, x3, infinity))” — The formula; with the corrected normalisation of P_2 (E12) it holds as printed.

### The reciprocity law on the projective line

`P.5/reciprocity-projective-line` · theorem · first packet

For k algebraically closed, h(f_1 wedge f_2 wedge f_3) := sum v_{x_1}(f_1) v_{x_2}(f_2) v_{x_3}(f_3) {r(x_1, x_2, x_3, ∞)}_2 in Goncharov's explicit B_2(k) (K3BlochGroups V.3, requested) is independent of the point ∞, satisfies condition (a) of P.5/strong-reciprocity-conjecture modulo 6-torsion and, for k = C, condition (b) (Theorem 6.5); moreover h((1 - f) wedge f wedge g) = sum_x v_x(g){f(x)}_2 modulo 6-torsion (Proposition 6.6).

**Hypotheses.**

- k is algebraically closed; statements hold modulo 6-torsion.

**Proof.**

1. Independence of the auxiliary point: the five-term relation together with sum_x v_x(f) = 0 (tauceti:TauCeti.Divisor.degree_principal).
2. Condition (a): compute delta_2 o h and Res on generators (Lemma 6.7), using Weil reciprocity.
3. Condition (b): P.5/chow-dilogarithm-projective-line.

**Acceptance.**

- For f_i = (t - a_i)/(t - b_i) with all a_i, b_i finite and distinct, h(f_1 wedge f_2 wedge f_3) = sum over x_i in {a_i, b_i} of eps_1 eps_2 eps_3 {(x_1 - x_3)/(x_2 - x_3)}_2, with eps_i = +1 at a_i and -1 at b_i, since r(a, b, c, ∞) = (a - c)/(b - c) (p. 56).

**Depends on.** this roadmap: `P.5/strong-reciprocity-conjecture`, `P.5/chow-dilogarithm-projective-line`; other roadmaps: `K2SymbolsBrauer:T.4/weil-reciprocity`; stages: `K3BlochGroups:V.3`; libraries: `tauceti:TauCeti.Divisor.degree_principal`.

**Used in this roadmap by.** `P.5/reciprocity-algebraic-numbers`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem 6.5 (PDF p. 54): “Assume that k = k-bar. Then the map h: Lambda^3 k(P^1)^* -> B_2(k) given by the formula h(f_1 wedge f_2 wedge f_3) := sum v_{x_1}(f_1) v_{x_2}(f_2) v_{x_3}(f_3) {r(x_1, x_2, x_3, infinity)}_2 satisfies all the conditions of conjecture 6.2 modulo 6-torsion.” — The theorem, verbatim.
- `Gonch.Arakelov.2004`, Proposition 6.6 (PDF p. 55): “Proposition 6.6 Let k = k-bar. Then modulo 6-torsion h((1 - f) wedge f wedge g) = sum_{x in P1(k)} vx(g){f(x)}2” — The Steinberg value of h.

### The Chow dilogarithm in families of curves

`P.5/chow-dilogarithm-families` · theorem · first packet

(a) For a family of curves π : Y → S over C and f_1, f_2, f_3 on Y, there are rational functions phi_i on S with P_2(Y → S; f_1, f_2, f_3) = sum_i D(phi_i(s)). (b) If there is h with Res = delta_2 o h, then d P_2(Y → S; f_1, f_2, f_3) = d D(h(f_1, f_2, f_3)) (Theorem 6.10 with Lemma 6.11).

**Hypotheses.**

- π : Y → S is a family of smooth projective curves over a complex base S.

**Proof.**

1. Reduce to the projective line by a projection and the transfer on Milnor K_3 (i o N = sum over g of g^* for Galois covers, (87); requested from K2SymbolsBrauer T.4).
2. Apply P.5/chow-dilogarithm-steinberg and Proposition 6.8.

**Acceptance.**

- For a constant family the functions phi_i are constant.

**Depends on.** this roadmap: `P.5/chow-dilogarithm-steinberg`, `P.5/chow-dilogarithm-projective-line`; other roadmaps: `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`.

**Used in this roadmap by.** `P.5/reciprocity-algebraic-numbers`, `P.5/chow-dilogarithm-on-elliptic-curves`, `P.5/chow-dilogarithm-plane-curves`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem 6.10 (PDF p. 58): “a) Let pi: Y -> S be a family of curves over a base S over C. Then there are rational functions phi_i on S such that P_2(Y -> S; f_1, f_2, f_3) = sum_i L_2(phi_i(s)).” — Part (a), verbatim.

### The reciprocity law for curves over Q-bar

`P.5/reciprocity-algebraic-numbers` · theorem · first packet

For a regular projective curve X over Q-bar with F = Q-bar(X) there is h : Lambda^3 F^x → B_2(Q-bar) tensor Q satisfying condition (a) of P.5/strong-reciprocity-conjecture and, for every embedding sigma : Q-bar → C, -(2π)^{-1} integral_{X(C)} r_2(sigma(f_1 wedge f_2 wedge f_3)) = D(sigma(h(f_1 wedge f_2 wedge f_3))) (Theorem 6.12 with Lemma 6.13; the printed (2π i)^{-1} is source issue E12).

**Hypotheses.**

- X is a regular projective curve over Q-bar; the statement is after tensoring with Q.

**Proof.**

1. Choose a projection to P^1, pass to a Galois closure and use the transfer on Milnor K_3 to write |G| h as a pull-back plus Steinberg terms.
2. Lemma 6.13: the Steinberg part is well defined, by the injectivity of the regulator on K_3^ind(Q-bar)_Q (Borel, requested from BorelRegulators R.4, transported through P.2/borel-comparison) and P.5/chow-dilogarithm-families.
3. Condition (b) follows from Theorem 6.10(b) and the value at a degenerate member.

**Acceptance.**

- After tensoring with Q only: torsion is not controlled.

**Depends on.** this roadmap: `P.5/reciprocity-projective-line`, `P.5/chow-dilogarithm-families`, `P.2/borel-comparison`; other roadmaps: `BorelRegulators:R.4/borel-regulator`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem 6.12 (PDF p. 59): “Let X be a regular projective curve over Q-bar and F := Q-bar(X). Then there exists a homomorphism h: Lambda^3 F^* -> B_2(Q-bar) tensor Q as in conjecture 6.2” — The theorem.
- `Gonch.Arakelov.2004`, Lemma 6.13 (PDF p. 59): “Lemma 6.13 Suppose sum_i (1 - fi) wedge fi wedge gi = 0 in Lambda^3 Q(X)*. Then sum_i sum_x vx(gi) {fi(x)}2 = 0 in the group B2(Q).” — The lemma that makes h well defined.

### The Chow dilogarithm of a plane curve

`P.5/chow-dilogarithm-plane-curves` · theorem · first packet

For an algebraic curve X in P^2 over C and linear homogeneous functions l_0, ..., l_3 in general position (distinct lines, no three concurrent, none a component of X): integral_{X(C)} r_2(l_1/l_0 wedge l_2/l_0 wedge l_3/l_0) = 2π sum_i (-1)^i D(r(l_{i0}, ..., l_{ii}-hat, ..., l_{i3}, D_i)), where L_i is the line of l_i, D_i its intersection divisor with X and l_{ij} the point L_i n L_j (Proposition 6.18 with Lemmas 6.15 and 6.16).

**Hypotheses.**

- X is a plane curve over C; the four lines are in general position with respect to X.

**Proof.**

1. Both sides have the same differential in families (Lemma 6.16 and P.5/chow-dilogarithm-families).
2. Deform X to a union of lines, where the formula is checked directly on each line.

**Acceptance.**

- With chowDilog = -(2π)^{-1} integral r_2 this reads chowDilog = -sum_i (-1)^i D(...), matching h of (93).

**Depends on.** this roadmap: `P.5/chow-dilogarithm-families`, `P.5/chow-dilogarithm-projective-line`, `P.5/chow-dilogarithm`.

**Used in this roadmap by.** `P.5/chow-dilogarithm-on-elliptic-curves`.

**Sources.**

- `Gonch.Arakelov.2004`, Proposition 6.18, (96) (PDF p. 64): “Let X be an algebraic curve in P^2 over C and l_0,...,l_3 linear homogeneous functions on C^3. Then integral_{X(C)} r_2(l_1/l_0 wedge l_2/l_0 wedge l_3/l_0) = 2 pi sum_i (-1)^i L_2(r(l_{i0},..., l_{ii}-hat, ..., l_{i3}, D_i)).” — The formula, with the factor 2π.
- `Gonch.Arakelov.2004`, Lemma 6.16 (PDF p. 62): “For any plane curve X one has sum_x res_x((l_1/l_0) wedge (l_2/l_0) wedge (l_3/l_0)) = -delta_2(sum_i (-1)^i {r(l_{i0},..., l_{ii}-hat, ..., l_{i3}, D_i)}_2).” — The residue computation.

### The Chow dilogarithm of an elliptic curve, explicitly

`P.5/chow-dilogarithm-on-elliptic-curves` · theorem · first packet

For an elliptic curve E over an algebraically closed field, presented as a plane curve, there is an explicit reciprocity homomorphism h. Writing a rational function as a ratio of products of linear homogeneous functions reduces everything to four linear functions l_0, ..., l_3; with L_i the line they cut, D_i the divisor of its intersection with the curve and l_{ij} the intersection point of two of the lines, the value of h on the wedge of the three ratios l_i/l_0 is minus the alternating sum over i of the class of the cross-ratio of the three points l_{ij} with j different from i against the divisor D_i. It satisfies condition (a) of P.5/strong-reciprocity-conjecture and, over C, condition (b) in the corrected normalisation chowDilog = D o h (source issue E12). The integral formula for an arbitrary plane curve is P.5/chow-dilogarithm-plane-curves.

**Hypotheses.**

- E is an elliptic curve over an algebraically closed field, realised as a plane cubic; l_0, ..., l_3 are linear homogeneous functions defining distinct lines, no three concurrent and none a component of E (the source says 'any'; source issue E18).
- The class of a cross-ratio against a divisor means the corresponding integer combination of classes, as the source defines it.
- The decomposition of a rational function into a ratio of products of linear functions uses the group law: the divisor of the ratio of the line through two points to the line through their sum and its negative is the displayed one.

**Proof.**

1. Reduce to four linear functions by decomposing a rational function into a ratio of products of linear ones, using the group law step described by the source.
2. Prove the two elementary identities for the canonical functions attached to a pair of lines: on the third line the two ratios sum to one, and the quotient of two of them is minus the third ratio.
3. Compute the total residue of the wedge of the three ratios by evaluating the residues at the three divisors with the first identity, and reducing the residues on the remaining line by the second; the result is minus delta_2 of the displayed class.
4. Prove that the formula gives a well-defined homomorphism: the relations between the functions attached to pairs of points are generated by the displayed one, its image has vanishing delta_2 by the previous step, and one checks the value at a degenerate triple where the first factor is constant.
5. Prove the analytic statement for an arbitrary plane curve: both sides have the same differential by the residue computation and the family version of the reciprocity law, so they differ by a constant, and the constant vanishes by deforming the curve to a union of lines.

**Acceptance.**

- For a line in the plane the formula is checked directly and is the base of the deformation argument.
- For the projective line the formula reduces to the cross-ratio formula of the previous node.

**Depends on.** this roadmap: `P.5/strong-reciprocity-conjecture`, `P.5/chow-dilogarithm-families`, `P.5/chow-dilogarithm-projective-line`, `P.5/chow-dilogarithm-plane-curves`, `P.1/bloch-wigner-dilogarithm`; libraries: `mathlib:WeierstrassCurve`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem 6.14, (93) and (94) (PDF p. 62): “Let E be an elliptic curve over an algebraically closed field k. Then there exists a homomorphism of groups h: Lambda^3 F^* -> B_2(k) for any linear homogeneous functions l_0,...,l_3 one has h(l_1/l_0 wedge l_2/l_0 wedge l_3/l_0) = -sum_i (-1)^i {r(l_{i0},..., l_{ii}-hat, ..., l_{i3}, D_i)}_2” — The theorem with its explicit formula, verbatim.

### Goncharov's reciprocity conjecture in weight n ≥ 4, as a statement

`P.5/general-weight-reciprocity-conjecture` · definition · first packet

For a regular projective curve X over an algebraically closed field k with F = k(X) and n ≥ 4, the Prop that Res : B(F; n) → B(k; n - 1)[-1] is homotopic to zero (Conjecture 6.3), with the complexes of P.4/general-polylog-complex and residues defined as in P.3. Recorded as a conjecture, never assumed; in weight three it is proved in the cases of P.5/weight-three-curve-regulator.

**Hypotheses.**

- X is a regular projective curve over an algebraically closed field; n ≥ 4.

**Construction.**

1. State the homotopy as a Prop.

**API.**

- `GeneralReciprocityConjecture` (other): The Prop of Conjecture 6.3 for a given n.
- `generalReciprocity_three` (compatibility): For n = 3 the Prop is condition (a) of Conjecture 6.2 without its first clause.
- `generalReciprocity_two` (compatibility): For n = 2 the Prop is Weil reciprocity after tensoring with Q.

**Unit tests.**

- `weight_three_cases` (compatibility): For n = 3 the Prop holds for P^1 modulo 6-torsion, elliptic curves and curves over Q-bar.
- `weight_two` (degenerate): For n = 2 the Prop says Res : Lambda^2 F^x → k^x_Q is homotopic to zero, which is Weil reciprocity rationally.
- `not_assumed` (non-example): No node of this packet has this Prop as a hypothesis.

**Acceptance.**

- The Prop is assumed by no node.

**Used by.**

- the atlas: records the conjecture for n ≥ 4 so that no node assumes it

**Depends on.** this roadmap: `P.4/general-polylog-complex`, `P.5/curve-polylogarithmic-complex`.

**Sources.**

- `Gonch.Arakelov.2004`, Conjecture 6.3 (PDF p. 54): “Let X be a projective regular curve over an algebraically closed field k and F := k(X). Then the homomorphism Res: Gamma(F;n) -> Gamma(k;n-1)[-1] ...” — The general-weight reciprocity conjecture, stated by the source as a conjecture; the weight-three case is the one this node records.

### Curve symbols and the Chern regulator

`P.5/curve-symbol-chern-comparison` · comparison · P.5 part

For a smooth projective geometrically integral curve X over C and a rational K2 class represented by Σj{fj,gj} with vanishing tame symbols in κ(x)*⊗Q, its weight-two real Deligne regulator is represented by iΣjη(fj,gj), η(f,g)=log|f|darg g-log|g|darg f, in the M.8 differential-form model. With ch_(i,j)=(-1)^(j-1)c_(i,j)/(j-1)!, ch_(2,2)=-c_(2,2); multiplicativity and the Chern product coefficient -1 give the positive unit cup product. This fixes the general curve formula once, without adding the elliptic embedding, period or rational-orientation choices owned by ER.2.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Request units, Deligne cup products, Chern-character normalisation and localization from early M.8.
2. Insert unit representatives log|f|,log|g| in equation (7.3.2); π1(dlog f)=i darg f gives iη.
3. Use the tame-symbol kernel and localization to extend the generic-point class to X; the cup-product computation alone is not a K2-lift criterion.

**Acceptance.**

- For f=z and g=c>1 real the period around zero is -2πi log c.
- Unit-modulus tame symbols make η closed as a current but do not imply rational unramified K2 membership.
- No Deligne carrier or universal Chern class is defined in ER.2 or this node.

**Depends on.** this roadmap: `P.5/weight-two-regulator-form`, `P.5/unramified-weight-two-class`; other roadmaps: `K2SymbolsBrauer:T.3/tame-symbol`.

**Library.** module `TauCeti/AlgebraicGeometry/Curves/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `curveSymbolChernComparison`.

**Suggested Lean.** Signature omitted: absent carrier: rational Quillen K2 and its tame kernel, M.8 Deligne hypercohomology/cup product/Chern character, parent global η current.

**Sources.**

- `NEK`, Section 7.3 equation (7.3.2) and Section 7.4 equation (7.4.1), p. 23; Section 7.5, p. 24: “multiplicative” — The unit logarithm and cup-product representative.
- `SCH`, Section 4, p. 28, higher Chern character and product equation: “Chern” — The factorial and Chern-product signs.

## P.5:regulators — Higher-cycle and elliptic regulator comparisons (proposed sub-layer)

Thirty-one nodes: nine of the first packet and twenty-two of the P.5 part, with five planets. The first packet states the comparison of Goncharov's regulator with Beilinson's as a theorem (Burgos Gil–Feliu–Takeda, Theorem 6.18) and cites it; the P.5 part decomposes its proof. Wang forms T_m in a Dolbeault algebra satisfy T_m(−log|f_1|, …, −log|f_m|) = (−1)^m r_{m−1}(f_1, …, f_m), which is the sign (−1)^m of BFT's Remark 5.12; the cubical regulator P_c integrates them over resolved admissible cycles; the support complex and the integration map φ give the homotopy ψ that identifies P_c with the Burgos–Feliu support regulator; the mixed regulator identifies the cubical and simplicial models; and M.6's rational Chern character with M.8's universal normalisation gives Beilinson's regulator. The comparison is in BFT's normalised current model; converting it to the first packet's raw conventions in every degree, including the sign ε_n of source issue E21, is a recorded gap. The weight-three nodes give the curve regulator (ρ_2, ρ_3), its descent through the B_2 relations, its compatibility with K_4 for curves over number fields, and, for an elliptic curve E = ℂ/(ℤu + ℤv) with A = Im(ū v) > 0, the Fourier formula in terms of the generalized Eisenstein–Kronecker series K_3; the analytic limit near shared logarithmic poles and the collation with the published version are gaps.

### Goncharov's real Deligne complex C_D(X; n)

`P.5/goncharov-deligne-complex` · construction · first packet

For a regular complex projective variety X and n ≥ 1, let D^{p,q} be the complex-valued currents of type (p, q) on X(C). C_D(X; n) is the subcomplex of the total complex of the n x n square of the Dolbeault bicomplex D^{p,q} (0 ≤ p, q ≤ n - 1, with D^{0,0} in degree 1), valued in R(n - 1), together with the closed R(n)-valued currents D^{n,n}_{R,cl}(n) in degree 2n, the map into it being 2 d' d''. It is concentrated in degrees [1, 2n]. For X over R, C_D(X_{/R}; n) is the subcomplex fixed by the De Rham involution F_infinity-bar.

**Hypotheses.**

- X is a regular complex projective variety; currents on X(C) are a gap.

**Construction.**

1. Form the Dolbeault double complex of currents and its n x n square.
2. Restrict to R(n - 1)-valued currents and adjoin D^{n,n}_{R,cl}(n) with 2 d' d''; check d^2 = 0.
3. Define the real form by the De Rham involution.

**API.**

- `goncharovDeligneComplex` (data): C_D(X; n).
- `goncharovDeligneComplex_real` (data): C_D(X_{/R}; n), the involution-fixed subcomplex.
- `goncharovDeligneComplex_degrees` (characterisation): Concentrated in degrees [1, 2n].
- `goncharovDeligneComplex_top` (simp): The last differential is 2 d' d'' into D^{n,n}_{R,cl}(n).

**Unit tests.**

- `point_weight_one` (computation): For X a point and n = 1, C_D(X; 1) = R in degree 1.
- `degrees` (characterisation): C_D(X; n) vanishes outside degrees [1, 2n].
- `comparison` (compatibility): H^i C_D(X; n) = H^i_D(X, R(n)) for i ≤ 2n (P.5/goncharov-deligne-complex-comparison).

**Acceptance.**

- For a point and n = 1 it is R in degree 1.
- It is concentrated in degrees [1, 2n].

**Used by.**

- P.5's regulator on the higher Chow complex: its target
- P.5's Arakelov motivic complex: the cone is formed with this complex

**Depends on.** libraries: `mathlib:CochainComplex`, `mathlib:Distribution`.

**Used in this roadmap by.** `P.5/goncharov-deligne-complex-comparison`, `P.5/regulator-map-on-higher-chow`, `P.5/regulator-map-real`, `P.5/arakelov-motivic-complex`, `P.5/bft-current-dictionary`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GoncharovRegulator`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 2, item 3 (PDF pp. 10-11): “Take the intersection of the part of the complex Tot coming from the n x n square in the diagram (and concentrated in degrees [1, 2n - 1]) with the complex of distributions with values in R(n - 1).” — The definition of the complex; the top term is D^{n,n}_{R,cl}(n).

### Goncharov's complex computes truncated Deligne cohomology

`P.5/goncharov-deligne-complex-comparison` · comparison · first packet

For a regular complex projective variety X, C_D(X; n) is quasi-isomorphic to the truncated Beilinson-Deligne complex tau_{≤2n} R(X; n)_D (Proposition 2.1, with Lemma 2.2).

**Hypotheses.**

- X is a regular complex projective variety; n ≥ 1.

**Proof.**

1. Lemma 2.2 (a cone construction for a morphism injective in low degrees and surjective in high degrees) and the Dolbeault resolution; the Beilinson-Deligne complex is M.8's.

**Acceptance.**

- For X a point and n = 1 both sides are R in degree 1.

**Depends on.** this roadmap: `P.5/goncharov-deligne-complex`.

**Used in this roadmap by.** `P.5/regulator-induces-beilinson`, `P.5/bft-current-dictionary`.

**Sources.**

- `Gonch.Arakelov.2004`, Proposition 2.1 (PDF p. 11): “Proposition 2.1 Let X be a regular complex projective variety. Then the complex CD(X; n) is quasiisomorphic to the truncated Beilinson-Deligne complex tau_{<=2n} R(X; n)_D.” — The comparison, verbatim.

**Assembly note.** The general Deligne complex compared with here is requested once from an early M.8 prefix. `P.5/bft-current-dictionary` and `P.5/current-resolution` give the normalised current model and its identification with smooth forms.

### Goncharov's regulator map from the higher Chow complex to the Deligne complex

`P.5/regulator-map-on-higher-chow` · construction · planet “Regulator on the higher Chow complex” · first packet

For a regular complex projective variety X and n ≥ 1, define P(n) : Z(X; n) → C_D(X; n) on Bloch's cycle complex (MotivicEtaleKTheory M.4) with Goncharov's affine simplices Delta^i = P^i - {z_1 + ... + z_i = z_0}: for a cycle Y in X x Delta^i meeting all faces properly, P^{2n-i}(n)(Y) := (2π i)^{n-i} pi_{X*} r_{i-1}(g_1 wedge ... wedge g_i), where g_k is the restriction of z_k/z_0 to Y (Definition 2.11), and P^{2n}(n)(Y) := (2π i)^n delta_Y. That P(n) is a map of complexes is P.5/regulator-map-chain-map, and the real statement is P.5/regulator-map-real.

**Hypotheses.**

- X is a regular complex projective variety; n ≥ 1.
- The cycles meet all faces of X x Delta^i properly (Remark after Definition 2.11).

**Construction.**

1. Attach to a cycle Y the functions g_k = z_k/z_0 restricted to Y.
2. Apply the current r_{i-1} of P.5/r-forms-and-distributions (the simplex form r_{i-1}(L; H) of P.5/simplex-form restricted to Y) and push forward along the proper projection pi_X.
3. Multiply by (2π i)^{n-i} and check that the result lies in C^{2n-i}_D(X; n).

**API.**

- `chowRegulator` (data): P(n) : Z(X; n) → C_D(X; n) on cycles meeting the faces properly.
- `chowRegulator_apply` (simp): P^{2n-i}(n)(Y) = (2π i)^{n-i} pi_{X*} r_{i-1}(g_1 wedge ... wedge g_i).
- `chowRegulator_top` (simp): P^{2n}(n)(Y) = (2π i)^n delta_Y.
- `chowRegulator_chainMap` (characterisation): P(n) commutes with the differentials. Promoted to Polylogarithms:P.5/regulator-map-chain-map.
- `chowRegulator_real` (characterisation): Over R the image lies in C_D(X_{/R}; n). Promoted to Polylogarithms:P.5/regulator-map-real.
- `chowRegulator_point` (example): At X = Spec C, n = 1: P^1(1)({a}) = log|a|.

**Unit tests.**

- `point_case` (computation): X = Spec C, n = 1: P^1(1)({a}) = log|a| for a in C^x - {1}.
- `top_degree` (degenerate): For i = 0, P^{2n}(n)(Y) = (2π i)^n delta_Y.
- `normalisation` (characterisation): The factor is (2π i)^{n-i}: for n = 2, i = 1 the value on a curve Y with function g is 2π i pi_{X*} log|g|.
- `not_on_classes` (non-example): The map is on cycles: two cycles with the same class in CH^n(X, i) have images differing by a coboundary, not equal images.

**Acceptance.**

- X = Spec C, n = 1: P^1(1)({a}) = log|a| for a in C^x - {1} (the example after Corollary 2.9).
- The map is defined on cycles meeting the faces properly and on no others.
- The chain-map property is a separate theorem.

**Used by.**

- P.5's Arakelov complex: the Arakelov motivic complex is the cone of this map, shifted by one
- P.5's comparison with Beilinson's regulator: Burgos Gil-Feliu-Takeda compare the map induced on cohomology

**Depends on.** this roadmap: `P.5/r-forms-and-distributions`, `P.5/simplex-form`, `P.5/goncharov-deligne-complex`; stages: `MotivicEtaleKTheory:M.4`; libraries: `mathlib:CochainComplex`, `mathlib:AlgebraicGeometry.Scheme`.

**Used in this roadmap by.** `P.5/regulator-map-chain-map`, `P.5/regulator-map-real`, `P.5/arakelov-motivic-complex`, `P.5/regulator-induces-beilinson`, `P.5/mixed-regulator`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GoncharovRegulator`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Definition 2.11 (PDF p. 22): “Definition 2.11 P^{2n-i}(n)(Y) := (2 pi i)^{n-i} pi_X* r_{i-1}(g1 wedge ... wedge gi)” — The definition, as displayed.
- `Gonch.Arakelov.2004`, Theorem-Construction 2.3 (PDF p. 13): “Let X be a regular complex projective variety. Then there exists a canonical homomorphism of complexes P^bullet(n): Z^bullet(X; n) -> C^bullet_D(X; n).” — The construction whose data this node is.

### Goncharov's regulator is a map of complexes

`P.5/regulator-map-chain-map` · theorem · first packet

P(n) : Z(X; n) → C_D(X; n) of P.5/regulator-map-on-higher-chow is a homomorphism of complexes (Theorem 2.12).

**Hypotheses.**

- X is a regular complex projective variety; n ≥ 1; currents on X(C) (gap).

**Proof.**

1. The boundary of a cycle is the alternating sum of its intersections with the faces.
2. Compute d of pi_{X*} r_{i-1}(g_1 wedge ... wedge g_i) with P.5/r-form-differential and Corollary 2.9: the residue terms are the values on the faces, with the signs of the cycle complex (the sign caveat of source issue E21 applies).

**Acceptance.**

- For X a point, n = 1, and the cycle {a} in Delta^1, d P^1(1)({a}) = 0 in degree 2 since C_D(pt; 1) is R in degree 1.

**Depends on.** this roadmap: `P.5/regulator-map-on-higher-chow`, `P.5/r-form-differential`, `P.5/simplex-form`.

**Used in this roadmap by.** `P.5/arakelov-motivic-complex`, `P.5/regulator-induces-beilinson`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem 2.12 (PDF p. 23): “Theorem 2.12 P^bullet(n) is a homomorphism of complexes.” — The theorem.

### Goncharov's regulator over the reals

`P.5/regulator-map-real` · lemma · first packet

If X is defined over R then the image of P(n) lies in the subcomplex C_D(X_{/R}; n) fixed by the De Rham involution.

**Hypotheses.**

- X is a regular projective variety defined over R.

**Proof.**

1. Conjugation fixes log|g| and negates d arg g, so it acts on r_{i-1} by the sign that the De Rham involution, which includes complex conjugation of the coefficients, compensates.

**Acceptance.**

- For X = Spec R and n = 1, P^1(1)({a}) = log|a| is fixed.

**Depends on.** this roadmap: `P.5/regulator-map-on-higher-chow`, `P.5/goncharov-deligne-complex`.

**Sources.**

- `Gonch.Arakelov.2004`, Theorem-Construction 2.3 (PDF p. 13): “If X is defined over R then the image of the map P^bullet(n) lies in the subcomplex C^bullet_D(X_{/R}; n).” — The real statement, verbatim.

### The Arakelov motivic complex and the higher Arakelov Chow groups

`P.5/arakelov-motivic-complex` · construction · first packet

The weight-n Arakelov motivic complex of a regular complex projective variety X is the cone of the regulator map P(n) : Z(X; n) → C_D(X; n), shifted by -1 (mathlib:CochainComplex.mappingCone). Over R the same definition is taken with C_D(X_{/R}; n), and over a number field one views X over Q and takes the real variety. Replacing the last group of the Deligne complex by its quotient modulo the smooth closed forms gives the complex whose cohomology CH-hat^n(X; i) := H^{2n-i} is the higher Arakelov Chow group (Definition 2.13, (35)). In degree zero it is a version of the arithmetic Chow group, the group (36) of pairs (Z, g) on the complex variety (P.5/higher-arakelov-chow-degree-zero); it is not Gillet and Soule's group of an arithmetic variety over Z.

**Hypotheses.**

- X is a regular projective variety over C, over R or over a number field, as stated in each case.
- The motivic complex is Bloch's cycle complex; the source does not claim that the construction is independent of this choice.

**Construction.**

1. Form the cone of the chain map P(n) (P.5/regulator-map-chain-map) with mathlib:CochainComplex.mappingCone and shift it by -1; record the three variants.
2. Define the quotient complex and the higher Arakelov Chow groups (Definition 2.13).
3. The distinguished triangle is mathlib:CochainComplex.mappingCone.triangle.
4. The degree-zero identification is P.5/higher-arakelov-chow-degree-zero.
5. Record that the construction works equally for the Suslin-Voevodsky versions of the motivic complexes.

**API.**

- `arakelovComplex` (data): The cone of P(n) shifted by -1.
- `arakelovComplex_real` (data): The real variant, with the involution-fixed subcomplex.
- `arakelovComplex_numberField` (data): The variant over a number field.
- `higherArakelovChow` (data): CH-hat^n(X; i) := H^{2n-i} of the quotient complex.
- `higherArakelovChow_zero` (characterisation): CH-hat^n(X; 0) is the group (36). Promoted to Polylogarithms:P.5/higher-arakelov-chow-degree-zero.
- `arakelovComplex_triangle` (compatibility): The distinguished triangle of the cone.

**Unit tests.**

- `arakelov_point` (computation): X = Spec C, n = 1: Z^1(pt; 1) is free on the points a in C^x - {1} of A^1 = P^1 - {1}, H^1 of the cycle complex is C^x, C_D(pt; 1) = R in degree 1 with P^1(1)(a) = log|a|; hence H^1 of the Arakelov complex is {a : |a| = 1} and CH-hat^1(pt; 0) = 0.
- `cone_triangle` (characterisation): The complex sits in the distinguished triangle of a cone (mappingCone.triangle).
- `real_variant` (degenerate): Over R the construction uses the involution-fixed subcomplex.
- `depends_on_motivic_complex` (non-example): Nothing identifies the complex with the one Goncharov builds from polylogarithmic complexes ([G7]): the source says the relationship 'is not clear'.

**Acceptance.**

- It fits into the long exact sequence of a cone relating the cycle complex, C_D(X; n) and the Arakelov complex.
- X = Spec C, n = 1: H^1 of the Arakelov complex is {a in C^x : |a| = 1} and CH-hat^1(pt; 0) = 0 (test arakelov_point).
- The complex depends on the choice of motivic complex, as the source says.

**Used by.**

- MotivicEtaleKTheory M.8: the Deligne comparison of the target is M.8's
- Arithmetic intersection theory: the source asks for an arithmetic Riemann-Roch theorem in this generality (Problem b)

**Depends on.** this roadmap: `P.5/regulator-map-on-higher-chow`, `P.5/regulator-map-chain-map`, `P.5/goncharov-deligne-complex`; stages: `MotivicEtaleKTheory:M.4`; libraries: `mathlib:CochainComplex.mappingCone`, `mathlib:CochainComplex.mappingCone.triangle`.

**Used in this roadmap by.** `P.5/higher-arakelov-chow-degree-zero`, `P.5/gersten-green-assembly`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GoncharovRegulator`, namespace `TauCeti.Regulator`.

**Sources.**

- `Gonch.Arakelov.2004`, Section 1, item 2, (3), (4) and (5) (PDF p. 3): “The weight n Arakelov motivic complex Gamma_A^bullet(X; n) is the cone of the map (2), shifted by -1 ... For a regular projective variety X over R the image of map (2) lies in the subcomplex C^bullet_D(X_{/R}; n) := C^bullet_D(X(C); n)^{bar F_infinity}” — The three variants of the definition, verbatim.
- `Gonch.Arakelov.2004`, Definition 2.13 and Proposition 2.14, (35) and (36) (PDF p. 25): “The Higher Arakelov Chow groups are CH-hat^n(X; i) := H^{2n-i}(Z-hat^bullet(X; n)). ... Proposition. CH-hat^n(X; 0) = CH-hat^n(X).” — The definition and the degree-zero identification (numbered 2.13 and 2.14 in the source).
- `Gonch.Arakelov.2004`, Section 1, item 2, the remark on other motivic complexes (PDF p. 3): “Our construction works equally well for the Suslin-Voevodsky versions of the motivic complexes. ... However a precise relationship between the construction given in [G7] and the one in Chapter 2 is not clear.” — The source's own caveat about the dependence on the choice of motivic complex, verbatim.

### Degree-zero higher Arakelov Chow groups

`P.5/higher-arakelov-chow-degree-zero` · theorem · first packet

CH-hat^n(X; 0) = CH-hat^n(X), where CH-hat^n(X) is the group (36) of pairs (Z, g), Z a codimension-n cycle and g an R(n-1)-valued current of type (n-1, n-1) with d'd'' g/(π i) + delta_Z smooth, modulo the pairs (div f, -log|f|) and (0, d'u + d''v) (Proposition 2.14). The group (36), a complex-variety version of Gillet and Soule's, has no owner in the atlas (gap), and the proof rests on the comparison of the last two cohomology groups of the Gersten complex with those of the cycle complex, asserted as 'well known' without reference (gap).

**Hypotheses.**

- X is a regular complex projective variety; n ≥ 1.

**Proof.**

1. Map the end of the Gersten complex into the cycle complex: a pair of a subvariety and a rational function to its graph cycle, a wedge of two functions to a cycle in the product with Delta^2.
2. Use that this is an isomorphism on the last two cohomology groups (gap).
3. Compute the composite with the regulator and recognise the relations of (36).

**Acceptance.**

- For X a point and n = 1 both sides vanish (test arakelov_point).

**Depends on.** this roadmap: `P.5/arakelov-motivic-complex`; stages: `SchemeKTheoryOperations:S.4`, `MotivicEtaleKTheory:M.4`.

**Used in this roadmap by.** `P.5/gersten-green-assembly`.

**Sources.**

- `Gonch.Arakelov.2004`, Proposition 2.14 and (36) (PDF p. 25): “Proposition 2.14 CH-hat^n(X; 0) = CH-hat^n(X).” — The identification, as printed.

**Assembly note.** The group (36), recorded here as having no owner, is `P.5/green-presentation`, GreenCH^p(X); the identification is assembled in `P.5/gersten-green-assembly`, which needs MotivicEtaleKTheory M.4's graph map to be an isomorphism on the last two cohomology groups (requested; the P.5 part's gap 4).

### Goncharov's regulator induces Beilinson's regulator

`P.5/regulator-induces-beilinson` · comparison · first packet

Let X be a smooth projective complex variety. The composite K_n(X)_Q = direct sum over p of CH^p(X, n)_Q → direct sum over p of H^{2p-n}_D(X, R(p)) of Bloch's Chern-character isomorphism with the map induced on cohomology by Goncharov's regulator P(p) (P.5/regulator-map-on-higher-chow) equals Beilinson's regulator, once Goncharov's r_{m-1} carries the sign (-1)^m of Burgos Gil-Feliu-Takeda Section 5.2 (Remark 5.12). Goncharov poses this as Problem a) of his introduction; it is Theorem 6.18 of Burgos Gil-Feliu-Takeda, not a result of the source read for P.5. Its proof there is not decomposed here (gap).

**Hypotheses.**

- X smooth projective over C ('equidimensional projective complex algebraic manifold').
- Normalisations: the conventions of Burgos Gil-Feliu-Takeda Section 2 for the Deligne complex of currents and twists, and the sign (-1)^m relating their r_{m-1} to Goncharov's (13).

**Proof.**

1. Compare Goncharov's forms r_{m-1} with Wang's forms T_m (BFT Theorem 5.13).
2. Pass from the simplicial complex to the cubical complexes by the quasi-isomorphisms of BFT Lemma 6.17 and Proposition 6.12 (Levine).
3. Identify the cubical regulator with Burgos and Feliu's regulator, which induces Beilinson's regulator (BFT Theorem 4.7 and Theorem 6.11).
4. Conclude by the commutative square (6.13) of BFT. (Not decomposed: gap.)

**Acceptance.**

- For X = Spec C in weight p = 2 it specialises to the comparison of the Chow-dilogarithm regulator with Beilinson's regulator on K_3(C), whose Borel side BorelRegulators R.7 owns.
- The sign (-1)^m is recorded, not absorbed silently.

**Depends on.** this roadmap: `P.5/regulator-map-on-higher-chow`, `P.5/regulator-map-chain-map`, `P.5/goncharov-deligne-complex-comparison`; stages: `MotivicEtaleKTheory:M.4`, `MotivicEtaleKTheory:M.6`.

**Used in this roadmap by.** `P.5/beilinson-comparison-assembly`.

**Sources.**

- `BFT.2011`, Theorem 6.18 (arXiv v1, p. 21): “Let X be an equidimensional projective complex algebraic manifold. Let Ps' be the composition of Ps with the isomorphism given by the Chern character of [Blo86] ... Then, the morphism Ps' agrees with Beilinson's regulator.” — The comparison, proved.
- `BFT.2011`, Section 5.2, Remark 5.12: “The sign (-1)^m appears due to the difference in sign on the differential of the Deligne complex” — The sign convention relating their forms to Goncharov's.
- `Gonch.Arakelov.2004`, Section 1, item 2, Problems a) (PDF p. 4): “Show that taking cohomology of the map (2) and using the isomorphism between the rational Bloch's Higher Chow groups of X and the corresponding part of the rational K-theory of X ([Bl2], [Lev]) we get a non-zero rational multiple of the Beilinson's regulator map.” — The source poses it as a problem.

**Assembly note.** The proof of BFT Theorem 6.18 is decomposed by the P.5 part, from `P.5/wang-forms` to `P.5/beilinson-comparison-assembly`. That chain identifies the BFT-normalised simplicial regulator with Beilinson's; the identification with this node's raw conventions is conditional on the P.5 part's gap 6.

### The weight-three regulator of a complex curve

`P.5/weight-three-curve-regulator` · construction · planet “Weight-three curve regulator” · first packet

For a smooth projective complex curve X with F = C(X) define rho_2 : B_2(F) tensor F^x → 1-currents on X(C), {f}_2 tensor g ↦ D(f) d arg g - (1/3) alpha(1 - f, f) log|g| with alpha(f, g) = log|f| dlog|g| - log|g| dlog|f|, and rho_3 = r_2 : Lambda^3 F^x → 2-currents. Then, as currents, d rho_2({f}_2 tensor g) = 2π D(f) delta(g) + r_2((1 - f) wedge f wedge g); that is, (rho_2, rho_3, 2π D o Res delta) is a map of complexes from the weight-three curve complex to real currents. Well-definedness of rho_2 on B_2(F) tensor F^x (compatibility with the relations of B_2) is not proved in the source read and is a gap (Goncharov, 'Explicit regulator maps on polylogarithmic motivic complexes' [G7]). In weight three Goncharov's Conjecture 6.3 (Res is homotopic to zero) is equivalent to condition (a) of Conjecture 6.2 without its first clause, so it is proved in the three cases of P.5/reciprocity-projective-line, P.5/chow-dilogarithm-on-elliptic-curves and P.5/reciprocity-algebraic-numbers; the case n ≥ 4 is P.5/general-weight-reciprocity-conjecture. The Eisenstein-Kronecker expression in weight three is not planned: it needs the elliptic trilogarithm and weight-three Kronecker-Eisenstein series, which no stage owns (gap). The elliptic weight-three special-value conjecture is not asserted.

**Hypotheses.**

- X is a smooth projective complex curve with function field F; currents on X(C) are a gap.

**Construction.**

1. Define rho_2 on generators and rho_3 = r_2 (P.5/r-form).
2. Prove the current identity (84) as in P.5/chow-dilogarithm-steinberg.
3. Record the gap on well-definedness and the status of Conjecture 6.3 in weight three.
4. Record that the elliptic weight-three special-value conjecture is not asserted, as the stage requires.

**API.**

- `weightThreeCurveRegulator` (constructor): (rho_2, rho_3) as above.
- `weightThreeCurveRegulator_d` (characterisation): d rho_2({f}_2 tensor g) = 2π D(f) delta(g) + rho_3(delta_3({f}_2 tensor g)).
- `weightThreeCurveRegulator_diag` (relation): rho_2({f}_2 tensor f) = -d(L_3 o f).

**Unit tests.**

- `rho2_diag_exact` (computation): For f = z on P^1: rho_2({z}_2 tensor z) = -dL_3(z) on C - {0, 1}.
- `rho2_d_P1` (computation): On P^1, integral of d rho_2({z}_2 tensor (z - a)) is 0, i.e. integral r_2((1 - z) wedge z wedge (z - a)) = -2π D(a).
- `rho_not_chow_trilog` (non-example): rho is not omega^3_2: omega^3_2 is a function on codimension-3 cycles of P^5 (surfaces), while rho_3 is a 2-current on the curve.
- `rho_constant_g` (degenerate): rho_2({f}_2 tensor c) = D(f) . 0 - (1/3) alpha(1 - f, f) log|c| for constant c.

**Acceptance.**

- rho_2({z}_2 tensor z) = -dL_3(z) on C - {0, 1}, with L_3 = Re(Li_3 - log|z| Li_2 + (1/3) log^2|z| Li_1) (checked by finite differences).
- The weight-three reciprocity statement is proved in three cases and recorded as a conjecture in general.
- No Eisenstein-Kronecker statement is made.

**Used by.**

- P.6's tests: the weight-three differential identity is (84)
- EllipticRegulators: a weight-three elliptic statement would start from this map (not planned)

**Depends on.** this roadmap: `P.5/curve-polylogarithmic-complex`, `P.5/r-form`, `P.5/chow-dilogarithm-steinberg`, `P.1/bloch-wigner-dilogarithm`, `P.3/weight-three-complex`.

**Used in this roadmap by.** `P.6/tests`, `P.5/weight-three-relation-descent`.

**Sources.**

- `Gonch.Arakelov.2004`, proof of Lemma 6.9, (83) and (84) (PDF p. 57): “Consider the following 1-form on X(C) L2(f)d arg g - (1/3) alpha(1 - f, f) log |g| (83) ... We claim that its derivative is equal to: 2 pi L2(f)delta(g) + r2((1 - f) wedge f wedge g) (84)” — The weight-three curve regulator and its differential identity.
- `Gonch.Arakelov.2004`, Conjecture 6.3 (PDF p. 54): “Let X be a projective regular curve over an algebraically closed field k and F := k(X). Then the homomorphism Res: Gamma(F;n) -> Gamma(k;n-1)[-1] ...” — The general-weight reciprocity conjecture, stated by the source as a conjecture; the weight-three case is the one this node records.
- `Gonch.Arakelov.2004`, Section 6, the list of proved cases (PDF p. 54): “We prove this conjecture in the following cases: a) X = P^1 ... b) X is an elliptic curve over an algebraically closed field ... c) k = Q-bar, X is any curve.” — Exactly which cases are theorems.

**Assembly note.** The Eisenstein–Kronecker expression is planned as `P.5/elliptic-fourier-comparison`, with the series `P.5/generalized-elliptic-trilogarithm`; well-definedness of ρ_2 on B_2(F) ⊗ F^× is `P.5/weight-three-relation-descent`, and the compatibility with K_4 is `P.5/weight-three-motivic-comparison`. The analytic regularisation is the P.5 part's gap 8. The elliptic weight-three special-value conjecture is not a theorem here.

### Gersten graphs and the degree-zero Arakelov presentation

`P.5/gersten-green-assembly` · application · P.5 part

For smooth projective complex X, identify the parent degree-zero higher Arakelov group with GreenCH^p(X), using the graph morphism from the final Gersten terms ⊕_(codim p-2) Λ² C(Y)*→⊕_(codim p-1) C(Y)*→Z^p(X) into the Bloch cycle complex. The requested input is an isomorphism on the last two cohomology groups, together with its compatible tame-symbol/divisor differential; no quasi-isomorphism of the entire complexes is asserted.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Use admissible graph cycles for f and (f,g), moving representatives until all faces are met properly.
2. Import the exact top-two cohomology comparison requested from M.4; S.4 supplies the existing divisor/coniveau identification, with tame-symbol convention from T.3.
3. Evaluate the regulator on graphs: principal pairs and ∂/bar∂ boundaries give exactly the denominator; the top smooth quotient imposes precisely the Green condition.

**Acceptance.**

- Check the p=1 principal graph z↦f(z), including the minus sign in its Green function.
- Do not replace the needed CH^p(X,1) comparison by S.4’s Bloch formula for CH^p(X).

**Depends on.** this roadmap: `P.5/green-presentation`, `P.5/higher-arakelov-chow-degree-zero`, `P.5/arakelov-motivic-complex`; other roadmaps: `SchemeKTheoryOperations:S.4/coniveau-chow-group`, `K2SymbolsBrauer:T.3/tame-symbol`; stages: `MotivicEtaleKTheory:M.4`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/GreenCurrents`, namespace `TauCeti.CurveRegulator`, declaration `gerstenGreenAssembly`.

**Suggested Lean.** Signature omitted: absent carrier: M.4 final Gersten graph comparison in two cohomology degrees and the parent Arakelov cone cohomology.

**Sources.**

- `G05`, Proposition 2.14, pp. 21–22: “Gersten” — The proof uses graph cycles and only the last two cohomology groups.

### The weight-three formula descends to symbols

`P.5/weight-three-relation-descent` · theorem · P.5 part

On a smooth complex curve, the parent formula ρ2({f}2⊗g)=D(f)darg g-(1/3)α(1-f,f)log|g|, α(a,b)=log|a|dlog|b|-log|b|dlog|a|, is compatible with the B2 functional relations and is additive in g. Thus it defines the middle map of the imported weight-three curve polylogarithmic complex. Under the G00 convention Lhat2=iD and α_G00=-α, r3(2)=-ρ2. The neighbouring map is r3(1)=L3, whereas the parent diagonal relation is ρ2({f}2⊗f)=-dL3(f).

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Use the imported B2 relation quotient and the single-valued dilogarithm descent.
2. The relation boundary Σ(1-f)∧f=0 implies Σα(1-f,f)=0 because α is an alternating bilinear map on multiplicative functions; this handles the logarithmic correction.
3. Translate the explicit n=3 formula of G00 and check the diagonal exact form using the parent trilogarithm differential.

**Acceptance.**

- A formal sum relation in B2 maps to zero even when individual logarithmic correction terms are nonzero.
- Do not compare formulas without translating the definition of α.

**Depends on.** this roadmap: `P.3/weight-three-complex`, `P.5/weight-three-curve-regulator`, `P.1/bloch-wigner-dilogarithm`, `P.2/bloch-wigner-descent`, `P.1/bloch-wigner-five-term`.

**Used in this roadmap by.** `P.5/weight-three-motivic-comparison`, `P.5/weight-three-pairing`.

**Library.** module `TauCeti/AlgebraicGeometry/Curves/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `weightThreeRelationDescent`.

**Suggested Lean.** Signature omitted: absent carrier: imported B2 relation quotient, function-field tensor complex, single-valued D/L3 and global logarithmic current form.

**Sources.**

- `G00`, Section 2, n=3 formulas, pp. 5–6; Theorem 2.5(i) proof, p. 20: “homomorphism” — The descent argument uses the functional-relation quotient and its lower-weight boundary.

### The weight-three curve regulator and K4

`P.5/weight-three-motivic-comparison` · comparison · P.5 part

Let X be a smooth projective geometrically integral curve over a number field F. The imported rational map c_(2,3):K4(F(X))_Q→H²Γ(F(X),3)_Q is compatible with Quillen residues K3(κ(x))_Q→H¹Γ(κ(x),2)_Q and with the real Deligne regulator. The resulting unramified class from K4(X)_Q has the curve regulator represented by r3(2)=-ρ2 in the D96 convention. The diagram is a compatibility statement, not an isomorphism on K4. The generic-field construction remains subject to the imported P.3 proof gap.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Import the P.3 map and its unresolved construction proof without duplicating it.
2. Apply D96 Theorem 2.1 only over a number field; its residue fields are finite extensions of F.
3. Use the requested early M.8 universal regulator comparison and the existing BorelRegulators:R.4/regulator-real-isomorphism, which already includes K3(F) through localization. Its real isomorphism implies rational injectivity for number fields, yielding D96 §3.7’s residue argument; do not extend it to arbitrary fields.

**Acceptance.**

- The proof does not show injectivity of a Borel regulator for arbitrary residue fields.
- No full complex-level transfer is inferred from the map on K4.

**Depends on.** this roadmap: `P.3/k-theory-comparison-weight-three`, `P.5/weight-three-relation-descent`; other roadmaps: `SchemeKTheoryOperations:S.4/coniveau-residue-differential`, `BorelRegulators:R.4/regulator-real-isomorphism`.

**Library.** module `TauCeti/AlgebraicGeometry/Curves/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `weightThreeMotivicComparison`.

**Suggested Lean.** Signature omitted: absent carrier: P.3 K4 comparison, rational polylogarithmic cohomology, Quillen residues and M.8 Deligne regulator.

**Sources.**

- `D96`, Theorem 2.1 and preceding curve complex, pp. 6–7; Section 3.7, pp. 22–23: “number” — The arithmetic-field hypothesis is essential to the injectivity argument.

### Generalized Eisenstein–Kronecker series

`P.5/generalized-elliptic-trilogarithm` · definition · planet “Generalized Eisenstein–Kronecker series” · P.5 part

Let Λ=Zu+Zv⊂C with A=Im(conj(u)v)>0 and E(C)=C/Λ. For γ∈Λ set χγ(z)=exp(2πi Im(z conjγ)/A). Define K3(x,y,z)=Σ′_(γ1+γ2+γ3=0) χγ1(x)χγ2(y)χγ3(z)(conjγ3-conjγ2)/(|γ1|²|γ2|²|γ3|²), excluding each zero γ. Equivalently sum over two independent Z² indices with γ3=-γ1-γ2. The sum is absolutely convergent and descends to E³. Extend separately linearly to finite integral divisors in each argument. This three-point weight-three kernel is the generalized elliptic trilogarithmic series in D96, not a one-variable weight-two series.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Construct the oriented lattice character with the actual area A, and prove it is periodic in z modulo Λ.
2. Define the explicit two-index summand, zeroing the excluded indices. Prove absolute convergence by the separate summability theorem before using rearrangements.
3. Extend to divisors by finite sums and show independence of lifts using character periodicity.

**API.**

- `EllipticTrilog.kernel` (constructor): The explicit absolutely convergent two-index sum defines K3.
- `EllipticTrilog.periodic` (functoriality): Adding a lattice element to any argument leaves K3 unchanged.
- `EllipticTrilog.translation` (relation): K3(x+a,y+a,z+a)=K3(x,y,z).
- `EllipticTrilog.antisymmetric` (relation): K3(x,z,y)=-K3(x,y,z), hence K3(x,y,y)=0.
- `EllipticTrilog.divisors` (constructor): Finite integral divisors are evaluated by the trilinear finite sum.
- `EllipticTrilog.scale` (compatibility): Scaling Λ,x,y,z by λ≠0 multiplies K3 by conjλ/|λ|⁶.

**Unit tests.**

- `EllipticTrilog.diagonal` (degenerate): K3(x,y,y)=0, by exchanging the second and third summation variables.
- `EllipticTrilog.zero_divisor` (computation): Evaluation on a zero divisor is zero in every slot.
- `EllipticTrilog.scaling_test` (compatibility): For a positive real scale 2, K3_(2Λ)(2x,2y,2z)=K3_Λ(x,y,z)/32; a weight-two single-index kernel has the wrong exponent.

**Acceptance.**

- Reversing the lattice orientation without changing the character convention changes the formula.

**Used by.**

- D96 Theorem 3.4: The divisor evaluation is the elliptic Fourier expression for the weight-three regulator pairing.
- Polylogarithms:P.6: Supplies an explicit regulator expression, without asserting an L-value formula in P.5.

**Depends on.** libraries: `mathlib:Complex.exp_add`, `mathlib:IsZLattice`, `mathlib:Multipliable`.

**Used in this roadmap by.** `P.5/elliptic-trilogarithm-summability`, `P.5/elliptic-fourier-comparison`.

**Library.** module `TauCeti/NumberTheory/EllipticCurve/Regulators/Trilogarithm`, namespace `TauCeti.CurveRegulator`, declaration `EllipticTrilog.kernel`.

**Suggested Lean.** Concrete coefficient/chart/graded model: quotient elliptic-curve uniformization and divisor lifts; the lifted explicit lattice kernel, divisor sums and invariance signatures are prototyped.

**Sources.**

- `D96`, Section 1.2, definition (1), printed p.1, specialised to n=3: “series” — The three-point generalized Eisenstein–Kronecker series.

### Absolute convergence of the elliptic trilogarithmic series

`P.5/elliptic-trilogarithm-summability` · theorem · P.5 part

For every oriented full lattice Λ in C, the absolute values of the K3 summands over (γ1,γ2)∈Λ² with γ1γ2(γ1+γ2)≠0 are summable, uniformly in x,y,z because all characters have modulus one. Consequently the divisor sum, index permutations, lattice-lift invariance and the scaling identity may be evaluated by absolutely convergent rearrangement.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Use lattice discreteness and the O(R²) point count in discs, reducing norm estimates to Z².
2. Split dyadic blocks by the largest and smallest of |γ1|,|γ2|,|γ3|. At least two are comparable to the largest scale R. The numerator is O(R); if the third scale is s≤R, each term is O(R^(-3)s^(-2)), while the block has O(R²s²) pairs.
3. Sum O(R^(-1)) over the dyadic largest scales and O(log R) possible smaller scales; the total is finite.

**Acceptance.**

- The exclusion γ1+γ2=0 is necessary; a zero denominator is not a summand.

**Depends on.** this roadmap: `P.5/generalized-elliptic-trilogarithm`; libraries: `mathlib:IsZLattice`, `mathlib:Multipliable`.

**Used in this roadmap by.** `P.5/elliptic-fourier-comparison`.

**Library.** module `TauCeti/NumberTheory/EllipticCurve/Regulators/Trilogarithm`, namespace `TauCeti.CurveRegulator`, declaration `EllipticTrilog.absoluteSummability`.

**Suggested Lean.** Concrete coefficient/chart/graded model: no absent carrier for the explicit lifted-lattice summability signature; the analytic proof is unproved.

**Sources.**

- `D96`, Section 1.2, definition (1), printed p.1: “series” — The source specifies the series; the absolute convergence estimate is derived in this node, not quoted as a theorem of the source.

### The weight-three regulator pairing

`P.5/weight-three-pairing` · theorem · P.5 part

For a smooth projective complex curve X, nonzero meromorphic f,1-f,g and a holomorphic or antiholomorphic one-form ω, the locally integrable parent regulator satisfies ∫X ρ2({f}2⊗g)∧ω=-(4/3)∫X log|g|α(1-f,f)∧ω. For r3(2)=-ρ2 the scalar is +4/3. The identities hold termwise, without requiring Σ(1-f)∧f∧g=0; that condition enters the subsequent divisor-only Fourier formula.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Apply the parent differential of D and the type identities darg g∧ω=i dlog|g|∧ω and dD(f)∧ω=-i α(1-f,f)∧ω for holomorphic ω.
2. Use Stokes after deleting small divisor discs; integrable logarithmic singularities make the boundary terms vanish. This gives ∫D(f)darg g∧ω=-∫log|g|α∧ω.
3. Add the -(1/3) correction. For antiholomorphic ω both type signs reverse, giving the same product and scalar.

**Acceptance.**

- Replacing ρ2 by r3(2) changes the scalar sign.
- The same scalar applies to holomorphic and antiholomorphic test forms.

**Depends on.** this roadmap: `P.5/weight-three-relation-descent`, `P.5/r-forms-and-distributions`, `P.1/bloch-wigner-differential`.

**Used in this roadmap by.** `P.5/elliptic-fourier-comparison`.

**Library.** module `TauCeti/NumberTheory/EllipticCurve/Regulators/Trilogarithm`, namespace `TauCeti.CurveRegulator`, declaration `weightThreePairing`.

**Suggested Lean.** Signature omitted: absent carrier: global meromorphic functions, Bloch–Wigner form, locally integrable current pairing and holomorphic/antiholomorphic global one-forms.

**Sources.**

- `D96`, Theorem 3.3 and proof, equations (26)–(28), pp. 20–21: “constant” — The source leaves c3 unspecified; -4/3 is derived here in the parent ρ2 convention.

### The elliptic regulator formula

`P.5/elliptic-fourier-comparison` · theorem · planet “Elliptic regulator formula” · P.5 part

Let E=C/(Zu+Zv), A=Im(conj(u)v)>0, with positive complex orientation and dz the lifted holomorphic form. For a finite rational symbol cycle Σj{fj}2⊗gj with Σj(1-fj)∧fj∧gj=0 in Λ³(C(E)*⊗Q), put Dj=div gj, Fj=div fj, Hj=div(1-fj). In the explicit character and area convention of K3, the target comparison is Σj∫E log|gj|α(1-fj,fj)∧dbarz = iA³/(4π²) ΣjK3(Dj,Fj,Hj), and hence Σj∫Eρ2({fj}2⊗gj)∧dbarz = -iA³/(3π²)ΣjK3(Dj,Fj,Hj). The constants are derived using ordinary area, not copied from D96’s implicit normalization; rigorous Fourier regularisation and source collation are recorded proof gaps.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. With probability area measure μ=dxdy/A, the mean-zero log|f| has coefficient -A div f(χ_-γ)/(2π|γ|²). Also ∂χγ=(π conjγ/A)χγ dz and dz∧dbarz=-2iAμ.
2. Apply these coefficients to the three factors; swapping the second and third arguments and then γ↦-γ produces the positive-character order (div g,div f,div(1-f)) and the displayed constant.
3. Use D96 §3.6 to cancel the constants of the logarithms: the symbol boundary-zero condition and exact dilogarithm differential eliminate each basis constant contribution.
4. Pass from regularised logarithms to currents and their integrals; supply domination near shared divisor points and compare against the source version of record. These two obligations remain explicit, rather than declaring the Fourier argument complete.

**Acceptance.**

- The mean constants cannot simply be set to zero separately without the summed symbol-cycle condition.
- Finite Fourier polynomials must reproduce the iA³/(4π²) scalar and argument order.
- This is a formula for an explicit regulator pairing; no modularity or elliptic L-value assertion is added.

**Depends on.** this roadmap: `P.5/generalized-elliptic-trilogarithm`, `P.5/elliptic-trilogarithm-summability`, `P.5/weight-three-pairing`, `P.5/poincare-lelong`; stages: `ComplexComparisonPartII:C5`.

**Library.** module `TauCeti/NumberTheory/EllipticCurve/Regulators/Trilogarithm`, namespace `TauCeti.CurveRegulator`, declaration `ellipticFourierComparison`.

**Suggested Lean.** Signature omitted: absent carrier: elliptic uniformization, meromorphic divisor/symbol complex and current integral; Fourier regularization and normalization collation remain proof gaps.

**Sources.**

- `D96`, Theorem 3.4 and proof, equations (29)–(31), pp. 21–22: “Fourier” — The convolution and constant-cancellation proof; our area normalization replaces the inconsistent printed integral convention.

### The normalised current dictionary

`P.5/bft-current-dictionary` · comparison · P.5 part

On a smooth projective complex d-fold, the BFT form current is [α](ω)=(2πi)^(-d)∫ω∧α, and its codimension-p cycle current is δY=(2πi)^(-(d-p))∫Yω. Below Deligne degree 2p a degree-k cochain has ordinary form degree k-1 and twist p-1; the top degree uses closed (p,p) currents of twist p. The top differential is -2∂bar∂=2bar∂∂. Apply the requested M.8 Dolbeault real Deligne functor to the smooth/current quasi-isomorphism to identify cohomology with H_D. This pins the BFT model. Identification of the parent raw simplicial regulator with this normalised map still requires its separate degreewise sign/scale dictionary, recorded as a gap.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Keep the dimension shift D_R=E_R′[-2d](-d) and dual test-form twist d-p from BFT equation (2.1).
2. Check the pairing order ω∧α and the cycle normalisation before constructing Deligne complexes.
3. Use the smooth/current quasi-isomorphism and M.8’s generic model comparison; check the top operator against the bars visible in published G05 p.21.

**Acceptance.**

- For p=1 and -log|f| the boundary is -δdiv f.
- On a point H_D^1(point,R(1))=R with unit regulator log|a| under the M.8 convention; the Wang input is its negative.

**Depends on.** this roadmap: `P.5/current-resolution`, `P.5/analytic-cycle-current`, `P.5/goncharov-deligne-complex`, `P.5/goncharov-deligne-complex-comparison`.

**Used in this roadmap by.** `P.5/wang-forms`, `P.5/bft-auxiliary-complex`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `bftCurrentDictionary`.

**Suggested Lean.** Signature omitted: absent carrier: early M.8 Deligne models, Tate twists, smooth/current inclusion and global current degrees.

**Sources.**

- `BFT`, §2, equations (2.1)–(2.2), pp. 3–4: “twist” — Specifies the dimension, current and cycle normalisations.

### Wang forms in a Dolbeault algebra

`P.5/wang-forms` · construction · planet “Wang forms” · P.5 part

For a Dolbeault algebra A and u1,…,um∈D¹(A,1), set S_m^i=(-2)^m Alt(u1∂u2∧…∧∂ui∧bar∂u_(i+1)∧…∧bar∂um), with Alt the unaveraged signed permutation sum. Define T0=1 and Tm=(2m!)^(-1)Σ_(i=1)^m(-1)^i S_m^i. It lies in D^m(A,m), ordinary degree m-1 for m>0. For rational functions use uj=-log|fj|, with ∂uj=-½dlog fj and bar∂uj=-½dbarlog fj. Define Wm=Tm(y1/x1,…,ym/xm) and Gm=Tm(z1/z0,…,zm/z0).

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Construct the finite alternating sum with a fixed bracketing and factorial denominator.
2. Use the Dolbeault type projections supplied by M.8 to check membership in D^m(A,m).
3. Substitute the negative logarithms for rational functions; place W and G on the indicated projective ambient spaces away from their divisors.

**API.**

- `WangForm.coefficients` (data): The pointwise finite polynomial takes real u-values and holomorphic/antiholomorphic degree-one components, with exactly (-2)^m/(2m!) and signs (-1)^i.
- `WangForm.one` (simp): T1(u)=u; for f this is -log|f|.
- `WangForm.two` (simp): T2(u,v)=u(∂v-bar∂v)-v(∂u-bar∂u).
- `WangForm.alternating` (relation): Permuting inputs multiplies Tm by the permutation sign.
- `WangForm.pullback` (functoriality): Pullback by a Dolbeault-algebra morphism commutes with Tm, Wm and Gm.
- `WangForm.unit_function` (simp): For m>0, Tm(f1,…,1,…,fm)=0.

**Unit tests.**

- `WangForm.test_one` (computation): T1 with u=3 and zero derivatives is 3, rather than -3 or 6.
- `WangForm.test_two` (computation): For u=1,v=0, ∂u=bar∂u=bar∂v=0 and ∂v=a, the pointwise T2 is the degree-one form a.
- `WangForm.test_zero` (degenerate): T0=1; a tuple containing the zero jet (the logarithmic jet of the constant function 1) gives zero for m>0.

**Acceptance.**

- Use unaveraged Alt; inserting a second factorial changes T2.

**Used by.**

- BFT Proposition 5.3: The finite formula yields the Deligne differential and comparison with alternating iterated products.
- BFT §6: Wm defines Pc and Gm defines Ps.

**Depends on.** this roadmap: `P.5/bft-current-dictionary`; libraries: `mathlib:ExteriorAlgebra`, `mathlib:ExteriorAlgebra.ι_sq_zero`, `mathlib:ExteriorAlgebra.ι_add_mul_swap`, `mathlib:ExteriorAlgebra.map`.

**Used in this roadmap by.** `P.5/mixed-wang-forms`, `P.5/wang-differential`, `P.5/r-wang-comparison`.

**Library.** module `TauCeti/Analysis/Regulators/WangForms`, namespace `TauCeti.CurveRegulator`, declaration `WangForm.coefficients`.

**Suggested Lean.** Concrete coefficient/chart/graded model: global Dolbeault/Deligne algebra and its rational-function jets; the entire coefficient polynomial and its algebraic naturality are prototyped.

**Sources.**

- `BFT`, §5.1, equations (5.1)–(5.2), p. 8; equations (5.22),(5.25), pp. 14–15: “Wang’s” — The explicit finite sum and the two coordinate specialisations.

### The Wang form differential

`P.5/wang-differential` · theorem · P.5 part

For u_j∈D¹(A,1), Tm is (1/m!) times the alternating right-nested Deligne product uσ1•(uσ2•…•uσm), and d_D Tm=Σ_(j=1)^m(-1)^(j-1)d_Duj•T_(m-1)(u1,…,omit uj,…,um). The nesting is retained: the Deligne product is associative up to homotopy rather than strictly associative.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Differentiate each S_m^i into its ∂ and bar∂ components; adjacent pure-type terms cancel in the signed sum.
2. Collect the remaining mixed terms with the stated index sign and factorial.
3. For the iterated-product identity determine its alternating coefficients using the highest Hodge component; this is the induction of BFT Proposition 5.3.

**Acceptance.**

- At m=1 the formula reads d_DT1=d_Du1.
- Do not flatten the iterated product using a nonexistent strict associativity law.

**Depends on.** this roadmap: `P.5/wang-forms`.

**Used in this roadmap by.** `P.5/wang-boundary-currents`.

**Library.** module `TauCeti/Analysis/Regulators/WangForms`, namespace `TauCeti.CurveRegulator`, declaration `wangDifferential`.

**Suggested Lean.** Signature omitted: absent carrier: typed global ∂,bar∂ and Deligne differential/product, including its homotopy associativity.

**Sources.**

- `BFT`, Proposition 5.3 and proof, pp. 8–10: “recursive” — The formula and product comparison are proved together.

### Comparison with the parent logarithmic r forms

`P.5/r-wang-comparison` · comparison · P.5 part

For nonzero rational functions f1,…,fm, Tm(-log|f1|,…,-log|fm|)=(-1)^m r_(m-1)(f1,…,fm), where the parent r-form uses unaveraged Alt and coefficients 1/((2j+1)!(m-2j-1)!). Equality is of the off-divisor forms and of their locally integrable extension currents. In particular T1=-r0, T2=r1=iη, and T3=-r2.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Expand dlog f into dlog|f|+i darg f and its conjugate in the S terms.
2. Use the binomial identity from BFT proof of Theorem 5.13 to collect terms of matching parity.
3. Compare factorials with the parent coefficients; equality of L1 forms gives equality of their currents.

**Acceptance.**

- T2(z,c)=-i log|c|darg z; the sign is tested before using a residue identity.

**Depends on.** this roadmap: `P.5/wang-forms`, `P.5/r-form`, `P.5/r-forms-and-distributions`.

**Used in this roadmap by.** `P.5/wang-boundary-currents`.

**Library.** module `TauCeti/Analysis/Regulators/WangForms`, namespace `TauCeti.CurveRegulator`, declaration `rWangComparison`.

**Suggested Lean.** Signature omitted: absent carrier: parent global logarithmic r forms and their locally integrable current extension.

**Sources.**

- `BFT`, Equation (5.10), Remark 5.12 and Theorem 5.13, pp. 11–13: “equal” — BFT absorbs the sign (-1)^m into its r convention.

### Boundary identities for Wang currents

`P.5/wang-boundary-currents` · theorem · P.5 part

For rational functions on a smooth projective complex variety, in the BFT normalisation d_D[Tm]=-[T_(m-1)]∘Res, with the exterior residue placing the uniformiser first and T0=1. On (P¹)^m this gives d_D[Wm]=Σ_(i=1)^mΣ_(j=0,1)(-1)^(i+j)(δ_i^j)*[W_(m-1)], with j=0 the zero face and j=1 the ∞ face. For Gm on P^m, d_D[Gm]=Σ_(i=0)^m(-1)^i(∂i)*[G_(m-1)]. The restriction of Wm to a holomorphic map factoring through any ratio-one boundary is zero.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. For normal-crossings divisors compute the logarithmic current residue using Poincaré–Lelong and the Wang differential.
2. Reduce arbitrary divisors by embedded resolution and proper pushforward, using the parent convergence theorem.
3. Compute the exterior residues of the cube coordinate wedge and the simplex ratios explicitly; ratio-one vanishing follows since the full jet of log 1 is zero.

**Acceptance.**

- For m=1, d_D[-log|z|]=-δ0+δ∞.
- This theorem is in the BFT d_D convention; it does not silently settle the parent’s ordinary-d general sign gap E21.

**Depends on.** this roadmap: `P.5/wang-differential`, `P.5/poincare-lelong`, `P.5/r-wang-comparison`, `P.3/exterior-residue`; stages: `AlgebraicModuliForArithmeticGeometry:R09.7`.

**Used in this roadmap by.** `P.5/mixed-wang-forms`, `P.5/cubical-regulator`, `P.5/integration-comparison`.

**Library.** module `TauCeti/Analysis/Regulators/WangForms`, namespace `TauCeti.CurveRegulator`, declaration `wangBoundaryCurrents`.

**Suggested Lean.** Signature omitted: absent carrier: global Wang currents, cubical/simplicial embeddings and exterior-residue current pushforward.

**Sources.**

- `BFT`, Proposition 5.16 equation (5.21), Theorems 5.23,5.26 and Proposition 5.24, pp. 14–15: “residues” — The Deligne-current identity fixes the cubical and simplicial boundary signs.

### Mixed Wang forms

`P.5/mixed-wang-forms` · construction · P.5 part

On (P¹)^n×P^m define M_(n,m)=T_(n+m)(y1/x1,…,yn/xn,z1/z0,…,zm/z0), with M_(0,0)=1. Its current differential is the sum of cubical face currents with signs (-1)^(i+j) and simplicial face currents with signs (-1)^(n+i). It restricts to Wn when m=0 and to Gm when n=0. It vanishes on every ratio-one cubical boundary.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Insert both ordered coordinate tuples in the same alternating polynomial.
2. Compute residues with the cube variables placed first; a simplex residue crosses n variables and gains (-1)^n.
3. Apply resolution, local integrability and the unit-jet vanishing already proved for T.

**API.**

- `MixedWangForm.apply` (data): The form is T on the ordered concatenation of cube and simplex ratios.
- `MixedWangForm.cube` (simp): M_(n,0)=Wn.
- `MixedWangForm.simplex` (simp): M_(0,m)=Gm.
- `MixedWangForm.boundary` (characterisation): d_D[M_(n,m)] has the cube signs (-1)^(i+j) and simplex signs (-1)^(n+i).

**Unit tests.**

- `MixedWangForm.origin` (degenerate): M_(0,0)=1.
- `MixedWangForm.one_each` (computation): M_(1,1) equals T2 of the two coordinate logarithmic jets, with coefficient one in the explicit T2 formula.
- `MixedWangForm.ratio_one` (non-example): The restriction to y1/x1=1 is zero, whereas evaluation at a nonconstant ratio need not vanish.

**Acceptance.**

- At (n,m)=(1,1) the simplex differential has the negative total-complex sign.

**Used by.**

- BFT Section 6.4: Defines the common regulator comparing simplex and cube complexes.

**Depends on.** this roadmap: `P.5/wang-forms`, `P.5/wang-boundary-currents`; libraries: `mathlib:Fin.append`.

**Used in this roadmap by.** `P.5/mixed-regulator`.

**Library.** module `TauCeti/Analysis/Regulators/WangForms`, namespace `TauCeti.CurveRegulator`, declaration `MixedWangForm.apply`.

**Suggested Lean.** Concrete coefficient/chart/graded model: global current extension and its face differential; only ordered concatenation of logarithmic jets is prototyped.

**Sources.**

- `BFT`, Section 6.4, equation (6.14), p. 20, and Lemma 6.16 and its proof, p. 21: “morphism” — The mixed form, its two face ranges and boundary signs.

### The cubical logarithmic regulator

`P.5/cubical-regulator` · construction · P.5 part

For smooth projective complex X and an admissible integral codimension-p cycle Z in X×□^m, □=P¹\{1}, let Zbar be its projective closure and ι:Ztilde→X×(P¹)^m a resolution. Define Pc(Z)=πX*ι*[Tm of the restricted coordinate functions]=πX*(δZ∧Wm) in τ≤2p D_D^(2p-m)(X,p), with the BFT current twists. The product notation is defined through resolution and integration, not by an arbitrary current product. Extend linearly on the M.4 normalised cube complex ∩ker(∞ faces), with differential δ=Σ_i(-1)^i zero-face_i. Pc is independent of resolution and is a chain map.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Proper face intersection makes every restricted coordinate function nonzero at the generic point of Z.
2. Use the parent convergence theorem on a common resolution and BFT normalised pushforward to define the current.
3. Apply the Wang boundary identity and proper pushforward; ∞-face terms vanish on the normalised complex.

**API.**

- `CubicalRegulator.cycle` (constructor): An admissible generator maps to πX* of its resolved Wang current.
- `CubicalRegulator.resolution` (compatibility): Different resolutions give the same current.
- `CubicalRegulator.boundary` (characterisation): d_D Pc(Z)=Pc(δZ) on the normalised complex.
- `CubicalRegulator.zero_degree` (simp): Pc at m=0 is the BFT cycle current.

**Unit tests.**

- `CubicalRegulator.point` (computation): For a point on a complex curve in m=0 the image is its Dirac current.
- `CubicalRegulator.P1_unit` (computation): For the degree-one point t=a of □ with a≠0,1,∞ and X a point, Pc(a)=-log|a|.
- `CubicalRegulator.face_excluded` (non-example): A component lying in t=0 is not an admissible input; assigning log 0 to it is not a regulator extension.

**Acceptance.**

- At m=0 the regulator is exactly δZ.

**Used by.**

- BFT Theorems 6.10–6.11: The cubical map is compared with the support-complex regulator.
- BFT Lemma 6.17: The mixed map restricts to Pc.

**Depends on.** this roadmap: `P.5/wang-boundary-currents`, `P.5/analytic-cycle-current`, `P.5/r-forms-and-distributions`; stages: `MotivicEtaleKTheory:M.4`.

**Used in this roadmap by.** `P.5/mixed-regulator`, `P.5/green-wang-product`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `CubicalRegulator`.

**Suggested Lean.** Signature omitted: absent carrier: M.4 admissible normalized cycles, R09.7 resolution and early M.8 Deligne-current complex.

**Sources.**

- `BFT`, §6.2, equation (6.3) and Lemma 6.4, pp. 16–17: “cubical” — The explicit cycle current and chain map.

### The mixed cycle regulator

`P.5/mixed-regulator` · construction · P.5 part

For the M.4 admissible mixed codimension-p cycle complex on X×□^n×Δ^m, use Δ^m=P^m minus {Σ_(i=0)^m zi=0}. Define Pcs(Z)=πX*(δZ∧M_(n,m)) through projective closure and resolution, in Deligne degree 2p-n-m. The mixed total boundary is δ+(-1)^n∂. The map is a chain map and restricts along the M.4 cubical and simplicial inclusions ic,is to Pc and Ps. To identify the parent simplex convention Σ_(i=1)^m zi=z0 use z0↦-z0; constant factors -1 do not change logarithmic jets.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Use the existing admissibility and resolution construction, now for both sets of faces.
2. Push forward the mixed current boundary identity; the simplex term acquires precisely the totalisation sign.
3. Restrict to n=0 and m=0 and compare simplex hyperplane conventions by the stated projective automorphism. Correct BFT preprint equation (6.15) to degree 2p-n-m.

**API.**

- `MixedRegulator.cycle` (constructor): An admissible mixed generator maps to its resolved M current pushed to X.
- `MixedRegulator.degree` (data): Bidegree (n,m) maps to Deligne degree 2p-n-m.
- `MixedRegulator.chain` (characterisation): d_D Pcs=Pcs(δ+(-1)^n∂).
- `MixedRegulator.restrict` (compatibility): Pcs∘ic=Pc and Pcs∘is=Ps in the same BFT model.

**Unit tests.**

- `MixedRegulator.axes` (compatibility): At (n,0) the map equals Pc, and at (0,m) it equals Ps.
- `MixedRegulator.degree_test` (computation): For p=2,n=1,m=1 the target degree is 2, rather than 3.
- `MixedRegulator.origin` (degenerate): At (0,0) an admissible cycle maps to δZ.

**Acceptance.**

- The projective projection has relative complex dimension n+m; neither index may be dropped from the output degree.

**Used by.**

- BFT Theorem 6.18: Transfers the cubical universal-regulator comparison to the simplicial regulator.

**Depends on.** this roadmap: `P.5/mixed-wang-forms`, `P.5/cubical-regulator`, `P.5/regulator-map-on-higher-chow`; stages: `MotivicEtaleKTheory:M.4`.

**Used in this roadmap by.** `P.5/simplicial-cubical-comparison`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `MixedRegulator`.

**Suggested Lean.** Signature omitted: absent carrier: M.4 mixed admissible cycle complex and global current target, with both face directions.

**Sources.**

- `BFT`, Section 6.4, equation (6.15), Lemmas 6.16 and 6.17, pp. 20–21: “morphism” — The common chain map and its two restrictions.

### Simplicial and cubical regulators agree

`P.5/simplicial-cubical-comparison` · comparison · P.5 part

For smooth projective complex X, the M.4 mixed-cycle inclusions is and ic are quasi-isomorphisms and identify the homology maps of Ps and Pc through Pcs. The simplicial regulator is the parent Goncharov cycle formula evaluated in the BFT normalised current model. The additional degreewise conversion from the parent raw G05 model is a separate recorded gap.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Import the exact two mixed-inclusion quasi-isomorphisms, Levine’s comparison as stated in BFT Proposition 6.12.
2. Use the two chain-level restriction equalities from Lemma 6.17.
3. Invert their homology isomorphisms to compare the regulators; retain the parent raw-model conversion as an explicit obligation.

**Acceptance.**

- The comparison uses inverse homology maps; a simplex cycle is not by definition a cube cycle.

**Depends on.** this roadmap: `P.5/mixed-regulator`; stages: `MotivicEtaleKTheory:M.4`.

**Used in this roadmap by.** `P.5/beilinson-comparison-assembly`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `simplicialCubicalComparison`.

**Suggested Lean.** Signature omitted: absent carrier: M.4 mixed-inclusion quasi-isomorphisms and induced higher Chow regulator maps.

**Sources.**

- `BFT`, Proposition 6.12, p. 20; Lemma 6.17, p. 21: “quasi-isomorphisms” — The mixed inclusions are the bridge, rather than an asserted equality of the two cycle complexes.

### The support complex for the regulator comparison

`P.5/bft-auxiliary-complex` · construction · P.5 part

With M.8 logarithmic Deligne complexes and M.4 admissible cube supports, form DA^(r,-m)=τ≤2p Dlog^r(X×□^m,p), take ∞-face normalisation, and totalise with d_D+(-1)^rδ. Let DA_Z be the corresponding support cone s(Dlog(X×□^m)→Dlog((X×□^m)\Z)), and Hp_m its top support cohomology H_D,Z^(2p). Use the standard maps g1:DA_Z^(2p-*)→Hp_* and ρ:DA_Z→DA. Fix cochain grading: DA_H^q=DA_Z^(q+1)⊕Hp^q⊕DA^q. Define DA_H as the shifted simple of Hp←g1 DA_Z→ρ DA: d(a1,a2,a3)=(-da1, da2+g1a1, da3-ρa1). Its maps are β(α)=(0,0,α) and the cycle map z↦(0,cl(z),0).

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Import Deligne support cone, purity and homotopy invariance from the early M.8 contract.
2. Construct normalisation and total complexes over the M.4 supports; identify top support classes with cycles tensored with R by purity.
3. Assemble the shifted simple with the displayed signs; g1 is a quasi-isomorphism by the truncation/purity contract, so β is one too.
4. Correct the first-coordinate degree and cycle insertion in the preprint §4.8; in this fixed order the support complex is first, cycles second and base forms third. The theorem-6.10 display is translated from its cycle-first notation.

**API.**

- `BFTAuxiliary.differential` (data): The three-coordinate differential is exactly the one in the statement.
- `BFTAuxiliary.beta` (constructor): β includes DA as the third coordinate and is a quasi-isomorphism.
- `BFTAuxiliary.cycle` (constructor): In the fixed (support,cycle,base) order, a cycle z maps to (0,cl(z),0).
- `BFTAuxiliary.purity` (compatibility): Top support Deligne cohomology is the admissible cycle group tensored with R; g1 is the induced top-class projection.

**Unit tests.**

- `BFTAuxiliary.beta_sign` (computation): d(0,0,α)=(0,0,dα), so β is a cochain map.
- `BFTAuxiliary.square` (characterisation): For chain maps g1 and ρ, the displayed differential squares to zero on each of the three summands.
- `BFTAuxiliary.point_top` (compatibility): For X a point and p=m=0, the top support cycle class is R and sends the integral generator to 1.

**Acceptance.**

- Changing either minus sign in the simple differential can violate d²=0.

**Used by.**

- BFT §6.3: The three summands are precisely the inputs to the chain comparison ψ.

**Depends on.** this roadmap: `P.5/bft-current-dictionary`; stages: `MotivicEtaleKTheory:M.4`; libraries: `mathlib:CochainComplex.mappingCone`.

**Used in this roadmap by.** `P.5/integration-comparison`, `P.5/regulator-homotopy`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `BFTAuxiliary.Degree`.

**Suggested Lean.** Concrete coefficient/chart/graded model: early M.8 support cones/purity, M.4 normalized cube support diagram and top cohomology classes; only the genuine graded additive-group simple and β are prototyped.

**Sources.**

- `BFT`, §4, Proposition 4.3 and equations (4.4),(4.8), pp. 6–8: “simple” — The auxiliary diagram, shifts and signs.

### Integration against Wang forms

`P.5/integration-comparison` · construction · P.5 part

For DA^(r,-m), define φ(α)=πX*[α•Wm] in Deligne degree r-m. The product uses the M.8 fixed Deligne product and has ordinary degree r+m-1 before projection, except at m=0,r=2p, where the top Deligne cochain is an ordinary degree-2p form and W0=1 preserves that degree. On the ∞-face normalised DA complex this lands in smooth τ≤2p D(X,p), is a cochain map and a quasi-inverse of the base inclusion τD(X,p)→DA(X,p)_0.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Combine local logarithmic integrability with the ratio-one vanishing of Wm to control the compactification boundary.
2. Prove d_D[α•Wm]=[d_Dα•Wm]+(-1)^rΣ_i,j(-1)^(i+j)(δ_i^j)*[(δ_i^j)*α•W_(m-1)].
3. Push forward to match the total differential; on normalised inputs the resulting current is smooth. The composition with the base inclusion is identity, and base inclusion is a quasi-isomorphism by M.8 homotopy invariance.

**API.**

- `WangIntegration.apply` (data): φ(α)=πX*[α•Wm].
- `WangIntegration.chain` (characterisation): φ commutes with the total d_D+(-1)^rδ differential.
- `WangIntegration.base` (simp): At m=0, φ is the normalised smooth-form inclusion into currents.
- `WangIntegration.inverse` (equivalence): On cohomology φ is inverse to base inclusion.

**Unit tests.**

- `WangIntegration.base_test` (compatibility): φ at m=0 has current evaluation (2πi)^(-dim X)∫ω∧α.
- `WangIntegration.zero` (degenerate): φ(0)=0 in every bidegree.
- `WangIntegration.degree` (characterisation): An input of bidegree (r,-m) has output Deligne degree r-m, not r+m. At m=0,r=2p (in particular p=1,r=2), W0 preserves the ordinary top degree 2p, rather than the lower-degree formula 2p-1.

**Acceptance.**

- The normalisation condition is used for smooth landing.

**Used by.**

- BFT Theorem 6.10: The third component of ψ and the β comparison square.

**Depends on.** this roadmap: `P.5/wang-boundary-currents`, `P.5/bft-auxiliary-complex`, `P.5/logarithmic-current-estimate`.

**Used in this roadmap by.** `P.5/green-wang-product`, `P.5/regulator-homotopy`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `WangIntegration`.

**Suggested Lean.** Signature omitted: absent carrier: logarithmic Deligne forms, the fixed Deligne product, current integration and the normalized auxiliary complex.

**Sources.**

- `BFT`, Theorem 6.5(1)–(4), p. 17: “quasi-inverse” — The integrability, smooth landing and comparison are all required.

### The Green form and Wang current product identity

`P.5/green-wang-product` · theorem · P.5 part

For a normalised support representative (ω,g) of degree r over X×□^m, the form g•Wm is locally L1. At r=2p, if cl(ω,g)=cl(z), d_D[g•Wm]=[ω•Wm]-δz•Wm-[δg•W_(m-1)]. At r<2p, d_D[g•Wm]=[d_Dg•Wm]+(-1)^(r-1)[δg•W_(m-1)]. Face sums in δ use the normalised cube differential and support changes. The expression δz•Wm is the resolved cycle current of Pc.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Choose basic Green representatives on a resolution simultaneously adapted to the cycle and cube boundary.
2. Use the local radial estimates and ratio-one vanishing to obtain L1 products.
3. Apply the basic Green residue computation; the top degree contributes the cycle current, while residues vanish in lower degrees. Combine the graded Leibniz sign with the Wang face identity.

**Acceptance.**

- At m=0 and r=2p this reduces to d_D[g]+δz=[ω].
- The minus cycle term and the lower-degree parity cannot be omitted.

**Depends on.** this roadmap: `P.5/logarithmic-current-estimate`, `P.5/green-current-comparison`, `P.5/integration-comparison`, `P.5/cubical-regulator`.

**Used in this roadmap by.** `P.5/regulator-homotopy`.

**Library.** module `TauCeti/Analysis/Regulators/WangForms`, namespace `TauCeti.CurveRegulator`, declaration `greenWangProduct`.

**Suggested Lean.** Signature omitted: absent carrier: global logarithmic Green representatives, Wang-current products defined on resolutions and their face residues.

**Sources.**

- `BFT`, Equation (6.6), Propositions 6.7 and 6.9, pp. 18–19: “integrable” — These are the two degree ranges used in the chain comparison.
- `BUR`, Chapter II §3 and proof of Theorem 4.3, pp. 73–82: “residue” — Local estimates and exceptional-divisor residue computation underpin the adaptation.

### The regulator chain comparison

`P.5/regulator-homotopy` · construction · P.5 part

On DA_H^(2p-*) define ψ((ω,g),z,α)=Pc(z)-πX*[g•Wm]+φ(α), in the fixed (support,cycle,base) coordinate order, with the bidegree of the support representative specifying m. This is a cochain map to τD_D^(2p-*) and satisfies ψ∘cycle=Pc and ψ∘β=φ. Thus Pc and the Burgos–Feliu support regulator agree on higher Chow homology through the common support complex.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Construction.**

1. Define each summand with the same Tate twists and target grading.
2. Substitute the auxiliary differential and the two Green product identities; all support and face terms cancel.
3. Restrict to the second (cycle) and third (base) summands in the fixed (support,cycle,base) order to obtain the commuting square. β and φ induce isomorphisms, so the square compares the regulators on homology.

**API.**

- `RegulatorComparison.apply` (data): ψ is Pc minus the Green integral plus φ, with the specified grading.
- `RegulatorComparison.chain` (characterisation): ψ commutes with the three-coordinate differential.
- `RegulatorComparison.cycle` (simp): ψ(0,z,0)=Pc(z) in the fixed (support,cycle,base) order.
- `RegulatorComparison.beta` (simp): ψ(0,0,α)=φ(α).

**Unit tests.**

- `RegulatorComparison.first` (compatibility): On a pure cycle the comparison gives Pc.
- `RegulatorComparison.third` (compatibility): On a pure third-coordinate form the comparison gives φ.
- `RegulatorComparison.middle_sign` (computation): On ((ω,g),0,0) in the fixed coordinate order the value is -πX*[g•Wm], rather than its positive.

**Acceptance.**

- The correction term is negative.

**Used by.**

- BFT Theorem 6.11: Identifies Pc with the Burgos–Feliu regulator.

**Depends on.** this roadmap: `P.5/bft-auxiliary-complex`, `P.5/integration-comparison`, `P.5/green-wang-product`.

**Used in this roadmap by.** `P.5/cubical-beilinson`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `RegulatorComparison.apply`.

**Suggested Lean.** Concrete coefficient/chart/graded model: the specialized auxiliary support complex and the actual Pc/Green/φ maps; only the pointwise three-term formula is prototyped.

**Sources.**

- `BFT`, Theorem 6.10, pp. 18–19: “diagram” — The explicit ψ and the commuting comparison square.

### The cubical regulator agrees with the universal regulator

`P.5/cubical-beilinson` · comparison · P.5 part

For smooth projective complex X and p,n≥0, Pc:CH_c^p(X,n)→H_D^(2p-n)(X,R(p)) agrees with the Burgos–Feliu support regulator. After the M.6 rational Chern character K_n(X)_Q≅⊕pCH^p(X,n)_Q and the M.8 universal Chern normalisation, its direct sum is Beilinson’s regulator. This does not redefine the universal Chern classes in P.5.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Use the commuting ψ/β/φ square to identify Pc with the support regulator.
2. Import the precise Burgos–Feliu/universal Chern character comparison requested from early M.8, matching its ch_p,n convention with the M.6 eigenspaces.
3. Compose with the rational higher-Chow Chern character.

**Acceptance.**

- The m=0 case is the normalised cycle-class map, not a freely rescaled one.
- For a∈C* with a≠1, Pc([a])=-log|a| while the chosen universal Deligne unit is +log|a|. The M.6 K1-to-cycle character must therefore provide the compensating sign (−[a], equivalently the inverse-point class); do not assert unit agreement before that convention is exported.

**Depends on.** this roadmap: `P.5/regulator-homotopy`; stages: `MotivicEtaleKTheory:M.6`.

**Used in this roadmap by.** `P.5/beilinson-comparison-assembly`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `cubicalBeilinson`.

**Suggested Lean.** Signature omitted: absent carrier: M.4 higher Chow homology, M.6 rational K/Chern character and early M.8 universal regulator.

**Sources.**

- `BFT`, Theorem 6.11, p. 19, with Theorem 4.7, p. 7: “regulator” — The support comparison and universal-regulator input are distinct.

### The simplicial regulator agrees with Beilinson’s regulator

`P.5/beilinson-comparison-assembly` · application · P.5 part

For every smooth projective complex variety X and n≥0, the direct sum of the BFT-normalised simplicial regulators CH_s^p(X,n)_Q→H_D^(2p-n)(X,R(p)), composed with the M.6 rational higher Chern character K_n(X)_Q→⊕pCH_s^p(X,n)_Q, equals the M.8 universal Beilinson regulator. This is the precise content and hypothesis range of BFT Theorem 6.18. Identification with every raw parent convention is conditional on the recorded model-conversion gap.

**Hypotheses.**

- The hypotheses and conventions in the statement are part of the declaration.

**Proof.**

1. Follow Pc through the auxiliary-complex comparison ψ and the Burgos–Feliu/universal input.
2. Transfer the resulting equality along the mixed cycle quasi-isomorphisms.
3. Compose with the common rational Chern character and keep the parent ordinary-d sign conversion separate.

**Acceptance.**

- No extension to arbitrary singular or nonproper X is inferred from this theorem.

**Depends on.** this roadmap: `P.5/simplicial-cubical-comparison`, `P.5/cubical-beilinson`, `P.5/regulator-induces-beilinson`; stages: `MotivicEtaleKTheory:M.6`.

**Library.** module `TauCeti/AlgebraicGeometry/HigherChow/RegulatorComparison`, namespace `TauCeti.CurveRegulator`, declaration `beilinsonComparisonAssembly`.

**Suggested Lean.** Signature omitted: absent carrier: M.6 rational higher Chern character and early M.8 Beilinson regulator in the same normalization.

**Sources.**

- `BFT`, Theorem 6.18 and proof, p. 21: “Beilinson” — The final theorem is a composition of the preceding comparison square and mixed-complex maps.

## P.6 — Other precise statements and tests

*Coverage in `Polylogarithms.json`: partial, 4 nodes.* Leopoldt's conjecture in the injectivity form, the p-adic regulator and its rank, the proved equivalence (Neukirch-Schmidt-Wingberg 10.3.6), and the tests with explicit points.

Remaining in this record:

- The weight-three differential of L_3 as an API item of P.1 (gap)

*Coverage in `Polylogarithms--P.6.json`: planned, 2 nodes.*

Remaining in this record:

- Bind the inherited P.6 Leopoldt-equivalence adapter to declaration-level nodes for I.2’s completed map, strong proposition and defect, and D.1’s regulator-specific principal-unit/kernel/rank comparison. The logarithm itself and its finite-extension compatibility already have exact ColemanIntegration L0 supplier nodes listed in targetCoverage.
- At assembly treat the old P.6/leopoldt-statement as an I.2 import and remove its stale ownership sentence and planet from P.6. Retain the regulator equivalence and tests; add the I.2 → P.6 edge without a reverse dependency.
- At assembly add the new differential prerequisite to the old P.6/tests node and remove only the weight-three differential clause of its source gap. Preserve the general-weight, higher-Bloch descent and P.5 current/source obligations belonging to their own stages.
- Discharge the inherited P.1/bloch-wigner-positivity minimum-principle gap before the strict sign assertion of trilog_diff_i_sign is proved; its derivative equality and radial assertion do not use positivity.

The layer has 6 nodes: the first packet's four, which state Leopoldt's conjecture, build the p-adic regulator, prove the equivalence of its forms and collect the tests the stage text asks for, and the P.6 part's two, which plan the weight-three differential the first packet left open and test it exactly.

- **Leopoldt.** For a number field K and a prime p, Leopoldt's conjecture is the proposition that E_K ⊗ ℤ_p → ∏_{v ∈ S_p ∪ S_∞} Û_v is injective; it is a statement, never an assumption, and nothing in the atlas's construction of local regulators or Iwasawa cohomology uses it. With the p-adic regulator matrix (log_p σ_j(ε_i)), indexed by all [K : ℚ] embeddings into ℂ_p, it is equivalent to rank r_1 + r_2 − 1 of that matrix, to the rank of the closure of the units, and for totally real K to R_p(K) ≠ 0 (NSW 10.3.6). Ownership has moved: the completed global-to-local unit map, the strong Leopoldt proposition and the defect δ_{K,p} belong to IntegralIwasawaTheory I.2, which supplies them to I.2's own consumers L4 and AutomorphicPadicLFunctions L0 and to this layer, with no dependency on polylogarithms (confirmed red-team finding RT-AREA-ktheory-2/26). This layer keeps the p-adic regulator, the equivalence and the tests; `P.6/leopoldt-statement` is the adapter through which they read I.2's statement. The logarithm on ℂ_p and its compatibility with finite extensions are ColemanIntegration L0's nodes; PadicHodgeRegulators D.1 supplies only the regulator-specific comparison (principal units, the finite torsion kernel, including p-primary torsion at p = 2, and the rationalised rank).
- **The tests.** The exact five-term instance at x = i/2, y = (1 + i)/2; the certified numerics, now with the P.2 part's error bound; the vanishing at real embeddings; every claimed Bloch element carrying its boundary proof through K3BlochGroups V.6's constructor, so that a list of floating-point values is never a certificate; and the weight-three identities.
- **The weight-three differential.** For z ∉ {0, 1}, L_3 is real-differentiable and dL_3(z)[v] = −D(z) Im(v/z) + (a/3)(b Re(v/z) − a Re(v/(z − 1))), a = log|z|, b = log|1 − z|; that is, dL_3 = −D d arg z + (1/3) log|z| (log|1 − z| d log|z| − log|z| d log|1 − z|), with d arg z the global one-form v ↦ Im(v/z), valid also on the cut z > 1. It is the case n = 3 of Goncharov's Proposition 4.1 after converting his L̂_2 = iD, and its printed logarithm exponent n − k (source issue E22 of the P.6 part) is corrected to k. Five exact tests check it at 1/2, at 2 on the cut, at −1, on the unit circle and at i; each includes differentiability, so Mathlib's totalised fderiv cannot pass a false claim. The strict sign at i uses the positivity of D (`P.1/bloch-wigner-positivity`), whose minimum-principle input is P.1's gap; the derivative identities do not.

**How the parts fit.** The P.6 part imports the first packet's four nodes by id and answers the first packet's one remaining P.6 item. The Assembly notes after `P.6/leopoldt-statement` and `P.6/tests` record the two changes the P.6 part asks for: the statement node is I.2's adapter and its planet belongs at I.2, and the test suite's weight-three clause is now the differential theorem rather than a finite-difference check.

### Leopoldt's conjecture

`P.6/leopoldt-statement` · definition · planet “Leopoldt's conjecture” · first packet

For a number field K with unit group E_K and a prime p, Leopoldt's conjecture for K and p is the Prop that the canonical map E_K tensor Z_p → product over the places p of S = S_p u S_infinity of U-hat_p is injective, where U_p is the unit group of K_p (K_p^x at an archimedean place) and U-hat its p-adic completion (NSW 10.3.6(iii)); equivalently rr_p(K) = r_1 + r_2 - 1 (P.6/padic-regulator, NSW 10.3.5). The uncompleted map E_K → product of K_p^x is injective for every K, so the conjecture is about the completion. It is a statement, never a typeclass assumption, and no construction of the local regulator or of Iwasawa cohomology assumes it.

**Hypotheses.**

- K is a number field; p is a prime.
- E_K = (O_K)^x (mathlib:NumberField.Units.torsion, fundSystem); the principal units U^1 at the places above p are tauceti:TauCeti.unitFiltration.

**Construction.**

1. Import the completed global-to-local unit map and its strong-Leopoldt injectivity proposition from the requested early I.2 interface. Keep the passage to local pro-p units explicit: ordinary units do not canonically land in principal units without powering or a Teichmüller/pro-p projection.
2. State injectivity as a Prop.
3. Record the proved special case, the abelian one, which IntegralIwasawaTheory L4 owns through Baker-Brumer.

**API.**

- `LeopoldtConjecture` (characterisation): The Prop: E_K tensor Z_p → product of U-hat_p is injective.
- `leopoldt_iff_rank` (characterisation): LeopoldtConjecture K p iff rr_p(K) = r_1 + r_2 - 1. Promoted to Polylogarithms:P.6/leopoldt-equivalence.
- `leopoldt_abelian` (compatibility): The abelian case, imported from IntegralIwasawaTheory L4.

**Unit tests.**

- `imaginary_quadratic` (degenerate): For K imaginary quadratic, r_1 + r_2 - 1 = 0 and the conjecture holds.
- `naive_map_injective` (non-example): The uncompleted map E_K → product over p | p of K_p^x is injective for every K, so the conjecture cannot be stated on E_K itself.
- `real_quadratic` (computation): K = Q(sqrt 2), p = 7: the conjecture holds, since R_7(K) = +-log_7 sigma(1 + sqrt 2) ≠ 0 (test padicRegulator_Q_sqrt2_7).
- `abelian_case` (compatibility): For an abelian field the conjecture holds, by IntegralIwasawaTheory L4.

**Acceptance.**

- For K = Q or K imaginary quadratic the rank r_1 + r_2 - 1 is 0 and the conjecture holds trivially.
- For an abelian field the conjecture is a theorem, imported and not reproved.
- The statement is a conjecture declaration, never a typeclass assumption used to prove something else.

**Used by.**

- P.6's tests: the statement is what the tests are about
- IntegralIwasawaTheory and AutomorphicPadicLFunctions: both use the same closure of global units in local units; the statement is planned once, here

**Depends on.** stages: `IntegralIwasawaTheory:L4`, `PadicHodgeRegulators:D.1`, `IntegralIwasawaTheory:I.2`; libraries: `mathlib:NumberField.Units.torsion`, `mathlib:NumberField.Units.fundSystem`, `mathlib:NumberField.Units.rank`, `tauceti:TauCeti.unitFiltration`.

**Used in this roadmap by.** `P.6/leopoldt-equivalence`.

**Library.** module `TauCeti/NumberTheory/Leopoldt`, namespace `TauCeti.Leopoldt`.

**Sources.**

- `NSW.2013`, Theorem 10.3.6 (PDF p. 628 of the electronic edition 2.3): “(i) Leopoldt's conjecture is true for K and p. (ii) rank Zp E(S)K = r1 + r2 - 1. (iii) The canonical homomorphism EK tensor Z Zp -> prod_{p in S} U-hat_p is injective.” — The injectivity form, with the equivalence proved there.
- `NSW.2013`, (10.3.5) (PDF p. 627): “Leopoldt's Conjecture. For every number field K and every prime number p, the p-adic regulator rank rrp(K) is equal to r1 + r2 - 1.” — The rank form.

**Assembly note.** IntegralIwasawaTheory I.2 owns the completed global-to-local unit map, the strong Leopoldt proposition and the defect (confirmed red-team finding RT-AREA-ktheory-2/26, applied by the P.6 part). This node is the adapter through which `P.6/leopoldt-equivalence` reads I.2's statement; its use claiming ownership in P.6, and its planet, belong to I.2. The p-adic regulator and the equivalence stay here.

### The p-adic regulator

`P.6/padic-regulator` · definition · first packet

For a number field K of degree d, a prime p, a basis eps_1, ..., eps_r of E_K modulo torsion (r = r_1 + r_2 - 1) and the d embeddings sigma_1, ..., sigma_d of K into C_p (values already in Q_p-bar = PadicAlgCl p), the regulator matrix is R_p(eps) = (log_p sigma_j(eps_i))_{i≤r, j≤d}, and rr_p(K) := rank R_p(eps), independent of the choices (NSW 10.3.3). For K totally real, R_p(K) := det of any (d-1) x (d-1) minor, well defined up to sign (10.3.4).

**Hypotheses.**

- K is a number field, p a prime; log_p is Iwasawa's p-adic logarithm (PadicHodgeRegulators D.1).

**Construction.**

1. Define the matrix and its rank; independence of the basis and of the ordering (NSW Remark 1).
2. For K totally real the columns sum to 0 (the norm of a unit is +-1), so all (d-1)-minors agree up to sign.

**API.**

- `padicRegulatorMatrix` (constructor): (log_p sigma_j(eps_i)), an r x d matrix over PadicAlgCl p.
- `padicRegulatorRank` (constructor): rr_p(K), the rank of the matrix.
- `padicRegulatorRank_indep` (characterisation): Independent of the basis and of the ordering.
- `padicRegulatorRank_le` (relation): rr_p(K) ≤ r_1 + r_2 - 1.
- `padicRegulator` (constructor): R_p(K) for K totally real, up to sign.

**Unit tests.**

- `padicRegulator_imag_quadratic` (degenerate): For K imaginary quadratic, r = 0 and rr_p(K) = 0.
- `padicRegulator_Q_sqrt2_7` (computation): K = Q(sqrt 2), p = 7, sqrt 2 = 10 mod 49: eps = 1 + sqrt 2 maps to 11, eps^6 = 15 mod 49, so v_7(log_7 eps^6) = 1 and R_7(K) ≠ 0.
- `rank_two_places` (non-example): The matrix has d = 2 columns for Q(sqrt 2) whatever p does: a matrix indexed by the places above p (one column if p is inert, two if split) is not the regulator matrix.
- `unit_not_root_of_unity` (characterisation): If eps is a unit that is not a root of unity then log_p(eps) ≠ 0 (NSW, after 10.3.5).

**Acceptance.**

- For Q(sqrt 2) and p = 7, R_7 ≠ 0.
- For imaginary quadratic K the matrix is empty.

**Used by.**

- P.6's Leopoldt statement: the rank form rr_p(K) = r_1 + r_2 - 1
- IntegralIwasawaTheory L4: the Baker-Brumer theorem gives R_p ≠ 0 for abelian fields

**Depends on.** stages: `PadicHodgeRegulators:D.1`; libraries: `mathlib:PadicAlgCl`, `mathlib:NumberField.Units.fundSystem`, `mathlib:NumberField.Units.rank`, `mathlib:Matrix.det`.

**Used in this roadmap by.** `P.6/leopoldt-equivalence`.

**Library.** module `TauCeti/NumberTheory/Leopoldt`, namespace `TauCeti.Leopoldt`.

**Sources.**

- `NSW.2013`, (10.3.3) and (10.3.4) (PDF pp. 626-627): “We define the regulator matrix Rp(eps1, ..., eps_{r1+r2-1}) := (logp sigma_j(eps_i)) and set rrp(K) := rank Rp(eps1, ..., eps_{r1+r2-1}) ... We call rrp(K) the p-adic regulator rank of K.” — The definition; Remark 1 there gives independence of the choices.

**Assembly note.** The logarithm on ℂ_p and its compatibility with finite extensions are ColemanIntegration L0's `iwasawa-logarithm` and `log-branch-field-compatibility`; PadicHodgeRegulators D.1 supplies only the regulator-specific comparison. The columns run over all [K : ℚ] embeddings, not over places.

### The equivalent forms of Leopoldt's conjecture

`P.6/leopoldt-equivalence` · theorem · first packet

For a number field K and a prime p, the following are equivalent: rr_p(K) = r_1 + r_2 - 1; the rank of the closure E-bar of E_K in the product of the U-hat_p over S_p u S_infinity is r_1 + r_2 - 1; the map E_K tensor Z_p → product of U-hat_p is injective (NSW Theorem 10.3.6, (i) to (iii)). For K totally real they are equivalent to R_p(K) ≠ 0.

**Hypotheses.**

- K is a number field and p a prime; S = S_p u S_infinity.

**Proof.**

1. The kernel of the completed map is detected by the p-adic logarithm on the principal units (tauceti:TauCeti.unitFiltration), which identifies the rank of the image with rr_p(K).
2. The diagonal map E_K→∏K_v× is injective. Passing instead to completed local unit groups kills prime-to-p roots of unity; track the p-primary torsion separately, then compare the free ℤ_p ranks using logarithms. Do not describe the uncompleted diagonal map as having that kernel.

**Acceptance.**

- For K = Q(sqrt 2) and p = 7 all forms hold (R_7 ≠ 0).

**Depends on.** this roadmap: `P.6/leopoldt-statement`, `P.6/padic-regulator`.

**Sources.**

- `NSW.2013`, Theorem 10.3.6 (PDF p. 628): “Let K be a number field, p be a prime number and assume that S is a finite set of places of K containing Sp u S_infinity. Then the following assertions are equivalent.” — The theorem.
- `NSW.2013`, after (10.3.5) (PDF p. 627): “For totally real number fields the Leopoldt conjecture is equivalent to the non-vanishing of the p-adic regulator Rp.” — The totally real case.

### The tests of the layer

`P.6/tests` · application · first packet

The four tests the roadmap requires. (1) Five-term, exact: at x = i/2, y = (1 + i)/2, D(i/2) - D((1 + i)/2) + D(1 - i) - D(2 - i) + D((3 + i)/2) = 0, an instance of P.1/bloch-wigner-five-term, proved and not computed (the terms are about 0.809, -0.916, -0.916, 0.512 and 0.512). (2) Five-term, numerical consistency: blochWignerApprox at precision p gives |sum| ≤ 5 . 2^{-p}, and blochWignerApprox_ne_zero certifies D(i/2) ≠ 0. (3) Conjugation at real embeddings: weightTwoRegulator_real_place, a proof. (4) Weight three: the current identity (84) of P.5/weight-three-curve-regulator and dL_3(z) = -D(z) d arg z + (1/3) log|z| (log|1 - z| dlog|z| - log|z| dlog|1 - z|) for L_3 = Re(Li_3 - log|z| Li_2 + (1/3) log^2|z| Li_1) (checked by finite differences). (5) Every claimed Bloch element carries a boundary proof: K3BlochGroups:V.6/bloch-element-constructor and V.6/five-term-certificate refuse an element without one; a list of floating-point values is not a certificate.

**Hypotheses.**

- The field is a number field or the complex numbers, as each test requires.

**Proof.**

1. Test 1 is an instance of the two-variable five-term relation.
2. Test 2 applies P.2/certified-numerics-error; a numerical enclosure cannot prove an identity, and none is claimed.
3. Test 3 is weightTwoRegulator_real_place.
4. Test 4 states (84) and the differential of L_3; the latter needs the API item singleValuedPolylog_three_differential of P.1 (a gap: the general-weight differential is not planned).
5. Test 5 imports the V.6 constructors.

**Acceptance.**

- The five-term test is a proof, with a separate numerical consistency check under a certified bound.
- The conjugation test is a proof, not a numerical check.
- A claimed Bloch element without a boundary proof is rejected.

**Depends on.** this roadmap: `P.1/bloch-wigner-five-term`, `P.2/certified-numerics-error`, `P.2/weight-two-regulator`, `P.5/weight-three-curve-regulator`, `P.1/single-valued-polylogarithm`; other roadmaps: `K3BlochGroups:V.6/bloch-element-constructor`, `K3BlochGroups:V.6/five-term-certificate`.

**Sources.**

- `GR.2022`, 1.1, item 3 (PDF p. 4): “Then for any five distinct points s_1, ..., s_5 on CP^1 we have: sum_{i=1}^{5} L_2([s_i, s_{i+1}, s_{i+2}, s_{i+3}]) = 0.” — The relation the first test evaluates.

**Assembly note.** Test (4)'s differential of L_3 is now the theorem `P.6/single-valued-trilogarithm-differential`, checked exactly by `P.6/trilogarithm-differential-regression-tests` in place of finite differences; the theorem should be a prerequisite of this node. Test (2) can use the P.2 part's error bound 1/(2·2^p).

### The real differential of the single-valued trilogarithm

`P.6/single-valued-trilogarithm-differential` · theorem · planet “Single-valued trilogarithm differential” · P.6 part

Let L_3 and D be the real-valued functions of P.1/single-valued-polylogarithm and P.1/bloch-wigner-dilogarithm. For z in C with z ≠ 0 and z ≠ 1, L_3 is differentiable as a map from the real normed space C to R. Put a = log|z| and b = log|1-z|. Its real Fréchet derivative satisfies, for every v in C, dL_3(z)[v] = -D(z) Im(v/z) + (a/3)(b Re(v/z) - a Re(v/(z-1))). Equivalently dL_3 = -D darg z + (1/3) a (b dlog|z| - a dlog|1-z|). Here darg z means the globally defined one-form v ↦ Im(v/z), not a derivative of the discontinuous principal argument. The formula holds also for real z > 1.

**Hypotheses.**

- z ≠ 0 and z ≠ 1; the derivative is over R, not C.
- P.1 uses B_1 = -1/2 and beta_2 = 1/3: L_3 = Re(Li_3 - a Li_2 + (a^2/3) Li_1).

**Proof.**

1. Expand the existing P.1 single-valued definition in weight three. On the principal cut complement set Li_1 = -b - i phi, Li_2 = u + i w, where phi = arg(1-z), and use the classical recursion dLi_3 = Li_2 dz/z and dLi_2 = Li_1 dz/z from P.1/classical-polylogarithm. No higher-weight functional equation or Bloch-group descent is needed.
2. By mathlib:Complex.log_re and mathlib:Complex.hasStrictFDerivAt_log_real, locally da[v] = Re(v/z), dtheta[v] = Im(v/z) and db[v] = Re(v/(z-1)). On points outside the slit plane use a rotated local logarithm (its additive branch constant has zero derivative); never apply the baseline log theorem without its slit-plane hypothesis.
3. Differentiate Re(Li_3 - a Li_2 + (a^2/3) Li_1). The u da terms cancel. The dtheta coefficient is -(w+a phi) = -D by P.1/bloch-wigner-dilogarithm. The remaining terms are (a b/3) da - (a^2/3) db. This is the n=3 case of Goncharov Proposition 4.1 after converting Lhat_2 = iD; equation (15) supplies the correction term.
4. P.1/single-valued-polylogarithm and P.1/branch-change-and-monodromy supply smoothness across the principal cut. Extend the identity to each point of (1,∞): both the derivative of the smooth L_3 and the displayed continuous one-form are continuous on C minus {0,1}, and equality on the dense cut complement implies equality there. This does not differentiate principal arg across its cut.
5. State differentiability together with the equality for all real tangent vectors, so totalisation of mathlib:fderiv cannot make a false derivative statement hold. Promote this item of the P.1 API to this theorem node and cite it in the existing P.6 test suite.

**Acceptance.**

- The coefficient is exactly 1/3 and the angular term is -D, after accounting for both factors of i in Goncharov’s convention.
- The only excluded points are 0 and 1; in particular z=2 is covered.
- The formula produces the exact half-point, cut-point and unit-circle identities of trilogarithm-differential-regression-tests.
- This proves only the pointwise weight-three differential; it does not assert the general-weight differential or remove other stages’ source gaps.

**Used by.**

- Polylogarithms:P.1/single-valued-polylogarithm API: Supplies the previously missing singleValuedPolylog_three_differential without redefining L_n.
- Polylogarithms:P.6/tests, weight-three check: Replaces the finite-difference-only evidence by an exact analytic identity.

**Depends on.** this roadmap: `P.1/classical-polylogarithm`, `P.1/single-valued-polylogarithm`, `P.1/branch-change-and-monodromy`, `P.1/bloch-wigner-dilogarithm`; libraries: `mathlib:DifferentiableAt`, `mathlib:fderiv`, `mathlib:Complex.log_re`, `mathlib:Complex.hasStrictFDerivAt_log_real`.

**Used in this roadmap by.** `P.6/trilogarithm-differential-regression-tests`.

**Library.** module `TauCeti/Analysis/SpecialFunctions/Polylogarithm/Differential`, namespace `TauCeti.Polylog`, declaration `singleValuedPolylog_three_differential`.

**Sources.**

- `Goncharov.2000.explicit`, arXiv math/0003086v1, §4 Proposition 4.1, equation (28), printed pp. 17–20; §2 equations (15) and the coefficients on printed p. 3: “The differential equation” — Specialise the proved differential equation to n = 3. The source uses Lhat_2 = i D and d i arg = i darg, so their product is -D darg; beta_2 = 1/3 and Lhat_{1,2} = log|z| alpha(1-z,z). This gives exactly the real-valued convention of the imported P.1 object.

### Exact trilogarithm differential checks

`P.6/trilogarithm-differential-regression-tests` · application · P.6 part

The five exact tests listed below are consequences of the real differential theorem, each including differentiability at its test point. They supplement the imported P.6 suite and certify the real-linear derivative, its normalisation and its domain; no numerical differentiation is used as proof.

**Hypotheses.**

- The L_3 and D conventions and domain are those of the differential theorem.

**Proof.**

1. At z=1/2, a=b=-log 2, D=0, v/z=2v and v/(z-1)=-2v, giving (4/3)(log 2)^2 Re(v).
2. At z=2, a=log 2, b=0, D=0 and v/(z-1)=v, giving -(1/3)(log 2)^2 Re(v). Differentiability comes from the theorem even though z is on the principal polylogarithm cut.
3. At z=-1, a=0 and D=0 because D vanishes on the reals; hence the derivative is zero.
4. On norm z=1, a=0; v=z has Im(v/z)=0 and v=i z has Im(v/z)=1. Thus the radial derivative vanishes and the angular derivative is -D(z).
5. Specialise to z=i: angular direction i*i=-1 and radial direction i. Apply the separate promoted lemma P.1/bloch-wigner-positivity, whose statement gives D(i)>0, to make the angular derivative strictly negative. Its existing minimum-principle proof obligation is recorded below; no positivity theorem is inferred merely from the definition of D.

**Tests.**

- `trilog_diff_half` (computation): L_3 is real-differentiable at z = 1/2, and for every v in C, dL_3(1/2)[v] = (4/3)(log 2)^2 Re(v).
- `trilog_diff_on_cut` (non-example): L_3 is real-differentiable at z = 2, and for every v in C, dL_3(2)[v] = -(1/3)(log 2)^2 Re(v). Thus the theorem cannot exclude the whole principal branch cut.
- `trilog_diff_minus_one` (degenerate): L_3 is real-differentiable at z = -1, and its real Fréchet derivative is zero.
- `trilog_diff_unit_circle` (characterisation): For norm z = 1 and z ≠ 1, L_3 is real-differentiable at z; dL_3(z)[z] = 0 and dL_3(z)[i z] = -D(z). These are respectively the radial and positively oriented angular directions.
- `trilog_diff_i_sign` (non-example): L_3 is real-differentiable at i; dL_3(i)[-1] = -D(i) < 0, while dL_3(i)[i] = 0. D(i) > 0 is supplied by P.1/bloch-wigner-positivity, with its recorded proof obligation.

**Acceptance.**

- L_3 is real-differentiable at z = 1/2, and for every v in C, dL_3(1/2)[v] = (4/3)(log 2)^2 Re(v).
- L_3 is real-differentiable at z = 2, and for every v in C, dL_3(2)[v] = -(1/3)(log 2)^2 Re(v). Thus the theorem cannot exclude the whole principal branch cut.
- L_3 is real-differentiable at z = -1, and its real Fréchet derivative is zero.
- For norm z = 1 and z ≠ 1, L_3 is real-differentiable at z; dL_3(z)[z] = 0 and dL_3(z)[i z] = -D(z). These are respectively the radial and positively oriented angular directions.
- L_3 is real-differentiable at i; dL_3(i)[-1] = -D(i) < 0, while dL_3(i)[i] = 0. D(i) > 0 is supplied by P.1/bloch-wigner-positivity, with its recorded proof obligation.

**Depends on.** this roadmap: `P.6/single-valued-trilogarithm-differential`, `P.1/bloch-wigner-dilogarithm`, `P.1/bloch-wigner-positivity`; libraries: `mathlib:DifferentiableAt`, `mathlib:fderiv`.

**Library.** module `TauCeti/Analysis/SpecialFunctions/Polylogarithm/Differential`, namespace `TauCeti.Polylog`.

**Sources.**

- `Goncharov.2000.explicit`, arXiv math/0003086v1, §4 Proposition 4.1, equation (28), printed pp. 17–20; §2 equations (15) and the coefficients on printed p. 3: “The differential equation” — Derived exact specialisations of the n=3 case of Proposition 4.1; these test points are chosen here, not claimed to be examples printed in the source.

## Mistakes found in the sources

The parts record every mistake they found in their sources, with the version read and the searches for an existing correction; the independent reviews gave each a verdict. The first packet's findings are E1–E21, the P.2 part's E22–E24, the P.3 part's E-P3-01 to E-P3-05, the P.4 part's E-P4-01 and E-P4-02, and the P.5 part's E25–E29 (renumbered by its review from E22–E25 because the P.2 part already used E22–E24). The P.6 part's finding is also numbered E22, which collides with the P.2 part's E22; it is shown here as "E22 (P.6 part)", and renumbering it E30 is a packet edit listed in the handoff note. E-P3-01 is rejected: the published page prints the correct H². Findings against GR v5, BFT v1, D96 v2 and G00 v1 are scoped to those preprints.

### Polylogarithms/E1 — misprint (affects nothing), confirmed

*first packet; source `GR.2022`; 1.1, item 1, (1), PDF p. 3 (arXiv v3; unchanged in v5, p. 3).*

- **Printed.** pi_n : C -> (2 pi i)^{n-1} R, z |-> Re(z) for n = 2k + 1, Im(z) for n = 2k.
- **Correction.** pi_n : C → R, z ↦ Re z for n odd and Im z for n even; or keep the codomain (2π i)^{n-1} R and send z ↦ i Im z for n even.
- **Reason.** For even n, (2π i)^{n-1} R = iR, but Im z is real. With the reading z ↦ i Im z, L_2 would be i D, contradicting 'L_2(z) is the Bloch-Wigner dilogarithm' and (7), which treat L_n as real.
- **Known.** new
- **Searched.** 2026-09-24: arXiv 1803.08585 abstract page listing v1 to v5, the full texts of v3 and v5 (v5 is the final version accepted by the Annals of Mathematics); no journal version or erratum was available; arXiv v1 writes pi_n : C -> C/R(n) = R(n - 1), a different convention.
- **Verdict.** confirmed: Checked in the v3 and v5 PDFs by two review checkers independently; the node now uses the real-valued reading.

### Polylogarithms/E2 — error (affects a stated result), confirmed

*first packet; source `GR.2026`; Theorem 1.2, (7), PDF p. 5 (arXiv v5); Theorem 1.1 and the abstract (v3, pp. 2-3).*

- **Printed.** Then there exist elements y1, ..., yr2 in Ker delta4 in B4(F) such that zetaF(4) = pi^{4(r1+r2)} |dF|^{-1/2} det(L4(sigma_{r1+i}(yj))), 1 <= i, j <= r2.
- **Correction.** ... such that ζ_F(4) = q π^{4(r_1+r_2)} |d_F|^{-1/2} det(...) for some q in ℚ^×; when r_2 ≥ 1 one may take q = 1 by rescaling y_1, and when r_2 = 0 the statement is ζ_F(4) in ℚ^× π^{4 r_1} |d_F|^{-1/2}.
- **Reason.** For r_2 = 0 the determinant is empty, equal to 1, and the display reads ζ_F(4) = π^{4 r_1} |d_F|^{-1/2}. For F = Q this says ζ(4) = π^4, but ζ(4) = π^4/90.
- **Known.** new
- **Searched.** 2026-09-24: arXiv 1803.08585 abstract page listing v1 to v5, the full texts of v3 and v5 (v5 is the final version accepted by the Annals of Mathematics); no journal version or erratum was available.
- **Verdict.** confirmed: Checked at the locator in v3 and v5; the review recomputed ζ(4) = π^4/90 and checked the case F = Q(i), where the display holds up to the rational 45.

### Polylogarithms/E3 — misprint (affects nothing), confirmed

*first packet; source `GR.2022`; 1.1, item 4, the display of delta_n, PDF p. 4 (v3; the same in v5, p. 4).*

- **Printed.** {x} |-> {x}_{n-1} tensor x for n > 2 ... delta_2{1} = delta_2{0} = 0
- **Correction.** Also set delta_n{0} = 0 for n > 2: 0 is not in F^x, so {0}_{n-1} tensor 0 is undefined.
- **Reason.** The generator {0} is in Q[F] and is killed in R_n(F), but delta_n{0} must be defined before R_n(F) is; the display fixes it only for n = 2.
- **Known.** new
- **Searched.** 2026-09-24: arXiv 1803.08585 abstract page listing v1 to v5, the full texts of v3 and v5 (v5 is the final version accepted by the Annals of Mathematics); no journal version or erratum was available.
- **Verdict.** confirmed: Checked at the locator in v3 and v5 by the review.

### Polylogarithms/E4 — misprint (affects nothing), confirmed

*first packet; source `GR.2022`; Definition 1.10 (p. 12), Theorem 1.14(c) (p. 15) and (43) (p. 16), arXiv v3.*

- **Printed.** 0 -> B4(F) -> L4(F) -> L2(F) wedge L2(F) -> 0, where B4(F) is also Q[F]/R4(F) (item 4).
- **Correction.** The left term is the span B_4(F) of the {x}_4 inside the combinatorial L_4(F), not the inductive B_4(F).
- **Reason.** The same symbol denotes two groups whose identification is only conjectured.
- **Known.** Corrected in arXiv v5 (Definition 1.11, p. 12: 'Conjecturally, the natural map B4(F) -> B4(F) is an isomorphism'; Theorem 1.14(c), p. 16)
- **Searched.** 2026-09-24: arXiv 1803.08585 abstract page listing v1 to v5, the full texts of v3 and v5 (v5 is the final version accepted by the Annals of Mathematics); no journal version or erratum was available.
- **Verdict.** confirmed: Checked in v5 by the review; recorded as known.

### Polylogarithms/E5 — error (affects a stated result), confirmed

*first packet; source `GR.2022`; Theorem 1.3(i), PDF p. 6 (arXiv v3).*

- **Printed.** Let F be any field.
- **Correction.** Let F be an infinite field.
- **Reason.** The constructions use results valid for infinite fields; the final version works everywhere with infinite fields (v5 Conventions, p. 4).
- **Known.** Corrected in arXiv v5 (Theorem 1.3(i), p. 6: 'Let F be an infinite field', and the Conventions, p. 4)
- **Searched.** 2026-09-24: arXiv 1803.08585 abstract page listing v1 to v5, the full texts of v3 and v5 (v5 is the final version accepted by the Annals of Mathematics); no journal version or erratum was available.
- **Verdict.** confirmed: Checked in v3 and v5 by the review; recorded as known.

### Polylogarithms/E6 — misprint (affects nothing), confirmed

*first packet; source `GR.2026`; (5) and (6), PDF p. 5 (arXiv v5).*

- **Printed.** delta_n : B_n(F) -> ... Lambda^2 F for n = 2 (5); the differential ... sends {x}_k wedge x_1 wedge ... wedge x_{n-k} to delta_k({x}_k) wedge x_1 wedge ... wedge x_k (6).
- **Correction.** Lambda^2 F^x in (5); {x}_k tensor x_1 wedge ... wedge x_{n-k} ↦ delta_k({x}_k) wedge x_1 wedge ... wedge x_{n-k} in (6).
- **Reason.** The target of delta_2 is Lambda^2 F^x (item 4 and the first four complexes on the same page); the source of the differential is B_k(F) tensor Lambda^{n-k} F^x, so the element is a tensor and the wedge runs to x_{n-k}.
- **Known.** new
- **Searched.** 2026-09-24: arXiv 1803.08585 abstract page listing v1 to v5, the full texts of v3 and v5 (v5 is the final version accepted by the Annals of Mathematics); no journal version or erratum was available.
- **Verdict.** confirmed: Checked on the page image of v5 p. 5 by the review.

### Polylogarithms/E7 — misprint (affects nothing), confirmed

*first packet; source `GR.2022`; Conjecture 1.4, PDF p. 6 (arXiv v3).*

- **Printed.** The maps (12) are isomorphisms modulo torsion.
- **Correction.** The maps (12) are isomorphisms.
- **Reason.** Both sides are Q-vector spaces, so 'modulo torsion' is vacuous.
- **Known.** Corrected in arXiv v5 (Conjecture 1.4, p. 7: 'The maps (12) are isomorphisms')
- **Searched.** 2026-09-24: arXiv 1803.08585 abstract page listing v1 to v5, the full texts of v3 and v5 (v5 is the final version accepted by the Annals of Mathematics); no journal version or erratum was available.
- **Verdict.** confirmed: Checked in v5 by the review; recorded as known.

### Polylogarithms/E8 — error (affects a stated result), confirmed

*first packet; source `Kbook.2013`; Lemma VI.5.4(c) and the sentence before it, PDF p. 496.*

- **Printed.** The elements c = [x] + [1 - x] and <x> = [x] + [x^{-1}] of B(F) play an important role ... (c) There is a homomorphism F^x -> B(F) sending x to <x>.
- **Correction.** <x> lies in P(F), with boundary x wedge (-x); the homomorphism is F^x → P(F), with 2-torsion image, and <x> lies in B(F) iff x wedge (-x) = 0.
- **Reason.** Over F_5 the boundary of <2> is 2 wedge 3, the nonzero element of the antisymmetric square.
- **Known.** K3BlochGroups/E9 (the K3BlochGroups blueprint, confirmed by REV-K3BlochGroups)
- **Searched.** 2026-09-24: the K3BlochGroups packet's sourceIssues; the K-book author-hosted draft of 29 August 2013.
- **Verdict.** confirmed: Re-read at the locator by this review; the entry records a correction already made in the atlas.

### Polylogarithms/E9 — misprint (affects nothing), confirmed

*first packet; source `Kbook.2013`; Corollary VI.5.4.1, PDF p. 497.*

- **Printed.** If char(F) = 2 or sqrt(-1) in F then 3c = 0 in B(F); if char(F) = 3 or cuberoot(-1) in F then 2c = 0 in B(F).
- **Correction.** Read 'cuberoot(-1) in F' as 'F contains a root of t^2 - t + 1'.
- **Reason.** -1 is always a cube root of -1, yet c has order 6 in B(F_11). With the corrected reading, C has both roots, so c = 0 in B(C), which P.2/bloch-wigner-descent uses.
- **Known.** K3BlochGroups/E10 (the K3BlochGroups blueprint, confirmed by REV-K3BlochGroups)
- **Searched.** 2026-09-24: the K3BlochGroups packet's sourceIssues; the K-book author-hosted draft of 29 August 2013.
- **Verdict.** confirmed: Re-read at the locator by this review; the entry records a correction already made in the atlas.

### Polylogarithms/E10 — misprint (affects nothing), confirmed

*first packet; source `Gonch.Arakelov.2004`; (13), PDF p. 14 (arXiv v3); JAMS p. 12.*

- **Printed.** sum_{j >= 0, 2j+1 <= 2m+1}
- **Correction.** sum_{j ≥ 0, 2j+1 ≤ m}
- **Reason.** c_{j,m} = 1/((2j+1)!(m-2j-1)!) needs m - 2j - 1 ≥ 0; the displayed r_2 of Section 1, item 4 has only j = 0, 1; Burgos Gil-Feliu-Takeda Section 5.2 print '0 ≤ 2j+1 ≤ m' without comment.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator in v3 and JAMS by the review.

### Polylogarithms/E11 — misprint (affects the proof), confirmed

*first packet; source `Gonch.Arakelov.2004`; Lemma 6.9, PDF p. 57 (arXiv v3); JAMS p. 49.*

- **Printed.** integral_{X(C)} r2((1 - f) wedge f wedge g) = - sum_x vx(g) L2(f(x))
- **Correction.** integral_{X(C)} r_2((1 - f) wedge f wedge g) = -2π sum_x v_x(g) L_2(f(x))
- **Reason.** The proof's (84) has 2π L_2(f) delta(g) and Proposition 6.18 has 2π; the review's quadrature gives ratios -6.28344 at a = 0.3 + 0.8i and -6.28355 at a = -0.45 + 0.6i for f = z, g = z - a.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: The review read the printed lemma and (84) side by side (PDF p. 57) and reproduced the quadrature.

### Polylogarithms/E12 — error (affects a stated result), confirmed

*first packet; source `Gonch.Arakelov.2004`; (6) and (7), PDF p. 5; (74), p. 52; Conjecture 6.2(b), (78), p. 54; Theorem 6.12, p. 59; (94), p. 62 (arXiv v3); JAMS (79)-(80), p. 46.*

- **Printed.** The Chow dilogarithm is a real function on its complex points defined by the formula P2(X; f1, f2, f3) := 1/(2 pi i) integral_{X(C)} r2(f1, f2, f3); (1/(2 pi i)) integral r2(f1 wedge f2 wedge f3) = L2(h(f1 wedge f2 wedge f3))
- **Correction.** P_2 := -(2π)^{-1} integral_{X(C)} r_2, so -(2π)^{-1} integral r_2 = L_2(h); equivalently (2π i)^{-1} integral r_2 = i L_2(h), an element of R(1).
- **Reason.** r_2 is real by (13) (the j = 0 term has i^2 = -1), so the printed left side is purely imaginary while L_2 is real; (93) with Proposition 6.18, and the corrected Lemma 6.9 with Proposition 6.6, both force -(2π)^{-1}.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: The review checked the reality of r_2 from (13) and the constant from (93) and Proposition 6.18.

### Polylogarithms/E13 — misprint (affects nothing), confirmed

*first packet; source `Gonch.Arakelov.2004`; proof of Theorem-Construction 3.1, PDF p. 27 (arXiv v3); JAMS p. 23.*

- **Printed.** omega^q_p := pi2* Res_{Gamma_p} pi1* (2 pi i)^{-q} r_{p+q}(L; H)
- **Correction.** The index is p + q - 1, and the constant is 1 if identity (i) is to hold as printed.
- **Reason.** The same proof says 'Radon transform of the distribution r_{p+q-1}(L; H)'; a (q-p-1)-distribution needs r_{p+q-1}; at p = 0, omega^q_0 = c r_{q-1}(L; H) and d r_{q-1}(L; H) = pi_q(Omega_L), so (i) forces c = 1.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator by the review.

### Polylogarithms/E14 — misprint (affects nothing), confirmed

*first packet; source `Gonch.Arakelov.2004`; Theorem 2.4, (18), PDF p. 15 (arXiv v3).*

- **Printed.** r_{m-1}: Lambda^m C(Y)* -> D^{m-1}_{X(C)}(m - 1)
- **Correction.** D^{m-1+2 codim_X Y}_{X(C)}(m - 1)
- **Reason.** The current <r delta_Y, omega> = integral_{Y^0} r wedge omega pairs with forms of degree 2 dim Y - m + 1.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator by the review.

### Polylogarithms/E15 — misprint (affects nothing), confirmed

*first packet; source `Gonch.Arakelov.2004`; Section 6.1 and Conjecture 6.2, PDF pp. 52-53 (arXiv v3).*

- **Printed.** F := k(X)*
- **Correction.** F := k(X)
- **Reason.** Lambda^3 F^* is taken of F; Conjecture 6.3 writes F := k(X).
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator by the review.

### Polylogarithms/E16 — error (affects a stated result), confirmed

*first packet; source `Gonch.Arakelov.2004`; Abstract, PDF p. 1 (arXiv v3).*

- **Printed.** We study the Chow dilogarithm and prove a reciprocity law which strengthens Suslin's reciprocity law for Milnor's group K^M_3 on curves.
- **Correction.** ... and prove, for P^1 (modulo 6-torsion), elliptic curves and curves over Q-bar (after tensoring with Q), a reciprocity law (Conjecture 6.2) ...
- **Reason.** Section 6 states the law as Conjecture 6.2 and proves only the cases a) to c) (p. 54: 'We prove this conjecture in the following cases').
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked against Section 6 by the review.

### Polylogarithms/E17 — gap (affects the proof), confirmed

*first packet; source `Gonch.Arakelov.2004`; proof of Proposition 6.17, PDF p. 63 (arXiv v3).*

- **Printed.** One can prove that they generate all the relations between the functions l_{x,y}/l_{x+y}.
- **Correction.** A proof or a reference; also h(k^* wedge Lambda^2 F^*) = 0, needed for 'all the properties of conjecture 6.2' in Theorem 6.14, is used ('the first factor in F is a constant') but not shown.
- **Reason.** An unproved step in the proof of the elliptic case.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator by the review.

### Polylogarithms/E18 — gap (affects a stated result), confirmed

*first packet; source `Gonch.Arakelov.2004`; Theorem 6.14, Lemma 6.16 and Proposition 6.18, PDF pp. 62-64 (arXiv v3).*

- **Printed.** for any linear homogeneous functions l0, ..., l3
- **Correction.** for l_0, ..., l_3 defining distinct lines, no three concurrent, none a component of X
- **Reason.** r(l_{i0}, ..., l_{ii}-hat, ..., l_{i3}, x) needs three distinct points l_{ij} on L_i; the proof assumes 'four generic lines'.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator by the review.

### Polylogarithms/E19 — misprint (affects nothing), confirmed

*first packet; source `Gonch.Arakelov.2004`; proof of Lemma 6.13, PDF p. 60 (arXiv v3).*

- **Printed.** is equal to 2 pi integral_{CP^1} r2(sum_i (1 - fi) wedge fi wedge gi)
- **Correction.** -(2π)^{-1} integral_{X(C)} r_2(...)
- **Reason.** With Lemma 6.9 corrected (E11), and since the integral is over X.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator by the review; the value is 0 either way.

### Polylogarithms/E20 — misprint (affects nothing), confirmed

*first packet; source `Gonch.Arakelov.2004`; Section 3.1, the maps b_j and (39), PDF p. 26 (arXiv v3).*

- **Printed.** b_j : Z^q_p(L)^0 -> Z^{q-1}_p(L-hat_j), 0 <= i <= p + q, with iii) sum_{j=0}^{p+q+1} (-1)^j b_j^* omega^q_p(L; H) = 0
- **Correction.** (iii) is an identity on Z^{q+1}_p(L') for a simplex L' in P^{p+q+1}: sum_{j=0}^{p+q+1} (-1)^j b_j^* omega^q_p(L-hat'_j; H'_j) = 0.
- **Reason.** b_j^* omega^q_p needs omega^q_p on the target; the range 0..p+q+1 counts the vertices of a simplex in P^{p+q+1}; Lemma 3.2 (points of P^{n+1} to P^n) matches this reading.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: Checked at the locator by the review.

### Polylogarithms/E21 — error (affects the proof), confirmed

*first packet; source `Gonch.Arakelov.2004`; Proposition 2.8, (24), PDF p. 19, with the residue convention of Section 2, item 6, p. 18 (arXiv v3).*

- **Printed.** drn-1(f1 wedge ... wedge fn) = pi_n(d log f1 wedge ... wedge d log fn) + 2 pi i (rn-2 o Res)(f1 wedge ... wedge fn), with resv(pi wedge u1 wedge ...) = u1 wedge ...
- **Correction.** The residue term needs the sign -1 at n = 2 with this convention (equivalently, put the uniformiser last); the sign for general n is to be fixed against Burgos Gil-Feliu-Takeda.
- **Reason.** n = 2, X = P^1, f = z, g = c constant: by (13), r_1(z wedge c) = -i log|c| d arg z, and with the source's d(d i arg z) = 2π i (delta_0 - delta_infinity) (p. 20), d r_1 = -2π i log|c| (delta_0 - delta_infinity); the printed right side is +2π i log|c| (delta_0 - delta_infinity), since res_0(z wedge c) = c and res_infinity(z wedge c) = c^{-1}. Burgos Gil-Feliu-Takeda Remark 5.12 record a sign discrepancy (-1)^m.
- **Known.** new
- **Searched.** 2026-09-24: arXiv math/0207036 v1 to v3 metadata and the v3 text; the published JAMS 18 (2005) 1-60 text; Burgos Gil-Feliu-Takeda, IMRN 2011, which reworks Sections 2 and 5; no erratum found.
- **Verdict.** confirmed: The review redid the n = 2 computation from (13) and the residue convention.

### Polylogarithms/E22 — error (affects the proof), confirmed

*P.2 part; source `goncharov-jams`; JAMS 18 (2005), proof of Theorem 5.7, p.39, after (67); conventions in (66), p.38 and the unnormalized Alt definition in section 2. Same calculation in arXiv v3..*

- **Printed.** ⟨C_n, E_n⟩ = 1.
- **Correction.** For the displayed definitions at n=2, ⟨C_2,e12 wedge e21 wedge e22⟩=-3/2. Recompute the normalizing coefficient rather than substitute a conjectured corrected Theorem 5.7 scalar.
- **Reason.** Of the six products in Alt_3 Tr(e12 e21 e22), the three even-permutation traces are 0 and all three odd-permutation traces are 1. Their signed sum is -3; equation (66) divides by 2. This directly contradicts the proof’s claimed value. It does not by itself prove a replacement class comparison coefficient.
- **Known.** new
- **Searched.** Published AMS PDF, pp.38–40 and publisher article search, 2026-10-05; arXiv math/0207036 revision history: v3 remains the latest; compared its Section 5.5 calculation, 2026-10-05; Author website https://sasha-goncharov.github.io/ and targeted title/Theorem 5.7 erratum searches; no correction found, 2026-10-05.
- **Verdict.** confirmed: Read the published definitions of Alt, Cn in (66), En in (67), and the p.39 evaluation, then computed all six n=2 terms independently. Even terms are zero; odd terms each have trace one. Thus C2(E2)=-3/2. The same passage appears in arXiv v3, pp.43–44. This proves the displayed calibration wrong, without determining a replacement regulator coefficient.

### Polylogarithms/E23 — gap (affects the proof), confirmed

*P.2 part; source `goncharov-jams`; JAMS Appendix 7.2, p.57, equation (100) and final parenthesis; compare 7.1, pp.55–56..*

- **Printed.** c3 = −1/(6π).
- **Correction.** Give the derivation of c3 from the normalized hyperbolic volume form, boundary measure ratios and orientation used in 7.1. Use Milnor’s independent h^-3 integral to establish the P.2 endpoint until that derivation is checked.
- **Reason.** The local section introduces 3c3 in the specialized boundary integral without deriving it from (99); the final integration then uses the parenthesized constant to conclude D(a). The exact conversion involves boundary-ratio powers and signs, so it cannot be inferred simply by taking the reciprocal of the coefficient in (99). This is a missing calibration derivation, not a claim that the volume identity is false.
- **Known.** new
- **Searched.** Published Section 7.1–7.2 and arXiv v3 Appendix 7, read in full at the relevant passage; Author website and publisher/title correction search, 2026-10-05; no supplied derivation found.
- **Verdict.** confirmed: Published pp.55–57 introduce the specialized 3c3 coefficient and use c3=-1/(6pi) without deriving that conversion. The preceding printed boundary-volume coefficient also fails an independent small-simplex check (E24). The missing powers/orientation/calibration calculation must therefore be supplied; this finding does not invalidate the Milnor/D volume identity.

### Polylogarithms/E24 — error (affects a stated result), confirmed

*P.2 part; source `goncharov-jams`; Published JAMS 18 (2005), Appendix 7.1, Theorem 7.1, equation (99), p.55; volume-form normalization immediately before it and Lemma 7.3/proof on p.56. Same formula in arXiv math/0207036v3, equation (97), pp.64–65..*

- **Printed.** ((n−1)^n vol(S^{n−1})/n) · vol I(y0,…,yn) = integral_{∂H^n} log|mu_y1/mu_y0| dlog|mu_y2/mu_y0| wedge … wedge dlog|mu_yn/mu_y0|.
- **Correction.** In dimension n=3, the magnitude of the coefficient on the left must be 64pi, six times the printed 32pi/3, for the volume form normalized to dy1 wedge dy2 wedge dy3 at the origin. The general small-simplex calculation inserts a factor n!; the orientation convention fixes its sign. Do not infer the Appendix 7.2 constant or a Borel scalar merely by rescaling this formula.
- **Reason.** Use the projective unit-ball (Klein) model from the source, with y0=0 and yi=epsilon e_i, i=1,2,3. Choose lifts (yi,1) and boundary lift (x,1), x in S^2. Then mu_yi/mu_y0=(1−epsilon x_i)^−2. With outward boundary orientation the integral is 8 epsilon^3 integral_{S^2} x1 dx2 wedge dx3 + O(epsilon^4) = (32pi/3) epsilon^3 + O(epsilon^4). The geodesic simplex is the Euclidean coordinate tetrahedron; the normalized volume density tends to 1, so its volume is epsilon^3/6 + o(epsilon^3). Their ratio tends to 64pi, contradicting the printed 32pi/3. Lemma 7.3 computes the leading exterior-form coefficient but transferring it to simplex volume needs the factor 3!. Reversing orientation cannot remove a factor six.
- **Known.** new
- **Searched.** Publisher version of record obtained directly from AMS and visually checked at pp.55–57; targeted AMS/title/Theorem 7.1 erratum searches, 2026-10-06, found no correction; arXiv math/0207036 submission history lists v3 (17 June 2004) as latest; inspected the corresponding equation (97) and proof in v3, 2026-10-06; Author website https://sasha-goncharov.github.io/ and targeted title/boundary-volume/factorial correction searches, 2026-10-06, found no correction.
- **Verdict.** confirmed: Independent small-simplex asymptotic gives the factor six using the volume normalization printed on p.55. As a numerical cross-check, sphere and Klein-simplex quadrature at epsilon=0.1, 0.03 and 0.01 each give integral/volume=201.061929829747, agreeing with 64pi rather than 32pi/3. The asymptotic argument, not the numerical check, establishes the contradiction.

### Polylogarithms/E-P3-01 — misprint (affects nothing), rejected

*P.3 part; source `G95`; Gon95 published p. 298, final c₂ display after (6.11).*

- **Printed.** H²(B_F(3))
- **Correction.** None. The published c₂ display already has the correct degree-two target.
- **Reason.** The original allegation transcribed the source as H¹. Independent high-resolution reading shows H², agreeing with p. 220 and (6.11b) p. 297. The superscript was misread; this is not a published misprint.
- **Known.** Rejected by independent review. The original allegation is preserved separately; the printed field now records the actual published expression.
- **Searched.** Author-hosted 1995 published scan; Durham-hosted copy; Search for Goncharov 1995 errata.
- **Verdict.** rejected: High-resolution inspection of the published p. 298 display shows H²(B_F(3)), already agreeing with p. 220 and (6.11b). The alleged H¹ is a transcription/OCR error; no source correction is needed.

### Polylogarithms/E-P3-02 — error (affects a stated result), confirmed

*P.3 part; source `GR5`; GR arXiv:1803.08585v5 §7.2 (142) and the following right-square assertion.*

- **Printed.** 2 · Alt₄
- **Correction.** With δ₂[x]=(1−x)∧x and the printed r₅, replace r₄ by −3 Alt₄.
- **Reason.** On v(t)=(1,t,t²) at t=1,2,3,5,7, d₂r₅=36 u(2)∧u(3)∧u(5), while the printed r₄∂=−24 times that basic wedge. The rational unit classes of distinct primes are independent. Alt₄=−6 f₀^(3) from Gon95 p. 264; the corrected r₄ is 18 f₀. Three additional generic rational fixtures give the same ratio −3/2. The failure persists with unnormalized alternation and zero-based deletion signs.
- **Known.** Independently confirmed by REV-Polylogarithms--P.3; no correction located. This is a v5 preprint finding; the Annals article is forthcoming.
- **Searched.** arXiv v5 PDF and TeX (142); GR §7.2 footnote 16; Gon95 p. 264 primitive f₀ formula; Web search for GR Zagier erratum coefficient r₄.
- **Verdict.** confirmed: Independently recomputed every prime-exterior coordinate using exact rational arithmetic. The moment fixture gives 36 for d₂r₅ and −24 for printed r₄∂; −3 Alt₄ fixes it. A scaled fixture gives 18 versus −12, and a nonconic fixture agrees in all 31 coordinates. Scope: arXiv v5 of 15 July 2026.

### Polylogarithms/E-P3-03 — gap (affects the proof), confirmed

*P.3 part; source `G95`; Gon95 published §9.2 p. 310.*

- **Printed.** higher differentials
- **Correction.** Display the spectral-sequence differentials and prove the asserted ker δ₃ cycle-lifting statement.
- **Reason.** The paper calls the computation unpleasant and states its result; it supplies no differential formulas there. The every-family determinant needs this precise step.
- **Known.** Explicitly omitted computation in the source; no detailed primary replacement located.
- **Searched.** Gon95 §9.2 pp. 310–311; Gon91 pp. 155–161 announcement; GR v5 §7 proof of configuration relation.
- **Verdict.** confirmed: Read §9.2 p. 310 independently. The higher-differential calculation is explicitly omitted, and the required edge identification is only asserted. This confirms a source-proof gap, not falsity of the lifting statement.

### Polylogarithms/E-P3-04 — misprint (affects a stated result), confirmed

*P.3 part; source `G95`; Gon95 published p. 208 (1.16), sixth cyclic argument.*

- **Printed.** {(bc−c+1)a/(ca−a+1)}
- **Correction.** Use {−a(bc−c+1)/(ca−a+1)}. Keep the coefficient +1.
- **Reason.** As printed, substitution a=b=c=1 gives 6[1]+[−1], whose L₃ value is 21ζ(3)/4, contradicting Theorem 1.3 and the explicitly printed p. 210 specialization 3[1]+4[−1]. The negative argument gives the latter. The geometric expression (1.10) and the independently displayed coordinate formula in Zhao’s supplement support the negative sign.
- **Known.** Independently confirmed by REV-Polylogarithms--P.3 against the published scan and Zhao’s supplement; no publisher erratum located.
- **Searched.** Author-hosted Gon95 p. 208 scan at full resolution; Gon95 (1.10) p. 205 and specialization p. 210; MPIM1991 preprint (1.16); Zhao supplement formula (3); Web search for Goncharov (1.16) misprints.
- **Verdict.** confirmed: Inspected published p. 208 (1.16): the argument lacks a minus. The p. 210 specialization and L₃(−1)=−3ζ(3)/4 contradict the positive argument. Zhao formula (3) independently gives the corresponding negative denominator on its nondegenerate locus; continuity is needed for the (1,1,1) specialization.

### Polylogarithms/E-P3-05 — error (affects a stated result), confirmed

*P.3 part; source `GR5`; GR arXiv:1803.08585v5 §7.2 (144), compared with (143), (142) and §7 cross-ratio (135).*

- **Printed.** r₆=(1/5) Alt₆[|124||235||136|/(|125||236||134|)]₃
- **Correction.** Under δ₃[z]₃=[z]₂⊗u(z), δ₂[z]₂=u(1−z)∧u(z), unnormalized alternation and zero-based deletion, use r₆=−(1/5) Alt₆[T]₃.
- **Reason.** For e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2), all twenty three-by-three minors are nonzero. Apply δ₂⊗1 to (143) and extract (v₂∧v₃)⊗v₂: printed (144) gives 60 while r₅∂ gives −60. All six nonzero coordinates have opposite signs; a second generic fixture gives the same failure in 722 coordinates. No injectivity of δ₂ is needed to refute a claimed equality.
- **Known.** New independently confirmed v5 preprint error. The corrected sign matches the necessary projected equality on two fixtures; a full B₂-valued proof remains a gap. No version of record available: Annals lists the article as forthcoming on 2026-10-06.
- **Searched.** arXiv:1803.08585v5 PDF, §7.2 (135), (142)–(144), footnote 16; Goncharov author website and targeted triple-ratio/erratum searches; Annals of Mathematics forthcoming articles list.
- **Verdict.** confirmed: Exact rational determinant and prime-valuation calculation independently reproduces 60 versus −60 on the nonconic fixture. Moment-curve tests vanish on both sides and cannot detect this sign. See the reproducible algorithm and complete coordinate table in the independent review.

### Polylogarithms/E-P4-01 — error (affects the proof), confirmed

*P.4 part; source `G95`; Published Advances in Mathematics 114 (1995), proof of Lemma 1.16, p. 222, definition of s₀ on the tensor product.*

- **Printed.** otherwise
- **Correction.** Use the multiplicative angular-component homomorphism on the tensor unit factor, not zero on every nonunit; then prove the needed relation descent separately.
- **Reason.** At t=0 over C(t), {1}_3⊗t and {1}_3⊗(2/t) are both sent to zero by the printed rule, while their sum is {1}_3⊗2 and is sent to {1}_3⊗2≠0. The first factor is nonzero since L₃(1)=ζ(3)≠0; the rational unit class of 2 is nonzero since 2 is not a root of unity. A nonzero pure tensor over Q is nonzero. Thus the proposed homomorphism is not bilinear. This diagnoses that proof step, not the truth of Lemma 1.16.
- **Known.** No correction located in the inspected author-hosted version of record; proposed tensor repair recorded in the accepted parent specialization-and-delta statement, whose relation-preservation proof remains open.
- **Searched.** G95 author-hosted published pp. 221–224; G94 author-hosted Lemma 1.11 and analytic descent proof; GR arXiv v5 inductive relation definition; Author publications page and web search for Geometry of configurations errata.
- **Verdict.** confirmed: Independently inspected published pp. 221–222. The printed zero-on-nonunits rule on the tensor unit factor fails the t·(2/t)=2 bilinearity test over C(t), with the nonzero {1}₃ factor detected by ζ(3). Angular components fix this tensor defect but do not establish relation descent or identify the two curve models.

### Polylogarithms/E-P4-02 — misprint (affects nothing), confirmed

*P.4 part; source `G95`; Published Advances in Mathematics 114 (1995), Proposition 1.18, p. 223, final term of unified equation (1.28c).*

- **Printed.** −β_n log^(n−1)|z| [log|z| dlog|1−z|−log|1−z| dlog|z|]
- **Correction.** Replace β_n log^(n−1)|z| by β_(n−1) log^(n−2)|z|, retaining the minus sign and bracketed logarithmic differential.
- **Reason.** The adjacent odd formula (1.28b) at weight n=2m+1 uses β_(2m) log^(2m−1), namely coefficient β_(n−1) and exponent n−2. G94 (14), p. 8, agrees. At weight three on the real interval, the literal printed (1.28c) has β₃=0 and predicts zero derivative, whereas differentiating L₃=Li₃−log x Li₂−(log²x/3)log(1−x) at x=1/2 gives 4(log 2)²/3. Fixing the coefficient index alone would give −4(log 2)³/3, so both printed indices need correction.
- **Known.** Both correct indices are already in the adjacent published formula (1.28b) and G94 author manuscript (14); no separate publisher erratum located in the inspected author copies and targeted correction search.
- **Searched.** G95 published p. 223 (1.28a)–(1.28c); G94 manuscript p. 8 (14); Author-hosted publications page and search for Proposition 1.18 errata.
- **Verdict.** confirmed: Independently inspected published p. 223: the final term actually prints β_n as well as exponent n−1. Expanded the finding to both misprints and corrected its literal weight-three diagnostic. The adjacent odd formula and G94 (14) give the intended term.

### Polylogarithms/E25 — misprint (affects nothing), confirmed

*P.5 part; source `BFT`; arXiv:0909.5296v1, equation (6.15), printed p.20; published PDF unavailable (HTTP 403).*

- **Printed.** 2p−m
- **Correction.** The target Deligne degree is 2p−n−m.
- **Reason.** The cycle is in X×□^n×Δ^m, and projection integrates over both index directions. At p=2,n=m=1 the degree is 2. The next lemma uses total degree 2p−* and has both boundaries.
- **Known.** new (finding scoped to the arXiv v1 text; no claim about the inaccessible version of record)
- **Searched.** arXiv abstract/version list and v1; attempted v2 returns 404, 2026-10-06; Oxford IMRN article/DOI 10.1093/imrn/rnq066 and publisher PDF request, 2026-10-06; Author/public search for Burgos Feliu Takeda rnq066 corrigendum or erratum, 2026-10-06.
- **Verdict.** confirmed: Confirmed in the inspected arXiv v1 equation (6.15), printed p. 20: the target omits n. The form has degree n+m-1 and the projection removes both factors, giving Deligne degree 2p-n-m; the cubical axis m=0 also forces the correction. No claim is made about the unread publisher text.

### Polylogarithms/E26 — error (affects a stated result), confirmed

*P.5 part; source `D96`; arXiv:alg-geom/9512016v2, Theorem 3.4 and equation (31), pp.21–22; version of record not obtained.*

- **Printed.** ∫ ω ∧ ω̄ = 1
- **Correction.** Fix a real positive area convention, such as (i/2)∫dz∧dbarz=A>0, and carry its A,π and i factors through the Fourier coefficient and pairing. In our convention the target constant is iA³/(4π²) in the displayed log/α pairing.
- **Reason.** For a nonzero holomorphic form on a complex curve, ∫ω∧ω̄ is purely imaginary, negative imaginary with the positive complex orientation, and cannot equal the positive real number 1. Rescaling a lattice changes the three-point kernel by conjλ/|λ|⁶, so omitting area factors also cannot define a scale-independent literal formula.
- **Known.** new (normalization issue in the accessible preprint; publisher collation is outstanding)
- **Searched.** arXiv abstract/version history, v2 and its appendix correction, 2026-10-06; MPIM 96-6 original January 1996 scan, introductory normalization and theorem lead, 2026-10-06; Springer DOI 10.1007/BF02362333 publisher PDF request, served access page; searches for author/journal corrigendum, 2026-10-06.
- **Verdict.** confirmed: Confirmed against the arXiv v2 page image, printed p. 21: ordinary positive complex integration gives dz∧dbarz=-2i dx∧dy, so no nonzero holomorphic form can satisfy the displayed real-one integral. The packet uses positive area and derives its scalar; the analytic comparison and journal collation remain open. This verdict applies only to the inspected preprint.

### Polylogarithms/E27 — misprint (affects nothing), confirmed

*P.5 part; source `G05`; Published JAMS 18 (2005), p.21, prose immediately following equation (38).*

- **Printed.** Z is a divisor in X and f is a rational function on a divisor Y in X
- **Correction.** Z is a codimension-n cycle, and Y is a codimension-(n−1) subvariety; f is a rational function on Y.
- **Reason.** The numerator uses n−1,n−1 currents and the principal relation has current bidegree n−1,n−1. The following Gersten graph description explicitly uses codimension n−1 for Y. For n=1, Y=X, not a divisor.
- **Known.** new
- **Searched.** Published AMS PDF p.21 and adjacent Proposition 2.14, 2026-10-06; arXiv:math/0207036v3 corresponding equation (36), 2026-10-06; AMS article record and searches for Goncharov Arakelov motivic complexes erratum/corrigendum, 2026-10-06.
- **Verdict.** confirmed: Confirmed in the published JAMS PDF p. 21: equation (38) itself specifies codim(Y)=n-1 and a codimension-n cycle, contradicting the prose which calls both loci divisors. The degree-one case has Y=X. This is a dimension-label misprint.

### Polylogarithms/E28 — misprint (affects nothing), confirmed

*P.5 part; source `BFT`; arXiv:0909.5296v1, §4 equation (4.8) and following cycle map, printed p.8, compared with Theorem 6.10 p.18; inspected the PDF image, not only extracted text.*

- **Printed.** α1 ∈ DA,Z^(2p−n−1); ρ(z)=(f1(z),0,0)
- **Correction.** For the displayed differential in (support,cycle,base) order, the first coordinate has cochain degree 2p−n+1 and the cycle map is (0,f1(z),0). Equivalently reorder to (cycle,support,base) throughout and conjugate the differential by that permutation. Theorem 6.10 uses this reordered notation.
- **Reason.** In degree q, d of the cycle coordinate lies in Hp^(q+1), so g1(α1) must have that same degree; the printed q−1 cannot be added to it. Moreover f1(z) is an Hp class, not an element of the support-complex first coordinate. The typed graded differential in the suggested prototype checks the corrected degree.
- **Known.** new (scoped to the accessible arXiv v1 text)
- **Searched.** arXiv v1 §4.8 and Theorem 6.10 with PDF-image check, 2026-10-06; Oxford IMRN DOI 10.1093/imrn/rnq066; publisher PDF blocked, 2026-10-06; Author/public search for a Burgos Feliu Takeda correction; arXiv version list, 2026-10-06.
- **Verdict.** confirmed: Confirmed in the arXiv v1 page image p. 8. With support-first cochain order and the printed differential, the support degree must be q+1; g1 has degree zero. The cycle class belongs to the second Hp coordinate. The packet’s corrected grading and inclusion agree with those types. No publisher-text verdict is inferred.

### Polylogarithms/E29 — misprint (affects nothing), confirmed

*P.5 part; source `D96`; arXiv:alg-geom/9512016v2, Theorem 3.4, equation (29), printed p. 21.*

- **Printed.** fi, gi ∈ C(E)*; (1−fi)∧fi∧gi ∈ Λ³ Q(E)*
- **Correction.** For the theorem over C, the relation is in Λ³ C(E)* (or Λ³(C(E)*⊗Q) for rational symbol combinations).
- **Reason.** An arbitrary elliptic curve over C in this theorem is not supplied with a Q-model, and arbitrary complex rational functions are not elements of Q(E)* even when such a model exists. The preceding Theorem 3.3 and the proof use C(E); Q(E) belongs to the earlier arithmetic theorem.
- **Known.** new in the inspected preprint; publisher version not read
- **Searched.** arXiv version list and the inspected v2 PDF; v1 was withdrawn; Publisher-access limitation recorded in sourceVersions; no claim that the journal retains this misprint.
- **Verdict.** confirmed: Independently observed in the Theorem 3.4 page image. Replacing Q(E) by C(E) makes the general-complex-curve hypothesis and the displayed symbol relation well typed; this verdict is scoped to arXiv v2.

### Polylogarithms/E22 (P.6 part) — misprint (affects nothing), confirmed

*P.6 part; source `Goncharov.2000.explicit`; arXiv math/0003086v1, §2 item 1, first displayed definition of Lhat_n, printed p. 3 (PDF page 4).*

- **Printed.** log^{n-k}|z|
- **Correction.** The exponent is k: sum_{k=0}^{n-1} beta_k Li_{n-k}(z) log^k|z|.
- **Reason.** Equation (33), printed p. 19, uses exponent k. The example Lhat_2=iD immediately below the first display also forces powers 0 and 1 rather than 2 and 1. The page image was checked, so this is not a text-extraction artifact.
- **Known.** The intended formula is already printed correctly in the same preprint, equation (33); no external corrigendum was established.
- **Searched.** arXiv abstract/version record math/0003086 (only v1 located); MPIM preprint listing 2000(70); Author publication listing and publisher searches for the paper/corrections; published full text not obtained.
- **Verdict.** confirmed: Independently read the arXiv math/0003086v1 text and inspected the page images: the first definition on printed p.3 has exponent n-k, while (33) on printed p.19 has exponent k. The p.3 coefficients and the immediately following weight-two Bloch-Wigner formula require powers 0 and 1, confirming the intended correction. The verdict concerns this preprint only; no published version was inspected.

## Gaps

## Gaps

The packets record 44 gaps: 19 in the first packet and 2, 8, 5, 9 and 1 in the follow-up packets for P.2–P.6. Each is listed as its packet states it, followed by its status after assembly. A first-packet gap that a follow-up answers or refines says so; the follow-up's own gap then carries what remains.

**Requests to this roadmap that no node answers.** These come from other roadmaps' packets and are open here:

- **The real Rogers dilogarithm** (K3BlochGroups V.3 and V.5, HabiroNahmSeries HB.3 and HB.4, ArithmeticQuantumTopology QT.5): Suslin's normalisation L(x) = Li_2(x) + ½ log x log(1 − x) on (0, 1) with L(1/2) = π²/12, its derivative, reflection L(x) + L(1 − x) = π²/6 and the ordered five-term expression; Calegari–Garoufalidis–Zagier's normalisation π²/6 − L on ℙ¹(ℝ) modulo π²/2, its five-term descent and the identity Σ_{j=2}^{(n−1)/2} L(X_j) = (n − 3)π²/(6n). The first packet proposes the node `P.1/rogers-dilogarithm` (Structural proposals); no packet plans it.
- **The five-term identity of Li_2** (HabiroNumberFields HB.2): −Li_2(X/(YZ)) + Li_2(YZ) + Li_2(1/(YZ)) + Li_2(X/Y) + Li_2(1) − Li_2(X) − Li_2(1/Y) − Li_2(Z) = 0, Z = (1 − X)/(1 − Y), with compatible principal branches near (1/5, 2).
- **Cross-ratio identities over an arbitrary field** (ColemanIntegration L2), for the five-term relation over ℂ_p.
- **Li_1 at roots of unity** (ColemanIntegration L2, L3): Σ ζ^n/n = −log(1 − ζ) by Abel's theorem.
- **De Jeu's complexes** (ColemanIntegration L3, and PadicHodgeRegulators D.1 for D.2): the complexes M̃^{(n)}(F) of a number field, the cyclotomic symbols [ζ]_n with their distribution relation, de Jeu's map H¹(M̃^{(n)}(F)) → K_{2n−1}(F)_ℚ with Beilinson's regulator of [x]_n equal to (n − 1)! times P_n(x), and the weight-two subcomplex for a discrete valuation ring generated by special units. They are addressed to the stage P.4, which plans Goncharov's inductive groups but not de Jeu's variant or its map to K-theory.
- **The residue at infinity of the weight-four complexes** (the P.3 part's request to P.4): `P.4/weight-four-residue-map` plans the residues at the finite places of F(t); the conditional transfer of P.3 also takes minus the residue at infinity.

### Goncharov's 1994 and 1995 papers and Zagier's 1990 paper were not obtained

*first packet, gap 1. Needed by `P.4/specialization-and-delta`, `P.4/polylog-on-higher-bloch`, `P.4/zagier-determinant`, `P.3/trilogarithm-group`, `P.6/tests`.*

Four inputs are used as Goncharov and Rudenko state them: the specialisation argument that delta_n descends to B_n(F) (P.4/specialization-and-delta; Goncharov 1995); the descent of L_n to B_n(C) (P.4/polylog-on-higher-bloch; Goncharov 1994, Theorem 1.5), with the general-weight differential of L_n, which P.1 does not plan and P.6's weight-three test needs; the 22-term relation and its compatibility with delta_3 and L_3 (GR Proposition 5.4, not read in full); and the general-weight normalisation of Zagier's conjecture (Zagier 1990), which the review derived and checked on Q and Q(i). NEXT SOURCE ACTION: obtain Goncharov, Geometry of configurations, polylogarithms and motivic cohomology (Adv. Math. 1995) and Polylogarithms and motivic Galois groups (1994).

**Status.** Largely answered by the P.3 and P.4 parts, which obtained and read Goncharov 1994, Goncharov 1995 and Zagier 1990. The specialisation argument is `P.4/relation-specialization-induction` (its degenerating step is the P.4 part's gap 1); the descent of L_n is `P.4/cycle-constancy`, whose proof contains the general-weight differential; the 22-term relation and its compatibility with δ_3 and L_3 are `P.3/coordinate-relation`, `P.3/relation-cobracket` and `P.3/trilogarithm-functional-relations` (the analytic step is the P.3 part's gap 2); the general-weight normalisation is `P.4/period-calibration`. The weight-three differential P.6's tests need is `P.6/single-valued-trilogarithm-differential`. Nothing of this gap remains that another gap does not state more precisely.

### The weight-three theorem is stated, not decomposed

*first packet, gap 2. Needed by `P.3/k-theory-comparison-weight-three`, `P.3/trilogarithm-regulator-borel`, `P.3/weight-three-special-value`, `P.3/milnor-degree-comparison`.*

The weight-three maps from K-theory, their compatibility with the Borel regulator and the special-value theorem are Goncharov's (1991, 1995), not obtained; the 'for every family' half (b) is not established by any source read; the top-degree comparison is Suslin's (1984), not obtained. NEXT SOURCE ACTION: decompose GR v5 Sections 7.1 to 7.3 (decorated flags, the Bigrassmannian, the weight ≤ 3 complexes, Theorem 1.8) and obtain Goncharov 1995, Section 5.

**Status.** Refined by the P.3 part, which read Goncharov 1995 and GR §§7.1–7.3 and plans the comparison maps, the regulator compatibility and part (b). What remains is stated precisely by the P.3 part's gaps 1, 3, 4 and 5 (normalisation adapter, cycle lifting, Suslin's primary proof and κ, the regulator-class scalar).

### The real Deligne-Beilinson complex has no owner

*first packet, gap 3. Needed by `P.5/goncharov-deligne-complex-comparison`, `P.5/unramified-weight-two-class`, `P.5/regulator-induces-beilinson`.*

No stage constructs the real Deligne-Beilinson complex of a smooth variety over R in general: EllipticRegulators ER.2 builds only degree two and weight two for an elliptic curve, and M.8 only the cycle-class maps into it. The confirmed findings RT-AREA-ktheory-2/7 and /24 ask for it as an early part of M.8, and the packet requests it there. Goncharov's regulator itself lands in his explicit complex C_D(X; n), which P.5 now plans; the Deligne complex is needed only for Proposition 2.1 and for the identifications with Deligne classes.

**Status.** Open, and refined by the P.5 part's gap 1: the general real Deligne complex is requested once from an early prefix of MotivicEtaleKTheory M.8, which the maintainer has to split from M.8's late comparisons.

### The proof of the weight-four theorem is not planned anywhere

*first packet, gap 4. Needed by `P.4/weight-four-theorem`.*

Goncharov and Rudenko's theorem is recorded as a theorem with its statement infrastructure, but no roadmap plans its proof, which needs motivic correlators and cluster polylogarithms (restructure entry). Part (b) for Ker delta_4 computed with the inductive B_3(F) needs an argument not located in the sections read: the paper's complex (44) uses the 22-term group, whose identification with the inductive group is conjectural (GR v5 p. 9).

**Status.** Open. The proof of the weight-four theorem belongs to the proposed Part II (see Structural proposals); the P.4 part states its exact interface and adds the inductive-cycle obstruction (P.4 part's gaps 2 and 3).

### The Grassmannian half of Goncharov's paper was not read

*first packet, gap 5. Needed by `P.2/borel-comparison`, `P.2/bloch-wigner-cocycle`, `P.2/lobachevsky-identity`.*

Sections 4 and 5 of Goncharov 2004 construct the Grassmannian polylogarithms and prove Theorem 1.1 (the cocycle class is a nonzero rational multiple of the Borel class); Section 7 treats the simplex-volume formula. P.2 cites Theorem 1.1 at n = 2 without its proof. NEXT SOURCE ACTION: coordinate Sections 4 and 5 with BorelRegulators R.3 to R.7, and read Section 7 for P.2's own tetrahedron-volume proof gap. The weight-two volume identity is not transferred to BorelRegulators.

**Status.** Partly answered: the P.2 part read Goncharov's published §§5.1–5.6 and Appendix 7, found the printed calibration wrong (E22) and the Appendix 7 conversion undeveloped (E23, E24). Theorem 1.1's proof through §4 is not decomposed; the exact weight-two scalar is the P.2 part's gap 1.

### The exact scalar and sign of the weight-two Borel comparison

*first packet, gap 6. Needed by `P.2/borel-comparison`.*

P.2/borel-comparison asserts some q in ℚ^×. The exact q and its sign need Goncharov Sections 5.4 and 5.5 ('For normalization of the Borel classes ... see Chapter 5'), unread, or Bloch's lectures; BorelRegulators R.7 owns them, and K3BlochGroups V.6/regulator-agreement should take them from there.

**Status.** Superseded by the P.2 part's gap 1. The owner of the exact scalar is P.2, not BorelRegulators R.7 (RT-AREA-ktheory-2/23).

### Milnor's formula for the volume of an ideal tetrahedron

*first packet, gap 7. Needed by `P.2/hyperbolic-volume`.*

The volume of an ideal tetrahedron is L(alpha) + L(beta) + L(gamma). P.2 owns this comparison and its missing proof; none of the sources read for the packet proves it (Goncharov Section 7 remains unread). GeometricTopology layers 7 and 8 supply the ambient metric/measure foundations and model geometry, not this formula; the separate ideal-geometry extension is recorded below. QT.5 imports the completed P.2 identity when available and does not close this gap.

**Status.** Answered conditionally: `P.2/milnor-angle-volume` plans Milnor's proof (Lobachevsky's function, its Fourier series and duplication, the h^{−3} density and signed sectors). The theorem is stated on the ideal-region carrier that is the P.2 part's gap 2.

### A minimum principle for superharmonic functions

*first packet, gap 8. Needed by `P.1/bloch-wigner-positivity`.*

Positivity of D on the upper half-plane follows from Delta D = -2 Im z/(|z|^2 |1 - z|^2) < 0 and the boundary values 0, by the strong minimum principle for superharmonic functions, which the pinned Mathlib does not contain (it has the mean-value property of harmonic functions and Liouville's theorem).

**Status.** Open. It is also the input of the strict sign test in `P.6/trilogarithm-differential-regression-tests` (the P.6 part's gap).

### A geometrically convergent expansion of Li_2 near the unit circle

*first packet, gap 9. Needed by `P.2/certified-numerics`.*

Li_2(e^w) = ζ(2) + w(1 - log(-w)) + sum_{k≥2} ζ(2 - k) w^k/k! for |w| < 2π is needed because the reduction steps cannot move exp(+-i π/3) off the circle; it is standard but in no source read (checked numerically to 2e-31).

**Status.** Superseded: the P.2 part's Fourier construction (Kummer's reduction to the unit circle and the uniform tail bound 1/N) needs no expansion of Li_2 near the circle.

### Transfers on the polylogarithmic complexes

*first packet, gap 10. Needed by `P.3/residues-and-transfers`, `P.5/curve-polylogarithmic-complex`.*

The stage asks for transfers; no source read constructs them on B(F; 3) (Lambda^3 of the norm composed with restriction is [L:F]^3, not [L:F]). Only the transfer on H^3 = K^M_3(F)_Q exists (K2SymbolsBrauer:T.3/transfer-and-norm-residue). Push-forward of curve complexes needs it.

**Status.** Open. The P.3 part constructs the transfer on H³ unconditionally and a transfer on the complex only under P.4's homotopy conjecture (P.3 part's gap 6); the P.5 part inherits it for the curve complexes (P.5 part's gap 5).

### Currents on complex manifolds

*first packet, gap 11. Needed by `P.5/weight-two-regulator-form`, `P.5/unramified-weight-two-class`, `P.5/chow-dilogarithm`, `P.5/r-forms-and-distributions`, `P.5/r-form-differential`, `P.5/goncharov-deligne-complex`, `P.5/regulator-map-on-higher-chow`, `P.5/chow-polylogarithm-forms`, `P.5/weight-three-curve-regulator`.*

Currents of type (p, q) on a complex manifold, integration over subvarieties, push-forward along proper maps and the Poincare-Lelong formula 2 d'd'' log|f| = 2π i delta(f) ((17)). The pinned Mathlib has distributions on open subsets of normed spaces only (mathlib:Distribution); no stage owns currents.

**Status.** Answered by the P.5 part's current nodes (`P.5/compact-test-forms`, `P.5/manifold-currents`, `P.5/analytic-cycle-current`, `P.5/current-resolution`, `P.5/poincare-lelong`), up to the global smooth-form interface requested from ComplexComparisonPartII C5 and the El Mir and normal-current support theorems (P.5 part's gap 2).

### Chow varieties

*first packet, gap 12. Needed by `P.5/chow-polylogarithm-forms`.*

The spaces Z^q_p(L) of effective cycles meeting the faces of a simplex properly, 'a union of an infinite number of finite dimensional complex algebraic varieties' (Goncharov p. 26); no stage owns them.

**Status.** Refined by the P.5 part: the admissible loci are `P.5/admissible-chow-locus`; the Chow parameter spaces are requested from AlgebraicModuliForArithmeticGeometry R09.2, and the singular-family Radon operation is the P.5 part's gap 3.

### The group (36) and the Gersten comparison

*first packet, gap 13. Needed by `P.5/higher-arakelov-chow-degree-zero`.*

The group (36) of pairs (Z, g) on a complex variety (a version of Gillet and Soule's arithmetic Chow group) has no owner; the proof of Proposition 2.14 rests on the comparison of the last two cohomology groups of the Gersten complex with those of the cycle complex, asserted without reference (requested from SchemeKTheoryOperations S.4).

**Status.** Answered in part: the group (36) is `P.5/green-presentation`, assembled with the Arakelov group in `P.5/gersten-green-assembly`. The Gersten comparison in the last two degrees is the P.5 part's gap 4, requested from MotivicEtaleKTheory M.4 (not S.4, whose Bloch formula gives only the ordinary Chow group).

### The sign of the residue term in Goncharov's Proposition 2.8

*first packet, gap 14. Needed by `P.5/r-form-differential`, `P.5/simplex-form`, `P.5/regulator-map-chain-map`.*

With the residue convention res_v(π wedge u) = u-bar, the printed formula has the wrong sign at n = 2 (source issue E21); the correct sign for general n is to be fixed against Burgos Gil-Feliu-Takeda Section 5, which records a sign (-1)^m relative to Goncharov.

**Status.** Refined by the P.5 part's gap 6: the BFT model fixes T_m = (−1)^m r_{m−1}; the reconciliation with ε_n in every degree remains.

### The proof of the comparison with Beilinson's regulator is not decomposed

*first packet, gap 15. Needed by `P.5/regulator-induces-beilinson`.*

Burgos Gil-Feliu-Takeda Sections 4 to 6 (Burgos and Feliu's cubical regulator, Wang's forms, Levine's comparison of the simplicial and cubical complexes). Beilinson's regulator in their normalisation is requested from MotivicEtaleKTheory M.8.

**Status.** Answered by the P.5 part, which decomposes BFT §§4–6 from `P.5/wang-forms` to `P.5/beilinson-comparison-assembly`. Beilinson's regulator itself is requested from the early M.8 prefix (P.5 part's gap 1), and the raw-model conversion is the P.5 part's gap 6.

### Weight-three elliptic objects and the curve regulator's well-definedness

*first packet, gap 16. Needed by `P.5/weight-three-curve-regulator`.*

The weight-three Eisenstein-Kronecker expression needs the elliptic trilogarithm and weight-three Kronecker-Eisenstein series, which no stage owns (EllipticRegulators ER.3 is weight two); sources not read (Goncharov, Mixed elliptic motives, 1998; Goncharov-Levin). Well-definedness of rho_2 on B_2(F) tensor F^x is in Goncharov [G7], not read. The elliptic weight-three special-value conjecture is not asserted.

**Status.** Refined by the P.5 part: the generalized Eisenstein–Kronecker series, its convergence, the pairing and the Fourier formula are planned (`P.5/generalized-elliptic-trilogarithm` to `P.5/elliptic-fourier-comparison`), and well-definedness of ρ_2 is `P.5/weight-three-relation-descent`. The analytic regularisation and collation with the version of record are the P.5 part's gap 8. The elliptic weight-three special-value conjecture is not asserted.

### Goncharov's integral Bloch group and Suslin's rigidity

*first packet, gap 17. Needed by `P.5/strong-reciprocity-conjecture`, `P.5/reciprocity-second-triangle`, `P.4/explicit-to-inductive-comparison`.*

The target of Conjecture 6.2 is Goncharov's integral group defined through rigidity ([G1], not obtained); the packet states the conjecture rationally. Suslin's rigidity B(F(t)) = B(F) (Suslin 1990, Corollary 5.6) is requested from K3BlochGroups V.4.

**Status.** Open (the P.5 part's gap 9). Suslin's rigidity is requested from K3BlochGroups V.4 by the P.4 part, whose `P.4/suslin-rigidity-adapter` uses it.

### Early M.8 supplier must be split before it can be a dependency

*first packet, gap 18. Needed by `P.5/goncharov-deligne-complex-comparison`, `P.5/regulator-induces-beilinson`, `P.5/unramified-weight-two-class`.*

The generic real Deligne complex and generic regulator definition is requested through M.8 but requires a separately accepted early prefix. Do not add the whole M.8→consumer edge: it imports late D.2/R.7 work and can close a cycle. No new stage ID is fabricated here.

**Status.** Same as the P.5 part's gap 1.

### Ideal-boundary and oriented ideal-tetrahedron geometry beyond GeometricTopology layers 7 and 8

*first packet, gap 19. Needed by `P.2/hyperbolic-volume`.*

The stated upstream contracts provide Riemannian volume, curvature -1 metric structures and the homogeneous hyperbolic model, but do not construct its ideal boundary as the complex projective line, oriented geodesic ideal tetrahedra from distinct boundary points, finite Riemannian volume of those regions, or the geometric isometry/permutation/subdivision rules used by the volume identity. These inputs need an early geometric prefix of GeometricTopology, Part II: cusped hyperbolic 3-manifolds and ideal triangulations (RT-AREA-topology/8). The prefix must precede P.2 and QT.5's manifold-volume comparison, so importing all of QT.5 would be circular. P.2 still owns Milnor/Lobachevsky's comparison with D; this gap is not an upstream mathematical finding or a claim that the extension already exists.

**Status.** Same as the P.2 part's gap 2.

### Map-level Borel normalization, including the failed source calibration

*P.2 part, gap 1. Needed by `P.2/borel-comparison`, `P.2/goncharov-elementary-calibration`.*

The inherited up-to-Q× comparison is retained, with P.2 as its analytic owner. Goncharov Theorem 5.7’s printed n=2 class coefficient 1/12 and Corollary 5.10’s 1/24 are not accepted as an audited exact endpoint because the displayed C2(E2)=1 conflicts with equations (66)–(67): it equals -3/2. Re-derive the coefficient from the boundary/symmetric-space integral; compare beta_DR and AF.1a van Est, the R(1) generator 2pi i and the real-coordinate division, the r(∞,0,1,z)=z sign, and the natural V.4 Suslin map after rationalization. R.4/trace-cocycle supplies the independently normalized Burgos class. Export the exact scalar to the existing R.7/weight-two-bloch-wigner consumer; do not import that consumer as a premise.

**Status.** Open.

### Early ideal-boundary geometry beyond GeometricTopology layers 7–8

*P.2 part, gap 2. Needed by `P.2/milnor-angle-volume`, `P.2/hyperbolic-volume`.*

Request GeometricTopology, Part II: a canonical boundary identification ∂H^3≃CP^1 compatible with PGL_2(C), geodesic convex hulls of finite boundary configurations, measurable ideal-tetrahedron regions, orientation from ordered vertices, finite volume and upper-half-space chart/change-of-model compatibility. Supply almost-everywhere signed sector decomposition and exhaustion/dominated convergence for ideal regions. The existing layers own the metric and Riemannian volume but do not state this region/boundary interface. P.2 then proves the Milnor and D volume identities. No arbitrary carrier or assumed volume field substitutes for it.

**Status.** Open.

### Configuration normalization and duality verification

*P.3 part, gap 1. Needed by `P.3/configuration-chain-comparison`, `P.3/geometric-trilogarithm-comparison`, `P.3/trilogarithm-duality`.*

The independent reviewer read complete Gon95 §§4–5, including choice independence, reduction and Theorem A, and §§7–8 duality, as well as GR §§7.1–7.3. Necessary common coefficients are −3 Alt₄ and −(1/5) Alt₆, independently forced by rational valuation coordinates. Supply the full B₂-valued corrected chain square and an explicit adapter from the geometric presentation/old maps to the parent explicit B₃, tracking the printed 3/2 factor and rescaling −2/15. Reading a rational isomorphism and checking coordinates does not establish this normalization adapter.

**Status.** Open.

### Analytic proof of corrected 22-term identity

*P.3 part, gap 2. Needed by `P.3/trilogarithm-functional-relations`, `P.3/trilogarithm-descent`.*

Gon95 Theorem 1.3 states the needed functional identity. Supply the full derivative/constant/continuation argument for the corrected coordinate expression, or a primary detailed analytic proof; the source theorem and GR cobracket proof alone do not display this analytic step.

**Status.** Open.

### Cycle-lifting higher differentials

*P.3 part, gap 3. Needed by `P.3/cycle-lifting`, `P.3/regulator-image-containment`, `P.3/every-family-special-value`.*

Gon95 §9.2 asserts without displaying the unpleasant computation of higher differentials that ker δ₃ lifts to H₅(PGL₃(F),Q). Write those differentials and surviving-edge identification, then check PGL-to-stable-GL passage and primitive pairing. This is the decisive unresolved proof for the all-family conclusion; do not assume the stronger H¹Γ≃K₅^(3) conjecture.

**Status.** Open. Part (b) of the weight-three theorem rests on it.

### Suslin primary proof and primitive symbol adapter

*P.3 part, gap 4. Needed by `P.3/suslin-top-comparison`.*

The integral homology/Milnor statement is imported from K3BlochGroups:V.4/homological-stability, which already owns its missing Suslin 1984 source proof. The primary text was not obtained (MathNet access failed). The new work is the diagonal-symbol, primitive-Hurewicz and configuration normalization adapter. Do not claim a second proof or integral transfer compatibility. The original unscaled agreement of c₃ with the diagonal symbol was not justified: r₄ is 18 f₀, and the cited abstract quotient isomorphism does not compute the primitive/diagonal coefficient κ.

**Status.** Open. Suslin's primary-source gap belongs to K3BlochGroups V.4.

### Exact regulator-class normalization

*P.3 part, gap 5. Needed by `P.3/rational-regulator-calibration`, `P.3/regulator-image-containment`, `P.3/every-family-special-value`.*

R.4 uses Tate-divided R(2) coordinates and a Burgos-normalized class. Gon95’s original real Borel class has a different convention. The determinant exponents force a π² factor per coordinate; computing the exact universal class adapter is requested from R.7. Until then the parent plain rational-multiple wording cannot be applied to R.4 coordinates.

**Status.** Open; requested from BorelRegulators R.7.

### Unconditional complex transfer

*P.3 part, gap 6. Needed by `P.3/conditional-complex-transfer`.*

Only the H³ transfer is unconditional from Milnor norms. Gon95’s derived construction assumes the weight-four homotopy/residue quasi-isomorphism and does not establish tower independence of termwise B₃ transfers. P.4 owns the higher-weight hypothesis; a proof of it or a separate transfer construction is required. The required ∞ residue is a weight-four field-complex map killing constants, not the normal-complex-variety exterior residue in P.5. It must be supplied for the same complex model as the quasi-isomorphism.

**Status.** Open. The P.4 part's `P.4/homotopy-conjecture` and `P.4/weight-four-residue-map` state the hypothesis at the finite places; the residue at infinity that the transfer also uses is not yet planned.

### Faithful supplier interfaces in the suggested file

*P.3 part, gap 7. Needed by `P.3/coordinate-relation`, `P.3/relation-cobracket`, `P.3/middle-configuration-map`, `P.3/seven-term-configuration-relation`, `P.3/configuration-chain-comparison`, `P.3/steinberg-boundary-image`, `P.3/trilogarithm-descent`, `P.3/every-family-special-value`, `P.3/trilogarithm-functional-relations`, `P.3/geometric-trilogarithm-comparison`.*

Comments do not restrict universally quantified Lean module variables to the parent objects. The review removes the false arbitrary-module theorems and marks them not stated under PROTOCOL §13. A revision must bind the actual parent B₂/B₃ quotient symbols, differential laws, Γ, single-valued L₃ and regulator; supply their genuine carrier/maps and quotient universal properties. Do not assume desired comparison conclusions as structure fields. Missing API/test signatures remain listed explicitly in the review.

**Status.** Open: a revision of the P.3 part binds these signatures.

### Discriminating comparison and descent tests

*P.3 part, gap 8. Needed by `P.3/stabilized-configuration-comparison`, `P.3/middle-configuration-map`, `P.3/geometric-trilogarithm-presentation`, `P.3/trilogarithm-descent`, `P.3/configuration-duality`, `P.3/weight-three-bigrassmannian`, `P.3/cohomology-transfer`.*

Finish the omitted API/test signatures against real supplier maps. Zero-map and type-only homology examples do not characterize the configuration comparison; its nonzero stabilized-cycle fixture is absent. The geometric relation submodule and triangle class need explicit native construction formulas, not only placeholder-defined objects. Ordinary Fin dimension transports do not justify omitting all general duality API. The review report inventories each omission; at least three meaningful tests per definition/construction must survive.

**Status.** Open: a revision of the P.3 part supplies these tests.

### Degenerating rational-curve relation specialization

*P.4 part, gap 1. Needed by `P.4/relation-specialization-induction`, `P.4/complex-specialization`, `P.4/cycle-constancy`, `P.4/suslin-rigidity-adapter`.*

Supply a joint induction proving sp_a(R_n(F(t)))⊆R_n(F) in the exact GR/G94 rational-curve model, including degenerating two-variable kernel witnesses. G95 Lemma 1.16 is a smooth-curve model and its printed tensor specialization fails bilinearity. Angular components repair the generator boundary square but do not, without this family argument, prove preservation of the relation subspace. The scalar constancy proof has been read and is planned; its algebraic lower-weight specialization dependency inherits this gap.

**Status.** Open.

### Explicit weight-four correlator and regulator proof owner

*P.4 part, gap 2. Needed by `P.4/explicit-weight-four-complex`, `P.4/weight-four-regulator-input`, `P.4/weight-four-determinant-lifting`.*

The named Polylogarithms Part II must supply GR Theorem 1.14(a),(c), Corollary 1.15, motivic-correlator realization (Theorem 1.13), the configuration/flag cocycles (Theorems 7.6,9.1), the cycle-level L₄* to L₄ period adapter and §9.3 regulator comparison. For part (b) include the explicit-cycle period-image containment, not only the map κ from K₇. This P.4 job owns the exact objects/statements and interface; it does not claim to have decomposed the full §§2–10 proof or invented an already-live extension id.

**Status.** Open; its owner is the proposed Part II.

### Inductive weight-four every-family determinant

*P.4 part, gap 3. Needed by `P.4/weight-four-determinant-lifting`.*

Prove all ω:ker δ₄^ind→ker(p₃⊗id)/δ₄^exp(ker p₄) vanish, or prove directly that embedding-wise periods of all inductive cycles lie in the calibrated rational K₇ regulator image. The explicit-to-inductive group surjections and GR complex (44) do not supply either assertion. Full p₃ bijectivity is a stronger conjectural sufficient condition, not a premise silently granted here.

**Status.** Open.

### Finite-place symbol descent and signed residues

*P.4 part, gap 4. Needed by `P.4/weight-four-residue-map`, `P.4/homotopy-conjecture`.*

Extend the rational-point relation-preservation proof to polynomial-place residue fields k_p and prove the displayed residue maps descend through inductive relations and satisfy the signed native-shift chain squares. Parent P.3 exterior residue supplies only the unit wedge map. A proof must retain uniformizer-first orientation and finite support; neither follows merely from the scalar period theorem.

**Status.** Open.

### Weight-four homotopy and derived transfer independence

*P.4 part, gap 5. Needed by `P.4/homotopy-conjecture`, `P.3/conditional-complex-transfer`.*

The rational-curve analogue of Gon95 Conjecture 1.39 at n=4 remains conjectural. Once ρ₄ exists, prove its quasi-isomorphism or keep it as an explicit hypothesis. To deduce it from Gon95’s all-smooth-curve assertion, also supply a comparison of the two curve models compatible with the complexes, field inclusions and finite-place residue maps; G94 Definition 1.19 does not establish that comparison. A separate proof of primitive-element and tower independence, plus agreement with top Milnor cohomology, is still required for derived transfers. GR Corollary 1.15 is a different comparison and does not prove this homotopy statement.

**Status.** Open. It is also the hypothesis of `P.3/conditional-complex-transfer`.

### Early M.8 supplier not yet split

*P.5 part, gap 1. Needed by `P.5/current-resolution`, `P.5/logarithmic-green-forms`, `P.5/green-current-comparison`, `P.5/bft-current-dictionary`, `P.5/wang-forms`, `P.5/wang-differential`, `P.5/bft-auxiliary-complex`, `P.5/integration-comparison`, `P.5/regulator-homotopy`, `P.5/cubical-beilinson`, `P.5/beilinson-comparison-assembly`, `P.5/curve-symbol-chern-comparison`, `P.5/weight-three-motivic-comparison`, `P.5/goncharov-deligne-complex-comparison`, `P.5/unramified-weight-two-class`, `P.5/regulator-induces-beilinson`.*

All general Deligne carriers, support operations and universal-regulator inputs terminate at the exact request to M.8 above. Confirmed RT-AREA-ktheory-2/7 and /24 require an accepted early archimedean prefix before a dependency id can be used. Do not promote the request into an edge from the entire unsplit M.8.

**Status.** Open, waiting for the maintainer's split of M.8.

### Global smooth analytic and torus Fourier interface

*P.5 part, gap 2. Needed by `P.5/compact-test-forms`, `P.5/current-resolution`, `P.5/weight-three-pairing`, `P.5/elliptic-fourier-comparison`, `P.5/analytic-cycle-current`, `P.5/poincare-lelong`, `P.5/admissible-chow-locus`.*

Mathlib scalar test functions/distributions are chart objects. The early C5 Part II interface requested here must supply global differential forms and integration before global current operations, and distributional Fourier coefficients before the elliptic formula. Existing proper de Rham–Betti nodes are a near miss, not a replacement. Analytic subsets and finite local projections also rest on C0/repair-analytification and its tracked, unintegrated PR196 carrier; the C0 request names this exact boundary. Also missing in P.5’s local current foundations are positive-current and locally complete pluripolar carriers with El Mir’s finite-mass extension theorem (Demailly III 2.3, pp. 139–140), and the normal-current support/dimension theorem (III 2.10–2.11, p. 141) with the order-zero hypotheses needed by Poincaré–Lelong. These are current-theory inputs owned by P.5, not assertions that C0 or R09.7 supplies arbitrary analytic resolution or current extension.

**Status.** Open.

### Chow incidence carrier and singular-family Radon operation

*P.5 part, gap 3. Needed by `P.5/admissible-chow-locus`, `P.5/chow-polylogarithm-forms`.*

R09.2 Part II must construct the requested parameter spaces. The parent Radon transform also needs a resolved, locally integrable pull–push through singular incidence families; a generic incidence projection need not be a submersion, so the arbitrary-current pullback API cannot justify this step. Provide a family-specific resolved-form construction and its independence proof.

**Status.** Open.

### Top-two Gersten/Bloch graph comparison

*P.5 part, gap 4. Needed by `P.5/gersten-green-assembly`.*

The graph map and moving argument are specified by the M.4 request; an actual node proving isomorphism on CH^p(X,1) as well as ordinary CH^p is absent. S.4 divisor lengths, Gersten resolution and Bloch formula do not establish this stronger comparison by themselves.

**Status.** Open.

### Inherited polylogarithmic complex transfers

*P.5 part, gap 5. Needed by `P.5/curve-polylogarithmic-complex`.*

The accepted parent gap remains: no source read constructs full B(F,3) complex transfers. Λ³ of a field norm composed with restriction scales by degree cubed; it is not the desired degree-one transfer. D96’s K4 transfer is not a construction of this missing chain map.

**Status.** Open (the first packet's gap 10).

### Parent ordinary residue sign and raw-model conversion

*P.5 part, gap 6. Needed by `P.5/r-form-differential`, `P.5/regulator-map-chain-map`, `P.5/bft-current-dictionary`, `P.5/simplicial-cubical-comparison`, `P.5/beilinson-comparison-assembly`.*

The BFT model has been fixed explicitly, including Tm=(-1)^m r_(m-1), d_D=-2∂bar∂ at the top, and its dimension-dependent integration twists. The parent E21 ordinary-d sign issue remains to be reconciled in every degree and with G05’s (2πi)^(p-m) factors. Published G05 p.21 visibly uses bar∂∂; no missing-bar OCR allegation is made. Until the complete degreewise chain dictionary is checked, the raw-parent-to-universal comparison is conditional.

**Status.** Open.

### Imported P.3 K4 comparison construction

*P.5 part, gap 7. Needed by `P.5/weight-three-motivic-comparison`.*

The P.3 map is imported by id with the parent’s unresolved proof/source decomposition. D96 Theorem 2.1 gives a number-field compatibility diagram and its §3.7 proof; it is not a proof of the generic-field map’s construction or an isomorphism on all K4.

**Status.** Open; it depends on the P.3 part's gaps.

### Elliptic Fourier regularisation and normalization collation

*P.5 part, gap 8. Needed by `P.5/elliptic-fourier-comparison`.*

The area/character convention and finite convolution determine the stated iA³/(4π²) scalar and -4/3 parent pairing factor. A rigorous approximation theorem controlling products near shared logarithmic poles and a comparison against the accessible version of record are still needed. The journal PDF was unavailable, and D96 v2 Theorem 3.4 has an impossible real-one integral convention; this pass records a target with proof obligations, not a completed analytic comparison.

**Status.** Open.

### Inherited integral reciprocity carrier

*P.5 part, gap 9. Needed by `P.5/strong-reciprocity-conjecture`, `P.5/reciprocity-second-triangle`.*

The accepted parent states the general conjecture rationally. Its integral Goncharov group through rigidity and Suslin rigidity supplier remain unresolved there. Preserve the proved P1/elliptic/algebraic-number cases and do not promote the general conjecture to a theorem.

**Status.** Open.

### Inherited proof input for the strict Bloch-Wigner sign test

*P.6 part, gap 1. Needed by `P.6/trilogarithm-differential-regression-tests`.*

The exact derivative and its equality to -D(i) are established by the new differential node. Strict negativity additionally imports Polylogarithms:P.1/bloch-wigner-positivity. The accepted base packet records that lemma’s remaining analytic input: a strong minimum principle for superharmonic functions on the upper half-plane, with zero boundary values on R and at ∞. This follow-up exposes that existing P.1 proof obligation without duplicating positivity or claiming it is closed. Only the strict sign assertion in trilog_diff_i_sign depends on it.

**Status.** Open (the first packet's gap 8).

## Requests

The parts file 42 requests with 27 suppliers. Each names the supplier stage, the exact statement needed and the nodes that need it; none asks another roadmap to restate what it already plans. Requests to roadmaps whose stage does not yet state the interface ask for a Part II or an early prefix of that stage, and the maintainer assigns its id: no stage id is invented. The first packet's requests predate the follow-ups, and three are restated more precisely by them: its M.8 request by the P.5 part's single early-prefix request, its S.4 request for the Gersten comparison by the P.5 part's M.4 request (S.4's Bloch formula gives only the ordinary Chow group), and its D.1 request by the P.6 part's, which takes the logarithm from ColemanIntegration L0. The only request inside the roadmap is the P.3 part's to P.4, answered at the finite places by `P.4/weight-four-residue-map` and `P.4/homotopy-conjecture`.

| Supplier | Requests | From |
|---|---|---|
| `AlgebraicModuliForArithmeticGeometry:R09.2` | 1 | P.5 part |
| `AlgebraicModuliForArithmeticGeometry:R09.7` | 2 | first packet, P.5 part |
| `AutomorphicFormsOnReductiveGroups:AF.1a` | 1 | P.2 part |
| `BorelRegulators:R.3` | 1 | first packet |
| `BorelRegulators:R.4` | 1 | first packet |
| `BorelRegulators:R.5` | 1 | first packet |
| `BorelRegulators:R.7` | 2 | P.3 part, P.4 part |
| `ComplexComparisonPartII:C0` | 1 | P.5 part |
| `ComplexComparisonPartII:C5` | 1 | P.5 part |
| `GeneralAlgebraicKTheory:K.2:plus` | 2 | first packet, P.3 part |
| `IntegralIwasawaTheory:I.2` | 2 | first packet, P.6 part |
| `IntegralIwasawaTheory:L4` | 2 | first packet, P.6 part |
| `K2SymbolsBrauer:T.2` | 1 | first packet |
| `K2SymbolsBrauer:T.3` | 2 | first packet, P.3 part |
| `K2SymbolsBrauer:T.4` | 1 | first packet |
| `K3BlochGroups:V.3` | 1 | first packet |
| `K3BlochGroups:V.4` | 3 | first packet, P.3 part, P.4 part |
| `K3BlochGroups:V.6` | 1 | first packet |
| `MotivicEtaleKTheory:M.4` | 2 | first packet, P.5 part |
| `MotivicEtaleKTheory:M.6` | 2 | first packet, P.5 part |
| `MotivicEtaleKTheory:M.8` | 2 | first packet, P.5 part |
| `PadicHodgeRegulators:D.1` | 2 | first packet, P.6 part |
| `Polylogarithms:P.4` | 1 | P.3 part |
| `SchemeKTheoryOperations:S.4` | 1 | first packet |
| `SchemeKTheoryOperations:S.6` | 2 | first packet, P.4 part |
| `tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume` | 2 | first packet, P.2 part |
| `tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition` | 2 | first packet, P.2 part |

**`AlgebraicModuliForArithmeticGeometry:R09.2`.**

- (P.5 part) Algebraic moduli for arithmetic geometry, Part II: projective Chow parameter spaces over C for effective cycles of fixed degree and codimension, their incidence cycles and proper incidence projections, algebraicity of the proper-face-intersection open loci via fibre dimension, and face/vertex cycle maps on domains where dimensions are preserved. Hilbert and Quot schemes and Chow’s lemma do not by themselves give this contract. Needed by `P.5/admissible-chow-locus`, `P.5/chow-polylogarithm-forms`.

**`AlgebraicModuliForArithmeticGeometry:R09.7`.**

- (first packet) Embedded resolution of singularities in characteristic zero (Goncharov Theorem 2.6). Needed by `P.5/r-forms-and-distributions`, `P.5/r-form-differential`.
- (P.5 part) Embedded characteristic-zero resolution of an analytic cycle coming from an algebraic cycle in a smooth complex algebraic ambient variety, simultaneously adapted to its rational-function divisors and cube/simplex boundary, with properness, normal-crossings charts and common refinements. Use R09.7a–d’s existing scope, not an unrestricted analytic or mixed-characteristic resolution theorem. Needed by `P.5/analytic-cycle-current`, `P.5/logarithmic-green-forms`, `P.5/logarithmic-current-estimate`, `P.5/wang-boundary-currents`, `P.5/cubical-regulator`, `P.5/green-wang-product`.

**`AutomorphicFormsOnReductiveGroups:AF.1a`.**

- (P.2 part) Degree-three comparison for GL_2(C) and stabilized GL_N(C): differentiable/continuous cochains, invariant forms, relative Lie cohomology and van Est with explicit coefficient and orientation conventions. Add a compatible measurable-cocycle comparison for the P.2 D(cross-ratio) representative, including repeated configurations. The latter is an extension request rather than a claim that the current AF.1a text supplies it. Needed by `P.2/bloch-wigner-cocycle`, `P.2/borel-comparison`, `P.2/goncharov-elementary-calibration`.

**`BorelRegulators:R.3`.**

- (first packet) Borel's rank theorem (reserved id BorelRegulators:R.3/borel-rank-theorem): dim K_{2n-1}(F)_Q is r_1 + r_2 for n odd and r_2 for n even (n ≥ 2). Needed by `P.3/weight-three-special-value`.

**`BorelRegulators:R.4`.**

- (first packet) The Borel regulator on K_3^ind(F)_Q at each complex place (reserved id BorelRegulators:R.4/borel-regulator), and its injectivity modulo torsion for number fields F. Needed by `P.2/borel-comparison`, `P.3/trilogarithm-regulator-borel`, `P.5/reciprocity-algebraic-numbers`.

**`BorelRegulators:R.5`.**

- (first packet) Borel's theorem relating ζ_F(n) to the Borel regulator up to ℚ^× (Borel 1977). Needed by `P.3/weight-three-special-value`, `P.4/weight-four-theorem`.

**`BorelRegulators:R.7`.**

- (P.3 part) Continuous/measurable configuration comparison with primitive and conjugation-even degree-5 Borel lines; exact conversion from Goncharov’s original real normalization to R.4 universal class and Tate-divided coordinates. Prove its universal π²·Q× factor and compute the rational coefficient in the chosen convention. Needed by `P.3/configuration-borel-class`, `P.3/rational-regulator-calibration`.
- (P.4 part) Audit the scalar L_n versus R.4 Burgos/Tate-divided real coordinates: the regulator-compatible comparison must have an explicit π^(n−1)·Q× conversion, with its rational scalar and orientation checked at cycle level. In weight four compare the source L₄* with L₄ on δ₄-cycles; a pointwise scalar identity is false. Existing universal-factor-two concerns two classes in the same Tate coordinates and does not supply this analytic normalization adapter. Needed by `P.4/regulator-comparison`, `P.4/period-calibration`, `P.4/weight-four-regulator-input`.

**`ComplexComparisonPartII:C0`.**

- (P.5 part) Import the existing analytification node with its tracked PR196 analytic-space gap. Supply the analytic closed-subspace and dimension interfaces, finite local ramified projection/mass estimates for pure analytic sets, and holomorphic charts needed for Demailly III §2.B–C. These are analytic-space foundations, not another construction of currents or Chow parameter spaces. No accepted PR196 stage id is invented. Needed by `P.5/analytic-cycle-current`, `P.5/poincare-lelong`, `P.5/admissible-chow-locus`.

**`ComplexComparisonPartII:C5`.**

- (P.5 part) ComplexComparisonPartII, Part II: an early smooth-manifold analytic interface for global real/complex differential forms, alternating type decomposition, exterior derivative, partitions of unity, smooth integration and Stokes with the support hypotheses; chart distributions and the test LF topology remain imported from Mathlib. For the elliptic Fourier target also supply characters/Fourier expansion on a compact real torus and the distributional logarithmic Green-function coefficients in the explicit measure convention. The proper algebraic de Rham–Betti comparison alone does not supply this interface. Needed by `P.5/compact-test-forms`, `P.5/current-resolution`, `P.5/weight-three-pairing`, `P.5/elliptic-fourier-comparison`, `P.5/analytic-cycle-current`, `P.5/poincare-lelong`, `P.5/admissible-chow-locus`.

**`GeneralAlgebraicKTheory:K.2:plus`.**

- (first packet) BGL(F)^+ and the Hurewicz map, which define the rank filtration the weight-three maps vanish on. Needed by `P.3/k-theory-comparison-weight-three`.
- (P.3 part) Part II: natural rational primitive Hurewicz K_n(F)_Q≃Prim H_n(GL(F),Q), stable block-sum Hopf structure, primitive/decomposable splitting and compatibility with the rank≤r filtration. In degree 3 compare the primitive rank quotient and Suslin’s diagonal Milnor map; in degree 5 primitive Borel pairing kills the decomposable complement. This is not the arithmetic-only Cartan–Serre node in BorelRegulators R.3. In degree 3 compute the nonzero rational diagonal-symbol coefficient for the corrected r₄=18 f₀, with specified bar-shuffle and primitive conventions; do not presume that coefficient is one. Needed by `P.3/stabilized-configuration-comparison`, `P.3/rank-two-vanishing`, `P.3/suslin-top-comparison`, `P.3/cycle-lifting`, `P.3/regulator-image-containment`.

**`IntegralIwasawaTheory:I.2`.**

- (first packet) Shared early completed global-unit map E_K⊗ℤ_p → ∏_{v|p}Û_v and strong-Leopoldt injectivity, with comparison to local principal-unit logarithms after the necessary pro-p/torsion treatment. Distinguish this conjecture from weak cyclotomic Leopoldt and from the proved abelian Baker–Brumer case at L4. P.6 retains its regulator matrix, determinant/rank equivalence and tests. Needed by `P.6/leopoldt-statement`, `P.6/leopoldt-equivalence`.
- (P.6 part) Own the early completed global-to-local unit map, the strong Leopoldt injectivity proposition and defect delta_{K,p}=rank(E_K modulo torsion)-rank of the logarithmic image. Supply the comparison between completed local units and principal-unit logarithms, with prime-to-p projection or powering and p-primary torsion explicit (especially p=2). An ordinary unit does not itself lie canonically in U_v^1. Give the torsion-free rationalised rank formulation and identify it with completed-map injectivity after torsion is checked. Distinguish strong Leopoldt from weak cyclotomic Leopoldt. This interface has no dependency on polylogarithms or Zagier infrastructure. Needed by `P.6/leopoldt-equivalence`, `P.6/leopoldt-statement`.

**`IntegralIwasawaTheory:L4`.**

- (first packet) The abelian case of Leopoldt's conjecture through the Baker-Brumer theorem, imported by P.6 and not reproved. Needed by `P.6/leopoldt-statement`.
- (P.6 part) The proved abelian strong-Leopoldt case via Baker–Brumer, expressed using I.2’s early shared proposition; use as a special-case test, not as a proof for arbitrary number fields. Needed by `P.6/leopoldt-equivalence`.

**`K2SymbolsBrauer:T.2`.**

- (first packet) By node id, Matsumoto's theorem (T.2/matsumoto) and Milnor K-theory (T.2/milnor-k-theory). Needed by `P.5/strong-reciprocity-implies-suslin`, `P.3/milnor-degree-comparison`.

**`K2SymbolsBrauer:T.3`.**

- (first packet) By node id: the tame symbol (T.3/tame-symbol), compared with the residue on Lambda^2; the higher Milnor residues (T.3/higher-milnor-residues); and the transfer with the norm-residue formula (T.3/transfer-and-norm-residue), the only transfer available on H^3 = K^M_3(F)_Q. Needed by `P.3/exterior-residue`, `P.5/weight-two-regulator-form`, `P.5/curve-polylogarithmic-complex`, `P.5/unramified-weight-two-class`, `P.5/strong-reciprocity-implies-suslin`.
- (P.3 part) Part II degree-3 Milnor–Quillen transfer compatibility after the top rank comparison, with its exact sign and torsion allowance. The existing milnor-quillen-transfer-comparison supplies degree 2 only. Needed to assert Quillen-transfer naturality, not to define the H³ Milnor transfer. Needed by `P.3/suslin-top-comparison`.

**`K2SymbolsBrauer:T.4`.**

- (first packet) By node id, Weil reciprocity (T.4/weil-reciprocity) and the Milnor transfer (T.4/milnor-transfer-transitivity); in addition i o N = sum over g in G of g^* on K^M_3 for a Galois cover (Goncharov (87)), and Suslin's reciprocity law for K^M_3 of a curve, which T.4 states only in degree two. Needed by `P.5/reciprocity-projective-line`, `P.5/chow-dilogarithm-families`, `P.5/reciprocity-algebraic-numbers`.

**`K3BlochGroups:V.3`.**

- (first packet) The pre-Bloch group, the five-term relation, the boundary [x] ↦ x wedge (1 - x) into the antisymmetric quotient, the Bloch group and the comparison of the antisymmetric quotient with the exterior square, imported by node id (V.3/pre-bloch-group, five-term-relation, bloch-boundary, bloch-group, antisym-exterior-comparison). From V.3's stated scope ('the conventions used by Bloch, Goncharov and Calegari-Garoufalidis-Zagier'): Goncharov's explicit integral Bloch group B_2(F) = Z[P^1(F)]/R_2(F), R_2 generated by {0}, {∞} and the five-term elements with the cross-ratio r(∞, 0, 1, x) = x (Goncharov 2004, Section 6.1), its boundary {x}_2 ↦ (1 - x) wedge x into Lambda^2 F^x, and its comparison with P(F), which involves the swap r = 1/cr against V.4's cross-ratio. Needed by `P.2/bloch-wigner-descent`, `P.2/weight-two-regulator`, `P.3/polylogarithmic-complex`, `P.3/trilogarithm-group`, `P.4/explicit-to-inductive-comparison`, `P.5/strong-reciprocity-conjecture`, `P.5/reciprocity-projective-line`.

**`K3BlochGroups:V.4`.**

- (first packet) The cross-ratio (V.4/cross-ratio), the map psi and Suslin's exact sequence (V.4/psi-map, V.4/suslin-exact-sequence), by node id; and Suslin's rigidity B(F(t)) = B(F) for infinite F (Suslin 1990, Corollary 5.6), which the identification of the explicit and inductive weight-two groups and Goncharov's Lemma 6.4 use. If V.4 does not take the rigidity theorem, it stays a gap of this packet. Needed by `P.2/borel-comparison`, `P.2/bloch-wigner-cocycle`, `P.2/hyperbolic-volume`, `P.4/explicit-to-inductive-comparison`, `P.5/reciprocity-second-triangle`.
- (P.3 part) Part II extension of the existing hyperhomology-map: arbitrary bounded-below complexes of Q-linear representations and an acyclic augmented symmetrized generic-vector resolution, with the natural edge map to homology of coinvariants. Retain the existing projective-point configuration model as the integral specialization. Needed by `P.3/stabilized-configuration-comparison`, `P.3/cycle-lifting`.
- (P.4 part) Part II export of Suslin Corollary 5.6 (English translation p. 237): for every infinite F the constant-field map B_Sus(F)→B_Sus(F(t)) is an isomorphism, with compatible rational-point specialization retractions, including the proof via Theorem 5.2 and K₃^ind rational-function invariance. Existing suslin-exact-sequence does not itself provide this export. P.4 owns only the relation-presentation adapter. Needed by `P.4/suslin-rigidity-adapter`.

**`K3BlochGroups:V.6`.**

- (first packet) The constructor that refuses a Bloch element without a proved boundary and the five-term certificate (V.6/bloch-element-constructor, V.6/five-term-certificate). V.6/regulator-agreement cites the scalar 'fixed in' P.2/borel-comparison; after this review P.2 asserts only some q in ℚ^×, and V.6 should take the exact scalar and sign from BorelRegulators R.7. Needed by `P.6/tests`.

**`MotivicEtaleKTheory:M.4`.**

- (first packet) Bloch's simplicial cycle complex Z(X; n) of cycles on X x Delta^m meeting all faces properly, with d = sum (-1)^i d_i, in Goncharov's affine simplices Delta^m = P^m - {z_1 + ... + z_m = z_0}. Needed by `P.5/regulator-map-on-higher-chow`, `P.5/arakelov-motivic-complex`, `P.5/higher-arakelov-chow-degree-zero`, `P.5/regulator-induces-beilinson`.
- (P.5 part) For smooth projective complex X, simplicial, ∞-face-normalised cubical and mixed Bloch cycle complexes with admissible supports, total boundary δ+(-1)^n∂, and BOTH mixed-inclusion quasi-isomorphisms (Levine 1994 Theorem 4.7, as used in BFT Proposition 6.12). Also the admissible graph map from the final Gersten terms Λ²k(Y)*→k(Y)*→Z^p(X), compatible with tame/divisor signs and inducing isomorphisms in its last TWO cohomology groups (ordinary CH^p and CH^p(X,1)); S.4’s ordinary Bloch formula supplies only the former. Import moving and localization rather than reconstructing cycle complexes in P.5. Needed by `P.5/gersten-green-assembly`, `P.5/cubical-regulator`, `P.5/bft-auxiliary-complex`, `P.5/mixed-regulator`, `P.5/simplicial-cubical-comparison`.

**`MotivicEtaleKTheory:M.6`.**

- (first packet) K_n(X)^{(p)}_Q = CH^p(X, n)_Q with its Chern character (Bloch, Levine), and for fields the rational weight decomposition of K-theory against which Goncharov's conjecture is stated. Needed by `P.5/regulator-induces-beilinson`, `P.3/k-theory-comparison-weight-three`, `P.4/goncharov-comparison-conjecture`.
- (P.5 part) For smooth projective complex varieties and n≥0, the rational higher Chern character K_n(X)_Q≅⊕p CH^p(X,n)_Q with the Adams weight, products and localization normalizations, in both cycle models after M.4 comparison. It must use the same universal ch_(n,p) convention as the early M.8 archimedean regulator. In the chosen conventions Pc([a])=-log|a| but the universal unit regulator is +log|a|: export the compensating K1-to-cube character sign, hence the class −[a] (equivalently [a^-1] under the multiplicative cycle identification). This test is part of the contract, not an unchecked scalar agreement. Needed by `P.5/cubical-beilinson`, `P.5/beilinson-comparison-assembly`.

**`MotivicEtaleKTheory:M.8`.**

- (first packet) The real Deligne-Beilinson complex for smooth varieties over R, with its products and long exact sequence, as an early part needing no BorelRegulators input (confirmed findings RT-AREA-ktheory-2/7 and /24), and Beilinson's regulator in the normalisation of Burgos Gil-Feliu-Takeda. FIX-RT-AREA-ktheory-2~2: require an EARLY real Deligne complex and generic regulator definition interface, before D.2 and BorelRegulators:R.7. The current atlas M.8 remains unsplit and depends on those later comparisons; this request is not a dependency on all of M.8 and does not claim the prefix already exists. Needed by `P.5/goncharov-deligne-complex-comparison`, `P.5/unramified-weight-two-class`, `P.5/regulator-induces-beilinson`.
- (P.5 part) An accepted EARLY archimedean prefix, before the late Selmer/Iwasawa and R.7/D.2 comparisons: the cone R(p)_D for all p on smooth complex varieties and its real-conjugation descent; hypercohomology and its long exact sequences; logarithmic smooth/Dolbeault/current comparisons, products with fixed homotopy-associative representatives, support cones, purity and cube homotopy invariance; universal Chern classes and ch_(i,p)=(-1)^(p-1)c_(i,p)/(p-1)!, the unit log|f| and symbol cup formula, cycle classes, proper trace/norm with divisor and tame-residue compatibility. Include the precise Burgos–Feliu support-regulator equality with the universal Chern regulator used by BFT Theorem 4.7. This foundation is owned by M.8 once, not by ER.2 or P.5. Needed by `P.5/current-resolution`, `P.5/logarithmic-green-forms`, `P.5/green-current-comparison`, `P.5/bft-current-dictionary`, `P.5/wang-forms`, `P.5/wang-differential`, `P.5/bft-auxiliary-complex`, `P.5/integration-comparison`, `P.5/regulator-homotopy`, `P.5/cubical-beilinson`, `P.5/beilinson-comparison-assembly`, `P.5/curve-symbol-chern-comparison`, `P.5/weight-three-motivic-comparison`, `P.5/goncharov-deligne-complex-comparison`, `P.5/unramified-weight-two-class`, `P.5/regulator-induces-beilinson`. Request only: no whole-M.8 prerequisite edge and no invented prefix id. The currently unsplit M.8 imports late R.7/D.2 work and must first be split by the maintainer. The affected prerequisite chains terminate at the recorded early-prefix gap.

**`PadicHodgeRegulators:D.1`.**

- (first packet) Iwasawa's p-adic logarithm on C_p (or on Q_p-bar), with log_p(eps) ≠ 0 for a unit eps that is not a root of unity. Needed by `P.6/leopoldt-statement`, `P.6/padic-regulator`.
- (P.6 part) Reuse ColemanIntegration:L0/iwasawa-logarithm, ColemanIntegration:L0/log-branch and ColemanIntegration:L0/log-branch-field-compatibility for the existing logarithm on C_p, log_p(p)=0, the unit homomorphism and compatibility with finite embeddings. D.1 supplies only the regulator-specific finite-extension principal-unit and rationalised rank comparison: identify the kernel on algebraic local units as roots of unity, track its finite torsion kernel (including p-primary torsion at p=2), and identify the embedding-wise regulator matrix with the rationalised completed unit map. This is a comparison with the existing Coleman logarithm, never a second construction of that logarithm. Needed by `P.6/padic-regulator`, `P.6/leopoldt-equivalence`.

**`Polylogarithms:P.4`.**

- (P.3 part) Weight-four homotopy/residue quasi-isomorphism Γ(F(t),4)/Γ(F,4)→⊕_P Γ(k(P),3)[−1] (Gon95 Conjecture 1.39), or a proof-independent derived transfer with tower independence and agreement with Milnor top cohomology. Treat the conjectural hypothesis explicitly; explicit-to-inductive B₃ is not a proved isomorphism. Supply the weight-four field-complex residues, including ∞, their chain-map and constant-annihilation laws, the quotient/shift identifications and the bridge from inductively defined to explicit B₃. P.5/residue-map is only a normal-complex-variety exterior residue and does not provide these maps. Needed by `P.3/conditional-complex-transfer`.

**`SchemeKTheoryOperations:S.4`.**

- (first packet) The Gersten comparison: the last two cohomology groups of the Gersten complex agree with those of Bloch's cycle complex (Goncharov, proof of Proposition 2.14, 'well known'). If neither S.4 nor M.4 owns it, it stays a gap. Needed by `P.5/higher-arakelov-chow-degree-zero`.

**`SchemeKTheoryOperations:S.6`.**

- (first packet) The rational Adams eigenspace decomposition of K_*(F)_Q and the gamma-filtration graded pieces. Needed by `P.3/k-theory-comparison-weight-three`, `P.4/goncharov-comparison-conjecture`.
- (P.4 part) Number-field rational Adams purity needed by the normalization implication: for n≥2, the canonical weight-n eigenspace inclusion K_(2n−1)(F)_Q^(n)→K_(2n−1)(F)_Q is an isomorphism, compatible with localization and the R.4 regulator. Import the general rational Adams/gamma interface; coordinate the arithmetic input with R.7 rather than equating a gamma graded piece and the full K-group by notation. Needed by `P.4/period-calibration`.

**`tauceti:TauCetiRoadmap/GeometricTopology#layer-7-riemannian-geometric-structures-and-volume`.**

- (first packet) The curvature -1 Riemannian metric and volume-measure foundations stated in layer 7, for use with the hyperbolic model of layer 8. The ideal-boundary/oriented-ideal-tetrahedron interface is an additional early Part II extension recorded as a gap, not an existing layer-7 result. P.2 owns the Milnor/Lobachevsky comparison of tetrahedron volume with the Bloch-Wigner dilogarithm; that comparison is not requested from GeometricTopology. Needed by `P.2/hyperbolic-volume`.
- (P.2 part) Import the explicit curvature -1 hyperbolic metric and its native Riemannian volume density, with upper-half-space chart density h^-3 and change-of-chart compatibility. Existing upstream work is not replanned. Needed by `P.2/milnor-angle-volume`, `P.2/hyperbolic-volume`.

**`tauceti:TauCetiRoadmap/GeometricTopology#layer-8-thurston-geometries-and-the-jsj--geometric-decomposition`.**

- (first packet) The model hyperbolic 3-geometry and its isometry action stated in layer 8, built on layer 7's metric/volume foundations. This does not supply the ideal boundary, oriented ideal tetrahedra or their finite-region-volume interface; the separate Part II proposal/gap states that extension. The tetrahedron-volume identity stays in P.2. Needed by `P.2/hyperbolic-volume`.
- (P.2 part) Import the three-dimensional hyperbolic model and its orientation-preserving model isometries. General JSJ, Mostow and manifold volume minimization are not proof prerequisites for an ideal tetrahedron. Needed by `P.2/milnor-angle-volume`, `P.2/hyperbolic-volume`.

## Structural proposals

The packets record 20 structural proposals: nine in the first packet and three, one, two, four and one in the follow-up packets. Each is listed as its packet states it, followed by its status. The ones that change this roadmap's shape are the Part II for the weight-four proof (first packet 2, P.4 part 1), the display split of P.5 (P.5 part 4) and the Rogers dilogarithm (first packet 6); the others fix owners between this roadmap and its neighbours.

### The Bloch-Wigner nodes belong here, not to K3BlochGroups V.3

*first packet, proposal 1: rescope of `Polylogarithms`, `K3BlochGroups`.*

The red-team finding RT-AREA-ktheory-2/27, confirmed by REV-RT-AREA-ktheory-2, records that research/blueprint/reserved-ids.json reserves the Bloch-Wigner function and its five-term identity as nodes of K3BlochGroups V.3 although P.1 plans them, and its fix is to re-reserve them here. This packet implements that fix: P.1/bloch-wigner-dilogarithm and P.1/bloch-wigner-five-term are nodes of this packet, with P.2 keeping the descent to the Bloch group and K3BlochGroups V.3 keeping the algebraic pre-Bloch group, the five-term relation and the Bloch group. The companion packet for K3BlochGroups delivers its two reserved ids as required by its own job, imports the construction from here rather than rebuilding it, does not mark them as planets, and carries the matching restructure entry. Applying the fix means retiring those two ids from K3BlochGroups and pointing its consumers at the two nodes here.

**Proposal.** Retire K3BlochGroups:V.3/bloch-wigner-dilogarithm and V.3/bloch-wigner-five-term and point their consumers at Polylogarithms:P.1/bloch-wigner-dilogarithm and P.1/bloch-wigner-five-term; P.2 keeps the descent.

**Status.** Implemented in the packets: the Bloch–Wigner function and its five-term relation are nodes of P.1. Retiring the two K3BlochGroups V.3 reserved ids and pointing their consumers here is the maintainer's.

### A Part II for the proof of the weight-four theorem

*first packet, proposal 2: split of `Polylogarithms`.*

The red-team finding RT-AREA-ktheory-2/51, confirmed by REV-RT-AREA-ktheory-2, records that P.4 treats the weight-four Zagier theorem as a separately identified extension although it is a published theorem, and that no roadmap owns it. Its fix is to record it as a theorem, which this packet does, and either to plan its proof in P.4 or to name its owner. The proof needs motivic correlators, cluster varieties and the cluster polylogarithm maps, which is a body of mathematics far larger than the statement infrastructure P.4 owns, so the proposal is a new roadmap extending this one, titled, in the form section 15 requires, Polylogarithms, explicit regulators and Zagier statements, Part II: weight four via motivic correlators and cluster polylogarithms, with this roadmap as its first prerequisite. Its scope would be the motivic correlators of the source's section 2, the cluster polylogarithm maps of its sections 3 and 4, the map from the weight-three to the weight-two groups of its section 5, and the weight-four Beilinson regulator of its section 9.

**Proposal.** Polylogarithms, explicit regulators and Zagier statements, Part II: weight four via motivic correlators and cluster polylogarithms (GR Sections 2 to 9, including Theorem 1.14 and the complex (44)), with this roadmap as its first prerequisite.

**Status.** Current. The P.4 part's proposal 1 refines it with the exact targets; together they define the Part II, whose id the maintainer assigns.

### The general weight-two curve regulator form belongs to P.5, and its target to M.8

*first packet, proposal 3: rescope of `Polylogarithms`, `EllipticRegulators`, `MotivicEtaleKTheory`.*

The red-team findings RT-AREA-ktheory-2/7 and /24, both confirmed, record that P.5 and EllipticRegulators ER.2 plan the same weight-two regulator form and that no stage owns the real Deligne-Beilinson complex in general. This packet follows their fix: P.5 owns the general curve formula for the form, with its closedness, its residues and the Steinberg relation through the Bloch-Wigner function, and ER.2 is expected to specialise it to an elliptic curve with the factor of two π and the orientation. The Deligne complex is requested from MotivicEtaleKTheory M.8 as an early part needing no BorelRegulators input, and every statement of P.5 that mentions a Deligne class is conditional on it. (P.5's coverage is partial for the reasons listed in its coverage record.)

**Proposal.** P.5 owns eta(f, g) with its Steinberg, residue and period statements; the link runs P.5 → EllipticRegulators ER.2 (ER.2 specialises P.5/weight-two-regulator-form, and no P.5 node depends on ER.2 or ER.3); the real Deligne-Beilinson complex is an early part of MotivicEtaleKTheory M.8.

**Status.** Current; the P.5 part's proposal 1 states the split of M.8 it needs.

### P.3 owns the explicit weight ≤ 3 complexes, P.4 the inductive groups

*first packet, proposal 4: rescope of `Polylogarithms`.*

The atlas has P.4 requiring P.3, but the blueprint built P.3's complexes on P.4's inductive groups, a stage cycle; the reserved id P.3/polylogarithmic-complex is for n ≤ 3; the stage text asks P.3 for 'the weight-three polylogarithmic groups and relations of the adopted Goncharov model'. Added by REV-Polylogarithms.

**Proposal.** P.3 owns the explicit groups and complexes of GR v5 Section 1.2 (B_2 from K3BlochGroups V.3, the trilogarithm group B_3) and the reserved id P.3/polylogarithmic-complex; P.4 owns the inductive B_n, delta_n, the general complex and the comparisons; this keeps the atlas edge P.3 → P.4.

**Status.** Applied in the packets: P.3 owns the explicit complexes, P.4 the inductive groups. One node of the P.3 part, `P.3/conditional-complex-transfer`, uses P.4 (see Dependencies).

### The normalised Zagier determinant belongs to P.4

*first packet, proposal 5: rescope of `Polylogarithms`, `SpecialValuesBirchTate`.*

SpecialValuesBirchTate B.8 requires P.6, which requires P.4, so the former request to B.8 pointed the wrong way (a cycle) and is deleted; the audit flagged the overlap. Added by REV-Polylogarithms.

**Proposal.** P.4/zagier-determinant owns the normalised determinant; B.8 imports it.

**Status.** Applied: `P.4/zagier-determinant` owns the normalised determinant; SpecialValuesBirchTate B.8 imports it.

### The Rogers dilogarithm has three consumers and no owner

*first packet, proposal 6: rescope of `Polylogarithms`, `K3BlochGroups`, `ArithmeticQuantumTopology`, `HabiroNahmSeries`.*

K3BlochGroups requests 'The Rogers dilogarithm L(x) = Li_2(x) + 1/2 log(x) log(1 - x) on (0, 1)' from P.1 for V.5/element-c-order-six; ArithmeticQuantumTopology QT.5 builds one on P.1's Li_2; HabiroNahmSeries HB.3 defines its own in the normalisation π^2/6 - Li_2 - 1/2 log x log(1 - x). No source read for this packet defines it, so the review does not plan it. Added by REV-Polylogarithms.

**Proposal.** Plan it once, as Polylogarithms:P.1/rogers-dilogarithm, with both normalisations, the extension to the real projective line, the reflection and five-term identities, and the induced homomorphism under which c has order six; NEXT SOURCE ACTION: Zagier, The Dilogarithm Function (2007), Section II.1.

**Status.** Awaiting the maintainer. No packet plans `P.1/rogers-dilogarithm`; the consumers' requests are listed under Gaps.

### RT-AREA-ktheory-2/7,18,24: early foundations before comparisons

*first packet, proposal 7: note-duplicate-boundary.*

Maintainer: split the requested early finite-Chern and real-Deligne interfaces from M.8’s late comparison work. Retain finite coefficients, naturality, products, twists and real conjugation; P.5 retains Goncharov’s concrete current complex and the comparison with generic Deligne cohomology. The packet requests record missing exports without introducing M.8→R.7 or M.8→D.2 cycles.

**Status.** Current; the P.5 part's proposal 1 is its precise form.

### RT-AREA-ktheory-2/23–27: retained mathematics and common foundations

*first packet, proposal 8: note-duplicate-boundary.*

P.2 retains oriented ideal-tetrahedron volume and Bloch–Wigner comparison, importing the Tau Ceti geometric carrier; QT.5 applies this theorem. P.5 retains Goncharov’s distinct current-complex model and its comparison to the requested early Deligne interface. P.6 imports the early I.2 completed-unit proposition while retaining regulator equivalence, the abelian theorem and tests; no weak/strong Leopoldt theorem is deleted. The V.3 analytic reserved-ID correction is maintainer work; actual P.1/P.2 analytic owners already exist.

**Status.** Current. Its P.6 clause is now the P.6 part's proposal 1; its P.2 clause the P.2 part's proposals 1 and 2.

### Early ideal-tetrahedron geometry in GeometricTopology, Part II

*first packet, proposal 9: rescope of `Polylogarithms`, `ArithmeticQuantumTopology`, `tauceti:TauCetiRoadmap/GeometricTopology`.*

REV-FIX-RT-AREA-topology~2 checks the supplier contract, not upstream mathematics. Layers 7 and 8 state the metric/measure foundations and homogeneous model but not ideal-boundary or ideal-tetrahedron geometry. P.2 needs that geometry before its Milnor/Lobachevsky theorem, which QT.5 consumes; assigning it to the whole QT.5 stage would create a cycle.

**Proposal.** Coordinate with the GeometricTopology Part II extension of RT-AREA-topology/8. Put the ideal boundary, oriented geodesic tetrahedra, finite-region-volume and isometry/subdivision interface in an early geometric prefix importing layers 7 and 8, before Polylogarithms P.2 and QT.5 manifold-level comparisons. P.2 owns the formula vol I = D(r); QT.5 owns manifold Bloch/volume comparisons. A maintainer/design job must assign the extension's actual ids; none is invented here.

**Status.** Current; the same extension as the P.2 part's proposal 3.

### rescope: Polylogarithms, K3BlochGroups, BorelRegulators

*P.2 part, proposal 1: rescope of `Polylogarithms`, `K3BlochGroups`, `BorelRegulators`.*

Confirmed RT-AREA-ktheory-2/23: the analytic real-regulator comparison has one owner. The current V.6/regulator-agreement already imports P.2 as transport, but its text still names R.7 as an exact-scalar supplier.

**Proposal.** Keep the natural rational/integral Suslin comparisons in V.6. P.2 owns the D-to-Burgos comparison and its exact normalization; R.7 is the factor-two/normalization-test consumer. V.6/regulator-agreement is only transport along V.6/comparison-rational, or is removed as a duplicate endpoint. Use P.2→V.6 transport and P.2→R.7; do not add R.7→P.2. This pass requires V.4’s natural maps and does not add a whole-V.6 dependency.

**Status.** Awaiting the maintainer: K3BlochGroups V.6/regulator-agreement is to cite P.2 for transport only, and BorelRegulators R.7 to consume P.2's scalar.

### rescope: Polylogarithms, ArithmeticQuantumTopology

*P.2 part, proposal 2: rescope of `Polylogarithms`, `ArithmeticQuantumTopology`.*

Confirmed RT-AREA-ktheory-2/25 and RT-AREA-topology/7: ideal-tetrahedron volume is a P.2 identity, while QT.5 is its manifold-level consumer.

**Proposal.** Add Polylogarithms:P.2→ArithmeticQuantumTopology:QT.5. P.2 owns Milnor/Lobachevsky and ordered ideal volume D(r), importing the GeometricTopology foundations. QT.5 keeps triangulations, gluing and completeness, flattenings, manifold volume sum and Bloch invariant, and Chern–Simons comparison; it imports the canonical ideal-tetrahedron carrier from the early geometry extension and the volume identity from P.2.

**Status.** Awaiting the maintainer: add the stage link P.2 → ArithmeticQuantumTopology QT.5.

### rescope: Polylogarithms, tauceti:TauCetiRoadmap/GeometricTopology

*P.2 part, proposal 3: rescope of `Polylogarithms`, `tauceti:TauCetiRoadmap/GeometricTopology`.*

The existing upstream layers 7–8 do not state the ideal-boundary and finite-region interface required before the P.2 calculation.

**Proposal.** Create GeometricTopology, Part II: Ideal boundary and finite-volume geodesic regions, with layers 7–8 as its first suppliers; place the precise generic geometry described in the gap there. Leave upstream layers unchanged. Supply P.2 first and QT.5 next. The analytic Lambda and D identities remain in P.2.

**Status.** Awaiting the maintainer, together with the first packet's proposal 9.

### rescope: GeneralAlgebraicKTheory, K3BlochGroups, BorelRegulators, K2SymbolsBrauer

*P.3 part, proposal 1: rescope of `GeneralAlgebraicKTheory`, `K3BlochGroups`, `BorelRegulators`, `K2SymbolsBrauer`.*

Generic primitive Hurewicz and mixed-complex hyperhomology must not be invented as weight-three foundations here. Existing nodes provide plus/Q, integral configuration hyperhomology, Borel classes and Milnor norms but not the exact additional interfaces.

**Proposal.** General algebraic K-theory, Part II: rational primitive homology and rank filtration; K3 and Bloch groups, Part II: rational hyperhomology of bounded-below configuration complexes; Borel regulators, Part II: continuous/measurable class and normalization adapters; K₂ symbols and Brauer groups, Part II: degree-three Milnor–Quillen transfer adapter. Retain and import the original nodes in every case.

**Status.** Awaiting the maintainer; the four Part II exports are the requests to GeneralAlgebraicKTheory K.2, K3BlochGroups V.4, BorelRegulators R.7 and K2SymbolsBrauer T.3.

### Proof owner for the published weight-four theorem

*P.4 part, proposal 1: split of `Polylogarithms`.*

Refines the accepted parent Part II proposal and confirmed RT-AREA-ktheory-2/51. This packet owns statement infrastructure, exact Γ_exp/Γ_ind comparison and numerical implications; it imports rather than duplicates B₃ and general motivic/Deligne/K-theory foundations.

**Proposal.** Polylogarithms, explicit regulators and Zagier statements, Part II: weight four via motivic correlators and cluster polylogarithms. First prerequisite is P.4. Its assigned targets are GR Theorems 1.13–1.14, Corollary 1.15, Theorems 7.6,9.1 and §9.3, the cycle-level Hodge-period adapter and all-explicit-cycle period-image containment. Coordinate supplier extensions with MotivicEtaleKTheory M.8 and BorelRegulators R.7. No new stage id is invented.

**Status.** Current; it refines the first packet's proposal 2.

### Precise supplier additions without duplicated foundations

*P.4 part, proposal 2: rescope of `K3BlochGroups`, `BorelRegulators`, `SchemeKTheoryOperations`.*

The three requests retain their original owners: V.4 rational-function rigidity, R.7 real scalar coordinate calibration, and S.6 rational Adams/gamma operations with a number-field purity adapter. Existing exact-sequence, factor-two and weight-decomposition nodes are imported.

**Proposal.** Use named Part II exports in those directions where the existing layers lack the exact interface; the maintainer assigns ids. No general valuation, motivic category, Deligne complex or abstract regulator lattice is defined in P.4.

**Status.** Awaiting the maintainer; the exports are the P.4 part's three requests.

### split: MotivicEtaleKTheory, Polylogarithms, EllipticRegulators, PeriodsAndSpecialValues, BorelRegulators

*P.5 part, proposal 1: split of `MotivicEtaleKTheory`, `Polylogarithms`, `EllipticRegulators`, `PeriodsAndSpecialValues`, `BorelRegulators`.*

Confirmed RT-AREA-ktheory-2/7 and /24: general real Deligne objects and the universal Chern regulator are shared, but the unsplit M.8 consumes late comparison inputs and cannot precede all consumers.

**Proposal.** Split an early archimedean prefix from M.8, containing the exact first request. Its outgoing interfaces supply P.5, ER.2, PS.3 and R.7; late M.8 imports completed R.7/D.2 comparisons. P.5 owns general η and its comparison, ER.2 owns only elliptic dimension/embedding/conjugation/period/orientation/torsion specialisation, and ER.4 imports the generic M.8 norm/trace before its elliptic trace. Apply graph changes only after an accepted split; no prefix id is invented in this packet.

**Status.** Awaiting the maintainer. Until M.8 is split, the chains that need it end in the request and the gap.

### rescope: AlgebraicModuliForArithmeticGeometry, Polylogarithms

*P.5 part, proposal 2: rescope of `AlgebraicModuliForArithmeticGeometry`, `Polylogarithms`.*

P.5’s Chow-cycle parameter spaces are beyond the stated Hilbert/Quot/Chow-lemma contract of R09.2.

**Proposal.** Algebraic moduli for arithmetic geometry, Part II: Chow parameter spaces and incidence, starting from R09.2. P.5 keeps the face-admissible locus and the regulator-specific resolved pull–push; the general parameter construction is imported.

**Status.** Awaiting the maintainer.

### rescope: ComplexComparisonPartII, Polylogarithms

*P.5 part, proposal 3: rescope of `ComplexComparisonPartII`, `Polylogarithms`.*

Scalar chart distributions do not supply global smooth differential forms and manifold integration; the existing proper algebraic de Rham comparison is more specialised.

**Proposal.** Complex comparison, Part II: smooth-manifold analytic foundations, as an early interface attached to C5. Keep the global current continuous-dual construction in P.5 once; other Deligne/regulator consumers import it. Include the torus Fourier interface required for the elliptic formula.

**Status.** Awaiting the maintainer.

### split: Polylogarithms

*P.5 part, proposal 4: split of `Polylogarithms`.*

P.5 has three coherent mathematical groups while retaining one current atlas stage and six new planets in this follow-up.

**Proposal.** For atlas presentation group the existing and new P.5 nodes into: Curve symbols and reciprocity; Currents, Chow parameters and Green classes; Higher-cycle and elliptic regulator comparisons. These are presentation groups, not fabricated dependency stage ids. The maintainer must reconcile the parent’s planets when assembling the accepted parts.

**Status.** Displayed in this document as the sub-layers P.5:currents, P.5:curves and P.5:regulators; awaiting the maintainer for the atlas. The membership of each sub-layer is given in the layer sections; the order currents → curves → regulators has no backward edge.

### rescope: Polylogarithms, IntegralIwasawaTheory, AutomorphicPadicLFunctions

*P.6 part, proposal 1: rescope of `Polylogarithms`, `IntegralIwasawaTheory`, `AutomorphicPadicLFunctions`.*

Confirmed RT-AREA-ktheory-2/26: the shared strong-Leopoldt map and defect cannot be owned behind P.4’s Zagier infrastructure; the original P.6 node has an obsolete ownership sentence despite an existing I.2 request.

**Proposal.** I.2 owns the completed map, strong proposition and defect. I.2 → L4, I.2 → AutomorphicPadicLFunctions:L0 and I.2 → P.6 supply the three consumers. P.6 keeps padic-regulator, leopoldt-equivalence and polylogarithm tests. The old statement node becomes an imported adapter; its planet belongs at I.2. P.4 is not a mathematical prerequisite of this interface or of the pointwise trilogarithm differential.

**Status.** Awaiting the maintainer: add the stage links I.2 → P.6, I.2 → L4 and I.2 → AutomorphicPadicLFunctions L0, and move the planet of `P.6/leopoldt-statement` to I.2.

## Notes on other roadmaps

The P.3 part records one note on its own reading of the first packet, kept as written; the assembly applies it as the Assembly notes after `P.3/k-theory-comparison-weight-three`, `P.3/trilogarithm-regulator-borel` and `P.3/weight-three-special-value`. No part records a note on a Tau Ceti roadmap.

- (P.3 part; Polylogarithms, BorelRegulators) At assembly, reconcile the parent P.3 comparison domain: rank≤3/rank≤2 is not an Adams eigenspace or a quotient of all K without a rank bound. Also reconcile the parent regulator’s rational-multiple wording with R.4’s Tate coordinates (π² per coordinate), and orient the every-family special-value formula as det=q·period to allow zero determinants. This follow-up imports the targets but does not edit the parent packet.

## Dependencies

**Within the roadmap.** The atlas records the stage links P.1 → P.2, P.2 → P.3, P.3 → P.4, P.2 → P.5 and P.4 → P.6. The node prerequisites of the six packets induce these and, beyond what they imply transitively, four more:

- **P.3 → P.5.** The curve complexes, the residue on a normal variety and the weight-three curve comparison use P.3's complexes, exterior residue, residue maps and K-theory comparison (nine node edges).
- **P.4 → P.5.** The strong reciprocity conjecture states its target in P.4's B_2(k), the second triangle uses `P.4/explicit-to-inductive-comparison`, and the general-weight reciprocity conjecture uses P.4's complexes (three node edges).
- **P.5 → P.6.** The test suite checks the current identity of `P.5/weight-three-curve-regulator`.
- **P.4 → P.3, against the layer order.** `P.3/conditional-complex-transfer` (P.3 part) uses `P.4/general-polylog-complex` and cites the stage P.4, with a request for the weight-four residues and homotopy statement. The node graph stays acyclic, because no P.4 node uses that transfer, but at stage level it makes P.3 and P.4 depend on each other. The clean fix is to give the node to P.4, whose `P.4/homotopy-conjecture` it assumes, or to keep it in P.3 and cite the P.4 nodes `P.4/homotopy-conjecture` and `P.4/weight-four-residue-map` with the infinity residue as its remaining input; either is a packet edit, listed in the handoff note.

The three forward links should be added to the atlas when the packets are promoted. The node graph of all six packets is acyclic, also through every packet on main, and every prerequisite that names a node of this roadmap names an existing node. Every reference from a follow-up packet into another part points into the first packet (83 node edges); no follow-up cites another follow-up, and the first packet cites none of them.

**Display order of P.5.** The sub-layers are displayed as P.5:currents, P.5:curves, P.5:regulators. No node of an earlier sub-layer uses a node of a later one: the curve forms use the r-forms of P.5:currents, and the regulator comparisons use the curve forms and the currents.

**With other roadmaps.** The node graph reaches K3BlochGroups (V.3, V.4, V.6), BorelRegulators (R.3–R.5, R.7), K2SymbolsBrauer (T.2–T.4), MotivicEtaleKTheory (M.4, M.6), SchemeKTheoryOperations (S.4, S.6), GeneralAlgebraicKTheory K.2, KTheoryLowDegrees U.1, IntegralIwasawaTheory (I.2, L4), PadicHodgeRegulators D.1, ComplexComparisonPartII (C0, C5) and AlgebraicModuliForArithmeticGeometry (R09.2, R09.7), by node id where the supplier's packet has the node and by stage otherwise. MotivicEtaleKTheory M.8, Tau Ceti's GeometricTopology and AutomorphicFormsOnReductiveGroups AF.1a appear only in requests: M.8 because the stage as it stands imports late BorelRegulators R.7 and PadicHodgeRegulators D.2 work, so a prerequisite on the whole stage could close a cycle; GeometricTopology because the ideal-region interface is not in its stated layers. The stage links P.2 → BorelRegulators R.7 and P.2 → K3BlochGroups V.6 run from this roadmap; nothing here uses R.7's or V.6's conclusions about P.2.

## What this blueprint does not claim

- Nothing here is formalised. Every node has `implementationStatus` `unchecked`, and the suggested Lean file is a naming proposal whose proofs are `sorry`.
- No layer is closed. P.1 is source-decomposed; P.2–P.6 are planned, with the gaps and requests above.
- General Zagier (in every weight beyond the proved cases), Goncharov's comparison conjecture, the weight-four homotopy conjecture, strong reciprocity for general curves and in weight n ≥ 4, and Leopoldt's conjecture are statements, never assumptions, and no unconditional result depends on them. The conditional transfer of P.3 says what it assumes.
- The weight-four theorem is a published theorem whose proof is not planned here: it is the proposed Part II's.
- The exact weight-two Borel scalar, the weight-three and weight-n regulator-class scalars, and the normalisation adapter of P.3's configuration maps are not computed. No coefficient is inferred from a printed value that a part found wrong.
- The P.3 part's comparison theorems, descent of L_3 and special-value determinant have no Lean signatures yet; the elliptic Fourier formula and the comparison with Beilinson's regulator are targets with recorded analytic or model-conversion gaps, not completed comparisons.
- A numerical value of D is evidence only when it exceeds the certified error bound; it is never the definition of the regulator or a certificate for a Bloch element.
