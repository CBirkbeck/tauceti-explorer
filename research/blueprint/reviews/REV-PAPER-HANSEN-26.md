# REV-PAPER-HANSEN-26: review of the extraction of Hansen, *Excursion operators and the stable Bernstein center*

**Verdict: accept.** All three Part II routes are accepted, and two of their briefs now import ET.1. The one recorded mistake is confirmed, and one new misprint is added and confirmed. No status changes.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #1340 (PR #4096). It has 29 items (0 library, 6 planned, 23 missing), 3 routes and 1 `sourceIssue`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Forum Math. Pi **14** (2026), e10, [doi:10.1017/fmp.2026.10028](https://doi.org/10.1017/fmp.2026.10028), the open-access (CC BY) publisher PDF, 14 pages. My copy has SHA-256 `0b2c7340…`, not the recorded `533628c9…`. The reason is that Cambridge Core stamps every page of a download with the downloader's IP address and time ("Downloaded from … on 29 Sep 2026 at 12:23:20"), so no two downloads hash alike. `sourceVersions` now says so. There is no arXiv preprint (arXiv API title search). For E2 I read Fu's *Stability of elliptic Fargues–Scholze L-packets*, arXiv:2501.00652v1.

## 1. Items: complete

Every numbered statement appears in an item locator: Theorems 1.1 and 1.4, Corollaries 1.2 and 1.3, Lemmas 2.1–2.4 and 2.6, and Propositions 2.5 and 2.7. So do the decompositions (1)–(3). I compared every statement with the text.

The proofs are short, and I checked them line by line. Four steps the paper leaves implicit all hold:

- **§2.3, reduction to cuspidal f.** It needs the cuspidal part of an unstable f to be unstable. For stable tempered Θ′, Θ′(f_cusp) = Θ′_ell(f_cusp) = Θ′_ell(f) = 0, because Θ′_ell is again stable by (3).
- **Lemma 2.6.** Summing |C_m(g, g′) − 1/|[[g]]|| ≤ C/m over g′ ∈ [[g]] costs a factor |[[g]]|. That factor is bounded in terms of G, since there are finitely many classes of elliptic tori and H¹(E, T) is finite, so "C depends only on G" survives.
- **§2.4, elliptic case of the transfer.** The paper evaluates 𝒯*_μ(z·Θ) = τ_G(z)·𝒯*_μ(Θ) on G(E)_ell and concludes. This works because 𝒯*_μ(Θ) and dim V_μ·Trans^ell(Θ) agree on the elliptic set. Their difference is therefore parabolically induced ([HKW22, Theorem C.1.1]), and τ_G(z)· preserves induced characters ([BDK86, Proposition 2.4]).
- **§2.4, nonvanishing.** It uses that every elliptic element of G = G*_b has a stable conjugate in the quasi-split G*(E). That is standard, and it is part of what ET.0 transports under inner twists.

## 2. Statuses: all hold

No library items is right. Mathlib 082e2d3 and Tau Ceti f790474 have nothing on Bernstein centers, orbital integrals, characters of p-adic groups, B(G) or excursion operators. The only "Bernstein" declarations are Tau Ceti's Bernstein functions, which belong to real analysis.

Each planned item was read against the full text of its stage:

- **SR.3** constructs the Bernstein center as natural endomorphisms of the identity, with its action on every object.
- **ES0** and **ES1:spectral-center** construct the excursion algebra and prove "compatibility with Hecke functors".
- **ES7:parabolic** constructs Ψ_G and Ψ_G^b and proves IX.7.2 and IX.7.3.
- **BG0** defines B(G), J_b and inner twisting.
- **ET.0** constructs stable conjugacy and its transport under inner twists.

One gap in the plan is recorded as a note on `bernstein-center`. Lemma 2.3 treats z ∈ ℨ(G) as a distribution (it evaluates z(f) = (z∗f)(1)), and SR.3 does not state Bernstein's identification of the center with the essentially compact invariant distributions.

## 3. Routes: three Part IIs, all accepted

**Route 1: `ExcursionOperatorsAndSpectralActionStableCenter`** (new; parent ExcursionOperatorsAndSpectralAction). The title reproduces the parent's before the colon. The id is free in `data/atlas.json` and `reserved-ids.json`, and no other extraction proposes a Part II of this parent. ES0–ES7 build Ψ_G and its standard compatibilities, and nothing in the roadmap mentions stable or very stable distributions. The brief states the four main results exactly, with Corollary 1.3's tameness and p ∤ |W_G|.

I added ET.1 to its imports. The last clause of Theorem 1.4 is about matching stable orbital integrals, which ET.1 owns.

**Route 2: joins `SmoothRepresentationsCharactersPartII`.** PAPER-HANSEN-KALETHA-WEINSTEIN-22 proposed this Part II, and that extraction's review accepted it. The nine items are the character-theoretic harmonic analysis the proofs run on, and they sit naturally with that Part II's characters and trace Paley–Wiener.

One correction. `EndoscopicTransferAndUnitaryTraceComparison:ET.1` already owns "convergence of regular semisimple orbital integrals, stable and kappa-weighted sums", and it defines "matching test functions by their actual stable orbital-integral identities". The brief now imports ET.1 for these instead of leaving the Part II to rebuild them. The transfer of stable characters is dual to ET.1's matching.

**Route 3: joins `HeckeStacksAndLocalShtukasKottwitzPartII`.** HKW22 proposed it, and its review accepted it as route 1. The single item is that Part II's central character formula, in the inner-form generality Proposition 2.7 needs.

## 4. Mistakes in the paper: 1 of 1 confirmed, 1 added

Crossref records no update to the DOI and no updating work.

- **E1**: confirmed on the page image of p. 13. It prints "i*_b T_{V_μ} i_{i!}". There is no stratum i_i, and the definition before Proposition 2.7, which the next sentence applies, uses i_{1!}.
- **E2** (new, misprint, affects nothing; p. 8, before Lemma 2.6). The paper says "set μ_m = 4mρ_G for m ≥ 1, where 2ρ_G is the usual sum of positive roots". But μ_m has to be a cocharacter of G, the highest weight of a Ĝ-representation indexing a Hecke operator, and the sum of the positive roots of G is a character. For a group that is not simply laced the two are not even proportional: in type B₂, 2ρ = 3ε₁ + ε₂ while 2ρ^∨ = 4ε₁ + 2ε₂. The estimate the proof quotes is Fu's, and Fu defines μ_m := 4mρ_G ∈ X^*(T̂) with ρ_G = ½ Σ_{α∈Φ̂⁺} α (arXiv:2501.00652v1, p. 9, and §3.1, p. 18). So 2ρ_G must be the sum of the positive roots of Ĝ, that is, the positive coroots of G. Item `fu-averaging` now says so.

Lemma 2.6 also prints "[[g]] ∩ U = 0" where it means that U meets no conjugacy class in [[g]]. That is typographical, and I have not registered it.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. The changes are the E1 review, the new E2, the `fu-averaging` statement, a note on `bernstein-center`, ET.1 in the briefs of routes 1 and 2, and the hash note in `sourceVersions`. The report's section "Corrections by the independent review" lists them.
