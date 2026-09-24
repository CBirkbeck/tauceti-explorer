# Handoff — BP-EllipticKTheory (issue #715)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-ekt`.

## Deliverables

- `research/blueprint/packets/EllipticKTheory.json` — 30 nodes (2 definitions,
  6 constructions, 10 theorems, 11 comparisons, 1 lemma), 46 API items, 32 unit
  tests, 9 planets, 13 baseline declarations, 5 gaps, 16 requests, 3 structural
  proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/EllipticKTheory.md` — 1522 lines.
- `research/blueprint/suggested/EllipticKTheory.lean` — 269 lines, every proof
  `sorry`.
- This note.

**All eight stages in scope are `source_decomposed` with an empty `remaining`** —
four nodes each for E.1 through E.7, two for E.8.

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors,
  0 warnings**.
- `intake.py check-files` on the four paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled**; shared Mathlib cache, every `implementationStatus`
`unchecked`.

## The source

One file: Weibel's *K-book*, combined draft of 29 August 2013, SHA-256
`a04f53c9…`, already on disk from this session's earlier jobs and re-hashed; the
hash reproduces the value six other packets of this programme record. Read:
II.8.5 (projective bundle), III.6.5.3 and III.7.5.1 (Weil reciprocity with its
norms), V.3.5.3 (projection formula), V.6.6 with 6.6.2 (localisation for Dedekind
domains), V.6.13 (homotopy invariance and `P¹`), and **VI.6 complete** (Harder,
the geometric computation with its Galois module structure, the arithmetic
descent and the function-field reciprocity sequence).

There is **no integrated decomposition** for this roadmap.

## The two things this packet had to notice

1. **No elliptic curve is a scheme at the pins.** Both libraries' elliptic-curve
   directories contain no `AlgebraicGeometry.Scheme` at all; the projective model
   is a quotient of a point set. E.1 therefore builds the scheme itself, and the
   upstream `ModularCurves` layer 1 — which does this over an arbitrary base — is
   filed as the supplier for the general case.
2. **Half of E.2 is already proved in Tau Ceti, and the roadmap does not say so.**
   `WeierstrassCurve.Affine.pointEquivDegreeZeroDivisorClass` identifies the
   points with the degree-zero divisor classes of the function field, and
   `OrderSystem.degreeSplitForward` splits the class group by degree at a
   rational point — in greater generality than the elliptic case. Both are
   complete. The packet cites them and a structural note asks that the stage text
   record them, so that a reader plans only the rank–determinant isomorphism and
   the descent statement.

## The traps the stage texts name, each carried as a hypothesis or a non-example

- **E.1** — the **zero morphism** induces no embedding of function fields and is
  outside the isogeny correspondence.
- **E.2** — `ℤ ⊕ ℤ ⊕ E(F)` is a **group** isomorphism with the chosen origin, the
  multiplication is transported from the tensor product (not the product ring),
  and a Galois-invariant geometric class **need not** descend.
- **E.3** — the kernel of the tame symbol is the **image** of `K₂(X)`; the two
  repairs (torsion residues over a number field, vanishing residues over a finite
  field) are comparison theorems with inputs.
- **E.4** — the curve's `SK₁` is **not** the stable-matrix `SK₁`; the coniveau
  sequence keeps its **left** filtration term and `K₃` is an extension.
- **E.5** — **`f_*f^*(a) = [f_*O_X]·a`, not `deg(f)·a`**; and the finite-field
  computation is not a consequence of `K_*(F_q)` alone.
- **E.6** — a **Néron** model is not proper and a **Weierstrass** model is not
  regular; an unramified symbol need not be integral; an "integral part" is not
  automatically a lattice.
- **E.7** — Weil reciprocity's **residue-field norms** are not optional.
- **E.8** — no finite generation and no classification is claimed anywhere.

## Gaps

1. **Arithmetic-surface theory is not in the source read** (E.6) — existence of a
   regular proper model, minimal models, resolution, special fibres. Read Liu
   chs. 8–10 or Silverman's *Advanced Topics* ch. IV.
2. **Bloch's monograph is in the reference library but its scan has no text
   layer** (E.7). It is supplied (the `EllipticRegulators` stage texts record it),
   but it yields no text here and there is no renderer. The node states the
   construction as the stage text does, with its attribution, and decomposes only
   what follows from Weil reciprocity and Riemann–Roch. Brunault's thesis
   (arXiv:math/0602186), used by this session's companion packet, proves the same
   construction and *can* be read.
3. **The proofs of the finite-field computations were not read** (E.5) — they go
   through the motivic spectral sequence of VI.4.
4. **The blow-up formula is imported without a source here** (E.6).
5. **The scheme over an arbitrary base was not decomposed** (E.1) — the upstream
   modular-curves layer owns it.

## Requests

Sixteen, the largest set of any packet in this session, because this roadmap is
downstream of six others: the upstream `ModularCurves` layer for the scheme over
a base, `KTheoryLowDegrees:Z.5`/`U.4`, `GeneralAlgebraicKTheory:K.1`/`K.3`,
`SchemeKTheoryOperations:S.3`/`S.4`/`S.6`, `MotivicEtaleKTheory:M.6a`,
`K2SymbolsBrauer:T.3:symbols`/`T.3:localization-comparison`/`T.4`/`T.5`,
`K3BlochGroups:V.4`, and `ArithmeticKTheory:N.1`/`N.3`.

## Structural proposals

Name the upstream owner in E.1's stage text; record the two pinned Tau Ceti
theorems in E.2's; and split E.6, whose arithmetic-surface half is geometry with
no K-theory in it and whose integral-part half is K-theory that takes it as
input — one node to three along that line.

## Where to resume

The packet is complete against what was read. The next real work is a source for
arithmetic surfaces (gap 1), which is currently the only thing standing between
E.6 and a decomposed proof, and then Bloch's monograph or an exposition of it for
E.7.
