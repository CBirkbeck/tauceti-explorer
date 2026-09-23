# LLHLM23 — current handoff

Claude Code — cc-fb70e5, issue #1254, 23 September 2026. Continues cc-d67081's second pass; claim 5802272463. Status **partial**.

Census unchanged in size: **580 items (86 library, 23 planned, 471 missing), 23 routes, 52 unreviewed findings**. This pass added no items and changed no routes; it proved two items that were outlines.

## Completed this pass

**A69 and A70 now carry step-by-step proofs**, which is resume item 1 of the previous handoff. Both are written in the style of A67/A68 and read against Cogdell's Fields Institute notes, Lecture 4.

- **A69** (injectivity), seven steps: `n = 1` base; the induction on mirabolic functions through A68's identity and its cuspidality descent; `C_e f ≡ 0`; A67's two-orbit decomposition making *every* Fourier coefficient vanish (the `0`-orbit is where cuspidality enters); A104's uniqueness half giving `f = 0`; and the cusp-form case by applying the mirabolic case to each right translate. Cogdell's one-sentence version is quoted (printed 31).
- **A70** (existence of the functional), five steps: convergence over the compact quotient with A105's probability measure and continuity from A106; equivariance as A66's identity at `g = 1`; nonvanishing from A69 via `Λ(Π(g)φ) = W_φ(g)`; and — the step worth keeping — why the *continuous* functional is the right object, since at an archimedean place the algebraic Whittaker functionals on K-finite vectors have dimension `n!` and only one extends continuously (Cogdell, printed 32, remark (ii)). That is now a fourth `non-example` test on A70.

**Locators verified rather than inherited.** Cogdell's Fields notes were fetched and read: PDF 35 = printed 31, PDF 36 = printed 32, PDF 37 = printed 33 with Corollary 4.1.2 and the displayed global functional. Both items' recorded locators are correct.

**Do not add a uniqueness claim to A70.** Local uniqueness (Gelfand–Kazhdan, Shalika; Cogdell Theorem 4.1) and its global corollary are separate imports; A70 needs existence only, and A71 is what carries genericity to the local components.

## Resume in order

1. **A73 is now the only step of the Whittaker chain still resting on an outline.** A66–A72 and
   A104–A107 all carry proofs or explicit suppliers; A71 was proved this pass. A73's conditional
   split-place genericity assumes "the exact Galois realization of all discrete Speh constituents
   needed by A62 has been proved and the stable residual lattice is absolutely irreducible", and
   that conditional shape should be made explicit as hypotheses rather than prose before it is
   proved. The valid Labesse branch uses [F+:Q]>1 and compactness at infinity.
2. Other queues, unchanged: `analytic-regularity-suppliers`,
   `approximation-and-tensor-adapter-closure`, `remaining-proof-leaves`,
   `closure-external-inputs`, per-item audit and shared-owner reconciliation.
3. Appendix B: uniform integral-parameter certificates, exceptional denominator loci, minimal
   primes and specialized Gröbner cases.

Last IDs: **A107**, **L86**, **E52**.

## This pass (third, cc-d67081)

A71 gained five proof steps, read against Cogdell's Fields notes printed 33. The frozen-vector
step is the one that matters: `Λ ≠ 0` plus the spanning of elementary tensors gives `x_0, w` with
`Λ(x_0 ⊗ w) ≠ 0`, and **for a general `w` the functional `x ↦ Λ(x ⊗ w)` can be identically
zero**, which is why the item's warning about an arbitrary reference tensor is load-bearing.
Equivariance then needs only A107's hypothesis that `N_n(F_v)` acts on the first factor and
`ψ_N|_{N_n(F_v)} = ψ_v`.

**Do not strengthen A71 to the factorization.** Cogdell's Corollary 4.1.3 factorises `W_φ` only
for decomposable `φ` and only for a *suitable* family, meaning `Λ_v(ξ_v^0) = 1` for the
distinguished `K_v`-fixed vectors. A71 claims existence at one place and neither the product
formula nor that normalisation. Cogdell's caveat on the same page — "the cusp form `φ(g)` itself
does not factor … Only `W_φ` factors for decomposable `φ`" — is the same one A107 carries, and
the two now agree in terms.

## Checks

