# Independent review of the third ArithmeticKTheory N.7 fixes

Refs #7283. Job REV-FIX-RT-BP-ArithmeticKTheory--N.7~3.
Codex — codex-KAtZYI, 18 October 2026; independent of fixer codex-ydlF4b.

**Verdict: accepted for the scoped fixes.** Both confirmed findings are repaired,
and the replacement N.8 generation argument resolves the obstruction retained
by the round-two review. Three separate N.7 gaps remain; its coverage is now
planned with those obligations listed explicitly. This accepts a mathematical
plan, not an implementation or the other outputs of the area-review job.

The immediately preceding area-review verdict is appended unchanged to
reviewHistory. The earlier packet reviews remain there as well. This verdict
follows their objections and checks the replacement proof independently;
it does not treat the unaccepted draft that supplied the finite integers as
an accepted source.

## Per-finding decisions

| Confirmed finding | Decision and evidence |
| --- | --- |
| RT-BP-ArithmeticKTheory--N.7/1: vacuous signatures and dummy certificate data | Repaired. The suggested file has no theorem asserting True, arbitrary eigenspace carrier, Unit certificate or sorry-bodied data definition. The residue-unit lemma uses the actual cyclotomic ideal quotient and needs primality only, including two. Unavailable K-groups, eigenspaces, Tate twists, w-values and certificate carriers have mathematical contracts with named suppliers rather than fabricated Lean carriers. ArithmeticData requires equalities to the actual arithmetic invariants and N.4 w-values; CertifiedExample uses N.6's certificate for the actual tame kernel, including span and an independent matching lower bound. |
| RT-BP-ArithmeticKTheory--N.7/2: duplicate Vandiver predicate | Repaired. IntegralIwasawaTheory L3 alone owns the predicate. Its defining class-number equivalence and cyclotomic-carrier transport are requested explicitly; N.7 owns the comparisons and K-theory consequences. No local predicate or nonexistent Lean import is declared. The historical verification bounds are labelled historical, and the global equivalence quantifies all odd primes, with K₄ separated from degrees at least eight. |

I checked the original claims, verifier decisions, all three fixes reports,
the retained reviews, the packet, reader and suggested file. Definition and
construction targets have discriminating API/tests. Missing carriers remain
reader targets; comments in the suggested file are not elaboration evidence.

## The retained Gaussian proof and replacement golden-field proof

The Gaussian argument retains the repairs from round two: positive words in
the finite residue group justify the three-set criterion, and the integral
ideal (a−b)v⁻¹ proves the norm-congruence lemma even for a uniformizer integral
only after localization. The zero-difference case is separate. Gaussian
rounding supplies the factor one half needed for earlier support, including
tied norms, and the norm-two step eliminates the remaining unit symbols.

For the golden field I independently checked these sensitive steps:

- The two- and three-coordinate kernels have indices q and q². Compact
  Minkowski permits the stated non-strict volume bound. Determinant-one
  stretches preserve the coordinate norm bound; strict norm below q gives
  actual earlier units.
- The fraction comparison has difference norm at most 4tt′. All cutoff
  inequalities follow for q>33, including the mixed comparison needed for
  multiplicativity.
- The inverse-prime-ideal square produces inverse generators with both
  embeddings below one. In the comparison ideal, q′≤q suffices: after removing
  v, the numerator ideal has norm below q and the denominator is the earlier
  prime. No unproved strict ordering of tied norms is used.
- The ordinary-unit stretch handles −1 and ε. Thus the section is inverse on
  generators, the graded residues are bijective, and finite-support descent
  reaches symbols of ordinary units.

The final symbol identities reduce that subgroup to {−1,−1} and {−1,ε},
both killed by two. This gives the upper bound four before signs or special
values enter. Their two real-sign images give the independent lower bound.
Neither bound uses Birch–Tate. The old 25/16 representative argument and its
unread cyclotomic tables are no longer inputs; this review makes no assertion
about those published tables.

## Independent finite-data checks

The verifier extracted from the actual reader passes all eleven certificates:
prime-list completeness, earlier support, residue generation, every exact
factorization, all 173 relation rows and all 23 selected maximal minors.

I separately represented a+bε by the rational matrix
[[a,b],[b,a+b]], verified every witness using matrix multiplication and inversion,
and diagonalized the **full** integer relation matrices with unimodular row and
column operations. This calculation does not use the supplied minor list.
All invariant factors except the last are one:

| Prime norm, in the stored order | Full relation-lattice index |
| --- | --- |
| 4, 5, 9 | 3, 4, 8 |
| 11, 11 | 10, 10 |
| 19, 19 | 18, 18 |
| 29, 29 | 28, 28 |
| 31, 31 | 30, 30 |

