# Independent package review: small ramification and the Serre base cases

Reviewer: Codex, session `codex-KeelQ5`. Issue #7528, job
`REV-PKG-SmallRamificationAndAbelianVarietyBaseCases`. Date: 2026-10-09.
This session did not produce the package under review.

**Verdict: needs_changes.** The independent review is complete. The corrected
README meets the reader requirements, but several prototype statements and
examples omit mathematical content advertised by the README. Successful Lean
elaboration is also unverified: the requested check stopped at a missing
imported object before elaborating the body. This is a completed review, not a
checkpoint of an unfinished review.

## Scope and evidence

The comparison used the accepted
[plan](../packets/SmallRamificationAndAbelianVarietyBaseCases.json), including its
2026-10-01 corrections, rather than the older reader document. The package
[README](../packages/SmallRamificationAndAbelianVarietyBaseCases/README.md) and
[Suggested.lean](../packages/SmallRamificationAndAbelianVarietyBaseCases/Suggested.lean)
were read in full. The comparison covered all 59 targets, 45 API entries and
34 tests, including their hypotheses, proof routes and supplier boundaries.

The reviewed library audit was read for R25.1–R25.6. The 80 baseline declaration
entries were checked in the existing source trees at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, the unit filtration,
finite locally free group-scheme category, Cartier duality, abelian-variety
endomorphisms and dimension, different estimates, cusp-form dimensions and
positive-definite/Fourier interfaces really are baseline interfaces. The
package does not claim that these provide missing semistability, Tate-module
or crystalline comparison theorems.

The upstream ClassFieldTheory and EllipticCurves roadmaps were used to compare
form and density. Prerequisites were compared with the plan's 31 requests and
the relevant link maps. The older ClassFieldTheory link screen predates the
accepted plan's explicit reciprocity and Hilbert-class-field requests; it is
not grounds for removing those dependencies. No upstream roadmap or link map
was changed.

All 13 public source versions listed in the plan were obtained and their
SHA-256 digests matched the recorded versions. The published
Khare–Wintenberger paper was additionally checked for its corrected
weight-fourteen hypothesis. No restricted library source was needed. Reading
and verification occurred on 2026-10-08–09. The source locators below identify
the evidence used; their mathematical contents are paraphrased throughout.

## Six required checks

| Item | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form | Pass | Introduction, conventions, prerequisites, detailed mathematical sections, APIs, examples and references; 113,385 bytes after correction, below 200 KB. |
| 2. README fidelity | Pass after correction | All 59 targets, 45 API entries and 34 tests are present. Statements retain the accepted plan's hypotheses and corrected exceptional cases. Supplier interfaces remain outside this roadmap's ownership. |
| 3. Own words and source locators | Pass | Results and proof routes are written in the package's mathematical organization, with theorem, section and page references. There are no source passages or source-by-source chapter summaries. |
| 4. No process in the reader | Pass | The README contains no job IDs, packet references, checkpoint instructions, review verdicts or coverage statuses. Roadmap layer identifiers express mathematical dependencies. |
| 5. Suggested Lean fidelity and elaboration | Fails acceptance | Clear hypothesis defects were repaired, but the weaker signatures and anonymous examples below remain. The requested Lean check exited before the file body; the corrected file has not been elaborated. |
| 6. Metadata | Pass | The file contains exactly `topic = "math.NT"` followed by a newline. |

### Target comparison

| Layer | Targets checked | Mathematical points checked against the accepted plan |
| --- | ---: | --- |
| R25.1 | 17 | Normalized different versus discriminant exponent; global root-discriminant factorization; tame characters; wild-image Borel form; unit power maps and involution signs; sharp two- and three-adic bounds; positive-definite test function; unconditional explicit formula; rational degree certificates and nonzero-degree monotonicity. |
| R25.2 | 8 | Continuous finite-field residual representations; absolute irreducibility, oddness and ramification; determinant and tame exclusions; Tate–Serre nonexistence; finite-image classification in characteristics two and three. |
| R25.3 | 7 | Nonzero simple finite-flat objects; finite-flat different bound and simple-object classification; extension splitting and reordered filtration; point-count contradiction; Fontaine's positive-dimensional exclusion. |
| R25.4 | 13 | Distinct primes in the semistable category; exact-sequence and Cartier-dual closure; cyclotomic splitting; the Ext congruences; simple-object field criterion; class-number certificates; all five prime-pair field calculations and Schoof's exclusion. |
| R25.5 | 12 | GL₂-type over a number field; realization and descent hypotheses; class-number-one and dihedral calculations; ordinary reducible terminal cases; weight two and weight p+1; the weight-fourteen dichotomy; the published small-weight restriction and Paso 6. |
| R25.6 | 2 | Eight base-case rows, their stated hypotheses, suppliers and consumers, and the theorem that justifies each row. |

