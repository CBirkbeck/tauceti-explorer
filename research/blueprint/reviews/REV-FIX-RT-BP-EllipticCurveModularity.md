# REV-FIX-RT-BP-EllipticCurveModularity

Verdict: **needs_changes**. The submitted fix for RT finding /1 is correct.
This review repairs several clearly fixable parts of /2–/5, but the packet still
needs the modular-quotient converse proof, honest typed supplier-dependent Lean
signatures, and a corresponding reader update before acceptance.

Codex — `codex-rtOQ9t`; issue #5191; 2 October 2026.
Base: `d95ac7170c6bd773529b1f60b768b830d22a3651`.
Reviewed FIX issue #5045, Codex `codex-J6LwjP`, latest submission
[PR #5635](https://github.com/CBirkbeck/tauceti-explorer/pull/5635), merged as
`a7fb64c6fc917397073442e084f837baba6b13d8`.

Independence: I did none of FIX #5045. I did the earlier RT verification,
[issue #4434](https://github.com/CBirkbeck/tauceti-explorer/issues/4434), recorded
in `research/blueprint/reviews/REV-RT-BP-EllipticCurveModularity.md`.
This is disclosed rather than presented as another independent verification of
that report. The present job expressly requires independence from the FIX author;
this review checks that author's actual changes against the sources and pins.

The FIX report explicitly limits its repair to /1, the single finding in its
issue instructions, and leaves /2–/5 for follow-up. That scoped claim is accurate.
The present review instructions require a disposition for every confirmed finding.
The overall verdict therefore describes the resulting packet, without treating
the FIX author as having claimed to resolve the other four findings.

## Finding /1: duplicate cross-level strong multiplicity one

**Correctly fixed; accepted within scope.** The local lemma node is deleted.
Its three consumers import upstream ModularForms Layer 5 through canonical
`upstreamPrerequisites`, the exact supplier request and explicit import links.
The request preserves weight two, normalized newforms, trivial characters,
nonzero levels M,M′ dividing nonzero N, and agreement at almost all good primes.
Enlarging the exceptional set by the finite set of prime divisors of N gives
the supplier's agreement outside MM′. Both forms must be primitive: equality of
good coefficients with an old eigenform does not identify its ambient level.

I read the reviewed Layer 5 entry in `data/library-coverage.json`, RS-06's
R29.3/R29.4 ownership decisions, and the actual declarations at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

- `HeckeRing.GL2.Newform` in
  `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` extends the
  normalized nonzero-level eigenform with character and new-subspace data.
- `Newform.eq_of_forall_notMem_eigenvalue_eq` in
  `Newforms/StrongMultiplicityOne.lean` fixes level and weight, assumes equal
  characters, and asks for equal eigenvalues at all coprime positive indices
  outside a finite set. It is not the required cross-level prime-agreement theorem.

The surviving Layer 4 request retains finiteness, bad-prime coefficients and the
oldform regression, while removing the fragment that reconstructed Layer 5's
uniqueness theorem. The initial form has primitive level M dividing N; R29.4
separately proves M=N. The level-11/22 acceptance example is attached to
`newform-of-E`. No local proof of the imported theorem remains.

## Finding /2: missing explicit supplier prerequisites

**Corrected here, with the documented checker encoding obligation retained.**
The original count was nine pairs across eight nodes. Deleting the duplicate
leaves eight pairs across seven nodes; the FIX already adds Layer 4 to
`newform-of-E`, leaving these seven pairs across six nodes:

| Supplier | Consumer node suffix |
| --- | --- |
| EllipticCurves Layer 4 | R29.1/residual-conductor-equality |
| EllipticCurves Layer 4 | R29.4/bad-euler-factors |
| ModularForms Layer 4 | R29.3/a-single-newform-for-infinitely-many-p-and-exact-coefficients |
| ModularForms Layer 4 | R29.4/bad-euler-factors |
| ModularForms Layer 8g | R29.3/rational-coefficient-field |
| JacobianChallenge Layer F | R29.5/modular-parametrisation |
| ModularForms Layer 7 | R29.6/l-function-continuation |

Added each exact existing request supplier to the consumer's
`upstreamPrerequisites` and added its source-to-consumer link. All eleven
upstream links and their canonical endpoints resolve against the assembled
atlas. Every request supplier/consumer pair, including the augmented /3
requests, is now explicit in `prerequisites` or `upstreamPrerequisites`.

The stock checker classifies `tauceti:` prerequisites as declarations before
consulting stage IDs. This review follows the FIX's existing compatibility
encoding, does not invent baseline declarations for unbuilt stages, and expands
the encoding gap's consumer list. The stock checker alone does not certify these
imports; separate endpoint and acyclicity checks do.

## Finding /3: false whole-Jacobian decomposition

**False formula corrected; proof obligation remains.** Cremona §2.7 gives an
oldclass basis indexed by positive divisors of N/M, with dimension τ(N/M).
The appropriate requested rational isogeny decomposition is

`J₀(N) ∼ ∏_{M|N} ∏_{[f], level M} A_f^{τ(N/M)}`,

where [f] runs over Galois orbits of normalized weight-two primitive forms with
trivial character. For each individual A_f, R19.6 compares its rational Tate
module with `⊕_{λ|r} Res_{K_{f,λ}/ℚ_r} V_{f,λ}`. Restriction of scalars and the
oldform multiplicities cannot be dropped. Read the R14.5 and R19.6 stage
contracts: R19.6 supplies the individual quotient comparison, not this theorem
about the whole Jacobian. The augmented R14.5 request now asks for the old/new
isogeny decomposition, using ModularForms Layer 4; the R19.6 request preserves
coefficient fields and dimensions.

Exact genus arithmetic gives g(X₀(1))=g(X₀(2))=0, g(X₀(11))=1 and
g(X₀(22))=2. The level-11 normalized form yields independent f(q),f(q²): the
coefficient matrix at q,q² has determinant 1. These exhaust the level-22
weight-two space. Its rational Jacobian Tate module has dimension four, while
one copy of the level-11 representation has dimension two. This regression is
now explicit in `modularity-theorem`'s acceptance criteria.

Replacing the formula does not prove that a semisimple two-dimensional quotient
is a single absolutely irreducible constituent. The packet now records the
missing steps: use R28.6's Tate-Hom comparison and End_ℚ(E)=ℤ with semisimplicity,
extend scalars, select a constituent with an actual coefficient embedding, then
justify rationality/descent and exact conductor. Read the existing R28.6
Tate-Hom and semisimplicity node statements; no theorem proving End_ℚ(E)=ℤ is
invented here. The request to its owner remains open. The incorrect degree-one
coefficient-prime inference is removed. R29.6 coverage is downgraded to
`partial` with the remaining proof named explicitly.

## Finding /4: weak exceptional-prime tests

**The requested tests are added; a further separating test is added.**
Fresh exact arithmetic checks the following fixtures. Coefficients are ordered
(a₁,a₂,a₃,a₄,a₆).

| Fixture | Coefficients | c₄ | Δ | Expected test |
| --- | --- | --- | --- | --- |
| 11a1 | (0,−1,1,−10,−20) | 496 | −11⁵ | 7 ∉ Σ |
| 26b1 | (1,−1,1,−3,3) | 129 | −2⁷·13 | 7 ∈ Σ |
| Valuation only | (1,0,0,−7,9) | 337 | −2⁷·137 | 7 ∈ Σ |
| CM | (0,0,0,−1,0) | 48 | 64 | finite Σ; 2 ∈ Σ |

For 11a1, v₁₁(j)=−5. At the good prime 3, #E(𝔽₃)=5 gives a₃=−1;
the mod-7 Frobenius discriminant is 3, a nonsquare. A rational cyclic
7-subgroup would give an invariant line and force a split characteristic
polynomial, so it cannot exist. The curve is good at 7 and no valuation clause
adds 7. This proves the expected non-membership without classifying every
exceptional prime.

For 26b1, the successive nonzero multiples of (1,0) are
(1,0), (−1,−2), (3,−6), (3,2), (−1,2), (1,−2), followed by O.
Thus the point has exact order 7. Also c₄ is a 2-adic unit and v₂(Δ)=7,
so the model is minimal with multiplicative reduction and v₂(j)=−7.
The curve is good at 7. This fixture activates both extra clauses together.

For the valuation-only curve, the same unit/minimality argument gives
v₂(j)=−7. At 3, #E(𝔽₃)=6 gives a₃=−2 and mod-7 discriminant 6,
a nonsquare, ruling out a rational cyclic 7-subgroup. Its good reduction at 7
makes this a separate valuation-clause test. Added the two requested names
`exceptionalPrimes_11a1_seven`, `exceptionalPrimes_26b1`, and the additional
`exceptionalPrimes_valuation_only` in both packet and suggested file.

These tests catch over-inclusion, deletion of both substantive clauses, and
deletion of the valuation clause. They do not separately catch deletion of the
rational-isogeny clause while retaining valuations; that limitation is stated.

## Finding /5: suggested-file mismatch

**Partly corrected; typed signatures remain incomplete.** Corrected the header:
Newform exists at the pin. Added the three original exceptional-prime test names
and the three new names as stateable Lean prototypes with concrete Weierstrass
curves and `sorry` proofs. The pinned Weierstrass coefficient structure and
`IsElliptic` carrier were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`.

The suggested file now inventories all sixteen API names and all fifteen test
names. The eight previously absent API names and nine supplier-dependent tests
are recorded with their mathematical contracts. This is a coverage ledger,
not a claim that comments fulfill §13's typed signatures. In particular, no
constructor produces `Newform N 2` from an arbitrary curve and arbitrary N;
the initial M|N and final M=N distinction is explicit. Residual irreducibility
is distinguished from the subsequent odd-characteristic absolute-irreducibility
step. No opaque `Prop` field replaces an unavailable condition.

The residual/conductor witness, newform–curve coefficient comparison,
Jacobian morphisms and differential interfaces must still be supplied before
honest typed signatures and the remaining nine tests can be elaborated.

## Sources and validation

Fresh public PDFs on 2 October, with hashes matching the existing records:

- [Serre, Duke 54 (1987)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf):
  §4.6, printed pp. 207–208 (PDF pp. 29–30), conductor conditions and the
  infinite-prime argument; rendered p. 208 checked against its OCR text.
  SHA-256 `8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038`.
- [Cremona, Chapter II](https://johncremona.github.io/book/fulltext/chapter2.pdf):
  §2.1 p. 8 and §§2.6–2.7 pp. 25–27 (PDF pp. 2, 19–21), weight-two
  dimension and divisor-indexed oldclasses; rendered Proposition 2.7.2 checked.
  SHA-256 `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`.

The sixteen baseline entries and source-version records are unchanged.
All baseline names resolve through the pinned declaration index; fresh statement
reading here was confined to the relevant Newform/uniqueness and Weierstrass
interfaces, not a new audit of every historical citation. No new source erratum
is claimed, and the repaired whole-Jacobian formula remains a supplier request.

Validation: stock blueprint checker with the pinned index: **0 errors,
0 warnings**, 20 nodes, 16 API items, 15 tests, 17 requests and four gaps.
Exact rational group-law, point-count and genus computations pass. The request
coverage/name inventory checks and all eleven import endpoints pass. The
reachable node graph has 129 vertices and 279 edges, with stage inputs as
boundary leaves; it is acyclic. Adding all packet prerequisite directions to
the fresh assembled stage graph gives 3,007 endpoint vertices (2,956 catalogued
stages plus existing symbolic endpoints) and 8,653 distinct edges, also acyclic;
the assembled graph before those additions has 8,639 edges. Historical review
metadata is archived verbatim, and FIX provenance remains unchanged.

No Lean compiled: no existing build at both pins was available. No build,
cache download or language server was started. The named tests are prototypes,
not formal arithmetic verification.

The reader is outside this issue's authorized deliverables. A follow-up must
synchronize its converse formula, proof obligations and test/API discussion with
these corrections. Do not promote the packet until the remaining proof and
signature gaps are resolved and independently accepted.
