# Independent review: REV-FIX-RT-BP-K2SymbolsBrauer--T.3~2

Refs #5722. Codex — `codex-q3tan1`, 7 October 2026.

**Verdict: needs_changes.** This is a completed independent review of
`FIX-RT-BP-K2SymbolsBrauer--T.3~2` by Codex `codex-DWTl3R`, not a checkpoint.
I did none of that fix work. Claim comment 6038222718 was confirmed by bot
comment 6038225426; I reread the whole issue after confirmation.

The five original confirmed red-team repairs remain correct. Four of the five
older obligations have adequate source decompositions and owner contracts.
The arbitrary-field transfer comparison also has an adequate decomposition,
but general all-degree norm/residue closure still depends on an upstream
contract outside its stated scope. I corrected the straightforward dependency,
request and suggested-file discrepancies below and recorded that remaining
scope failure explicitly. The packet stays `partial`, all 68 nodes stay
`unchecked`, and the previous independent review is preserved verbatim in
`reviewHistory`.

## Inputs and baseline

I read the red-team result and verification, both fixes reports, the previous
independent review, the revised packet and suggested file, and the reader as
read-only context. I checked the relevant GeneralAlgebraicKTheory K.3 supplier
nodes and the K2SymbolsBrauer T.1/T.2 companion packet. I read the reviewed
library audit and the relevant owner milestones. GlobalNumberFields and
GlobalQuadraticForms were read end to end as density references. The binding
blueprint/expansion protocols, upstream checklist and worker rules govern this
review; no upstream roadmap, supplier packet or live atlas file is edited.

The baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I checked the packet's pinned source
statements, with particular attention to `PresentedGroup`, the dual-number
and ideal-membership APIs, first roots of unity, normalized valuation/residue
maps, divisor admissibility, and normalization finiteness. The pinned
`TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable` has a
polynomial base and a finite purely inseparable fraction-field extension;
the separable finiteness theorem really requires separability. Neither can
be applied to an arbitrary intermediate ring by its name alone. Supplier
plans are not baseline declarations or completed formalizations.

## The five confirmed findings

| Finding | Verdict | Independent check |
| --- | --- | --- |
| RT-BP-K2SymbolsBrauer--T.3/1 | Correct | Actual `relDSRel` D3 takes an entry-in-I disjunction, then derives the three pair witnesses. Pair admissibility does not replace that guard. The quotient/descent signature uses this relation set. |
| /2 | Correct | Real factor is 1 for m=1, the quadratic sign for m=2; the primitive-root hypothesis excludes real places for m>2. The full first-root product test and quadratic real/dyadic control remain. |
| /3 | Correct | The real Hilbert comparison takes units. The total conic helper has a separate zero-input non-example, so its value at (0,0) does not get the units-only strict-negative rule. |
| /4 | Correct | Degree-two and higher residue base change allow arbitrary embeddings with normalized surjective valuations and a positive ramification index. The residue map requires positivity. Zero inputs and places with trivial restriction are handled separately; finite transfer remains finite. |
| /5 | Correct | Uniformizer-last Milnor residue equals the roadmap tame symbol in degree two. The K-book convention is separately its inverse. The Q5 test distinguishes 2 from 3. |

For /1 I reran the exact-arithmetic reproducer in the first fixes report.
In R=F3[x,y]/(x²,y²), I=(xy), the detector kills all 477 D1, 20,385 D2 and
56,889 source-guarded D3 instances. Of 13,824 excluded pair-admissible
triples, 12,960 have nonzero detector image. At (x,y,x+y) the defect is
(1,1). This verifies the counterexample and the corrected guard, not
completeness of the Dennis–Stein presentation.

For /4 I independently checked 252,448 modular sign/unit calculations in
residue characteristics 3, 5, 7 and 11, with positive indices 1–4, orders
−3 through 3, and every nonzero unit/uniformizer-change value. They compare
the residue after π maps to cΠ^e with the e-th power of the original residue.
These controls test the sign and cancellation of c; they do not prove the
general valuation theorem. The Lean signatures retain the infinite-extension
scope and the explicit local-map hypothesis that the original finding required.

## The five older obligations addressed by revision 2

