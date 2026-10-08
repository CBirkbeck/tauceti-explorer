# Independent package review: classical Habiro rings

**Verdict: needs_changes.** Codex, session `codex-EHpCuh`, completed this
independent review on 2026-10-08 for issue #7519. The package was written by a
different worker. This is a completed review, not a checkpoint.

The README is a substantial mathematical roadmap, and its explicit finite
calculations checked out. Clear local omissions and incorrect signatures have
been corrected. The remaining obstacles are general theorem statements missing
from Suggested.lean and an unresolved supplier boundary already identified in
the accepted parent plan. Elaboration alone does not discharge those obstacles.

## Six required checks

| Check | Result |
| --- | --- |
| Upstream form and size | Pass. Ordered mathematical layers, conventions, prerequisites, APIs, examples, and theorem/section/page citations. Compared with the repository's upstream ArithmeticDirichletSeries and Completed/IntegralLattices READMEs. README size after corrections: 97,376 bytes, below 200 KB. |
| Fidelity and boundaries | The 107 distinct target nodes are represented in the README. The elementary q-toolkit supplier assertion needs reconciliation, as detailed below. |
| Own words and locators | The mathematical presentation uses its own statements and arguments rather than source passages or a section-by-section source synopsis. H, H₀, G, and W locators were checked directly. The fresh-access limitation for A is recorded below. |
| No programme process in the package | Pass after removing the Suggested.lean comment describing an export target as bookkeeping. Mathematical layer identifiers and the required standard prototype header remain. |
| Suggested.lean | Elaboration passes: exit 0, zero errors, 411 warnings, all `declaration uses sorry`. Mathematical coverage still fails for the general statements listed below. |
| metadata.toml | Pass: exactly `topic = "math.NT"` followed by a newline. |

The inputs were the parent packet, its HC.4 part, and its HC.6 part. The parent
contributes 48 nodes, HC.4 contributes 59 additional nodes, and HC.6 imports the
parent's three interface/example nodes rather than adding mathematical nodes.
The HC.6 finite acceptance specifications were checked as examples, not counted
again as new targets.

| Accepted targets | README locations checked |
| --- | --- |
| HC.1: 10 nodes | Index monoid and compatible families; finite quotients; topology and extension; mutually cofinal presentations; factorial and `(q^m-1)` systems; excluded adic identifications; coefficient and order functoriality. |
| HC.2: 4 nodes | Arbitrary convergent factorial series, unique normalized digits, congruence-correct arithmetic and integer-list division, the unit q and Laurent presentation. |
| HC.3: 6 nodes | Actual cyclotomic root equations, evaluation and Hasse coefficients, coefficient/Galois/order/power naturality, close-root criteria, convergent translation and Taylor re-expansion. |
| HC.4 parent: 15 nodes | Reflexive adjacency; cyclotomic congruences and resultants; monic radical relation; one-step and chain injectivity; finite-extension separation; rootwise rigidity; domain, evaluation uniqueness, and proper embeddings. |
| HC.4 part: 59 nodes | Universal root algebras, both filtrations and quotients, ranks and bases, graded and finite comparison, determinants, signed adjugates, finite/global integral image, local divisibility detection. Its six matrix/projector applications occur after HC.5 in HC.6. |
| HC.5: 10 nodes | Exact ordinary polynomial-module completion, module injectivity, comaximal components, rational and localized coefficients, domain factors, restriction/localization comparison, Habiro Propositions 7.2–7.3, supplier-dependent derived comparison. |
| HC.6: 3 inherited nodes | Consumer interfaces and ownership exclusions, integral examples, localized/rational/characteristic-two examples and acceptance contract. |

Particular hypothesis checks included actual polynomial indices in positive
characteristic; the sign of P_N; negative quotient in digit division;
one-indexed comparison precision modulo P_(N-1); strict determinant indexing
`n < N`; universal root algebras over arbitrary coefficients; integer
torsion-freeness for Taylor injection; irreducibility for selected-root
evaluation; connected chains contained in S; the odd-prime and `4 | n`
separation conditions; and complete coefficients for convergent translation.
The finite-domain embedding in the HC.4 part supplies the transfer argument
that the parent had left open, without silently adding a Noetherian assumption.

## Corrections made

1. Added positive-order hypotheses to `adjacent_iff_monicImplies`. Previously,
   over Q with `m=1, n=0`, adjacency fails but the radical relation to
   `cyclotomic 0 Q = 1` holds. A prose convention did not constrain that Lean
   signature.
2. Changed `taylorAt_not_surjective` to target the embedded cyclotomic integer
   algebra `Z[ζ][[X]]`, using `cyclotomicIntegerRoot` and its root equation.
   Non-surjectivity into `C[[X]]` was a weaker statement than the planned theorem.