- `scripts/check_paper.py`: ok. 580 unique item ids; every missing item routed exactly once (no duplicate route entries); prerequisite graph re-checked acyclic at 416 internal edges; **79** items now carry `proofSteps`.
- Only **A71** changed this pass: its `proofSteps` and `note`. All other statements, statuses, routes, findings and source data are byte-identical to the inherited file.
- Submit only the result, report and this handoff.

Earlier handoff history follows; its counters are superseded above.

---

# LLHLM23 — current handoff

Claude Code — cc-d67081, issue #1254, 23 September 2026 (second pass). Claim confirmed by the swarm bot. Status **partial**.

Current census: **580 items (86 library, 23 planned, 471 missing), 23 routes, 52 unreviewed findings**. This pass added no items and changed no routes; it proved out A67 and A68. All 576 inherited IDs and sourceData are preserved; `source`, `sourceIssues` and `sourceData` are byte-identical to the inherited file. All 163 definitions/constructions retain uses/API/at least three typed tests. No Lean deliverable required or compiled; no new formalization or independent review.

## Completed this pass (second pass, cc-d67081)

**A67 and A68 now carry step-by-step proofs.** They had no `proofSteps` at all — the
Piatetski-Shapiro–Shalika peeling and its inductive step were stated as planning adapters, which
is what the previous pass's resume item 1 flagged. Both now have a proof read against Cogdell's
proof of Theorem 1.1 (PCMI notes, printed 7–9), plus three typed tests each.

- **A67**, five steps: restriction keeping left `P_n(F)`-invariance and constant-term vanishing;
  Fourier expansion along `Y_n ≅ F^{n-1}` via **A104** on `(F\A)^{n-1}` against **A105**'s
  probability measure; vanishing of `C_0 f`, the only place cuspidality is used; the two-orbit
  decomposition giving `C_{eγ}f(p) = C_e f(diag(γ,1)p)` and the indexing by
  `P_{n-1}(F)\GL_{n-1}(F)`; and the conclusion, where **A104's uniqueness half** turns vanishing
  of all coefficients into `f(p) = 0` — the implication A69 consumes.
- **A68**, four steps: the equivariance `C_e f(yp) = ψ(y_{n-1})C_e f(p)`, giving left
  `Y_n(F)`-invariance *because* `ψ` is trivial on `F`; left `P_{n-1}(F)`-invariance of `f'_p`;
  descent of cuspidality with the `n = 2` base (`P_1 = {1}`, nothing to check); and the Whittaker
  identity by unfolding `N_n = N_{n-1} ⋉ Y_n`.
- **Do not weaken A105 to "an invariant measure exists".** A68's unfolding turns one integral over
  `N_n(F)\N_n(A)` into an iterated integral; if the three normalisations were independent the two
  sides would differ by a constant and the identity would be false. The test
  `A68.measure_compatibility_used` records that as a non-example.

## Completed in the first pass

The handoff's resume item 1 — A66–A73's global analytic suppliers — is closed. Four items supply what that chain had been asserting without one, and each goes to a layer whose own description already promises the general theorem, so all four are source additions and none needs new ground. Route 20's reason had already *named* two of them ("Import AL.0 Fourier uniqueness, AA.2 quotient measures") with no items to point at; those names now resolve.