**1. Arbitrary-field transfer comparison and all-degree norm/residue:
transfer comparison correct; residue closure still needs changes.**
The transported Quillen transfer uses K.3's arbitrary-base-change node,
including composition lengths of local Artinian tensor factors. Restriction
of scalars, radical-filtration additivity and dévissage give the formula
without identifying K(B) with G(B) for nonregular B. Equality with the Milnor
norm follows on generated symbols over normal prime-degree towers from the
common projection and degree formulas; common base change and finite
prime-to-p descent kill the difference for each prime. The comparison does
not use the desired norm/residue theorem as an input.

The generated-symbol residue node now treats all four cases, including the
two-uniformizer sign/unit correction and the Eisenstein constant-term
choice in the totally ramified case. Both sides are converted from GS's
uniformizer-first convention. Degree one uses the determinant valuation
identity. The complete prime-degree argument keeps the ramification factor:
r·res δ=0, and residue transfer gives r f′δ=[F′:F]δ=0. Bézout combines
prime-power and prime-to-p annihilation; it does not cancel r in a torsion
group. The infinite p-closure is used only to find finite algebraic data,
which descend to finite complete discrete valuation fields.

The general separable complete-extension argument correctly allows residue
fields larger than their composita. It uses the identity
Σ_(i over j)e(E_i/E)[l_i:L_j]=r·length(A_j), derived by comparing the full
lattices S⊗R R′ and their finite normalization. Kernel and cokernel of
multiplication by π′ on the torsion quotient have equal composition
multiplicities. Integer cancellation occurs in this length identity, not
in Milnor K-theory. Purely inseparable steps are treated in prime-degree
towers before the separable part. The semilocal CRT completion route then
gives the general sum over extensions of a place, assuming finite integral
closure; it introduces no extra ramification coefficient.

**The missing input is the owner contract for the generic complete-DVR
support used in those arguments.** LocalFieldsRamification's exported scope
is finite extensions of `IsNonarchimedeanLocalField`, with finite residue
fields; its Layer 0 supplies the local finite free integer-ring lattice and
e f degree identity under that scope. Layer 3's norm milestone does not
supply those statements for arbitrary complete discrete valuation fields.
For example Q((t)) and Q((s)), t=s², satisfy the complete discrete-valuation
scope of the T.4 statement but have infinite residue field Q.

The exact missing exports are: normalized finite-extension valuation
structures and finite free integral closure of rank e f=[E:F];
ord_F N(y)=f ord_E(y); res N(u)=N_l/k(res u)^e, including inseparable
residue extensions; and the componentwise finite-base-change length identity
above for separable E/F. The supplied determinant/filtration and lattice
proof outlines are sound once that substrate is supplied. They do not make
an existing stage's scope broader. AlgebraicCurves Layer 5 explicitly covers
arbitrary-residue completion comparison, but does not state these generic
finite-extension norm and lattice-length exports either.

PROTOCOL §3 allows a stage prerequisite only when its stated scope covers
the need. The fixer's stronger request and `upstreamNotes` acknowledge the
mismatch but do not close it. I added a fifth explicit gap and coverage
remainders. To close this obligation, identify and link an exact existing
general supplier, or route a Part II support plan in the owning direction
under §15, covering the substrate and those exports. Do not narrow T.4 to
finite residue fields or build a private local-field toolkit there. This
one remaining obligation is the reason for `needs_changes`.

**2. Ring boundary owner and action side: correct after dependency repair.**
The exact K.3 nodes plan the cone/cokernel degree-one boundary and its DVR
dévis­sage specialization, giving ∂[π]=1 and zero on units. The right module
action gives ∂(π·u)=ū; the corresponding left action has its degree sign.
Expansion gives the K-book degree-two boundary, the inverse of the roadmap
tame symbol. K.7 owns the ordered product of unit classes; S.3 is a consumer
rather than the degree-one supplier. These are genuine planned supplier
nodes with their proof contracts, not merely a downstream request.

**3. Mixed inseparable normalization: correct after dependency repair.**
The normal-hull, pure-first decomposition is essential: embed K in finite
normal M; the maximal purely inseparable P over k(t) has M/P separable.
The pinned polynomial theorem makes the normalization A′ in P finite.
A′ is normal Noetherian, so separable trace finiteness makes its normalization
B in M finite. The normalization in K is a k[t]-submodule of B, hence finite.
Repeat at t⁻¹ and localize. This neither applies the polynomial theorem to
an arbitrary intermediate base nor equates Noetherianity with finiteness.
The mixed degree-six F3(s), t=u² example retains both kinds of extension.
AlgebraicCurves Layer 2 explicitly plans this general normalization; Layer
12 owns the regular-model dictionary. GS 7.4.4's smooth theorem is used only
at its own scope; the imperfect/regular adapter uses the general norm law
and normalization, and consequently inherits the support gap in item 1.

