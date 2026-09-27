# BP-ColemanIntegration — smoothing-transform endpoint repair

Codex — codex-7e92bd. Refs #698. Own-job follow-up to merged checkpoint
#3165; review #373 is required to remain unclaimed at publication.
Input main: `7298540b6011548ad6ef0cb58ca39519116eaa38`. Original winning claim5852011342 was confirmed by
bot5852012056; the whole issue was reread. No second claim was made.

## Result and preservation

Partial checkpoint. Seven L3 nodes add the finite pole-cancelled rotated
smoothing transform, a unit denominator lemma, integral coefficient bounds,
whole-disc convergence, evaluation including the removable point, the
comparison with separate reciprocals away from the centre, and the bounded
Amice comparison. The construction has eleven API entries and eight tests.
Generic bounded rotation and O_K coefficient extension stay with PMIA L2;
unrotated smoothing stays with the exact Dirichlet L1 nodes.

The inherited suggested file inverted w(1+T)-1 and w^b(1+T)^b-1 separately.
At w=1 each has zero constant coefficient and each formal inverse is zero.
The correct b=2 series is 1/(2+T), with constant coefficient 1/2. Both the
smoothed-polylog derivative signature and the negative-moment transform
hypothesis now use the regularized series. The smoothed-twist definition uses
it too; the new off-centre lemma preserves its valid nontrivial-root formula.

The inherited smoothed-polylog statement now restricts the literal reciprocal
formula to z!=1 and specifies the removable value (b-1)/2. The proof's quotient
log((1-z^b)/(1-z)) had the wrong sign; it is log((1-z)/(1-z^b)), giving the
already-stated endpoint -log_p(b). These are blueprint/prototype errors, not
new source errata.

**129 of the 132 preceding node objects are unchanged.** Only
smoothed-polylog-combination, negative-moments-of-smoothed-measure and
smoothed-twist-as-sum-of-rotated-measures are amended. All fourteen scalar
five-term nodes, all stage statuses, all five gaps, all 24 source findings,
planets and restructuring records are preserved. The Dirichlet L1 request is
narrowed to its still-missing intrinsic pseudomeasure content; all twenty
request records remain.

Current inventory: **139 nodes** (19 definitions,
10 constructions, 68 lemmas,
32 theorems and 10 comparisons);
**253 API entries**, **134 packet tests**
(129 on definitions/constructions, five inherited lemma tests),
**91 typed examples**, **22 planets**, **103
baseline references**, **5 gaps**, **20 requests** and
**24 source findings**. No stage is closed; all implementation
statuses remain unchecked. Some inherited tests are honest comments where their
objects are not available, so packet and typed-example totals differ.

## Proof and validation evidence

The finite sums Q_b(Z)=sum_(i<b) Z^i and
R_b(Z)=sum_(i<b-1)(b-1-i)Z^i are explanatory notation. The construction is
G_(b,w)=R_b(w(1+T))/Q_b(w(1+T)), with a formal inverse only of the unit Q.
Coefficient recurrence, rather than an arbitrary nonzero-constant formal
substitution, proves the bound. Geometric decay then proves convergence on the
whole open unit disc. The endpoint is identified with the existing Dirichlet
series by its exact uniqueness theorem.

- Actual suggested file elaborated with **zero errors and 319
  proof-placeholder warnings**, and no other warnings.
- Actual PMIA and Dirichlet suggested suppliers were rebuilt: zero errors and
  respectively 160 and
  88 expected placeholder warnings.
- All 3,920 actual Mathlib imports were byte-checked against
  082e2d37e8b0463410cdb532e111cd43d5a66174. The one reached Tau Ceti module,
  LogOneAdd.Basic, was freshly compiled from f790474821cf4256814db967cb154e7af3d0c369
  with zero warnings. Its convergence hypotheses are not claimed p-adically.
  Two repository supplier imports are unchecked suggested files, not library
  implementations. Source and object hashes are in packet provenance.
- A separate four-lemma scratch proof establishes the old endpoint-zero formula,
  the correct b=2 constant, its nonvanishing and the cleared b=2 factorization:
  zero errors, warnings or placeholders; 2,803 Mathlib imports checked.
  SHA-256 `511cb37ec9fac0deb73cd5b0be23b3d31de7a2fe192b198b8126bf7cc97c7bf5`.
- 23,506 exact finite coefficient, rational evaluation and p-adic norm checks
  passed at p=2,3,5,7, parameters 1 through16 prime to p, six centres and sixteen
  coefficients. An independent binomial quotient checks the endpoint; separate
  rational inverses check off-centre coefficients. Six negative controls reject
  the zero endpoint, wrong sign, missing numerator term, nonunit parameter,
  invalid disc and reversed logarithm quotient. Another343 exact scalar cases
  check that logarithm quotient sign. These do not prove infinite convergence
  or compute Coleman L-values.
- Eight added baseline declarations were read at the pins and checked in Lean.

The publication guard detected a concurrent LAD packet update before any branch was written. Its new/changed nodes are entirely L4 operator theory; scope, summary, requests and review metadata were inspected, and the L1 input used here is unchanged. The refreshed input blob is recorded in provenance.

Indexed blueprint validation reports zero errors and warnings. The exact four-file intake reports zero problems. The graph is acyclic and reader/signature/API/test parity passes. Fresh main `5993998bc69b72b1cfccceb8c8534cf2f109b7f6` matches all 60 captured inputs and all four predecessor output blobs. The issue body and own winning claim5852012056 are unchanged; #698 is available and review #373 is unclaimed. The narrowed intrinsic-pseudomeasure request now names only its two actual remaining consumers. No manual merge or independent review was performed.

## Inputs and sources

Worker rules, both protocols and upstream guide were followed. The full owner
README, predecessor handoff, node inventory and relevant L3 statements/API/tests
were read. Reviewed AUDIT23 Coleman rows and its accepted review were read;
RS14/16/26 ownership decisions and touching contracts were checked. The exact
Dirichlet and PMIA supplier objects used here were read in this session, and
fresh snapshot bytes matched those reads. The previously fully read
Multiquadratic and JacobianChallenge upstream models and binding files likewise
match the fresh snapshot. This does not claim a fresh audit of every inherited
L0–L3 source or every historical numerical check.

Fresh public RJW v2 PDF: SHA-256
`efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.
Read §3.5.2 p.20, pp.26–27 and p.42 in full. The endpoint was collated with
published printed p.157, PDF SHA-256
`78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
The finite quotient and its detailed norm argument are explicitly worker-derived.
No new source finding or independent-review verdict is asserted.

## Remaining work

Resume the five unchanged gaps: general-curve algebraic de Rham comparison;
Frobenius independence/pullback without globally free differentials; the arbitrary
special-unit good-reduction input plus projective/Bloch comparisons after the
scalar five-term reduction; Besser–de Jeu regulator proof decomposition; and an
owner for complex Artin L-functions with coefficients. All twenty supplier
requests remain, including actual bounded O_K coefficient extension/rotation
and intrinsic pseudomeasure construction. The new Amice comparison is a plan
using that explicit supplier request, not a declaration of completion.

The full preceding scalar-transport handoff remains available at
[the preceding checkpoint](https://github.com/CBirkbeck/tauceti-explorer/blob/c9d1994d66d0ef4ea4e59268ecbd740f979a3323/research/blueprint/handoff/BP-ColemanIntegration.md).
