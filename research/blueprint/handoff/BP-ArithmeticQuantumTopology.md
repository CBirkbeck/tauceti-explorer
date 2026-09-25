# BP-ArithmeticQuantumTopology — handoff (second pass)

**This is a continuation, not a new blueprint.** The first pass merged as pull
request 2767 on 24 September: 38 nodes covering QT.0–QT.5 from Habiro's unified
invariant paper and Neumann's extended Bloch group paper, with QT.6 and QT.7
`not_read` and six gaps. This pass keeps every one of those nodes and adds
sixteen, obtaining two further primary sources to do it.

- Packet: `research/blueprint/packets/ArithmeticQuantumTopology.json` — **54 nodes**
- Document: `research/blueprint/readmes/ArithmeticQuantumTopology.md`
- Suggested Lean: `research/blueprint/suggested/ArithmeticQuantumTopology.lean`

115 API items, 78 unit tests, 32 planets, 18 baseline declarations, 6 gaps, 15
requests. `check_blueprint.py`: 0 errors, 0 warnings. No Lean compiled.

## A process note worth recording

I began this pass by writing a fresh 35-node packet from scratch, because the
first pass's work is on `main` under a filename my search pattern missed and I
did not look for it before starting. That was a mistake: the job prompt says
explicitly to read an existing packet and continue from it. The fresh pass was
then merged into the existing one rather than replacing it, which is what this
handoff describes; the sixteen added nodes are exactly the ones that carry
material the first pass did not have. The duplicated work is visible in the
branch history and is not in the packet.

The concrete cost of the mistake is worth naming, because it is also a finding:
searching the pinned libraries afresh, I concluded that Tau Ceti contains nothing
relevant. That is **wrong** — the first pass had already found
`TauCeti.FramedOrientedGaussCode`, `BasedOrientedGaussCode.writhe`,
`TauCeti.FramedMarkovBraid` and `TauCeti.MarkovEquiv`, which are exactly the
framed link presentations QT.0 needs. They are in the merged baseline. Since no
layer of this roadmap has a reviewed library audit, that near-miss is the second
argument for commissioning one, and it is now a structural note.

## What the second pass added

**QT.1 (3 nodes), from Habiro–Lê §2.** The abstract framework the first pass did
not have: topological ribbon Hopf algebras over `ℂ[[h]]` with their convergence
notion; **core subalgebras and twist forms**, the abstract data from which an
invariant of `ℤ`HS³ is produced, with the invertibility of the normalising
denominator as a *stated hypothesis*; and the separation of the three settings —
generic, integral, specialised — with the explicit record that the specialised
category is **not semisimple**.

**QT.2 (2).** Finite truncations with the factorisation of evaluation through
them, which fixes the order of operations — expand, prove integrality, truncate,
*then* complete — and the record that a cyclotomic expansion is a theorem about
an invariant in a fixed normalisation, not a property a q-series acquires by
being evaluable at roots of unity.

**QT.3 (1).** The rational-homology-sphere boundary, with three independent
reasons; this closes the stage's one outstanding item, so **QT.3 is now
`source_decomposed`**.

**QT.4 (2), from Habiro–Lê §1.** The general simple Lie type theorem over its
**admissible set of orders**, with the projective comparison; and the record that
outside that set the evaluation is still defined and is *proposed as a
definition* — an analytic continuation, not a theorem. Plus the record that the
determination statements depend on the ground ring being `ℤ`: over `ℚ` the
completion is not even a domain and the Taylor map is not injective.

**QT.5 (1).** The four proof obligations between a knot diagram and a
number-field Bloch class.

**QT.6 (4) and QT.7 (3), from Garoufalidis–Zagier.** Both stages were
`not_read`. Now: the Kashaev invariant, its identification with a coloured Jones
evaluation and the one-periodic **Galois-invariant** function on `ℚ` it
determines uniquely; the conjectured asymptotic expansion with its exact
prefactors and the separate conjecture that its coefficients are algebraic; the
two export points to the Habiro roadmaps; the separation of formal from analytic
asymptotics; the quantum modularity conjecture with its exact normalisation and
the identification of the volume-conjecture case; the example ledger; and the
five-label discipline.

## Sources

| paper | arXiv | SHA-256 | pass |
| --- | --- | --- | --- |
| Habiro, *A unified WRT invariant for integral homology spheres* | math/0605314v1 | `79069d6a…` | first |
| Neumann, *Extended Bloch group and the Cheeger–Chern–Simons class* | math/0307092v2 | `0553bc88…` | first |
| Habiro–Lê, *Unified quantum invariants … simple Lie algebras* | 1503.03549v2 | `26e86400…` | **second** |
| Garoufalidis–Zagier, *Knots, perturbative series and quantum modularity* | 2111.06645v3 | `e923db26…` | **second** |

## Coverage

QT.3 is now `source_decomposed` with empty `remaining`. The other seven stay
`partial`, with **strictly shorter** remaining lists than the first pass left.
Four of the first pass's six gaps are closed; four new ones are opened, all of
them "read more of a source we now hold" rather than "acquire a source we do
not".

## Gaps, in order of leverage

1. **No state-integral source** (QT.6). The stage text asks for a state sum with
   its contour and normalisation and for the relation of its critical points to
   the gluing equations. The asymptotics source approaches the same asymptotics
   from the Kashaev invariant instead. This is the one remaining *acquire a
   source* gap in the layer.
2. **The refinements of the asymptotics source** (QT.6, QT.7) — and within them
   the subsection constructing **new elements of the Habiro ring**, which is the
   only place where this roadmap could contribute a *proved* statement back to
   the Habiro family.
3. **The classical Kirby calculus is cited, not decomposed** (QT.0), carried over
   from the first pass. Neither Fenn–Rourke nor Habiro's clasper paper has been
   obtained.
4. **The integral core subalgebra construction** (QT.1, QT.4): the abstract
   framework is now decomposed, its six technical sections are not.
5. **The Reshetikhin–Turaev construction and the centre of the even integral
   form** (QT.1), carried over.
6. **No proved quantum-modular example** (QT.7): the ledger's asymptotic column
   is conjectural in both rows, and will stay so until a source proving a case is
   obtained.

## Structural notes

Carried over from the first pass: QT.0 and QT.2 should import framed links,
surgery and the Jones polynomial from the geometric-topology roadmap; QT.5's
dependence on the K-theory Bloch-group layers should be narrowed and the
dilogarithm imported from the polylogarithm layers; QT.6's stated inputs are not
the ones it needs. Added here: **no layer has a reviewed library audit**, which
is how this pass came close to losing the Tau Ceti Gauss-code declarations; and
**QT.7 contains no theorem of this roadmap**, so its only planet is the ledger,
the conjecture being ineligible.
