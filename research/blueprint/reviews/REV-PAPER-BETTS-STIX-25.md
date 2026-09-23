# Review of PAPER-BETTS-STIX-25

**Job** REV-PAPER-BETTS-STIX-25 (issue #2176) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All seven routes accepted; all six `sourceIssues` confirmed;
nothing corrected, rejected or deleted.

Paper: L. Alexander Betts and Jakob Stix, *Galois sections and p-adic period mappings*,
[Ann. of Math. **201** (2025), 79–166](https://doi.org/10.4007/annals.2025.201.1.2); arXiv
[2204.13674](https://arxiv.org/abs/2204.13674).

Reviewed: `research/blueprint/papers/PAPER-BETTS-STIX-25.result.json` and its report. The
machine-readable verdict is `PAPER-BETTS-STIX-25.review.json` beside the extraction.

## The version, and the boundary the extraction records

The extraction read arXiv v1, reproduced here: sha256
`7d4b7d49c09b979ce4485251ea6f77527fcdb7c516ed7296d20c42e947ef0c18`. It records, as the gap
`G-source`, that the published Annals text (revised May 2024) is not openly available and was not
compared, and asks the review to compare the published numbering if it can.

**It cannot.** I tried the Annals article page for volume 201, issue 1, paper 2 and the two
canonical PDF paths under `wp-content/uploads/`: the article page offers only an abstract behind a
subscription notice, and both PDF paths return 404. Annals opens its back issues after some years —
which is why a 2019 paper could be checked against the version of record in an earlier job — but
2025 is not yet open. The boundary is real, and the gap is the right place for it.

## Locators

**All locators check out.** Of the 103 checks (every item and finding whose locator names a numbered
statement together with a page), 101 land on a page the locator names, once page *ranges* are parsed
rather than only their first page — the extraction habitually writes "Lemma 2.4, Remark 2.5, pp.7–8"
where the lemma is on 7 and the remark on 8. The two that remain are right when read:

- E1's "Proposition 1.8(c), p.6": Proposition 1.8 begins on p. 5 and its part (c) — the part E1
  quotes — is at the top of p. 6.
- E6's "Remark 6.23(I), p.54": the remark begins on p. 53 and its item (I) is on p. 54.

## Items, statuses and routes

**The library item is right.** `Nat.forall_exists_prime_gt_and_eq_mod`
(`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442`) is Dirichlet's theorem on primes in arithmetic
progression, under that name and with that docstring, at the pinned commit.

**All 19 planned items name layers that exist** — in `data/atlas.json`, or in the designed roadmap
`research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`, which is where LV.1, LV.2, LV.3, LV.8
and LV.10 live.

**Routing arithmetic.** 86 items are routed: the 80 missing ones exactly once each, plus six planned
ones named as items the paper is a good source for.

**The Part II route is correctly formed.** The parent's title in the atlas is exactly "Anabelian
geometry and nonabelian Chabauty", so "Anabelian geometry and nonabelian Chabauty, Part II: Galois
sections and p-adic period mappings" has the form section 16 requires; `arithmeticgeometry` is a
galaxy id; the brief is 323 words. The direction is the parent's own: NC.0–NC.6 build the unipotent
fundamental group, Selmer varieties and quadratic Chabauty for *rational points*, and this paper
does the same for *Galois sections*, with the same objects and the same p-adic Hodge theory.

**The four `source` routes into `MordellLawrenceVenkatesh`** deserve a word, because that roadmap is
not in `data/atlas.json`. It is a designed roadmap under `research/blueprint/roadmaps/`, with layers
LV.0–LV.11, which section 16 explicitly allows a route to name; and the four layers named carry the
subject matter the routes claim (LV.1 Faltings's finiteness lemma and friendly places; LV.2
abelian-by-finite families and Gauss–Manin transport; LV.3 Lagrangian period varieties and the
period maps; LV.7 the rational-point criterion). The remaining two routes go to
`PadicHodgeTheory:P8` and `CohomologyComparisons:CP.6`, both in the atlas and both campaign-origin,
and both plan what is sent to them.

## The six recorded mistakes

All six are printed exactly as quoted and correctly diagnosed.

- **E1 (error, reaching a stated result).** Proposition 6.7(c) on p. 46 reads "the number of ψ ∈ Σ
  satisfying [G_v : G_{w_ψ}] < 4 is ≥ (1/(d+1)) dim_{Q_p}(A)", while the preliminary reduction on
  the same page argues about the *proportion of Σ* in small orbits. Since `#Σ ≤ dim_{Q_p}(A)` with
  equality exactly when A is reduced, (c) as printed is stronger than the proof gives for a
  non-reduced A, and the extraction's counterexample (`A = Q_p[ε]/(ε³)` with trivial action, V the
  base change of `H¹` of an elliptic curve) exploits exactly that. The correction — read (c) with
  `#Σ_A`, or assume A reduced, which every application satisfies since `A ≅ H⁰_ét(X_{y_v,K̄_v}, Q_p)`
  is étale — is the right repair and leaves the applications intact.
- **E2 (gap, the proof).** The proof of Proposition 2.16(1) on p. 12 is quoted verbatim. The step is
  a real gap: `G_v` acts on `Q_p^nr` through `Gal(Q_p^nr/K_{v,0})` only, so averaging over `G_v`
  yields the trace to `K_{v,0}`, not to `Q_p`, and the extraction's counterexample with
  `K_v = Q_{p²}` shows the conclusion fails with `G_v` alone. Its repair — conjugate by the
  Frobenius-semilinear φ, whose image together with `G_v` is dense in `Gal(Q_p^nr/Q_p)` — is
  correct.
- **E3 (gap, the proof).** The proof of Proposition 3.20(8) on p. 28 is quoted verbatim, and its
  appeal to properties (2) and (7) at the total space of a line bundle is exactly the problem: those
  are constructed for smooth **proper** varieties. The suggested repair, writing a line bundle as
  `O(D_1 − D_2)` and computing `c_1` from cycle classes of divisors, stays inside the proper world.
- **E4 (misprint).** Lemma 4.12 on p. 38 prints `H^1_dR(X_{y′_0}/L_{w_i})`; the paragraph
  immediately before it and the decomposition (4.3) both have `X_{y′_i}`.
- **E5 (misprint).** The display (∗) on p. 51 prints `M^1(Φ) ≅ (D_pH(A), D_pH(V))`, a pair on the
  right and a single module on the left; `M^{≤1}(Φ)` is what the proof then uses.
- **E6 (gap).** Remark 6.23(I) on p. 54 is quoted verbatim, including the conclusion that "K′ is
  linearly disjoint from Q(ζ_{q−1})". The stated choice of `r_0` (above the odd prime divisors of
  `[K′ : Q]`) does not rule out `K′ ∩ Q(ζ_{q−1}) = Q(√±r)` for a prime `r ≥ r_0` dividing `q − 1`
  that ramifies in K′; taking `r_0` above every ramified prime of K′ does.

## What this review did not do

- The published Annals text was not compared, for the reason above.
- The cited theorems (`[LV20]`, `[Sch13]`, `[Shi20]`, `[HS12]`, `[Fon94b]`, `[Ber02]`, `[KO68]`,
  `[Del74]`) were read only as this paper states them, which is the extraction's `G-inputs` gap; the
  six prerequisites it lists are not already covered in `papers.json`.
- No Lean file was written or compiled; the only library claim is the single Dirichlet citation,
  checked at the pin.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BETTS-STIX-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
