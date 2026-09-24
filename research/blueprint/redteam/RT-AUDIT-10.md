# RT-AUDIT-10 — accepted library audit red team

Agent: Codex — codex-hjdg0j. Read on 2026-09-24 against explorer `ca1afaab5ed1a662e8e4f8d33b1746395f3825ea`. Independent of AUDIT-10 and REV-AUDIT-10. Status: complete.

Rechecked **48 layers, 213 targets, 454 citation occurrences (352 distinct declarations in 275 pinned files), and 80 duplication references**. Five medium findings correct the scope of library claims; one low finding clarifies the Hodge sign vocabulary. None warrants changing a whole layer or target classification. The corrections matter when a planner turns a coverage note into an import or a new implementation task.

The result retains 43 not-built layers, four partly-built layers (R12.4, C0, C1, D1), and the R13.4 process aggregator. Targets remain 172 absent, 37 partial, one Mathlib, one both, and two Tau Ceti.

## Scope and method

- Read the accepted AUDIT-10 result, REV-AUDIT-10, all five complete roadmap documents and all 48 corresponding stage descriptions. Compared every target, note and duplicate entry; each stage description occurs verbatim in its current document after whitespace normalization. This worker did neither AUDIT-10 nor REV-AUDIT-10.

- Rechecked all 213 targets across 48 layers: 172 absent, 37 partial, one mathlib, one both and two tauceti. Layer totals are 43 not built, four partly built and one process. No layer or target status change is supported by these findings.

- Read all 454 citation occurrences through their 352 distinct (library,name) statements, with namespace, variable/typeclass hypotheses and relevant definition expansions. All 275 cited files match the Git blob IDs at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Checked the anonymous-instance and quoted-Proj index exceptions in source; completed theorem signatures containing internal haveI/letI. No Lean compilation or full transitive axiom audit is claimed.

- Searched every absent target and the missing portions of partial targets first in declarations.tsv and then in both pinned Lean trees, grouped by concept and synonyms. Examined relevant near matches and their scope; broad keyword hits include irrelevant code/comments and are not themselves evidence of coverage. The report records a layer-by-layer search matrix and the search families.

- Modular checks: PeriodPair, lattice ℘ and differential equation, transformation laws, congruence groups/stabilizers/cusp translation widths, connected quotients versus affine scalar extension and analytification, Hecke/degeneracy/trace/Petersson formulas, function-field differentials, isogenies and finite torsion. Distinguished analytic operations from missing geometric correspondences and cohomological comparisons.

- Néron checks: models and generic-fibre maps versus change of DVR, affine group components over algebraically closed fields versus Néron fibres, weighted numerical Picard groups versus actual geometric component groups, equation reduction/formal groups versus E₀/Tate algorithms, finite torsion versus Tate modules, and local Euler polynomials versus ramification conductors and p-adic comparisons.

- PEL checks: pairing/lattice/Hodge ingredients, characteristic polynomials, abstract stacks and descent, relative normalization and its smooth-base-change isomorphism, field-level abelian varieties/isogenies versus abelian schemes, and the missing PEL determinant/level/moduli/reciprocity constructions. Kept noncommutative orders and similitudes distinct from existing commutative algebra and isometry groups.

- Compactification/Shimura checks: integral lattices, finite fans, regular cones, monoid-algebra point spaces, Gordan’s equalizer theorem, mixed-Hodge splitting and strictness, dynamic parabolics on points and the GL_N scheme specialization, Proj, sheaf cohomology, pure-Hodge operations, torus descent versus Weil restriction, topological matrix groups versus general adelic points, complex bundles versus variations, and flag/reflex/Cartan/datum constructions.

- Checked all 80 duplicate references against the full descriptions of their 55 distinct named stages. Each resolves and supports the overlap when its import/special-case limits are retained; no new wrong-owner finding. Upstream roadmap plans and provenance comments were not counted as pinned-library implementations.

- Compared the integrated data/library-coverage.json projection with the accepted audit for all 48 layers: verdicts, target texts/statuses/notes and duplicate entries agree. Its omission of declaration arrays is the integration format, not a finding. The five extracts have no integrated decomposition. This audit red team does not claim a fresh review of every underlying paper or every area-wide dependency edge.

