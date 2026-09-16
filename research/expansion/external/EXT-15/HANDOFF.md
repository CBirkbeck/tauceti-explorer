# EXT-15 handoff — Iwasawa theory and special values

Worker: external tmux session, 15 September 2026.
Assignment: seven roadmaps, 68 atlas stages.
All packets are `status: partial`; every node is `implementationStatus: unchecked`.
No Lean work, no tickets, no sorries. Nothing under `data/`, `content/`, `tests/`,
`src/`, other jobs' directories or `HANDOVER.md` was touched.

## Files written

| packet | nodes | links | gaps | coverage |
|---|---|---|---|---|
| `KatoEulerSystems.json` | 22 | 15 | 6 | 5 stages, all `partial` |
| `EulerSystemsCyclotomicMainConjecture.json` | 16 | 16 | 6 | 5 stages, all `partial` |
| `GrossZagierAndArithmeticHeights.json` | 9 | 12 | 6 | 10 stages (9 `partial`, 1 `not_read`) |
| `HeegnerPointEulerSystems.json` | 8 | 8 | 7 | 12 stages (8 `partial`, 4 `not_read`) |
| `GeneralizedHeegnerCycles.json` | 6 | 6 | 6 | 9 stages (7 `partial`, 2 `not_read`) |
| `ModularIwasawaMainConjectures.json` | 5 | 5 | 6 | 7 stages (5 `partial`, 2 `not_read`) |
| `IntegralIwasawaTheory.json` | 7 | 6 | 6 | 20 stages (6 `partial`, 14 `not_read`) |
| **total** | **73** | **68** | **43** | **68 stages: 48 partial, 20 not_read** |

Validated with `python3`: valid JSON; every `parentStageId` is a real stage of the
owning roadmap; every node id is under its parent; every link endpoint resolves;
every stage of every assigned roadmap appears exactly once in coverage. The
combined node graph is acyclic, and collapsing every new link to stage level and
adding it to `data/atlas.json`'s 3508 existing `stageEdges` still gives an acyclic
graph (the pre-existing graph is also acyclic). 21 new cross-stage edges.

## Sources actually read

Hash = `sha256` of the file inspected; page numbers are the ones printed on the page.

- **Kato, Astérisque 295 (2004) 117–290** `3c6e14b1…` — Intro; §1 pp. 121–124 in full
  incl. the proof of Prop. 1.3; §2 pp. 125–133 incl. proofs 2.11–2.13; §8 pp. 180–185
  incl. the proof of Lemma 8.5; §9 pp. 186–189; §10 opening; §12 pp. 219–224;
  §13 pp. 224–227; §17.1–17.5 pp. 272–274.
- **Rubin, *Euler systems* (1999 AWS author draft)** `de47655d…` — Ch. II §2 pp. 24–26,
  §3 pp. 26–29; Ch. III §1 close p. 33, §2 pp. 33–39 in full, §3 pp. 39–40.
- **Greither, Ann. Inst. Fourier 42 (1992) 449–499** `8e4db974…` — §1 pp. 451–454;
  §2 statements pp. 458–466; §3 pp. 468–470 incl. the full proof of 3.1 ⇒ 3.2.
- **Rodrigues Jacinto–Williams, arXiv:2309.15692v2** `efa1e101…` — §13.2–13.4 pp. 66–68.
- **Yuan–Zhang–Zhang, *The Gross–Zagier Formula on Shimura Curves*, AMS 184 (2013)**
  `6a87b131…` — Ch. 1 pp. 1–19 in full; Ch. 7 §7.1 pp. 206–212.
- **Yuan–Zhang–Zhang erratum (28 June 2026)** `e4c4eaeb…` — read in full.
- **Howard, arXiv:1202.6340v1** `d2d06e85…` — §0; §1.1, §1.3; §1.5–1.6 pp. 15–19;
  §1.7 pp. 19–21 in full with all proofs; §2.3 pp. 29–30.
- **Cornut–Vatsal, *Nontriviality of Rankin–Selberg L-functions and CM points***
  `bdf258c7…` — §1.1–1.2 pp. 5–6.
- **Bertolini–Darmon–Prasanna, Duke 162 (2013) 1033–1148** `223bfdad…` — §0 pp. 1033–1039.
- **Castella–Hsieh, *Heegner cycles and p-adic L-functions* (revised)** `5c85ea3c…` —
  Thms. 4.9, 5.7, 6.1–6.4; Lemma 7.5, Prop. 7.8 and its correcting footnote.
- **Castella–Hsieh erratum** `2a8b615d…` — read in full.
- **Longo–Vigni, arXiv:1605.03168v1** `afc1a214…` — §2.2–2.3; §3 statements; §4 statements.
- **Fouquet–Wan, arXiv:2107.13726v3** `39cee6ce…` — §1.1 pp. 5–8; Lemma 4.50, Thm. 4.51.
- **Burungale–Castella–Skinner, arXiv:2405.00270v2** `bf87592c…` — §1 pp. 1–3.
- **Dasgupta–Kakde–Silliman–Wang, arXiv:2310.16399v1** `e32514db…` — §1.1–1.2 pp. 3–5.
- **Kurihara, *On class groups and Iwasawa modules of CM-fields* (2025)** `22ebb98e…` —
  Intro; §2.6 pp. 13–14; §4.1–4.2 pp. 23–25.