The README correctly retains the weaker certified degree ceilings, uses the
units argument for the pair (7,3), and uses the Frattini argument and class
number at most two for (13,2). It does not reinstate the rejected assertion
that every weight-fourteen representation at eleven twists to weight two.
The small-weight statement excludes (11,14), as the published theorem does.
The characteristic-three local calculation needed the prose correction below.

## Corrections made in place

1. **Characteristic-three signs.** In the epsilon=+1 branch, the odd graded
   pieces disappear; it is not the second graded piece that disappears.
   The remaining break over the unramified base is one, giving
   `2 - 3/(2|P|)`. The numerical bound was already correct. This repairs the
   explanation, using the accepted plan's involution calculation and
   Fesenko–Vostokov, Ch. I (5.7)–(5.8), pp. 14–16, and Ch. IV
   (3.4)–(3.5), pp. 135–136.
2. **Continuous twists.** `modCyclotomicCharacter` now returns a continuous
   monoid homomorphism for discrete coefficients, and `twist` accepts a
   continuous character. The previous arbitrary abstract character did not
   justify producing a continuous residual representation. Continuity is
   left as a `sorry` proof rather than weakened to an assumption-free claim
   about arbitrary characters.
3. **Distinct primes.** Added `p ≠ l` to the Cartier-dual closure theorem,
   the constant/multiplicative example and the Katz–Mazur extension example.
   Schoof assumes distinct primes in Definition 2.1 and its subsequent
   examples, pp. 848–850. Without this hypothesis, at p=l=3 the constant
   group is in the category but its multiplicative dual has inertia acting
   by -1 and fails `(sigma - 1)^2 = 0` in characteristic three.
4. **Base-case metadata.** The first two rows now specify absolute
   irreducibility and the actual ramification/oddness checks. The ordinary
   row now records an irreducible p-adic representation with reducible
   reduction and Hodge–Tate weights `{0,k-1}`. These fields now agree with
   the README and the hypotheses of their named statements.

The metadata and accepted plan were left unchanged. The Lean edits are
mathematical signature corrections; no successful elaboration is claimed.

## Remaining revisions required for item 5

### Named targets have weaker conclusions in the prototype

| Declaration | Content absent from its Lean conclusion |
| --- | --- |
| `exists_upperTriangular_of_wildInertia_ne_bot` | The Borel normal-form target also specifies the tame quotient order dividing p-1 and the diagonal-ratio action on wild inertia. The signature currently states triangularity, wild exponent p and the characteristic-two equality of inertia groups. |
| `dihedral_or_SL2_of_irreducible_char_two` | The second branch gives only the order `2^j (2^(2j)-1)`. The README's R25.2 classification requires conjugacy to SL₂ over the field of order `2^j`. Cardinality alone does not state that classification. |
| `fieldCriterion_two_three` | Its conclusion is only `FieldCriterion 2 3`; the R25.4 target also states equality with the specified degree-six field M. |
| `fieldCriterion_three_two` | It omits the precise remaining degrees four or eight described by the target and its own doc comment. |
| `fieldCriterion_five_two` | It omits the precise remaining degrees four, eight or sixteen described by the target and its own doc comment. |

These are useful consequences, but are not complete prototypes of the named
targets. Retain the stronger conclusions in those declarations, or add
explicit companion declarations for the stronger parts. If a supplier type
genuinely prevents a faithful signature, record the exact omitted statement
and its missing supplier interface in the header as PROTOCOL §13 requires.
Do not replace mathematical data or conditions with arbitrary `Prop` fields.
The file already follows this header convention for several genuinely
unavailable Tate-module and p-adic Hodge interfaces; that convention is not
applied to the omissions listed here.

### Six advertised tests do not identify their objects

The following comments carry the accepted plan's test names, but each body
asserts existence of some object with the expected property. None binds that
object to the example in the comment or README.

| Test | Required concrete identification |
| --- | --- |
| `not_isLevelOneResidual_one_add_omega` | The diagonal sum of the trivial and mod-three cyclotomic characters. |
| `not_isLevelOneResidual_X0_eleven_two_torsion` | The two-torsion action of the specified conductor-eleven elliptic curve. |
| `not_isAbsolutelyIrreducible_cyclic_cubic_mod_two` | The action through the real cubic subfield of Q(zeta_9) and the specified order-three matrix over F₂. |
| `not_mem_semistableCategory_quadratic_twist` | The order-three étale scheme twisted by Q(sqrt(-7)). |
| `X0_eleven_two_torsion_mem` | The finite-flat model of J₀(11)[2], not an unspecified simple order-four scheme. |
| `isGL2Type_J0_23` | J₀(23), with the quadratic action supplied by its Hecke operators. |

