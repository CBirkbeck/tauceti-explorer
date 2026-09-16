# LINK-tauceti_TauCetiRoadmap_ModularCurves: handoff

**Status:** `complete`. The whole catalogue has been screened. `python3 scripts/check_links.py` reports 0 errors and 0 warnings.
**Output:** `research/blueprint/links/tauceti_TauCetiRoadmap_ModularCurves.json`, with 46 links (42 explicit, 4 inferred), 19 overlaps and 213 examined entries.
No Lean code, packet, queue or ledger file was touched, and git was not run. There was no earlier checkpoint for this job.

## Inputs

- Atlas: `data/atlas.json`, edition `2026-09-15-comprehensive-roadmap-revision`. Its sha256 is recorded in the packet's `provenance`.
- Focal document: sha256 `18da17ea…2e2e6`, repository snapshot `faa5423b…`.
- The atlas has no `stageEdges` or `edges` for the focal roadmap. Its three `roadmapLinks` point to JacobianChallenge and AlgebraicCurves and are marked "reference".
- New roadmaps: `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`.
- Other link packets: AdicSpaces, OrthogonalL2Bases, SpinRepresentations, StablePeriodicCurved, StandardDistributions, UniversalCovers and ZigzagPreprojective. None records a link or overlap touching Modular Curves, so there are no duplicates.
- Campaign roadmaps call the focal roadmap **"#81"** or **"PR81"**. ShimuraVarieties calls it "the existing Katz–Mazur roadmap". The atlas `external` registry has entries "UPSTREAM:ModularCurves (PR81)" and "(open PR81)".

## Read scope

- **Focal roadmap.** The full 2,550-line document and all 58 stage descriptions were read. The inputs and outputs of each stage are in the scratch notes; a condensed version is below.
- **Read in full, or every stage:** JacobianChallenge; ModularCurvesPartII; AbelianSchemesAndArithmeticModuli; AlgebraicModuliForArithmeticGeometry; ArithmeticGaloisRepresentations; EllipticCurveModularity; FiniteFlatGroupsAndIntegralPadicHodgeTheory; PELModuli; ShimuraCompactifications; KatoEulerSystems; ComplexComparisonPartII (C0–C6); SchemeAndStackFoundations.
- **Targeted full-stage reads:**
  - EllipticCurves: Layers 0–5 in full, plus ordering and provenance.
  - AlgebraicCurves: scope, Layers 7–12, contracts and coordination.
  - ShimuraVarieties: V0, V1 and V8.
  - PerfectoidShimuraVarieties: S1–S6.
  - HeegnerPointEulerSystems: HE.0–HE.2.
  - GrossZagier: GZ.3, GZ.6 and GZ.7.
  - MordellLawrenceVenkatesh: LV.2 and LV.5.
  - ReductiveGroups: Layers 0, 3 and 4.
  - ModularForms: scope and Layer 10.
  - StableReduction: all stages, by keyword context.
  - InverseGalois IG.0; DeformationAndDerivedPatchingAlgebra R03.1–R03.3.
  - EllipticKTheory E.1; EllipticRegulators ER.7; CM.1; AutomorphicBundles B4.
  - AlgebraicModularForms R15.1–R15.3; PadicFamilies L0 and L0a; IntegralIwasawaTheory I.5.
  - FoundationsAndLibraryIntegration LI.4; ClassicalAdicEtaleCohomology H1:henselian.
- **Screened only.** Every other roadmap had its summary read and its stage texts grepped for the focal roadmap's objects. The terms covered modular curves, X₀/Y₀/X₁/Y₁, Γ₀/Γ₁, level structures, Drinfeld bases, group schemes, Cartier duality, Weil pairing, p-divisible groups, Serre–Tate, formal groups, supersingular, Tate curve, cusps, the j-line, coarse moduli, rigidifiers, Legendre, Atkin–Lehner, the Shimura covering, the Eisenstein ideal, Grassmannians, Weil restriction, fppf descent, invariant rings, normalisation, miracle flatness, strict henselisation, Riemann–Hurwitz, differents, Galois sets and Katz–Mazur. All matches were inspected in context. In each `examined` note, "none" means no edge was found within that read scope.

## Focal stages: inputs and outputs (condensed)

