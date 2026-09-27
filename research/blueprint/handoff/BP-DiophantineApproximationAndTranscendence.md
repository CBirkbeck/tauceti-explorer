# BP-DiophantineApproximationAndTranscendence: block homogenization checkpoint

Worker: Codex — `codex-hjdg0j`, 2026-09-27. Refs #1027.
Claim comment 5854707820; winning bot reply 5854708905. This is a partial
blueprint checkpoint; the programme's independent review is outstanding.

## What this checkpoint closes

Thirteen declaration-sized nodes supply the affine-chart comparison in
Evertse 1995 §1, published pp. 221–222: one definition, eleven lemmas and one
theorem. They cover filtered block homogenization, coefficient transport,
support bijection, dehomogenization, native univariate compatibility,
block homogeneity, homogeneous reconstruction, centered Taylor expansion,
triangular Hasse jets, pure affine jets, strict-threshold vanishing, equality
of weighted indices, and coefficient H₂ preservation.

The definition's API has nine entries, including the promoted native
comparison. Across the thirteen nodes there are twenty-one API entries;
one promoted signature appears in both its definition API and its lemma node.
There are eleven additional typed tests (eight attached to the definition).
The coefficient ring is any commutative ring for the index comparison;
the coefficient-height statement is over a number field. Zero polynomials,
zero degrees in the algebraic API, empty affine blocks, overdegree truncation
and positive characteristic are explicitly covered. Positive block degrees
are required by the weighted-index comparison.

The source's claimed coordinatewise derivative bound is false. Its replacement
is a bound on total order within each block, proved by the centered homogeneous
Taylor expansion and its triangular Hasse-jet formula. This supplies equality
of indices without factorial division. The arithmetic intersection input to
sharp Roth remains a gap; it is not a prerequisite of this local algebraic chain.

## Inherited work and ownership

All 379 inherited nodes, their statements, API, tests, prerequisites, planets
and implementation-status fields are unchanged. The 68 inherited source issues,
all four requests and all eleven restructuring proposals are unchanged.
The integrated seven-layer decomposition and accepted RS-03 boundary remain
in force; the obsolete FoundationsAndLibraryIntegration supplier is not replanned.
The six reviewed library-audit rows were freshly read, and the 52 previously
consulted repository inputs are byte-identical to the predecessor input.
The 24 touching atlas link maps and 28 touching blueprint link maps retain
the same path sets and bytes. No extra polynomial, projective-space, degree
or height carrier is introduced. All proposed declarations are unchecked plans.

Packet totals: 392 nodes (40 definitions,
5 constructions, 212 lemmas,
130 theorems, 5 applications),
378 API entries, 232 packet tests and 232 typed
examples, 36 planets, 420 baseline declarations,
33 sources and 76 source findings. No new planet is added.
DT.1 remains closed; the other stages remain partial. There are still twenty
gaps and four supplier requests.

## Validation

- Final suggested Lean file elaborates at the pinned baseline: zero errors,
  820 expected declaration-admission warnings and no other warnings.
  SHA-256: `51119b8711cbb9e31b6e04b57ef9d05ff336be1feb620d4f0f8ed3ec46131a23`.
- All 8,482 Mathlib source modules reached through its imports were verified
  against the pinned tree and the matching cache; no Tau Ceti module is imported.
- Nine temporary complete Lean proofs were checked in the authorized suggested
  file. Their printed axioms contain no admission axiom. These test the actual
  definition's zero and monomial cases, exponent injection, overdegree and
  joint-block truncation, the source counterexample, a characteristic-two
  comparison and native truncation. They were removed before final elaboration.
- Independent sparse-polynomial differentiation and the triangular formula
  agree in 57,600 exact rational jet cases, with 172,800 reductions modulo
  2, 3 and 5. The two weighted indices agree in 153 examples. A further 434
  exact arithmetic cases check the corrected numerical contradiction in E222.
  These finite checks supplement the proof outlines; they do not prove them.
- The packet checker, source-issue/version checks, acyclicity, inherited-object
  preservation, reader/seed agreement and deliverable-path checks all passed. The checker distinguishes definition/construction API and
  tests from the all-node totals above.

