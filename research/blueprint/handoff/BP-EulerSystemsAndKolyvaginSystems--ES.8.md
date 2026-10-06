# Handoff: BP-EulerSystemsAndKolyvaginSystems--ES.8

Agent: Claude (session claude-FjaNFZ). Refs #724. Part 2 of 2 of the roadmap's blueprint (`part: "ES.8"`).

## State

- **Packet** `research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.8.json`, status `complete`.
  - 35 nodes: 8 definitions, 8 constructions, 16 theorems, 3 lemmas.
  - 120 API items and 64 unit tests; 6 planets; 16 baseline declarations, each read at the pinned commits.
  - 8 requests, 2 gaps, 2 source issues, 2 restructuring proposals.
  - `python3 scripts/check_blueprint.py --index <declarations.tsv>` reports 0 errors and 0 warnings.
- **Stage** `EulerSystemsAndKolyvaginSystems:ES.8`: `planned`. Every target the stage states is a node whose
  prerequisite chains end in the libraries, in ES.0–ES.5 of this roadmap, or in requested stages of other
  roadmaps. Its `remaining` list names three refinements (below).
- **Document** `research/blueprint/readmes/EulerSystemsAndKolyvaginSystems--ES.8.md`, about 26,000 words.
  - The node sections are generated from the packet, so the two agree.
  - The framing sections are written by hand: scope, boundaries, conventions, library inventory, part
    introductions, application handoffs, worked examples, dependencies.
- **Suggested Lean file** `research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.8.lean`.
  - It imports Mathlib only.
  - **It compiles:** `lake env lean`, run through `lean-check` in the shared build at Mathlib `082e2d3`, exits
    with code 0. Its only warnings are 41 `declaration uses 'sorry'`.
  - Real declarations:
    - `ZpdExtension`, `NoSplitPrimes`;
    - the statable parts of `Hyp(K∞, T)`, `Hyp(K∞, V)` and `Hyp(K∞/K)`;
    - `lambdaIndex`, `ind`, `indKS`;
    - `blindSpot`, `IsLambdaPrimitive`, with the residual-primitivity lemma proved;
    - `exceptionalSet`, `specRing`, `specRep`, `perturb`;
    - `LambdaSelmerStructure` with its canonical and ordinary instances, and `canonical_selmer_eq` proved;
    - Rubin's Lemma VII.1.8;
    - stand-ins `IsPseudoNull`, `IsPseudoIso` and `charIdeal`, the last for `PadicMeasuresIwasawaAlgebras`
      L4's `TauCeti.Iwasawa.charIdeal`.
  - The declarations that need Galois-cohomology, Euler-system or Kolyvagin-system carriers are recorded as
    suggested signatures in comments, under the packet's names. Every API item and unit test name of the
    packet occurs in the file.
  - The build used Tau Ceti `cf38662`, not `f790474`. The file imports no Tau Ceti module, so this does not
    matter.

## What the layer plans

- **ES.8a: Rubin's Iwasawa theory of Euler systems** (21 nodes; *Euler systems* Ch. II §3, VI, VII, IX §2).
  - Definitions and constructions: admissible `ℤ_p^d`-extensions; `Hyp(K∞, T)`, `Hyp(K∞, V)` and `Hyp(K∞/K)`;
    `X∞`; `c_{K,∞}`; `ind_Λ`; the true Iwasawa Selmer group and the singular local term; twisting by
    infinite-order characters of `Γ`; the evaluation maps and `a_τ`; condition (*).
  - Theorems: twisting invariance (VI.4.1), restriction control (VII.3.3–3.4), finite generation (VII.4.1),
    weak Leopoldt (II.3.2), the rank-one Leopoldt case (VII.3.7), the Selmer/Kolyvagin-sequence induction
    (VII.1.4, VII.1.6), the error-tolerant bound (VII.1.9), II.3.3, II.3.4, II.3.7 and II.3.8.
