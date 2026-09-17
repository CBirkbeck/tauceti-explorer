# REV-AUDIT-30: review of the AUDIT-30 library audit

**Verdict: accepted, after 16 corrections made in place.** I checked all 222 targets in the 45 layers of 5 roadmaps (MotivicEtaleKTheory, Polylogarithms, RefinedTraceMethods, SchemeKTheoryOperations, StableHomotopyKTheory) against the pinned baseline (tauceti `f790474`, mathlib `082e2d3`).

The audit is careful and its sweeping absence claims survive re-searching. Five target entries understated what the libraries already contain, and one duplicate was a consumer rather than another owner.

| roadmap | layers | targets present / partial / absent | duplicates before → after |
| --- | --- | --- | --- |
| MotivicEtaleKTheory | 14 not built | 0 / 9 / 54 | 23 → 28 |
| Polylogarithms | 6 not built | 0 / 1 / 27 | 12 → 11 |
| RefinedTraceMethods | 10 not built | 0 / 0 / 48 | 11 → 14 |
| SchemeKTheoryOperations | 2 partly built, 5 not built | 2 / 3 / 33 | 20 → 21 |
| StableHomotopyKTheory | 1 partly built, 7 not built | 3 / 7 / 35 | 18 → 18 |

## 1. Claims that a target is in the libraries

I checked every citation with a script: the file, the declaration's short name at the cited line, `private`, and `sorry` anywhere in the file; then I read every citation attached to a present or partial target in its source context.

All 180 original citations resolve, none is `private`, and none lives in a file containing `sorry`. One name is missing from `declarations.tsv`: `Topology.CWComplex` in H.3. It is correct in the source — `class CWComplex` is declared at `Mathlib/Topology/CWComplex/Classical/Basic.lean:135` inside `namespace Topology`, opened at line 92 — so the index, not the audit, is at fault. The citation stands.

Everything read in context held. In particular: `AlgebraicGeometry.Scheme.Modules` really is Mathlib's abelian category of sheaves of modules on a scheme; `TauCeti.cartanMap`/`cartanEquiv` really are the degree-zero affine Cartan map and its inverse under finite projective resolutions, and Mathlib really does define `IsRegularRing` without Auslander–Buchsbaum–Serre (no `globalDimension` and no Auslander theorem exist); `TauCeti.exists_isRiemannRochDivisor` is the function-field divisor form; `groupHomology.H1AddEquivOfIsTrivial` really is `H₁(G,A) ≃ Gᵃᵇ ⊗ A`; `SimplicialObject.diagonal` really is the long edge of a simplex and not the diagonal of a bisimplicial object; `HomologicalComplex₂.total` really is the coproduct totalisation.

## 2. Layers marked built or process

None. No layer is marked `built` or `process`. The verdicts are consistent with the targets: each of the three partly-built layers (S.1, S.7, H.1) has a present target, and no not-built layer has one.

## 3. Absent and partial claims, re-searched

I re-searched every absent and partial target in both trees, by name, by Mathlib naming convention and by the key words of its statement, reading the hits in context.

