# Handoff: BP-DiophantineApproximationAndTranscendence

**Job** `BP-DiophantineApproximationAndTranscendence` (issue #1027) · Claude Code, session `cc-2aeb03` · 24 September 2026.
Baseline: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Deliverables

- **Packet:** `research/blueprint/packets/DiophantineApproximationAndTranscendence.json`, status `partial`.
  - Scope DT.0–DT.5, `part` null.
  - 348 nodes (171 lemmas, 128 theorems, 39 definitions, 5 constructions, 5 applications), with 326 API items and 184 unit tests.
  - 36 planets (six per stage).
  - 368 baseline declarations, every statement read in the pinned source.
  - 33 sources, 66 source issues, 4 requests, 21 gaps and 11 restructure proposals.
  - `python3 scripts/check_blueprint.py` against the pinned declaration index reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/DiophantineApproximationAndTranscendence.md`, about 22,600 words.
  - It has an introduction (purpose, scope, conventions, boundaries, sources) and one section per stage.
  - It agrees with the packet.
- **Suggested Lean file:** `research/blueprint/suggested/DiophantineApproximationAndTranscendence.lean`. It imports only Mathlib (Tau Ceti is not built locally; no Tau Ceti declaration is needed at the stated signatures). It was compiled against Mathlib 082e2d3 with `lake env lean`: it elaborates with 721 warnings, all `declaration uses sorry`, and no errors. Every one of the packet's 326 API items and 184 unit tests occurs in it under the packet's name.

## What is closed

- **DT.1 (Liouville and Roth) is closed:**
  - Liouville's inequality with the explicit constant 2^{1−d} M(α)^{−1};
  - Thue's theorem by the one-variable auxiliary-polynomial method (Evertse, ch. 6);
  - Roth's theorem with a complete proof: the weighted index, divided derivatives, generalised Wronskians and their heights,
    Roth's lemma, and the auxiliary polynomial through Siegel's lemma. The source is Pottmeyer's public lecture notes,
    specialised to ℚ;
  - the finiteness of Thue equations.
- **DT.0 is decomposed in full.** It covers heights and their comparisons, including the field-extension formula missing
  from Mathlib, the house, Siegel's lemma over number fields with integer unknowns, Dirichlet, simultaneous Dirichlet and
  Kronecker, and the approximation exponents. It waits only on two requests.
- **DT.3's qualitative theory is closed:**
  - Hermite;
  - Lindemann–Weierstrass in Baker's form, reusing Mathlib's analytic part;
  - Gelfond–Schneider, the real case by Evertse's route and the complex case by Gelfond's method;
  - Baker's 1966 theorem through Waldschmidt's Schneider–Lang method.
- **DT.4:** the unit equation, Thue equations, S-unit equations over ℚ via Yu, and Pillai-type equations are derived from
  the DT.3 bounds, with the conversion lemmas.

## What remains

The coverage `remaining` lists and the gaps in the packet are precise. In summary:

- **DT.0: two requests to GeometryOfNumbersAndQuadraticArithmetic:**
  - GN.1, Minkowski's linear forms theorem in closed-box form;
  - GN.4, the polar-lattice covering bound. A restructure proposal adds the edge GN.4 → DT.0.
- **DT.2: the Subspace Theorem's proof.** It is decomposed to the numbered results of Evertse–Ferretti, but these remain:
  - their internal lemmas;
  - the imported inputs: the absolute Minkowski theorem (Roy–Thunder), Davenport's lemma, the sharp Roth's lemma through
    Faltings' product theorem, and Bombieri–Vaaler's Siegel lemma;
  - Evertse–Schlickewei–Schmidt §§6–12;
  - a public proof of Schmidt's norm form theorem.

  It also has requests to GN.1 (successive minima, Minkowski's second theorem) and ClassicalArithmeticCompletion:CA.2
  (closed form of linear recurrences).
- **DT.3: the quantitative bounds.** The proofs of Baker 1975, Waldschmidt's Theorem 9.1, Matveev and Yu are stated
  exactly but not decomposed. The absolute-height lemmas missing from Mathlib (inverse, product, sum, integer values, size
  bound) are a gap; DT.0 supplies the extension formula and the rational values.
- **DT.4:** the proofs of Baker's superelliptic theorem and of Schinzel–Tijdeman (Bérczes–Evertse–Győry), Tijdeman's Catalan
  bound, and Yu's bound for algebraic numbers.
- **DT.5:** the definitions and the statements of all named theorems are in place. These remain:
  - the proofs of Nishioka's, Nesterenko's and Galochkin's theorems and Shidlovskii's Lemma II, which have no public
    sources;
  - differential Galois theory, which no roadmap plans (a restructure proposal suggests a new roadmap);
  - dimension theory: integral extensions preserve Krull dimension;
  - Chevalley's indecomposability theorem.

## Requests made to other roadmaps

- **GeometryOfNumbersAndQuadraticArithmetic:GN.1:** Minkowski's linear forms theorem, closed-box form (consumed by DT.0 and
  DT.2), and successive minima with Minkowski's second theorem (DT.2).
- **GeometryOfNumbersAndQuadraticArithmetic:GN.4:** the polar-lattice covering bound (DT.0, Kronecker).
- **ClassicalArithmeticCompletion:CA.2:** the closed form of linear recurrence sequences (DT.2, Skolem–Mahler–Lech).

## Restructure proposals

These are recorded in the packet's `restructure`:

- **New or removed edges:**
  - add the edge GN.4 → DT.0;
  - drop the unused inputs FoundationsAndLibraryIntegration:LI.4 (retired) and GN.5 → DT.4;
  - add a DT.5 → LogicAndDefinabilityInNumberTheory:LD.6 link.
- **Rescoping:**
  - Adamczewski–Bugeaud expansions (Evertse §8.5) and general Skolem–Mahler–Lech move outside DT.2;
  - the dimension theory DT.5 needs moves to SchemeAndStackFoundations.
- **Splits:**
  - divide DT.3 into its four developments;
  - create a differential-Galois (Picard–Vessiot) roadmap.

## Sources

- **Read.** All are public:
  - Evertse's Leiden notes, chapters 1–8;
  - Pottmeyer's lecture notes;
  - Evertse–Ferretti, Evertse's 1995 and 1996 preprints (introductions and statements), Evertse–Schlickewei 2002 (statements)
    and Evertse–Schlickewei–Schmidt;
  - Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups* (the author's posted PDF), and his survey of
    transcendence of periods;
  - Matveev 2000, Yu 1990 and 1994;
  - Bérczes–Evertse–Győry, Bugeaud–Győry, Bugeaud–Mignotte–Siksek and Tzanakis–de Weger;
  - Beukers (Annals 2006 and his Arizona Winter School notes), Fischler–Rivoal, Adamczewski–Faverjon, André, Kirby, and
    Bakker–Tsimerman's lectures;
  - Karatarakis–Wiedijk and Mathlib PR #28013, for naming.
- **Not public, and not read:**
  - Schmidt, LNM 785;
  - Roy–Thunder;
  - Bombieri–Vaaler (not fetched);
  - Laurent–Mignotte–Nesterenko;
  - Nishioka and Nesterenko's books;
  - Shidlovskii's book;
  - Tijdeman 1976 (not obtained).
