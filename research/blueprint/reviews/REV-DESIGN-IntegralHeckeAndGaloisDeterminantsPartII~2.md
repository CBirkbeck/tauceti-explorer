# Independent review of revision 2: Integral Hecke actions, determinants and interpolation, Part II

Job `REV-DESIGN-IntegralHeckeAndGaloisDeterminantsPartII~2`, issue #8935. Reviewer: Codex, session `codex-M0AcPZ`, 14 October 2026. **Accepted.** This is a completed review, not a checkpoint. The reviewer authored neither design round and did not perform the preceding review.

All 43 target-level nodes were checked: 29 verified and 14 corrected, none added or unverifiable. The packet has 6 definitions, 10 constructions, 26 theorems and 1 comparison, 123 API items, 74 distinguishing tests and 25 planets. Each of the 16 definitions/constructions has at least three tests. All 23 baseline citations are confirmed, all 21 source issues have individual confirmed verdicts, and all 20 supplier requests have precise statements. The seven stages are planned, none closed; there are no mathematical gaps. Complete means a finished target-level planning pass, not formalisation or completion of the suppliers.

## Previous review obligations

The prior review's mathematical corrections survive the revision: arbitrary intermediate tame levels do not inherit a Weyl presentation, double-coset inverses descend without inverting the tame index, the Siegel inverse uses the two convolution volumes, the arithmetic normalization includes the common half-norm factor, the factorization algebra uses graded projectivity and the relative-differentials criterion, and the ordered resultant keeps the conjugate factor first. Compact gluing handles separately chosen nilpotent ideals without invented transition maps. Decomposedness concerns the parabolic intersection; determinant factor identification uses the full twisted Weil determinant. Faithful coefficient specializations and actual global refinements qualify the non-examples.

**G1 is resolved.** The revised auxiliary-character node now imports the accepted ArithmeticGaloisDuality R02.4 Grunwald–Wang node and supplies the deduction from Conrad, Appendix A, Definition A.1 and Proposition A.3, pp. 31–32. At a split place, a character restricted from G_{F⁺} has equal Frobenius values at v and v^c. Its square must avoid at most 4n² eigenvalue ratios, including both places above the same real-field place. Choose an odd prime r ≠ p larger than that bound. Squaring permutes μ_r, reduction preserves μ_r, and the dyadic special case cannot occur. Prescribing trivial local characters at every place above the first character's ramified rational primes makes the second ramification set disjoint. For the third character the prescription includes all places over the rational primes below R ∪ R^c ∪ S_p. The order divides r; if R is empty it can be 1. No Kummer-independence or Chebotarev-existence shortcut is needed.

**G2 is superseded by the binding shape rule in WORKERS.md dated 12 October.** The revision's 1,246-line sketch still developed local construction theory, including sorry-defined maps and equivalences. It is replaced by a 153-line statement sketch containing five light, real-bodied polynomial/matrix definitions, eleven end milestones and five examples. Heavy levels, embeddings, factorization algebras, representation categories and arithmetic determinants stay fully specified in the reader. Missing carriers are not replaced by proposition bundles. The sketch elaborates at the pins with only fourteen `declaration uses sorry` warnings; two examples are proved. No proof completion is claimed.

## Corrections in this review

