# Handoff — BP-DrinfeldModulesAndTModules--DM.0 (part 1: DM.0–DM.7)

Claude Code, cc-fb70e5, 2026-09-28. Issue #1008; claim comment 5871803158, confirmed by the bot.
First checkpoint of a fresh packet, status `partial`. No earlier packet, integrated decomposition or
draft existed for this part; the DM.8 part (Codex, #1009) is separate and was left untouched.

## What is closed

**Layer DM.0, decomposed to declarations:** 13 nodes (4 definitions, 3 constructions, 6 theorems),
61 API items, 28 unit tests and 6 planets. Every chain ends in the pinned baseline (25 Mathlib
declarations, each read at 082e2d37) or in one requested FunctionFieldArithmetic stage.

| node | kind | what it plans |
|---|---|---|
| `frobenius-action` | construction | the q-power Frobenius as a `MulSemiringAction (Multiplicative ℕ) L`, a def (not an instance), from `FiniteField.frobeniusAlgHom` |
| `twisted-polynomial-ring` | definition (planet) | `L{τ}` = Mathlib's `SkewPolynomial L` with that twist; τ, C, ∂, deg_τ, leading coefficient, `F_q`-algebra |
| `tau-degree-mul` | theorem | deg_τ is additive and the leading coefficient twisted, over a domain; no zero divisors; units are constants |
| `twisted-polynomial-eval` | construction | `evalEnd : L{τ} →ₐ[F_q] End_{F_q}(L)` and q-polynomials `toPolynomial`, with product ↦ composition |
| `twisted-polynomial-eval-injective` | theorem | both maps are injective (evalEnd over an infinite domain) |
| `additive-polynomial-characterisation` | theorem (planet) | `F_q`-linear polynomials over an infinite field are exactly the q-polynomials |
| `drinfeld-module` | definition (planet) | Drinfeld A-modules over a fixed γ : A → L, characteristic ideal, the module (φ, L), base change |
| `rank-polynomial-ring` | theorem | for A = F_q[t]: deg_τ φ_a = r · deg a with r = deg_τ φ_t ≥ 1, and the leading coefficient |
| `rank-general` | theorem | for general A with an F_q-rational ∞: q^(deg_τ φ_a) = #(A/(a))^r (needs FA.1) |
| `rank` | definition (planet) | the rank |
| `carlitz-module` | construction (planet) | t ↦ θ + τ, rank 1, generic iff θ transcendental, special-characteristic inseparability |
| `drinfeld-module-hom` | definition (planet) | Hom as an F_q- and A-module, End as an A-algebra, isogenies, isomorphisms |
| `isogeny-rank` | theorem | isogenous Drinfeld modules have equal rank |

The roadmap's DM.0 acceptance tests are unit tests: the Carlitz rank, multiplication and kernel degree
are `rank.test_carlitz`, `carlitz.test_t_squared` and `rank.test_kernel_degree`, and the
special-characteristic inseparability is `carlitz.test_special_char`.

## Design decisions a continuation should keep

- The Frobenius twist is a `def` (`frobeniusAction`) used as a local instance inside
  `TwistedPolynomial K L`, never a global instance on `L`. Everything reuses `SkewPolynomial`'s API.
- A Drinfeld module is a structure over a fixed characteristic map `γ` (the source's ι), with an
  explicit `nonconstant` field. The source's definition would admit the constant map (rank 0), and
  the node excludes it; the unit test `drinfeldModule.test_constant_not_module` guards this.
- The rank in the suggested file is defined for A = F_q[t]. For general A it is the `r` of
  `rank-general`, whose Lean signature waits for FunctionFieldArithmetic:FA.1's ring A (request).

## What remains, precisely

- **DM.0:** kernels of φ_a and of isogenies as closed subgroup schemes of G_a (Tau Ceti's
  `TauCeti.AdditiveGroup` and group-scheme kernels), of order q^(r deg a); the relative definition
  over a base S (line bundles, invertible leading coefficient) and its base change; separability of
  isogenies in generic characteristic; the Frobenius isogeny in special characteristic; and the rank
  theorem for a non-rational ∞.
- **DM.1–DM.7:** `not_read`. The named routes (Drinfeld 1974, Rosen chs. 12–13, Goss, Taguchi) have no
  public copies (gap). Public candidates: Pink arXiv:1008.0013 (DM.3), Taelman arXiv:1004.4304 (DM.6),
  Anderson–Brownawell–Papanikolas arXiv:math/0207168 and Brownawell–Papanikolas §§3–4 (DM.4).
  Brownawell–Papanikolas §2.4, already read, states the DM.2 lattice theory and outlines Drinfeld's
  uniformization theorem.
- **Requests:** FunctionFieldArithmetic:FA.1 (the ring A, deg, the uniqueness of the place at ∞,
  and Riemann–Roch existence of elements of each large degree). FunctionFieldArithmetic has no packet yet.
- **Gaps:** proofs of the additive-polynomial characterisation and of the general-A rank theorem were
  not checked against a published proof (Goss and Papikian are not freely available); and there are
  no public sources for DM.1–DM.3 and DM.5.

## Sources

Brownawell–Papanikolas, arXiv:1806.03919v1 (the only version), sha256 `08b68132…272b82d`: I read
§1, §§2.1–2.5 and §3.1 in full. I found no source issues in those sections, so `sourceIssues` is
empty (checked, none found). Library statements: `SkewPolynomial` (Basic.lean in full: X_mul,
monomial_mul_monomial, CRingHom, coeff), `SkewMonoidAlgebra`'s ring instances, `frobeniusAlgHom`,
`pow_card`, `frobenius_inj`, the polynomial root lemmas, and AUDIT-20's DM.0/DM.1 rows.

## Checks

- `check_blueprint --index <pinned declaration index>`: 0 errors, 0 warnings.
- `intake.py check-files` on the four deliverables: 0 problems.
- Every node id, API name and unit-test name appears in the suggested file (checked by script).
- **The suggested file was not compiled.** No build at the pinned commits exists on the machine that
  wrote it, and the shared-server rules forbid making one. Its header says so, and the first worker
  with a pinned build should elaborate it.
