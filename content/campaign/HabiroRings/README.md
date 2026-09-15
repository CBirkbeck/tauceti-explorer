# Habiro rings: relative arithmetic constructions and cohomological coefficients

This is the core of the standalone **Habiro rings and cohomology** family. Its new mathematical content is the relative Habiro ring of an étale algebra over a perfectly covered Λ-ring, together with cyclotomic descent, derived-complete coefficients and the ring–cohomology interface. It is not another copy of the classical completion or of the number-field construction. The ring foundation can be developed without first completing algebraic K-theory; K₃ enters the separate arithmetic line-module application.

| Canonical owner | Construction owned there |
| --- | --- |
| [HabiroCyclotomicCompletions](../HabiroCyclotomicCompletions/README.md) HC.1–6 | Classical cyclotomic completions, Taylor/evaluation maps and rigidity |
| **HabiroRings** HR.1–7 | Relative étale Habiro rings, cyclotomic derived descent and coefficient interfaces |
| [HabiroNumberFields](../HabiroNumberFields/README.md) HB.1–2,6–7 | Explicit GSWZ number-field Frobenius gluing, finite regulators and K₃-indexed modules |
| [HabiroNahmSeries](../HabiroNahmSeries/README.md) HB.3–5,8–10 | Nahm sums, admissible series and arithmetic applications |
| [HabiroCohomologyFoundations](../HabiroCohomologyFoundations/README.md) HQ.1–8 | Global q-de Rham, q-Hodge filtrations, positive-degree q-de Rham–Witt and Habiro cohomology |