## Source reading and corrections

Both files are public and separately hashed in the packet:

- [Author copy](https://pub.math.leidenuniv.nl/~evertsejh/95-product.pdf),
  SHA-256 `7e030067f7502778eb7a1982e52e31f133ca18f7de869600f25326116bda71e8`.
  Physical pp. 1–9 and 28–33 were read in batches of at most three pages.
- [Published paper](https://matwbn.icm.edu.pl/ksiazki/aa/aa73/aa7332.pdf),
  Acta Arith. 73 (1995), 215–248, DOI 10.4064/aa-73-3-215-248,
  SHA-256 `94a89d838a199cce195bba2aaba31084d1dafb9b376b4a579b2cd2968c115a62`.
  Physical pp. 3–8, 28, 30–33 (printed pp. 217–222, 242, 244–247) were read;
  physical pp. 8, 28 and 32 were also visually checked.

E217 corrects the index's largest-threshold convention to strict-below
vanishing. E218 records block-index slips. E219 records the false
coordinatewise derivative bound and its explicit counterexample. E220
requires a positive epsilon in the corollary. E221 corrects the intermediate
projection-dimension expression. E222 restores the omitted factor in the
numerical contradiction while preserving the weak degree-ratio premise.
E223 records two author-copy misprints already corrected in the published
paper (the delta index and Roth's publication year). E224 restores j=0 in
the binomial coefficient bound. These findings have no independent verdict yet.
The author's publication list, publisher's issue page and bounded correction
searches found no separate erratum for the remaining findings. No author was
contacted, and no claim is made that no correction exists.

## Where to resume

The central §§2–4 have not been read in full. Read and decompose the geometric
intersection and multiplicity lemmas, the arithmetic height constructions and
estimates, and the §5 projection-rank/intersection argument for Theorem 3.
Reuse this checkpoint's local polynomial comparison and the inherited
Evertse 1996 Lemmas 24–26 reduction. The 1995 theorem has a strict coefficient
height premise (1.12), whereas the inherited 1996 signature uses a weak height
inequality; supply an explicit boundary argument before declaring the
sharp-Roth gap closed. Do not infer that boundary case from the chart identity.

The rest of the coverage worklist is unchanged:

### DiophantineApproximationAndTranscendence:DT.0

- Open request to GeometryOfNumbersAndQuadraticArithmetic:GN.1: Minkowski's linear forms theorem in the boundary form (consumed by DT.0/dirichlet-approximation-from-minkowski and hence by every Dirichlet-type node).
- Open request to GeometryOfNumbersAndQuadraticArithmetic:GN.4: the polar-lattice covering bound (consumed by DT.0/kronecker-approximation-theorem).

### DiophantineApproximationAndTranscendence:DT.2

- Split the Evertse–Ferretti proof of the Parametric Subspace Theorem into page-sized nodes: Lemmas 9.1, 9.3, 9.4, 10.1–10.3, 11.1, 11.2, 11.4–11.6, 13.3–13.5, the §14 argument, Lemma 15.3, Lemmas 16.2–16.4, 17.1–17.4, 18.1–18.4, Proposition 18.5 and Lemma 5.2 of arXiv:1008.2340 (gap 'Internal lemmas of the Evertse–Ferretti proof').
- Read and decompose Evertse–Schlickewei 2002 (preprint 00-abssub.pdf) §7 (Corollary 7.2, the absolute Minkowski theorem via Roy–Thunder) and §§6, 9 (Lemma 6.3, Davenport's Lemma 9.2).
- Decompose the geometric and arithmetic intersection arguments of Evertse 1995 §§2–5 that prove the explicit Product Theorem and sharp Roth. The affine-chart comparison in §1 is now closed through block homogenization, Hasse jets, weighted-index equality and coefficient H₂ preservation. Preserve findings E217–E224 and the distinction between the strict height premise in 1995 (1.12) and the inherited ≥ boundary in the 1996 lemma. The Evertse 1996 Lemmas 24–26 chain still depends on this sharp-Roth input.
- Obtain a public source for Bombieri–Vaaler's Siegel lemma (Invent. Math. 73 (1983)) and decompose its Theorem 9, or replace it by Evertse's public 'A variation on Siegel's lemma'.
- Read and decompose Evertse–Schlickewei–Schmidt §§6–12 (their Theorem 2.1).
- Find and decompose a public proof of Schmidt's norm form theorem ((i) ⇒ (ii) of Evertse Theorem 7.13); candidate: Evertse, 'The number of solutions of decomposable form equations' (preprint 95-decforms.pdf).
- Schmidt's bound for the zero multiplicity of non-degenerate (not necessarily simple) recurrences (Evertse Theorem 8.19, Schmidt, Acta Math. 182 (1999)) and the refined counts of Amoroso–Viada quoted after Evertse Theorem 8.13: stated in the source without proof; no public full proof was read.
- Receive GeometryOfNumbersAndQuadraticArithmetic:GN.1's nodes for Minkowski's linear forms theorem and Minkowski's second theorem, and ClassicalArithmeticCompletion:CA.2's closed form of linear recurrences, and replace the stage-id prerequisites by those node ids.

### DiophantineApproximationAndTranscendence:DT.3

- Decompose the proof of Waldschmidt's Theorem 9.1 (DALAG §9.2-9.3 and its inputs from Chapters 3, 5-8, listed in the gap) or of Matveev's Corollary 2.3 (Izv. Math. 64 (2000) §§3-9) into nodes; either one closes DiophantineApproximationAndTranscendence:DT.3/baker-lower-bounds-for-linear-forms-in-logarithms and its consumers.
- Decompose Yu's proof of the bound of DiophantineApproximationAndTranscendence:DT.3/yu-explicit-p-adic-bound (Compositio 74 (1990) §§1-5 and 91 (1994) §§1-6), including the p-adic exponential and logarithm on 𝔭-adic units of valuation > 1/(p−1) that the proof uses internally.
- Obtain a public source for the Laurent-Mignotte-Nesterenko estimate (J. Number Theory 55 (1995) 285-321) or replace the node by the corresponding case of DiophantineApproximationAndTranscendence:DT.3/matveev-corollary-linear-form-bound.
- Supply the absolute-height lemmas still listed in the gap 'Absolute Weil height API for NumberField.absLogHeight₁' (inverse, product, sum, integer values and the size bound; upstream owner) and then close the five derivation nodes that use them.

### DiophantineApproximationAndTranscendence:DT.4

- Decompose the proof of Theorem 5.14 from Bérczes–Evertse–Győry 2013, sections 3–5 (see gaps), including the relative discriminant estimates and the effective Thue equations over O_S that it uses.
- Decompose the proof of Theorem 5.15 (Schinzel–Tijdeman 1976 or Bérczes–Evertse–Győry section 6).
- Obtain and decompose Tijdeman's 1976 proof of the Catalan bound.
- DT.3 must supply Yu's p-adic bound for algebraic numbers (gap) for Theorem 5.18 and the Thue–Mahler theorem to rest on a node rather than on the DT.3 stage.

### DiophantineApproximationAndTranscendence:DT.5

- Decompose Adamczewski–Faverjon §3 (proof of Theorem 1.4 from Nishioka) and §§4–5 (Theorems 1.7, 1.9, 1.10) into nodes.
- Obtain a public complete proof of Nishioka's theorem (candidate: Adamczewski–Faverjon arXiv:1809.04823, sections 4–8, several-variable regular singular case) and decompose it.
- Obtain proofs of Shidlovskii's Lemma II and Galochkin's theorem (Shidlovskii's book; André, Annals 2000) or an alternative public source.
- Nesterenko's theorem: acquire a public proof source (none found) and decompose the multiplicity estimate and Philippon's criterion.
- Functional transcendence: decompose Chevalley's indecomposability theorem and the algebraic-subgroup step (gap), and the geometric forms of Ax–Lindemann (Bakker–Tsimerman Theorem 1.2.11 and Corollaries 1.2.13–1.2.15).
- Differential Galois theory (gap) must be supplied before Beukers' Theorem 2.5 rests on nodes.