A revision must construct or import each identified object and test that
object. Where its construction belongs to a supplier, an honest header
omission specifying the unavailable interface is preferable to presenting an
anonymous existence theorem as the named computation. The universal
dimension-one, dimension-two and dimension-zero GL₂-type tests are valid
stronger formulations and are not among these defects.

### Elaboration evidence

After checking available memory, the required command was run:

```text
lean-check research/blueprint/packages/SmallRamificationAndAbelianVarietyBaseCases/Suggested.lean
```

It returned exit status 1 at import line 5 because the compiled artifact
`TauCeti/Analysis/PositiveDefinite/AddGroup.olean` was absent. The file body was
not elaborated. Inspection then found that the wrapper's existing checkout
had the pinned Mathlib but Tau Ceti at
`cf386627e9176a3827c1a5fe804989fd94a4d216`, not the required `f790474`.
None of the inspected existing shared builds was at the required Tau Ceti
commit. In accordance with WORKERS.md, no dependency build, project setup or
check against a substitute commit was performed. No further Lean check was
attempted after the signature corrections. Thus this run neither establishes
that the prototype compiles nor demonstrates a body-level elaboration error.

After the fidelity repairs, rerun this exact check in an existing build of
both pinned commits and require no errors and only `sorry` warnings before
accepting item 5.

## Source checks

The package's references provide direct links and fixed versions. These are
the principal mathematical locators checked for this review:

| Source | Locator and check |
| --- | --- |
| Dieulefait–Pacetti, arXiv v2 | Theorems 1.1–1.2, p. 3; §2, Paso 6, pp. 14–15: base-case and terminal uses. |
| Khare, arXiv v1 | Lemmas 5.1–5.2, pp. 20–21; §§7.2–8, pp. 29–30: dihedral, twist and discriminant routes. |
| Moon–Taguchi, arXiv v1 | §2, (2.1), Lemmas 1–3, pp. 2–5: Borel and unit calculations, with the unramified quadratic base retained. |
| Jones, author preprint | §1.1, (1)–(3), pp. 2–3; §2.3, pp. 8–9: normalization and comparison of local bounds. |
| Ghitza–Yamauchi, arXiv v2 | §2.3, Lemma 2.6, p. 5; §3, Propositions 3.2–3.3, p. 7: general bounds and small-characteristic images. |
| Fesenko–Vostokov, second edition | Ch. I (5.7)–(5.8), pp. 14–16; Ch. IV (3.4)–(3.5), pp. 135–136: critical power maps, equivariance and upper ramification. |
| Odlyzko, 1990 survey | §2, (2.1)–(2.5), pp. 121–122: signs, archimedean constants and unconditional test-function requirements. |
| Odlyzko, 1976 Table 2 | Unconditional totally complex column, table dated 29 November 1976; the unpaginated table is auxiliary to the rational certificates, not a replacement proof. |
| Fontaine | Introduction, pp. 515–517; §§3.4.5–3.4.6, pp. 536–537: strict finite-flat bounds, filtration and positive-dimensional nonexistence. The scan was visually checked where extraction obscured formulas. |
| Brumer–Kramer, arXiv v1 | §1, p. 1; §3, Proposition 3.2 and (3.3), pp. 7–8: division-field discriminant inequality and strict local bound. |
| Schoof | Definition 2.1, pp. 848–849; Proposition 3.1, pp. 850–851; Proposition 4.1 and Corollary 4.2, pp. 851–853; Proposition 5.1, pp. 853–854; §6, pp. 855–858: category, Ext, field criterion and five cases. |
| Snowden, arXiv v1 | §1.2, p. 2; §3.1, p. 6; §9.4, Proposition 9.4.1 and Lemmas 9.4.3–9.4.4, pp. 29–30: Hodge–Tate convention, (A1)/(A2), realization and descent. |
| Khare–Wintenberger, first preprint | Theorems 4.1 and 4.3, pp. 18–21, compared with the version of record rather than accepting the early weight-fourteen claim. |
| Khare–Wintenberger, published paper | Theorem 5.4, p. 247: the weight-fourteen result assumes p different from eleven. |

The source comparison verifies that the package preserves the reviewed
statements and proof routes. It does not certify the planned rational
interval evaluations as implemented Lean proofs.

## Validation and continuation

`scripts/check_blueprint.py` reports zero errors and zero warnings for the
unchanged accepted plan (59 targets, 45 API entries, 34 tests, 80 baseline
entries, 31 requests, six closed scope entries). Submission file checks and
`git diff --check` pass. No source files, source passages, local machine paths
or scratch artifacts are included in the submission.

No review work remains. The next package revision should start with the
stronger target signatures and the six object-specific tests above, then
obtain a successful check at both pinned commits. The package and this report
contain everything needed to resume; no scratch file is required.