The 275-file check is against pinned Git blob hashes, not the libraries’ moving default branches. A direct scan of those cited files found no `sorry` or explicit `axiom` declarations; this is not a compiled dependency/axiom check. The distinct-citation count is computed from the current result, rather than inherited from the historical review. All numerical target indices below are zero-based.

## Finding RT-AUDIT-10/1 — medium

**Where:** `research/blueprint/audit/AUDIT-10.result.json: roadmaps.ModularCurvesPartII.layers.ModularCurvesPartII:R12.5.targets[3] (zero-based).note`.

The note states T_p ∘ V_d = V_d ∘ T_p without restricting p relative to the raised level N. The cited result is only the away-from-N relation; it does not supply the bad-prime relation.

**Evidence:** https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Degeneracy.lean#L81-L95: HeckeRing.GL2.heckeTCuspNat_levelRaise explicitly takes hdvd : d * M ∣ N, hp : p.Prime and hpN : Nat.Coprime p N. Its conclusion compares T_p at level N after V_d with V_d after T_p at level M. Lines 85–86 explain that the diamond term can vanish at level N without vanishing at level M and multiplication by d modulo p need not permute the summands. The same audit already keeps p ∤ N in R13.4b.targets[1].note.

**Fix:** Write T_p^(N) V_d = V_d T_p^(M) for d*M ∣ N and p prime with p ∤ N, retaining the cited declaration and the partial target. Do not extrapolate to bad primes. Leave the absent geometric pullback/trace comparison and the layer verdict unchanged.

## Finding RT-AUDIT-10/2 — medium

**Where:** `research/blueprint/audit/AUDIT-10.result.json: roadmaps.ModularCurvesPartII.layers.ModularCurvesPartII:R14.1.targets[2] (zero-based).note`.

The displayed Petersson slash-adjoint identity omits both the positive-determinant hypothesis and the change of integration domain. The cited theorem relates the integral over S to the integral over g • S; it is not a same-domain adjoint identity for an arbitrary slash operator.

**Evidence:** https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Petersson/Adjoint.lean#L147-L165: UpperHalfPlane.peterssonInner_slash_left_adjugateGL takes k : ℤ, hg : 0 < det g, S : Set ℍ and f h : ℍ → ℂ, and concludes peterssonInner k S (f ∣[k] g) h = peterssonInner k (g • S) f (h ∣[k] TauCeti.adjugateGL g). The docstring at 148 displays both domain subscripts. The adjacent inverse form at 138–143 has the determinant factor (det g)^(k−2).

**Fix:** Replace the unscripted formula with ⟪f|g,h⟫_S = ⟪f,h|g^ι⟫_(g•S), for det g > 0. Describe it as the change-of-domain slash identity. Keep the explicit statement that T_n* = ⟨n⟩⁻¹T_n is not proved, keep the citation as related, and leave the target partial and R14.1 not built.

## Finding RT-AUDIT-10/3 — medium

**Where:** `research/blueprint/audit/AUDIT-10.result.json: roadmaps.PELModuli.layers.PELModuli:M5.targets[1] (zero-based).note`.

The supporting claim #ker[n] = n² over an algebraically closed field omits the invertibility of n in that field. Its cited theorem counts kernel points under an explicit nonzero-characteristic-image hypothesis; it is not an unrestricted characteristic-p torsion count or a finite-flat scheme rank theorem.

**Evidence:** https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/KernelCard.lean#L116-L125: TauCeti.Isogeny.card_ker_mulByIntIsogeny assumes [IsAlgClosed F], hn : psiFunctionField W n ≠ 0 and hchar : (n : F) ≠ 0, and gives Nat.card (mulByIntIsogeny W hn).ker = n.natAbs ^ 2 for an elliptic Weierstrass curve over F. Its proof uses separableDegree_mulByIntIsogeny W hchar. R12.1.targets[5].note in this same audit correctly says n invertible.

