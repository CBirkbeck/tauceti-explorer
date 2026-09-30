# Review of the Browning–Le Boudec–Sawin fixes

**Accepted with the corrections below.** Job
`REV-FIX-RT-PAPER-BROWNING-LEBOUDEC-SAWIN-23`, issue #5134.
Codex — `codex-J6LwjP`, 30 September 2026; reviewed base `cb87b15`.

The fix was written by Claude Code `cc-c2c06b`. I did not write it. I previously
verified the red-team findings; this review follows that verification and checks
the subsequent independent fix. The issue requires independence from the fix's
author. The packet had no earlier top-level review object.

The assigned file is `packets/ArithmeticStatistics.json`. I checked the fix's
ST.5 shared-carrier/GN.0 request and ST.2 remaining-work entry, and inspected
the associated extraction's provenance and route changes read-only. This is
not a new acceptance audit of all 415 nodes, all 278 baseline declarations,
or the complete paper extraction. The packet remains partial, with 47 gaps,
53 requests and no closed stages. Acceptance records the correctness of these
scoped fixes and their explicit remaining obligations, not proof closure.

## Finding decisions

### /1 — accepted; provenance repair verified read-only

The extraction now has an explicit preprint `sourceVersions` entry with the
historical access date 2026-09-22 and the correct arXiv-v1 hash. My fresh
download reproduces that hash. The historical date was not replaced by this
review's date. The record expressly says the revised Annals text was not
obtained.

`check_errata.versions_checked` returns no errors. `collation.provenance`
returns `preprint`, and `collation.exposure`, using the real paper catalog,
returns this paper with the single stated-result issue E3. Thus the structured
record fixes the misclassification. Regenerating the collation worklist and
repairing the free-text fallback remain maintainer/tooling work, as the fixer
reported. The Annals landing page is bibliographic evidence, not evidence of
reading its article. No published-text equivalence is certified here.

### /2 — accepted after supplier/degenerate-case clarification

The extraction's `sigma`, `veronese` and `veronese-gcd` items are now planned
at ST.5. Their notes name the three exact nodes, and route 7 no longer assigns
them to the proposed Heights Part II. Its brief imports those carriers while
retaining the consumer's primitive-image/norm and global-counting obligations.
The stage-level `planned` references match `check_paper.py`'s schema; exact
node references remain in the notes and brief.

Read BLS Definitions 2.1 and 3.7, Lemma 3.11, (5.3) and (5.11) against the
three ST.5 nodes. The unweighted monomial convention, primitive-residue
normalization Q^(−n), CRT product and primitive-column hypothesis are right.
The prime-power proof compares proportionality modulo p^e through a unit
coordinate and the monomials X₀^d and X₀^(d−1)Xⱼ; it does not invert d.
Consequently it also works when p divides d.

The new GN.0 request correctly identifies a missing general maximal-minor
supplier. No such GN.0 node exists yet; its reviewed lattice/covolume coverage
does not imply that this source extension is already built. I made the
request an explicit prerequisite of both relevant ST.5 nodes and changed
the coefficient node's wording to import the integer gcd, while retaining
its elementary two-column coordinate formula.

I also supplied a necessary boundary in the request and its consumers. BLS
Definition 3.7 defines a **positive** gcd for independent columns. The
finite-residue ST.5 lemma also permits dependent pairs, including equal
vectors. It needs the canonical nonnegative gcd of minors, extended by zero
when all minors vanish (including an empty list). Then
gcd(G(x,x), p^r) = p^r, which expresses capped valuation r. The request now
asks GN.0 for this extension; the positive-gcd/saturation theorem retains
the independent-column hypothesis. This is explicitly an extension needed
by the consumer, not a claim that the source defines the degenerate case.

No general gcd or saturation proof was assigned to a second owner. No new
definition or node was added. The existing definition APIs and unit tests
remain; the minor-valuation lemma gains a dependent-pair acceptance example.

### /3 — accepted after strengthening the remaining proof obligations

The ST.2 coverage now names all three route-4 items and expressly leaves
them unplanned in this fragment, which the verified finding permits. It
identifies the compact-region quantitative Ekedahl sieve, uniform Lang–Weil,
a uniform singular-locus bound, smooth-point Hensel lifting, the reducible
locus, boundary nullity, congruence equidistribution and primitive/sign
normalization. The real factor is the coefficient-ball fraction of the
real-soluble cone, not Poonen–Voloch's box factor.

Freshly read PV's Theorem 3.6 and proof: its box theorem assumes n,d ≥ 2
apart from (2,2). The BLS Euclidean application uses n ≥ d ≥ 2. I made that
range explicit in the packet while recording the broader box statement.
The conic case remains separate: box containment and comparable coefficient
counts transfer the zero-density upper bound.

