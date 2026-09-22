# PAPER-DITTMANN-POP-23 — extraction and routing checkpoint

Codex, session `codex-c83e7a`; issue #1099; 22 September 2026.
Continuation of codex-a71f92’s merged PR #1662; all previous item and API IDs retained.
Status: **partial**. The whole main paper was read, but the original-source
proof audits listed below are unfinished. This is not a claim of formalisation
or a closed blueprint.

## Result and scope

Dittmann and Pop prove that every finitely generated field is characterized,
among finitely generated **fields**, by one parameter-free ring sentence.
Every **infinite** such field is parametrically bi-interpretable with the
integers. The qualification in both assertions is resolution of singularities
above F₂ when the characteristic is two and the Kronecker dimension exceeds
three. Characteristic two in dimension three is not subject to that general
assumption. Finite fields are handled by a cardinality sentence, not by
bi-interpretability with an infinite structure.

The geometric core, Theorem 1.3, is a uniform ring formula for each fixed
dimension d≥3. Its fibers are geometric prime-divisor valuation rings or the
empty set, including for inadmissible parameter tuples. Neither uniformity in
all dimensions nor a parameter-free definition of each individual valuation
ring is claimed.

The companion JSON has 129 items: 18 exact library inputs, 5 planned imports
and 106 missing items. Each missing item has exactly one route. Forty
definitions/constructions have 120 API contracts and 120 mathematical test
contracts, now each with a concrete downstream use. The item dependency graph and the six-route import graph are
acyclic. Proof outlines distinguish actual source arguments from outstanding
proof leaves.

## What was read

