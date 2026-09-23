# REV-PAPER-GROECHENIG-WYSS-ZIEGLER-20

Independent review of the extraction of Michael Groechenig, Dimitri Wyss and Paul Ziegler,
*Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*, Inventiones
mathematicae **221** (2020), 505–596 (doi 10.1007/s00222-020-00957-8, open access CC BY 4.0;
arXiv 1707.06417).

Issue [#1293](https://github.com/CBirkbeck/tauceti-explorer/issues/1293). Reviewer: Claude Code,
session cc-d67081, 23 September 2026. The extraction is session cc-39fac3's (issue #1292).

**Verdict: accept.** All five routes accepted. No item, status, route, locator or quotation
changed.

## The source, with a limitation on the record

The extraction records the published PDF's SHA-256 as `f2231145…3e07`. **I could not re-verify that
hash here.** Springer's PDF endpoint returns a 3 KB JavaScript "Client Challenge" page to every
request I made — with a browser User-Agent, with an article-page referer, and with a cookie jar
seeded from the landing page. Unpaywall lists only that same publisher URL and arXiv for this DOI,
and the obvious author-hosted filenames return 404.

So I verified the published **text** rather than the bytes, through a rendering proxy, and
reconstructed the journal page map from the running heads: **91 marks running from p. 506 to
p. 596**, consistent with the stated 505–596. Every quotation below was checked against that text at
the recorded page. Crossref's record of the DOI carries no update, erratum or correction relation,
re-checked independently on 23 September 2026.

## Mistakes

All **20** findings were checked at their locators. **All 20 are confirmed.**

This is the most carefully recorded set of findings I have reviewed. Every `printed` field is a real
quotation; every `reason` carries either a counterexample or the internal contradiction that settles
it; and the classifications are honest — twelve are marked as affecting nothing, and the four marked
as affecting a stated result really do.

### Settled by the paper contradicting itself

| id | what is printed | what settles it |
|----|-----------------|-----------------|
| **E3** | Lemma 3.12's second assertion uses `Br(P)[r]` | its own proof works with "the subset of `H²_ét(A, μ_r)` corresponding to gerbes trivial on `A_{F^s}`" |
| **E5** | "the χ-isotypic component of `H^q(X_E, Ω^q)`" | the display one line above is `⊕_{p+q=i} H^q(X_E, Ω^p) ⊗ C_ℓ(−p)` |
| **E6** | `h^{p,q}_χ(Y_C) = Σ_{i=0}^{m′} h^{p−α_i,q−α_i}_χ(Y_j)` | the sum runs over `i`, the summand is indexed by `j`, and `α` belongs to the X side |
| **E8** | "we can take η to be `(dx₁∧⋯∧dx_n)^{⊗r}`" | Claim 4.2 asks for a **1-gauge** form with `|η^{⊗r}| = q^m|ω|`, and the display identifies `η^{⊗r}` |
| **E9** | `M₁ ≃ Split′(M₂/A, α₂)` **and** `M₂ ≃ Split′(M₁/A, α₂)` | the same gerbe twice; Definition 6.9(c) and Theorem 7.18 use `α₁` |
| **E10** | "isomorphisms of `P_i^♦`-torsors" | the preceding sentence gives the space a `P_{i′}^♦`-torsor structure |
| **E11** | "E is a vector bundle on **S**" | `D` is a line bundle on `X` and `θ` is `O_X`-linear |
| **E17** | "Therefore `j_σ^*` … is an isomorphism" | a surjection from a group of order `e` needs the target's order, never shown |
| **E19** | the Bockstein map "sends `(φ_ijk)` to `(ψ_ij)`", and the Hasse invariant is "`(ψ_ijk)`" | for `0 → Z →^e Z → Z/e → 0` the connecting map runs `H¹(Z/e) → H²(Z)`, and `ψ` has two indices everywhere else |

### Re-derived rather than believed

Seven counterexamples I rebuilt myself:

- **E1.** With `q = 4`, both `s_r = 4^{1/r}` and `s′_r = 4^{1/r}e^{2πi/r}` are compatible systems of
  roots — `(s′_{rr′})^r = s′_{r′}` — yet `s₂ = 2` and `s′₂ = −2`, and no element of `Gal(Q̄/Q)`
  carries 2 to −2. So the relation of Definition 2.16(c) is not well defined at prime powers. The
  density repair is sound: closed points with prime residue field have Dirichlet density one, which
  is all the Chebotarev step uses, so Theorems 2.18–2.19 stand.
- **E2.** A continuous `Q_ℓ`-valued character lands in `Z_ℓ^×`, and for odd `ℓ`,
  `(Z_ℓ^×)^{ℓ^k} = μ_{ℓ−1}·(1 + ℓ^{k+1}Z_ℓ)`. The cyclotomic character's image contains `1 + ℓ^m`,
  which is not in that set once `k ≥ m` — and passing to a further finite étale extension keeps the
  image open, so it does not help. No `ℓ^k`-th root of the Tate twist exists with `Q_ℓ`-coefficients.
- **E3.** For `y² = x³ − x` over `Q₅`: `|E(F₅)| = 8` with full rational 2-torsion, so
  `E(Q₅)/2` and `H¹(F,E)[2]` have order 4, while `H¹(F,E[2])` has order 16 by the local Euler
  characteristic formula. The two sides of the printed equivalence differ by exactly the Kummer term.
- **E4.** Over `R`, the conic `x²+y²+z²=0` is its own Severi–Brauer variety, so the quaternion class
  dies in `Br(X)`: `Br(K) → Br(X)_K` is not injective.
- **E13.** `x⁴ − 20x² + 50` over `Q₅` has `q(p²−4q) = 50·200 = 100²`, so its Galois group is **cyclic
  of order 4** with inertia of order 2 — a non-split extension, against Lemma 5.1(c) — and it sits
  **inside the paper's own hypotheses**, since `μ₄ ⊂ Q₅`. Every uniformiser generates `L`, so
  `F(π_L)` has degree 4 ≠ e, against Lemma 5.1(a).
- **E14.** `−1` is a square in `Q₅`, so reciprocity sends it to the identity, not to a generator of
  `Gal(Q₅(√5)/Q₅)`; `ζ₄` does generate. The general condition is `gcd((q−1)/e, e) = 1`.
- **E18.** `c₂(T_{P²}(−a)) = a² − 3a + 3` has no integer root (indeed no real one), so
  `P(T_{P²}) → P²` has no section although `End(T_{P²})` is split. And rank `r²` gives a
  `P^{r−1}`-bundle, not a `P^r`-bundle.

### One distinction I would record, on E20

The substantive slip is real: Lemma 2.7(c), equation (4), has `H¹_ét(k, Hom(Γ, A))` as its subgroup,
and the proof of Lemma 5.12 prints `Hom(μ_e, μ_e)`, dropping the cohomological `H¹_ét(k_F, −)`.
Written correctly with `I` acting on `Spec k_F` — the presentation the middle term `B_{k_F}I` names,
and for which `I` is cyclic as 2.7(c) requires — the first term is `H¹_ét(k_F, Hom(I, μ_e)) ≅ Z/e` by
evaluation at Frobenius.

But the finding also asks for the central extension to be written for `I` rather than `Γ`, and the
paper writes the same stack **both** ways, as `[Spec k_F/I] = [Spec k_L/Γ]`; in the second
presentation an extension of `Γ` is the right object. That half is a choice of presentation, not an
error. Either way the conclusion `|H²| = e²` stands, as the finding says.

### The four that reach a stated result

E2 (Lemma 2.17 as stated fails for `r` divisible by a large power of `ℓ`), E3 (Lemma 3.12's second
assertion and Corollary 3.13), E13 (Lemma 5.1(a),(c),(d)) and E17's neighbours in §5. In each case
the extraction supplies a repair and says what the repair costs; E13's is the most consequential, and
the extraction's route through `L′ = L·F_d` — where `X_{L′/F} ≅ X_{L/F}` by Lemma 5.3 — is the
natural one. I checked the shape of that repair rather than re-deriving each use in Lemmas 5.5, 5.7,
5.8, Proposition 5.15 and Theorem 5.20, and have said so in the verdict.

## Items, statuses, routes

**78 items: 3 library, 5 planned, 70 missing**, every missing item routed exactly once, all
dependencies resolving. The three library declarations were opened at the pinned commits. The five
planned items point at LocalFieldsRamification, ClassFieldTheory and `ET.2b`.

All five routes accepted.

- **Routes 1–3** put the classical machinery with its general owners: `LD.2` "p-adic definable
  integration", `R02.4` "Poitou–Tate duality", `R09.4`/`R09.5` for stacks and coarse spaces. In each
  case the reason names the same stage that PAPER-GROECHENIG-WYSS-ZIEGLER-20-B already routes the
  same facts to, so the two papers converge on one owner.
- **Route 4** is a genuine **coalescence**: parent, roadmap id, title and area are byte-identical to
  the Part II that GWZ-20-B proposes and that review #2440 already accepted. The boundary with the
  parent is drawn correctly — `ET.2b` already plans "the stack of G-bundles, Higgs fields twisted by
  a chosen sufficiently positive divisor, the Hitchin base/map, cameral/spectral covers and the
  Picard stack acting on Hitchin fibers", and the extraction marks item 61 **planned** there rather
  than routing it. The twisted Higgs moduli are imported, not re-planned.
- **Route 5**, the new roadmap, is justified by a sweep of every roadmap extract in the atlas:
  **"Higgs bundle" occurs nowhere, "stringy" nowhere, "Hausel" nowhere**. "Hitchin" occurs in three
  roadmaps, and reading each, they are perverse-sheaf support statements (EDC.7, GS1) or the
  good-characteristic fundamental-lemma branch (ET.2/ET.2a/ET.2b) — GS1 says in terms that it "does
  not use the later Hitchin fundamental-lemma branch". "Mirror symmetry" occurs three times in
  passing. The id is free and `geomlanglands` is a galaxy id.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
