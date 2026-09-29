# PAPER-HANSEN-26: Excursion operators and the stable Bernstein center

David Hansen, *Excursion operators and the stable Bernstein center*, [Forum Math. Pi 14 (2026), e10](https://doi.org/10.1017/fmp.2026.10028), open access (CC BY).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #1340). Status: **complete**. Every missing item is routed once.

The machine-readable extraction is [PAPER-HANSEN-26.result.json](PAPER-HANSEN-26.result.json). It has:
- 29 items: 6 planned, 23 missing;
- 3 Part II routes: one new, two coalescing with the accepted proposals of PAPER-HANSEN-KALETHA-WEINSTEIN-22;
- 7 prerequisite entries;
- 1 source issue.

## Source read

The published article (14 pages, SHA-256 `533628c9…`), read completely. No arXiv version was found by title.

## What the paper proves

**Theorem 1.1.** For every connected reductive G over a p-adic field, the Fargues–Scholze map Ψ_G: ℨ^spec(G) → ℨ(G) lands in the very stable Bernstein center: z∗f is unstable whenever f is. This confirms, for the Fargues–Scholze center, conjectures of Haines and Scholze–Shin.

**Corollaries 1.2 and 1.3.**
- Fargues–Scholze parameters are constant on atomically stable virtual characters.
- In particular, they are constant on Kaletha's regular supercuspidal packets, by Fintzen–Kaletha–Spice's atomic stability.
- They are also constant on tempered packets wherever these are known, e.g. for quasi-split classical groups.

**Theorem 1.4.** For an extended pure inner form G = G*_b, Ψ_{G*}(f) = 0 implies Ψ_G(f) = 0. This gives a surjection τ_G: ℨ^FS(G*) → ℨ^FS(G), compatible with Levi restriction, with the transfer of stable tempered characters, and with matching of stable orbital integrals.

**Method.** Decategorified Hecke operators 𝒯_μ commute with ℨ^FS (Lemma 2.4). The Hansen–Kaletha–Weinstein character formula computes 𝒯_μ on the elliptic set (Proposition 2.5, Proposition 2.7), and Fu's estimate shows that 𝒯_{μ_m}/dim V_{μ_m} tends to stable averaging (Lemma 2.6). Arthur's elliptic tempered characters then reduce everything to cuspidal functions and the elliptic set, and parabolic induction handles the rest by induction on semisimple rank.

## What the atlas already has

**Planned (6).**
- The Bernstein center: SmoothRepresentationsOfLocalGroups SR.3, with ES0's comparison.
- Ψ_G and its compatibility with parabolic induction: ExcursionOperatorsAndSpectralAction ES1:spectral-center and ES7:parabolic.
- The commutation of Hecke operators with excursion operators: ES0, ES1.
- B(G), basic elements and extended pure inner forms, with their strata: BunGAndNewtonStrata BG0, ES7:parabolic.
- Stable conjugacy and elliptic elements: EndoscopicTransferAndUnitaryTraceComparison ET.0.

**Missing.** Everything about stability, the operators 𝒯_μ, and the p-adic harmonic analysis Hansen quotes.

## Routes

**1. New Part II: ExcursionOperatorsAndSpectralActionStableCenter (13 items).** The stability results are new layers after ES7:
- the stability notions and Lemmas 2.2–2.3;
- 𝒯_μ with Lemma 2.4 and Propositions 2.5 and 2.7;
- Fu's estimate and Lemma 2.6;
- Theorems 1.1 and 1.4 and Corollaries 1.2–1.3.

No atlas layer studies the stability of the Fargues–Scholze center. The title is "Excursion operators and the spectral action, Part II: stability of the Fargues–Scholze Bernstein center".

**2. Part II, coalesced: SmoothRepresentationsCharactersPartII (9 items).** This carries the character theory of p-adic harmonic analysis:
- Kazhdan density, the constant term and the restriction r_M;
- Arthur's decompositions and elliptic tempered characters, and Lemma 2.1;
- Arthur's characterization of unstable functions, stability of δ₁, local boundedness and cuspidal Weyl integration;
- transfer of stable characters to inner forms, with Hansen's Kottwitz-sign normalization.

PAPER-HANSEN-KALETHA-WEINSTEIN-22's accepted route already proposes this Part II ("characters, trace Paley–Wiener and ℓ-adic lattices"), including HKW Theorem C.1.1, so the items join it.

**3. Part II, coalesced: HeckeStacksAndLocalShtukasKottwitzPartII (1 item).** The HKW character formula (Theorem 6.5.2, Proposition 6.4.5, Remark 3.2.5) is the central theorem of HKW22's accepted Part II. Hansen needs it in both directions across basic inner forms, with Fu's existence lemma for the invariant.

## Prerequisites

- Fu, *Stability of elliptic Fargues–Scholze L-packets* (arXiv:2501.00652).
- Varma, *Some comments on the stable Bernstein center*. This is a preprint with no public copy located by title search.
- Arthur 1993 and 1996.
- Haines 2014.
- Fintzen–Kaletha–Spice 2023.
- Kaletha 2019.

## Source issues

| id | kind | where | finding |
|----|------|-------|---------|
| E1 | misprint | §2.4, p. 13 | "i*_b T_{V_μ} i_{i!}" should read i_{1!}, as in the definition before Proposition 2.7. |

I also checked the proofs themselves and found no problems:
- The cuspidal reduction in §2.3 is sound: the cuspidal part of an unstable function is unstable.
- μ_m = 4mρ_G satisfies 1 ∈ B(G, μ_m), since 4mρ lies in the root lattice.
- The Kottwitz signs in Proposition 2.7(ii) reduce to e(G) for quasi-split G*.
- The nonvanishing argument for Theorem 1.4 holds in both its induced and elliptic cases.
