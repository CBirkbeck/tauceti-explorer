# Review of PAPER-GUO-REINECKE-24

**Job** REV-PAPER-GUO-REINECKE-24 (issue #1227) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All nine routes accepted; all 35 recorded `sourceIssues` confirmed;
one finding added; eight item notes corrected in place.

Paper: Haoyang Guo and Emanuel Reinecke, *A prismatic approach to crystalline local systems*,
[Invent. Math. **236** (2024), 17–164](https://doi.org/10.1007/s00222-024-01238-4), read in
[arXiv:2203.09490v3](https://arxiv.org/abs/2203.09490). Extraction by Claude Code, session `cc-442dc5`
(issue #1226) — a different session, as the job requires.

**Both recorded hashes reproduce byte for byte**: the PDF
`3c49a5f2aa6023c7b01a5ba83a370ddcb92642f4819f64446b7d93bf01b28d26` (111 pages) and the LaTeX e-print
`039db4d2567289b85425fac4806d7550585b55c6f4a7cba23fdace13ee55fb36` (`main.tex`, 5372 lines, and
`main.bbl`). That second artifact is what makes this review unusually sharp: **every check below was
made against the authors' own LaTeX**, not against a text layer extracted from the PDF, so no finding
here turns on a glyph I could not read, and each verdict cites the TeX line. v3 is the current arXiv
version; Crossref carries no `update-to`, `updated-by` or other correction relation for the DOI; the
published Inventiones text is paywalled and was not compared, as the extraction states.

## The 35 findings, and one more

**All 35 are confirmed** — 23 misprints, 6 errors, 6 gaps. Every one was located in the LaTeX at the
locator it names, and where the correction is an assertion about the mathematics I checked it. The ones
worth recording here are those decided by evidence the extraction did not cite.

**Decided by the paper contradicting itself.**

- **E1** (Corollary C writes `H^i(X_η,T)` for `H^i(X_C,T)`). Conjecture 1.1, which Corollary C answers,
  writes `H^i(X_{ét,K̄}, Z_p)`; and the counterexample is exact: for `X = Spf O_K`, `T = Z_p`,
  `H^1(Spa K, Z_p) = H^1_cont(G_K,Z_p)` has rank `[K:Q_p] + 1` by local class field theory, while
  `H^1_crys(Spec k/W(k)) = 0`.
- **E5.** The notation is fixed on p. 10: "`A⟨I/p⟩` is the `p`-completion of `A[I/p]`". The list of
  period rings and the §3 diagram both print `Δ_S⟨I/p⟩ := Δ_S[1/p]^∧_p`, whose `p`-completion is zero.
  The neighbouring `B⁺_dR := Δ_S[1/p]^∧_I` is right as printed, which is presumably how the slip arose.
- **E7.** Definition 2.25 says itself that "`𝔸_crys(S,S⁺) → S⁺/p` is a pro-pd-thickening", so the crystal
  is evaluated at `(S⁺/p, 𝔸_crys/p^r)`; `Spec(𝔸_crys/p)` carries no map to `X_{p=0}`, and Definition 9.13
  writes the pair correctly.
- **E20.** The arrow `HT` in the diagram goes from `R^nν_*Ō_Δ{n}` to `Ω^n`, so with the printed direction
  of `η_X` the map labelled "the inverse of `η_X`" would be `η_X` itself.
- **E21.** Perfectness is Proposition 5.11 (label `perfectness`); the proof of Theorem 7.8 cites
  `Higgs-coh`, which is Proposition 5.12.
- **E25.** `C` is defined as an `A[1/I]`-complex, and the proof of Theorem 8.1 uses Proposition 8.9(ii)
  in exactly that form; only the statement prints `A[1/φ(I)]`.
- **E26.** Under `𝔸_inf(O_C) → W(k̄)` the element `μ` goes to `0`, but `ξ` goes to `−p`, so the image of
  `I` is `(p)`, not `0`; the paper's own earlier version of the same remark (p. 37) says only that `μ`
  goes to `0`. The displayed consequences survive, since `W(V_j)[1/p]^∧_p = 0`.
- **E31, E34.** Both are inconsistencies with the paper's own conventions: the PD thickening is
  `𝔸_crys(S,S⁺) → S⁺/p`, and the prism ideal throughout is `ker(θ̃)`, so `𝔸_{crys,K}` must be the envelope
  for `θ̃_K` — which is what Proposition 10.11 completes along.

**Decided by computation.**

- **E14** is the sharpest, and it is a real error. For perfectoid `S`, `Δ_S = W(S^♭)` is `p`-torsionfree
  with perfect, hence reduced, reduction. A ring map `s : R → Δ_S` would restrict to `O_K → Δ_S`; with an
  Eisenstein relation `π^e = p·v`, `v` a unit, the image of `π` is nilpotent mod `p`, hence lies in `pΔ_S`,
  and then `p^{e−1}b^e = s(v)` is a unit in `pΔ_S` — impossible for `e ≥ 2`. So the lift the proof of
  Proposition 4.11 takes does not exist over ramified `K`; Construction 2.28 lifts the `V_0`-model for
  exactly this reason.
- **E12.** `X = Spf k` is quasi-syntomic over `O_K`, its initial prism is `(W(k),(p))`, its analytic locus
  is `Spec W(k)[1/p]`, and the unit has endomorphisms `Z_p` on one side and `Q_p` on the other; so
  Proposition 3.7 is false as stated and the proof's "`(p, ξ̃)` is a regular sequence" fails. Flatness of
  `X` over `O_K` repairs it. **This one changes a stated result.**
- **E10.** For `X = ⊔_{n∈N} Spf O_K` and the unit isocrystal the two sides of Proposition 2.29 are
  `(∏_n W(k))[1/p]` and `∏_n K_0`, and the inclusion is strict: inverting `p` does not commute with
  infinite products. Proposition 2.29 (and Corollaries 2.30, 2.35) need quasi-compactness. **Also a
  stated result.**
- **E9.** With `R = R⁺[1/p]` the `V_0`-model, the `H`-invariants give `⊕_r R ⊗_{K_0} C(r)` and Tate leaves
  `R ⊗_{K_0} K = R_K`, not `R`; for `X = Spf O_K` the printed chain would give `B_crys^{G_K} = K`.
- **E13.** `θ̃(μ) = ζ_p − 1 ≠ 0`, so `μ` is a unit in `B⁺_dR`, while `φ(μ) = μξ̃`; base changing
  `𝔸_inf(ℰ)[1/μ]` along `φ` therefore inverts `ξ̃` and produces the whole `B_dR`-module, not a lattice.
- **E29.** Membership in `Gr_n` is `p^nW ⊆ N ⊆ p^{−n}W`; multiplying `W ⊆ p^{−n}ℰ` by `p^n` gives
  `p^nW ⊆ ℰ`, which is what is needed and the opposite of what is printed.
- **E32.** `D_Σ(R′)` completes a smooth ring of relative dimension `|Σ|` along one of relative dimension
  `d`, so it has `|Σ| − d` formal variables; with `Σ` the framing itself the printed formula would give
  `d` spurious ones.

**Decided in the cited source.** **E17** is the one finding that could not be settled inside the paper,
and I settled it by reading Shiho. [arXiv:0707.1742](https://arxiv.org/abs/0707.1742) fixes, in its
Convention, a base log formal scheme "separated and topologically of finite type over `Spf W`" — "(Note
that `𝓑` is Noetherian.)" — and works throughout in log formal schemes separated and topologically of
finite type over it. Theorem 6.13(ii) of this paper assumes only a "`p`-complete, `p`-torsionfree divided
power thickening", and Corollary 6.14 evaluates it at `𝔸_crys(S)` for `S` quasiregular semiperfect, which
is neither noetherian nor topologically of finite type over `W`. The gap is real, and the design job
should carry it forward.

**One finding added: E36** (misprint, Construction 10.6(2)). The de Rham complex displayed there ends at
`Ω^d_{Z/Y_K}`, but Convention 10.4 fixes `d` as the relative dimension of `X` over `Y`, while the complex
is that of `Z` — which, in the enlarged-framing case the construction immediately uses, has relative
dimension `|Σ| > d`. The extraction had seen the exponent and left it unrecorded.

## Eight item notes corrected in place

The extraction attached to eight items a note of the form *"Possible misprint noted during reading, not
verified and not recorded in `sourceIssues`: (…)"*. The boilerplate is wrong in most of them:

| item | what the note held | what I did |
|---|---|---|
| 253 | `D_Σ(R′)` for `D_{Σ^n}(R′)` — **this is E33** | cross-referenced E33 |
| 254 | `θ` for `θ̃` — **this is E34** | cross-referenced E34 |
| 070 | restates the E8 hypothesis already cited in the same note | removed the duplicate |
| 246 | the `Ω^d` exponent | cross-referenced the new **E36** |
| 258 | "(in fact a crystalline local system)" — not a misprint claim | replaced by what it was trying to say |
| 247, 248, 249 | notational points about Theorem 10.7 | kept, with the reason they are **not** mistakes |

On the last three: the paper's "any degeneracy map `[a] → [0]` in `Δ` induces an isomorphism
`M^{0,•} → M^{a,•}`" has the indexing crossed — the unique map `[a] → [0]` induces the diagonal, and the
arrow asserted is the one induced by the projections `Z^{a+1} → Z`, which is what the proof actually
forms. The two are mutually inverse once either is an isomorphism, so nothing turns on it, and I left it
out of the register.

## Structure

**274 items** (220 missing, 52 planned, 2 library) and **nine routes**: two Part IIs that are this
paper's own, one further Part II and one new roadmap that join proposals the corpus already carries, and
five source routes.

- Every missing item is routed **exactly once**; no routed id is unknown or non-missing; no id is
  duplicated.
- All nine route stage ids resolve in `data/atlas.json`, layer-level ids included
  (`RelativeFarguesFontaine:RF0:integral-Y`, `RF4:vector-bundles`).
- All **38** distinct planned references resolve: 36 of `Stage`/`Stage:Layer` form in `data/atlas.json`,
  and two of the corpus-wide `tauceti:TauCetiRoadmap/…#layer-…` form whose targets live in the Tau Ceti
  repository.
- All three Part II titles reproduce their parents' atlas titles exactly, all four declared areas are
  galaxy ids, and all four proposed roadmap ids are free in `data/atlas.json`.
- Both library citations resolve at the pinned commits, which `baseline` already records (Mathlib
  `082e2d3`, Tau Ceti `f790474`): `OrzechProperty` at `Mathlib/RingTheory/OrzechProperty.lean:63` — with
  the statement the item names at line 101, supplied over a commutative ring by
  `instance (priority := 100) CommRing.orzechProperty` at `Mathlib/RingTheory/FiniteType.lean:625` — and
  `associatedPrimes` at `Mathlib/RingTheory/Ideal/AssociatedPrime/Basic.lean:103`, with finiteness over
  noetherian rings at `AssociatedPrime/Finiteness.lean:158`.

**Joins checked against the corpus.** `ArcTopologyAndDescent` is proposed identically — same id, title,
area `etale` — by `PAPER-BHATT-MATHEW-21`, `PAPER-BHATT-SCHOLZE-17`, `PAPER-CESNAVICIUS-SCHOLZE-24` and
`PAPER-CLAUSEN-MATHEW-MORROW-21`; `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry` by
`PAPER-BHATT-ETAL-23` and `PAPER-HACON-WITASZEK-23`. The two Part IIs of this paper are carried by no
other extraction.

**Coverage.** I extracted every numbered environment from the LaTeX — **192**, under one counter numbered
by section plus the lettered main results — and **167** are named in item locators or names. The 25 that
are not are 18 remarks, one example, and six introduction statements (Theorems 1.10, 1.13, 1.18, 1.21 and
Corollary 1.23) that restate body results, each itemised at its body number: 6.1, 6.4, 6.8; 7.8, 7.16;
8.1; 9.1; 9.15. Nothing is missing.

**The briefs are the best part of this extraction.** Route 1's states the final theorems (A)–(G) with
their numbers and *in their corrected form* — `Ξ = φ*ℰ ⊗ 𝔹⁺_dR` (E13), Proposition 3.7 for `X` flat over
`O_K` (E12), Theorem 5.10 through Breuil–Kisin prisms (E15), Corollary C for `H^i(X_C,T)` (E1) — names
every import by stage, and lists unit tests including the one that shows why Proposition 3.7 needs
flatness. Route 2's does the same for the p-adic Hodge theory side and carries the quasi-compactness of
E10. A design job can work from these without rereading the paper.

## Left for the design job

`SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry` is proposed with area
`algebraicgeometry` here and by `PAPER-HACON-WITASZEK-23`, and with `arithmeticgeometry` by
`PAPER-BHATT-ETAL-23`. Both are galaxy ids, one roadmap cannot sit in two galaxies, and none of the three
briefs reconciles them. This extraction is with the majority, so I changed nothing.

## What this review did not do

I did not re-derive the paper's proofs. I read the introduction and the list of period rings in full,
the statements the routes cite, every passage a finding names with the surrounding argument, and the
sections needed to judge them (§§2.2–2.4, 3, 4.2, 5.3, 6, 7, 8, 9.1, 10). I did not compare the published
Inventiones text, so no finding here is checked against the version of record. Two printed slips are
recorded by no finding and I leave them rather than manufacture findings: a misplaced parenthesis in the
displayed de Rham complex of Construction 10.6(2), and the sentence closing Example 1.8, which names
`O_{𝒴_{[0,∞)}}` where the example's own item (2) puts `M(T)` over `𝒴_{[0,1/p]}`.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-GUO-REINECKE-24.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-GUO-REINECKE-24.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-GUO-REINECKE-24.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