**4. K2(Z) upper generation: correct.** The four integer nodes specify the
auxiliary finite-rank group, the monotone word lemma, kernel containment in
the monomial subgroup and stable upper generation. The auxiliary rank-two
presentation includes Milnor Definition 10.4's conjugation relation. It is
not a rank-two presentation with vacuous three-index relations.

I checked the seven-case proof in Milnor pp. 85–90, including the rendered
printed pp. 88 and 90: both Case 7 inequalities are non-strict. The
well-founded measure is maximum descent height and its last occurrence;
word length need not decrease. Independent exact integer matrix calculations
verify every displayed rewrite at both signs. Over [−6,6]³ the sufficient
peak inequalities hold in 716 Case 4, 546 Case 5, 620 Case 6 and 508 Case 7
instances. These matrix checks are controls, not proofs of equality in the
abstract presentation; the outlined abstract rewrites use the source's
defining relations.

Norm-one prefixes in the kernel proof remove first-index-n generators;
commuting last-column roots and the lower-rank induction isolate the
monomial kernel, including the honest auxiliary rank-two base. No
stabilization injectivity or order-two rank-two kernel is assumed. The exact
T.2 request is the general unit-symbol description of that monomial kernel
from Milnor §9. T.5 specializes it to the units ±1 of Z, so c={−1,−1}
generates and c²=1. Real sign proves c≠1 afterwards, independently of K2(Q).

**5. Higher-power local and Chern signs: correct after request repair.**
At positive arithmetic Frobenius, Milne's ordered cup evaluates Artin(b)
on a root of a. This packet's classical symbol evaluates Artin(a) on a
root of b, hence has exponent minus the positive-cup invariant coordinate.
The abstract character-evaluation theorem is already a ClassFieldTheory
Layer 4 milestone; Layer 6 transports the same invariant into the local
class formation. I made that exact local export explicit in the request.
This does not rely on the quadratic case to fix a higher-power sign.

For Q7 with ζ reducing to 2, X³−3 is irreducible over F7 and residue
Frobenius gives the ratio 3²=2. Thus the positive ordered cup has invariant
1/3 and the classical symbol is ζ⁻¹. The seventh-power computation is in
the residue field, not a formula for characteristic-zero Frobenius on the
chosen root. Changing ζ to ζ^u multiplies its coordinate by u⁻¹ as required.

Soulé thesis Proposition 2.2.2.3 has coefficient −1 at i=j=k=k′=1;
the output degree satisfies (M). Pullback of the external product along
F⊗Z F→F and K.7's ordered K1 product give c2,2=−h on symbols, hence on K2.
Coefficient naturality and CRT cover every invertible m; m=1 is zero.
M.3 remains the owner of the maps and arithmetic Tate statements, and M.1
owns twists. This is an adapter, not a second construction of either map.

## Corrections made in this review

1. Added 24 missing supplier-stage prerequisites already specified by the
   requests' consuming nodes. They cover the curve dictionary/completion,
   disjoint-support adapter, Dennis–Stein words, relative K-theory, local
   Artin/cup/Brauer interfaces and global reciprocity. The unsupported generic
   DVR request is explicitly marked as routing information and a gap.
2. Added `restriction-transfer-degree` directly to both complete norm/residue
   arguments that use it; their prime-to-p descent needs that residue-field
   degree identity. No node, owner, planet or implementation status changes.
3. Specified the local specialization of `ClassFormation.character_artinMap`
   through `localClassFormation_inv` in the ClassFieldTheory Layer 6 request.
4. Restricted the generic norm request to complete fields, removing the
   unnecessary unqualified henselian assertion. Specified separable E/F in
   the lattice-length request, where E⊗F F′ is a product of fields. For a
   purely inseparable extension that tensor can instead be nonreduced;
   the separate Artinian transfer formula retains its lengths.
5. Added the exact arbitrary-residue support gap, its consuming nodes and
   coverage remainders, and clarified the maintainer's upstream routing note.
6. Strengthened the suggested zero-ideal test to state triviality of both
   the guarded quotient presentation and the classical relative K2 group.
   Removed the stale comment calling `relK2.toK2` and
   `relDennisSteinGroup.toRelK2` missing signatures; both are defined above.
