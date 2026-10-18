# Independent review: Lubin–Tate formal modules and quasi-canonical lifts

Job: `REV-DESIGN-LubinTateFormalModulesAndQuasiCanonicalLifts`, issue #1728.
Reviewer: Codex, session `codex-XzJK4T`. Date: 2026-10-18.
The design was written by the different session `codex-ynl6ep` for #1687.
The claim bot confirmed this review session before the review began.

**Verdict: accepted after corrections.** All 51 nodes have an individual
verdict and mathematical justification in the packet's `review.checked`:
44 verified, 7 corrected, none added, none unverifiable. This accepts a
target-level plan, not an implementation or an upstream package. All
implementation statuses remain `unchecked`.

| Quantity | Reviewed result |
| --- | ---: |
| Definitions / constructions / theorems / comparisons | 9 / 13 / 27 / 2 |
| API items | 142 |
| Discriminating unit tests | 89 |
| Planets | 47, at most six in any layer |
| Confirmed pinned baseline declarations | 15 |
| Mathematical gaps / new nodes | 0 / 0 |
| Supplier-stage requests | 15 |
| Stages planned / closed | 10 / 0 |
| Source issues confirmed / rejected | 1 / 0 |

LT.0 through LT.9 each remain `planned`, with empty refinement lists. Their
external supplier contracts explain why they are not `closed`. The stage
targets are realised by the existing nodes, and their prerequisite graph is
acyclic. The packet's target-level granularity is appropriate: coefficient
induction, invariant-series factorization and finite lattice calculations
belong in the proof sketches; no missing target-level theorem was found.

## Corrections made

1. **LT.0/formal-hom:** Honda70 Proposition 1.6 concerns characteristic-zero
   tangent maps. Added the actual general homomorphism definitions at §1.1,
   pp.214–215, to the locator and qualified the attribution. Added five API
   items: construction from a series, identity, zero, formal addition and
   composition, including their identities and compatibility. These make
   the operations already asserted in the node directly usable.
2. **LT.0/formal-module:** the proposed conjugation test over Q had no
   nontrivial conjugation. It now fixes A=R=Q(i) with the identity structure
   map. On the additive law the unital action a↦conjugate(a)X fails the
   tangent condition at i. This is an actual wrong action for that specified
   algebra structure.
3. **LT.0/adic-points:** replaced a type-only warning with a computed
   distinction. With no power-series variables and reduced coefficients
   Z_p, Mathlib's nilpotent-constant point carrier has only zero; the
   evaluated additive group on pZ_p contains p. A construction confusing
   the carriers fails this test.
4. **LT.2/primitive-division:** replaced the vague translated-Eisenstein
   instruction by the explicit induction. The first primitive equation is
   π+X^(q−1). Once t_m is a uniformizer, X^q+πX−t_m is Eisenstein over the
   preceding division field and its root t_(m+1) is again a uniformizer.
   This supplies the degree and transition claimed by the node.
5. **LT.4/elliptic-honda-comparison:** qualified the Honda70 Theorem 9
   citation. The published theorem is about elliptic curves over Q; its
   local Frobenius/logarithm argument is relevant here. The node's more
   general local statement follows from its preceding unramified Honda
   theorem and imported elliptic Frobenius polynomial, rather than an
   enlargement of Honda's stated domain.
6. **LT.7/honda-ramified-test:** removed its planet annotation. The
   proper-order counterexample is valid and remains a node and acceptance
   test, but a boundary check is not a planet under PROTOCOL §14.
7. **LT.9/formal-trace:** made the finite-separable construction explicit.
   Sum over embeddings into a finite Galois normal closure, descend the
   invariant parameter, and prove independence under enlargement. The
   original first proof step only constructed the Galois case.
8. **EllipticCurves Layer 1 request:** replaced “integral” logarithm/
   exponential by logarithm/exponential over a Q-algebra, with maximal-ideal
   convergence for integral laws and inverse only on a sufficiently deep
   ideal. Integral coefficients are not requested. The roadmap definition's
   embedded overview now states the same boundary.
9. **Source metadata:** rereading the public Honda68 PDF produced SHA-256
   `d2ba2d8a39e26798d8ea779dd5aa503187c69507b45faa73790fc4fdc8de4e6c`.
   Its title, author, journal pagination and cited results match the source.
   Refreshed that hash in both packet and roadmap definition. This records
   the bytes inspected; it makes no claim about why the earlier hash differs.
10. **Source issue E1:** added this review's independent `confirmed` verdict
    and calculation. No existing baseline citation needed removal or
    replacement. No theorem statement or hypothesis was weakened to make
    its proof fit.

## Independent source checks

All sources used here are public primary texts, linked in the packet and
below. The checks concern the cited mathematical arguments, not a
section-by-section synopsis of a source. The original `readSections`
metadata also records the design writer's reading; this review's own
reading is specified here and in the per-node verdicts.

