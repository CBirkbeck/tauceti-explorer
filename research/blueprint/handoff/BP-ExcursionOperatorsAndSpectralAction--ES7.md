# Handoff — BP-ExcursionOperatorsAndSpectralAction--ES7 (issue #728)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-es7`.

## Deliverables

- `research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES7.json` — 24 nodes
  (2 definitions, 3 constructions, 13 theorems, 3 lemmas, 3 comparisons), 30 API items,
  20 unit tests, 17 planets, 22 baseline declarations, 11 gaps, 36 requests, 3
  structural findings. `"part": "ES7"`, `"status": "partial"`.
- `research/blueprint/readmes/ExcursionOperatorsAndSpectralAction--ES7.md` — 2258 lines.
- `research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES7.lean` — 291 lines.
- This note.

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors, 0 warnings**.
- `research/blueprint/intake.py check-files` → 0 problems.
- `python3 -m unittest discover -s tests` → OK.
- **The Lean file was not compiled.** Every `implementationStatus` is `unchecked`.

## The library audit

`AUDIT-20` (reviewed as `REV-AUDIT-20`, 17 September 2026, 240 targets checked, 89
corrections) covers all seventeen layers of this roadmap and returns **not built** for
each. Its target notes pointed to three pinned declarations that a name search would
have missed, and all three are cited rather than re-planned:

- `MeasureTheory.Measure.modularCharacter` — the modulus of a *group* exists; `δ_P` of a
  parabolic and normalised smooth induction do **not**, which is exactly why the
  normalised-induction dictionary cannot yet be stated against the libraries.
- `TauCeti.Cocharacter.parabolic` / `.levi` — the dynamic parabolic with Levi
  decomposition, which the proofs of both IX.7.2 and IX.7.3 pick.
- `Representation.nonempty_equiv_of_character_eq` — semisimple trace determination, but
  only for **finite** groups in characteristic zero; the GL_n comparison needs it for
  continuous Weil-group representations.

The audit's **duplicate** records drove all three structural findings (below).

## Sources

| Source | Read? |
| --- | --- |
| Fargues–Scholze, *Geometrization*, SHA-256 `9ab9efbd0df251bf…` | **IX.7 in full** (pp. 334–338), plus IX.3 and the parts used from IX.5–IX.6 |
| Hausberger, Ann. Inst. Fourier 55 (2005) 1285–1371, SHA-256 `d51dc22168dcd483…` | **read in full** — Introduction, §§1–3, 6–8, 9, 10 |
| Laumon–Rapoport–Stuhler, Invent. Math. 113 (1993) 217–338, SHA-256 `05ea7ab8cb64577f…` | **NOT read** — 124-page image scan, no text layer |
| Kaiser's erratum (author-hosted), SHA-256 `6aa9e01d3551e3f0…` | **NOT read** — 2-page image scan, no text layer |

Both unreadable files were located, downloaded and hashed in this session, and their
URLs and hashes are in the packet's gaps so that a later worker can pick them up.
**Everything this packet attributes to Laumon–Rapoport–Stuhler comes through
Hausberger's restatements**, and every affected node says so in its own `sources`.

## What is planned, layer by layer

- **ES7:parabolic** (8 nodes). Definition IX.7.1; the twisted Levi cocycle inclusion
  `φ(w) ↦ (2ρ_Ĝ − 2ρ_{Ĝ_b})(√q)^{|w|}·φ(w)` with its geometric-Frobenius normalisation
  and its cocycle obligation; and Theorem IX.7.2 and Corollary IX.7.3 **with their proofs
  in full**, split into the coefficient reduction, the basic case and the quasisplit
  reduction, the sequence `b_N` with its modification count, the constant-term
  computation with its degree-zero remark, and the unnormalised induction statement with
  the explicit `(d/2)[d]`, `d = ⟨2ρ,μ⟩`. Plus the dictionary to normalised induction.
- **ES7:GLn-comparison** (4). Theorem IX.7.4 with its proof in full.
- **ES7:equal-characteristic** (7). From Hausberger: `D`-elliptic sheaves; the moduli,
  its smoothness, its projectivity for a division algebra and its extension over a place;
  special formal `O_D`-modules and Drinfeld's theorem; the uniformisation in both forms;
  the fundamental local representation; the Hochschild–Serre spectral sequence and the
  degeneration of its cuspidal part; and the Drinfeld–Carayol theorem.
- **ES7:function-field-automorphic** (4). The global cohomology and LRS 14.9/14.12; the
  globalisation; the transfer with multiplicity one; and Kaiser's erratum.
- **ES7** (1). The assembly: IX.7.4 holds for every `E` because the single external input
  has two different proofs, one per characteristic.

## Three structural findings

1. **`ES7:function-field-automorphic` restates what four other layers own.** `AUDIT-20`
   records four duplicates — `FA.6` is called the *declared supplier*, with `FA.2`,
   `AA.0` and `AA.1` — yet the stage text opens by asking this layer to build restricted
   products, integral orders, the diagonal embedding, degree/central quotients and Haar
   measures. None of that is planned here; it is four requests, and a restructuring job
   should narrow the text.
2. **The trace argument would be written twice.** `ES7:equal-characteristic` is told to
   "repeat `ES7:GLn-comparison`'s trace argument". There is one argument with two inputs.
   It is written once here, in `ES7:GLn-comparison`; the transport is recorded as a gap
   and the shared-node proposal is filed.
3. **`D`-elliptic sheaves and Drinfeld's elliptic sheaves are one construction.**
   `AUDIT-20` records `DrinfeldModulesAndTModules:DM.7` as a duplicate: DM.7's are the
   `D = M_d(F)` case. The general definition is planned here, because the
   division-algebra case is what the local correspondence needs, and a request to DM.7 is
   filed with a proposal that DM.7 be narrowed rather than the reverse.

## What remains

Eleven gaps, each with a next source action. The three that block most:

1. **Laumon–Rapoport–Stuhler is unread.** Obtain a text-bearing copy or run OCR on the
   recorded scan, then check each of Hausberger's restatements — §§4–6, 13, 14, 15.
2. **Kaiser's erratum is unread**, so it is not known whether Hausberger's Théorème 10.1
   already incorporates the correction to Theorem 14.12. Two pages; read them.
3. **The normalised-induction dictionary has no locator.** FS give the twist in two
   places and never state that they cancel. It has to be formulated against `SR.1`–`SR.2`
   and proved, and at the pins it cannot even be *stated*, since `δ_P` is absent.

Also unread and named in the gaps: Kaletha §5 and Fact 5.5; FS VI.11 and VI.12 (the
constant term and the switching involution); Gross–Iancu Theorem 4.26; Hausberger's
Berkovich appendix; and Drinfeld's theorem itself (Boutot–Carayol, Genestier).

## Where to resume

All three parts of this roadmap are now written: `ES0` (issue #726, part ES0, layers
ES0–ES4), `ES5` (issue #727, layers ES5–ES6) and this one. The next work on this roadmap
is its independent reviews, and then the gaps above. The single highest-value source
action across all three parts is **reading FS VIII.5 in full** (pp. 293–300): it closes
the deepest gap of part ES0 and serves `LanglandsParameterStacks:LP3` at the same time.