- **A104** (owner `AutomorphicLFunctionsAndLocalFactors:AL.0`, new route): `γ ↦ ψ_γ` identifies `F` with the dual of the **compact** group `F\A`, so a continuous function with all Fourier coefficients zero vanishes — and likewise over the successive additive quotients of the unipotent filtration, which is the form A67/A68 consume. Uniqueness half only; do not claim pointwise convergence, and keep the continuity hypothesis, since an `L¹` function with vanishing coefficients vanishes only a.e.
- **A105** (owner `AdelicAlgebraicGroups:AA.2`, new route): the invariant quotient measure on `N(F)\N(A)` normalised to a probability measure, with the normalisations along a filtration with abelian successive quotients agreeing. This is what licenses A67/A68's iterated integration and A66's phrase "compatible with the successive additive quotients". Keep the unimodularity hypothesis explicit — the Borel of `GL₂` admits no invariant quotient measure.
- **A106** (owner `AutomorphicFormsOnReductiveGroups:AF.1`, added to route 20's stages): the Whittaker integral is **continuous** for the smooth moderate-growth Fréchet topology, the integrand being bounded on a compact domain by a defining seminorm. This is what makes A70's "nonzero continuous functional" meaningful. Do not weaken A70 to a functional on the `K_∞`-finite module: such a functional need not extend continuously.
- **A107** (owner `AutomorphicFormsOnReductiveGroups:AF.2`, route 20): the one-place grouping `V_Π ≅ V_{Π_v} ⊗_C V^v`, with the archimedean factor absorbed into `V^v`, which is why `V^v` carries only a smooth action and no topology. **Carries Cogdell's caveat verbatim: the decomposition is abstract and does not factor automorphic forms into products of local functions.** A71 depends on that reading — it chooses `w ∈ V^v` to detect a global functional, which is legitimate abstractly; never upgrade this to a factorization of forms.

A66, A69, A70 and A71 gained the new suppliers as prerequisites; no other inherited field of any item was touched.

Preserve the preceding A98–A103 residual-recognition/finite-module-topology work, the A86–A97 integral polarization/trace-algebra proofs, the normalized Speh formulas A78–A81 and the whole-isotypic monodromy formulas A82–A84. The valid Labesse branch uses [F+:Q]>1 and compactness at infinity. No unchecked use of withdrawn White is introduced.

## Resume in order

1. **A69 and A70 are now the frontier of this chain.** A67/A68 are proved and A104–A107 supply the analytic inputs, so A69 (injectivity, which is just the assembly of A67's conclusion over the induction) and A70 (the nonzero functional, which needs A106's continuity plus a nonvanishing argument) should be provable in the same style against Cogdell printed 9–11. A71's dependence on A107 is already explicit. Last IDs: **A107**, **L86**, **E52**.
2. Other queues, unchanged: `analytic-regularity-suppliers`, `approximation-and-tensor-adapter-closure`, `remaining-proof-leaves`, `closure-external-inputs`, per-item audit and shared-owner reconciliation. Keep bounded supplier reads and the inherited main-paper read attributed; do not restart as if unread.
3. Appendix B: uniform integral-parameter certificates, exceptional denominator loci, minimal primes and specialized Gröbner cases. Existing generic rational checks are insufficient.

## Evidence and checks

Bounded supplier reads only; the inherited main-paper reading stands and is not restated.

Second pass: Cogdell's proof of Theorem 1.1 read in full, PCMI notes printed 7–9 (PDF 11–13) — the restriction to `P_n`, the Fourier expansion along `Y_n`, the orbit decomposition, the `n = 2` base and the unfolding ending `W_{φ'_{δp}}(δ') = W_φ(δ'δp)`.

- Cogdell, PCMI notes (2002), SHA-256 `09b82f9aed494d28327ed9692f5bf37e6bed229cf470e80927e0cc10ce70932a`, Lecture 1 printed 5–6 (PDF 9–10). Printed page = PDF page − 4. **Warning for later workers: this PDF's text layer drops the letter `c` throughout ("Le ture", "multipli ity"); quotations must be read against the page image or reconstructed with care.**
- Cogdell, Fields Institute notes (2003), SHA-256 `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7`, Theorem 3.2 / Corollary 3.2.1 printed 23–24 (PDF 27), the Fréchet topologies on `(A^∞)^L` printed 24 (PDF 27), Theorem 3.4 printed 24–25 (PDF 28). Printed page = PDF page − 3. Text layer clean.

No new findings recorded: nothing in the supplier passages contradicts what the items assert, and the 52 inherited findings are unchanged.

Paper checker and intake pass. Verified this second pass: 580 unique IDs with none added and none lost, and **only A67 and A68 modified**, their `routes`, `sourceIssues` and `source` byte-identical to the inherited file; 416 internal prerequisite edges, all resolving to existing items and **acyclic**; all 23 routes' stages resolve against the atlas; all 471 missing items carry exactly one route, with no double-routing and no routed id that is not an item; all 23 planned items resolve; all 163 definitions/constructions retain api or tests; `source`, `sourceData` and `sourceIssues` byte-identical to the inherited file; exactly three deliverables touched. Submit exactly the result, report and this handoff.
