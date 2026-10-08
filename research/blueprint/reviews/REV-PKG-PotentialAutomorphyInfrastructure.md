# Independent package review: potential automorphy infrastructure

Reviewer: Codex — codex-SNCIEH, issue #7486, job
`REV-PKG-PotentialAutomorphyInfrastructure`, 2026-10-08.
This session did not write the package or its accepted plan.

Verdict: **needs_changes**. The README meets the presentation and statement
requirements after the clarification below, and the suggested file elaborates.
However, its arithmetic obligations are comments rather than Lean declarations.
Successful elaboration therefore does not satisfy the final package's signature
requirement in PROTOCOL §§13 and 20 or review item 5.

## Checks and result

| Issue requirement | Result | Evidence |
| --- | --- | --- |
| 1. Upstream form and size | Pass | Purpose, boundaries, conventions, construction order, six layers, mathematical targets, API, tests, prerequisites and bibliography; README is 198,610 UTF-8 bytes after correction. |
| 2. Fidelity to the accepted plan | Pass after clarification | All 123 targets, 122 API statements and 90 test descriptions are present. All target statements and their hypotheses were compared with the accepted plan; the supplier requirements and touching link maps retain the same ownership boundaries. |
| 3. Own words and source locators | Pass | Targets are arranged by the construction they supply, rather than as a running summary of a paper. References retain theorem or definition numbers, sections and pages. No source passage is reproduced. |
| 4. No programme process in the README | Pass | No packet filenames, job identifiers, review history, checkpoints or coverage statuses appear in the reader document. |
| 5. Elaborating signatures matching the targets | **Fail on signature coverage** | `lean-check` exits successfully, with 92 `sorry` warnings and no other diagnostics. Only one of the 94 target theorems has an elaborated declaration; the arithmetic contracts remain in a block comment. |
| 6. Metadata | Pass | The entire file is the single line `topic = "math.NT"`, with a terminating newline. |

I read the binding protocols and upstream guide, the accepted packet and its
independent review, the original reader and suggested file, the package and its
handoff, the reviewed library audit, and the link maps mentioning this roadmap.
For upstream comparison I read the ReductiveGroups and Multiquadratic roadmaps
in full and compared the package's target/API/test presentation with them.

## Statement and boundary audit

The plan contains 29 definition nodes and 94 theorem nodes. Every node has its
own named target in the README. I compared the complete statements, including
embedded hypotheses, rather than treating the presence of a name as agreement.
Eighty-eight target statements agree literally after normalizing Markdown
escapes; the other 35 remove editorial annotations, replace references to
numbered items by mathematical names, or clarify equivalent notation. Those
changes preserve the hypotheses and conclusions. Every API and test statement
also survives the conversion. The correction to the introductory convention
does not change a target.

The following delicate features remain intact:

- The two global lifting theorems retain their different bounds, `p > n²` and
  `p > n`, all residual-image and scalar conditions, and the local weight
  conventions. The ordinary theorem permits agreement on an open subgroup of
  inertia; its good-level specialization asks for the stronger stated local
  conditions. No polarization is inserted.
- The Fontaine–Laffaille and ordinary good-level profiles have their complete
  seventeen and fifteen clauses, respectively. Rational primes ramified in the
  field remain in the splitting requirement. Statements using places of F and
  of F⁺ keep these index sets distinct.
- Ordinary diagonal characters use the reversed labelled weight and the
  cyclotomic exponent. Unit and uniformizer values both occur. Lowest-weight
  coefficient projection is distinguished from the character's algebraic
  evaluation.
- Relative Bruhat length counts local factors, while absolute length includes
  their local degrees. The orientation character, degree shifts, determinant
  component and ordinary Satake-image restriction are retained.
- Arithmetic patched pairs must verify their inputs to the abstract algebraic
  theorem. Support is a localization statement and supplies no integral `R=T`.
  The fixed nonprincipal ultrafilter is an imported construction choice.
- The rank-two large-image conclusions give the prime-field subgroup
  `SL₂(F_l)`, not the coefficient residue-field subgroup. The extremely weak
  system trichotomy keeps its Artin-up-to-twist alternative. Regularity is
  retained where it excludes that alternative.
- PA.5's independent field-transport prefix precedes its consumers in PA.2
  and PA.4. PA.3's conditional support interface and PA.4's verification do
  not assume one another's completed lifting theorem.

