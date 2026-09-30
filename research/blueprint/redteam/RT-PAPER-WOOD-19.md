# Red team: PAPER-WOOD-19

Codex, session `codex-rtOQ9t`, issue #4196, 30 September 2026.
Target snapshot: `c9e1212bfcbe14236ed26e6895958f905424729c`.
This worker did neither the extraction nor its independent review.

The attack is complete. There are **two medium findings and two low findings**.
The medium findings concern an omitted characteristic hypothesis in the
corrected conjecture and an insufficient moduli supplier for the supplementary
component argument. Neither is a new counterexample to Wood's proved results.
The two Part II owners and the 13 library statuses survived the checks below.
No target file was edited.

## Source and target manifest

All readings below are this worker's, on 30 September 2026. The inherited
extraction records substantially more prerequisite reading; this report does
not adopt that reading as its own.

| Text | Version and reading | SHA-256 |
|---|---|---|
| [Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050) | Published Duke Math. J. 168 (2019), **377–427**. All 51 content pages, including proofs, tables, appendix and references. PDF page 52 is blank. | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| [Wood, arXiv v2](https://arxiv.org/pdf/1702.04644v2) | 13 July 2018, 40 pages. Targeted comparison of Theorem 1.2 and its normalization on pp. 2–3; not a second complete reading. | `2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd` |
| [Wood, An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland](https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf) | Author-hosted 13-page text corresponding to Research in the Mathematical Sciences 8 (2021), Article 21. Entire text and proofs. | `9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673` |
| [Seguin, Fields of Definition of Components of Hurwitz Spaces](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf) | Author-hosted 26-page text. In particular pp. 4–13 and 23–24: marked covers, component monoid, Galois action, Corollary 2.13, Theorem 3.3 and Proposition 6.1 with proofs. Not the entire paper; original Emsalem/Cau proofs not read. | `bd2084d9af14256e1bbca39d085ebcb73d7a0f191d1d13b68e16e2059484712c` |

The published source's Definition 3.1 and Conjecture 5.1 were also inspected as
rendered pages, as were selected formula/table/appendix pages. Text extraction
alone loses some Greek letters and inverses; this report does not claim a new
glyph-level discovery in the companion note.

Target file hashes:

- `papers/PAPER-WOOD-19.result.json`:
  `a4285ae2ef43425c8ad1c25b85bc7f4eeff32e803e56caccd40203cf07c0547c`.
- `papers/PAPER-WOOD-19.md`:
  `1822afce10a49be3fed766cad7741f761caa10f691cf437cbdac5328f8203930`.
- `papers/PAPER-WOOD-19.review.json`:
  `a0bbf4318f1dec602e9358921caf9ec1f844ae95e2906c02155236214661f633`.
- `reviews/REV-PAPER-WOOD-19.md`:
  `064ddc6a990f6f2b212a075cc8cdea9b4702177562549f9fdd9907c2bdcf38cd`.

Paths above are relative to `research/blueprint/`. All 344 item statements,
statuses and locators, the full extraction report, both Part II briefs, route
destinations, and the independent review report were inspected. Additional
proof/API metadata was inspected particularly for /121–146 and /250–344; this
is not a claim that every historical continuation log was independently proved.

## Findings

### RT-PAPER-WOOD-19/1 — medium: corrected conjecture lacks the invariant's characteristic hypothesis

**Where:** `papers/PAPER-WOOD-19.result.json`, item /298, compared with /34.

Item /298 states its generator-corrected conjecture for any `Q = F_q(t)` and
finite good admissible `G′`, using `I_{G′,π,Q}`. It neither states the
prime-to-characteristic condition nor explicitly imports /34's input context.
That condition is part of the domain of the invariant: Definition 3.1,
published p. 388 (PDF page 12), requires a global field **“whose characteristic
does not divide |F|”**. Item /34 correctly retains it. Tameness of a particular
representation does not imply that the characteristic is prime to the order
of its target group.

A scope witness is `G = C3`, its generalized-dihedral admissible type
`G′ = C3 ⋊ C2 ≅ S3`, and `Q = F3(t)`. The anti-diagonal copy of `C3` in
`C3 × C3`, together with the swap, realizes this type in `C3 ≀ C2`. Its three
outside involutions are conjugate and generate it, and the base kernel
projects onto `C3`. It therefore passes /298's finite-group conditions, while
`char Q = 3` divides `|G′| = 6`. The previously defined lifting invariant
cannot be instantiated with the recorded hypotheses.

**Fix:** state `char Q = 0` or `char Q ∤ |G′|` explicitly in /298; in the
function-field case this is `gcd(q, |G′|) = 1`. Link the conjecture's API to /34
and carry this condition into the ST.3 explanation of the refined invariant.
Keep the generator correction and the conjectural status. Useful API boundary
tests reject the above `F3(t), S3` input and admit `F5(t), S3` at this hypothesis.
This is a defect in the self-contained extracted statement, not a claim that
the number-field conjecture is false or that a new published erratum has been
established. Its effect is limited to the positive-characteristic input domain.

### RT-PAPER-WOOD-19/2 — medium: the general component monoid lacks its marked-moduli supplier

**Where:** `papers/PAPER-WOOD-19.result.json`, /315 and its /316–319 consumers;
source route to `InverseGaloisAndArithmeticFundamentalGroups:IG.5`.

Item /315 defines `Comp(F)` for **every finite group**, all product-one tuples,
and every exact monodromy subgroup, then supplies its arithmetic Galois action
through a marked Hurwitz scheme. Its two explicit prerequisites are /77 and
/255. The latter supplies braid algebra. The former only states a marked
Hurwitz scheme for **centerless** groups generated by involution classes, and
even cautions that it does not assert the general-group scheme construction.
These recorded inputs do not supply /315's geometric identification in its
stated generality.

Seguin uses a different, precisely specified moduli problem. In §2.2.2, covers
may be disconnected; §2.2.3 adds a marked point, and Remark 2.2 allows a listed
branch point to have trivial monodromy. Section 2.2.6, p. 7, constructs
`H*(F,n)` over `Q`, with the marked point unramified at infinity, and identifies
its geometric components with **all** product-one braid orbits. The existence
sentence explicitly says **“follows from [Ems95, Théorème 3]”** and also points
to Kanev. Neither Emsalem nor Kanev appears in the extraction's prerequisite
list. Section 2.3.3 then supplies the action preserving the exact subgroup.

The generality matters downstream even for an ambient centerless group:
with `F = S3`, a factor `(τ,τ)` has monodromy `C2`, a proper subgroup with
nontrivial center. Such factors occur in /317 and /319. Restricting to tuples
generating `F`, or simply adding centerlessness to /315, would discard the
blocks needed by the proof. Item /79's marked Galois-field-extension
classification does not by itself repair this all-subgroups interface.

**Fix:** give the existing IG.5 owner an explicit construction/API for these
marked, possibly disconnected finite-group covers over `Q`, with unramified
infinity, optional trivial-monodromy punctures, their full product-one
component classification and exact-subgroup Galois action. It should import
the existing moduli and fundamental-group foundations, not create a new
roadmap. Record the Emsalem/Kanev source dependency with an honest reading
status (or identify an already planned supplier of exactly this scope), then
rewire /315 and the /316–319 consumers. Preserve /77's hypotheses for Wood's
original construction. The extraction already acknowledges general moduli
closure debt; the defect here is the specific stronger interface which its
current prerequisite edge does not express.

### RT-PAPER-WOOD-19/3 — low: the review paragraph misreports pages and recorded pins

**Where:** `papers/PAPER-WOOD-19.md`, final “Review” section.

The paragraph gives printed pages 378–428 and says that absence of a
`libraryPins` field means no commit was recorded for the library checks.
The matching NSF PDF actually runs from 377 to 427, as its headers, title-page
citation, and the result's own `source.venue` show. The result also records
both full commit IDs under `parityContinuation.pins`, alongside declaration
evidence; the continuation report records the pins too. The absence of a
particular top-level key does not make those records absent.

**Fix:** correct the page range and replace the no-commit assertion by the
location of the existing pins. If standardizing the metadata, copy the same
IDs rather than implying that the original check used an unknown revision.
This finding does not accuse the pinned declarations of being wrong: all 31
cited statements were independently read and matched the 13 library items.

### RT-PAPER-WOOD-19/4 — low: quoted source issues lack the required sourceVersions list

**Where:** `papers/PAPER-WOOD-19.result.json`, alongside `sourceIssues`.

There are ten source-issue entries, including quoted stated results, but no
`sourceVersions` list. PROTOCOL §18 explicitly prescribes this list alongside
`sourceIssues` so that source collation can distinguish published text,
preprints and author copies. Provenance is present elsewhere: the main
`source` records the published hash/date, and source-issue/continuation records
identify the v2 preprint and the 13-page lifting note. This is a normalization
omission, not evidence that those texts were unavailable or unread.

**Fix:** add the §18 entries for the published Wood paper, arXiv v2, and the
companion author copy, using their recorded URLs, actual recorded read dates,
and hashes. Keep historical unsuccessful fetches as history, without replacing
the final successful published-source record. The current paper checker passes;
this finding concerns the protocol's source-collation contract, not a claimed
checker failure.

## Attacks which did not establish another finding

### Main mathematics and existing source issues

The type construction, admissibility/goodness, marked-versus-unmarked counts,
the real-case extra `|c|`, and centerlessness in the function-field theorem
were checked against the full published text. The extraction distinguishes
fixed sufficiently large degree followed by `q → ∞` from a fixed-field
discriminant limit. It retains the non-good liminf gap as G1, rather than
claiming the missing upper bound.

The reduced Schur multiplier is not equated with Tau Ceti's scalar group
cohomology. The chosen reduced cover, the marked extension fiber product, the
discrete cyclotomic action, and the local-to-global lifting inputs remain
separate interfaces. The fixed-fiber calculation includes the square-class
offset, power-torsion obstruction, parity coset and degree shift. The
eventually constant finite profile is needed for an ordinary limit; a finite
or bounded profile alone does not establish it.

The Section 7 Euler products, factor at 2, rigid weights, and higher-pole
Tauberian consumer were compared with the extraction. Its generic Part II
requires the relevant boundary continuation, not just a formal pole at 1.
The appendix's 24-kernel/4-epimorphism/48-orbit accounting remains distinct
from reconstructing the historical cubic-field data.

The ten inherited source issues were considered against the published text
and the companion note. They are not ten new red-team discoveries. In
particular, E7 already records the `u = 1` obstruction, and /298's generator
repair addresses that obstruction. The review itself notes the debatable
`affects: nothing` grading, while the separate errata file uses `a stated
result`; this report does not count that already-disclosed grading dispute as
a new mathematical finding. The two source gaps and the unverified empirical
data reconstruction remain explicit limitations of the extraction.

### Library claims, owners and duplication

Actual declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, not merely name-searched:

| Library items | Pinned file / API checked |
|---|---|
| /1 | Mathlib `GroupTheory/RegularWreathProduct.lean`: type, `rightHom`, `inl` |
| /20 | Mathlib `RepresentationTheory/Homological/GroupHomology/LowDegree.lean`: `H2`, `H2π`, `H2Iso` |
| /36 | Tau Ceti `GroupTheory/GroupExtension/Cohomology.lean`: factor-set class equivalence and splitting criterion |
| /123 | Mathlib `GroupTheory/SchurZassenhaus.lean`: coprime normal-subgroup complement |
| /129 | Mathlib `NumberTheory/NumberField/Discriminant/Basic.lean`: finiteness at bounded discriminant |
| /311–312 | Mathlib `Topology/Separation/Basic.lean`, `Order/Filter/Tendsto.lean`: finite discrete topology and convergence to a pure filter |
| /320 | Mathlib `GroupTheory/Goursat.lean`: the three cited subdirect-product statements |
| /327–328 | Tau Ceti `Algebra/Group/ElementaryTwoQuotient/Basic.lean`: quotient, quotient map, zero criterion, product, induced map and equivalence APIs |
| /329–330 | Mathlib `LinearAlgebra/FiniteDimensional/Lemmas.lean`, `FieldTheory/Finiteness.lean`: rank-nullity and finite-field module cardinality |
| /344 | Mathlib `GroupTheory/Abelianization/Defs.lean`: the five cited quotient/universal-property declarations |

The finite power-map fiber claim /70 is not an unnoticed duplicate:
Mathlib's `MonoidHom.fiberEquivKer`, `powMonoidHom` and `zpowGroupHom` provide
general ingredients, and /70's note already requests an adapter over that
existing API. No new generic fiber theory is necessary.

The existing ArithmeticStatistics and InverseGalois roadmap texts, relevant
atlas stages, and the accepted library-coverage entries for ST.0/ST.3/ST.5,
IG.1/IG.3/IG.4/IG.5, R02.4 and FA.4 were inspected. The Schur-multiplier layer
of upstream InductionRestriction owns the generic cover direction; the
ArithmeticDirichletSeries analytic layers own the higher-pole extension.
Both Part II briefs preserve those parents. Cross-searching paper routes,
roadmaps, packets, restructurings and links found the related
PAPER-LIU-WOOD-ZUREICKBROWN-24 route explicitly coalescing with the same
reduced-Schur Part II, rather than proposing a competing owner. The class
field, étale duality, purity, and scheme foundations suppliers remain imports.

### Reproducible checks and limits

- Paper checker: passed on the unchanged input.
- Structural audit: 344 unique items; 13 library, 13 planned and 318 missing.
  The 318 missing items occur exactly once across the ten routes. All 115
  explicit internal prerequisite edges resolve and are acyclic. This tests the
  edges that are recorded; finding /2 illustrates why it cannot prove closure.
- The extraction's first Python diagnostic was rerun: **6,588 assertions**,
  including 2,233 obstruction fibers and 1,530 action compositions.
- Its second diagnostic was rerun: **563 assertions**, including the finite
  Euler/weight cases and `Aut(A4)` calculation.
- Its parity certificate was rerun: **743,639 checks** (10,771 ranks, 42,537
  affine solves, 42,537 translations, 638,055 weight checks, 9,738 nonzero-column
  checks and one guard).
- These are reruns of the recorded finite diagnostics. They are not an
  independent reproduction of the GAP cover/multiplier/center computations,
  a certificate for every Hurwitz component, or a numerical reconstruction of
  the number-field appendix. The table rows were compared with the published
  tables, but no new full GAP run is claimed.
- Red-team JSON checker, file-intake check and whitespace check were run for
  the two deliverables. No Lean file is required for this red-team job; none
  was written or compiled, and no library build was started.

The red-team result is complete as an attack on this accepted extraction;
the recorded findings require independent verification under PROTOCOL §17.
