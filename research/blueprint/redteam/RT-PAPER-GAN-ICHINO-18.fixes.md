# RT-PAPER-GAN-ICHINO-18: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4987, job FIX-RT-PAPER-GAN-ICHINO-18).
- **Findings:** `RT-PAPER-GAN-ICHINO-18.result.json`.
- **Verdicts:** `RT-PAPER-GAN-ICHINO-18.review.json` (REV-RT-PAPER-GAN-ICHINO-18, Codex). The red team has twelve
  findings, all confirmed. This job applies the six medium ones, which are the ones the issue lists. The six low
  findings are not part of it; among them is /12, the missing `sourceVersions`. Where the verifier corrected a fix,
  I applied its version.
- **Files changed:** `papers/PAPER-GAN-ICHINO-18.result.json`, and `papers/PAPER-GAN-ICHINO-18.md`, which gets a
  new closing section.
- **Result:**
  - 112 items (1 library, 21 planned, 90 missing), up from 104;
  - eight routes, up from six;
  - 49 prerequisites.
- **Independence.** I did none of:
  - the extraction (cc-d67081);
  - its review (cc-39fac3 and cc-d67081);
  - the red team (cc-f805bf);
  - the verification.

## /1 (medium, error): MP.3 depended on its own Part II

- **`metaplectic-induction` is split.**
  - Its local part now goes to MP.3 (route 2). That part covers:
    - P̃ and M̃ = G̃L_{k_1} ×_{μ₂} ⋯ ×_{μ₂} Mp_2n0;
    - the genuine irreducibles of M̃;
    - χ_ψ built from MP.2's Weil index;
    - normalized induction on the cover, on top of SR.2.

    MP.3 needs this for its Jacquet filtrations (`kudla-filtration`, already planned there) and for the items
    stated through it.
  - The new item `metaplectic-induction-adelic` holds P̃(A), the global χ_ψ and Ind_{P̃(A)}. It stays in route 1.
- **`unramified-theta` and `rev-unramified-theta-correspondence-from-mp`** are restated with Satake exponents only.
  `rmk-5-3` (route 1) now defines the ψ-relative parameter from them.
- **`rev-dependence-of-theta-lifts-on` is split.**
  - It keeps ω_{ψ_{a²}} ≅ ω_ψ, θ_{ψ_{a²}} = θ_ψ and ϑ_{ψ_{a²}} = ϑ_ψ in route 2.
  - The new route-1 item `rev-square-class-labelling` takes the clauses that are not local statements: the
    Π_{φ,ψ}/π_η labelling, the Proposition 6.1 clause and the global choice of Ψ.
- **Route 2's reason** and route 1's brief (layer (1) and the MP.3 import sentence) are updated.
- **Scope.** As the verifier notes, this repairs a dependency reversal at item level. It is not a cycle in the
  assembled stage graph.

## /2 (medium, missing): functional equation, ε-compatibility and the complete L_ψ

- **New item `gl-global-functional-equation`,** planned at AutomorphicLFunctionsAndLocalFactors:AL.2 (the adelic
  integral, analytic continuation and functional equation for cuspidal GL_n). It states:
  - L(s, τ) = ε(s, τ)L(1 − s, τ^∨), with ε a product of local factors independent of ψ;
  - entireness for m ≥ 2, with the m = 1 exception stated;
  - for self-dual τ, ε(1/2, τ) ∈ {±1}, and L(1/2, τ) ≠ 0 forces ε(1/2, τ) = 1.
- **`llc-gln-padic`** now includes L/ε-compatibility for pairs. It stays planned at ET.6, whose text includes that
  compatibility.
- **`llc-gln-arch`** now includes the archimedean ε-compatibility. It stays missing on route 5.
- **New route-1 item `complete-l-function-mp`,** the complete L_ψ(s, Π) = ∏_v L(s, ϕ_{Π_v,ψ_v}).
  - It includes the archimedean and ramified factors of llc-mp.
  - It gives the absolute convergence of the product, and its identity with L(s, Φ) = ∏ L(s, φ_i), which yields
    the continuation and the value at 1/2, as the verifier required.
  - It gives L(s, Σ) = L_ψ(s, Π) under θ, for Proposition A.1.
- **Notes updated:** `lemma-4-3`, `rev-epsilon-dichotomy-and-coherence`, `rallis-inner-product` and `prop-a-1` now
  name these inputs.

## /3 (medium, error): two statuses that were not really planned

- **`selfdual-types` is now missing** and routed to ML.4 (route 3), as the review had recommended. It imports AL.3's
  Rankin–Selberg theory. Its note names the analytic inputs ML.4 must plan:
  - Bump–Friedberg and Jacquet–Shalika (∧²);
  - Bump–Ginzburg (Sym²);
  - Shahidi's non-vanishing at s = 1;
  - Jacquet–Shalika §9.