The main source is the [final author version, arXiv v2](https://arxiv.org/pdf/2012.01307v2),
dated 27 April 2023, 19 PDF pages. All of §§1–5 and the references were reread for this continuation.
Its SHA-256 is
`f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f`.
The [publisher record](https://annals.math.princeton.edu/2023/198-3/p04)
matches title, authors, DOI and publication, Annals 198 (2023), 1203–1227.
The author-version date is after acceptance and arXiv labels it final.
The guessed publisher PDF returned 404; a line-by-line comparison with the
25-page typeset publication was **not** performed.

The prior checkpoint acquired the following selected inputs, with URL, hash,
access date and read/not-read boundaries in `sourceArchives`. The AKNS,
Poonen, Jannsen, Kerz–Saito and EKM readings below are inherited evidence;
this continuation does not claim to have reread them:

- AKNS: interpretation/bi-interpretation, localization, Proposition 2.28 with
  its proof, Theorem 3.1 and the §3.2 proof. Earlier coding and §3.1 leaves
  remain open.
- Poonen: Theorems 1.1–1.4, global-field background Theorem 2.2, dimension
  Theorem 2.3, Lemmas 3.6–3.7, Proposition 4.10 and §5 including Lemma 5.3.
- Jannsen: coefficient convention, Theorems 0.4 and 0.10, Definition 4.18
  and the adjacent Theorem 4.19 statement. Not the complete Hasse proofs.
- Kerz–Saito: v3, §8 setup, Theorem 8.1 and its short proof reducing to earlier
  sections. Those earlier proofs remain unread.
- EKM: quadratic Pfister definitions, roundness and hyperbolicity,
  Fact 16.2 and the Arason–Pfister bound with its proof. The original
  Kato/Voevodsky and subform-theorem proofs are not thereby audited.
- Kuhlmann–Novacoski: this continuation reacquired the identical 20-page
  author PDF and read selected pp.1–3,5,7–13, including Definition 3.1,
  Lemmas 2.5,3.2,3.3 and the **full proof of Theorem 1.2**. The cited
  Raynaud/decomposition-theoretic foundations remain a source gap.
- Stacks tags [032N](https://stacks.math.columbia.edu/tag/032N),
  [030M](https://stacks.math.columbia.edu/tag/030M),
  [032L](https://stacks.math.columbia.edu/tag/032L) and
  [032O](https://stacks.math.columbia.edu/tag/032O): lemma statements and
  supplied proofs read, with fresh HTML hashes in `sourceArchives`. Tag
  030M omits proof details; the pinned Tau Ceti fixed-field proof was read.

Jannsen already has PAPER-JANNSEN-16 in the live batch. The prerequisite list
does not request a duplicate. Bibliography-only Rumely and Suwa links are
explicitly labelled as such, not represented as acquired original sources.

## Proof structure and critical interfaces

Use additive valuations with v(0)=∞. A prime divisor is discrete and drops
Kronecker dimension by one. Geometric means that field and residue
characteristics agree. Non-dyadic excludes mixed characteristic (0,2), not
equal characteristic two.

A Pfister form in characteristic two has **bilinear** outer factors and the
nonsingular quadratic final factor x²+xy+a₀y². The diagonal characteristic-
not-two formula cannot be reused unchanged. The vanishing criterion uses
both the graded quadratic-Witt/cohomology comparison and the Arason–Pfister
dimension bound, not just an abstract norm-residue theorem.

The proof pipeline is:

1. Higher Hasse principles detect anisotropic nice Pfister forms at divisors.
   Odd-degree alterations preserve the mod-two class through
   restriction/corestriction.
2. Nice global tails and étale specialization produce enough test forms.
   The substitution tᵢ=uᵢ²−uᵢ permits the root-extension tests in every
   characteristic.
3. Patch compactness produces a valuation satisfying all the domination
   inequalities. An explicit prime-ideal localization coarsens it, and the
   unit-tail argument makes it trivial on the relative constant subfield.
4. For the resulting finite detecting-divisor set Vₐ,
   bₐ is the **union** of the balls b_w={τ:2w(τ)>w(a_d)}. Its multiplicative
   stabilizer is the **intersection** of the valuation rings. Weak
   approximation proves the difficult inclusion.
5. A function with one pole of sufficiently large odd order isolates a
   single divisor. Filtering the stabilizer by the proper-valuation-ring
   predicate gives exactly the formula's allowed fibers.
6. Intersections of definable geometric divisors, then arithmetic flags in
   characteristic zero, define a finitely generated normalization domain.
   Fraction-pair interpretations and AKNS give bi-interpretability and QFA.

The empty case is essential: Vₐ=∅ gives bₐ=∅ and stabilizer K; the valuation
filter rejects that candidate. It must not return K as a divisor ring.

The auxiliary quadratic objects are **root fields** in an algebraic closure.
A split polynomial, a repeated-root polynomial in characteristic not two,
or a second root already in the first extension can yield a trivial
adjunction. A fixed four-dimensional quotient algebra is not an adequate
translation of all cases.

### Source qualifications that affect the plan

In Proposition 3.10, dividing tᵢ−εᵢ by uᵢ² gives
1−1/uᵢ−εᵢ/uᵢ². The printed plus sign before the last term does not give that
identity. The intended principal-unit argument survives with the minus sign.

In §5 the symbol W_T first denotes rank-one geometric divisors, but the
later arithmetic-residue step requires a full rank-e geometric flag, whose
final residue is finite over the number-field constants. The extraction
uses a separate G_T for these flags. A single divisor of Q(t₁,t₂) still has
a transcendental residue and cannot supply the required number-field step.

In Lemma 5.3 choose the nonzero evaluation of the reduced polynomial on the
**torus**, so every coordinate is nonzero and has a root-of-unity lift of
order prime to the residue characteristic.

AKNS Proposition 2.28 concerns a finitely generated structure in a finite
language. A finitely generated field need not be finitely generated as a
ring: Q already shows the distinction. Expand by total inversion, whose
unique graph is (x=0 and y=0) or xy=1; apply QFA in that finite language,
then eliminate inversion. This makes the concluding parameter-free
ring-language assertion explicit.

Poonen Theorem 1.4 alone is not the whole definability input. The extraction
names the global-subfield and relative-dependence results separately.
Jannsen's two-clause resolution hypothesis is also retained: a smooth proper
birational model and a smooth projective compactification with SNC boundary
are different requirements.

## Library and ownership audit

The pinned baselines are Mathlib `082e2d3` and Tau Ceti `f790474`.
Exact file links and declarations are in `baseline.declarations`; their
statements and hypotheses were read, rather than accepted from search hits.

Existing ring-language and parameter-definability carriers are reused.
Tau Ceti supplies compactness of the valuation spectrum's patch topology;
the field/valuation-ring membership dictionary remains an adapter. It also
supplies proper-valuation-ring discreteness for a one-variable function
field, the place/ring dictionary, weak and strong approximation for function
fields, and the exact prescribed-pole theorem used for singleton isolation.
No general replacement of those theorems is proposed.

The reviewed A0-extension audit explicitly identifies Tau Ceti’s finite
normalization theorem for purely inseparable extensions of multivariate
polynomial fraction fields. The previous checkpoint omitted that import.
The corrected plan now uses eight additional library items, each checked
against the actual pinned signature:

- Purely inseparable polynomial normalization, for an arbitrary coefficient
  field and any finite variable set.
- Finite normal envelopes, the purely inseparable fixed-field step, and the
  finite-action Galois fixed-field theorem.
- Integral-closure transfer down an integral base extension and descent of
  finite normalization through an injective algebra map.
- The universal valuative integrality criterion and the normal-domain
  minimal-polynomial coefficient comparison.

For P=k[T] in positive characteristic, enlarge E/Frac(P) to a finite normal
N and set I=N^Aut(N/Frac(P)). The order is **purely inseparable below,
separable above**. Normalize P in I using the pinned polynomial theorem;
its finite normal closure C has fraction field I. Normalize C in N using
Mathlib’s separable theorem, transfer back to P, and descend to E. The
opposite tower order would leave a non-polynomial ring at the purely
inseparable step and would not match the pinned theorem’s hypotheses.
In characteristic zero, including A=O_κ, the separable theorem applies
directly to the normal noetherian polynomial ring A[T].

`finite-normalization-generic` remains a planned A0-extension assembly, not
an exact built declaration. Its algebra and fraction-field tower adapters
still need Lean verification. General excellence or Nagata-ring theory is
not needed for this narrower consumer; general excellent-scheme finiteness
remains a broader target of the existing owner. The Krull–Akizuki file
proves Noetherianity and must not be mistaken for module finiteness.

The reviewed audits checked include HL.0–HL.7, the relevant upstream
quadratic-form layers, Adic coefficients L5, Algebraic curves Layer 12,
the normalization owner and Motivic–étale K-theory M.5d. No accepted audit
entry for the Logic roadmap or CR.4 was found; their absence is not called
an accepted negative audit. Their stage descriptions were read directly.

The live atlas's eleven referenced supplier/owner stages were compared
structurally with the local inputs and agreed. The current new-roadmap,
packet, integrated L5 decomposition and reserved-ID screens found no
competing owner for these extensions. Legacy references to retired
FoundationsAndLibraryIntegration are not adopted as suppliers.

## Henselian-generator proof now exposed

The five new missing lemmas all remain in the existing LD.1 source route.
For finite E/F inside a chosen henselization, use decomposition theory and
immediacy to identify the finite primes above the base valuation, with
residue degree one at the selected prime. Chinese remainders produces η
with residue 1 there and residue 0 at every other prime. Every nonidentity
embedding sends η to residue 0, whereas η itself has residue 1. This proves
primitivity. The source’s nonfixing index range accidentally includes the
identity; the extracted statement explicitly excludes it.

The monic minimal polynomial reduces to X^(n−1)(X−1), whose derivative at 1
is 1 in every characteristic. Thus η and h′(η) are units. In this specialized
argument the approximate root can be **x=1**. The finitely many conditions
v(a_i)≥0, v(h(1))>0 and v(h′(1))=0 are patch-clopen and give the neighborhood
in Lemma 3.9 by Hensel’s lemma. Arbitrary rank valuations, n=1, and h(1)=0
are included. No assertion that the whole extended valuation ring is a
finitely generated base algebra is used: Kuhlmann–Novacoski explicitly
warn that such an assertion can fail.

The selected-family integrality adapter also has a more explicit proof
outline. Prolong each selected base valuation to a normal envelope; all
conjugates of x are nonnegative because **all** prolongations were
quantified. Include inseparable multiplicities in the minimal polynomial,
then intersect its coefficient bounds. A single chosen prolongation is
insufficient: in Q(√6), x=(√6−1)/5 has valuation zero at one prime over 5 and
valuation −1 at the other; its monic polynomial has coefficients 2/5 and
−1/5. The pinned universal valuative criterion does not by itself remove
this selected-family adapter or its valuation-extension source gap.

## Routing decisions

| Route | Destination | Scope |
| --- | --- | --- |
| Source | LogicAndDefinabilityInNumberTheory, LD.0–LD.1 | Interpretation semantics, henselian and valuation adapters |
| Source | HigherLocalFieldsAndHigherClassFieldTheory, HL.2 and HL.6 | Exact coefficients, Kato complexes and Hasse inputs |
| Source | AlgebraicModuliForArithmeticGeometry, A0-extension | Normalization and valuative integrality interfaces |
| Part II | FinitelyGeneratedFieldDefinability | The new global definability, bi-interpretability and single-axiom results |
| Part II | HigherPfisterForms | All-characteristic, arbitrary-fold quadratic forms and their detection criteria |
| Part II | PrimeToDegreeAlterations | Gabber's degree control absent from arbitrary-degree de Jong alterations |

The Logic source route stays inside existing interpretation/valued-field
infrastructure; the main finitely generated field results require new
layers. Its Part II imports the cohomology, quadratic and normalization
owners rather than placing all mathematics under model theory.

Higher Pfister forms extends, and does not rewrite, the upstream
characteristic-not-two quadratic roadmap. General Milnor K-theory,
norm-residue and logarithmic de Rham–Witt remain with their existing owners.
The genuinely additional quadratic-Witt comparison is kept distinct from
generic Bloch–Gabber–Kato.

The alteration route is separate because reviewed L5 explicitly permits
degree divisible by the coefficient prime. A proof needing injective
restriction cannot silently substitute that theorem for an odd-degree
alteration. The exact ILO signature and base changes are still an audit gap;
the brief requires them before implementation.

Generic normalization remains with its accepted existing direction.
Regular projective curve models and both characteristic branches of split-
prime existence are planned imports, not new tasks for the Dittmann–Pop
roadmap. The off-a-finite-place number-field approximation comparison is
flagged for further matching; the built function-field branch is not
re-planned.

## Validation and remaining work

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-DITTMANN-POP-23.result.json`
and the intake deliverable-path check pass. Additional scratch checks verify
all 129 item IDs, the acyclic dependency graph, preservation of prior IDs,
120 unique API names and 120 unique test names, downstream use references,
valid stage/parent/galaxy IDs, and exactly one route for each of the 106
missing items. Existing source routes also retain two planned adapters.

Fresh finite regressions check simple-root reduction including n=1 and
characteristics dividing n, the two prolongations over 5 above, Frobenius
monomial exponent division, total inverse uniqueness, and the corrected
principal-unit sign. All pass. These are mathematical examples and data
checks, **not Lean elaboration or theorem proofs**. The 120 JSON tests are
still unexecuted Lean planning contracts. No Lean file is a deliverable of
this paper job and none was compiled.

The seven gap records remain explicit. The Kuhlmann–Novacoski proof is no
longer unread, and the inseparable polynomial theorem is no longer a
missing library input. Still open are its valuation/decomposition
foundations, original wild Hasse/Gersten and resolution chains,
low-dimensional/AKNS coding leaves, number-field strong approximation,
Krull intersection and prolonged-valuation adapters, independent review of
the full-rank flags and inverse-language bridge, and publisher-format
collation. These substantive tasks prevent a complete status.