Primary proof sources are Wagner, [q-Hodge complexes over the Habiro ring, v2](https://arxiv.org/abs/2510.04782v2), especially §2, §3.1 and Appendix B; [q-Witt vectors, v5](https://arxiv.org/abs/2410.23078v5); Habiro, [Cyclotomic completions](https://arxiv.org/abs/math/0209324); and Garoufalidis–Scholze–Wheeler–Zagier, [Habiro ring of a number field, v2](https://arxiv.org/abs/2412.04241v2). Downloaded versions and inspection qualifications are in the addition audit and the reference register. New-paper targets are explicit formalization goals, not claims of an existing Lean implementation.

## HR.1. Relative bases and local Frobenius

Construct the category of torsion-free Λ-rings A with commuting Adams operations ψ^m, recording the Frobenius congruences and composition law. Here Λ-ring means arithmetic λ-ring, not an Iwasawa algebra. Prove the source's equivalent descriptions of **perfectly covered**: a faithfully flat Λ-map to a perfect Λ-ring, and faithful flatness of every ψ^m. Include ℤ, free Λ-rings and toric polynomial examples; do not assume every Λ-ring has this property. The generic δ-ring API is imported from [PrismaticCohomology](../PrismaticCohomology/README.md) PR.0, while the commuting all-prime Λ-structure belongs here.

For an étale A-algebra R, construct the uniquely extended Frobenius lift φ_p on its p-adic completion. Prove that the linearized relative Frobenius

    (R̂_p ⊗_(A,ψ^p) A)^∧_p → R̂_p

is an equivalence, with its functoriality, base-change squares and prime-power iterates. Keep completed tensor products explicit. There need not be global Frobenius endomorphisms of R. Morphisms of pairs (A,R) include their Λ-compatibility, and all subsequent maps are natural for these actual morphisms.

## HR.2. Habiro-complete modules and derived detection

Import the ordinary inverse-limit completion from HC.1, generic enhanced module/localization machinery from [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) E0/E5:abstract (not the late spectra return), and **generic derived completion** from [DerivedDeRhamCohomology](../DerivedDeRhamCohomology/README.md) DD.1. Construct its Habiro-specific counterpart over A[q,q⁻¹]: M is Habiro-complete when its derived Hom from the localization inverting every q^m−1 vanishes. Prove the specialized left-adjoint completion construction, its idempotence, the limit description by (q^m−1)-completions indexed by divisibility, and the cofinal Habiro-factorial tower. Prove q invertible in the completed coefficient ring; do not confuse completion with adjoining inverses of q^m−1.

Formalize Wagner Appendix B: the two-term resolution of the localized module; completeness detected on homotopy groups (B.2); joint conservativity of cyclotomic reductions (B.3); and detection of degree bounds/staticity by these reductions (B.4). Supply all derived-limit corrections rather than replacing a derived inverse limit by an ordinary inverse limit without proof. Build the completed tensor product and its symmetric monoidal category with the appropriate unit.

The spectral version imports [StableHomotopyKTheory](../StableHomotopyKTheory/README.md), with the same localization comparison proved rather than assumed. The solid-tensor comparison of B.8 is a **bounded-below** extension using [VStackSheavesAndLisseCategories](../VStackSheavesAndLisseCategories/README.md) VS2's qualified solid formalism; neither unrestricted unbounded preservation nor naive solid modules over every coefficient ring are asserted.

## HR.3. Finite cyclotomic arithmetic descent

For a positive integer m use the finite divisor poset and the closed cyclotomic subsets Φ_d(q)=0, d∣m. Prove the localization/completion intersection calculations: different prime-to-p parts have empty p-adic intersections, and the surviving intersections are organized by prime-power chains. Specialize the generic finite-localization descent argument to these actual coefficient categories, proving joint conservativity and the right-Kan-extension conditions.

Prove Wagner Corollary 2.4: derived Φ_d-complete E∞ A[q]-algebras E_d, with the specified prime-edge equivalences between their p-completions for pd∣m, reconstruct a unique (q^m−1)-complete algebra with those cyclotomic completions. The source's reduction of higher compatibility to this particular divisor diagram must be proved; it is not permission to glue arbitrary pairwise isomorphisms without coherence. Construct the comparison equivalence and its morphism-level universal property, not only an object having the expected completions.

## HR.4. Relative q-Witt rings and finite étale lifts

Own the **degree-zero** relative q-Witt rings qW_m(R/A), their functoriality and Frobenius/Verschiebung operators in the exact domains of Wagner's q-Witt source. There is no compatible extension of ordinary Witt restriction maps to this q-Witt theory (q-Witt v5 §1.3); prove the source's obstruction, not a fictitious Res_(m/d) API or an unrestricted big q-Witt ring. Build the defining quotient/universal construction and prove the ghost description under its torsion hypotheses. The positive-degree q-de Rham–Witt complex is HQ.4's extension of these rings, not a second construction of qW_m.

For the perfectly covered Λ-base and étale R of HR.1, form

    E_d = (R ⊗_(A,ψ^d) A)[q]^∧_(Φ_d(q)).

Use relative Frobenius to supply HR.3's prime-edge maps. Construct H_(R/A,m) and prove Wagner Theorem 2.9: it is static, is the unique completed étale lift in the specified category, and

    H_(R/A,m)/(q^m−1) ≅ qW_m(R/A).

Construct every transition H_(R/A,m)→H_(R/A,d) for d∣m, prove composition, and identify its quotient map with **F_(m/d)** on q-Witt rings (Remark 2.10), not the restriction operator by name. Prove naturality of the quotient theorem and invariance under equivalent étale presentations. The staticity proof must use HR.2's detection result, not assume completion is t-exact on arbitrary inputs.

## HR.5. The relative Habiro ring and its Taylor presentation

Define H_(R/A)=lim_m H_(R/A,m), proving that the divisor system and a cofinal factorial sequence give canonically equivalent limits. Establish its complete-ring universal property and all continuous functorial maps inherited from the relative étale construction. Prove base change under the precise flatness/completion hypotheses supported by the construction; no unrestricted tensor-product formula is a default API.

Prove the equalizer presentation of Wagner Lemma 2.12 by compatible cyclotomic Taylor series with coefficients twisted by ψ^m. Its two arrows are the canonical completion/re-expansion arrow and relative Frobenius followed by re-expansion. Construct root-of-unity choices and prove their change-of-choice invariance; prove convergence of the p-adic substitutions. Work with the **full cyclotomic coefficient algebra**, or all of its finite étale factors, rather than silently selecting one p-adic root embedding.

The p.18 proof line claiming Φ_m irreducible modulo every ℓ∤m needs a local repair: it is separable and its quotient algebra is finite étale, but it can split (e.g. Φ₅ over 𝔽₁₁). Prove the arithmetic fracture step componentwise with idempotent descent and reassemble the full algebra. This is a proof obligation in the adopted route, not a claim that the equalizer theorem is false.

<a id="stage-HR.5-number-field-comparison"></a>

**Number-field comparison (HR.5-number-field-comparison).** Recover classical H_ℤ (Remark 2.14) using HC.1–4. Recover the explicit GSWZ ring for R=O_F[1/disc(F)] (Corollary 2.13) by comparison with HB.6's already-constructed Frobenius-glued ring. Ring comparison requires the discriminant inversion here; later regulator/K₃ modules retain their stronger excluded-prime hypotheses. Do not impose a naive R-algebra structure unless a separate theorem supplies compatible global Frobenius lifts.

## HR.6. Coefficient and cohomology interfaces

After HQ.1–5, prove the étale degree-zero identification of q-Hodge/Habiro cohomology with HR.5 (Wagner Corollary 3.13), including multiplication, every cyclotomic specialization, the q−1 completion and functoriality in pairs (A,R). HQ constructs the cohomology functor and its filtered comparisons; this milestone identifies its coefficient object with the independently constructed relative ring.

Export complete modules, derived scalar extension, perfect complexes and invertible-module comparisons to Habiro cohomology. Import HB.7's actual K₃-indexed modules and prove only the scalar-extension/Picard comparisons supported there; do not construct a new K₃ group or assume every module is free. Explain by an actual completion map what information can disappear after q−1 completion. A K₃-indexed line module is not automatically a higher-degree cohomology class on a scheme.

This is a **late return edge**, not a cycle in construction: HR.1–5 precede HQ.3–5; HR.6 consumes those completed stages. The generic crystalline, A_inf and prismatic comparison maps enter through HQ.8 and their own owners, not through another construction inside Habiro rings.

## HR.7. Acceptance tests and executable boundary

Required tests: A=R=ℤ; a nontrivial finite étale arithmetic R; a toric Λ-base; localization at a prime and the resulting cyclotomic component behavior; Φ₅ over 𝔽₁₁ to guard the finite étale/field distinction; two elements with the same value at one chosen root but unequal full Taylor expansions there; and the zero-dimensional cohomology comparison. Check the q-Witt transition is Frobenius, all square diagrams commute and no ring action uses incompatible constant families.

Suggested.lean proves a concrete equalizer-ring universal property on current Mathlib. Its input maps will later be instantiated by the actual canonical/Frobenius Taylor maps of HR.5. The generic equalizer alone is not a Habiro construction; all coefficient, topology, completion and descent contracts above remain required. No placeholder proposition or axiom stands for them.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `HR.3` | Make the divisor-poset descent produce morphisms and higher compatibility, not just a reconstructed coefficient object. Verify prime-edge compatibility on every surviving p-adic overlap. |
| `HR.5` | Replace the irreducibility shortcut by the finite-étale algebra decomposition: factor Φ5 mod 11, retain all idempotent factors, prove the completion/Taylor comparison on each factor and reassemble. |
| `HR.6` | Compare the already constructed relative ring with étale degree-zero q-Hodge cohomology and all specialization maps; this late comparison must not define either earlier object. |

**Producer–consumer handoff.** HQ.3 consumes HR.2–5; HR.6 returns only after HQ.3–5. K3-indexed modules enter HB.7 and do not become generic higher cohomology classes.

**Acceptance.** The Φ5 over F11 example must have four factors, not a single field. Test q-Witt transition Frobenius separately from nonexistent ordinary restriction.

**Source-readiness boundary.** Componentwise repair is a planned replacement proof, not an independently verified proof of the entire equalizer theorem.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