- **0A–0G.** Relative effective Cartier divisors. Finite locally free commutative group schemes, fppf quotients and Cartier duality over any base. Affine, torsor and equivalence-relation quotients. Finite étale schemes over a field ≃ Galois sets. Effective descent and spreading out. Hom-schemes via Weil restriction. The relative Grassmannian and the parameter scheme of subgroup schemes.
- **1A–1E.** projModel W over any ring. The points dictionary. Pole sheaves π_*𝒪(n[0]), the variable-change classification and the Weierstrass-presentation theorem. The scheme group law and EllipticCurve S. The cubic polarisation and elliptic descent.
- **2A–2F.** Hom_S and [N]. The narrow function-field bridge for deg [N] = N² (consumes EllipticCurves). E[N] of rank N², étale where N is invertible. Isogenies, quotients E/C and ω_G ≅ π^*e^*ω. The factorisation dual. Relative Pic⁰, the Poincaré bundle, λ_E and KM 2.5.1. Cartier–Nishi duality and a perfect alternating e_N, normalised against the EllipticCurves pairing. Degree/trace identities and naive rigidity.
- **3N, 3A–3D.** Naive and Drinfeld level structures, A-generators, exact order, cyclic subgroups, the four problems, and the naive/Drinfeld comparison.
- **4A–4D.** Ell/R moduli problems. The Weierstrass presentation. Rigidifiers, the Legendre problem over ℤ[1/2] and KM 4.7.0. KM 4.12 regularity, with a general local-algebra API (strict henselisation, miracle flatness, openness of the regular locus).
- **5A–5C.** Y₁(N) for N ≥ 4. Y_full(N), det_N = e_N, and Y(N,ζ). Y(ρ) over ℚ, whose geometric irreducibility is conditional on an external connectedness contract.
- **6–8.** Representability of the elementary problems and the projective [N-Isog]. Chapter 5: Reg. 1–4, formal groups, universal deformations, the short p-divisible-group list, Serre–Tate with level, Rigid I–III, and the First Main Theorem for three problems. Chapter 6: finiteness of [N-Isog], generator schemes, the Axiomatic Isomorphism Theorem, the §6.3 rings, and [Γ₀(N)].
- **9A–9E.** KM quotient problems, the seven identifications of 7.4.2, and quotient regularity (7.5–7.6). Coarse M(𝒫) via Galois rigidifiers. The coarse j-line over ℤ and over any ring, and Y₀(N) ≅ Y_full(N)/B.
- **Layer 10.** For N ≥ 5 prime and H ≤ (ℤ/N)ˣ/±1: X_H as the normalisation of ℙ¹_j over ℤ[1/N], geometric-fibre base change, Cusps_H and the formal-cusp package, w_N, the ramification table of X₁(N) → X₀(N) (using AlgebraicCurves L7–L9 and L12, JacobianChallenge's χ constancy, and EllipticCurves' Aut(E)), and the étale Shimura covering.

## Links

### Into Modular Curves (14, all explicit; the focal text names each supplier)

| Supplier | Consumer | Content |
|---|---|---|
| JacobianChallenge A | 0A, 2D | invertible sheaves, Cartier ≃ line bundles |
| JacobianChallenge B | 1C | fibrewise Riemann–Roch and Serre duality |
| JacobianChallenge C | 0A, 1C, 2D, Layer 10 | relative effective Cartier divisors; Grauert and cohomology and base change; χ constancy |
| EllipticCurves L1 | 2A, Layer 10 | deg [n] = n²; the Aut(E,O) carrier |
| EllipticCurves L2 | 2E | equation-level Weil pairing (normalisation) |
| AlgebraicCurves L7, L8, L9, L12 | Layer 10 | Hurwitz and different; Hilbert's formula; Kähler/Weil comparison; function-field ↔ curve dictionary |

### Out of Modular Curves (32: 28 explicit, 4 inferred)

- **ModularCurvesPartII (13):**
  - 5B, 5A, 9E → R12.2
  - 2E → R12.1
  - 5C, 5B → R12.4
  - Layer 10 → R12.3
  - Layer 10, 9D → R13.4a
  - Layer 6, 8D → R13.2
  - 1D → R13.1
  - 9B → R14.1
- **AbelianSchemesAndArithmeticModuli (5):** 1C and 1D → A1; 2D → A2; 1D and 2E → A5.
- **ShimuraVarieties (3):** 5B, 5A, 9E → V8.
- **One link each:**
  - 0C → AlgebraicModuli R09.3
  - 2B → ArithmeticGaloisRepresentations R01.6
  - 1B → EllipticCurveModularity R29.6
  - 2A → FiniteFlatGroups R07.5
  - 5B → PELModuli M5
  - 5B → PerfectoidShimuraVarieties S5
  - Layer 10 → ShimuraCompactifications C6