## Corrections and checks against the existing atlas text

**Findings that change what a later reader should do:**

1. **`HeegnerPointEulerSystems` — reversed edge.** `data/atlas.json` has
   `HE.8 → HE.8c` and `HE.8b → HE.8c`, i.e. HE.8c consumes HE.8. Mathematically the
   Cornut–Vatsal nonvanishing is an **input** to Howard's Theorem B ("The class
   κ^Hg₁ … is nonzero by the work of Cornut and Vatsal", §0 p. 2); without it the
   Λ-adic system may be zero and Theorem B is vacuous. A `HE.8c → HE.8` edge was
   drafted and then **withdrawn**, because with the existing edges it creates four
   stage-level cycles. **No cycle has been introduced.** Recorded as a gap; the
   integrator must decide whether HE.8c is a downstream note or an upstream supplier.
2. **`HeegnerPointEulerSystems:HE.8b` duplicates `HE.8`.** The two stage records
   carry byte-identical `description` fields (both headed "## HE.8 …", both declaring
   milestone HE.8) but differ in id, title and consumers. HE.8b is marked `not_read`
   rather than given a copy of HE.8's nodes. `ModularIwasawaMainConjectures:L6` routes
   its ordinary anticyclotomic branch to HE.8b, so that table cannot be followed
   until this is resolved.
3. **`EulerSystemsCyclotomicMainConjecture:L2` — the source proof is weaker than the
   stage text implies.** Rubin's Thm. III.2.7 first yields
   `char(A_∞^χ) | J² char(E_∞^χ/C_∞,χ)` and removes `J` using Leopoldt for the real
   abelian field `L`; he gives that last step **as a sketch only**. The stage's
   requirement to "prove their removal" is therefore not discharged by the source.
4. **`KatoEulerSystems:L4` — Thm. 13.4 is an import with a non-matching hypothesis
   package.** Kato's (iv) is irreducibility over `Gal(Q̄/Q)`; Rubin's `Hyp(K_∞,T)`
   requires it over `Gal(Q̄/Q(μ_{p^∞}))`, plus `T/(τ−1)T` free of rank one. Kato's
   `H²(T)₀` versus Rubin's `X_∞` needs a Poitou–Tate identification neither source
   performs in the sections read.

**Atlas claims checked and CONFIRMED (no edit needed):**

- `EulerSystemsCyclotomicMainConjecture:L0` — the warning that `(ξ⁻¹−1)/(ξ−1) = −ξ⁻¹`
  is torsion is correct; Rubin uses `N(ζ_{mp}−1)` and Kato uses `(1−ζ_m)(1−ζ_m⁻¹)`.
- `EulerSystemsCyclotomicMainConjecture:L2` — "Rubin III.2.7 … char(Y_∞^χ)" matches
  Rubin's `A_∞^χ` under class field theory. Notation dictionary, not an error.
