# Arithmetic K-theory: third fixes submission

Refs #7282. Codex — `codex-ydlF4b`, 17 October 2026.
Job `FIX-RT-BP-ArithmeticKTheory--N.7~3`.

This completes the requested repair for independent review. The remaining
real-quadratic certificate obstruction is replaced by direct Tate descent in
ℚ(√5), with a proved norm-thirty-three cutoff and eleven exact finite
certificates. The packet, reader and suggested signatures now describe the
same route. This is a planning submission, not an implementation or a verdict
on its own fixes. The independent `review` and `reviewHistory` are unchanged.

## Finding /1: genuine signatures and certificate contracts

The original finding and its verifier, the two earlier fixes, and
`REV-FIX-RT-BP-ArithmeticKTheory--N.7~2.md` were read. The repairs already
accepted by that review are preserved: no `True` theorem, dummy certificate,
arbitrary eigenspace carrier or admitted Vandiver predicate is introduced.
The residue-unit cardinality statement still has genuine pinned carriers and
requires primality, including the prime two.

One remaining admitted data definition was removed: the local `wInvariant`
prototype. Its actual supplier is N.4/the-w-invariant and its finiteness node;
N.7 retains its Bernoulli comparison and numerical API. Its definition is
specified using the compatible finite Tate twists, equivalently
`H⁰(F, ℚ/ℤ(i))`. It is not replaced by roots of unity in a fixed cyclotomic
field. Because those supplier values are unavailable at the pins, the full
`ArithmeticData` record is also a mathematical target rather than an
incomplete Lean record. The reader and suggested comments explicitly require
every arithmetic field to equal its actual supplier, including each positive
weight's w-value, and specify the degree/signature and unit-rank identities.

`CertifiedExample` requires N.6's actual order certificate, the upper span,
independent matching lower bound, numerical tags and provenance. An admissible
upper-bound report is distinguished from a certified order. No missing
certificate carrier is disguised as a Lean structure. The existing expressible
light definitions remain real-bodied.

All 23 targets, 41 planning API items and 32 tests occur in the reader and
suggested declarations or supplier-labelled mathematical comments. The reader
is rebuilt with each target's hypotheses, proof route, checks, dependencies
and locators. This also synchronizes the earlier Gaussian norm lemma, the
positive-word criterion proof, N.4 ownership and the real-quadratic route.
The Bernoulli tests explicitly distinguish arithmetic B₁₂ from the source's
sixth topologists' number, and B₁₀ from B₁₀/5. The prime-divisibility statement
for w-values applies to every positive weight. Source passages and obsolete
excerpt fields are removed; the mathematical descriptions are in our own words.

## Finding /2: Vandiver and other ownership

IntegralIwasawaTheory L3 remains the sole owner of the Vandiver predicate.
N.7 imports it and owns its comparisons and consequences. N.4 owns w-values;
N.6 owns the certificate engine; K2SymbolsBrauer T.5 and K3BlochGroups V.5 own
their general low-degree computations. SpecialValuesBirchTate B.3 consumes
the independent N.8 golden-field certificate and supplies neither bound.

Current upstream arithmetic was read before revising the route. The
NumberFieldArithmetic ℚ(√5) example already supplies the integral basis,
discriminant, signature, PID property, class number, unit group and splitting.
These are imported through its existing Layer 7, not planned again here.
Current Tau Ceti's `TauCeti.NumberField.Sqrt5` declarations are recorded in
`upstreamNotes`, with the exact current revisions; they are not misrepresented
as available in the older pinned build. IntegralLattices and pinned Mathlib
provide existing lattice infrastructure.

## Round-two review: Gaussian proof retained

