# Red team: Newton–Thorne II extraction

`RT-PAPER-NEWTON-THORNE-21-B`, issue #4298. Codex, session `codex-rtOQ9t`, 1 October 2026. Complete. Audited base: `0d239d95dbe322a93493ed922810497336df9bcd`.

Seven findings: **four high, two medium, one low**. These concern the accepted extraction and reader. They do not dispute the main theorem of Newton–Thorne II. The extraction’s one explicit library item, the Galois fibre-product lemma, checks out.

I did not write or review the target: its extraction is by Claude Code `cc-39fac3`, and its accepted review is by Claude Code `cc-38267a`. The bot confirmed my claim before work began.

## Sources and scope

I read the complete 36-page [published Newton–Thorne II paper](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00126-4.pdf), including Appendix A, and compared all 61 items, six routes, the reader, review and existing source issues E1–E4. Its PDF matches the extraction’s SHA-256. For two supplier statements I checked the published [BLGGT14](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf), pp. 524–525, 529–533 and 560, and [Dummigan–Martin–Watkins](https://www.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf), pp. 1311–1313. The JSON records URLs, reading date and all three hashes. NT p. 137, BLGGT p. 533 and DMW p. 1312 were also checked as page images.

The audit uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Source-level extraction is the scope: the findings do not demand recursive extraction of supplier proofs or blueprint-level API and test plans.

## Findings

### 1. High — the dyadic support argument uses the wrong ring

**Location:** item `/16`, the `SymmetricPowerAutomorphyLifting` brief’s support layer, and the reader’s support argument.

Item `/16` starts with Proposition 2.6 “or 2.8”, then concludes that `R_loc[[X]] → R_∞` is an isomorphism and `R_∞` a domain. The published proof establishes this only for odd `p` (p. 131). At `p=2`, the domain is **`R′_∞`**; `R_∞` is a torsor over the invariant ring. Its components are permuted transitively by the quadratic twisting group. Page 137 translates the automorphic point to the component containing the target point before applying regularity.

This is not cosmetic. The elementary squaring fibre of the formal multiplicative group is

`ℤ₂[[x]] / ((1+x)²−1) = ℤ₂[[x]] / (x(x+2))`.

The ambient ring is a domain, but this fibre has two components. The correct dyadic information is already present in items `/20` and `/60`.

**Fix:** separate the two cases in `/16` and its consumer brief. Retain the domain argument for odd `p`; use `R′_∞`, invariants, component transitivity, equivariance and the translated point for `p=2`. Update the reader accordingly.

### 2. High — item `/41` drops the twisting character from the weight

The paper’s p. 117 correspondence allows a twist of a holomorphic eigenform. Its p. 121 *weight k* convention fixes the algebraic representation to `(Sym^(k−2) ℂ²)^∨`, with Hodge–Tate weights `{0,k−1}`. Item `/41` incorrectly says the original twisted representation then has this normalized weight.

For example, start with normalized weight two and twist by the algebraic character with Galois avatar `ε^(−1)`. The paper’s cyclotomic-weight convention shifts `{0,1}` to `{1,2}`. The representation remains regular algebraic and cuspidal, but is not of normalized weight `k` for any `k≥2`.

**Fix:** assert existence of a normalizing algebraic Hecke-character twist, retain the character or determinant twist in the general coefficient representation, and apply the `{0,k−1}` formula after normalization. Keep the existing owner `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

### 3. High — item `/59` removes potential crystallinity

**Location:** the filtration criterion in `/59` and the `PolarizedAutomorphyLifting` brief, clause (iii).

BLGGT14 Lemma 1.4.3, p. 533, assumes that the representation is potentially crystalline before its criterion involving an invariant filtration with one-dimensional graded pieces. The extraction states that criterion for a merely continuous representation and includes ordinary representations without the omitted qualifier.

A Tate-curve representation supplies the standard obstruction: it has a filtration with one-dimensional graded pieces, but its nonzero semistable monodromy persists under finite extension. It cannot become crystalline, whereas potential diagonalisability requires precisely such a crystalline extension (BLGGT p. 531).

**Fix:** restore the standing potentially crystalline hypothesis, including for the ordinary example. The crystalline Fontaine–Laffaille and potentially Barsotti–Tate branches retain their own stated hypotheses.

### 4. Medium — the completed L-function loses its conductor factor

**Location:** item `/45`, used by the ML.3 source route.

The extraction defines the completion as gamma factors times the finite Euler product. DMW09 p. 1312 instead includes the additional factor `N_n^(s/2)`, where `N_n` is the conductor of the symmetric-power representation. Newton–Thorne’s Corollary B refers explicitly to that definition.

**Fix:** insert the conductor factor and name its meaning. Keep Frobenius and Euler-factor conventions consistent. The omitted factor is a nonvanishing exponential, so the entireness corollary survives, but the completed function and its constant-sign functional equation are not the same normalization.

### 5. Medium — algebraic symmetric powers need their own library/status entry

**Location:** the inventory around `/9`, `/29`, `/36`, `/38`, and the Part II imports.

The automorphic lift in `/38` is different from the algebraic symmetric-power representation used throughout the proof. NT p. 124 uses `Sym_A^(n−1) A²` and its basis. Tau Ceti already constructs the algebraic functor:

- `Representation.symmetricPower`, over any commutative semiring, monoid and module;
- `Representation.IntertwiningMap.symmetricPower` and `Representation.Equiv.symmetricPower`;
- `SymmetricPower.map`, with identity/composition laws, on Mathlib’s symmetric tensor quotient.

I read these in `TauCeti/RepresentationTheory/SymmetricPower.lean` and `TauCeti/LinearAlgebra/SymmetricPower/Basic.lean` at the pin. The extraction lists none as a library item.

The irreducibility theorem actually used on NT pp. 146–147 is a separate input: for `0≤m<t`, `Sym^m(𝔽̄_t²)` restricted to `SL₂(𝔽_t)` is irreducible. It appears only inside proof notes, without its own status or owner. Searches found no pinned finite-field theorem. Tau Ceti’s `isIrreducible_symPower` in `RepresentationTheory/SU2/Irreducible.lean` is over `ℂ`; it does not discharge this positive-characteristic obligation.

**Fix:** add the algebraic functor as a library item and extract the finite-field irreducibility input separately. `ArithmeticGaloisRepresentations:G7` owns continuous symmetric-power operations and residual-image criteria; `R01.4` is its GL₂ specialization. Route the arithmetic application once there, adding the paper as a source where needed, and import it into `/29` and `/36`. The new Barsotti–Tate/pseudodeformation conclusion of `/9` remains in the symmetric-power Part II.

### 6. High — the reader’s boundary reducibility claim is false

**Location:** “Why a new lifting theorem is needed”.

The reader asserts reducibility of `Sym^(n−1)` whenever `p≤n`. At `p=n`, the symmetric power has degree `p−1` and is irreducible for the natural `SL₂(𝔽_p)` representation, by the very criterion used on NT pp. 146–147. Item `/36` also correctly uses `t>n−1`. The reader changed the introductory exponent while retaining its bound.

**Fix:** explain that the induction encounters small residual characteristics where irreducibility cannot be assumed; sufficiently large characteristic and large image provide it. Keep the exponent consistent and preserve Theorem 2.1’s precise large-image hypothesis. Do not replace the sentence by another universal claim that every degree at least `p` is reducible.

### 7. Low — the main reader still gives the pre-review inventory and routes

Its opening says 37 items, four routes and two misprints; its source section says arXiv v2 is the published text; its route list assigns the NT20 ring and Selmer vanishing to the symmetric-power Part II. The accepted JSON instead has 61 items (1 library, 30 planned, 30 missing), six routes, 25 prerequisites and four source issues, with `/8` and `/17` assigned to `PolarizedAutomorphyLifting`. The appended review already explains these changes and the version differences.

**Fix:** rewrite the main account to match the accepted extraction. Recompute counts after the mathematical fixes, expose all six routes and the import boundary, and remove obsolete requests for a reviewer to choose an ownership treatment already chosen. Keep history secondary.

## Other checks and retained conclusions

All 47 distinct cited planned/source-route stage IDs resolve in the freshly assembled atlas. All 30 missing items are routed exactly once. I read the relevant owner descriptions and the 23 matching reviewed coverage entries, including their partial-library and duplication notes.

The joint-restriction map, its injectivity, and `IntermediateField.mem_range_restrictNormalHomSupProd_iff` at the pins prove item `/28` (finite-Galois Lemma 3.8). The library status stands. Mathlib’s `PolynomialLaw` is an existing carrier, but it does not by itself prove the Chenevier determinant and reconstruction package in `/50`–`/51`.

The current NT I `/73` and NT26 `nt23-adjoint-selmer-vanishing` both also route to `PolarizedAutomorphyLifting`. The historical three-owner concern has therefore been addressed in the current inputs; it is not reported as a present duplication. The distinct analytic-continuation, unitary-level-raising, symmetric-power-lifting and later tensor-functoriality methods remain separate consumers of common suppliers. This audit does not reopen the proof of the NT I base-case theorem.

I checked E1–E4 against the published text and retained their corrections, including the previously treated weight-two case needed to finish the reduction at 2. The findings above are extraction corrections and a reader correction, not newly asserted source errata. No upstream roadmap changes are requested.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-NEWTON-THORNE-21-B.result.json`
- `python3 research/blueprint/intake.py check-files` on the two deliverables
- `git diff --cached --check`

No Lean deliverable or compilation is involved. No library build, cache fetch or language server was started.
