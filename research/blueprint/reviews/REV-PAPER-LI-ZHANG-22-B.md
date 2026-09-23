# Review of PAPER-LI-ZHANG-22-B

**Job** REV-PAPER-LI-ZHANG-22-B (issue #1417) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All five routes accepted; all five `sourceIssues` confirmed;
nothing corrected, rejected or deleted.

Paper: Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*,
[J. Amer. Math. Soc. **35** (2022), 705–797](https://doi.org/10.1090/jams/988); read in arXiv
[1908.01701](https://arxiv.org/abs/1908.01701) v3, whose hash reproduces as
`7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49`.

## Structure

116 items: 109 missing, 7 planned, none library. Every missing item is routed exactly once, all five
stage ids exist, all planned layer ids exist, and `scripts/check_paper.py` passes.

Both Part II titles reproduce their parents' atlas titles exactly — *Siegel and PEL moduli problems*
and *Gross–Zagier formulas and arithmetic heights* — both areas are galaxy ids, and both ids
(`UnitaryRapoportZinkSpacesAndRSZModels`, `UnitaryKudlaRapoportCycles`) are already proposed by eight
sibling extractions of the same programme, including `PAPER-FENG-YUN-ZHANG-24`,
`PAPER-HE-LI-SHI-ETAL-23`, `PAPER-LI-LIU-21`, `PAPER-LI-LIU-22` and `PAPER-LIU-ETAL-22`. So this
extraction joins existing proposals rather than opening parallel ones.

**Coverage.** Of the 155 numbered environments in the text, all but six are carried into items; the
six are remarks and one definition that state no separate result.

**Locators.** 118 of 122 name-and-page checks land exactly. The four others are right as well:
Theorem 8.2.1 is stated on p.58 and proved on p.59, Theorem 13.6.1 is stated on p.83, and E4's
locator names Theorems 10.3.1 and 10.5.1 at pp.66 and 70, which is where they are.

## The five findings

**E2 is the substantial one, and its sign is decidable.** Page 38 represents `V(Λ) ∩^L Z(x)` by the
two-term complex `[O(−Z(x))|_{V(Λ)} → O|_{V(Λ)}]` and then computes

    ch(V(Λ) ∩^L Z(x)) = ch(O(−Z(x))|_{V(Λ)}) − ch(O_{V(Λ)}).

The class of that complex is `[O] − [O(−Z(x))]`, as the resolution
`0 → O(−Z) → O → O_Z → 0` shows, so the printed difference is the negative of the right one. The
`d = 1` case settles it independently: for `x ∈ Λ^∨ ∖ Λ` with `val(x) ≥ 0`, Lemma 6.2.1 gives
`Int_{V(Λ)}(x) = 1`, so `Z(x)` meets the curve `V(Λ)` in one reduced point and
`O(−Z(x))|_{V(Λ)}` has degree `−1`, where the printed formula produces `+1`. Every downstream sign in
Lemmas 6.4.6–6.4.7 and Corollary 6.4.8 flips with it, which is what the recorded correction sets out.

**E1 is a real gap.** Page 59 asserts `Int_{L^♭,V}(x) = Int_{L′^♭,V}(x′)` **and**
`∂Den_{L^♭,V}(x) = ∂Den_{L′^♭,V}(x′)`. Only the full functions depend on `L^♭ + ⟨x⟩` alone; their
horizontal and vertical parts depend on the hyperplane, so the two equalities do not follow
separately. The difference `Int − ∂Den` does transfer, and that is all the induction needs.

The other three are printed as quoted: the proof of Corollary 6.4.8 on p.42 cites "Lemmas 6.4.8 and
6.3.1", the first of which is the corollary itself (E3); Example 3.5.2 on p.18, which is about a
rank-one `L`, writes `val(L^♭)` where `L^♭` is reserved for the rank `n − 1` lattice, and the two
theorem statements name `𝕍` where Definitions 10.1.1 and 10.2.3 put the lattices in the split space
`𝕎_n` (E4); and p.3 attributes the basis-independence of `Int(L)` to Terstiege's proposition, which
is the `n = 3` case — Howard's introduction says as much — where Howard's Corollary D is the
general-`n` statement (E5).

## What this review did not do

I read §§1, 3, 6, 8 and 10 around the findings and the statements of the results the routes cite, not
all 92 pages line by line. I add no finding of my own, and the published JAMS text was not compared,
as the extraction records.
