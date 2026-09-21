# Newton–Thorne: Hilbert symmetric powers — source-routing checkpoint

**Job:** PAPER-NEWTON-THORNE-26 · **Issue:** #1053  
**Agent:** ChatGPT Pro · **Session:** `cp-2109-planets01-f7c2`  
**Date:** 2026-09-21 · **Status:** partial, not a completed paper extraction.

## Source and version

James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular
forms*, Annals of Mathematics **203** (2026), no. 1, 283–347,
DOI **10.4007/annals.2026.203.1.4**.

The mathematical text inspected was [arXiv 2212.03595v2](https://arxiv.org/html/2212.03595v2),
19 February 2025, the 52-page author version. The [journal metadata](https://annals.math.princeton.edu/2026/203-1/p04)
identify the published paper. The journal's 65-page version was not compared
line by line with the author version. Parsed PDF text was used alongside HTML;
several page screenshots failed, and PDF bytes were not obtained in the execution
filesystem. Therefore the packet deliberately supplies no SHA-256 and makes no
claim of complete diagram verification. The paper's date is not a claim that
it first appeared on the day of this worker run.

Repository snapshot: `5354d3adfa696e54a69f68abc658970cab16b82b`.
The claim was confirmed by the bot in comment 5764400888 in response to this
session's comment 5764397094. No prior result file was present when preparing
this submission.

## Saved extraction and routes

The accompanying paper-v1 packet contains **57 records**: **34 theorems,
14 constructions and nine definitions**. One algebraic carrier is cited from
pinned Mathlib, eight records import already-planned stages, and 48 exact
source-specific records are assigned once each to seven existing proposed
roadmap owners. The `usesItems` links are the saved part of the dependency graph,
not a claim that every proof prerequisite has been extracted.

| Existing owner | Missing records routed | Exact destination stages |
|---|---:|---|
| ModularityAndLanglandsExtensions | 19 | ML.0, ML.3, ML.5 |
| ArithmeticGaloisRepresentations | 16 | R01.1, R01.4, G7 |
| AutomorphicGaloisRepresentationsPartII | 6 | AG2.0, AG2.6 |
| GL2AutomorphicRepresentationsAndTransfer | 3 | R16.3, R16.4 |
| ArithmeticGaloisDuality | 2 | R02.3 |
| LocalGaloisDeformationRings | 1 | L7 |
| PotentialAutomorphyInfrastructure | 1 | PA.2 |

These are all **source additions to existing directions**. No new roadmap or
Part II roadmap is proposed, and no owner document is edited by this PR.
The seven owner descriptions were read at the snapshot before assigning the
routes. The main symmetric-power endpoint is explicitly already planned in
[ML.3](../../../content/campaign/ModularityAndLanglandsExtensions/README.md).
It would be duplication to create a parallel Newton–Thorne endpoint roadmap.

The additional records give that endpoint its particular companions, residual
witnesses, coefficient-conjugation steps, auxiliary places and lifting hypotheses.
The exact tensor functoriality-lifting statement goes to ML.5; the comparison
of reciprocity and weight conventions goes to ML.0. A source-specific result
can be missing at declaration granularity even when its broad target is planned.
Here “missing” does not assert an exhaustive negative search of every pinned
library and every existing source packet: that audit remains explicit work.

## What must not disappear in a coarse plan

### Residual witnesses are not unrestricted tensor functoriality

Theorem 5.5 constructs an ordinary RAESDC representation whose **residual**
representation is the coefficient-Frobenius twist of the first rank-two factor
tensored with a small symmetric power. Theorem 5.9 provides the corresponding
witness under local hypotheses, retaining the extra Steinberg place used by
Section 6. Neither theorem says that the same characteristic-zero tensor with
the original form in both factors is automorphic.

The intermediate characteristic-zero automorphy statement instead uses the
companion of Lemma 3.1, with labelled Hodge–Tate weights zero and two. This is
what supplies regularity. The two residual-witness records and the separate
characteristic-zero companion record are kept distinct in the packet. The
paper expressly does not prove arbitrary GL2 × GLr tensor functoriality.

### Theorem 4.1 needs its nine hypotheses, including the dyadic branch

The recorded statement retains weight zero and non-CM, the rank-two congruence,
the residual SL2 bound, simultaneous local ordinarity and potential crystallinity,
the Steinberg-twist equivalence away from p, a perfect residual subgroup with a
regular semisimple element, the specific weights of the fixed factor, strong
irreducibility of the first tensor and irreducibility of the second. At p=2,
both rank-two representations must be potentially crystalline.

The proof patches a rank-two factor while using information about the
higher-rank tensor pseudodeformation ring at its automorphic point. This is
not a black-box invocation of a rank-two ordinary modularity theorem. The
rank-two ordinary roadmap and the general-rank PA.2/AG2/L7 inputs are therefore
not interchangeable. The complete internal Section 4 decomposition remains
unfinished; in particular, Proposition 4.9 is the dyadic patching construction,
with its formal-torus two-torsion action, rather than a generic tangent-map lemma.

### The Section 3 Steinberg obstruction is real

The untwisted tensor in Theorem 3.2 cannot simply be passed to the standard
Steinberg automorphy-lifting theorem. The paper constructs the necessary
comparison between local deformation conditions and propagates support through
generic primes. Proposition 3.13 weakens the relevant local condition from
trivial to scalar, using a twisting argument; its dimension-one characteristic-p
prime and genericity hypotheses must remain visible. Proposition 3.14 is the
subsequent propagation step. Those internal declarations are the first items
in the continuation handoff, not assumptions concealed by the endpoint node.

### Auxiliary primes and coefficient actions have different roles

Proposition 5.4 uses two tamely dihedral places. Their residue characteristics,
the two dihedral orders, the exclusions at 2 and 3, and reciprocal splitting
conditions rule out different residual-image failures. One auxiliary place
cannot simply replace the pair.

The final local context uses the ordered conditions that the first place splits
in the modulus-eight ray field composed with F(S), and the second splits in the
corresponding compositum after adjoining the first place to S. Lemma 5.3 supplies
the reciprocity needed to reach Proposition 5.4's symmetric form.

Lemma 5.7 changes the companion by a congruence at a **new coefficient prime t**.
It does not promise a congruence at the original p. Lemma 5.8 then changes only
the first tensor factor, one coefficient-inertia element at a time, keeping the
second fixed. Coefficient inertia preserves residual semisimplification;
arithmetic coefficient Frobenius is a different operation. The packet keeps
both constructions and the inverses in the transformed-embedding formulas.

### Reuse class field theory without hiding the Kummer application

The modulus-eight-and-all-real-places ray class field, splitting in abelian
composita, and the quadratic Hilbert product formula import the existing
upstream ClassFieldTheory Layers 12–14. They are already-planned records, not a
new class field correspondence.

The restricted-ramification exponent-two field F(S) and its one-new-prime Kummer
calculation are routed to ArithmeticGaloisDuality R02.3. Positivity and the dyadic
square condition of the prime generator must be checked. F(S) is permitted to
ramify at real places; making it totally real would change the construction.
The two-place application remains a source-specific part of ML.3.

### Normalize the theorem rather than silently changing characters

The paper uses geometric reciprocity and assigns the cyclotomic character
Hodge–Tate weight −1. ArithmeticGaloisRepresentations uses an arithmetic-Frobenius
normalization and weight +1. The packet adds an explicit comparison obligation.
Changing the sign convention does not by itself invert an actual determinant
character. The determinant, multiplier, Tate twists and local Langlands
normalization must commute with the same comparison.

The final Hilbert theorem includes non-paritious regular weights through a
separate reduction; no ordinary associated Galois representation is assumed for
such a form. The CM-field conclusion retains RAECSDC and non-induction from a
quadratic extension. Neither is promoted to arbitrary GL2 representations over
arbitrary CM fields.

## Baseline and prior-paper audit boundaries

The reviewed audit `data/library-coverage.json`, blob
`5e708cfc74a51b10e62149113872fe4e00eb5846`, was inspected. It marks
ArithmeticGaloisRepresentations:G7 not built (AUDIT-31); no direct ML.3 entry was
found. That absence is not evidence of either implementation or nonimplementation.

At Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`,
`Mathlib/RepresentationTheory/Basic.lean` was read and the algebraic
`Representation` carrier confirmed (blob `ace88b2889c74b7accc6a65f19ed3f83a37612ff`).
This is the packet's sole library claim. It provides no continuity, admissibility
or automorphy theorem. At Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, the modular-form Basic file was read
(blob `01755f6f9d93b7a858a62f0785ab2f50e37e2387`); its classical slash-action and
cusp-form APIs are not the required Hilbert/higher-rank theory.

Default-branch searches for RAESDC and adequate yielded no Tau Ceti hits; an
automorphy search returned classical automorphy-factor lemmas. Mathlib RAESDC
also yielded no hits. These are candidate-search observations, **not an
exhaustive negative pinned-library audit**. Continuation must search all relevant
source packets and declarations before treating every classification as final.

Nineteen prior-paper entries are saved with the locations for which they are
needed. The priority inputs include Tho24's level raising, NT23's adjoint-Selmer
result, ANT20/Tho15's residually reducible lifting, NT21b's patching model,
BLGGT14's local and weight-change comparisons, and Clozel's coefficient-field
theorem. Their theorem-specific coverage is marked unresolved: identifying a
topic owner is not verification of an imported theorem's complete hypotheses.
Further local-deformation, Sen-operator, anti-unit and finite-group inputs are
named in the remaining list. No claim is made that these papers lack existing
atlas coverage, or that the bibliography has been fully extracted.

## Continuation and validation

The packet and `handoff/PAPER-NEWTON-THORNE-26.md` specify the exact restart:
Section 3's internal declarations, both branches of Section 4's patching,
Section 1.2/automorphic-ordinary conventions, the remaining Section 5–6 proof
steps, independent prior-paper coverage, and the complete pinned/library and
PDF provenance checks. Correct saved item IDs should be retained.

Local checks passed for JSON, 57 unique IDs, kind/status counts, existing
item/context references and exactly one route for each of 48 missing items.
Full `scripts/check_paper.py` validation must run through the hosted Swarm
submission check. It was not run locally against a full atlas checkout.
No Lean file was changed or compiled, and no formalization or complete
blueprint claim is made. This submission preserves work and exposes the
remaining proof obligations; it does not mark the paper job complete.