The norm filtration, surjectivity of α, its Steinberg kernel, and finite-support
descent are retained. The criterion uses positive words in the finite residue
group before deducing stability under inverses. The norm-congruence proof
uses the integral ideal `(a−b)v⁻¹`; its localized uniformizer need not be
globally integral. Zero difference is separate. Thus the earlier Gaussian
rounding proof still gives earlier-unit representatives and a complete span
argument, including the norm-two step. No Gaussian certificate is replaced
by a lower bound or a numerical special-value computation.

The original Bass–Tate appendix was obtained this round. Its Proposition 1
and the original ideal-norm argument now have direct locators, replacing
reliance on an unread secondary attribution.

## Round-two review: replace the unresolved cyclotomic input

The review correctly identified that `N(c) ≤ (25/16)Nv` does not establish
earlier-unit support. Its norm-eleven diagnostic is not a disproof of
Zhang–Xu's theorem. This submission makes no new claim about their unavailable
representative selection or finite tables. Instead it removes the auxiliary
`tame-kernel-of-q-zeta-five` node and the unused Skalba input. That node was a
proof auxiliary, not one of this packet's required example endpoints. No
external packet reference to its node was found. The required golden-field
certificate retains its endpoint and uses four explicit supporting targets:

1. **golden-congruence-lattices.** In `O=ℤ[ε]`, with ε²=ε+1, congruence kernels
   in O² and O³ have index q and q² and covolumes 5q and 5√5 q². Product disks
   and the compact, non-strict Minkowski theorem supply small tuples. The
   strict norm bound below q proves that every entry is an earlier unit,
   including in the presence of equal-norm primes.
2. **golden-residue-section.** Small integral fractions define a section into
   U/U₁. The determinant comparison has norm at most 4tt′; the strict bound
   below q² proves independence of choices and determinant-one stretches.
   It is first a set map; multiplicativity is proved separately.
3. **golden-large-prime-cutoff.** For q>33, explicit inequalities with
   d=2√5/π prove multiplicativity using three coordinates. Minkowski on each
   earlier inverse prime ideal produces a generator with both embeddings
   below one. Comparing it to the section uses q′≤q, not q′<q: after dividing
   by the current prime, the residual ideal has norm below q and the earlier
   prime stays in the denominator. This handles tied norms. A separate
   determinant-one stretch handles −1 and ε. The section is therefore inverse
   on all generators of U/U₁, proving the quotient and graded-residue
   isomorphisms. Ordinary Minkowski and the explicit units suffice; neither
   Lenstra's general small-unit theorem nor an unread packing theorem is used.
4. **golden-finite-prime-certificates.** Exact integer witnesses cover all
   eleven primes of norm≤33, with a fixed order for split ties. Every relation
   is a verified product of earlier generators of the form a/b with
   a−b=πw, or an actual torsion relation. Residue images generate k(v)×.
   Selected maximal minors have gcd q−1. The exponent lattice quotient
   surjects onto U/U₁ and then the residue group; its index divides that gcd.
   These order bounds prove both maps are isomorphisms. The argument does not
   assume that one selected minor alone has index q−1.