| Source inspected | Arguments checked for this plan |
| --- | --- |
| [Lubin–Tate 1965](https://math.bu.edu/people/jsweinst/AWS/Files/LubinTateFormalCMinLocalFields.pdf), pp.380–387 | Lemma 1, Theorems 1–3, Lemma 2 and the Artin corollary: finite-arity interpolation, torsion degree, arithmetic reciprocity and uniformizer twist. |
| [Lubin–Tate 1966](https://www.numdam.org/item/10.24033/bsmf.1633.pdf), pp.49–59 | Propositions 2.4–2.6, Theorem 3.1, Proposition 3.3 and §3.5: lifting, tangent space, marked universality and the formal/global CM distinction. |
| [Honda 1970](https://www.jstage.jst.go.jp/article/jmath1948/22/2/22_2_213/_pdf), §§1–4, §5.3 and Theorem 9 | Theorem 1 and Proposition 1.6, pp.218–220; functional-equation theorems, pp.222–230; Lemma 4.2, p.231; elliptic Frobenius proof, pp.240–241. |
| [Honda 1968](https://ir.library.osaka-u.ac.jp/repo/ouka/all/8997/ojm05_02_05.pdf), Theorem 2, pp.204–205, and Corollary 4, p.212 | The explicit unramified CM logarithm and elliptic a_p=0 specialization, checked against Honda70's integrality argument. |
| [Gross 1986](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0084/LOG_0018.pdf), pp.321–326, read as page images | Propositions 2.1, 3.3, 4.3 and 5.3, including the ramified and unramified degrees and the modulus-uniformizer proof. |
| [Yu 1995](https://www.numdam.org/article/CM_1995__96_3_293_0.pdf), §§1–6 and §§9–10 | Markings, integral lattice quotients and Hom calculation, pp.294–298; Theorem 1's nonclosed-residue minimal field, p.297; proper quadratic lattices, p.300; Theorem 2′, pp.301–302, and its valuation argument, pp.305–309. |
| [Viehmann–Ziegler 2007](https://www.numdam.org/item/AST_2007__312__R1_0.pdf), article 7, pp.57–66 | Polynomial coefficient algebra, finite-height rigidity, coupled action/law cocycles, tangent computation and the formal O_K-module deformation theorem. |
| [Burungale–Kobayashi–Ota 2021, published PDF](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), §§2, 4 and 5.0.1–5.0.2 | Character and field conventions, pp.947–948; formal traces, pp.954–955; Honda signs, p.956; quasi-canonical fields, indices and tame descent, pp.957–959. |

The important checks are substantive. VZ's separably closed normal form is
not treated as a normal form already defined over every residue field:
LT.3 supplies finite-jet linear descent and stabilization before taking
limits. The deformation coefficient base is specified. The Serre product
is an integral power series with an invariant-subring proof; a logarithm
alone does not establish integral quotient coefficients. The Hom theorem
is restricted to the known CM isogeny class. Marked lattice classes retain
the Frobenius-twist component and differ from unmarked F×-homothety.

For minimal fields, Yu's Theorem 1 gives the smallest field **containing
F** of the **marked** modulus. The parameter base O_(F^ur) embeds in that
field. The quadratic positive-level formulas cover both ramification
cases and residue characteristic two; level zero is separate. The
unramified hypothesis of the Honda comparison is essential, as witnessed
by the level-one quotient with proper endomorphism order.

In BKO, π^(n+1)-torsion and Ψ_n=(Ψ′_(n+1))^Δ′ retain the shift. The tame
trace is unnormalized and multiplies fixed points by p+1. Alternating
π/p Tate generators produce the stated source/target sign factor. The
local-point recurrence and the higher geometric tower realizations stay
with their consumers.

For E1, the scalar reduction [s p]=X^(p²) and Honda70 Lemma 4.2 imply
s pℓ−ℓ(X^(p²))∈pO[[X]]. Thus the type is p−sT² and the Lubin–Tate
parameter is s p. The explicit logarithm Σ(s p)^(-j)X^(p^(2j)) also gives
pℓ−sℓ(X^(p²))=pX. The negative case agrees with the subsequent π=−p
setup in BKO. This independently confirms the inherited sign misprint;
no new search for a published corrigendum is claimed.

## Baseline and supplier verification

Read the actual statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, not declarations from a later
checkout. All 15 citations exist and suffice in the stated domains.

| Pinned declarations | Restrictions checked |
| --- | --- |
| `FormalGroup`, `FormalGroup.map` | Existing one-dimensional law and coefficient change; commutativity is a separate class. |
| `FormalGroup.Point` | Power-series parameters with nilpotent constant, not evaluated maximal-ideal points. |
| `PowerSeries.subst_substInvOfIsUnit_left` and adjacent right identity | Zero constant and unit linear coefficient; two-sided coordinate inverse. |
| `PowerSeries.eval₂Hom`, `PowerSeries.comp_eval₂` | Topological nilpotence, continuous coefficient maps, complete separated linear topology. |
| `PowerSeries.exists_isWeierstrassFactorization` | Local coefficient ring, maximal-ideal completeness and nonzero reduced series. |
| `PowerSeries.IsWeierstrassFactorizationAt.algEquivQuotient` | Actual distinguished-polynomial factorization and the stated adic completeness. |
| `WeierstrassCurve.formalGroup`, `WeierstrassCurve.map_formalGroup` | Existing commutative Weierstrass law and coefficient compatibility. |
| `WeierstrassCurve.FormalGroupPoint` | Existing adic-ideal point newtype and group, with its completeness/topology assumptions. |
| `WeierstrassCurve.formalPointHom` | Explicit auxiliary-point hypothesis retained. |
| `WeierstrassCurve.formalPointHomAdicCompletion`, its `_injective`, and `range_formalPointHomAdicCompletion` | Height-one Dedekind adic-completion presentation and elliptic generic fiber; range uses the multiplicative valuation inequality greater than one. |

Read all five distinct parent supplier statements cited by the eight
cross-packet edges: R07.1 `p-divisible-group`, `p-divisible-tate-module`,
`serre-tate-connected-p-divisible`, and R07.2 `frobenius-verschiebung`,
`dieudonne-equivalence-finite`. Their scheme/complete-local/perfect-field
domains, height conventions and contravariance match the uses here. Finite
Dieudonné theory is used over the perfect field F_p², not an arbitrary
imperfect residue field.

Checked the 15 request contracts against the current upstream documents:
ClassFieldTheory Layers 5–8; EllipticCurves Layers 1 and 3;
LocalFieldsRamification Layers 0 and 1; ModularCurves 0B, 0C, 2B and
7C–7F. The elliptic deformation comparison expressly stays within its
suppliers' domain. The reciprocity proof imports the existing Artin map;
those ClassFieldTheory layers do not require the Lubin–Tate construction
as a prerequisite. Requests identify their consuming node IDs and precise
needed output, rather than just naming a topic.

## Ownership, audit and handoff to the orchestrator

Read `data/library-coverage.json`. There is no dedicated audit entry for
this new continuation or its parent. The adjacent
AbelianSchemesAndArithmeticModuli A4 and
AlgebraicModuliForArithmeticGeometry R09.3 entries do not certify the
missing formal-module foundations; the latter's finite-flat descent
boundary agrees with the ModularCurves request. The direct pin checks and
current-library checks therefore remain essential.

Audited current TauCetiRoadmap at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including suggested files for
all nine post-snapshot roadmap directories and the four completed roadmaps
named by WORKERS.md. Also checked current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No duplicated
Lubin–Tate/Honda/quasi-canonical foundation was found. Current
`deepUnitExpLogEquiv` postdates the pins and is correctly imported through
LocalFieldsRamification Layer 1. Neither read-only tree was built.

Two coordination actions remain, without changing this mathematical verdict:

- The review issue's editable outputs exclude the separately stored reader
  document. Before packaging, synchronize its affected passages with the
  corrected packet: the hom constructor/operation API and general locator;
  the Q(i) tangent test; the empty-variable Z_p point test; the explicit
  Eisenstein tower; the qualified Honda Theorem 9 citation; the
  normal-closure trace proof; and the rational elliptic-log request. The
  previous reader was checked against the original packet. The updated
  packet supplies the exact replacement text. The embedded overview in the
  editable roadmap definition is corrected here.
- Grouped design #3355 remains open and available when reread during this
  review. Its brief includes this same formal-module direction; no grouped
  packet or definition exists at this checkout. Retain the packet's
  `rescope` proposal: the grouped continuation should import LT.0–LT.9,
  keeping its additional Breuil–Kisin/special-endomorphism/depth branch
  separate. The orchestrator should reconcile scheduling and incoming
  links once, without commissioning a second foundation.

No source is unavailable for the reviewed targets. No restricted source,
source passage, extracted source file or private filesystem path is
included in the submission. No second job was claimed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/LubinTateFormalModulesAndQuasiCanonicalLifts.json`:
  zero errors and zero warnings, with the counts above.
- `lean-check research/blueprint/suggested/LubinTateFormalModulesAndQuasiCanonicalLifts.lean`:
  exit zero at the pins, exactly 13 permitted `sorry` warnings and no other
  diagnostics. The existing 189-line suggested file needed no change.
  Memory availability was checked before compilation; no language server
  or library build was started.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/LubinTateFormalModulesAndQuasiCanonicalLifts.lean`:
  passed. Four light predicates have real bodies; five milestones and
  eight examples use existing pinned carriers. Heavy carriers remain
  document targets.
- Submission file validation, JSON parsing, review-node coverage,
  definition/construction test counts, dependency acyclicity, source-issue
  shape and Git whitespace checks passed as recorded in the pull request.

The review is complete. The next programme steps are reader synchronization,
the grouped ownership decision and normal packaging against the explicit
supplier contracts; they are not unfinished work on this review claim.