- **`partial-l-function` is split.** It keeps the planned Euler-product definition at AL.4. The new route-1 item
  `mp-satake-exponent-bound` gives:
  - a uniform bound on the Satake exponents;
  - absolute convergence and non-vanishing of L^S_ψ(s, π);
  - the requirement, as the verifier asked, that the bound be proved independently of Theorem 1.1, for instance
    by E5's stable-range route (c = r₀ − 1/2 with r₀ = 2n + 2, so r > 3n + 2).

  `prop-3-1`'s note depends on it.

## /4 (medium, missing): unitarity of π_{φ_v}

- **New route-1 item `unramified-unitarity`:** for almost all v, π_{φ_v} is unitary. It follows the verifier's
  corrected outline:
  - real and imaginary exponents come from the Lapid–Muić–Tadić criterion;
  - quadruples ±x ± iy come from unitary induction through G̃L₂ of a GL₂ complementary series;
  - x + πi/log q comes from the change of additive character by a nonsquare unit u, since χ_ψ times the unramified
    quadratic character is χ_{ψ_u}. The red team's outline had dropped this case.
- **A gap I found in that outline.** Changing ψ to ψ_u twists every coordinate. So the reduction covers the twisted
  case only when no real exponent 0 < x < 1/2 occurs beside it outside the GL₂ blocks. The item records the mixed
  case as an open obligation, and does not claim it; it suggests the generic unitary dual of Lapid–Muić–Tadić as a
  possible route. The verifier and the original review did not raise this.
- **Inputs:**
  - rmk-5-3;
  - the local metaplectic induction (now at MP.3);
  - the Jacquet–Shalika bound;
  - Tadić's generic unitary dual of GL_n, routed to ET.6 by PAPER-JIANG-ZHANG-20. This is an assigned input, as
    the verifier said, not a built theorem.
- **Also changed:** `cor-4-2`'s note depends on the new item, and Tadić [86] (Ann. Sci. ÉNS 19 (1986), DOI checked on
  Crossref) is added to the prerequisites.

## /5 (medium, duplicate): weak containment and Poincaré series

- **Weak containment.** Clause (iii) of `rev-whittaker-plancherel-support-and-weak` becomes the new item
  `weak-containment-fell-closure`. It goes to a new route 7: part-ii SmoothRepresentationsPartIIUnitaryDual, joining
  PAPER-GAN-SAVIN-23-B route 3 under the same title and area.
  - The item and the route's brief state the result for second-countable locally compact groups (Bekka–de la
    Harpe–Valette), so that Mp_2n(F_S) and its products with compact groups are covered.
  - It is in the Fell-closure form, with isolation relative to the closure. The verifier showed the
    increasing-index subsequence form is false.
  - Only this abstract API is generalized.
  - The Mp_2n-specific isolation stays in `ilm-globalization-inputs` (b).
- **Poincaré series.** The construction has one owner: this Part II's globalization layer (8). Route 1's brief and
  the `rev-whittaker-poincare-series-on-mp` note state it for a reductive group or finite central cover with a
  Whittaker datum or a spherical subgroup, and keep the support, convergence and cuspidality hypotheses.

**For the maintainer.**
- Record in PAPER-GAN-SAVIN-23-B that its item 91 imports the Poincaré-series construction from this Part II. That
  file is not a deliverable here.
- Record a verdict for route 7.

## /6 (medium, duplicate): the Langlands quotient theorem for covers

- **`langlands-quotient-covers`** is routed to SR.3 by a new source route 8. It is stated for finite topological
  central extensions in characteristic zero, the hypotheses the verifier took from Ban–Jantzen, with the linear case
  as a special case.
  - It stays missing until SR.3 plans that generality.
  - PAPER-GAN-SAVIN-23 already routes the linear theorem to SR.3.
- **New route-1 item `mp-standard-modules`** keeps the Mp_2n standard modules Ind_P̃((τ₁|det|^{s₁} ⊗ ⋯) ⊗ χ_ψ ⊗ π₀).
- **Route 8's reason** says that the doubling Part II (PAPER-CAI-FRIEDBERG-KAPLAN-24) should import the p-adic
  theorem from SR.3. Its archimedean classification keeps its own sources, as the verifier said.

**For the maintainer.**
- Record verdicts for routes 7 and 8.
- Tell the doubling Part II's design job to import the p-adic Langlands quotient theorem from SR.3.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-GAN-ICHINO-18.result.json`: ok. Every missing item
  is routed exactly once, and no planned or library item is on a route.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON keeps the file's own formatting (indent 1, UTF-8).
- I did not re-read the paper. Locators and quotations are the red team's and the verifier's.