The index argument is sound: the relation quotient surjects onto U/U₁ and then
onto the residue units; its index divides the gcd of the selected nonzero
maximal determinants, q−1. Equality follows. A single minor need not equal
q−1. Five independent corruptions were rejected by the reader verifier:
a changed determinant, wrong witness coordinate, later prime introduced at
the first tied step, omitted split prime and changed relation coordinate.
The committed finite data are unchanged. Reproduction starts with the complete
Python block under “Reproducing the eleven finite certificates” in the reader;
the independent calculation above describes an additional check, not a new
runtime dependency.

## Sources, pins and ownership

Public sources personally read on 18 October 2026:

| Source and version | Locators used |
| --- | --- |
| [Weibel, combined K-book draft, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | III.5.2.2, pp.218/PDF226; III.6.1–6.5, pp.231–236/PDF239–244; Ex.III.6.4, p.243/PDF251; V.6.1, p.406/PDF414; VI.2.4–2.4.1, p.472/PDF480; VI.5.3, p.488/PDF496; VI.8.1–8.6, pp.513–515/PDF521–523; VI.10.1–10.8.2, pp.527–532/PDF535–540. |
| [Bass–Tate, LNM342 (1973), with Tate's appendix](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf) | II §3, Theorem3.1 and Lemma3.2, pp.403–407/PDF413–417; Lemma3.4 Claim2, pp.410–411/PDF420–421; appendix A1–A8, pp.429–436/PDF439–446, especially Proposition1, pp.430–431. |
| [Groenewegen, Bounds for computing the tame kernel, Math.Comp.73 (2004), 1443–1458](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/), [indexed published PDF text](https://scispace.com/pdf/bounds-for-computing-the-tame-kernel-4jcvx5pki0.pdf) | Lemmas6–7, pp.1447–1449; Lemma9/Proposition10, pp.1450–1451; Lemma12/Proposition13, p.1453; Theorems14–15, pp.1454–1455. The specialized proof avoids the general small-unit and packing inputs. |

The two downloaded volume hashes reproduce the packet:
K-book SHA-256 a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845;
Bass–Tate SHA-256 cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55.
The Groenewegen publisher endpoint returned403; the indexed published text was
read through the web tool. No binary hash is claimed for that reading.
No restricted book was used. The K-book confirms statement conventions; it
does not close the recorded Kummer or Herbrand–Ribet proof-source gaps.

I read AUDIT-27 and all 44 actual baseline declaration statements, including
surrounding hypotheses, at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
the Tau Ceti baseline remains f790474821cf4256814db967cb154e7af3d0c369.
In particular, compact Minkowski, lattice index–determinant, cyclotomic
ramification/residue degree, norm, quotient-cardinality and Gaussian rounding
have the required contracts. K-book's tame-symbol normalization is the inverse
of T.3's; the packet explicitly uses T.3 and its matching α, consistently.

Current upstream was checked read-only at roadmap revision
0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti revision
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. I read GlobalNumberFields and
AlgebraicTopology for scope/granularity, the relevant NumberFieldArithmetic
Layer7 material and current Sqrt5 arithmetic declarations. The golden-field
basis, discriminant, PID, units and splitting are existing arithmetic, imported
rather than replanned. Their current implementation is not claimed at the
older pins. N.4 owns w-values, N.6 the order certificate, T.5 the tame kernel
and signs, V.5 the general K₃ computations, and B.3 consumes the independent
example. No upstream checkout was edited or built.

## Corrections and validation

Corrections made in this review:

1. Changed N.7 coverage from source_decomposed to planned and populated
   remaining with its three existing obligations: Kummer/congruence proof
   sources, Herbrand–Ribet proof sources, and finite-coefficient products/Bott
   interface. All three gap records and all ten requests remain.
2. Added the already specified N.4 invariant/finiteness and T.5
   unramified-subgroup/tame-kernel-sequence nodes to the certificate format's
   explicit prerequisites.
3. Replaced the top-level review, preserved its predecessor unchanged, and
   updated stale summary, N.8 coverage and suggested-header prose.

No mathematical target, finite integer datum, source locator or executable
Lean declaration was changed. The reader mathematics agrees; its pre-review
status appendix still describes submission for review. That historical status
prose is outside this issue's authorized paths and can be refreshed during the
next authorized reader/assembly update.

Final checks: pinned-index packet checker **0 errors, 0 warnings** (23 nodes,
44 baseline references, 41 API items, 32 tests, nine planets, three gaps and
ten requests); reachable concrete-node dependency graph **acyclic** (293 nodes; 448 baseline/stage
leaves, with stage references unexpanded); sorry-data
check **passed**; suggested Lean **exit0 with 27 sorry warnings only**;
submission-scope checks and git diff --check **passed**.
The Lean check is signature elaboration, not proof of the admitted theorems.