**These absence claims hold.** Milnor K-theory and any K-theory above K₀; the Nisnevich topology (the word appears only in a `MayerVietorisSquare` docstring); motivic cohomology, higher Chow groups, cycle complexes, algebraic simplices and Chow groups; finite correspondences, norm varieties, Rost motives, Steenrod/reduced powers, `dlog` and logarithmic differentials; Poitou–Tate, local Tate duality, local invariant maps, residue maps on Galois cohomology, cohomological and virtual cohomological dimension; étale K-theory, rigidity, Quillen–Lichtenbaum, étale Chern classes, Deligne cohomology; Chern classes and the Chern character, Todd classes, Grothendieck–Riemann–Roch, λ-rings and Adams operations (`Dickson.lean` says "Mathlib doesn't currently know what a Lambda ring is"), perfect complexes (the phrase occurs nowhere), the resolution property, dévissage, localisation sequences, Gersten, blow-ups (the Rees algebra file lists them as future work), projective and flag bundles, Nil groups, KH, the splitting principle, excess intersection and deformation to the normal cone; spectra in any model, stable homotopy groups, smash products, Moore spectra, Bockstein, connective covers, Γ-spaces and the Segal machine, the group-completion theorem, BGL, strictification, the Waldhausen S-construction, bisimplicial realisation, Quillen's Theorems A and B, homotopy fibres and pullbacks of spaces, mapping path spaces, Serre fibrations, Hurewicz, van Kampen for spaces, the plus construction, acyclic maps, contractibility of nerves, lim¹ and derived inverse limits, arithmetic fracture squares; Hochschild and cyclic homology, the cyclic category, Connes' B, SBI, HKR, THH/TC/TR/TP, cyclotomic spectra, the Dennis and cyclotomic traces, Dundas–Goodwillie–McCarthy, localizing motives and Efimov's theorem; topological K-theory, ku/KU and topological Bott periodicity; q-de Rham and q-Hodge complexes, quasisyntomic and quasiregular semiperfectoid rings, prismatic cohomology, Nygaard, syntomic complexes, Habiro rings; Li_n for n ≥ 2, the dilogarithm and Bloch–Wigner function, Bloch groups, five-term relations, distribution relations, cross-ratios, ideal tetrahedra and hyperbolic volume, Goncharov's weight-three complexes, Eisenstein–Kronecker expressions, the p-adic logarithm and p-adic regulator, and Leopoldt's conjecture.

One refinement worth recording: Mathlib's only `ModelCategory` *instance* is the injective structure on `CochainComplex.Plus` (`Algebra/Homology/ModelCategory/Injective.lean:205`). There is still no Kan–Quillen structure on `SSet` (only anodyne extensions) and none on spectra, as H.5 says, and no instance making `TopCat.toSSet.obj X` a Kan complex, as H.2 says.

**These five were understated and are corrected.**

* **M.3, the norm-residue symbol: the Steinberg relation is built.** The note listed it among the missing pieces and the roadmap summary said "no Steinberg relation". Tau Ceti proves `TauCeti.QuaternionAlgebra.steinbergEquivMatrix`: for a field with 2 invertible and `a`, `1 − a` nonzero, the quaternion algebra `(a, 1 − a)` splits, `ℍ[K,a,1−a] ≃ₐ M₂(K)`. That is the Steinberg relation in its ℓ = 2 quaternion-symbol form, sorry-free. What is still missing is K₂, the twist `μ_n ⊗ μ_n` and the cup-product form `κ(a) ∪ κ(1−a) = 0`. The target stays **partial**.
* **M.1, continuous cohomology: the finite-level comparison is partly built.** The note said the comparison of continuous cohomology with the limit of finite-coefficient cohomology is absent. Tau Ceti proves the finite-quotient *colimit* theorem `Hⁱ(G, M) = colim_U Hⁱ(G/U, M^U)` for a profinite `G` with discrete coefficients in degrees zero and one (`explicitFiniteQuotientColimit0`, `explicitFiniteQuotientColimit1`; the degree-two cocone is built but not shown colimiting). Only the inverse-limit side — derived limits and lim¹ — is absent.
* **M.3, Tate's theorem: the class field theory is scaffolded, not missing.** The note said "the cohomological class field theory it needs is also absent". `TauCeti/NumberTheory/ClassFieldTheory/Formation/` has 153 declarations: formations in the Artin–Tate sense, finite normal layers with their Galois groups and levels, the norm and norm quotient with `Ĥ⁰` identified with it, abelian layers, restriction, refinement, inflation and the group-theoretic transfer, together with `Ĥ^{−2}(G,ℤ) ≃ Gᵃᵇ`. The fundamental class, the invariant map, Tate's theorem for a class formation and the Artin map are genuinely absent (`tateTheorem`, `cupClass`, `fundamentalClass` and a Brauer `invMap` find nothing), so the target stays **absent**, but the note now says what exists.
* **M.8, Selmer complexes: absent → partial.** Nothing was cited from Mathlib. `IsDedekindDomain.selmerGroup` is `K(S,n) ⊆ Kˣ/(Kˣ)ⁿ` cut out by the unramified-outside-`S` local condition, and Tau Ceti adds the S-unit map into it and `selmerGroupAbove`. Selmer *complexes*, crystalline and semistable conditions, determinant lines and regulator maps are still absent.
* **H.1, classifying spaces and products.** Added `SSet.prodStdSimplex.isoNerve`, which proves `Δ[p] ⊗ Δ[q] ≅ nerve (Fin (p+1) × Fin (q+1))`, the representable case of the nerve/product identification. The realised statement `|N(C × D)| ≃ |N C| × |N D|` and the filtered-colimit statement remain missing.

