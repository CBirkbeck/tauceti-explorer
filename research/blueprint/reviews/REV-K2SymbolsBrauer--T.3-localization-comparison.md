# Independent review: localization, residues and transfers

**Accepted after corrections, as a complete planning pass.** The sole scoped
stage remains **planned**, not closed. This verdict certifies a mathematical
plan and its declared dependency boundary, with no claim of formalization.

Reviewer: Codex, session `codex-sr7SnE`, job
`REV-K2SymbolsBrauer--T.3-localization-comparison` (#10786), 19 October 2026.
The author was Codex, session `codex-QcGmv4`, job #10813, submitted in
PR #10943. This reviewer did none of that work. The packet, reader and
suggested file were reviewed together and corrected in place.

## Corrections

1. The reader's degree-three example over the 5-adic DVR could not detect
   its claimed sign: its target is K₂(𝔽₅)=0. Replace it with
   k=ℚ(t), R=k[[π]], x={2,t,π}. The proposed boundary is Φ₂{2,t}; its
   t-adic boundary is 1/2 in ℚˣ, whereas the negative has boundary 2.
   The two values differ. The packet now requires this instance and the
   Lean file includes its rational arithmetic calibration.
2. All five existing construction tests lacked the `kind` required by
   PROTOCOL §12. These are now supplied. Add two tests: the degree-one
   principal divisor of 25/2, with coefficients −1 at 2 and 2 at 5, and
   the singleton-family degree-three example above. The construction now
   has seven tests spanning degrees one, two and three.
3. The finite-extension transfer comparison referred directly to the
   simple-extension Milnor base-change theorem for a potentially nonsimple
   extension. The reader now first reduces to simple extensions by
   transitivity of both transfers. The base-change input is then used at
   exactly its stated scope. After prime-to-p base change, transport the
   difference back through Φ₂ before finite descent; this uses the Milnor
   presentation and needs no unmentioned continuity theorem for Quillen
   K-theory. The imported-target metadata records the simple-step reduction.
4. Make `Small.{v} k` explicit in the two split-K₀ baseline descriptions
   and the reader. The pinned equivalence requires this universe condition;
   it is automatic when scalar and vector-space carrier universes coincide.

These corrections introduce no new target, source erratum or supplier request.
The final inventory is three nodes, nine API items, seven construction tests,
eleven baseline declarations, two requests and two inherited gap records.

## Source verification

I read the relevant statements and proofs in the author-hosted combined
K-book draft dated 29 August 2013. Its SHA-256 is
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`,
matching the packet. The following locators use printed pages followed by
PDF pages counted from the cover. The report and corrected reader state
results in our own words.

| Input checked | Locator | Assessment |
| --- | --- | --- |
| Module localization and Serre quotient | II.6.4.1, p.120 / p.128 | Supports the requested quotient equivalence; the naturality needed for comparisons is retained in the request. |
| Nonzero SK₁ and determinant norm | III.1.5.4, p.185 / p.193; III.1.7.1 and following paragraph, p.187 / p.195 | The real-circle obstruction and the inclusion of inseparable field norms are justified. |
| Symbols, finite fields, tame symbol | III.6.1–6.1.5, pp.231–232 / pp.239–240; III.6.3, p.234 / p.242 | The book's degree-two tame symbol is inverse to the roadmap's convention. The quadratic illustration alone does not prove the all-finite-extension transfer comparison. |
| Localization and Milnor residues/norms | III.6.5, pp.236–237 / pp.244–245; III.7.3–7.4, pp.246–248 / pp.254–256; III.7.6 and its prime-to-p argument, pp.249–250 / pp.257–258 | Residues, their Serre-algebra construction and the norm machinery stay with the earlier owners. The higher comparison here is a generator argument, not a falsely attributed named theorem. |
| Transfer and Artin multiplicities | V.3.3.2 and V.3.5–3.7.2, pp.386–390 / pp.394–398; V.4.2.1, p.400 / p.408 | Exact scalar-restriction functors and composition series give residue-field transfers with local module lengths. Nonregular Artin rings are not assigned K=G. |
| Boundary orientation and products | Exercises V.5.1 and V.5.3, p.405 / p.413; V.6.1–6.1.2, p.406 / p.414 | The index is coker minus ker; right module linearity gives the left-action degree sign. |
| DVR, Dedekind and specialization comparisons | V.6.6–6.6.4 and following specialization paragraph, pp.409–410 / pp.417–418 | The inverse-tame boundary, semilocal qualification, transfer diagram and left-[π] specialization agree with the corrected reader. |

The earlier corrections to Exercises III.7.1 and III.7.10 are inherited
conventions; this review does not file another erratum for those exercises.
The primary reference is [Weibel's author-hosted K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).

## Baseline and current upstream

I read all eleven cited declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, including surrounding hypotheses.
The files in the existing pinned check environment match the pinned source
files. No baseline declaration was removed.

- `DirectSum.mk`, `ext`, `map`, `map_apply` and `toAddMonoid` have the stated
  constructor, coordinate and outgoing universal-property roles. Pointwise
  finite support constructs the map **into** the sum; `toAddMonoid` is for
  maps **out of** it. The reader respects that distinction.
- `Algebra.norm` is the determinant norm. `norm_algebraMap` assumes a free
  algebra, satisfied by a finite extension of fields, and retains the full
  degree in inseparable cases.
- `IsDedekindDomain.HeightOneSpectrum.Support.finite` controls poles.
  Applying it to both a and a⁻¹ is necessary for nonzero-order support.
- `TauCeti.Place.finite_setOf_ord_ne_zero` takes an explicit
  `IsFunctionField k F` argument and requires no exact constant field.
- `TauCeti.SplitK0.finrankEquiv` and `finrankEquiv_of` have the stated
  dimension values and the smallness hypothesis now made explicit. They
  do not identify the connective K₀ model on their own.

I checked the relevant AUDIT-29 / REV-AUDIT-29 coverage and read the current
AlgebraicCurves and LocalFieldsRamification reader/suggested interfaces,
including function-field places, finite normalization, principal divisors,
native residue fields and finite-residue local-field norm statements.
Current read-only roadmap main is
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches of those trees and
the pinned libraries found no existing Milnor/Quillen comparison to reuse.
The newer roadmap directions were included. The generic arbitrary-residue
complete-DVR contracts cannot be replaced by the finite-residue local-field
roadmap. Neither read-only tree was modified or built.

## Mathematical and adversarial checks

The local proof reduces symbols to unit-only and uniformizer-last symbols
using bilinearity and {π,π}={−1,π}. Products of unit classes lift to R,
so exactness kills their boundary. Right module linearity and D₁[π]=1 give
DₙΦₙ=(−1)ⁿ⁻¹Φₙ₋₁rₙ on the remaining generators. This uses no
higher-degree injectivity or surjectivity of Φ. The degree-two comparison
uses Φ₂=θ₂♮m, and D₂θ₂m=−εr₂ retains the constant orientation sign.

The following attempts at wrong definitions are distinguished by the checks:

- Replacing inverse tame by tame fails on {2,5}, with values 3 versus 2.
  Omitting the diagonal sign fails on {5,5}, with value 4. Reversing the
  entries gives 2 for the actual boundary of {5,2}. Negative orders also
  obey the displayed inverse formula; a finite arithmetic sweep checked
  784 choices with a,b from −3 through 3 and all nonzero units modulo 5.
- A constant sign in every degree fails the new degree-three example.
  Degree one fixes the positive valuation; n=0 is outside the asserted
  residue comparison. Characteristic two can erase signs and therefore is
  not used as the sign discriminator.
- A wrong total residue target using units in every degree fails the
  principal-divisor test. An unrestricted product rather than a direct
  sum fails the infinite repeated-valuation non-example. A support bound
  using intersection fails {2,5}; an equality with the union fails the
  Steinberg example {2,−1}. Empty families and zero inputs are covered.
- Identifying the two specializations fails on {5}: λ₅ gives the identity
  but q₅ gives −1. Changing parameter to 10 gives 3 and 2, respectively.
  The right-[−π] formula and correction rₙ(x){−1} follow by multiplying
  in the Serre algebra. The k=ℚ(s), x={s,t} example has a nonzero
  degree-two correction, detected by the s-adic residue −1.
- Arbitrary Dedekind localization retains the preceding residue K₂ term
  and the following SK₁ obstruction. The finite-residue injection and
  semilocal short exact sequence are qualified separately. Transport to
  the tame-symbol row negates both the residue coordinate and its outgoing
  map; preserving exactness alone would not specify that comparison.
- An extra ramification factor in pushforward fails ℚ(i)/ℚ at 2, where
  e=2 but f=1 and ord₂N(1+i)=1. Confusing e with f fails
  ℚ(i)((t))/ℚ((t)), where e=1, f=2 and N(t)=t². Purely inseparable
  self-base-change has length p, retaining the multiplicity missing from
  a sum over distinct embeddings. The comparison proof covers prime-degree
  steps beyond quadratic extensions.

The construction's nine API items address its actual consumers: coordinates,
uniqueness, support, kernel, divisor and tame-symbol identifications,
Quillen compatibility and reindexing. The seven tests have concrete values
or precise failure hypotheses. All three new targets remain README-only
where the pinned carriers are absent. The Lean file introduces no fake
K-theory carriers or data definitions with omitted bodies.

## Ownership, dependencies and closure

The four earlier comparison nodes retain their identifiers in
`K2SymbolsBrauer--T.3`. Higher residues, specialization, product signs,
finite support and Milnor norms retain their earlier owners. I read the
named T.2 comparison and orientation contracts; the T.3/T.4 residue,
base-change, prime-to-p and transfer contracts; and the K.3/K.7 index,
localization, transfer and product supplier nodes. The simple-extension
qualification is now respected as described above.

A recursive traversal from the three new nodes and all imported targets
reaches 649 distinct references, including 289 explicit nodes, and finds no
cycle among explicit node prerequisites. Stage-level interfaces remain
terminal boundaries in this check; this is not a proof of supplier closure.
The plan keeps the required K.3 torsion quotient/naturality and K.7 product
model comparison requests. Its two inherited gap records retain the
finite-classical/stable-witness Matsumoto inputs and arbitrary-residue
complete-DVR norm support. These are precise, owned follow-up work, allowed
for a completed **planned** packet by PROTOCOL §0. They prevent closure.

The stage order remains T.3:symbols → T.4 → localization-comparison.
SchemeKTheoryOperations S.3 and EllipticKTheory E.3 are consumers, so no
reverse dependency is introduced. Assembly must retain the packet's
normalization notes for the four imported targets. Three new planets plus
the existing localization planet give four, within the six-planet limit.
No source chapter is expanded into a section-by-section plan.

## Validation

- `scripts/check_blueprint.py` with the pinned declaration index:
  **0 errors, 0 warnings**; three nodes, nine API items, seven tests.
- `lean-check` on the corrected suggested file: **exit 0**, ten `sorry`
  warnings only. Available memory before the check was 80 GB. The file is
  101 lines and all ten statements concern existing carriers.
- Submission path/privacy checks and `git diff --check` pass.

No scoped revision remains. The open supplier requests, inherited gaps and
assembly normalization transport remain explicitly recorded; acceptance
must not be read as promoting the stage to closed.