I strengthened three proof obligations in the existing remaining-work entry:

- **Infinite product.** Positive individual c_p do not imply a positive
  infinite product. Use the codimension-two finite-field count to obtain
  1 − c_p = O_{d,n}(p^(−2)) outside finitely many primes, and hence a
  summable sequence of defects. Each exceptional local factor must also
  be positive. The extraction note's phrase “positive since each factor
  is” should be read with this summability argument; its file is outside
  this review's edit scope.
- **Local positivity.** A coefficient neighborhood of a form with a smooth
  local point has positive measure. The form X₀^(d−1)X₁ + X₂^d at
  (1:0:0:…) has X₁ derivative 1 in every characteristic and also supplies
  the real-point witness. The real coefficient ball meets such a neighborhood
  after scaling.
- **Normalization and boundary.** Justify the Möbius tail in coefficient
  dimension N = binom(n+d,d), invariance of local solubility under nonzero
  scalar multiplication, exclusion of the zero vector and cancellation of
  the sign quotient. Extend the existing discriminant-nullity input to the
  required range rather than silently importing only its n ≥ 3 form.

The compact-region sieve gives the normalized codimension-two tail
O(1/(M log M) + 1/A). The FF.2 uniform Lang–Weil node is still a plan with
explicit Katz/Albanese/genus proof gaps; none is declared solved by this
review. These are proof obligations at the correct owners, not a theorem
obtained merely by adding links.

### /4–/6 — outside the fix's severity scope; no contrary acceptance

All three were confirmed **low** findings. PROTOCOL §17 and the fix issue
selected the three medium findings /1–/3. This review therefore does not
require or certify implementation of /4–/6:

- /4: the elementary consumed W bound can use the primorial theorem,
  separately from the stronger PNT asymptotic, with constants propagated.
- /5: the prior paper-review route explanations still need their scoped
  correction; ST.2 does not own unrestricted singular-factor convergence.
- /6: Bhargava's region theorem and its rank-one/Selmer inputs require their
  later source-completion work, preserving the cubic-surface transfer.

## Sources, baseline and validation

Fresh selective source reading on 30 September 2026:

| Public source | Passages inspected | SHA-256 |
| --- | --- | --- |
| [BLS arXiv v1](https://arxiv.org/pdf/2006.02356v1) | pp.1–4, 11–12, 50, 53 | `210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb` |
| [Poonen–Voloch author PDF](https://math.mit.edu/~poonen/papers/random.pdf) | pp.1–3, including Remark 2.1 and Theorem 3.6 with proof | `e4ec66ff04e6b6bf86f08bd66756e415c6e6be884cf1d49fa36d9428c4199045` |

Read the pinned Mathlib statements of `Finset.finsuppAntidiag`,
`MvPolynomial.IsHomogeneous`, `MvPolynomial.eval` and `MvPolynomial.eval_map`
in their recorded modules. The source checkout is exactly
`082e2d37e8b0463410cdb532e111cd43d5a66174`; these support the existing
polynomial carrier and coefficient-change API. No new baseline claim was
added, and no general minor-gcd/saturation theorem was inferred from a name.
Read the relevant accepted AUDIT-07/AUDIT-02 coverage, the GN.0 stage and
packet, and the ST.2/FF.2 supplier statements and gaps.

- Stock blueprint checker with the pinned index: **0 errors, 0 warnings**;
  415 nodes, 778 API items, 364 definition/construction tests, 36 planets,
  53 requests and 47 gaps. No node ID, baseline entry or source issue changed.
- The unchanged extraction passes `check_paper.py`; its version check and
  collation exposure reproduce the corrected behavior described above.
- Exhaustive finite-residue checks covered **28,704 pairs**: binary vectors
  modulo 2,3,4,5,8,9 in degrees 1,2,3, and ternary vectors modulo 2,3,4 in
  degree 2. They confirm capped-minor-gcd preservation, including dependent
  pairs and p dividing d. Separate counts confirm σ(X₀;5)=4/5,
  σ(X₀²;9)=2, σ(X₀²+X₁²;3)=0, modulus 1 and CRT at 12=4·3.
- PV's codimension inequality was checked for 2 ≤ n,d ≤ 20 and every
  factor degree; (2,2) is precisely the failing case in that range. These
  are finite diagnostics supporting the read proofs, not replacements.
- The read-only assembled graph has no ST.5 → GN.0 reverse path; the
  explicit supplier dependencies are acyclic. Packet acyclicity, intake
  checks on both assigned files and staged whitespace checks pass.
- No Lean file was assigned, changed or compiled. No library build or
  language server was started. Only the packet and this report were edited.