**Fix:** Qualify the M5 note by n invertible in F (and retain the multiplication-isogeny setup of the cited theorem); use |n|² for integer n if spelling out the formal conclusion. Keep the genus-one moduli comparison absent and M5 not built. Do not substitute a scheme-theoretic degree claim for the point cardinality.

## Finding RT-AUDIT-10/4 — medium

**Where:** `research/blueprint/audit/AUDIT-10.result.json: roadmaps.ShimuraCompactifications.layers.ShimuraCompactifications:C0.targets[5] (zero-based).note and .declarations`.

The assertion that Gordan’s lemma is missing overlooks Mathlib’s proved equalizer form. The complete cone-lattice/toric-chart interface is indeed absent, but a directly relevant finite-generation theorem should be credited rather than scheduled from scratch.

**Evidence:** https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Finiteness.lean#L577-L628: Submonoid.fg_eqLocusM, line 627, proves (f.eqLocusM g).FG for homomorphisms from a canonically ordered, well-quasi-ordered commutative monoid to a cancellative monoid, with IsOrderedCancelMonoid on the source. The @[to_additive] theorem provides the additive version: equalizers of maps from ℕ^r to a cancellative additive monoid are finitely generated. The additive docstring at 622–626 identifies its ℕ^r/ℕ^s specialization as a version of Gordan’s lemma. Submonoid.fg_of_divisive at 585 supplies the proof. No declaration name contains Gordan, explaining why a name-only search misses it.

**Fix:** Add Submonoid.fg_eqLocusM (Mathlib/GroupTheory/Finiteness.lean:627, fit related) with an explanation of its generated additive form. Replace the blanket absence sentence by: the equalizer/nonnegative-integer-solution form of Gordan’s lemma exists; the dual integral-character monoid of a rational cone, its identification with a suitable solution monoid, and the resulting cone-specific finite-generation/localization API remain to be connected. Keep this composite chart target partial and C0 partly built; do not claim that U_σ or arbitrary-base toric gluing is implemented.

## Finding RT-AUDIT-10/5 — medium

**Where:** `research/blueprint/audit/AUDIT-10.result.json: roadmaps.ShimuraData.layers.ShimuraData:D3.targets[0] (zero-based).note`.

The note describes ContMDiffVectorBundle as only smooth and then says no holomorphic bundles exist. The cited class is parameterized by the scalar field and differentiability order: over ℂ at analytic order ω it already expresses a holomorphic vector bundle via complex-analytic transition functions. The missing variation and its filtration/transversality are separate requirements.

**Evidence:** https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/VectorBundle/Basic.lean#L288-L309: ContMDiffVectorBundle assumes a NontriviallyNormedField 𝕜, VectorBundle 𝕜 F E and a 𝕜-model IB, and requires ContMDiffOn IB 𝓘(𝕜, F →L[𝕜] F) n for the linear transition maps. Specialize 𝕜 = ℂ, n = ω and F finite-dimensional. At https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/VectorBundle/Basic.lean#L580-L617, VectorBundleCore.IsContMDiff and VectorBundleCore.instContMDiffVectorBundle construct such bundles from analytic transition data; Bundle.Trivial.contMDiffVectorBundle supplies the trivial examples. The total-space transition theorem is Bundle.Trivialization.contMDiffOn_symm_trans at 410–423.

**Fix:** Rewrite the note to credit complex-analytic vector bundles on complex manifolds through ContMDiffVectorBundle over ℂ (e.g. order ω), plus its transition-data construction. Preserve the related fit: no local-system-to-holomorphic-bundle comparison, Hodge subbundle filtration, flat connection or Griffiths transversality is supplied by that class. Keep the VHS target absent and D3 not built; do not claim a theory on singular analytic spaces.

## Finding RT-AUDIT-10/6 — low

**Where:** `research/blueprint/audit/AUDIT-10.result.json: roadmaps.ShimuraData.layers.ShimuraData:D1.targets[0] (zero-based).target`.

The phrase “weight (diagonal)” blurs the roadmap’s explicit distinction between the diagonal central restriction and the inverse weight cocharacter. The library absence is correct, but the target wording should preserve the chosen sign convention.

