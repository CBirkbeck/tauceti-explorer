# Handoff — BP-Polylogarithms

**Job** `BP-Polylogarithms` (issue #73) · Claude Code, session `cc-7b31c4` · 24 September 2026 ·
packet status **partial**: P.1, P.2, P.3, P.4 and P.6 `source_decomposed`, P.5 `partial`.

## What is closed

29 nodes (6 definitions, 9 constructions, 2 lemmas, 8 theorems, 3 comparisons, 1 application),
78 API items, 58 unit tests, 16 planets, 22 pinned baseline declarations, 14 requests, 4 gaps.
`scripts/check_blueprint.py` reports **0 errors and 0 warnings**.

All four reserved ids are delivered: `P.1/classical-polylogarithm`, `P.1/single-valued-polylogarithm`,
`P.4/higher-bloch-group` and `P.3/polylogarithmic-complex`.

- **P.1** builds `Li_n` from its series and its inductive integral — multivalued, with every statement
  naming a path or a cut — then the monodromy-cancellation lemma that forces the Bernoulli
  coefficients, then Zagier's `L_n`, then the Bloch–Wigner function with its differential formula and
  the five-term relation via the cross-ratio in the source's normalisation.
- **P.4** gives `δ_n`, the higher Bloch groups through the inductive functional-equation subspace, the
  condition `o_n`, the Zagier determinant with its `π` power and `|d_F|^{-1/2}`, Zagier's statement
  split into three propositions, the weight-four case recorded as a **theorem**, and the motivic Lie
  coalgebra extension recorded as the conjecture the source calls evidence for.
- **P.3** builds the complexes in every weight with `d² = 0`, the weight-three case where the
  vanishing is visible on a generator, residues, transfers, the K-theory comparison with its degree
  range, and the weight-three special value.
- **P.2** descends `D` through the Bloch group that `K3BlochGroups:V.3` owns, assembles the
  embedding-wise regulator with the real places proved to contribute zero, states the Borel comparison
  with sign and scalar, and keeps the numerics as a separate function with an error theorem.

## What remains, precisely

**P.5 is partial**, and the reason is recorded rather than papered over: the regulator's target, the
real Deligne–Beilinson cohomology of a curve, is constructed by **no stage of the atlas**. Two
confirmed red-team findings (`RT-AREA-ktheory-2/7` and `/24`) ask for it to be planned once inside
`MotivicEtaleKTheory:M.8`, as an early part needing no `BorelRegulators` input. This packet requests
it and leaves two items in P.5's `remaining`: the comparison of the curve regulator with the higher
Chern character, and the weight-three curve regulator with its Eisenstein–Kronecker expression.

Three further gaps are recorded: Zagier's 1990 and Goncharov's 1991/1994/1995 papers were not
obtained, so two statements are used exactly as Goncharov–Rudenko state them; the weight-three
special-value theorem is stated but not decomposed; and no roadmap plans the proof of the weight-four
theorem.

## The three restructure entries

1. **The Bloch–Wigner nodes belong here.** `RT-AREA-ktheory-2/27` (confirmed) says the two ids
   reserved under `K3BlochGroups:V.3` belong to `P.1`. This packet implements the fix: they are nodes
   here. The companion packet for `K3BlochGroups` (issue #72, opened as a separate pull request from
   this same session) delivers its two reserved ids as its own job requires, imports the construction
   from here rather than rebuilding it, does not mark them as planets, and carries the matching
   entry. Applying the fix means retiring those two ids from `K3BlochGroups` and pointing consumers
   here.
2. **A Part II for the weight-four proof.** `RT-AREA-ktheory-2/51` (confirmed). The proposal is a new
   roadmap titled, in the form §15 requires, *Polylogarithms, explicit regulators and Zagier
   statements, Part II: weight four via motivic correlators and cluster polylogarithms*, with this
   roadmap as its first prerequisite, scoped to the source's §§2–5 and §9.
3. **P.5 owns the general `η(f,g)`, `M.8` owns the Deligne complex.** `RT-AREA-ktheory-2/7` and `/24`
   (both confirmed). `EllipticRegulators:ER.2` specialises the form to an elliptic curve; it does not
   own it.

## Requests made

Fourteen: to `K3BlochGroups:V.3`, `V.4` and `V.6`; `BorelRegulators:R.3` and `R.7`;
`MotivicEtaleKTheory:M.7` and `M.8`; `EllipticRegulators:ER.2`; `K2SymbolsBrauer:T.3` and `T.4`;
`IntegralIwasawaTheory:L4`; `PadicHodgeRegulators:D.3`; `ArithmeticQuantumTopology:QT.5`; and
`SpecialValuesBirchTate:B.8`. Each names exactly what this roadmap consumes.

## The suggested Lean file

`research/blueprint/suggested/Polylogarithms.lean`, 248 lines, **not compiled**: no Lean toolchain at
the pinned commits was available. Objects other roadmaps own are `variable`s — the Bloch group, the
Borel regulator, the K-groups, the Deligne complex — and are never invented. Written out: the
n-logarithm and its cut domain, the parity projection and `L_n` with the Bernoulli coefficients, the
Bloch–Wigner function, the cross-ratio and the five-term relation, `δ_n`, the higher Bloch groups, the
condition `o_n`, the Zagier determinant and the curve regulator form.

## Sources read

Goncharov–Rudenko, arXiv:1803.08585v3, SHA-256 `9a644392…9c78b093`: abstract and §1.1, items 1–6,
including Theorems 1.1, 1.2 and 1.3. Goncharov, arXiv:math/0207036v3, SHA-256 `ac729924…bd3440db`:
abstract and introduction. Weibel's *K-book* draft of 29 August 2013, SHA-256 `a04f53c9…b058845`:
VI.5.1–VI.5.4.1, for the Bloch-group convention P.2 descends through. **Not obtained:** Zagier's 1990
paper, Goncharov's 1991, 1994 and 1995 papers, and Bloch's lectures. No source issue is recorded: no
misprint, error or gap was found in what was read.