The MotivicEtaleKTheory summary was rewritten to match these four changes; the other four summaries were checked claim by claim and left as written.

## 4. Duplicates

84 claims naming 64 distinct layers. Every id exists in `atlas/index.json`, none belongs to the one retired roadmap (`FoundationsAndLibraryIntegration`), and none is a same-roadmap layer. I read each named layer's description and kept a claim only where that layer states one of this layer's targets.

* **Removed (1).** `Polylogarithms:P.1 → EllipticRegulators:ER.2`. ER.2 proves the Steinberg relation for `η(f,g)` *through* the Bloch–Wigner dilogarithm; it states none of P.1's targets — Li_n, its continuation, distribution relations, the single-valued functions or D's five-term identity. It is a consumer of P.1, not another owner. (The separate `P.5 → ER.2` claim is genuine: ER.2 does construct `η(f,g)`.)
* **Kept (83).** Including the ones that look like imports but are not: `M.1/M.2 → ArithmeticGaloisDuality:D7` and `R02.1/R02.4` (D7 is the declared owner of compact-coefficient derived cohomology, derived inverse limits and Poitou–Tate, which M.1 and M.2 restate), `M.3 → K2SymbolsBrauer:T.7` (T.7 states the same symbol comparison and the S-integer extension), `RT.2 → KTheoryFiniteLocalFields:L.4` (L.4 constructs the classical TR/Frobenius comparison itself), and `S.5 → EllipticKTheory:E.5` and `KTheoryLowDegrees:Z.6` (S.5's own target asks for the P¹ calculation these two perform).
* **Added (9) missed owners.**
  - `M.1 → tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`: the Tau Ceti owner of continuous cohomology in all degrees with the all-degree finite-quotient colimit theorem, and the owner of the degree zero and one cases now cited as built.
  - `M.2` and `M.7 → tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`: defines `cd_p`, `scd_p` and `cd` in `ℕ∞`, the invariant M.2 must verify and M.7's degree range depends on.
  - `M.2 → tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-...-the-local-invariant-and-duality`: owns the local Brauer group, the Frobenius-normalised invariant map and local duality — the local half of M.2's target, and the layer ArithmeticGaloisDuality D7 explicitly defers to.
  - `M.2 → ArithmeticGaloisDuality:R02.3`: finiteness of finite-coefficient cohomology, cohomological-dimension bounds with real-place exceptions, and compactly supported arithmetic cohomology.
  - `RT.4` and `RT.4:topological → tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-7-...`: the owner of the real Clifford-algebra Bott periodicity `Cliff(p+1,q+1) ≅ Cliff(p,q) ⊗ M₂(ℝ)` and the mod-8 table that the audit cites as built.
  - `RT.3 → KTheoryFiniteLocalFields:L.5`: proves the THH/TR/TC calculation for truncated polynomial algebras `k[t]/(tᵉ)` and the characteristic-zero square-zero comparison — RT.3's own tests.
  - `S.6 → MotivicEtaleKTheory:M.6b`: M.6b already lists S.6; the relation was recorded in only one direction.

## Most important finding

The audit's verdicts are right — every layer in these five roadmaps really is unbuilt, and the long list of missing theory survives an independent search — but its picture of the Galois-cohomological substrate was too bleak in three places. Tau Ceti already proves the Steinberg relation for quaternion symbols, already proves that continuous cohomology of a profinite group is the colimit of its finite levels in degrees zero and one, and already carries the whole Artin–Tate class-formation framework with `Ĥ⁰` as the norm quotient and `Ĥ^{−2}(G,ℤ) ≅ Gᵃᵇ`. What blocks M.3 is therefore not the absence of class field theory but the three named results on top of it — the fundamental class, the invariant map and Tate's theorem for a class formation — together with K₂, which no library has.