The finite integer data are reused unchanged from the earlier unaccepted
[Codex area-fix draft, commit 52d782e2](https://github.com/CBirkbeck/tauceti-explorer/commit/52d782e22d720ce92e792daea91c84a39f6e5c39),
which the review identified as a possible alternative. That draft is a lead,
not an accepted proof. This round independently reconstructed the specialized
proof and recomputed every stored witness, residue subgroup and selected
determinant. The reader credits that provenance and includes the complete
exact-arithmetic verifier, so no scratch file or unstored search is needed.

Together these steps strip every prime from an unramified class. The ordinary
unit symbols reduce to {−1,−1} and {−1,ε}, each killed by two, proving the
upper bound four before any real-sign calculation. The two real signs give
the independent lower bound four. Thus the proposed N.6 certificate is
independent of ζ-values, Birch–Tate and a general two-torsion classification.

## Sources personally read and evidence limits

All readings below were made on 17 October 2026. Printed and PDF page numbers
are distinguished in the packet and reader. No source passages are deposited.

- [Weibel, combined K-book draft, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf):
  III.5.2.2 (p.218/PDF226), III.6.1–6.5 (pp.231–236/PDF239–244),
  Ex.III.6.4 (p.243/PDF251), VI.2.4–2.4.1 (p.472/PDF480), VI.5.3
  (p.488/PDF496), VI.8.1–8.6 (pp.513–515/PDF521–523), and
  VI.10.1–10.2, 10.4–10.8.2 (pp.527–532/PDF535–540).
  Fresh PDF SHA-256:
  `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- [Bass–Tate, The Milnor ring of a global field, with Tate's appendix](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf),
  LNM342 (1973), pp.349–446: II §3, Theorem3.1 and Lemma3.2
  (pp.403–407/PDF413–417), Lemma3.4 Claim2 (pp.410–411/PDF420–421),
  and appendix A1–A8 (pp.429–436/PDF439–446), including Proposition1
  (pp.430–431). Appendix Proposition3's incomplete proof is not an input.
  Fresh volume SHA-256:
  `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55`.
- [Groenewegen, Bounds for computing the tame kernel](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/),
  Math.Comp.73 (2004), pp.1443–1458: published article text pp.1443–1455,
  especially Lemmas6,7,9,12, Propositions10,13 and Theorems14–15.
  The [indexed published PDF text](https://scispace.com/pdf/bounds-for-computing-the-tame-kernel-4jcvx5pki0.pdf)
  was readable through the web tool; direct publisher and mirror downloads
  returned403. No binary hash is asserted for that reading. The specialized
  proof states all needed inequalities rather than importing its general
  small-unit or packing inputs.

The reviewed layer audit and all 44 pinned baseline declaration statements,
including their surrounding hypotheses, were read. The two new baseline
references are compact Minkowski in
`Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean` and
`AddSubgroup.index_eq_natAbs_det` in
`Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean`.
Current NumberFieldArithmetic's README and worked-example suggestions, the
current Sqrt5 arithmetic files, IntegralLattices and the other current roadmap
directions were checked for reuse. Nothing was built or edited in those
read-only checkouts.

Three separate N.7 gaps remain explicitly recorded: Kummer/congruence proof
sources, Herbrand–Ribet proof sources, and the finite-coefficient Bott-module
supplier. Washington is not in the cleared private-library index. This repair
does not claim those gaps closed. N.8's `source_decomposed` status is proposed
for review; neither stage is independently accepted or implemented by this PR.

## Validation

- Packet checker with the pinned declaration index: **0 errors, 0 warnings**;
  23 nodes, 44 baseline references, 41 API items, 32 tests and nine planets
  (five in N.7, four in N.8).
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.7.lean`:
  **exit0**, 550 lines, **27 admitted-proof warnings only**, at the pinned
  Mathlib. Available memory was76GB before the single compile. No language
  server or library build was started.
- `scripts/check_sorry_data.py`: **passed**. The mathematical targets with
  unavailable carriers remain comments, not checked Lean declarations.
- The verifier extracted from the actual reader: **all eleven passed**.
  Independently recomputed gcds are 3,4,8,10,10,18,18,28,28,30,30.
  Seven mutations were rejected: wrong determinant, late prime in an earlier
  group, truncated exponent vector, wrong factorization witness, missing
  prime, duplicate split prime, and nonintegral witness.
- Reachable concrete-node dependency graph: **acyclic**, 293 nodes and449
  library/stage leaves. Stage references are leaves; this does not certify
  closure of other packets' recorded gaps.
- Mechanical agreement: all target IDs and all API/test names occur in both
  reader and suggested signatures/comments. Independent review and history
  equal their pre-fix values. No quote/excerpt fields remain.
- Submission file checks and `git diff --check`: **passed**.

Only the four authorized deliverables and the worker handoff change. The next
action is the independent round-three fix review, beginning with the four
golden-field targets and the reproduced finite certificates.