1. **Unitary conjugation (IHR.3).** The old API incorrectly gave an unscaled reciprocal at σ^{−c}. Put d = 2n and h = ‖σ‖^{d−1}. The correct identity, after the coefficient identification, is P̃_{v^c,σ^{−c}}(X) = h^d P̃_{v,σ}(h^{-1}X). At σ^c it is h^{-d}(P̃_{v,σ})^∨(hX). The inverse-transpose projection reverses and inverts coordinates; the inverse Weil argument cancels inversion, while the common arithmetic normalization supplies h. The new proof uses normalized Bernstein roots, centrality and integral descent, rather than treating individual roots as symmetric. A normalized GL₂ principal series induced from two trivial characters has Frobenius roots q^{1/2}, and conjugate-inverse roots q^{-1/2}; general inducing roots distinguish scaling from reciprocation. At inertia h = 1.
2. **Rank-one levels (IHR.3).** The two conjugate Siegel parahorics differ for n ≥ 2. They agree for n = 1 since Iw₁ = GL₁(O). Their torus-entry-one kernels can differ when q > 2. The diagonal-torus non-product example also requires q > 2; for q = 2 the torus is trivial and is a product. Both degeneracies now have tests.
3. **Coefficient degeneracies (IHR.1/IHR.3/IHR.4).** Monicity holds over the zero coefficient ring, but natural degree n or 2n does not. Those degree claims now require Nontrivial O, and the root-polynomial test records the zero-ring counterexample. Resultant coefficient change uses explicit sizes (n,n), so it remains valid under maps to the zero ring. The earlier sentence that monicity alone preserves natural degree under every map was false. Coefficient APIs now give the ranges 0 ≤ i ≤ n or 0 ≤ k ≤ 2n and the factor-index bounds.
4. **Construction order.** The IHR.1 polynomial construction uses only the commutative torus image. Centrality is its later IHR.2 conclusion, removing a forward dependency. The unitary conjugation proof has an explicit IHR.2 centrality prerequisite. Compact-support compatibility uses the concrete good, decomposed unitary level and auxiliary odd-prime smallness; it does not import later residual-separation or weight-reduction assumptions. The decomposed-unitary-level construction likewise states its actual level hypotheses rather than citing the later reduction lemma.
5. **Interpolation (IHR.6).** A continuous discrete quotient in an initial topology need not factor through one classical space. Use finitely many spaces, their integral Hecke image and compact closure, then an open-ideal quotient. Glue the continuous classical determinants using common coefficients on every conjugate of an unramified Frobenius and the existing IHG.4 compact gluing theorem. Joint injectivity descends the local polynomial and trace relations. No discrete torsion quotient of a C-endomorphism algebra is used.
6. **Existing suppliers and scope.** The current compact gluing declaration is `Determinant.existsUnique_isCoefficientChange_of_compact`, not the stale `Theorems.compact_determinant_gluing`. Updated its request, added interpolation to its consumers and retained the existing owner. ET.6's classical correspondence supplies finite extensions of ℚ_ℓ; the local Langlands nodes and request now carry that scope. The local Hecke definitions retain arbitrary local characteristic. Added Conrad to the roadmap source catalog as well as the packet and reader.
7. **Source locators and records.** E1's v2 group-algebra-domain passage is on p. 28, not p. 29. The definition of rec^T invoked by E19 is on published p. 906, not p. 908. E17 now allows order dividing r and its fresh review verdict confirms the completed odd-order construction. Replaced all stale review objects and IHR.7 partial/gap notes, updated coverage to the compact sketch and brought the reader into agreement. Historical reports and the earlier erratum-search provenance are preserved; no new erratum search is claimed.

## Source evidence

