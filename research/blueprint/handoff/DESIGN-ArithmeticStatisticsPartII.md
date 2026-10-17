# Handoff: DESIGN-ArithmeticStatisticsPartII (issue #3429)

Worker: Claude (Opus 5.5), session claude-hzGakF, 2026-10-17. Status of the packet: **complete** (all seven layers planned, none closed).

## What was decided

The job grouped four paper routes under one id. They are independent directions with disjoint objects and suppliers, so, as the job allows, this roadmap plans the **first** route only — Liu–Wood–Zureick-Brown, Part I: random Γ-groups and the nonabelian Cohen–Lenstra–Martinet heuristics — and the packet's `restructure` proposes the other three as their own Part II roadmaps of ArithmeticStatistics, keeping their route ids:

- `ArithmeticStatisticsPartIIRandomPolynomials` (PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23);
- `ArithmeticStatisticsPartIISchinzelAverages` (PAPER-SKOROBOGATOV-SOFOS-23);
- `ArithmeticStatisticsPartIISmithMethod` (PAPER-KOYMANS-PAGANO; read the fixes FIX-RT-PAPER-KOYMANS-PAGANO already applied to the ArithmeticStatistics packet first).

**Id collision.** `research/blueprint/packages/ArithmeticStatisticsPartII` (integral orbit dictionaries) was created by the same day's package split of ArithmeticStatistics (#10251). It is not an atlas roadmap, so the atlas does not clash now, but the two will clash on promotion or upstream. The packet's second `restructure` entry proposes renaming this roadmap to `ArithmeticStatisticsPartIIRandomGammaGroups` — the id its paper route uses and that ArithmeticStatistics ST.5's notes already cite as the owner of the random-group derivation. The maintainer decides; the four files keep the job's names until then.

## Deliverables

