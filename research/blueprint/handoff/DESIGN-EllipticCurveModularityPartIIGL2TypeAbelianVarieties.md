# DESIGN-EllipticCurveModularityPartIIGL2TypeAbelianVarieties — design and complete blueprint

Issue #6899. Agent: Claude (Claude Code, Opus 5.5), session `claude-hllDxz`. Date: 7 October 2026.

## What was done

New roadmap **Modularity and modular parametrisations of elliptic curves over Q, Part II: abelian varieties of GL₂-type** (`EllipticCurveModularityPartIIGL2TypeAbelianVarieties`, area `automorphic`, parent `EllipticCurveModularity`), with its definition, a complete blueprint packet (status `complete`), the reader document and the suggested Lean file.

Six layers, all `planned`:

- **GT.1** Abelian varieties of GL₂-type and their endomorphism algebras (Ribet §2): Lie-algebra divisibility, primitivity and the power construction, Ribet's Theorem 2.1, the endomorphism field (totally real or CM, Rosati = canonical involution), A_f of GL₂-type with End⁰ = K_f and the isogeny decomposition of J₁(N).
- **GT.2** The λ-adic system (Ribet §3): integral model with End = 𝒪_E, E-rational Frobenius polynomials, det = εχ_ℓ (Lemma 3.1), oddness (3.2), absolute irreducibility (3.3), a_p = ε(p)ā_p (3.4), E = ℚ(a_p) (3.5), F totally real and E/F abelian (3.6), residual irreducibility (3.7), bounded conductors, crystalline with weights (1, 0).
- **GT.3** Modularity (Ribet §4, KW Cor. 10.2(i)), proved by generalising the parent's R29.2–R29.6 step by step: residual Serre witnesses of weight two at bounded level, one recurring newform, exact coefficients K_f ≅ E, Tate-module comparison, Faltings' isogeny criterion; equivalent forms of modularity, characterisation of the simple quotients of J₁(N), the Γ₀ case (Serre's Théorème 5, the inherited target recorded by `EllipticCurveModularity:R29.6/what-theoreme-4-asserts-and-its-scope`), the modular parametrisation.
- **GT.4** Conductors (Carayol): cond(A) = N_f^{dim A}, exact level cond(A)^{1/dim A} (KW's M^n is valid but not least for dim ≥ 2), strict compatibility in KW's sense as a corollary of modularity, L(A, s) = ∏ L(f^σ, s), compatibility with the parent in dimension one.
- **GT.5** Ribet's ℚ-curves (§§6–7): definition, the cocycle, Tate's theorem in the form H²(G_ℚ, ℚ̄^×) = 0, the twisted group algebra End⁰(Res_{K/ℚ}C₀) (Lemma 6.4), Proposition 6.5/Corollary 6.6, Theorem 6.1, Corollary 6.2 (unconditional), the quadratic case (Lemma 7.1, Serre's Proposition 7.2).
- **GT.6** Modularity of ℚ-curves over their field of definition: twisting lemma, Galois form, automorphy for solvable Galois K/ℚ by twisted base change (cuspidal, parallel weight two, equal L-functions at every place), and quadratic ℚ-curves are modular — the step `EllipticCurveModularityImaginaryQuadratic` imports for Caraiani–Newton Cor. 7.2.5/7.3.4.

Inventory: **44 nodes** (3 definitions, 3 constructions, 3 lemmas, 34 theorems, 1 application), **39 API items, 24 unit tests, 14 planets**, 17 baseline declarations, 5 sources, **14 requests, 0 gaps**, 2 source issues.

## Ownership decisions (build on, never duplicate)

- The GL₂(K)-type definition and V_λ are imported from `SmallRamificationAndAbelianVarietyBaseCases:R25.5/gl2-type-abelian-variety` (accepted); λ-components, A[λ] and the totally real determinant from `ArithmeticGaloisRepresentations:R01.6/tate-module-with-endomorphism-coefficients`, whose parts (e) and (f) explicitly leave Ribet's Lemma 3.1 and E-rationality to another layer — they are planned here (GT.2). Freeness of V_ℓ over E ⊗ ℚ_ℓ: `AbelianSchemesAndArithmeticModuli:A6/trace-and-degree-on-a-subfield`.
- **Route of the main theorem.** The brief suggested applying KW Theorem 10.1(i) (owned by `ClassicalSerreModularity:R27.6/scope-of-the-final-statement-and-the-compatible-system-export`). KW's "compatible system" (§5, and `PotentialModularityAndCompatibleSystems:R24.5/compatible-system`) requires E-rational Weil–Deligne comparison at every prime of bad reduction, which neither KW nor Ribet proves for V_λ(A) before modularity (source issue E2). GT.3 therefore follows Ribet's own proof of Theorem 4.4, which is exactly the shape of the parent's R29.2–R29.5 and needs only the strong Serre theorem (`R27.6/full-classical-serre-theorem`), Serre's weight-two criterion (`AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`), bounded conductors and Faltings' ℓ-adic isogeny criterion; the KW-sense strict compatibility is GT.4/strict-compatibility, a corollary.
- Ribet's Lemma 3.7 uses Faltings' mod-ℓ theorem; no layer plans it, but `FaltingsFinitenessAndIsogenyTheorems:R28.6/commutant-statement-for-almost-all-primes` implies it, so no request was needed. Ribet's §4 Faltings mod-ℓ step is replaced by the parent's characteristic-zero argument (pigeonhole over the étale algebra K_f ⊗ E and `EllipticCurveModularity:R29.3/algebraic-integer-norm-vanishing`).
- Lemma 3.1 is planned through `FaltingsFinitenessAndIsogenyTheorems:R28.2/l-adic-characters-of-the-absolute-galois-group-of-q-are-cyclotomic-up-to-finite-order` and Hodge–Tate weights instead of Serre's locally algebraic characters (no owner for the latter).
- ℚ-curves, End⁰(A_f) = K_f, cond(A_f) = N^{dim A_f}, Tate's theorem with ℚ̄^× coefficients and the modularity notion for GL₂-type varieties had no owner (supplier search) and are planned here.

## Requests to other roadmaps (14)

- `AbelianSchemesAndArithmeticModuli:A6` — **new content**: complex uniformization, Hodge decomposition of H₁(A(ℂ), ℚ) and the End- and complex-conjugation-equivariant comparison T_ℓ(A) ≅ H₁(A(ℂ), ℤ) ⊗ ℤ_ℓ (used by GT.2/odd and GT.5/quadratic-q-curves). No layer of the atlas plans it.
- `AbelianSchemesAndArithmeticModuli:A3` (quotients by finite subgroups; stage not yet in a packet) and `A1` (one-dimensional abelian varieties = elliptic curves).
- Tau Ceti layers cited as whole layers: ModularForms layers 0, 3, 4, 5, 6, 7; Chebotarev layer 10; ClassFieldTheory layer 11; ProfiniteCohomology layer 10; JacobianChallenge layers E and F.

Everything else is cited by exact node id (R25.5, R01.1–R01.6, A2/A6, R28.2–R28.6, R14.2–R14.6, R19.1–R19.6, R27.6, R15.4, R24.5, R11.1–R11.6, R06.2–R06.6, R17.4–R17.6, R29.3–R29.6, PELModuli M0). Several supplier packets are partial or not yet reviewed (AbelianSchemesAndArithmeticModuli, ModularCurvesPartII, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, FaltingsFinitenessAndIsogenyTheorems, PadicHodgeTheory); the coverage records name the dependence.

## Source issues

- E1 (misprint, KW §10.2): "We recall than" for "that".
- E2 (gap, KW §10.2 with §5): Corollary 10.2(i) is deduced from Theorem 10.1(i) without verifying the Weil–Deligne condition (ii) b) at primes of bad reduction; Ribet's "strictly compatible" is Serre's notion at good primes. The conclusion is unaffected (Ribet's route).

## What remains

Every stage is `planned`; the `remaining` lists name the lemma-level refinements (Ribet 2.1 split into lemmas, the étale-algebra pigeonhole and newform finiteness, conductor additivity under restriction of scalars, Ribet's omitted Proposition 6.5 computation, the archimedean component of base change) and the dependence on the A3/A6 requests and on unreviewed supplier packets.

## Suggested Lean file

`research/blueprint/suggested/EllipticCurveModularityPartIIGL2TypeAbelianVarieties.lean` (1696 lines, Mathlib-only imports) **elaborates** with `lean-check` (`lake env lean` in the shared build at Mathlib 082e2d3): 0 errors, and the only warnings are `declaration uses sorry` (103). Tau Ceti's `AbelianVariety`, `TangentSpace`, `IsIsogeny` and `HeckeRing.GL2.Newform` are not compiled in that build, so the file prototypes against a data-only carrier `TauCeti.GL2Type.AVContext` (a ℚ-linear category of abelian varieties up to isogeny, Tate modules with Galois and endomorphism actions, λ-adic representations in embedding form, conductors and Euler polynomials, J₀(N)/J₁(N), newforms and A_f, automorphic representations over K); no field states a theorem, and the file contains no `True` or `Prop`-valued placeholder. A coverage script confirms every API name (39), every node theorem name (38, lowerCamelCase of the node slug) and every unit test (24, as `-- test:` comments) appears.

Prototyping found five packet statements to tighten, all corrected in the packet before submission: levels in `IsModularOfLevel.mono` must be positive; the power constructions for two bases are E-equivariantly isogenous, not isomorphic; Ribet's Lemma 6.4 needs K enlarged so that the splitting α factors through Gal(K/ℚ); the degree of the endomorphism field is a separate API item `endField_finrank`; J₁(N) = 0 exactly for N ≤ 10 and N = 12 (not only N ≤ 4). Parts the carrier cannot type are omitted with a comment at each place (Hecke-operator form of J₀(23)'s action, lattice independence of ρ̄_λ, curve-level parametrisation stated through J₁(N) → A, R-equivariance in Ribet 6.5, Π as an explicit twisted base change in GT.6, stated instead through matching local factors).

## Sources read (all public, fetched 2026-10-07)

- Khare–Wintenberger, Serre's modularity conjecture (I), authors' copy results.pdf (sha256 3c389dc3…): §1, §5, §10.
- Ribet, Abelian varieties over Q and modular forms, author's manuscript korea.pdf (sha256 4c491a52…): all of §§1–8.
- Carayol 1986, Numdam (sha256 d4a5fb6b…): §0 (0.4–0.8, Théorème (A), Corollaire 0.8).
- Freitas–Le Hung–Siksek arXiv:1310.7088v4: §1, §11 (before Lemma 11.1), §12 opening.
- Caraiani–Newton arXiv:2301.10509v3: §1, Corollaries 7.2.5 and 7.3.4.

Not read: Serre's Duke 1987 paper (Théorème 5 is cited through the parent's node), Shimura's book (Theorem 7.14), Ribet 1980 (Cor. 4.2, replaced by a Faltings argument), SGA 7 IX (cited through NeronModelsAndSemistableAbelianVarieties R11.5–R11.6); no free copies were sought for them because the plan imports those results from owning layers.

## Checks run

- `python3 scripts/check_blueprint.py <packet> --index …/declarations.tsv`: 0 errors, 0 warnings.
- Every excerpt was located in the pdftotext of its source and its page checked against the locator (scripted).
- Reader rendered from the packet and scanned for the words the protocol forbids.
- `research/blueprint/intake.py check-files` on the five files: 5 file(s), 0 problem(s).