3. Added the complete-coefficient bijectivity statement for the one-step monic
   transition, with a finitely generated witnessing ideal and
   `IsAdicComplete I R`.
4. Added coefficient-square and algebra-automorphism evaluation naturality,
   coefficient-square Taylor naturality, completed power-map evaluation and
   Taylor equations, the powered-root equation, and identity/composition laws
   for power substitution.
5. Added the completed-module topology, additive continuity, continuous scalar
   action, additive-group uniform completeness and separation, dense polynomial
   image, polynomial/projection equations, functor identity/composition,
   continuity and injectivity/surjectivity, restriction compatibility, and
   naturality of chain coordinates. Strengthened the self, coefficient-map, and
   product equivalences to use the completed ring's scalar action.
6. Added the restricted-order alternating-unit statement of H, Remark 7.1,
   p. 1142, to the README and Suggested.lean. For odd `m ≥ 3`, its cyclotomic
   factors are Φ_(2d) for divisors `d>1` of m, and are comaximal with the
   admitted orders coprime to `2m`. This records the established exception
   without asserting Habiro's unit-group conjecture.

## Required revisions

These are mathematical signature gaps, rather than requests to formalize proofs.
The standard non-exhaustive header does not waive PROTOCOL §13's requirement to
state the named theorems in scope.

1. **Cofinal completion equivalences and reconstruction (HC.1).**
   The README's “Topology, extension, and cofinal changes of presentation” and
   “Factorial polynomials and the full completion” state canonical topological
   ring equivalences for mutually cofinal ideal families, the finite-subset
   inverse limit, and the divisibility-ordered tower of `(q^m-1)`-adic
   completions. `ext_of_cofinal` only detects equality; `exists_eq_of_chain`
   handles an increasing cyclotomic chain. `ext_of_finite_restrict` assumes
   equality of each original quotient projection and concludes equality of the
   original elements: it does not reconstruct a compatible family of finite
   restrictions. Add the comparison carriers/equivalences, inverse construction,
   polynomial/projection equations, continuity, and replacement composition.
   The existing finite-S `adicEquivOfFinite` and one-order power-series
   equivalence do not supply the missing general statements. Sources: H,
   §3.1, (3.2), p. 1131, and Corollary 4.1, p. 1136.
2. **Individual-root uniqueness at the stated generality (HC.4).**
   `evalCyclotomic_injective` is the universal-order quotient theorem;
   `eq_zero_of_evalAt_primePow` is the integral full-order special case.
   Neither states the accepted individual-root theorem for a subring of the
   algebraic numbers, connected S, infinitely many roots with orders adjacent
   to one order in S, and irreducible cyclotomic polynomials over the fraction
   field at those selected roots. Supply that theorem with genuine root-order,
   irreducibility, and adjacency data. The README already distinguishes this
   from arbitrary infinite-root evaluation and leaves Conjecture 6.1 open.
   Source: H, Theorem 6.2, pp. 1140–1141, with the irreducibility repair in the
   accepted plan.
3. **Localized components for general Δ, including rootwise detection (HC.5).**
   `isDomain_away_class` only treats one inverted prime, while the README
   describes all valuation tuples for `Z[1/Δ]`. The all-value injectivity
   signature also only treats one inverted prime. No theorem states the Taylor
   injectivity at every primitive root on each such component, including orders
   divisible by inverted odd primes. Add the general component indexing and
   decomposition, the restriction-meets-every-class criterion, all-value
   detection, component domains, and rootwise detection. Expose enough of the
   stated Galois-descent bridge to justify the last two: the ordinary
   separation hypotheses of `taylorAt_injective` cannot be invoked at an
   inverted prime. Sources: H, Theorems 4.1, 5.1 and 6.1, pp. 1135–1139;
   G, §1.4, Remark 1.2, p. 7, motivates the component comparison; the classical
   Galois argument is supplied explicitly in the accepted plan and README.
4. **Actual completed-ring localizations (HC.5).**
   `restrict_rat_eq_idempotent` gives an idempotent kernel over Q; it does not
   identify the restriction with localization at that idempotent for a general
   union of non-comaximality classes. `exists_poly_add_mul` gives the finite
   quotient decomposition but does not state Proposition 7.2's equality inside
   the fraction field. Add the ambient embeddings and localization comparison
   statements, including the general excluded-factor obstruction. Preserve the
   useful divisibility form `mem_range_fromLaurent_of_mul` for Proposition 7.3.
   Sources: H, Propositions 7.2–7.3, pp. 1142–1143, and §7.5, p. 1146.
