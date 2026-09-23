# Review of PAPER-BOXER-PILLONI-26

**Job** REV-PAPER-BOXER-PILLONI-26 (issue #1200) · **Date** 23 September 2026 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All 22 routes accepted; all 133 `sourceIssues` confirmed; two
corrections made in place; nothing rejected or deleted.

Paper: George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*,
[Inventiones mathematicae **244** (2026), no. 1, 45–141](https://doi.org/10.1007/s00222-025-01393-2),
read in the authors' version on Pilloni's homepage (`higherhidaSiegel.pdf`, 65 pages, built 5 November
2025), whose recorded hash reproduces byte for byte:
`af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`. The published Springer text is
paywalled and was not compared, as the extraction states. Printed page equals PDF page, and every
locator is a page of this version.

Extraction by Claude Code, session `cc-72825f` (issue #1199, PR #2307); a different session, as the
job requires.

## Structure

417 items (372 missing, 37 planned, 8 library) and 22 routes: 17 source, 5 Part II. Every missing
item is routed exactly once.

All 17 source routes name stages that exist. Four of them — `AnalyticStacks:AS.0`, `AS.2`, `AS.3` and
`SolidAnalyticRings:SA.3` — are absent from `data/atlas.json`, and a checker that looks only there
will report them missing; they live in `research/blueprint/roadmaps/`, where stages are keyed by
`key` rather than `id`. Four other extractions route to `AnalyticStacks` the same way, so this is a
property of the corpus, not a defect here. Of the 80 planned references, the 72 of `Stage:Layer`
form resolve in `data/atlas.json`; the other 8 use the corpus-wide
`tauceti:TauCetiRoadmap/…#layer-…` form whose targets live in the Tau Ceti repository.

All five Part II titles reproduce their parents' atlas titles exactly, and all five areas are galaxy
ids. Four join proposals already in the corpus — `HigherHidaAndColemanTheory` from
`PAPER-PILLONI-20`, `IntegralCoherentHeckeComplexes` from `PAPER-CALEGARI-GERAGHTY-18`,
`ShimuraVarietiesHondaTatePartII` from `PAPER-KISIN-MADAPUSIPERA-SHIN-22`,
`ShimuraCompactificationsPartIIHodgeTypeIntegralBoundary` from `PAPER-FARB-KISIN-WOLFSON-24`. The
fifth, `IgusaVarietiesAndTorsionConcentrationPartIISiegelOrdinary`, is this paper's own proposal,
carried by no other extraction, with its parent present in the atlas.

**Two corrections made in place.**

1. The extraction recorded no `libraryPins`. I added them — Mathlib
   `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
2. At those pins, one of the 60 cited declarations does not exist: **`mathlib:CommRing.orzechProperty`**,
   on the item `ext-nakayama-lemma`. The declaration index has the class `OrzechProperty` and its five
   consequences in `Mathlib/RingTheory/OrzechProperty.lean`, and no instance supplying it under any
   name, so the citation cannot be repaired by renaming. I removed it and recorded in the item's note
   what the remaining four citations give, and that `IsNoetherian.bijective_of_surjective_endomorphism`
   (`Mathlib/RingTheory/Noetherian/Orzech.lean:62`) covers the Noetherian case the paper's applications
   use. The other 59 declarations all resolve.

## The 133 findings

All confirmed: 14 errors, 28 gaps, 91 misprints. For each I located the quoted text on the page its
locator names and checked the correction against the paper's own conventions.

**Settled by the paper contradicting itself.** This is the strongest evidence available with one
version in hand, and the extraction finds a remarkable amount of it. I checked each pair directly:

- **E3** — `C(κ)` is defined with dominance in `X⋆(T)` on p. 3 and in `X⋆(T)⁻_ℚ` on p. 48. The
  rational reading is forced anyway, since `ρ = (−1, −2, …, −g; 0)` fails the parity condition
  `Σk_i ≡ k mod 2` whenever `g(g+1)/2` is odd.
- **E9** — the higher Hida complexes are defined with `⊗_{ℤ_p}` on p. 5 and `⊗̂_{ℤ_p}` on p. 56; the
  proof of Lemma 5.4.1 needs the completed one.
- **E10** — `κ = −w_{0,M}w(ν + ρ) − ρ` on p. 5, where `ν` is a character, against
  `κ = −w_{0,M}w(ν_alg + ρ) − ρ` on p. 56.
- **E69** — Proposition 4.1.13(3) gives `Z_{k+1,<j_k+1} = D_{g−k}`; its own proof gives `D_{g−k−1}`.
- **E71** — `Z_i = Σ_{i=1}^k D_{g+i}` on p. 42, with `i` free and bound at once, against
  `Z_i = Σ_{k=1}^i D_{g+k}` on p. 45.
- **E85** — Lemma 4.3.6 removes `Σ_{i=1}^g D_i ∩ D_{2g+1−i}` in its statement and `Σ_{i=1}^d` five
  times around it, where no `d` is defined in §4.
- **E130** — Proposition 6.2.13 states `M^•_w ⊗ A/p^n` and proves `M^•_w ⊗ A/p^r`.
- **E24** — Proposition 2.3.5 states `H^i(X, j_!𝓕)` and its proof gives `H^i(X̄, j_!𝓕)`.

**The errors that reach statements.**

- **E45.** Lemma 2.10.1(4) asserts that `RΓ_Z(Y, 𝓕)` has finite cohomology for `Z` proper and `𝓕`
  with coherent cohomology, with no boundedness anywhere; `i^!` of an unbounded complex over
  `k[x]/(x²)` breaks both the claim and the step the proof takes. Adding "bounded below" repairs it,
  and the hypothesis holds where the lemma is used.
- **E122.** The second halves of Proposition 6.2.3(2)–(3) are false as inequalities of divisors:
  part (1) of the same proposition orders `D_{+,ε}` and `D_{+,ε′}` the other way. What the cited
  results give, and what §6.2 uses, is the corresponding inclusion of supports.
- **E63.** The type substacks `𝒜_{g,δ}` are defined by an étale-local condition on the kernel of the
  polarization, which `μ_{δ_i}` cannot satisfy in characteristic `p` when `p | δ_i` — and `p | d` is
  exactly the case §4.1.1 needs, its degrees being `p^{2ng−2in}`. Read fppf-locally the definition is
  right and `𝒜_{g,δ,ℚ} = S_{K_δ,ℚ}` is unaffected.

**The gaps that matter most.** E25 (Corollary 2.3.14 needs its two maps of line bundles to lie over
the structure maps, or the limit and colimit it passes to do not exist); E28 (turning an endomorphism
into an `A[T]`-module is not available in a triangulated category, which the paper's own footnote 2
concedes, and Lemma 2.4.4 needs the operators to form an endomorphism of a *diagram*); E42
(Proposition 2.9.9 is stated for a correspondence in the sense of Definition 2.1.8 but its proof needs
`p_1` proper for the trace); E100 (Theorem 4.5.2 restricts the Cousin sum to `C(κ)` while the
filtration runs over all of `ᴹW`, and the vanishing of the other summands — available from Remark
4.3.12 — is not stated); E126 (`T^{++}` generating `T(ℚ_p)` *as a group* does not propagate a lower
bound on slopes, since inverses reverse it; the cone argument does).

## Limits of this check

This PDF's text layer drops every citation bracket and every author name in the bibliography, so I
could not verify a citation key against the source. For the two findings about the numbering inside
`[BP21]` (**E114**, **E129**) I rely on the extraction's reading of arXiv:2110.10251; E114 is a defect
either way, since the references made within §6.1 and §6.1.8 cannot all belong to one version of that
paper. The text layer also does not separate subscripts from superscripts, so for **E47** (the interior
marks and the sign on `D`) and **E98** (`K_p` for `K^p`) I rely on the extraction's renders, and say so
in those verdicts. In each case the surrounding definitions settle the substance whichever way the
glyphs sit.

One printed slip is recorded by no finding: **"the the closure"** in the proof of Proposition 4.4.4,
p. 51. I leave it for a later pass rather than manufacture a finding.

## What this review did not do

I did not read all 65 pages line by line. I read the pages every finding names, the statements the
routes cite, and the surrounding material needed to judge them. I did not compare the published
Inventiones text, so no finding here has been checked against the version of record. I add no finding
of my own.

## Checks

    python3 scripts/check_paper.py research/blueprint/papers/PAPER-BOXER-PILLONI-26.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BOXER-PILLONI-26.result.json
    python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BOXER-PILLONI-26.review.json

All pass. No roadmap change, no library claim and no Lean work is proposed.