**Evidence:** https://github.com/CBirkbeck/tauceti-explorer/blob/ca1afaab5ed1a662e8e4f8d33b1746395f3825ea/content/campaign/ShimuraData/README.md#L26-L36 fixes h(z)v = z^(−p) conjugate(z)^(−q)v and says: “Call `h` restricted to the diagonal real multiplicative group the central restriction. Its inverse is the weight cocharacter”. D1 at lines 50–56 asks for the diagonal and norm maps under this convention. Thus the central restriction acts by t^(−n), while its inverse acts by t^n on weight n.

**Fix:** Call the map S receives the diagonal map, and explicitly distinguish h composed with that map (central restriction) from its inverse (weight cocharacter). Keep the absence classification and the existing h(i)=C⁻¹ note; no Hodge-library convention is changed.

## Coverage boundaries checked

The ℘ differential equation is stated off the period lattice. The modular discriminant is not yet linked to the general `PeriodPair` invariants. Neither fact builds uniformization or analytification. The cusp-width carrier uses translation orbits in the full SL₂ coset space, retaining the distinction from a projective cusp orbit when −I is absent. The connected quotient is topological; the affine scalar-extension results do not by themselves construct the comparison of schemes with analytic curves. Reading both regular-local-ring files did not reveal the missing regular-local-to-domain theorem.

`Model.baseChangeHom` maps generic fibres of models over the same DVR; it is not base change of a model along `FiniteDVRExtension`. The numerical Picard matrix divides column j by w_j, and `picToCoker` is an injection into the unweighted cokernel. It is not an equality with a Néron component group. `Place`-based ramification and pole-point statements retain the restriction to places trivial on the constant field. The library's finite torsion and reduction-type Euler polynomials do not supply a Tate-module comparison or an Artin/Swan conductor.

The relative-normalization comparison has the correct direction, from normalization after pullback to pullback of normalization, and its `IsIso` instance really assumes a smooth base-change map. It does not authorize arbitrary residue-fibre base change. Abstract descent for morphisms, modules or pseudofunctors does not construct the PEL moduli stack, the abelian scheme or the required effective descent of projective families.

The integral-lattice predicate contains freeness, finiteness and a scalar-extension condition; its omission would change the meaning of rational toric cones. Fans are finite here. The existing exposed-set theory proves that exposed subsets are extreme, but does not identify every face of a rational polyhedral cone with an integral supporting hyperplane. Gordan's equalizer result is useful existing algebra, with a missing cone/lattice bridge (finding 4). Existing affine-monoid complex point spaces, generic scheme gluing and Proj do not already assemble the toric schemes or arithmetic compactifications.

For mixed Hodge structures, the claims extend beyond a defined splitting formula: `Mixed/Decomposition.lean:539` proves that the Deligne pieces form an internal direct sum, and `Mixed/Strictness.lean:108,116,129` proves strictness for F, complexified W and rational W. The pure-Hodge tensor, dual, Tate twist and internal Hom are also present. These do not prove the Deligne-torus representation equivalence or variations. Character twists of finite-group Steinberg representations and Lie-algebra modules are not that missing algebraic-S representation interface. The audit's h(i)=C⁻¹ convention is retained.

Dynamic parabolics first concern points of affine groups. GL_N weight parabolics have a genuine scheme representation and Levi machinery; a general flag variety or reflex field does not follow from that special case. Likewise general group quotients, matrix topologies and a compact-quotient orbit homeomorphism do not prove the closed-subgroup theorem or a general Hermitian-domain construction. Scheme descent of tori and a scalar-forgetting functor on commutative algebras are not Weil restriction by its tensor-product points functor.

## Search coverage

Each layer below was checked against its complete target list, including notes. Searches used `declarations.tsv` first and both pinned Lean trees next. Broad searches were narrowed by namespace and mathematical meaning. No assertion of absence rests solely on a missing declaration name: Gordan's lemma is a concrete reason to read source docstrings and actual statements. Search results are evidence of the bounded check, not a formal proof that no differently encoded implementation exists.

