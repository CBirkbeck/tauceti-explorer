# Handoff — BP-Polylogarithms

**Job** `BP-Polylogarithms` (issue #73) · Claude Code, session `cc-7b31c4` · 24 September 2026 ·
packet status **partial**; **all six layers are now `source_decomposed`**. The first pass left P.5
`partial`; the continuation below decomposes it. The sections after the continuation are the first
pass's note, kept as written.

## Continuation: P.5 decomposed against the source it was already citing

The first pass cited Goncharov's *Polylogarithms, regulators, and Arakelov motivic complexes* from
its **abstract and first page**. This pass read the arXiv e-print LaTeX source of the same file —
the PDF hash `ac729924…bd3440db` is unchanged, the source archive is
`fa6ea8977eb6e95d07110f170e158511cde856fb40d2c3f05e350206978432be` — and decomposed **sections 1, 2,
3 and 6 in full**. P.5 goes from 4 nodes to **12**, and the packet from 29 nodes to **37** (101 API
items, 74 unit tests, 20 planets, 26 baseline declarations, 15 requests, 6 gaps). Eight new nodes:

- `r-forms-and-distributions` — the forms `r_{m−1}` (equation (1wq)) and Theorem 2.4: the integral
  against a test form converges, so they define distributions and a homomorphism out of `Λ^m F^*`.
  This is what makes the whole regulator exist, and the first pass did not have it.
- `regulator-map-on-higher-chow` ★ — Theorem-Construction 2.3: the canonical map of complexes from
  Bloch's weight `n` higher Chow complex to the weight `n` real Deligne complex, **with** the
  statement that over the reals the image lies in the subcomplex fixed by the De Rham involution.
  That is the stage text's "retain real/complex conjugation".
- `chow-polylogarithm-forms` ★ — Theorem-Construction 3.1: the chain of distributions `ω^q_p` with
  its three identities, built as a Radon transform; the cocycle interpretation; Theorem 3.2, the
  torus invariance of the **top** member, with the source's remark that it fails below the top.
- `arakelov-motivic-complex` — the cone shifted by −1, its real and number-field variants,
  Definition 2.11 and Proposition 2.12 (degree zero is the Gillet–Soulé arithmetic Chow group).
- `chern-character-comparison-problem` — **the first remaining item**. The stage asks to compare the
  regulator with M's higher Chern character. The source poses exactly that as **Problem a)** of its
  introduction, through the Bloch–Levine isomorphism, and does not prove it. The node states the
  comparison with its two inputs and records that it is open, so that nothing assumes it.
- `strong-reciprocity-law` ★ — Conjecture 6.2 with its two conditions, the remark explaining why it
  is stronger than Suslin's law (the kernel of `δ₂` is non-trivial, so the lift is not formal), and
  the three cases the source proves: Theorem 6.5 (the projective line, modulo 6-torsion, with the
  explicit cross-ratio formula), Theorem 6.14 (an elliptic curve), Theorem 6.12 (any curve over the
  algebraic numbers, rationally), plus Theorem 6.10, the family version and its differential
  identity.
- `chow-dilogarithm-on-elliptic-curves` — Theorem 6.14 with Lemma 6.16 and Proposition 6.18: the
  explicit formula for `h` on four linear functions, and the integral formula with the factor `2π`.
- `weight-three-curve-regulator` ★ — **the second remaining item**. The weight-three regulator is the
  case `q = 3` of the Chow polylogarithm; the general-weight reciprocity statement is Conjecture 6.3
  of the source and is recorded as a conjecture; and the **Eisenstein–Kronecker expression is stated
  as a target**, conditional on the analytic result `EllipticRegulators:ER.3` owns, with the explicit
  record that the elliptic weight-three special-value conjecture does **not** follow from the
  weight-two argument. That is what the stage text asks for, in the words it asks for it.

Two new requests and two new gaps come with it: `EllipticRegulators:ER.3` for the elliptic
dilogarithm and its Kronecker–Eisenstein description; the sentence added to `K2SymbolsBrauer:T.4`
recording that the reciprocity proof reduces to the projective line **by the transfer on Milnor
`K₃`**; the gap for Goncharov's sections 4, 5 and 7, which build the Grassmannian polylogarithm and
the Borel regulator and are `BorelRegulators`' material; and the gap recording that the Beilinson
comparison is open in the source.

What still has no owner is unchanged and is not a decomposition gap: the real Deligne–Beilinson
cohomology of a curve, requested from `MotivicEtaleKTheory:M.8`, as two confirmed red-team findings
ask. Every statement in P.5 that mentions a Deligne class is conditional and says so.

Checks after the continuation: `scripts/check_blueprint.py --index …` → **0 errors, 0 warnings**;
`python3 -m unittest discover -s tests` → 273 tests, OK; `intake.py check-files` → 0 problems. The
Lean file is now 318 lines with 70 `sorry`s and was **not compiled**.

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
