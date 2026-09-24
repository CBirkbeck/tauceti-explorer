# Handoff — BP-ArithmeticKTheory--N.1 (issue #677)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-akt1`.

## Deliverables

- `research/blueprint/packets/ArithmeticKTheory--N.1.json` — 28 nodes
  (2 definitions, 2 constructions, 12 theorems, 11 comparisons, 1 lemma), 26 API
  items, 16 unit tests, 9 planets, 22 baseline declarations, 5 gaps, 11 requests,
  3 structural proposals. `"part": "N.1"`, `"status": "partial"`.
- `research/blueprint/readmes/ArithmeticKTheory--N.1.md` — 1386 lines.
- `research/blueprint/suggested/ArithmeticKTheory--N.1.lean` — 253 lines, every
  proof `sorry`.
- This note.

**All eight stages in scope are `source_decomposed` with an empty `remaining`.**

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors,
  0 warnings**, with the pinned index in place, so all 22 baseline references
  resolved against it.
- `intake.py check-files` on the four paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled.** Shared Mathlib cache; every `implementationStatus` is
`unchecked`.

## The source

One file: Weibel's *K-book*, author-hosted combined draft of 29 August 2013,
SHA-256 `a04f53c9…`. It was already on disk from this session's earlier jobs and
was re-hashed; the hash reproduces the value recorded by the packets of
`K2SymbolsBrauer`, `Polylogarithms`, `MotivesAndAlgebraicCycles`,
`ArithmeticKTheory--N.7` and `GeneralAlgebraicKTheory--K.6`. Read: IV.1.17–1.18
(Borel), IV.6.9 (Quillen), V.6.6 with 6.6.2 (localisation for Dedekind domains),
V.6.8 with 6.8.1 and the wild-kernel discussion (Soulé), VI.2.1–2.5 (the
invariant, the cyclotomic computation, exceptional fields, Harris–Segal), VI.8
(classical data, the cohomological description, the totally imaginary table, the
two zeta-value theorems) and VI.9 (the mod-8 table, the two-primary table, the
totally real divisibility). What was **not** read is listed in
`sources[0].readSections` and drives three of the five gaps.

There is **no integrated decomposition** for this roadmap, so this packet is
written directly from the source against `AUDIT-27`, whose claims were each
re-checked against the declaration index.

## What is imported, and from whom

This roadmap is an assembly point, and the packet says so rather than
re-planning: `KTheoryLowDegrees:Z.4` (K₀ = ℤ ⊕ Cl) and `U.4` (K₁ = O_{F,S}ˣ,
Bass–Milnor–Serre) for N.1; `BorelRegulators:R.1` (arithmetic-group finiteness)
and `R.3` (the rank theorem) for N.3; `GeneralAlgebraicKTheory:K.1` and `K.3`
(K-groups, Quillen localisation, resolution, projection formula);
`K2SymbolsBrauer:T.5` (the tame kernel) and `T.7` (twisted modules);
`MotivicEtaleKTheory:M.7` and `M.8` (the corrected sequences and the Chern
classes); `SpecialValuesBirchTate:B.3` (w₂(ℚ) = 24, which that roadmap also
asks for). Eleven requests in all.

## What this packet owns

The carrier and the arithmetic development. In particular:

- **N.1.** For a *number field* `O_{F,S}` is a localisation of `𝓞_F`, with
  independence of the presentation and monotonicity in S. Tau Ceti's own
  `SInteger/Basic.lean` records that this is **false for a general Dedekind
  domain**, and the audit lists both theorems as missing.
- **N.2.** The localisation sequence with finite support, and the three classical
  sequences as its three low-degree **rows** — two of which are pinned in
  classical form and are *not* derived there from a K-theoretic sequence.
- **N.2.** Soulé's theorem, which the stage text demands be an *additional*
  theorem: exactness gives no injectivity, and in degree zero the map genuinely
  fails to be injective.
- **N.4.** The invariant, its computation from the cyclotomic character in the
  exponent form that makes it a finite check, the dyadic exceptional cases, and
  `w₂(ℚ) = 24`.
- **N.5/N.6.** The integral tables, with the extension data, and the certificate
  discipline.

## The four traps the stage texts name

1. **`K₁(F) = Fˣ` is not the S-unit group** (N.1) — the first is not finitely
   generated.
2. **Exactness gives no injectivity** (N.2) — the residue term precedes the map;
   Soulé's theorem is what supplies it, and in degree zero it is false.
3. **The rank formula does not cover degree one** (N.3:ranks) — there the rank is
   `r₁ + r₂ + |S| − 1`, which differs already for `S = ∅`.
4. **`W_j(F)` is not `μ(F)`** (N.4) — over `ℚ` the orders are 24 and 2, and
   Mathlib has the second complete and nothing of the first.

Two more that are carried as hypotheses rather than remarks: the totally
imaginary hypothesis at `ℓ = 2` is a **cohomological-dimension** hypothesis (a
structural note asks that the stage texts say so), and the N.6 eight-fold table
contains an **extension**, not a direct sum, with an intermediate rank `ρ` the
theorem does not determine.

## Gaps

1. **The descent spectral sequence was not read** (N.5, N.6) — it is what
   produces every cohomological description here. Read VI.4 and VI.6–7.
2. **The proofs of 8.2, 9.5 and 9.11 were read only in outline.**
3. **Soulé's proof was read only to its first reduction** (N.2) — and the stage
   text makes that theorem the hinge of the layer.
4. **The arithmetic-group input has no source here** (N.3:finite-generation).
5. **The wild-kernel identification is quoted with an attribution**, not proved,
   and the stage text forbids assuming it in exceptional dyadic cases.

## Structural proposals

Name the two owners in N.1's stage text; split N.4 (the invariant and its
cyclotomic computation are pure Galois theory, formalisable long before any
K-group exists; the dyadic case analysis is a different kind of work); and say in
N.5's and N.6's texts that the real-place corrections are forced by the
cohomological dimension at 2, since that is what explains why the eight-fold
table appears at all.

## Where to resume

The packet is complete against what was read. The next real work is the descent
spectral sequence (gap 1), which currently sits behind every statement of N.6 and
behind the two-primary half of N.5, and then the three proofs of gap 2.