Read the published [ACC23](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) at each node locator: §1.2, pp. 905–909; the decomposedness definition, p. 912; §2.1.9, pp. 913–916; §2.2.1, pp. 916–921; §2.2.5, pp. 921–931; duality and twisting, pp. 931–935; §2.3, pp. 935–941; Theorem 2.4.8, pp. 946–948; §3, pp. 953–964; and the downstream applications, pp. 1063 and 1067. Compared the relevant [arXiv v2](https://arxiv.org/abs/1812.09999v2) passages in §2.2.5, Theorem 2.3.3(c), p. 40, and §3; §2.2 statement numbers there are one lower. Both source versions' hashes agree with the packet provenance.

Checked [Flicker](https://jolt.centre-mersenne.org/item/10.5802/jolt.640.pdf), §2, Theorem 2.1/Corollary 2.2, pp. 471–474; §3, Theorem 3.1/Proposition 3.3/Corollary 3.4, pp. 475–479; and §4, Theorem 4.5/Proposition 4.11, pp. 479–488, including the coefficient and pro-ℓ-Iwahori restrictions. It is a complex-coefficient theorem; the integral intermediate-level proof is the packet's explicit extension, not an assertion of Flicker's scope. Checked [Thorne](https://arxiv.org/abs/2207.04925v1), §2, Lemma 2.1 and Propositions 2.2–2.3, pp. 4–6, and §3, Lemma 3.1, pp. 7–8. Checked [Conrad](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Appendix A, pp. 31–32, for the exact odd-order global character contract. All statements here and in the reader are in our own words; no source passage or extracted source file is stored in the repository.

### Source-issue ledger

Each entry is confirmed independently in print and at the corresponding v2 passage. E2 and E17 concern omitted justification; they do not make the underlying conclusions false. Existing searches remain dated historical provenance rather than exhaustive knowledge of author correspondence.

| Issue | Published locator | Checked correction |
|---|---|---|
| E1 | §2.2.5, p. 925 (also in arXiv v2, p. 28) | Group algebra O[Ξ], not just the group, is the algebra-map domain; v2 p. 28. |
| E2 | §2.2.5, pp. 924–926: the invertibility of [I_vgI_v] (citing [Fli11, Cor. 3.4]), the centrality of e_{v,i}(α) in Proposition 2.2.9(2) (citing [Fli11, Prop. 4.11]) and the commutation in Lemma 2.2.10 (citing [Fli11, Th. 4.5]) (also in arXiv v2) | Complex pro-ℓ-Iwahori citation needs the explicit integral intermediate-level descent. |
| E3 | §2.2.5, pp. 930–931, the sentence before (2.2.17) (also in arXiv v2) | A product Levi intersection requires a product torus subgroup; diagonal counterexample uses q>2. |
| E4 | §2.2.5, eq. (2.2.6), p. 922 (also in arXiv v2) | Restore the alternating sign in the unramified polynomial constant term. |
| E5 | §2.2.5, eq. (2.2.7), p. 922 (also in arXiv v2) | Restore the missing power of X in the general unitary unramified term. |
| E6 | §2.2.5, after (2.2.7) (p. 922), after (2.2.12) (p. 926) and Lemma 2.2.13(2) (p. 927) (also in arXiv v2) | The three degree-2n expansions use X^{2n−i}. |
| E7 | §2.2.5, Proposition 2.2.9(2), p. 925 (also in arXiv v2, Proposition 2.2.8(2)) | Centrality gives scalar coefficients, not nonzero coefficients; opposite roots give zero middle coefficient. |
| E8 | §2.2.5, eq. (2.2.12), p. 926 (also in arXiv v2, eq. (2.2.11)) | Conjugate-place coefficient has the conjugate subscript. |
| E9 | §2.2.5, proof of Proposition 2.2.14, pp. 928–929 (also in arXiv v2) | Segment roots retain the common rec^T factor and the correct Steinberg shift; do not count the segment shifts twice. |
| E10 | §3.2, proof of Lemma 3.2.1, pp. 955–956 (also in arXiv v2) | Pull back along T^{S_i}, not along an unbound T^{T_i}. |
| E11 | §3.2, proof of Lemma 3.2.1, last step, p. 957 (also in arXiv v2) | Conjugate the remaining compact levels into integral groups before the unitary-level recipe. |
| E12 | §3.2, Proposition 3.2.2(1)–(2), p. 958 (also in arXiv v2) | Use the introduced compact-support ideal subscript in both polynomial conditions. |
| E13 | §3.2, proof of Proposition 3.2.2, third bullet, p. 959 (also in arXiv v2) | The inertia condition is at R−R^c, where the resultant and Frobenius lift exist. |
| E14 | §3.2, proof of Proposition 3.2.2, p. 959 (also in arXiv v2) | Use the Siegel transfer lemma as well as the GL_{2n} tame proposition. |
| E15 | §3.2, proof of Corollary 3.2.3, p. 960 (also in arXiv v2) | Ordinary-cohomology determinant coefficients are modulo the nilpotent ideal. |
| E16 | §3.2, proof of Corollary 3.2.3, third bullet, p. 961 (also in arXiv v2) | Quantify the global element σ in the dual trace relation, or omit its invertible multiplier. |
| E17 | §3.2, proof of Lemma 3.2.1, p. 956 (also in arXiv v2) | Odd-order Grunwald–Wang closes the omitted global character construction; order divides r. |
| E18 | §3.2, the sentence after Proposition 3.2.2, p. 958 (also in arXiv v2) | R empty gives the compact-support analogue, not the ordinary-cohomology proposition itself. |
| E19 | §2.2.5, proof of Lemma 2.2.13, pp. 927–928 | Normalized inducing roots include |α|^{(1−2n)/2}; the definition is on p. 906. |
| E20 | §2.3, Theorem 2.3.3(c), p. 936 | Compose the unitary representation with ι_v^{-1}. |
| E21 | §3.2, proof of Proposition 3.1.2, p. 964, compared with §2.2.5, p. 928 | Keep the p. 928 ordered resultant; reverse order changes the odd-rank sign only. |

## Pinned baseline

Read every declaration's actual statement and enclosing hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No baseline citation was removed or replaced; no new baseline node was needed. The descriptions supply the cited obligations with the stated or weaker hypotheses. Natural-degree preservation now has its necessary nontriviality restriction; the fixed-size resultant map theorem is valid without it. Jordan–Chevalley is additive over a perfect field, and its nilpotent part commutes with the semisimple part. The étale-locus declaration uses formal étaleness of the prime localization; the factorization algebra's finite presentation makes this the geometric étale locus.

| Declaration | Module at the pin | Obligation |
|---|---|---|
| `mathlib:Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | GL n R is the unit group of Matrix n n R over a semiring (Defs.lean, line 43). Over a commutative ring this agrees with invertible matrices and unit determinant; no determinant is asserted for a general semiring. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | A discrete valuation ring: a local PID which is not a field (line 58); the ring O_{F_v} with uniformizer ϖ_v. |
| `mathlib:IsLocalRing.ResidueField` | `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean` | The residue field R/𝔪_R of a local ring (line 30); k(v), through which the Iwahori reduction maps are defined. |
| `mathlib:Matrix.BlockTriangular` | `Mathlib/LinearAlgebra/Matrix/Block.lean` | Block triangularity of a square matrix with respect to a block-index map (line 61); upper triangular and block upper triangular reductions defining Iw_v and 𝔭_v. |
| `mathlib:IsHeckeTriple` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | Hecke triple (H₁, Δ, H₂): both subgroups in Δ, commensurable, Δ in the commensurator (line 75); for a locally profinite group and a compact open subgroup with Δ = ⊤ this is the Hecke pair of a local Hecke algebra. |
| `mathlib:HeckeRing` | `Mathlib/NumberTheory/HeckeRing/Defs.lean` | The Hecke ring 𝕋 Δ H Z of finitely supported Z-linear combinations of double cosets H\Δ/H (line 189); the carrier of H(G, U) ⊗ R. |
| `tauceti:HeckeCosetModule.instRingHeckeRing` | `TauCeti/NumberTheory/HeckeRing/Associativity.lean` | The ring structure (associative convolution by multiplicities) on 𝕋 Δ H R' for a Hecke triple and any ring R' (line 485), proved in full; the multiplication of double cosets used for [UgU]. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The monoid algebra R[M] with convolution product (line 76); the tame torus algebra O[Ξ_v], the domain of t. |
| `mathlib:Multiset.esymm` | `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean` | The n-th elementary symmetric function of a multiset (line 70); the coefficients e_{v,i}(α). |
| `mathlib:Multiset.prod_X_sub_X_eq_sum_esymm` | `Mathlib/RingTheory/Polynomial/Vieta.lean` | Vieta: ∏_{t ∈ s}(X − C t) = Σ_j (−1)^j C(esymm s j) X^{card s − j} over a commutative ring (line 87); identifies the two expressions of P_{v,σ}(X). |
| `mathlib:Polynomial.Monic` | `Mathlib/Algebra/Polynomial/Degree/Defs.lean` | A polynomial is monic if its leading coefficient is 1 (line 60). |
| `mathlib:Polynomial.resultant` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | The resultant of two polynomials over a commutative ring, the determinant of their Sylvester matrix, with size arguments defaulting to the natural degrees (line 134); Res_v and Thorne's Res_{n1,n2}. |
| `mathlib:Polynomial.resultant_map_map` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | resultant (f.map φ) (g.map φ) m n = φ (resultant f g m n) for a ring homomorphism φ (line 140); behaviour of Res_v under 𝒮 and under specialization. The explicit degrees m,n stay fixed; default natural degrees may be substituted only when preserved (as for the monic factors here). |
| `mathlib:Polynomial.isUnit_resultant_iff_isCoprime` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | For monic f, the resultant of f and g is a unit iff f and g are coprime (line 885); the unit criterion for Res_v and 𝒮(Res_v). |
| `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | Bézout identity f·p + g·q = C(resultant f g) with deg p < n, deg q < m (line 874). Requires natDegree bounds by m,n and m≠0 or n≠0; the degree-zero case is separate. |
| `mathlib:Polynomial.resultant_eq_prod_roots_sub` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | For monic split f, g over a field, resultant f g = ∏ (α − β) over the roots (line 405); the classical-point values of Res_v. |
| `mathlib:Module.End.exists_isNilpotent_isSemisimple` | `Mathlib/LinearAlgebra/JordanChevalley.lean` | Jordan–Chevalley–Dunford decomposition f = n + s over a perfect field, n nilpotent, s semisimple, both polynomials in f (line 76); the decomposition ρ(φ_v) = su in Corollary 2.2.15. The cited result is additive, with finite-dimensionality and a perfect base field. For invertible f derive the multiplicative decomposition from the additive one; it does not state that decomposition directly. |
| `mathlib:NumberField.IsCMField` | `Mathlib/NumberTheory/NumberField/CMField.lean` | A CM field: totally complex quadratic extension of its maximal real subfield (line 71); the base field F. |
| `mathlib:Polynomial.reverse` | `Mathlib/Algebra/Polynomial/Reverse.lean` | The reverse X^{natDegree f}f(1/X) of a polynomial (line 217); with the inverse of the constant term it gives ACC+'s f^∨. |
| `mathlib:Matrix.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` | Cayley–Hamilton: aeval M M.charpoly = 0 for a square matrix over any commutative ring (line 216); P_{v,φ_v}(ρ_𝔪(φ_v)) = 0. |
| `mathlib:Ring.ordFrac` | `Mathlib/RingTheory/OrderOfVanishing/Basic.lean` | Order of vanishing on the fraction field as K →*₀ Multiplicative ℤ with zero (line 324), for a one-dimensional Noetherian domain; the DVR instances provide these hypotheses. Restricting to units gives valuationZ in the prototype. |
| `tauceti:TauCeti.normalizedValuation` | `TauCeti/NumberTheory/LocalField/NormalizedValuation.lean` | The normalized map Kˣ →* Multiplicative ℤ for a field with ValuativeRel, a topology and IsNonarchimedeanLocalField (line 101); uniformizers have additive value 1. It already exists and is not a new Part II definition. The generic DVR prototype wraps Ring.ordFrac instead. |
| `mathlib:Algebra.etaleLocus` | `Mathlib/RingTheory/Etale/Locus.lean` | The set of primes q of an R-algebra A at which A is étale over R (A_q formally étale over R); used to state the étaleness of the factorization algebra exactly away from the resultant. |

## Ownership, suppliers and granularity

Read the reviewed library audit for the adjacent determinant, arithmetic-duality, locally symmetric and automorphic directions. Nothing in that audit supplies the ramified Part II endpoints. Existing generic convolution, normalized valuation, polynomial/resultant and étale machinery are imported, not planned again. Screened the nine newer current upstream roadmaps, including OperatorTheory's nested sketches, and the current Tau Ceti library for these targets. No competing implementation of the proposed ramified operators, Siegel transfer or character-prescription theorem was found by that screen. This is a scope screen, not a claim that every current library declaration was re-reviewed.

The current upstream check used TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the relevant IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups, ClassFieldTheory and Chebotarev contracts. Current ClassFieldTheory layers 7 and 9 provide the arithmetic/geometric dictionary and topological Weil abelianization for finite ℚ_ℓ extensions, but explicitly exclude Grunwald–Wang; ArithmeticGaloisDuality is its existing accepted owner. Current IHG.4 already supplies compact gluing. Current IHG.2's filtered-module square-zero result does not itself supply the derived exact-triangle statement; that extension remains a precise request to its owner. The determinant-factor Hensel statement and powered unramified Weil polynomials likewise remain specific extensions of existing owners.

All twenty requests were checked against their suppliers' actual scope. They are planning inputs, not claims of existing implementation:

| Supplier | Exact needed scope and ownership finding |
|---|---|
| SR.1 | Integral positive Hecke maps, localization by a strongly positive element and simple invariant corners; ALS.4 owns the preceding Satake maps. |
| SR.2 | Normalized Jacquet/induction, geometric lemma and Bushnell–Kutzko invariant comparison. |
| SR.3 | Admissibility, supercuspidal-support embedding and finite-free universal unramified twists. |
| ET.6 | Full classical GL_m Weil–Deligne correspondence including N, arithmetic normalization and segment shifts, over finite ℚ_ℓ extensions. |
| TC.3 | The unitary Siegel datum and unramified Levi Satake identity. |
| TC.2 | Scholze comparison equivariant for the full prime-to-p Hecke algebra and its classical systems. |
| TC.4 | ACC23 Theorems 2.3.5 and 2.3.7; nearest owner, with the proposed TC.5 extension explicitly recorded. |
| AG2.2 | Cuspidal cohomological unitary Galois representations and the dual cyclotomic twist. |
| AG2.5 | Full local compatibility at primes split in an imaginary quadratic subfield; that subfield may vary with the place. |
| IHG.3 | General unramified Weil-element polynomials, including negative Frobenius powers. |
| IHG.1 | Determinant factor uniqueness and kernel intersection with residually disjoint constituents, ACC23 Lemma 3.2.4. |
| IHG.2 | Square-zero quotient for Hecke images of a derived exact triangle, extending the existing image machinery. |
| IHG.4 | Reuse `Determinant.existsUnique_isCoefficientChange_of_compact`, including conjugacy-dense Frobenius coefficients. |
| ALS.5 | Finite-level duality for every needed prime-to-p Hecke correspondence at R, not only spherical operators. |
| ClassFieldTheory 7 | Local Artin map and geometric normalization. |
| ClassFieldTheory 9 | Topological Weil abelianization for finite ℚ_ℓ extensions. |
| ClassFieldTheory 11 | Global reciprocity and compatibility with the local maps. |
| ClassFieldTheory 12 | Global existence/norm-index carrier used with global characters. |
| Chebotarev 10 | Density and determinant uniqueness; no character-prescription existence is inferred. |
| ArithmeticGaloisDuality R02.4 | Accepted Grunwald–Wang node, used only in its unobstructed odd-order case. |

The target-level budget in detail.json is respected. Each needed definition or key theorem has a node; graded-projectivity, root bookkeeping, nilpotence and coefficient gluing steps stay in the proof outlines. Definition APIs support construction, characterization, functoriality and the actual uses without unfolding. Tests include residue-two, rank-one, zero-ring, sign, normalization, non-Weyl-stable and semilocal cases. The 25 planets are the central definitions, constructions and named compatibility theorems; no proof-step planet was added.

### Node ledger

The full node ids have prefix `IntegralHeckeAndGaloisDeterminantsPartII:`. A verified entry includes its hypotheses, source match, closure and precise supplier imports, and its API/tests and planet where applicable. A corrected entry records this review's in-place correction; inherited corrections remain verified against their sources. The packet's machine-readable checked ledger is identical to this inventory.

| Node | Verdict | Evidence / correction |
|---|---|---|
| `IHR.1/tame-iwahori-level` | verified | ACC23 §2.2.5, p. 922 (Iw_v(b, c), Iw_v = Iw_v(0, 1), Iw_{v,1} = Iw_v(1, 1)) and p. 924 (I_v with Iw_v(1, 1) ⊂ I_v ⊂ Iw_v(0, 1) has an Iwahori decomposition with respect to B_n); ACC23 §3.1, p. 954 |
| `IHR.1/tame-torus-quotient` | verified | ACC23 §2.2.5, p. 924; ACC23 §2.1.9, pp. 913–914 |
| `IHR.1/tame-double-coset-invertible` | verified | ACC23 §2.2.5, p. 924; Fli11 Theorem 3.1, Corollary 3.2, Proposition 3.3 and Corollary 3.4, pp. 475–479 |
| `IHR.1/tame-torus-embedding` | verified | ACC23 §2.2.5, pp. 924–925; ACC23 §2.1.9, Lemmas 2.1.12–2.1.13, pp. 914–915 |
| `IHR.1/tame-hecke-operators` | verified | ACC23 §2.2.5, p. 925; ACC23 §1.2, p. 906; ACC23 §6.5, p. 1067 |
| `IHR.1/ramified-hecke-polynomial` | corrected | Removed a forward use of IHR.2 centrality and qualified natural degree by nontrivial coefficients; the zero-ring test detects the missing hypothesis. |
| `IHR.2/tame-principal-series-criterion` | verified | ACC23 §2.2.5, Proposition 2.2.9(1) and its proof, p. 925; Fli11 §2, Theorem 2.1 and Corollary 2.2, pp. 471–472; Corollary 3.4, p. 479 |
| `IHR.2/tame-hecke-centre` | verified | ACC23 §2.2.5, Proposition 2.2.9(2) and its proof, p. 925; Fli11 §4, Theorem 4.5, pp. 482–483, and Proposition 4.11, p. 487 |
| `IHR.2/tame-local-langlands-charpoly` | corrected | Matched local Langlands scope to the finite-ℚ_ℓ supplier; checked the published identity and its normalization, proof and acceptance examples. |
| `IHR.2/spherical-specialization` | corrected | Matched local Langlands scope to the finite-ℚ_ℓ supplier; checked the published identity and its normalization, proof and acceptance examples. |
| `IHR.3/siegel-parahoric-level` | corrected | Corrected the conjugate-place non-example to n ≥ 2 and added the rank-one equality, with distinct kernels only when q_v > 2. |
| `IHR.3/unitary-tame-level` | corrected | Required q_v > 2 for the diagonal torus non-product test; for q_v = 2 it is a product. |
| `IHR.3/siegel-strongly-positive-invertible` | verified | ACC23 §2.2.5, Lemma 2.2.10 and its proof, p. 926; ACC23 §2.2.5, p. 931; Fli11 Corollary 3.4, p. 479; Theorem 4.5, pp. 482–483; Tho22 §3, Lemma 3.1, pp. 7–8 |
| `IHR.3/siegel-transfer-operators` | corrected | Qualified natural-degree claims by Nontrivial O; verified both transferred normalization factors and all coefficient APIs. |
| `IHR.3/unitary-tame-hecke-polynomial` | corrected | Replaced the false unscaled reciprocal at σ^{−c} by the norm-scaled identity, gave its Bernstein-root proof, added centrality as an input and a normalized GL₂ test. |
| `IHR.3/siegel-transfer-local-langlands` | corrected | Matched local Langlands scope to the finite-ℚ_ℓ supplier; checked the published identity and its normalization, proof and acceptance examples. |
| `IHR.3/satake-transform-tame-level` | verified | ACC23 §2.2.5, Proposition 2.2.18 and its proof, p. 931 |
| `IHR.3/satake-transform-siegel-level` | verified | ACC23 §2.2.5, Proposition 2.2.19, p. 931 |
| `IHR.4/siegel-resultant` | corrected | Made Sylvester sizes explicit for arbitrary coefficient change; monicity preserves natural degree only over nontrivial coefficient rings. |
| `IHR.4/factorization-etale` | verified | Tho22 §2, Lemma 2.1 and Propositions 2.2–2.3, pp. 4–6; ACC23 §2.2.5, proof of Proposition 2.2.14, p. 929 |
| `IHR.4/resultant-kills-inertia` | corrected | Matched local Langlands scope to the finite-ℚ_ℓ supplier; checked the published identity and its normalization, proof and acceptance examples. |
| `IHR.4/resultant-inertia-galois` | corrected | Matched local Langlands scope to the finite-ℚ_ℓ supplier; checked the published identity and its normalization, proof and acceptance examples. |
| `IHR.5/ramified-hecke-algebra` | verified | ACC23 §3.1, pp. 953–954; ACC23 §2.2.1, pp. 919–920; ACC23 §3.2, proof of Proposition 3.1.2, p. 963 |
| `IHR.5/unitary-ramified-hecke-algebra` | verified | ACC23 §2.4.1, statement of Theorem 2.4.8, pp. 946–947; ACC23 §3.2, pp. 957–958 |
| `IHR.5/ramified-satake-homomorphism` | verified | ACC23 §2.4.1, Theorem 2.4.8 and its proof, pp. 946–948; ACC23 §2.2.5, Propositions 2.2.16, 2.2.18 and 2.2.19, pp. 930–931; ACC23 §3.2, proof of Proposition 3.1.2, p. 964 |
| `IHR.5/ramified-twisting` | verified | ACC23 §2.2.20, the definition of f_ψ, Proposition 2.2.23 and Corollary 2.2.24, pp. 933–935; ACC23 §3.2, proof of Lemma 3.2.1, p. 956 |
| `IHR.5/ramified-hecke-duality` | verified | ACC23 §2.2.20, Proposition 2.2.21 and Corollary 2.2.22, pp. 932–933; ACC23 §3.2, proof of Corollary 3.2.3, pp. 960–961 |
| `IHR.5/ramified-level-change` | verified | ACC23 §2.2.1, Lemma 2.2.4 and the paragraph after it, pp. 920–921; ACC23 §3.2, proof of Lemma 3.2.1, pp. 955–957 |
| `IHR.6/classical-point-compatibility` | verified | ACC23 §3.2, proof of Proposition 3.2.2, p. 959; ACC23 §2.3.1, Theorem 2.3.3, pp. 935–936 |
| `IHR.6/dual-classical-point-compatibility` | verified | ACC23 §3.2, proof of Corollary 3.2.3, pp. 960–961 |
| `IHR.6/ramified-interpolation` | corrected | Repaired the initial-topology argument using a finite family of classical spaces, a compact integral image and an open-ideal quotient; one C-endomorphism algebra does not supply a discrete torsion quotient. |
| `IHR.6/compact-support-compatibility` | corrected | Removed the forward reference to the five GL_n descent reductions; only the concrete good unitary level and auxiliary odd-prime smallness are used. Verified compact gluing without transition maps. |
| `IHR.6/cohomology-compatibility` | verified | ACC23 §3.2, proof of Corollary 3.2.3, pp. 960–961 |
| `IHR.6/boundary-compatibility` | verified | ACC23 §3.2, Corollary 3.2.3 and its proof, pp. 959–961 |
| `IHR.7/ramified-local-determinant` | verified | ACC23 §3.2, proof of Proposition 3.1.2, p. 963 |
| `IHR.7/auxiliary-characters` | verified | ACC23 §3.2, proof of Lemma 3.2.1, p. 956; Con11 Appendix A, Definition A.1 and Proposition A.3, pp. 31–32 |
| `IHR.7/decomposed-unitary-level` | corrected | Replaced a forward reference to small-level-reduction by the actual level hypotheses; verified decomposedness only for K̃ ∩ P and the integral conjugation step. |
| `IHR.7/small-level-reduction` | verified | ACC23 §3.2, Lemma 3.2.1 and its proof, pp. 955–957 |
| `IHR.7/boundary-determinant` | verified | ACC23 §3.2, proof of Proposition 3.1.2, pp. 962–963 |
| `IHR.7/determinant-restriction-at-R` | verified | ACC23 §3.2, proof of Proposition 3.1.2, pp. 963–964; ACC23 §3.2, Lemma 3.2.4 and its proof, pp. 961–962 |
| `IHR.7/unramified-at-conjugate` | verified | ACC23 §3.2, proof of Proposition 3.1.2, p. 964 |
| `IHR.7/determinant-local-global` | verified | ACC23 §3.1, Proposition 3.1.2, p. 954; ACC23 §3.2, pp. 955–964 |
| `IHR.7/local-global-away-from-p` | verified | ACC23 §3.1, Theorem 3.1.1, p. 954; ACC23 §3.1, p. 955; ACC23 §6.5, pp. 1063 and 1067 |

## Questions for the orchestrator and package handoff

These are integration actions, not mathematical gaps or reasons to reject this finished plan. No other roadmap was edited.

1. Assign the new Part II its upstream tier/bundle before packaging. If PA.0 retains Theorem 2.4.8, it needs IHR.1/IHR.3/IHR.5's operators and Hecke algebras, and IHR.7 then consumes PA.0. The stage graph is acyclic, but the packages need a bundle or a downward ownership move. The packet records both options; a package must resolve its higher-tier citations rather than copy them blindly. No current upstream target has been replanned.
2. Point PA.3/PA.4's torsion deformation–Hecke applications at IHR.7/Theorem 3.1.1 instead of characteristic-zero AG2.5, and point their tame character normalization at IHR.1.
3. If the proposed smooth-representation Part II later owns a general split-group tame Bernstein embedding, retain the local GL_n normalization here and import that general construction from its lower owner. Do not duplicate this embedding while waiting for that design.
4. Keep the exact twenty requests during packaging, especially TC.2's full Hecke scope, TC.4's nearest-owner extension, ALS.5's ramified duality and IHG.2's derived triangle. Package prerequisites must be existing upstream roadmaps or the settled lower-tier/bundle owners. This review does not turn requests into established theorems.

## Validation

- Packet check: `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralHeckeAndGaloisDeterminantsPartII.json` — 0 errors, 0 warnings; 43 nodes, 123 API items, 74 tests, 25 planets, 23 baseline declarations, 20 requests and 7 planned stages.
- `lean-check research/blueprint/suggested/IntegralHeckeAndGaloisDeterminantsPartII.lean` — exit 0 at the pins, only fourteen `declaration uses sorry` warnings. Five real-bodied definitions, eleven milestone theorems and five examples; 153 lines. No data definition depends on a sorry.
- Reader/packet inventory and content check, JSON parsing, distinct complete 43-node review ledger, per-definition test counts, no excerpt fields, statement-only Lean shape, and `git diff --check` — passed.

The next job is packaging this accepted plan after its upstream ownership/order is settled. No review work remains.
