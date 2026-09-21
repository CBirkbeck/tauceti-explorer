# PAPER-DITTMANN-POP-23 — extraction and routing checkpoint

Codex, session `codex-a71f92`; issue #1099; 21 September 2026.
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

The companion JSON has 116 items: 10 exact library inputs, 5 planned imports
and 101 missing items. Each missing item has exactly one route. Forty
definitions/constructions have 120 API contracts and 120 mathematical test
contracts. The item dependency graph and the six-route import graph are
acyclic. Proof outlines distinguish actual source arguments from outstanding
proof leaves.

## What was read

The main source is the [final author version, arXiv v2](https://arxiv.org/pdf/2012.01307v2),
dated 27 April 2023, 19 PDF pages. All of §§1–5 and the references were read.
Its SHA-256 is
`f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f`.
The [publisher record](https://annals.math.princeton.edu/2023/198-3/p04)
matches title, authors, DOI and publication, Annals 198 (2023), 1203–1227.
The author-version date is after acceptance and arXiv labels it final.
The guessed publisher PDF returned 404; a line-by-line comparison with the
25-page typeset publication was **not** performed.

Selected original inputs were acquired with URL, hash, access date and
read/not-read boundaries in `sourceArchives`:

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
- Kuhlmann–Novacoski: setting (1), Theorem 1.2 and adjacent Theorem 1.3;
  the henselian-generator proof remains unread.

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

Mathlib's finite-normalization theorem applies to a finite **separable**
extension of the fraction field of a normal noetherian domain. It does not,
by itself, discharge the inseparable polynomial normalization input.

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
passes. Additional scratch checks verify the 116-item DAG, unique API/test
names, valid galaxy IDs and one route per missing item. Finite regressions
check characteristic-two anisotropy/isotropy over F₂/F₄, total inverse
uniqueness over five prime fields, the quadratic involution, strict odd
valuation thresholds, two-ball stabilizer witnesses and the corrected
principal-unit identity. All pass.

These are finite mathematical regressions and data checks, **not Lean
elaboration or theorem proofs**. The 120 JSON test entries are unexecuted
Lean planning contracts. A suggested Lean file is not a deliverable of this
paper job and none was compiled.

The seven JSON gap records and handoff specify where to resume. In
particular, the original wild Hasse/Gersten chain, low-dimensional and AKNS
coding leaves, exact number-field approximation adapter and source-format
collation are not complete. Review the flag and finite-language bridges
independently before upgrading the checkpoint's status.
