# Independent review: REV-FIX-RT-BP-K2SymbolsBrauer--T.3~3

Refs #7020. Codex — `codex-1VA1dK`, 18 October 2026.

**Verdict: accepted.** This completes the independent review of revision 3,
written by Codex `codex-HMufFk`; I did none of that fix work. My claim comment
6243623920 was confirmed by bot comment 6243625091. This is not a checkpoint.

The five confirmed findings remain correctly repaired. Revision 3 also takes
the explicit alternative offered by [revision 2's independent
review](REV-FIX-RT-BP-K2SymbolsBrauer--T.3~2.md): route the missing
arbitrary-residue complete-DVR support to a Part II in its owning direction.
The new brief specifies the substrate, exact exports, proofs, API, tests and
consumers. Unsupported imports from the finite-residue roadmap have been
removed. Acceptance concerns these fixes and this routing plan; it does not
register the Part II or certify the unresolved parts of the blueprint.

The packet remains `partial`, with 68 `unchecked` nodes and six explicit gaps.
In particular, the later area review's monomial-kernel supplier objection
remains. Its immediately preceding review object is preserved verbatim in
`reviewHistory`. No supplier packet or upstream roadmap is changed.

## Scope and evidence

I read the worker rules, blueprint and expansion protocols, upstream guide,
issue and bot confirmation; the original red-team claims and verifier's
reasons; the three fixes reports and preceding individual reviews; the
relevant later area-review disposition; the packet, current suggested file
and reader. I compared revision 3's changes with its preceding packet and
checked the affected residue, transfer, relative-presentation and global-symbol
contracts. Earlier certifications of unrelated source issues are retained,
not represented as fresh checks of all thirteen source issues.