| Family | Concepts and alternate spellings used |
| --- | --- |
| A | uniformiz/uniformis, PeriodPair, weierstrassP, period lattice, analytic elliptic/manifold, analytifi/GAGA, congruence/Gamma torsion-free, cusp width/chart/parameter/qParam, quotient Riemann surface |
| B | Weil pairing, level structure/Drinfeld, FullLevel/FixedPairing, ModularCurve/EllipticScheme, generalized/generalised elliptic, Néron polygon/n-gon, Tate curve, Igusa, coarse space, relative Cartier |
| C | connectedness/GeometricallyConnected, connected algClosed, regular domain/IsRegularLocalRing, normalization/normalisation, IsStack/algebraic stack/algebraic space/DeligneMumford, representability, fpqc and effective descent |
| D | Hecke adjoint, Petersson slash, levelRaise, trace, qExpansion/eigenvalue, HeckeAlgebra/HeckeField/coefficientField, modular symbols, parabolic cohomology, Ihara/Bruhat–Tits, Kuga–Sato, Eichler–Shimura, local systems, symmetric powers, Poincaré duality |
| E | Neron/Néron, excellence, smoothening/dilatation/weak models, DVR/model base change, semistable/Raynaud/Mumford, abelian scheme/variety, Picard functor/scheme/generalized Jacobian, component/character groups, monodromy, class-group norm/conorm |
| F | invariant differential/formal group, good reduction, Tate module, Kodaira/Tate algorithm/Néron–Ogg–Shafarevich, ramification, Artin/Swan conductors, local polynomial, crystalline/semistable/de Rham comparisons |
| G | PEL, positive involution/Rosati, similitude/GSp/GU, polarization, dual lattice/discriminant/signature, determinant/Kottwitz, quasi-isogeny, Serre–Tate/Grothendieck–Messing, Hasse–Minkowski/Brauer–Nesbitt, canonical models/CM/reflex fields |
| H | toric/rational polyhedral cones/fans, dual/face/orthogonal/exposed, regular/simplicial, Gordan, dual semigroup, affine toric schemes, torsors/embeddings, refinement/support/properness |
| I | mixed Hodge/Deligne splitting, dynamic parabolic/Levi/unipotent radical, mixed Shimura/boundary components, semi-abelian, biextension/1-motive, toroidal/minimal/Baily–Borel/Satake, Proj/graded finiteness, Hodge line, normal crossing, higher direct images, Hasse invariant/Koecher |
| J | Deligne torus/Weil restriction/restriction of scalars, adelic/restricted product/compact-open, tensor/mixedSpace, Lie/Cartan/compact real form, Hermitian symmetric/compact dual, Griffiths/variation, neat/special point/reflex, character twists, complex vector-bundle transition functions |