- `GeneralizedHeegnerCycles:GH.2` and `GH.6` — all four Castella–Hsieh corrections
  cited by the stage text (Lemma 7.5 needs `L/Q_p` unramified; Prop. 7.8 via
  Kobayashi–Ota **Lemma 4.10**; Lemma 7.10 is about *abelian* p-ramified extensions;
  Thm. 6.3's corrected `(1−ε)/2` formula) are **exactly right**. One refinement: the
  revised paper's own footnote cites the same result as `[KO18, Lemma 5.7]` — a
  different numbering of the same Kobayashi–Ota result, not a discrepancy.
- `GrossZagierAndArithmeticHeights:GZ.6`/`GZ.7` — the stage's insistence on
  push-forward special cycles and on the modular-case exception are erratum items 30
  and 1/16 respectively. Also confirmed: Saito–Tunnell is `ε = χ(−1)ε(B)` (no `η(−1)`),
  `Σ(A,χ)` drops `η_v(−1)`, and the toric measure is `vol = 2L(1,η)`, **not** Tamagawa.
- `GeneralizedHeegnerCycles:GH.5` — Longo–Vigni's `Ξ`, the four clauses of Def. 2.1
  and the exclusion of `K = Q(i), Q(√−3)` are all as stated.
- `ModularIwasawaMainConjectures:L1` — FW Thm. 1.6 does carry both caveats the stage
  names (the lifted `k ≡ 2 mod p−1`, and §4.8's period workaround).
- `IntegralIwasawaTheory:L4` — **circularity check performed.** Greither uses `μ = 0`
  as an *input* to discard accumulated factors, which is the direction the stage
  permits. No circularity found in the sources read.

## Shared-supplier requests

- **`ColemanPowerSeries:L4` owner.** New edge proposed into
  `EulerSystemsCyclotomicMainConjecture:L3/local-unit-index-…`. Output supplied:
  `char(U_∞^χ/C_{∞,χ}) = L_χ Λ` (Rubin III.2.9(ii)) = `U⁺_{∞,1}/C⁺_{∞,1} ≅
  Z_p[[G⁺]]/(I(G⁺)ζ_p)` (RJW 12.23). **Rubin cites this rather than proving it**;
  Greither §2 (Thms. 2.4/2.6/2.8/2.13, Cor. 2.14) gives an independent route valid
  for abelian `F` unramified at `p`, **including p = 2**.
- **`EulerSystemsAndKolyvaginSystems:ES.8` owner.** New edge proposed into
  `KatoEulerSystems:L4/imported-euler-system-bound-…`. Please check ES.8's interface
  actually yields Kato's (i)–(v); see correction 4. **One reading discharges this for
  two EXT-15 packets:** Rubin Ch. VII §1 and §4 plus Ch. I §7, all in the supplied draft.
- **`IntegralIwasawaTheory:L1` owner** (same worker): edge into
  `…L3/main-conjecture-endpoint-…`, refining the existing stage-level prerequisite.
- **`GrossZagierAndArithmeticHeights:GZ.8` owner** (same worker): edge into
  `HeegnerPointEulerSystems:HE.8c/…`. Cornut–Vatsal's extra hypotheses in their
  Thm. 1.5 exist *only* because the general Gross–Zagier formula was not then
  available; GZ.8 now owns it.
- **`MotivicEtaleKTheory:KU-duality`, `ArithmeticKTheory:KU-finitegeneration`,
  `AutomorphicPadicLFunctions:KU-hilberteisenstein` owners.** The five KU-prefixed
  stages of `IntegralIwasawaTheory` aggregate suppliers across eight roadmaps, none
  assigned to EXT-15. They are all `not_read` and should be decomposed only after
  those suppliers are.

## Acquisition requests — sources needed and unavailable

Verified against `CATALOGUE.json` and by re-running `pdftotext`.

**Present but with NO usable text layer (need OCR):**

- `ADD_MazurWiles_AbelianExtensions.pdf` `4cb3aa50…` — yields only GDZ front matter.
  Blocks `IntegralIwasawaTheory:I.5` and the `[MW] §1.6` analytic step.
- `BSD_GrossKolyvagin.pdf` `60b310c5…` — extraction is **0 lines**. Blocks Gross
  Prop. 3.7 (the Heegner norm relation) and Prop. 6.2 (local conditions), both
  load-bearing in `HeegnerPointEulerSystems:HE.2`/`HE.3`.
- `BSD_GrossZagier.pdf` `a9a52cb8…` — 4 lines of bibliographic metadata only.
- `BSD_ZhangAdmissible.pdf` `ec17d361…` — 36 lines of front matter only. Blocks the
  reduction graph / admissible Green kernel in `GZ.2`.

**Catalogue record but no file at all:**

- Washington, *Introduction to Cyclotomic Fields*, 2nd ed. — needed for `f(T,ψ)`
  (pp. 122–125) and Thm. 13.56. **Unblocks two roadmaps**: the Greither/Rubin
  factor-of-two dictionary and `IntegralIwasawaTheory:L4`.
- Rubin's appendix to Lang, *Cyclotomic Fields I and II* (`[Ru3]` Thm. 4.2, p. 414) —
  the analytic class-number upgrade from divisibility to equality, at both levels.
- Wiles, *The Iwasawa conjecture for totally real fields* — status
  `acquisition_failed`.
- Ferrero–Washington, Ann. of Math. 109 (1979) 377–395.
- Kolyvagin (Izv. 1988/1989), Kolyvagin–Logachev, Rubin Invent. Math. 89 (1987) —
  `HE.7`/`HE.7s`; the stage's own assessment is **confirmed unchanged**.
- Kato, *Generalized explicit reciprocity laws* (`[KK3]`) — the external theorem
  behind Kato Thm. 9.5. No catalogue record found.
- Tunnell; Saito; Waldspurger; Perrin-Riou `[PR87]`; McCallum `[Mc91]`.

## Highest-value next reads (all sources present and extracted)

1. Rubin Ch. VII §1, §4 and Ch. I §7 — discharges the Kato **and** cyclotomic import.
2. Kobayashi–Ota Lemma 4.10 — the only proof of Castella–Hsieh Prop. 7.8.
3. Yuan–Zhang–Zhang §3.3 (Thm. 3.15), §3.6 (Thm. 3.21), §7.2–7.4.
4. Kato §§4–7 (the archimedean half of the reciprocity dictionary) and §§15–16.
5. Fouquet–Wan §4.8; Dasgupta–Kakde–Silliman–Wang §2.5 and §2.7.
6. Bertolini–Darmon–Prasanna §2.3–2.4 and §5 (Thm. 5.13) — shared by `GZ.9` and `GH.1`.
7. Hsieh's nonvanishing theorem, with its local-root-number/conductor/residual
   hypotheses — needed by `GH.6` and unrecorded anywhere so far.