The pinned baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read the relevant native
valuation, spectral-norm, graded-piece and ramification-rank statements at
those commits and the reviewed layer audit. Current upstream was also checked
read-only: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`,
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. GlobalNumberFields
and Completed/EffectiveBounds were read as density references.

## The five confirmed findings

| Finding | Verdict and independent check |
| --- | --- |
| RT-BP-K2SymbolsBrauer--T.3/1, relative D3 | **Correct.** The actual `relDSRel` requires an entry of the triple in the ideal; it derives the three pair witnesses. The packet specifies descent through that guarded relation set, with completeness still a separate cited-proof gap. The read-only reader retains the full presentation target; no unavailable relative-K₂ carrier is fabricated in Lean. |
| /2, trivial-root reciprocity | **Correct.** The real factor is 1 for m=1 and the quadratic sign for m=2. A primitive m-th root at a real embedding excludes m>2. The actual Lean control proves the full m=1 product for an arbitrary finite-place family valued in μ₁. The quadratic real/dyadic cancellation remains separate. |
| /3, real Hilbert domain | **Correct.** The strict-negative compatibility has real unit inputs. The total auxiliary conic function separately has a proved `(0,0)` non-example. The packet and reader distinguish the two domains. |
| /4, residue base change | **Correct.** Arbitrary field embeddings, surjective normalized discrete valuations and positive restriction index are retained. Positivity enters the local residue-field map. At places with trivial restriction, imported entries are units and the residue vanishes; no index-zero residue-field embedding is asserted. Infinite constant extensions and completions stay in scope, while transfer itself remains finite. |
| /5, degree-two convention | **Correct.** Both formerly stale proof steps identify the internal uniformizer-last degree-two residue with the roadmap tame symbol. Inversion is reserved for comparison with the K-book convention. At the 5-adic place `{2,5}` gives 2; swapping entries gives its inverse 3. |

For /1 I reran the first fix report's exhaustive exact-arithmetic reproducer
over F₃[x,y]/(x²,y²), I=(xy). Its detector kills all 477 D1, 20,385 D2 and
56,889 source-guarded D3 instances. Of 13,824 additional pair-admissible
triples, 12,960 have nonzero detector image. At (x,y,x+y), no entry belongs
to I although all pair products equal xy; the prohibited defect maps to
(1,1). This tests the relation guard, not completeness of the presentation.

For /4 I independently computed 252,448 modular controls: residue
characteristics 3, 5, 7 and 11; positive indices 1–4; both orders from −3
through 3; every pair of nonzero unit residues and every nonzero
uniformizer-change coefficient. Substitution π↦cΠᵉ gives exactly the e-th
power of the original tame symbol. The c factors cancel, and the sign
agrees because e²−e is even. These finite controls test the convention and
formula; they are not a proof of the general valuation theorem.

## Revision 3's Part II route

**The route is appropriate and sufficiently specified.** Existing
LocalFieldsRamification Layer 0/3 statements and current
`NumberTheory/LocalField/Norm/Basic.lean` use
`IsNonarchimedeanLocalField`. They do not supply arbitrary-residue complete
discrete valuation fields. AlgebraicCurves Layer 5 owns completion of a place
and its valuation/ring/residue/uniformizer comparisons, but does not state
the four missing finite-extension exports. Its Layer 8 scope wall likewise
does not turn the local-field roadmap into a generic supplier. The relevant
LocalGaloisGroups and ProfiniteArithmetic scope supplies no substitute.

The brief extends LocalFieldsRamification rather than constructing a private
valuation theory in K₂. AlgebraicCurves retains its completion/model
dictionary; K₂ retains Milnor norms, residues and their comparison. The
proposed supplier has no K-theory dependency. Existing special cases are
recovered by comparison rather than replanned.

The four proposed contracts have the following adequate proof closure at
planning level:

1. **DVR.0, extended valuation.** The existing spectral norm works over a
   complete nontrivially normed ultrametric field, with no finite-residue
   assumption. Converting the complete DVR topology to that norm supplies
   the base. Distinct extended-value cosets yield linearly independent
   elements, so their index is finite; the resulting subgroup of the real
   additive value group is discrete and normalizes to ℤ. Existing spectral
   norm uniqueness gives the comparison and tower compatibility. The
   construction allows inseparable finite field extensions.
2. **DVR.1, integral-closure lattice.** Continuous coordinates in the
   finite-dimensional norm bound the valuation unit ball inside a fractional
   R-lattice. The ball is an R-submodule, hence finite and torsion free over
   the Noetherian DVR; scaling a field basis into it identifies its rank.
   Its subring structure makes its elements integral, and the monic-polynomial
   norm bound proves the converse. This supplies the finite free integral
   closure before using rank or filtration formulas. The uniformizer
   filtration gives [E:F]=e[l:k], including inseparable residue extensions.
   The totally ramified specialization supplies the primitive uniformizer
   and Eisenstein constant-term choice used by the K₂ calculation.
3. **DVR.2, norm identities.** The determinant/module-length computation
   gives ord_F N(y)=[l:k] ord_E(y), first on integral nonzero y and then on
   quotients. For units, reduction of the multiplication matrix and its e
   residue-field layers gives res N(u)=N_l/k(res u)ᵉ. These are determinant
   norms, so inseparable residue fields are covered. Integral/field and
   tower comparisons reuse the existing norm API.
4. **DVR.3, component lengths.** Separability of E/F is explicit, so the
   generic tensor splits into fields. B=S⊗R R′ and C=∏S_i are full finite
   R′-lattices, with finite torsion quotient D. Multiplication by π′ on D
   has kernel and cokernel with equal composition multiplicities as
   B-modules. The snake sequence therefore equates the multiplicities of
   B/π′B and C/π′C. Filtering them yields
   Σ_(i over j)e_i[l_i:L_j]=e·length(A_j). The tower relation
   r e_i=e e′_i gives the second identity by cancellation in the positive
   integer length calculation. No cancellation in a torsion K-group or
   equality K(B)=G(B) is used.

The worked tests distinguish actual failures. For s²=t over ℚ, the norm of
s is −t, e=2 and f=1. A constant quadratic extension instead has e=1 and
f=2. Base-changing s²=t along u²=2t produces residue ℚ(√2), larger than the
compositum of the original residues. In characteristic two,
α²+tα+a over F₂(a)((t)) is separable, but has inseparable residue degree 2
and e=1. Its self-base-change has two generic factors and a residue tensor
of length 2. These tests reject finite/perfect/separable-residue shortcuts
and reduced-tensor multiplicity 1. The three proved matrix controls in Lean
check the corresponding quadratic determinants, not formalized
Laurent-series extension constructions.

The baseline reuse is correctly delimited. Pinned
`spectralNorm.normedField`, `spectralNorm_unique` and
`spectralNorm.completeSpace` supply norms and completeness, not the whole
integer-valued valuation/lattice interface. Pinned
`TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer` already supplies
the general DVR graded pieces. Pinned
`Ideal.sum_ramification_inertia_eq_finrank` supplies the finite-flat rank
identity after the lattice is constructed. Current
`TauCeti.Algebra.norm_quotient_mk` already supplies reduction of a finite free
algebra norm, and the brief directs its future owner to reuse it; that
post-pin declaration is correctly excluded from the pinned baseline.

Proposed Part II identifiers occur in the routing brief and explanatory
contracts, not as registered prerequisites or executable supplier requests.
The affected prime-degree, complete and general residue arguments explicitly
remain conditional on this supply. The maintainer must register, design and
review the Part II, then install exact stage requests and links. Revision 2
expressly allowed this route; it did not require the reviewer to implement
the new roadmap. Its routing objection is therefore addressed while the
registration gap remains honestly visible.

## Source checks

The public sources below were read for these particular corrections and
support contracts. This report records results in my own words, with no
source passages. External proofs merely cited by the books are not claimed
as read.

| Public source | Locators checked |
| --- | --- |
| [Weibel, K-book, author draft of 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | III.5.11.1(b), printed p.227/PDF235; Ex. III.5.14(a), p.229/PDF237; III.6.2–6.3, pp.232–235/PDF240–243; III.7.3, pp.246–247/PDF254–255; Ex. III.7.7–7.9, pp.257–258/PDF265–266. |
| [Gille–Szamuely, first edition, 2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf) | Proposition 7.3.9 and Lemma 7.3.10, pp.199–202/PDF213–216; Proposition 7.4.1, p.204/PDF218; A.6.4, p.312/PDF326; A.6.7–A.6.8(1),(2), p.313/PDF327. The proposed lattice and component-length proofs fill the identified support interface; they are not attributed as verbatim source theorems. |
| [Stacks 00PD](https://stacks.math.columbia.edu/tag/00PD), [02MJ](https://stacks.math.columbia.edu/tag/02MJ), [04GH](https://stacks.math.columbia.edu/tag/04GH), [032W](https://stacks.math.columbia.edu/tag/032W) | Lemmas 10.119.7, 10.121.8, 10.153.4, 10.162.8. Read the stable-tag statements and proofs: DVR recognition, norm/order via module length, henselian finite-algebra decomposition and complete Noetherian Nagata scope. The latter is an alternative source route, not a prerequisite silently added to the bounded-lattice proof. |
| [Stacks 09E4](https://stacks.math.columbia.edu/tag/09E4), [09E8](https://stacks.math.columbia.edu/tag/09E8), [09EM](https://stacks.math.columbia.edu/tag/09EM) | Definition 15.113.1 and Remarks 15.113.6, 15.116.1: positive ramification index, separable normalization scope and the reduced-tensor/base-change distinction. The brief derives its stronger component-length formula itself. Stacks was checked through stable-tag HTML; chapter-PDF pagination in the packet belongs to its recorded 17 October edition. |

Fresh PDF hashes match the packet: K-book
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`;
Gille–Szamuely
`3697582f57a11547addeb8d5d63764d788b9d670e2bd76bd7401b9f3994f1e63`.
No new erratum, change of source version or revised disposition of an
unrelated source issue is asserted.