| Layer | Targets | Citations | Duplicate references | Families | Verdict |
| --- | ---: | ---: | ---: | --- | --- |
| ModularCurvesPartII:R12.1 | 6 | 19 | 2 | A, B | not built |
| ModularCurvesPartII:R12.2 | 4 | 11 | 2 | A, B, C | not built |
| ModularCurvesPartII:R12.3 | 4 | 6 | 3 | A, B, C | not built |
| ModularCurvesPartII:R12.4 | 5 | 6 | 2 | A, C | partly built |
| ModularCurvesPartII:R12.5 | 4 | 13 | 3 | A, D, F | not built |
| ModularCurvesPartII:R12.6 | 3 | 2 | 1 | A, B, D | not built |
| ModularCurvesPartII:R13.1 | 3 | 4 | 1 | B, C | not built |
| ModularCurvesPartII:R13.2 | 3 | 2 | 1 | B, C | not built |
| ModularCurvesPartII:R13.3 | 4 | 4 | 2 | A, B, F | not built |
| ModularCurvesPartII:R13.4 | 1 | 0 | 0 | B, C | process |
| ModularCurvesPartII:R13.4a | 3 | 1 | 2 | B, C | not built |
| ModularCurvesPartII:R13.4b | 2 | 3 | 2 | A, B, C, D | not built |
| ModularCurvesPartII:R13.5 | 3 | 3 | 1 | B, E, F | not built |
| ModularCurvesPartII:R13.6 | 2 | 3 | 1 | B, D, E | not built |
| ModularCurvesPartII:R14.1 | 5 | 10 | 2 | B, D | not built |
| ModularCurvesPartII:R14.2 | 4 | 5 | 1 | D, E, F | not built |
| ModularCurvesPartII:R14.3 | 4 | 8 | 3 | D, F | not built |
| ModularCurvesPartII:R14.4 | 2 | 1 | 0 | D, E | not built |
| ModularCurvesPartII:R14.5 | 4 | 4 | 0 | D, E, F | not built |
| ModularCurvesPartII:R14.6 | 4 | 2 | 3 | D, E, F | not built |
| NeronModelsAndSemistableAbelianVarieties:R11.1 | 7 | 15 | 0 | C, E, F | not built |
| NeronModelsAndSemistableAbelianVarieties:R11.2 | 5 | 10 | 2 | C, E, F | not built |
| NeronModelsAndSemistableAbelianVarieties:R11.3 | 4 | 2 | 2 | C, E, F | not built |
| NeronModelsAndSemistableAbelianVarieties:R11.4 | 5 | 11 | 2 | C, E, F | not built |
| NeronModelsAndSemistableAbelianVarieties:R11.5 | 6 | 11 | 4 | C, E, F | not built |
| NeronModelsAndSemistableAbelianVarieties:R11.6 | 3 | 5 | 2 | C, E, F | not built |
| PELModuli:M0 | 7 | 22 | 1 | B, C, E, F, G | not built |
| PELModuli:M1 | 5 | 14 | 1 | B, C, E, F, G | not built |
| PELModuli:M2 | 5 | 12 | 1 | B, C, E, F, G | not built |
| PELModuli:M3 | 5 | 11 | 3 | B, C, E, F, G | not built |
| PELModuli:M4 | 4 | 8 | 1 | B, C, E, F, G | not built |
| PELModuli:M5 | 5 | 15 | 3 | B, C, E, F, G | not built |
| PELModuli:M6 | 4 | 12 | 1 | B, C, E, F, G | not built |
| ShimuraCompactifications:C0 | 8 | 25 | 2 | B, C, G, H, I | partly built |
| ShimuraCompactifications:C1 | 7 | 21 | 2 | B, C, G, H, I | partly built |
| ShimuraCompactifications:C2 | 5 | 12 | 1 | B, C, G, H, I | not built |
| ShimuraCompactifications:C2.general | 1 | 0 | 0 | B, C, G, H, I | not built |
| ShimuraCompactifications:C3 | 4 | 10 | 2 | B, C, G, H, I | not built |
| ShimuraCompactifications:C3.general | 1 | 0 | 0 | B, C, G, H, I | not built |
| ShimuraCompactifications:C4 | 6 | 11 | 3 | B, C, G, H, I | not built |
| ShimuraCompactifications:C5 | 5 | 8 | 0 | B, C, G, H, I | not built |
| ShimuraCompactifications:C6 | 6 | 11 | 3 | B, C, G, H, I | not built |
| ShimuraData:D0 | 5 | 17 | 3 | A, C, G, I, J | not built |
| ShimuraData:D1 | 7 | 24 | 2 | A, C, G, I, J | partly built |
| ShimuraData:D2 | 5 | 18 | 3 | A, C, G, I, J | not built |
| ShimuraData:D3 | 6 | 12 | 1 | A, C, G, I, J | not built |
| ShimuraData:D4 | 4 | 9 | 0 | A, C, G, I, J | not built |
| ShimuraData:D5 | 8 | 21 | 3 | A, C, G, I, J | not built |

Near-match triage included Weil-pairing and Bruhat–Tits TODO/provenance comments, Tate-ring modules rather than abelian-variety Tate modules, toroidal knot grids rather than toroidal compactifications, Shimura bibliographic citations rather than Shimura data, and condensed locally constant presheaves rather than the required curve-local-system realization. These were not counted as implementations of the missing targets.

## Validation

The red-team schema check and intake file checks pass for the two deliverables. All 48 stage IDs and all 80 duplicate destinations resolve; the integrated target text/status/note projection agrees with the accepted audit. Source hypotheses, finding locators and the limited proposed fixes were reread. No Lean file was changed or compiled. Only the two issue deliverables are submitted.
