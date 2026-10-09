# Red team: EllipticCurveModularityImaginaryQuadratic (Caraiani–Newton §§6–7)

Job `RT-DESIGN-EllipticCurveModularityImaginaryQuadratic` (issue #7697). Worker: Claude Code, session `cc-d65d04`. This session neither wrote nor reviewed the design (`DESIGN-…` was Codex `codex-Fj5emA`, its review Codex `codex-BaAQGd`). The machine-readable findings, with full quotations and locators, are in `RT-DESIGN-EllipticCurveModularityImaginaryQuadratic.result.json`. This report explains them for a human reader.

## What was attacked

The target is the accepted new roadmap *Modularity of elliptic curves, Part II: imaginary quadratic fields*: its definition, its 68-node packet, its reader document and its suggested Lean file. Its source is Caraiani–Newton, *On the modularity of elliptic curves over imaginary quadratic fields*, arXiv:2301.10509v3. I downloaded that version on 2026-10-09; the title and authors on page 1 match, and its SHA-256 equals the packet's. I read §1, Theorem 5.2 and §§5.3–5.6, and all of §§6–7. The supporting sources were Allen–Khare–Thorne arXiv:1910.12986v2 (Theorem 8.1 and all of §9) and Zywina's *Elliptic curves with maximal Galois action* (Theorems 1.2–1.3 and Proposition 5.2). Every finding quotes the arXiv preprint; no version of record was compared.

## Overall verdict

The design is careful where it is most visible. Each final theorem and layer statement matches the source hypothesis by hypothesis:

- Theorem 1.1, through Corollary 7.1.2: finite X₀(15)(F), F imaginary quadratic, every elliptic curve E/F.
- Theorem 1.2, through Corollary 6.1.2: F imaginary CM and Galois over ℚ with ζ₅ ∉ F, using Zywina's short-Weierstrass norm-height family.
- Theorem 6.1, Corollary 6.1.1 and Theorem 7.1: the residual conditions at 3 and 5, mod-5 irreducibility over 𝔽₅, and the exclusion of the whole split normalizer at 3.

I recomputed every explicit model, invariant, point, involution and conic in the packet with exact arithmetic, and all of it is right. That covers the j-maps, the curves 225A1, 15A1, 15A3, the Gaussian curve and the √−11 curve, the genus-one quartic and its five points, the genus-two sextic, both plane quartics with their involutions and ℚ(√−55) points, the torsion-class supports, and the 45A2 Jacobian via binary-quartic invariants. The 15 Mathlib baseline citations hold at 082e2d3. The suggested file elaborates at the pins with only `sorry` warnings, and none of its executable signatures is false.

The weaknesses lie in what the plan rests on and in what it fails to reuse. One finding is high, eight are medium and five are low.

## Findings

### High

**1. The twisted modular curve is never shown to be rational.** CN's prescribed-type switching (Propositions 6.1.5–6.1.6), following AKT Lemma 9.7, needs Y_ρ̄ to be an open subset of ℙ¹ over the base field. Only then can Hilbert irreducibility and weak approximation produce the auxiliary curve. AKT attributes this to Shepherd-Barron–Taylor 1997, Lemma 1.1, for p = 5, and the same argument works for p = 3. No node plans it:

- `symplectic-twist` states only geometric genus zero, and makes rationality conditional on an F-point.
- `hilbert-local-selection` begins "After solvable_preparation has made Yρ̄ an open subcurve of ℙ¹L", yet `solvable-preparation` states no such thing.
- Upstream ModularCurves §5C works over ℚ and stops at a smooth, geometrically irreducible affine curve.

The prerequisite chain of `switch_five`, `switch_three`, and so of every headline theorem, therefore has a hole. Fix: add the rationality theorem as an IQ.2 node, or as a precise request to ModularCurvesPartII R12.4, and cite it where it is used.

### Medium

**2. Two decomposed-genericity lemmas have no owner.** The first is CN Lemma 6.2.2: over a quadratic field, absolute irreducibility on G_{F(ζp)} implies decomposed genericity. It takes Theorem 6.1 to Corollary 6.1.1, and so to Theorems 7.1 and 1.1. The second is Allen–Newton Lemma 2.3, which Theorem 1.2 needs. The packet requests both from R01.4, and the CN extraction routed Lemma 6.2.2 there. But the accepted ArithmeticGaloisRepresentations packet plans only CN 7.1.1 and 6.1.4 in R01.4, and says explicitly that decomposed-genericity results belong elsewhere. The owners it points to (PA.5, AG2.7) do not plan these lemmas either. Goursat's lemma (CN 6.2.1) is already in Mathlib, as `Subgroup.goursat_surjective`. Fix: plan Lemma 6.2.2 (and Allen–Newton 2.3) as nodes, here or in the genericity owner, and repoint request #13.

**3. The Q-curve step ignores its now-accepted supplier.** `genus-one-modularity` and `genus-two-modularity` both say "E is a Q-curve, hence modular" with no Q-curve supplier among their prerequisites. Gap G10 and the reader say the GL₂-type sibling has no node. But `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6/quadratic-q-curves-modular` was accepted on 2026-10-08, is exactly this statement for real and imaginary quadratic fields, and names this roadmap as its consumer. Fix: cite it. Also add the bridge from its L-function form of modularity to the r_{π,ι} form used here.

**4. The real-quadratic branches rest on an unowned theorem that nothing needs.** Both modularity-from-points nodes cover real quadratic fields "by the imported FLHS theorem". No roadmap plans Freitas–Le Hung–Siksek's theorem; request #34 merely asks ML.1 to "supply or route" it. CN's genus-one argument handles every quadratic field without it, through rational j and Q-curves. CN's genus-two argument covers only imaginary fields. The single consumer assumes F imaginary quadratic. Fix: use GT.6 for the genus-one case, restrict the genus-two node to imaginary fields, and delete the FLHS dependency.

**6. The modularity predicate is posed over every number field.** `Modular` asks for an automorphic π on GL₂(𝔸_F) with r_{π,ι} ≅ r∨_{E,p}, but the Galois representation r_{π,ι} is constructed by its supplier AG2 only over CM or totally real fields. `modularity_transport` claims the same generality, although its supplier PA.5 is stated only for CM or totally real fields. CN gives the Galois form of the definition only for CM fields; for general F it uses the L-function form. Every consumer works over ℚ, a quadratic field or a CM field. Fix: restrict to totally real or CM fields, or adopt CN's L-function definition with a comparison lemma.

**7. AKT Theorem 8.1 is requested although an imported theorem already covers its uses.** G4 and a restructuring proposal ask a new roadmap part to own AKT 8.1, ordinary lifting over CM fields in arbitrary weight. It is used twice: the mod-3 step of AKT Lemma 9.11 inside the seed, and the mod-5 step of AKT Corollary 9.14 inside mod-3 switching. Both are weight-0 instances in which every p-adic place is potentially multiplicative, for ρ and for the residually automorphic curve alike. That is exactly clause (5)(c) of CN Theorem 5.2, which this roadmap already imports as `CL.9/thm-5-2`. The CL.9 qualification [F(ζ_p):F] ≠ 3 holds automatically for p = 3, 5. CN's proof of Theorem 5.2 does not use AKT 8.1, so there is no cycle. Fix: route both steps to CL.9/thm-5-2, and narrow G4 to AKT Theorem 7.1.

**8. The j-maps of X₀(3) and X₀(5) are planned twice.** `EllipticModularityEffectiveComparisons:EC.5/genus-zero-j-numerators` and `EC.5/genus-zero-j-map` were accepted the day before this design. They identify X₀(r) with ℙ¹, with j = lemosNumerator(r)(t)/t. For r = 3 this is literally `b3J`. For r = 5, `b5J(x)` equals it under t = 125/x; I checked the identity exactly. Fix: import the EC.5 nodes and keep only CN's coordinate change.

**9. Library declarations are not reused.** The pinned libraries already contain four things this packet requests or rebuilds:
- the Mordell–Weil theorem over number fields and finiteness of torsion, as `WeierstrassCurve.Affine.fg_point_of_numberField` and `finite_torsion` in Tau Ceti's MordellWeil/FinitelyGenerated.lean (lines 129 and 74), which the packet instead requests from the EllipticCurves layer-6 stage;
- the short Weierstrass curve and its discriminant, Tau Ceti's `shortCurve` with Mathlib's `Δ_of_isShortNF`, which `shortEquationFamily` rebuilds;
- quadratic twists with invariance of j, Tau Ceti's `quadraticTwist` and `j_quadraticTwist`;
- Goursat's lemma, in Mathlib.

Fix: add these to the baseline, and cite them where they are used.

**10. The suggested file states none of the named theorems.** All 43 theorem nodes, both comparisons, `Modular` and `shortEquationFamily` appear only as prose in comments. PROTOCOL §13 requires the named theorems as `sorry`-proved statements. Some of them do need missing carriers, such as automorphic representations, Jacobians and compactified Cartan curves. Many do not. A probe stating `shortEquationFamily`, the √−10 non-torsion point and the anisotropy of the X(ns3°) conic compiled at the pins.

### Low

**5.** CN Corollary 7.3.4 is stated for every quadratic field, but its proof covers only imaginary ones. The statement is true by Freitas–Le Hung–Siksek, so this is a gap in the proof rather than a false result. It is not recorded in `sourceIssues`.

**11.** Two definitions have unit tests that a plausible wrong definition passes. A `shortEquationFamily` defined with the wrong sign, 4a³ − 27b², passes all three tests; adding the test "(−3,2) is excluded" catches it. The three `quartic1` tests read only the X⁴, Y⁴ and Z⁴ coefficients; quartic1(1,1,1) = 156 is a discriminating test.

**12.** `genus_one_jacobian` should cite ArithmeticStatistics ST.0's binary-quartic invariants. With (I, J) = (2169, 199206), E_{I,J} is y² = x³ − 723x − 7378, which is the packet's 45A2 model after x ↦ x − 1. That is the whole certificate that G11 leaves open for this step.

**13.** The unaccepted ModularityAndLanglandsExtensions packet plans CN Theorems 1.1 and 1.2 again, in ML.1, under its own declaration name and with a wrong route. It calls Theorem 1.3 a lifting theorem and requests it from PA.4. ML.1 should cite IQ.8 and IQ.3, which is what this roadmap's request #34 already asks.

**14.** The reader and the packet narrate the planning process ("now plans", "at this checkout", "Review routing note", "not obtained in this run"), and some of those statements are now false. They should be rewritten timelessly.

## Checks that found nothing wrong

- CN's case analysis for Theorem 7.1 leads to exactly the four curves of IQ.5–IQ.7.
- The decomposed-genericity convention agrees with CN Definition 2.1.27.
- The dual Tate module and Hodge–Tate conventions are consistent with CN and AKT.
- The review's repairs F1–F4 hold: non-CM auxiliary curves via retained Tate places (checked against AKT 9.12–9.15), the Fricke relation on the genus-one quotient, and the rational points at infinity of the genus-two curve.
- Source issues E4, E5, E9 and E17–E20 hold at their locators.
- Zywina's Proposition 5.2 bound matches the packet.
- The relative symmetric Chabauty and sieve nodes imported from EffectiveDiophantineMethods exist under the cited ids.
- No part of CN §§2–5 is replanned.

## Lean

Command (memory checked first: 114 GB available):

```
cd <pinned TauCeti build, Mathlib 082e2d37> && \
  flock <swarm lean lock> timeout 1200 lake env lean \
  research/blueprint/suggested/EllipticCurveModularityImaginaryQuadratic.lean
```

The file compiled with exit 0 and 109 `declaration uses sorry` warnings, and nothing else. The probe for finding 10, a scratch file outside the repository, compiled the same way. In this environment only 156 Tau Ceti modules are built and `ShortWeierstrass` is not among them, so the Tau Ceti declarations were read at the source level, not compiled against.