- **ES.8b: Λ-adic Kolyvagin systems** (14 nodes; Mazur–Rubin §5.3, Howard §2.2, Castella–Grossi–Lee–Skinner
  §3.4, Büyükboduk).
  - `𝐓 = T ⊗ Λ` with the canonical and ordinary Selmer structures; `KS` and `KS‾`; the map from Euler systems
    (5.3.3).
  - The exceptional set `Σ_Λ`, the rings `S_𝔓` and specialization, control (5.3.13–5.3.14, Howard 2.2.7–2.2.8)
    and the generic core rank (5.3.16).
  - The blind spot and Λ-primitivity, with the lemma that residual primitivity implies Λ-primitivity; `Ind`.
  - Theorems: weak Leopoldt for Kolyvagin systems (5.3.6, 5.3.19); Theorem 5.3.10 with its equality criterion;
    Howard's self-dual bound in generic form with hypotheses (A)–(D); the error-tolerant form of Castella et al.

## Red-team finding RT-AREA-iwasawa-1/35 (medium)

The finding asked that ES.8 be split into a rank-one ES.8 and a higher-rank ES.8h. Handled as follows:

- **The plan is rank-one.** No node uses exterior biduals, Stark systems or Gorenstein orders. The in-roadmap
  prerequisites are ES.0–ES.5 only; there is no edge from ES.6 or ES.7.
- **A `split` proposal in `restructure`.**
  - ES.8 requires ES.5 and `SelmerIwasawaCohomology:L3`, and keeps its consumers.
  - New ES.8h, "Higher-rank Iwasawa variation", requires ES.7 and ES.8.
  - Its scope is ES.7's pinned BSS II v1 §§6.1–6.4 route and the rank-one specialisation check against ES.8.
  - The atlas edit itself (`data/atlas.json`, the README) is the maintainer's; the fixes report marks it "now".
- **A second proposal (`rescope`)** divides ES.8 for the atlas into the sub-layers ES.8a and ES.8b.

## RS-04

RS-04 is accepted (review of 2026-09-30). It keeps EulerSystemsAndKolyvaginSystems and gives ES.8 the
"generic Iwasawa tower and control interfaces" formerly in HE.8. These are `specialization-control`,
`height-one-specialization`, `lambda-adic-selmer-structure` and `self-dual-lambda-adic-kolyvagin-bound`.

## Maintainer-added sources

