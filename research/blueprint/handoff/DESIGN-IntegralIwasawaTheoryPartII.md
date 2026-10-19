# DESIGN-IntegralIwasawaTheoryPartII

Completed by Codex, session **codex-4a02iA**, on 2026-10-19, for issue #3407.

## Delivered

The new Part II has six layers, GS.0–GS.5, from the signed regulator to the
all-prime Gross–Stark leading-term theorem. Its definition, complete blueprint,
reader and suggested file agree. The packet contains 49 targets: 11 definitions,
6 constructions, 26 theorems, 3 comparisons and 3 applications. There are 88 API
items, 54 discriminating Checks, 29 planets and 15 pinned baseline citations.
All implementation statuses remain unchecked.

Every stage is **planned**. There are no recorded mathematical gaps. Stages
remain open because their explicit supplier contracts must be discharged;
none is claimed closed. The endpoint is the rank-r divided derivative formula,
including p=2. General exact order remains equivalent to regulator nonvanishing;
only ranks zero and one receive unconditional exact-order consequences here.

The reader retains all target statements, hypotheses, proof steps, APIs,
Checks, direct dependencies and source locators. Its worked examples include
ramified, inert and split primes of Q(i), the w=−1 quotient and the unequal-order
inverse-character filtration. The three specific Artin quotients are genuine
quotient-ring targets, with normal forms and nonzero classes; the inverse proof
uses the y-adic quotient rather than an incorrect maximal-ideal graded line.

## Ownership and requests

The first prerequisite is the parent IntegralIwasawaTheory. No generic
cohomology, class field, logarithm, Hilbert form, ordinary projector or GMA
carrier is recreated. Current upstream IntegralHeckeAndGaloisDeterminants and
ProfiniteArithmetic boundaries and relevant suggested declarations were read,
along with the related atlas supplier stages and available finer nodes.
The current Tau Ceti library was searched beyond the pinned baseline.
Two upstream notes flag the precise additional adapters and the generality of
the Hilbert-family inputs. No restructuring or downward ownership move is needed.

The packet's 15 requests give exact statements and consumers:

| Supplier | Required contract |
| --- | --- |
| ArithmeticGaloisDuality:R02.3 | Continuous p-adic restriction/inflation, finite-index averaging and the E-linear adapter on existing H¹. |
| ArithmeticGaloisDuality:R02.4 | Ordered cup/Kummer evaluation and the rational Selmer annihilator description. |
| AutomorphicPadicLFunctions:L0 | Character avatars, critical values, nonzero interpolating germ and pole normalization. |
| AutomorphicPadicLFunctions:L3 | All-prime Deligne–Ribet/cocycle comparison, auxiliary-level theta/Hasse and boundary operations. |
| DiophantineApproximationAndTranscendence:DT.3 | Baker–Brumer logarithmic linear independence with the rank-one character consequence. |
| DirichletPadicLFunctions:L3 | Extended Iwasawa logarithm, kernel, local norms and dyadic principal part. |
| IntegralHeckeAndGaloisDeterminants:IHG.1 | Finite continuous actual-matrix realization of the shared GMA/extension modules. |
| IntegralHeckeAndGaloisDeterminants:IHG.4 | Closed original coefficient-order and congruence-ideal density adapter before localization. |
| IntegralIwasawaTheory:I.1 | Arithmetic cyclotomic character and coordinate compatibility. |
| OrdinaryAutomorphicFormsAndModularityLifting:R21.3 | Actual continuous irreducible ordinary family representations for arbitrary totally real F and all p. |
| PadicFamilies:L5 | All-prime ordinary control, finite modules, primitive tame-level reduced order and its completion. |
| Tau Ceti Chebotarev, layer 10 | Prime selection and Frobenius density. |
| Tau Ceti ClassFieldTheory, layer 7 | Absolute local Artin normalization and norm compatibility. |
| Tau Ceti ClassFieldTheory, layer 11 | Global reciprocity on the completed quotient and principal ideles. |
| Tau Ceti ClassFieldTheory, layer 13 | Finite unramified abelian class-field quotient. |

Existing finer supplier nodes are cited where sufficient. In particular,
restricted odd-prime/even-degree Hilbert nodes and semisimple representations
only over an algebraic closure do not silently stand for the unrestricted input.
The order-of-vanishing endpoint is proved here from the supplied cocycle/measure
comparison, not requested from its owner or assumed from the parent's odd-prime
main-conjecture route.

## Sources and source corrections

Read the published Dasgupta–Kakde–Ventullo paper in full, Annals 188 (2018),
pp. 833–870. Directly compared arXiv v1 Theorem 3.2, p. 16, for its normalized
cuspidal projection statement. Supporting readings were Dasgupta–Darmon–Pollack,
Proposition 1.4/Lemma 1.5, Lemma 2.9/Corollary 2.10, Propositions 3.3–3.4/Lemma
3.5; Charollois–Dasgupta, introduction Theorems 2–3 and §5 with both proofs;
and Ventullo, §2.1 and §§4.1–4.2 including Theorem 2. URLs, editions, read dates,
page conventions and hashes are in the packet. No required source remains
unread or inaccessible. No restricted books were used.

The packet carries 29 own-word source findings, rechecked against the published
text, with provenance in the independently reviewed extraction. E1 and E8 were
rejected there and are excluded. Preprint-only slips outside the directly
compared theorem are excluded. The earlier extraction's correction-search
record is attributed explicitly; this design did not repeat that external
search or claim that these are newly discovered errors. The unsupported map
in Remark 4.5 is excluded from the proof route. All mathematical statements and
source descriptions are paraphrases, with no source excerpts.

## Validation and Lean boundary

`check_blueprint.py` passed with **zero errors and zero warnings**, including
checking every baseline reference against the pinned declaration index.
The source-issue schema and version records also pass their component checks.
The five deliverables pass intake file checks and whitespace validation.
The reader was checked for exact inclusion of every target statement, API,
Check, proof step and locator, and the layer graph includes all direct
cross-layer dependencies.

The 172-line suggested Lean file **compiled with lean-check at the pinned
build, exit 0, with only the expected proof-placeholder warnings**. It contains
three light definitions with real bodies on existing carriers: a determinant
regulator adapter, its signed matrix ratio, and a normalized power-series
coefficient. It states their finite-dimensional milestones and examples.
Full arithmetic carriers absent at the pins remain exact reader targets;
there are no substitute proposition fields, data placeholders or new theory
constructions in the suggested file. The reader maps its signatures to targets.

An independent exact rational calculation checked 20 finite quotient examples:
W₁ and W₂ for (r,s)=(1,1),(1,2),(2,2),(2,3),(3,4), W₂ at w=2/3 and w=−1;
W₃ for (r,s,t)=(1,2,1),(1,3,2),(2,3,2),(2,4,3),(3,4,3).
It checked dimensions and the required nonzero graded classes, and checked
π^s−y^s=y^s/w in W₂. These finite diagnostics supplement the general normal-form
arguments; they do not claim a formal proof.

## Next action

An independent session reviews the complete design, its sources and closure.
Each stage's remaining list names its outstanding supplier contracts. Discharge
those contracts through their owners before marking stages closed; formalization
of the arithmetic targets follows the planned prerequisites. This run submits
one finished design and takes no second job.
