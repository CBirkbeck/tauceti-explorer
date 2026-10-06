# Independent review of HB.7

**Verdict: accepted, with corrections.** This is a completed target-level planning
pass, not a completed formalisation. HB.7 remains **planned**, with three gaps and
four supplier requests. Global additive closure, effective descent, tensor
bijectivity and arithmetic naturality are not asserted as established results.
All implementation statuses remain `unchecked`.

Reviewer: Codex — codex-7ZyIf0, job `REV-HabiroNumberFields--HB.7`, issue #6448,
6 October 2026. The reviewed plan was written by a different session,
Codex — codex-f2eyXf. The review covers the packet, suggested file and reader
document; edits are confined to the issue's packet, suggested file, this report
and the required handoff. No supplier or atlas data was edited.

## Counts

| Item | Before | After |
| --- | ---: | ---: |
| Nodes: definition / theorem / construction | 1 / 6 / 4 | 1 / 6 / 4 |
| API items | 27 | 34 |
| Unit tests | 15 | 17 |
| Baseline declarations | 12 | 16 |
| Gaps / requests | 3 / 4 | 3 / 4 |
| New planets | 0 | 0 |
| Inherited planets | 4 | 4 |
| New source findings | 0 | 0 |
| Referenced inherited source findings | 3 | 4 |

All eleven nodes have review entries: eight corrected and three verified.
No nodes were added or deleted. The four inherited planets remain the local
invertible sections, local freeness, global module and Theorem 2 Picard map.
Their existing identifiers are retained rather than giving the refinements
duplicate planets.

## Sources and mathematical checks

The three downloaded source hashes match the packet exactly:

| Source read | Public text and locators | SHA-256 |
| --- | --- | --- |
| Garoufalidis–Scholze–Wheeler–Zagier | [arXiv v2](https://arxiv.org/pdf/2412.04241v2): §§1.4–1.5; (46), (47), (60); §3.1 regulator and Theorem 9; §3.2 Dwork/sections; §3.3 Theorem 2 proof | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| Wagner thesis | [Author-hosted text](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf): introductory §1.5, printed pp.2–3; §2.2, printed pp.30–33, including Lemma 2.12 and Corollary 2.13 | `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c` |
| Bouis–Gazda | [arXiv v1](https://arxiv.org/pdf/2602.21894v1): introduction pp.1–3, Definition 1.1, Theorem A | `935eabb416ab0ed0d80b92b4cdfdaa34a43f8f0feb65dec3c1ca3f0fbea0b186` |

Each node's locator and excerpt was checked. The excerpts are mathematical
transcriptions, and the first-jet computation is correctly labelled the worker's
derivation, rather than a coefficient formula quoted from the paper. The
integral-shape locator incorrectly put equation (195) on pp.39–40; it is on
p.41. The Wagner reading record incorrectly put introductory §1.5 on pp.12–13
and Corollary 2.13 within pp.30–32. Both records are corrected above and in the
packet.

Independently recomputing the shifted generating function gives
\(B_1(1/2)=0\), \(B_2(1/2)=-1/12\), and hence
\(-\operatorname{Li}_0(\zeta)h/24\) after cancelling the dilogarithm pole.
Since \(h=x/\zeta_m+O(x^2)\), the normalized exponential has coefficient
\(-\zeta/(24\zeta_m(1-\zeta))\); the root order \(m\) cancels.
Finite products of constant-one units add these coefficients, and integral
scalar powers multiply them by their scalars. The reduction of a nontrivial
prime-to-\(p\) root stays nontrivial, so the denominator is a unit for \(p>3\).
Neither the singular input \(\zeta=1\) nor primes 2 and 3 are included.

The branch convention is now explicit: the half power is the **formal square
root of \(q^m\) with constant one**, namely
\(\exp(m\log(q/\zeta_m)/2)\). At even \(m\), this need not be the ordinary
monomial \(q^{m/2}\). For \(m=2\), \(\zeta_m=\zeta=-1\), the stated branch
gives coefficient \(-1/48\); the ordinary monomial gives Pochhammer input 1 at
the expansion point. The corrected packet keeps this convention as a hypothesis
and adds the even-root test. It does not establish the separate higher
Frobenius-defect calculation for that branch.

The thesis's Lemma 2.12 describes the ring equalizer and its introduction cites
the Picard map. The passages read supply no effective descent theorem for the
indexed global family set. Bouis–Gazda's introductory result concerns weight-one
first Chern classes. Neither is substituted for the missing global line proof.
The gaps attached to GSWZ Theorem 2 and the corrected local shape therefore
remain necessary.

While checking the thesis proof, I found its false assertion of irreducibility
of \(\Phi_m\) modulo \(\ell\) whenever \((m,\ell)=1\). For example,
\(\Phi_3(q)=(q-2)(q-4)\) over \(\mathbb F_7\). This is already confirmed as
**HabiroRings/E5**, so the packet references that finding rather than creating
another one. The same sentence persists in the [current author copy of
q-Hodge complexes](https://ferdinand-wagner.github.io/papers/q-Habiro.pdf), dated
14 January 2026, p.18. The [author page](https://ferdinand-wagner.github.io/) and
[arXiv version listing](https://arxiv.org/abs/2510.04782) were checked for a
correction. Use the full finite étale residue algebra, as the existing reviewed
HabiroRings correction does. No HB.7 node depends on the erroneous field
identification.

## Baseline verification

Every declaration was read with its ambient variables and hypotheses in the
source tree at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

| Declaration | Module under Mathlib/RingTheory | Verified scope used here |
| --- | --- | --- |
| `PowerSeries.map` | PowerSeries/Basic | Coefficient ring homomorphism, over semirings |
| `PowerSeries.coeff_one_mul` | PowerSeries/Basic | Linear coefficient of a product over a commutative semiring |
| `PowerSeries.exp` | PowerSeries/Exp | Formal exponential over a ring with a rational-algebra structure |
| `PowerSeries.log` | PowerSeries/Log | Formal log(1+X) over a commutative rational algebra |
| `PowerSeries.subst` | PowerSeries/Substitution | Definition; the substituted series here has zero constant, satisfying nilpotence |
| `Module.Invertible.left` | PicardGroup | Requires an actual linear equivalence M tensor N to the base ring |
| `CommRing.Pic.mk` | PicardGroup | Class of an already invertible module |
| `CommRing.Pic.mk_tensor` | PicardGroup | Product of classes equals class of the tensor product |
| `CommRing.Pic.mapAlgebra` | PicardGroup | Existing scalar-extension homomorphism on Picard groups |
| `Algebra.norm` | Norm/Defs | Multiplicative determinant norm; finite free models required in the application |
| `Algebra.norm_eq_of_equiv_equiv` | Norm/Basic | Two compatible ring equivalences give the required norm/Frobenius square |
| `CommRing.Pic.mk_self` | PicardGroup | The ring module has class 1 |
| `CommRing.Pic.mk_eq_mk_iff` (added) | PicardGroup | Equality of invertible module classes iff a linear equivalence exists |
| `Algebra.norm_norm` (added) | Norm/Transitivity | Norm transitivity in a scalar tower with free modules |
| `Algebra.norm_algebraMap` (added) | Norm/Defs | Norm of a scalar is its power by the free module's finrank |
| `Algebra.norm_zero` (added) | Norm/Basic | Norm of zero for a finite free nontrivial algebra |

No baseline declaration was removed. `PowerSeries.subst` was misclassified as
a theorem; its kind is corrected to `def`. The four additions prevent planning
the existing Picard equivalence criterion or norm laws again. The theorem
`norm_norm` is applied in its actual order, norm to the intermediate base
followed by norm to the bottom base. Finite free positive-rank algebras keep
both it and the scalar/zero assertions away from the default norm value 1.

There are no Tau Ceti baseline citations. A search of Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369` found no Habiro objects or Coleman
dilogarithm implementation. Finite Pochhammer polynomials and invertible sheaves
are not the infinite Pochhammer expansion or the indexed Habiro modules.
The reviewed `AUDIT-28` HB.7 entry in `data/library-coverage.json` lists the
five target groups as absent. Existing module Picard theory and algebra norms
are reused, consistent with that audit.

## Prerequisites, API and coverage corrections

All parent supplier statements were read: HB.2's exported finite-Chern/Kummer
interface; HB.6's full coefficient algebras, Frobenius, gluing and p-completed
ring; and the HB.7 local sections, Dwork, explicit sections, local freeness,
extension, global family set, ring/tensor, operations and constant terms.
The follow-up imports these identifiers and does not reproduce their definitions.

The field-pullback prerequisite incorrectly named
`GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, whose statement
does not supply the ring-map functor. It now names
`GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, whose exact statement
supplies unital ring maps and identity/composition. The K.3 transfer/projection
formula supplier applies to finite extensions of fields: the resolving module
is finite free. These node statements are found in the K.1 part packet, whose
review currently says `needs_changes`; they are imported planned contracts,
not claims of implemented or fully accepted K-theory.

The D.1, D.3, D.4 and M.8 stage statements were read. No finer ready node supplies
the requested comparisons. Their four requests state the normalization, valid
finite presentations, all completion factors, Frobenius/trace comparison and
early finite-Chern torsor naturality. The M.8 request excludes its later
Euler-system/Selmer bundle to avoid a reverse dependency on Habiro theory.

**RT-AREA-ktheory-2/15 is correctly handled.** The reviewed finding asks for a
path to Coleman theory. Four consuming nodes have direct D.1 prerequisites,
the packet has the precise D.1 request, and the reader document explicitly
explains the direct edge. No unproved transitive D.4–D.3–D.2 path is used.

Changes to the eleven nodes are recorded individually in `review.checked`:

- Added `Pic.mk_eq_mk_iff` to the Picard character, and both its citation and the
  Picard-character prerequisite to scalar equivalence. The latter now obtains
  actual `Module.Invertible` instances before taking module classes.
- Added pullback zero/addition laws, graded multiplication compatibility and
  uniqueness from all component maps. Added Galois section multiplication
  separately from the API for composing automorphisms.
- Added whole-expansion and zero norm APIs. Norms concern determinants of
  complete series over full coefficient algebras, with the Kummer torsor norm;
  they are not coefficientwise scalar norms or additive maps of sections.
- Replaced the ambiguous zero-norm phrase “positive degree” by **positive
  extension rank**, including K₃ degree zero.
- Added the required `kind` field to all fifteen existing tests, and two new
  tests for the even-root sign and the finite norm of zero. All five definitions
  and constructions now have at least three discriminating tests.

The tensor, scalar and global conclusions remain conditional on effective
descent, actual chart base changes and conservative detection. The norm/log
target outlines finite-basis determinant base change and the formal log/trace
identity; branch, integral-lattice and arithmetic torsor comparisons are named
supplier inputs. The local inverse certificate is a finite sum of products,
not a presumed global unit section. No theorem contradicts a retained gap.

Every HB.7 target is represented by an imported parent node or one of these
eleven refinements. Thus `status: complete` describes a finished planning pass
and `coverage: planned` is justified. `closed` would be false: the three gaps
and four requests remain unresolved. Target-level granularity is retained;
there was no reason to split these proofs into implementation lemmas.

## Suggested file and validation

The suggested file includes every API and test name. Unavailable actual Habiro
rings/modules, Coleman functions and K₃ torsors are named explicitly in omitted
declarations, with their exact intended statements. They are not replaced by
uninterpreted predicates, arbitrary section carriers or theorem-valued fields.
The executable prototype covers rational coefficients, formal jets, the
conditional Mathlib Picard character and generic coefficient-algebra norm laws.
I added the even-root example, the zero-norm example and scalar/tower norm
signatures, plus comments matching all new API names and prerequisites.

Validation after correction:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.7.json`:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/HabiroNumberFields--HB.7.lean`:
  **exit 0, 24 warnings, all declaration-uses-sorry warnings**. Available memory
  was 109 GB before this check. No language server or library build was started.
- API/test-name agreement, eleven review entries and all `unchecked` statuses:
  checked against the final packet.

The shared build's Mathlib is exactly the pin. Its Tau Ceti checkout is a later
commit, but this file imports **only Mathlib**, so no Tau Ceti declaration or
compiled module enters this elaboration. The Tau Ceti source search above used
the specified historical commit. Elaboration verifies signatures, not proofs
hidden by `sorry` and not any commented arithmetic declaration.

## Orchestrator follow-up

No unresolved issue prevents accepting this planning pass. The reader document
is not an authorized edit for this issue. At assembly, synchronize it with the
packet's clarified formal half-power convention, two additional tests, seven
additional API entries and four added baseline citations; add the reference to
HabiroRings/E5 and corrected Wagner pagination. Its existing integral-shape,
global-gap and direct-D.1 explanations were checked and remain mathematically
consistent with the corrected packet.

Future work must discharge the three named gaps and supplier requests before
marking HB.7 closed. In particular, do not infer a global generator from local
freeness, use only the early M.8 Chern interface, and resolve the K-theory
supplier review independently. None of these is missing work in this review job.
