# Independent verification: Khayutin red-team findings

Job REV-RT-PAPER-KHAYUTIN-19, issue #4088. Codex, session codex-a71f92,
30 September 2026. Claim comment 5908735492 was confirmed by bot comment
5908738678.

All 11 findings are confirmed: 4 high, 3 medium and 4 low. Several proposed
fixes need the qualifications below. The machine-readable decisions are in
[RT-PAPER-KHAYUTIN-19.review.json](../redteam/RT-PAPER-KHAYUTIN-19.review.json).
This submission changes only the verification and handoff, not the extraction,
source issues, routes or generated collation worklist.

## Independence and scope

The extraction was written by cc-7b31c4 (PR #1956), its review by cc-39fac3
(PR #2261), and the red team by cc-f805bf (PR #4789). I did none of those jobs.
I previously contributed to the neighboring Duke–Imamoglu–Toth extraction;
its routes 1/10 are inspected here only as possible suppliers/overlaps, not
independently certified or edited.

Repository evidence was read at b8f21724739bc5c38de0fce0529b984f067f2e56,
using read-only Git access in the existing shared clone. I inspected every
finding's named item, issue record and source passage, the original review,
the prerequisite array and route briefs. This is a verification of the 11
findings, not a fresh line-by-line audit of every assertion in the 132-page
paper or a proof of its imported analytic theorems.

## Sources actually checked

The version of record is [Khayutin, Annals 189 (2019), 145–276](https://annals.math.princeton.edu/2019/189-1/p04).
The [publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf)
was fetched and its relevant passages read on 30 September 2026:
SHA-256 f22691429c27058fabd47fe12c6a901e7feffffad7a0c52e1a936da645166d6f.
Printed page numbers equal one-based PDF page numbers plus 144.

I also fetched the [v3 PDF](https://arxiv.org/pdf/1710.04557v3),
SHA-256 f740c4200434b0989bb6f728e4a385769b669320eec94ee8ace0e34279a53eb9,
and [v3 source archive](https://arxiv.org/src/1710.04557v3),
SHA-256 d76399f101eafbbc52e64185703ddeb820c9e868594feb3316cbe99bb4d5c110.
The source text independently confirms the high-severity quotations and
the relevant section-10 formulas; I do not claim to have collated the entire
preprint against print.

Published passages checked include pp. 159, 162, 165–166, 171–172, 176,
178–179, 185, 188, 194, 197–200, 203, 218–219, 222, 235–238, 241, 245–246,
248, 253–256 and 258–260. I visually inspected rendered pages 218, 236,
254 and 259 to disambiguate the formulas.

The [arXiv history](https://arxiv.org/abs/1710.04557) gives v2 as
18 October 2017, not 22 October 2018; the latter is v3. The journal page
and its DOI's [Crossref record](https://api.crossref.org/works/10.4007/annals.2019.189.1.4)
listed no correction/update relation. A targeted erratum search and the
[author's public publications listing](https://khayutin.github.io/) found no linked correction. These are
bounded negative searches, not a claim that no correction exists anywhere.

## Mathematical checks and corrected fix instructions

### Findings 1–4: false statements and their reach

For finding 1, let t be the positive conductor valuation at 2. Direct norm
expansion in an integral basis, together with the inclusion of all odd
scalar squares, gives this corrected table:

| t | Unramified, including split | Discriminant valuation 2 | Discriminant valuation 3 |
| --- | --- | --- | --- |
| 1 | all 2-adic units | 1 + 4 Z_2 | 1 + 8 Z_2 |
| 2 | 1 + 4 Z_2 | 1 + 8 Z_2 | 1 + 8 Z_2 |
| at least 3 | 1 + 8 Z_2 | 1 + 8 Z_2 | 1 + 8 Z_2 |

Indeed, in a ramified integral basis sqrt(d), the norm is
a² - d·2^(2t)b² with a odd; for the unramified basis (1+sqrt(d))/2,
it is a² + 2^t ab + (1-d)2^(2t-2)b². Their residues modulo 8,
plus the scalar-square subgroup, determine the images. The discriminants
-16 and -32 have respectively the reduced primitive forms
(1,0,4) and {(1,0,8), (3,2,3)}. This independently verifies the reported
global contradiction. The abstract genus-index formula remains usable
with the corrected local index. The computer check is a supplement to
these p-adic arguments, not a replacement for them.

For finding 2, use l=2 modulo 3 in the Q=x²+3y² counterexample:
Q(1,1)=4 modulo 6, but Q cannot be 2 modulo 3. A sufficiently large
translated disc can include (1,1), exclude the origin, and meet the size
hypotheses; theta_l=3/4, eta=1/10 and delta=4 suffice asymptotically.
The missing k_0 really makes the printed bound zero with a positive left
side. For the other half of the finding, replace the red team's
nonintegral k_0 by A=10^12, R=10^7, k_0=10^5, theta_l=3/4, eta=1/10.
The rescaled curvature has logarithm 3/2, while its required area bound has
logarithm 7/5. Such A/R are realized by an ellipse; the other size
parameter can be taken large enough. This disproves the claimed implication
in the proof, not the conclusion of Proposition 9.25 itself.

For finding 3, the red team's centered-path count is correct for n positive.
At n=0 the index is 1, including when a is compact. Include this boundary
case in the corrected statement. For n positive the extra factor is at
most 3/2; the denominator-measure upper bound used in Theorem 8.7 keeps
the right direction.

Finding 4 needs more than changing the two quoted sentences. The parity
of finite valuations maps the idele square-class quotient onto an infinite
discrete direct sum, including when its infinite component is positive.
Rational -1 removes the archimedean sign obstruction only after taking
the rational quotient, proving surjectivity of the double-coset norm map
in both signatures.

In particular the fibre asserted compact on p. 254, footnote 11, is not
compact. Item 123 repeats that proof. Do not endorse the red team's
unqualified downstream harmlessness assertion. Replace that step using
section 7.2's volume definition: put c=xi_1^(-1)xi_2. Conjugation by
xi_1 preserves Haar measure on G(A)^+ because the local semisimple adjoint
determinants have absolute value one. Thus

    vol([G^Delta(A)^+ xi]) = 1 / m_{G(A)^+}(Omega intersect c Omega c^(-1)).

The volume already factors through c; the required positive continuous
function does not need compact fibres. Record the erroneous compactness
argument as affecting the proof, and propagate the replacement to item 123.

### Findings 5–7: missing inputs and reuse

Finding 5 identifies a real missing interface: rank-one adelic packet
equidistribution, including tightness, is used at pp. 171, 176, 178 and
238 but has no standalone item. The modular-surface genus statement of
Duke–Imamoglu–Toth does not replace arbitrary quaternionic adelic packets.
State the imported theorem and its normalization/hypotheses precisely,
add Lin68, and connect its split-surface specialization to GN.4.

For finding 6 the overlap test must be the exact inequality

    (2 - 1/theta_l)/3 < 1/(2 + 2/(1-theta)).

At the two classical endpoints both sides equal 1/6. Huxley's improvement
or an appropriate Ramanujan improvement leaves room for both margins;
neither alternative should be mistaken for an unconditional requirement
to use both. Extend the brief with the small-norm argument, norm gap,
Siegel ineffectivity and entropy step, and identify their cited inputs.
The review verifies their role and missing records, not their original
proofs.

For finding 7 I read the cited statements at
[Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369):

- TauCeti.Multiquadratic.isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one,
  Quadratic/GenusCharacter/PrincipalGenus.lean:150;
- TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one,
  Quadratic/TwoRank.lean:155;
- TauCeti.Multiquadratic.genusCharFun,
  Quadratic/GenusCharacter/Basic.lean:212.

The paths are under TauCeti/NumberTheory/Multiquadratic/. The first uses
the narrow class group and a prime-discriminant factorization; the second
has the squarefree negative-radicand hypotheses. The reviewed library
audit marks Multiquadratic layers 2–3 built. Import these results through
explicit comparisons; do not label every local or adelic statement an
exact instance. In particular item 104 is not directly any of the three.
The nine arbitrary-order genus items belong in the existing Part II
direction, with HE.0 consuming them. Preserve items 36/37 (local differents)
in HE.0 along with 10–15/114: the proposed residual list omitted them.

### Findings 8–11: records and statement consistency

Finding 8's core is correct, but there are five existing stated-result
source issues, not six. Record actual version/reader/date/hash information;
update source.read as well as searched/readSections. Do not backdate this
verification to the previous review's reading. Worklist regeneration is
for the authorized fixing/intake workflow.

All six subpoints of finding 9 are confirmed. In particular, restricting
the sufficient criterion to Xi_1 resolves the xi-scope mismatch, and
the Hecke decay loss is 1-theta-epsilon. E13's proposed root normalization
is not always possible: 3 is not a cube modulo 7. Retain the unnormalized
matrix-entry correction instead.

Finding 10's duplication, eta-range inconsistency, L'/L explanation,
ineffective error and fibre-notation corrections are all warranted.
Shrinking eta to propagate E25 preserves the final strict exponent margin.
Findings 4/9 supply additional corrections to that same item 123.

Finding 11 is partial coverage, not total absence: the quaternion and
class-set content is planned, but the forms classification and adelic
central quotient comparison are not in the cited layers. Split the item
or mark the aggregate missing with partial-coverage notes. Do not add a
non-schema status. Hilbert 90 supplies field-valued lifts; the adelic
comparison must also handle integral lifts at almost all places.

## Verification and remaining limits

check_math.py passes: dyadic residues modulo 64 in all eight quadratic
etale classes, two reduced-form examples, the zero-density contradiction,
an integral/admissible rescaling witness, six exact centered Bowen indices,
the rational overlap thresholds and the noncube modulo 7.

The official check_redteam.py is run against the original result and the
new review. Additional validation checks the exact eleven-ID bijection,
the queue's two deliverables plus handoff, the intake's pure file rules
and whitespace. The original result/checker are scratch inputs only.
The consulted targets and instructions were unchanged on refresh to
29e3a85891b640a19e777ec133f613df6de31811; validation also passed at that
submission base.

No Lean file is a deliverable here; no Lean compilation, language server,
Lake project or library build was started. No claim is made that the paper
or these corrections are formalized. The original red team's wider
computational scans and unrelated source issues are not newly certified.