- `research/blueprint/roadmaps/ArithmeticStatisticsPartII.json` — area `algebraicnt`, parent ArithmeticStatistics, seven layers RG.0–RG.6.
- `research/blueprint/packets/ArithmeticStatisticsPartII.json` — 42 nodes (8 definitions, 8 constructions, 24 theorems, 1 lemma, 1 comparison), 132 API items, 67 unit tests, 29 planets, 30 baseline declarations (all read at the pins), 11 requests, 1 gap, 15 source issues, 2 restructure proposals.
- `research/blueprint/readmes/ArithmeticStatisticsPartII.md` — rendered from the packet with a hand-written introduction, scope/boundaries and conventions, so the document and the packet agree by construction.
- `research/blueprint/suggested/ArithmeticStatisticsPartII.lean` — 248 lines.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatisticsPartII.json` with the pinned declaration index: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on the five files: 0 problems.
- **Lean:** `lean-check research/blueprint/suggested/ArithmeticStatisticsPartII.lean` (Mathlib 082e2d3, Tau Ceti f790474) elaborates with **`sorry` as the only warning**. `scripts/check_sorry_data.py` passes (no sorry'd data definitions).
- A dry atlas assembly (`build.assemble` with the packet, reader and definition patched in, nothing written): the roadmap enters with 7 layers and 29 planets, 48 new stage edges, **no skipped (cyclic) links**.

## Layers and what each plans

- **RG.0** Γ-groups, the map Y, the hypothesis (SZ_Γ) (non-abelian H¹(Γ, N) = 1 for finite |Γ|′ N), sections ↔ Y (Lemmas 3.4–3.6), admissibility facts (Lemmas 3.9, 3.12, the abelian criterion of §7.1).
- **RG.1** level-𝒞 completions (closure under products, Γ-subgroups, Γ-quotients — not the extension-closed pro-C completion, per RT-PAPER-LIU-WOOD-ZUREICKBROWN-24/2), F_n(Γ), 𝓕_n (Lemma 3.1, Remark 3.2), its universal property (Corollaries 3.8, 3.10, finiteness of (𝓕_n)^𝒞), Property E at a level and Proposition 3.13.
- **RG.2** the space 𝒫 (with the level-tower model that makes it a set and second countable) and the random groups X_{u,n}, μ_{u,n}.
- **RG.3** Liu–Wood §§5–7 for operator groups, the fundamental sequence and multiplicities, Proposition 4.3, H-extensions and the Möbius function, Lemma 4.6, Proposition 4.7 / Corollary 4.8, the λ-invariants, Liu–Wood Lemma 8.11, Theorem 4.12.
- **RG.4** chief factor pairs and Γ-chief factor pairs, Lemma 5.4, Corollary 5.9, Lemma 5.10, Theorem 5.12 (all u), μ_u and μ_Γ, Theorem 1.2 with (5.13), Theorem 5.15.
- **RG.5** Lemma 6.1, Theorem 6.2, the coprime lattice lemma, §7.1 (Cohen–Lenstra–Martinet), the p-covering group and nucleus, Theorems 7.4 and 7.5 (Boston–Bush–Hajir).
- **RG.6** Conjecture 1.3 as a proposition, consistency with the Galois side, the comparison with ST.5's function-field moment theorem, Lemma 3.17 and Proposition 3.22.

## Imports (never re-planned)

- InverseGaloisAndArithmeticFundamentalGroups (accepted packet): `IG.4/unramified-gamma-groups` (admissibility and the Γ-action on Gal(K^#/K)), `IG.4/property-e`, `IG.4/unramified-property-e`, `IG.4/coprime-profinite-complements`.
- ArithmeticStatistics (accepted): `ST.5/cohen-lenstra-measure`, `ST.5/cohen-martinet-predicted-surjection-moment`, `ST.5/complements-of-a-coprime-abelian-normal-subgroup-are-conjugate`, `ST.5/liu-wood-zureick-brown-function-field-moments`, `ST.5/cohen-lenstra-martinet-moments-over-function-fields`. ST.5's notes say this Part II imports ST.5; nothing here is cited by ST.5, so there is no cycle.
- Tau Ceti at the pin: `TauCeti.haarProb`, `TauCeti.haarProb_eq_uniformOn_univ`, `TauCeti.profiniteOrder`, `TauCeti.maximalProPQuotient`, `TauCeti.IsProP`. Tau Ceti roadmaps: ProfiniteProPGroups Layers 0, 1, 3, 4, 5; ProfiniteCohomology Layer 5; ClassFieldTheory Layer 12.

## Requests made (11)

To `IG.4/property-e` (state Property E for an arbitrary full subcategory, LWZB Definition 2.3), to `IG.4/coprime-profinite-complements` (record that conjugacy needs solvability or Feit–Thompson), to ProfiniteProPGroups Layers 0, 1, 3, 4, 5 (free pro-C groups at the pin are absent; Tau Ceti main has `TauCeti.freeProC`), ProfiniteCohomology Layer 5 (five-term sequence), ArithmeticGaloisDuality:R02.3 (Koch Theorem 11.3; NSW Corollary 8.7.3), ClassFieldTheory Layer 12 and FunctionFieldArithmetic:FA.4 (Hilbert class fields over Q and F_q(t)).

## Gap (1)

Conjugacy of coprime complements for non-solvable Γ, i.e. the Feit–Thompson theorem, which neither library nor any atlas layer has (Tau Ceti's CFSGStatement roadmap does not state it). Every statement using it carries (SZ_Γ) explicitly; (SZ_Γ) is planned as proved for solvable Γ and abelian kernels, which covers every test case. ArithmeticStatistics ST.5 records the same gap.

## Source issues

Fifteen, ArithmeticStatisticsPartII/E1–E15, against arXiv v2 (the published version is paywalled; `sourceVersions` says so). Most were found by the paper extraction and its review (each entry names its PAPER-LIU-WOOD-ZUREICKBROWN-24 number); I re-read each at its locator. The main one, E6 (the explicit limit formulas need Property E), I re-derived: for Γ = Z/2, p = 3, H = F_3² with σ = −1 at 3-class ≤ 2, the trivial-action factor has λ = 2 and m = 1 for every n, the σ = −1 factor λ = 1, and the printed (4.14) at u = 0 is (1/48)∏(1 − 3^{−i})∏(1 − 2·3^{−i}) ≈ 2.698·10^{−3}, while the true value is 0. E15 (Lemma 3.17's function-field case uses O_K^× = F_{q^r}^×, false for totally real K with Γ ≠ 1) is recorded with the repair through the complete curve, which is planned at target level only.

## The suggested Lean file

It states what the pins can carry: `yMap` and its API, `countSur`, `hEnd`, `closedNormalClosure`, `IsPrimeTo`, `IsAdmissible` (IG.4's notion restated for prototyping), `CoprimeH1Trivial` with its solvable and abelian cases and two consequences, `HasPropertyE` for finite Γ-groups, `IsMinimalNormal`, the Haar-to-uniform pushforward, Liu–Wood Lemma 8.11, and unit tests for Z/3 and Z/4 with Γ = MulAut. The free (admissible) Γ-groups, level completions, 𝒫, X_{u,n}, μ_u, chief factor pairs, H-extensions, λ, the p-covering group and the conjecture have no carriers at the pins (free pro-C groups are not at f790474; completions for non-extension-closed classes and measures on isomorphism classes do not exist), so their API items and tests are README targets, as the 2026-10-12 shape rule requires. The file header says so.

## What a follow-up must do

- Each layer is `planned`, not `closed`; the `remaining` lists name the lemma-level splits (Liu–Wood §§5–9 in RG.3–RG.4; measurability of the class map in RG.2; the function-field Lemma 3.17 in RG.6).
- Once the maintainer decides the rename and the split, queue the three design jobs above.

## Sources read

- Liu–Wood–Zureick-Brown, arXiv:1907.05002v2, PDF SHA-256 7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9 (the same file as the paper extraction): Part I §§1–7 read in full; §§8–10 consulted.
- Liu–Wood, arXiv:1708.08509v2, PDF SHA-256 49f8dc52d96bd168723e8b92e7ce3c3734261d923684c2b9202c0bc84cd350fe: §§2–9, Lemma 11.3, Lemma 12.5.
- Not read: the published Invent. Math. version (paywalled); Boston–Bush–Hajir, Boston–Wood, Wang–Wood, Koch, Neukirch–Schmidt–Wingberg and Ribes–Zalesskii, which are cited only for statements the papers quote.