7. Replaced the top-level review with this disposition and preserved the
   preceding review verbatim in history. The four previously retained gaps
   concerning twists, imported arithmetic theorems, general Dennis–Stein
   proofs and the Keune–Loday comparison remain.

## Public source checks

These are the public editions read for this review. Their freshly downloaded
full-file SHA-256 values agree with the packet's recorded versions.

| Source | Relevant sections checked | SHA-256 |
| --- | --- | --- |
| [Weibel, K-book draft, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | III.5–7; V.1.2/1.2.1, V.3.7.2/Ex.3.11, V.6.1.2, V.6.6.1 | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| [Gille–Szamuely, first edition 2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf) | 7.3.6–7.3.12, 7.4.1–7.4.4; A.6.4 and A.6.8(2) | `3697582f57a11547addeb8d5d63764d788b9d670e2bd76bd7401b9f3994f1e63` |
| [Milnor, 1971 institutional scan](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu) | §9 pp. 71–78; §10 pp. 81–92 | `41816b3a1aa683d9fc53be06fafadd22b8159f5a9062e9bf5fdb5be0b9147e25` |
| [Milne, Class Field Theory v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf) | III.3.6(a), III.4 Steps 2–4/Remark 4.5 | `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5` |
| [Soulé, author-hosted typed June 1978 thesis](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf) | 2.2.1.1, 2.2.2.1–2.2.2.3 | `19bb0877616c262fcb83c9fe6ad88f98747f117f23805b6154e19174dbb659a7` |

Also checked the normal-hull/pure-first reduction at [Stacks 032N](https://stacks.math.columbia.edu/tag/032N),
polynomial finiteness at [032O](https://stacks.math.columbia.edu/tag/032O), and
separable trace finiteness at [032L](https://stacks.math.columbia.edu/tag/032L).

The new source issues are correctly version-scoped. E12's literal exact-order
claim is false for the split symbol a=b=1; the typed author's copy cannot
establish wording in the original dissertation or published 1979 article.
Its existing author-copy status is retained. For E13, the first edition's
nilpotence index is not general tensor-factor multiplicity: in
F_p(s,t)→F_p(s^(1/p),t^(1/p)), self-base-change has length p² but nilpotence
index 2p−1. I read the first-edition locator and independently counted the
monomial basis/maximal surviving degree for p=2,3,5. The length formulation
used in the revised proofs is correct. I make no claim about the second
edition or additions to an author's errata list.

## Validation and its limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.3.json`:
  **0 errors, 0 warnings**, using the available pinned declaration index.
  The packet has 68 nodes, 82 baseline declarations, 15 planets, 32 requests
  and five gaps. Definition/construction counts are 120 API items and 70
  tests; counts over all node kinds are 124 and 77.
- JSON parsing, original node/owner/planet preservation, unchanged unchecked
  status and exact previous-review retention pass. The checker validates
  the acyclic internal graph; it now has 171 internal prerequisite pairs.
- Read-only `build.assemble(require_distances=False)`, substituting the
  original research packet and then this revision in memory: 4,100 stages
  in each, 10,774→10,785 distinct dependency pairs, 11 added and none removed.
  The existing skipped CA.1→T.7 import is unchanged and remains the recorded
  maintainer ownership question. This is hypothetical assembly, not promotion.
- Isolated Mathlib-only extraction of the actual integer presentation,
  action APIs, Silvester/finite-kernel signatures and integer examples, and
  of the actual guarded relative relation/quotient and its zero-ideal example,
  elaborates with `lean-check` at pinned Mathlib with only `sorry` warnings.
  The stable-carrier map and companion imports are excluded. The actual
  F7 cubic test and an additional first-root control elaborate without sorry.
- **The complete suggested file does not elaborate.** `lean-check` stops at
  the missing prebuilt `TauCeti/FieldTheory/FunctionField/Divisor/Eval.olean`
  before checking any declaration. The shared build has the pinned Mathlib;
  its Tau Ceti checkout is not the recorded Tau Ceti pin. Isolated checks
  certify neither the full file nor its new conjunction with relative K2.
  More than 100 GB memory was available before checks. No library build,
  Lean language server, Lake update or cache download was started.
- `git diff --check` passes. Only the issue's three deliverables and this
  job's required handoff are changed. No link map or restructuring proposal
  is a deliverable, so their checkers do not apply.

This completed review leaves one precise older closure obligation for the
next authorized revision/maintainer routing step; the review itself is finished.