## Changes and validation

No mathematical correction was needed. I replaced the packet's review object
with this disposition and appended its preceding area-review object verbatim
to history. The suggested file needs no edit. All original nodes, owners,
planets, requests, baseline entries, source issues, six gaps and implementation
statuses are preserved. There are no `excerpt` fields in the edited packet.

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.3.json`:
  **0 errors, 0 warnings**. There are 68 nodes, 82 baseline declarations,
  15 planets, 32 requests and six gaps. Definition/construction totals are
  120 API items and 70 tests; totals over all nodes are 124 and 80.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/K2SymbolsBrauer--T.3.lean`:
  passes. The file is 605 lines, contains light real-bodied definitions and
  statements over existing carriers, and indexes all 68 full targets. Heavy
  targets remain in the reader and packet rather than becoming sorry data.
- **The complete suggested file elaborates:** `lean-check` exits 0 at the
  pinned shared build, with 30 warnings, all `declaration uses sorry`.
  Available memory was 85 GB before the check. No language server, library
  build, Lake update or cache download was started. This is elaboration of
  proposed statements; the admitted theorems are not certified proofs.
- The exhaustive D3 reproducer and 252,448 independent ramification controls
  pass. Packet preservation, review-history retention, absence of proposed
  Part II prerequisites/requests and the supported-file scope were checked.
- `git diff --check` and intake `check-files` pass. No link map or standalone
  restructuring proposal is under review, so their separate checkers do not
  apply. Only this issue's packet, review report and required handoff change.

The six retained gaps concern twists, imported arithmetic theorems, general
Dennis–Stein proof sources, Keune–Loday comparison, Part II registration and
the monomial-kernel owner contract. They remain work for their authorized
owners; this completed fix review does not close or promote them manually.