The seven gaps and 36 supplier requests of the accepted plan are expressed as
mathematical requirements in the README. In particular, integral highest-weight
modules are assigned to ReductiveGroupsIntegralRepresentationsPartII without
inventing a stage identifier; arithmetic forms of products of PGL₂ are not
attributed to a Weil-restriction result alone. Locally symmetric spaces, smooth
representation categories, torsion concentration, deformation rings, abstract
patching and compatible-system carriers remain with their recorded owners.
The Chebotarev link into PA.4 supplies the auxiliary-prime input without changing
these boundaries. I found no unsupported additional target or changed supplier.

I read the ten claimed baseline declarations at the pinned Mathlib revision.
Their scopes agree with the README: categorical retracts and functorial
transport, derived-category localization, support, characteristic polynomials,
Goursat's quotient isomorphism with both surjectivity hypotheses, permutation
composition, finite block exchange, and finite-field PSL₂ simplicity.
The latter assumes field cardinality at least four. None supplies the missing
arithmetic object merely by sharing its name.

## Source cross-checks

All package locators were compared with the accepted plan. I additionally read
the following public primary-source locations for the main hypotheses and
normalizations. This is a package comparison, not a new independent verdict on
all 77 source findings in the accepted blueprint review.

| Source and edition | Locations and points checked |
| --- | --- |
| [Allen et al., published CM-field paper](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | §5.2, pp. 990 and 993: ordinary operators and coefficient projection; Proposition 5.2.28, p. 1003: coefficient/finite-level comparisons; §5.3, p. 1008: orientation; Corollary 5.5.2, p. 1028, and Theorems 6.1.1–6.1.2 with Remarks 6.1.3–6.1.4, pp. 1029–1030: automorphic flags and lifting hypotheses; §7.1 and Lemmas 7.1.1–7.1.2, pp. 1084–1086: weakened compatibility and the rank-two alternatives. |
| [Barnet-Lamb–Gee–Geraghty–Taylor, published Potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) | §2.1, pp. 537–538: normalized ordinary operators, choice of uniformizer, algebraic twists and the local–global remarks. |
| [Qian, public published-version PDF](https://par.nsf.gov/servlets/purl/10388233) | Theorem 1.4, PDF p. 3, and Lemma 4.3 with its proof, PDF pp. 35–36: ordinary lifting input and the separate Geraghty dependencies. The README distinguishes physical PDF page numbers from journal pagination. |
| [Boxer–Calegari–Gee–Pilloni, potential modularity of abelian surfaces](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf) | Definition 9.1.1, p. 249; rank-two weight-zero and odd conventions, p. 251; Lemma 9.1.10, pp. 251–252: irreducibility and symmetric-square alternatives. The stronger coefficient-field large-image wording is not imported. |
| [Boxer–Calegari–Gee–Newton–Thorne, Bianchi modular forms](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf) | Definition 6.1.2, pp. 57–58, and Lemmas 6.1.4–6.1.5, p. 59: the finite exceptional set, prescribed prime-to-level set, purity upgrade and prime-field residual image after normal closure. |
| [Khare–Thorne, ordinary completed cohomology manuscript](https://www.repository.cam.ac.uk/bitstream/1810/254249/1/Khare%20et%20al%202016%20American%20Journal%20of%20Mathematics.pdf) | §5, Lemmas 5.1–5.4, manuscript pp. 25–27: the residue congruence, trace/index normalization, distinct roots and ordered support. |

The unresolved primary-source leaves are still stated as supplier obligations,
especially Geraghty's twisted-Steinberg and nonsplit soluble ordinary transport
lemmas. An accessible definition of ordinarity does not prove either leaf.
No restricted-library book was used or copied.

## Correction made

The introductory convention previously said that the cohomology of
`RHom(RΓ,O)[−d]` corresponds to the opposite-degree cohomology of `RΓ`, without
qualifying the coefficient ring. The patching target itself correctly restricted
the ordinary dual formula to rational coefficients.

I made that restriction explicit in the introduction: after extending scalars
to E, the formula is
`Hⁱ ≅ Hom_E(Hᵈ⁻ⁱ(RΓ ⊗_O E), E)`; over O the expression remains derived Hom
with its Ext contributions. For example, a torsion module `O/ϖ` in degree zero
has a nonzero `Ext¹_O(O/ϖ,O)` contribution. An integral ordinary-Hom formula
would miss it. The rational interval, `qpatch = qGL + 1`, and all target
statements remain the same. This clarifies the existing rational formula in
ACC §6.5.1, proof of Theorem 6.5.4, pp. 1067–1069.

## Blocking finding: comments do not supply target signatures

`Suggested.lean` ends its namespace at line 604. From line 606 to the end it
contains a single block comment headed `BEGIN NAMED MATHEMATICAL OBLIGATIONS`.
The header honestly says these are not elaborated signatures. Listing a
mathematical statement in that comment preserves the plan's text but creates no
Lean declaration or type-checked example.

After removing comments and tracking namespaces, I counted 67 explicitly named
Lean declarations and 45 `example`s. Their relation to the accepted target list
is as follows. The definition column counts names in actual code, including
the deliberately limited local cores; it does not assert that every arithmetic
part of those targets has a signature.

| Layer | Definition targets | Definition names in code | Theorem targets | Theorem target names in code |
| --- | ---: | ---: | ---: | ---: |
| PA.0 | 2 | 2 | 6 | 0 |
| PA.1 | 2 | 2 | 13 | 1 |
| PA.2 | 17 | 7 | 30 | 0 |
| PA.3 | 1 | 0 | 5 | 0 |
| PA.4 | 4 | 1 | 21 | 0 |
| PA.5 | 3 | 2 | 19 | 0 |
| Total | 29 | 14 | 94 | 1 |

The one typed theorem target is `shifted_partition_recovery`.
Forty-eight of the 122 named API items occur as declarations, counting the
generated `EquivariantRetract.toRetract` projection; 74 do not. Forty-five of
the 90 specified tests are actual `example`s; the other 45 are only descriptions.
The auxiliary declaration `WeightIndependentHidaTwist.nu` does not define
`WeightIndependentHidaTwist` or state its complex comparison.

The fifteen definition names absent from the elaborated part are:

- `LocalOrdinaryParts`, `CompletedArithmeticCohomology`,
  `CompletedOrdinaryCohomology`, `UnitaryOrdinaryTower`,
  `UnitaryCompletedBoundary`;
- `BruhatCellInduction`, `BruhatUnipotentInvariants`, `DeterminantTorus`,
  `OrdinaryHidaComplex`;
- `TaylorWilesSelectedIdeals`, `WeightIndependentHidaTwist`,
  `OrdinaryTaylorWilesLevels`;
- `IotaOrdinary`, `OrdinarilyAutomorphic`, `WeaklyAutomorphicPrimeTo`.

Concrete absent theorem signatures include `coefficient_satake_descent`, the
ordinary local–global comparisons, both arithmetic patching verifications,
`fontaine_laffaille_automorphy_lifting`, `ordinary_automorphy_lifting`, and the
rank-two compatible-system transport theorems. Even the local cores leave
owner-dependent APIs such as `CTGWeight.no_cuspidal_levi_weight`,
`LowestWeightCharacter.projection` and `OrdinaryGaloisCharacters.unique` in
comments. The retained tests discriminate the local cores; they do not check
the absent arithmetic interfaces.

This limitation was already recorded in the accepted plan's
`prototypeCoverage`. It is not a concealed defect or a reason to change that
accepted packet. Nevertheless, accepting a blueprint with explicitly omitted
dependent signatures does not establish that its final package meets §20's
requirement to hold the plan's definitions, theorems, API lemmas and tests as
Lean statements. Section 13's standard note that a prototype is not exhaustive
and its ban on fabricated proposition-valued conditions do not make a block
comment an elaborated signature.

To resolve this finding, a package revision must use the owning roadmaps'
concrete mathematical interfaces to state the arithmetic targets, their API
and tests, preserving every hypothesis in the README. For partially typed
local cores it must also supply the advertised arithmetic comparison or adapter.
When an owner interface is unavailable, record that blocker and keep the package
unaccepted; do not introduce arbitrary `Prop` fields, weaken the README to the
local cores, or implement another roadmap's construction here. The existing
supplier-interface section identifies the exports needed to resume.

## Validation and limits

- `lean-check research/blueprint/packages/PotentialAutomorphyInfrastructure/Suggested.lean`
  completed with exit code 0: 92 declaration-uses-`sorry` warnings, zero errors,
  zero other warnings. The file was not edited in this review.
- The shared build's Mathlib is the exact pin
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. All imports in the suggested file
  are individual Mathlib modules. The shared Tau Ceti checkout differs from
  `f790474821cf4256814db967cb154e7af3d0c369` and is not imported; this run
  establishes no compatibility for future arithmetic Tau Ceti imports.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`
  reports zero errors and zero warnings: 123 nodes, 122 API items, 90 tests,
  34 planets, six planned stages, seven gaps and 36 requests. The packet and
  original reader/suggested files are unchanged.
- Name, statement and locator comparisons, metadata parsing, the README size
  check, changed-file validation and `git diff --check` complete the submission
  checks. None of these replaces the missing arithmetic signature check.

The independent review is complete. The next action is a package revision,
followed by a fresh independent package review; this submission is not a
checkpoint of unfinished review work.