- **Castella–Grossi–Lee–Skinner (ES.4, ES.8).**
  - Theorem 3.4.1 and Corollary 3.4.2 are `error-tolerant-self-dual-lambda-adic-bound`.
  - The finite-level items /18–/23 belong to ES.4 (part 1, issue #723).
  - The extraction's E29 (character convention, residue-degree factor) and E32 (missing control at `γ − 1`)
    are built into the node.
- **Kolyvagin 1990 through Rubin's book (ES.0–ES.4, ES.8).**
  - The items the extraction plans at ES.8 are all nodes: Remark II.1.2, `Hyp(K∞/K)`, `Hyp(K∞, T)`,
    `Hyp(K∞, V)`, Definition II.3.1, Theorems II.3.2–3.4 and II.3.8.
  - So is the routed item r9-cond-star-split-primes (`unramified-at-split-primes-condition`).
  - The other Chapter IV, V and IX items are finite-level and belong to ES.0–ES.4.
- **Dasgupta–Kakde (ES.6, ES.7) and Liu et al. (ES.1, ES.4)** route nothing to ES.8.

## Requests made (all new)

- **`PadicMeasuresIwasawaAlgebras:L4`**, three requests:
  - multivariable `Λ = O⟦ℤ_p^d⟧` (regular, factorial, pseudo-null modules, characteristic ideals);
  - twisting of characteristic ideals and annihilators by `Tw_ρ` (Rubin VI.1.2);
  - the length asymptotics along Hensel perturbations `𝔓_N = (g + p^N)`.
- **`PadicMeasuresIwasawaAlgebras:L5`**: topological Nakayama.
- **`PadicMeasuresIwasawaAlgebras:L1`**: the automorphisms `Tw_ρ` and the involution `ι`.
- **`SelmerIwasawaCohomology:L3`**: finite generation of `H^i(K_Σ/K, 𝐓)` and `H^i(K_v, 𝐓)`; `H²(K_v, 𝐓)`
  torsion; `H¹` torsion-free (Mazur–Rubin 5.3.4–5.3.5).
- **`SelmerIwasawaCohomology:L4`**: Rubin's Corollary I.6.4.
- **Tau Ceti `ClassFieldTheory` layer 12**: unramifiedness of `ℤ_p^d`-extensions outside `p`, and the
  class-field description used in Lemma VII.3.7.

## What a follow-up must do

These are the coverage `remaining` items.

1. **Rubin Chapter VII §§5–7 at lemma level.** Propositions 5.1–5.2, Lemmas 6.1–6.3, Lemma 7.1 to
   Proposition 7.7 are folded into `kolyvagin-sequence-induction`. The statements were read, the proofs
   partly; refine them when the roadmap moves to lemma level.
2. **Kato's `H²(T)_0` against `X∞`.** This is the first gap. ES.8 supplies Rubin's package, and the comparison
   with Kato's form has no public source. `KatoEulerSystems` L4 must prove `X∞ ≅ lim Ш²(O_{F,Σ}, T)` and
   compare Kato's étale `H²` with Galois `H²`, or work with Rubin's package directly. It must also verify
   Rubin's `Hyp(ℚ∞, V)`, where Kato states irreducibility over `G_ℚ` only.
3. **Büyükboduk's freeness theorem** (Theorem 3.23) is cited only as a test value. Plan it if a consumer
   needs it.

The second gap records that Mazur–Rubin's Λ-adic theorems (5.3.3, 5.3.10) are written over `ℚ` and the
cyclotomic tower only. The nodes state them there; the definitions are written for a `ℤ_p`-extension of a
number field.

## Source issues

- **E801 (new, misprint).** Mazur–Rubin's Definition 5.3.8 prints `Ind(c) = char((H¹/Λc)_tors)`. This gives
  `Ind(0) = Λ`, but the gcd description and the authors' proof of 5.3.10 use `Ind(0) = 0`. The packet adopts
  `Ind(0) = 0`. The published Memoir could not be checked: the AMS site returned HTTP 403.
- **E802 (misprint, already corrected in print).** Rubin's 1999 draft writes `φ` for `ψ` in the proof of
  Theorem II.3.8. The published text (p. 43, read on the page image) prints `ψ`.

## Sources read

| Source | Version and SHA-256 | What was read |
| --- | --- | --- |
| Rubin, *Euler systems*, 1999 draft | `de47655d…` | Ch. II §§1–4, VI, VII §§1–4 in full, VII §§5–7 statements and part of the proofs, IX §2, App. C §2 |
| Rubin, *Euler systems*, published version (wstein.org copy) | `1b022973…`; the text layer is unreadable | page images of pp. 36 and 41–43 |
| Mazur–Rubin, *Kolyvagin systems*, authors' version of 20 October 2003, from Cornut's course page | `4cc432d0…` | §3.1, §3.2, §3.5, §5.3 in full, Appendix A on Theorem 5.3.3 |
| Howard, *The Heegner point Kolyvagin system*, arXiv:1202.6340v1 | `d2d06e85…` | §§2.1–2.2 |
| Büyükboduk, *Λ-adic Kolyvagin systems*, arXiv:0706.0377v2 | `645d2992…` | §§1, 2.1–2.2, 3.2 end, 4.1 |
| Castella–Grossi–Lee–Skinner, arXiv:2008.02571v2 | `7cd995e0…` | §§3.1, 3.2, 3.4, and Theorem 4.1.1 |

Sources missing:

- the published Mazur–Rubin Memoir (paywalled);
- Kato's Astérisque 295, which this layer does not need beyond its consumer's packet;
- Perrin-Riou's works and Greenberg 1989, cited by Mazur–Rubin for Lemmas 5.3.4–5.3.5 (requested from
  `SelmerIwasawaCohomology` L3).