- **Inferred (4):**
  - 9E → HeegnerPointEulerSystems HE.1: CM cyclic-isogeny pairs as points of Y₀(N).
  - 5B → KatoEulerSystems L0: Siegel units on the integral affine curve. This is the weakest link. Kato's Y(M,N) and Y₁(N) levels must be matched to 5B and 5A.
  - 4C → MordellLawrenceVenkatesh LV.2 and LV.5: the Legendre family over ℤ[1/2][t, 1/(t(1−t))].

## Overlaps and restructuring proposals

No **merge** is recommended. Each item below is a **rescope** of one stage (not of whole roadmaps) unless it says keep.

1. **JacobianChallenge D ↔ 2D.** State the Picard functor, its rigidified form and Pic⁰ once over an arbitrary base S. 2D keeps representability by E and λ_E. JC's genus-one check becomes λ_E with S = Spec k.
2. **EllipticCurves L1/L3 ↔ 7E. Keep.** Supersingular and ordinary, and Frobenius/Verschiebung, are defined twice (scheme-level and equation-level). Add comparison lemmas in 7E.
3. **EllipticCurves L1 ↔ 7C.** Identify 7C's formal group in the Weierstrass parameter with EC's Ê. Take 8C's [a](X) from EC.
4. **EllipticCurves L4 ↔ Layer 10.** EC exports the Weierstrass curve E_q over ℤ⟦q⟧ (a₄, a₆, Δ(q), j(q)) as its own milestone. Layer 10 base-changes it to ℤ[1/N]((q)). The uniformisation stays in EC.
5. **AlgebraicCurves L12 ↔ 2A. Keep.** Add a compatibility lemma once 12C lands.
6. **ModularCurvesPartII R13.3 ↔ Layer 10.** R13.3 imports the formal-cusp package on the prime diamond class and extends it to generalised elliptic curves and other levels.
7. **AbelianSchemes A3 ↔ 2A/2B/2E. Keep.** Add genus-one comparison lemmas for E/C, the rank of [n] and the Weil pairing.
8. **AbelianSchemes A4 ↔ 7F (Serre–Tate).** Split A4 into an early part (Katz's Theorem 1.2.1 for abelian schemes) and a later part (added structures and Grothendieck–Messing). 7F's ST-1 specialises the early part; ST-2 to ST-5 stay in 7F.
9. **AlgebraicModuli R09.1/R09.3 ↔ 0F/0G.** AM imports 0G's relative Grassmannian and 0F's affine Weil restriction, as its own "reassign any item already claimed by a live supplier" rule requires.
10. **AlgebraicModuli R09.3, SchemeAndStack SF.1, StableReduction L2 ↔ 0E (polarised effective descent).** Prove one theorem for fpqc descent of projective schemes with a descended ample sheaf. Its home should be SF.1. Until then 0E is the live supplier: generalise its polarised case beyond relative curves.
11. **AlgebraicModuli R09.5 ↔ 9D.** The general coarse-space theorem must recover 9D's M(𝒫) on elliptic problems. The coarse j-line check should use 9E.
12. **AlgebraicModuli R09.6 ↔ 7B/7D. Keep.** Use 7B/7D as R09.6's elliptic acceptance test.
13. **FiniteFlatGroups R07.1 ↔ 0B/0C.** FFG's document claims to be "the sole owner of … Cartier duality", which conflicts with 0B's base-general Cartier duality. Proposal: 0B/0C own the category, kernels, quotients and duality over any base. FFG owns connected–étale sequences, fibres, closures, Raynaud's theorem and p-divisible groups over local bases.
14. **FiniteFlatGroups R07.1/R07.2 ↔ 7E.** FFG's p-divisible groups must be compatible with PD-1 and generalise PD-2. Its Dieudonné ordinary/supersingular cases must agree with PD-5. 7E keeps its KM-scoped list.
15. **ReductiveGroups L0/L3/L4 ↔ 0B.** Mathlib's `Group/Affine.lean` has already landed, according to MC; RG's inventory still says it is not in master. Build D_S(M), μ_N and kernels and quotients once over S. RG's "develop separately" Cartier duality is 0B's.
16. **EllipticKTheory E.1 ↔ 1A/1B/1D/2A.** E.1 rebuilds the scheme model over a field. It should import these stages and add only what is new; the comparison for arbitrary isogenies comes from AlgebraicCurves 12C.
17. **InverseGalois IG.0 ↔ 0D.** IG.0 owns the general Galois category. Its Spec K acceptance test reuses 0D.
18. **DeformationAndDerivedPatchingAlgebra R03.1 ↔ 7D.** Use one coefficient category, C_{W(k)}.
19. **ModularForms L10 ↔ Layer 10. Keep.** Share one combinatorial lemma counting cusps and elliptic points for Γ_H.

## Boundary gaps and text maintenance (not links)

- **The 5C connectedness contract now has owners.** 5C says "No roadmap in this repository owns these statements". ComplexComparisonPartII C4 now exports statement (iii) "as required by PR81 §5C", and ModularCurvesPartII R12.4 discharges all three statements. I did not add a link, because 5C keeps connectedness as a hypothesis and no focal stage consumes it. The focal text could name these owners while keeping the hypothesis visible.
- **The §Mazur interface's future owners, checked against the atlas:**
  - Deligne–Rapoport and semistable geometry: ModularCurvesPartII R13.1–R13.6.
  - J₀(N) and its Néron model: NeronModelsAndSemistableAbelianVarieties together with ModularCurvesPartII R14.2.
  - Hecke algebra on J₀(N), Eisenstein ideal, and the cuspidal and Shimura subgroups: **no owner**. AutomorphicCongruences treats U(3,1) and IntegralIwasawaTheory treats Hilbert modular forms; neither covers Mazur.
  - Admissible group schemes over ℤ (Mazur I §1(f)): **no owner**; FiniteFlatGroups does not cover them.
  - Regular differentials and relative duality for Cohen–Macaulay curves: no explicit owner found.
- **A missing statement for Layer 10 item 3.** It needs Aut(E,O) = {±1} for j ≠ 0, 1728, which is stated in EllipticCurves Layer 5. Neither text names this use, so I recorded no link. It also needs the classification away from characteristics 2 and 3 (orders 4 and 6), which 9E has only as a worked example. Layer 10 should either name EC Layer 5 or make that classification a milestone.
- **AlgebraicCurves' contract table** lists only CurvesOverFiniteFields, BelyiMaps and EllipticCurves as consumers of Layers 6–10. Modular Curves Layer 10 should be added for Layers 7–9 and 12.
- **Modular degree and Manin constant.** EllipticCurves Layer 8 assigns them to "a modular-curves roadmap". Modular Curves does not own them; GrossZagier GZ.3 constructs them.
- **FoundationsAndLibraryIntegration LI.4** integrates EllipticCurves and ModularForms but not ModularCurves, although the atlas `external` registry assigns UPSTREAM:ModularCurves (PR81) to LI.4.
- **ModularCurvesPartII R13.4a** proves agreement with Layer 10 "by normalization uniqueness". Layer 10 warns that the universal property alone does not suffice, and the link reason records the three conditions required.
- **No FLT 3–5 switch roadmap** (the named consumer of Y(ρ)) exists in the atlas.

## Candidates considered and rejected

- **9E → AlgebraicModuli R09.5.** The only use is in AM's document-level examples, not in a stage; it is folded into overlap 11.
- **7E → AlgebraicModularForms R15.3.** The Hasse invariant and Frobenius/Verschiebung there need generalised elliptic curves at the cusps, which 7E does not supply.
- **1D → ComplexMultiplication CM.1.** "The existing elliptic scheme" is ambiguous between Modular Curves and EllipticKTheory E.1.
- **4C/9B → PadicFamilies L0.** "Integral level structures and diamond actions" there is not an exact match.
- **Hodge line → AutomorphicBundles B4.** The GL₂ Hodge line comes via Shimura varieties; no exact match.
- **ComplexComparisonPartII C4 → 5C.** Explained above: 5C keeps connectedness as a hypothesis.
- **EllipticCurves L5 → Layer 10.** Explained above: the use is not stated.
- **Scheme vs equation parallels (MC 2A–2F vs EC Layer 1).** The isogeny, dual, degree and trace theories are developed twice, but the boundary is deliberate and documented on both sides. Only the concrete duplications (overlaps 2–4) are recorded.

## Checker

```text
{"packet": "research/blueprint/links/tauceti_TauCetiRoadmap_ModularCurves.json", "roadmap": "tauceti:TauCetiRoadmap/ModularCurves", "status": "complete", "links": 46, "overlaps": 19, "examined": 213}
0 error(s), 0 warning(s)
```
