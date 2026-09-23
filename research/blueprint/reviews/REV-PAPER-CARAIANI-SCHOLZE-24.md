# Review of PAPER-CARAIANI-SCHOLZE-24

**Job** REV-PAPER-CARAIANI-SCHOLZE-24 (issue #1076) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** The single route accepted; all twelve `sourceIssues` confirmed;
nothing corrected, rejected or deleted.

Paper: Ana Caraiani and Peter Scholze, *On the generic part of the cohomology of non-compact unitary
Shimura varieties*, [Ann. of Math. (2) **199** (2024), 483–590](https://doi.org/10.4007/annals.2024.199.2.1);
arXiv [1909.01898](https://arxiv.org/abs/1909.01898) v2, the accepted version, which the extraction
read and whose hash it records — reproduced here as
`803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e`.

Reviewed: `research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-24.result.json` and its report, written
by session `cc-39fac3`.

## The statuses, which are the unusual part

**68 of 70 items are `planned` and only two are `missing`.** That ratio is the opposite of every
other extraction I have reviewed, so it is the first thing to check — an extraction that marks items
`planned` too freely would hide work rather than schedule it.

It is right. `IgusaVarietiesAndTorsionConcentration` ("Igusa varieties, compactified period fibers
and torsion concentration") was designed **from this paper**: its layer descriptions cite "CSnc
§2.1" and name the paper's own constructions — well-positioned subsets, partial toroidal
compactifications of central leaves, fibres of compactified Hodge–Tate maps. So 55 of the 68 planned
items land in the roadmap built for them, and the remainder go to the layers that own their subject
(`PELModuli` M1–M3 for the integral models, `ShimuraCompactifications` C0/C4/C5 for the toroidal and
minimal compactifications, `PerfectoidShimuraVarieties` S1–S3 and S6 for the perfectoid tower and
the period map, `EndoscopicTransferAndUnitaryTraceComparison` ET.1–ET.7b for the trace formula and
base change, and the étale-cohomology layers for the sheaf theory). All **35** distinct planned layer
ids exist in `data/atlas.json`.

**The two missing items** are Theorem 2.7.3, the Newton stratification of the flag variety recalled
from [CS17, §3], and the ordinary stratum. The route sends them to `BunGAndNewtonStrata` BG2–BG3
with a reason that is the most useful sentence in the routing: BG2–BG3 own `|Bun_G| → B(G)`, the
semicontinuity of ν and the Newton strata, while **IG.3–IG.7 use "flag Newton strata" without
constructing them**. That is a real gap in the atlas's supply chain, found by reading the layers
rather than by pattern-matching. Both stages exist and the roadmap is campaign-origin.

## Locators

Of the 92 name-and-page checks, **89 land on exactly the page given**. The three others are a part
of a theorem or a step of a proof that runs onto the next page, each confirmed by reading: Theorem
2.5.9 is stated on p. 27 with its part (4) — the part E3 quotes — on p. 28, and Theorem 6.4.1 is on
p. 84/86 with the passages E11 and E12 quote in its proof on pp. 85 and 87.

## The twelve recorded mistakes

All twelve are printed exactly as quoted. Several can be checked beyond the quotation, and I did:

- **E2 and E3 form a coherent pair.** §2.5.4 on p. 26 derives, from its stated hypothesis,
  "inclusions M_{Z′} ⊂ M_Z and P_{Z′} ⊂ P_Z", and uses that direction again two sentences later;
  Theorem 2.5.9(4) on p. 28 prints "via the inclusion M_Z ⊆ M_{Z′}". The two passages contradict
  each other, so at least one is wrong, and the two corrections make the paper self-consistent: E3
  turns the theorem's inclusion round, and E2 turns the hypothesis of the order round so that the
  conclusion §2.5.4 states is the one that follows.
- **E12 is refuted by the paper's own labels.** "Proposition 2.8.4 and Corollary 2.8.2" on p. 87
  names two statements whose other occurrences, on pp. 34 and 36, are **Lemma** 2.8.4 and
  **Proposition** 2.8.2.
- **E8 I checked in the cited paper.** The finding says that "Theorem 5.5.3 of [CS17]" is the arXiv
  numbering and that the published Annals text — which the bibliography cites — has the Galois
  representations as Theorem 5.5.4. I fetched the published [CS17] from the Annals site (Ann. of
  Math. 186 (2017), open access) and read it: **Remark 5.5.3** is a remark, and **Theorem 5.5.4** is
  "There exists a Galois representation r_i : Gal(F̄/F) → GL_n(Q̄_ℓ) such that …". The finding is
  exactly right.
- **E6's reasoning is sound.** As printed, `g^♯ = Φ ᵗg^c Φ^{−1}` reverses products, so `θ` would not
  act on the group by an automorphism; the fixed points must be `G_n⃗`, whose defining equation on
  p. 67 gives `g = λΦ ᵗg^{−c} Φ^{−1}`.
- **E1, E4, E5, E7, E9, E10, E11** are single-symbol slips quoted verbatim: "all places of F" for
  "of Q" in the Hasse principle; `w|p` for `w|𝔮` in the Hecke double coset; `Q_p`/`F_0` for
  `Q_v`/`F_{0,w}` in Lemma 5.4.3; a section number lost from "as in Section of [Shi11]"; the
  quotient `Z_{b,−2}/Z_{b,−1}` written the wrong way round; `P_b(A^p_f) × G(A^p_f)` for
  `P_b(Q_p) × P(A^p_f)`; and the Levi `G_{n−r,Q}` for `G_{2(n−r)}`.

## What this review did not do

- The published Annals text of *this* paper was not read; the extraction read arXiv v2, the accepted
  version, and says so. (The published [CS17] I did read, for E8.)
- The sixteen prerequisites were read only as this paper cites them.
- No Lean file was written or compiled; the extraction makes no library claim, and none is needed.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CARAIANI-SCHOLZE-24.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