5. **Elementary q-toolkit ownership (README boundary).**
   The scope paragraph assigns the general elementary toolkit to
   `QSeriesPartitionsAndMockModularForms:QM.0` as a settled supplier. The parent
   packet's `restructure` entry “The elementary q-toolkit has two planned
   owners” explicitly leaves the conflict unresolved: PLAN-HABIRO §6.1 and
   decision D11, and accepted RS-10's HC.1 decision, assign it to HC.1; the
   QSeries packet plans it in QM.0. The package must not silently decide that
   conflict. Reconcile the supplier with the authoritative ownership decision
   and then adjust the boundary/consumer interface. The parent packet's
   factorial polynomial targets alone do not close the general toolkit. No
   packet, family plan, or link map was edited in this review, since those are
   outside this issue's deliverables.

The derived comparison is intentionally described at its HR.2 supplier boundary
because there is no imported derived carrier at the pins. This is an honest
omission permitted by §13, rather than a fabricated proposition, and is not one
of the signature findings above. RS-10's ordinary/derived and classical/arithmetic
boundaries were checked; the package correctly keeps Frobenius gluing and the
arithmetic rational-field comparison in their suppliers. Existing upstream link
maps have no positive HabiroCyclotomicCompletions contract contradicting these
interfaces; their negative screens are not treated as complete dependency proofs.

## Independent evidence and validation

Read the primary H and H₀ arguments supporting monic expansions, radical and
chain injectivity, rootwise Taylor detection, infinite-adjacent-order evaluation,
modules, units, localization, and the rational case. Read G §5.1,
pp. 59–64, and Examples 5.6–5.7, p. 66, checking coordinate shifts,
generality, determinant factors and projector digits; read its §§1.3–1.4 for
the classical/arithmetic boundary. Read W §2.1, Lemma 2.1 and proof, p. 8,
and checked the distinct-order exception.

Public PDFs were read in disposable scratch only; none was added to the
repository. Access date: 2026-10-08.

| Source | Public PDF | SHA-256 |
| --- | --- | --- |
| H | [Journal PDF](https://ems.press/content/serial-article-files/40881) | `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f` |
| H₀ | [arXiv v1](https://arxiv.org/pdf/math/0209324v1) | `ae2ea5024a0a45e8eaf16b1bcaaf1c139cd7437aaa5a6ea9ff596e98b47e69d0` |
| G | [arXiv v2](https://arxiv.org/pdf/2412.04241v2) | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| W | [arXiv v5](https://arxiv.org/pdf/2410.23078v5) | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |

Apostol's publisher PDF returned HTTP 403. This review therefore does **not**
claim a fresh reading of A's Theorems 1, 3 and 4 or independently verified
pagination for them. The comaximality statement was checked in H, Lemma 4.1,
p. 1134, and the determinant use against G §5.1. The finite calculations below
are additional checks, not a substitute for the general resultant proof.

Independent exact rational polynomial arithmetic used cyclotomic factor
recursion, monic division, finite jet coefficient extraction, and rational
Gaussian elimination. It checked:

- The finite matrix dimensions, weight triangularity, and determinant product
  for N=1 through 6, yielding `1, 1, 4, 216, 1327104, 99532800000`.
- M₃ and both signed-adjugate identities; the Kontsevich jet vector and its
  perturbation; the odd projector and companion projector digit vectors.
- Kontsevich root values at orders 1 through 6; its first ten Taylor
  coefficients at 1, first seven at -1, and first three at a primitive cube
  root; the first four normalized digits of its square.
- The q-inverse telescoping identity through N=8; the localized and rational
  finite CRT representatives; the characteristic-two idempotent and residues;
  alternating polynomial factorizations for m=3, 5, 9 and 15.

These checks verify the displayed finite examples only. They do not assert
implementation or proofs of the infinite statements.

Read the relevant reviewed library audit and actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, including polynomial-module maps,
adic completeness, Hasse/Taylor coefficients, and power-series substitution.
Read Tau Ceti's coefficient-list/synthetic-division and complete-separated-ring
interfaces at `f790474821cf4256814db967cb154e7af3d0c369`. The shared build has
the exact Mathlib pin but a different Tau Ceti checkout, and its Tau Ceti
compiled objects for these two modules are absent. The file uses only individual
Mathlib imports; the Tau Ceti interfaces were inspected as source at the pin.
No Tau Ceti build or library update was run.

Validation commands:

```text
lean-check research/blueprint/packages/HabiroCyclotomicCompletions/Suggested.lean
python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions.json
python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions--HC.4.json
python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions--HC.6.json
git diff --check
```

Final Lean result: exit 0, zero errors, 411 sorry-only warnings. Each unchanged
input packet check reports zero errors and zero warnings. JSON/TOML shape,
README size, programme-process wording, and private-path checks were also run.
The revisions above must be resolved before accepting the package.
