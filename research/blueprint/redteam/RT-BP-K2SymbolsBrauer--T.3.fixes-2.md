# FIX-RT-BP-K2SymbolsBrauer--T.3~2

Refs #5721. Codex — `codex-DWTl3R`, 6 October 2026.
Claim comment 6019425058 was confirmed by bot comment 6019428852; the whole
issue was reread after confirmation. This is the completed second-round fix,
not a checkpoint or an independent review. The packet remains `partial` and
every node remains `unchecked`. Its `review` and `reviewHistory` are preserved
verbatim, including the independent `needs_changes` disposition.

The five targeted repairs that the first-round review accepted are retained.
This revision supplies the source decompositions and ownership contracts for
the five older obligations that review explicitly left unresolved. Only this
report, the issue's packet/reader/suggested file and the required job handoff
are edited. Supplier packets, upstream roadmaps and live atlas data are not
edited. Planned supplier interfaces are requests, not claims of implementation.

## Confirmed findings

**/1, relative Dennis–Stein D3.** The actual relation still requires
`r ∈ I ∨ s ∈ I ∨ t ∈ I`; pair membership is derived from that guard. Its
quotient-descent API, proof and iterated-dual-number tests are unchanged.
The published exact-arithmetic reproducer in the [first fixes report](RT-BP-K2SymbolsBrauer--T.3.fixes.md#standalone-exact-arithmetic-reproducer)
was rerun unchanged. Over the 81-element ring F₃[x,y]/(x²,y²), I=(xy), all
477 D1, 20,385 D2 and 56,889 guarded D3 instances have zero detector image;
12,960 of the 13,824 excluded pair-admissible triples have nonzero image.
At (x,y,x+y), the defect is (1,1). This tests the erroneous relation set;
it does not prove Dennis–Stein presentation completeness, whose gap remains.

**/2, exponent-one global reciprocity.** The real factor remains 1 for m=1,
the quadratic sign for m=2, and there are no real embeddings under the
primitive-root hypothesis for m>2. The full ℚ, m=1, {−1,−1} product test and
the separate quadratic real/dyadic cancellation test remain. The global
comparison proof now uses the determined local exponent −1; it keeps the
coordinate [a/m]↦a in Z/m, rather than multiplication by m in ℚ/ℤ.

**/3, real Hilbert inputs.** The compatibility test still has inputs in
ℝˣ. The total conic helper's separate (0,0) non-example is retained.
No strict-negative criterion on all real elements is asserted.

**/4, arbitrary base change.** The degree-two and higher ramification
signatures still accept arbitrary field embeddings with normalized surjective
valuations and a positive index. Their residue-field map explicitly takes
the positivity witness. Infinite constant extensions and completion are not
removed from the scope, and places with trivial restriction are handled by
the all-unit residue calculation. Finite norms remain finite-extension maps.
An independent finite-field grid checked 252,448 sign/unit computations over
residue characteristics 3, 5, 7 and 11, indices 1–4 and orders −3 through 3.

**/5, degree-two convention.** The uniformizer-last Milnor residue equals
the roadmap tame symbol in degree two; the separately named K-book comparison
is its inverse. The distinguishing ∂₅{2,5}=2 versus inverse 3 is retained.
The new GS proofs convert their uniformizer-first convention by multiplying
both sides by (−1)^(n−1), rather than changing only one side.

## Earlier review obligations

**1. Arbitrary-field transfer comparison and all-degree norm/residue.**
`milnor-quillen-transfer-comparison` now has a general proof independent of
norm/residue compatibility. K.3's exact base-change request permits any F′/F
and includes the lengths of local Artinian factors of E⊗F F′. The proof
base-changes restriction of scalars, then applies radical-filtration
additivity and G-theory dévissage. It never identifies K(B) with G(B) for a
nonregular tensor algebra. The example E=Fₚ(s^(1/p)), F′=E requires length p.
After transport through Matsumoto/T.1, common projection and degree formulas
give equality on generated symbols over normal degree-p towers in F^(p).
The common base-change lengths then kill the difference after restriction;
finite descent and restriction–transfer kill it by an integer prime to p for
each p. Primary detection proves equality for arbitrary finite E/F.

Gille–Szamuely's general norm/residue proof is decomposed into
`prime-degree-residue-on-generated-symbols`, `kato-complete-residue`,
`complete-norm-residue` and the existing `transfer-and-norm-residue`.
The generated-symbol node states all four cases, including the two-uniformizer
unit/sign correction and its Eisenstein constant-term choice. Degree one is
handled separately by the determinant valuation identity. A possibly
nondiscrete infinite F^(p) is used only to find finite algebraic identities;
those identities descend to a finite complete discrete valuation extension.
The ramification factor r is retained: r·res δ=0, then residue transfer gives
[F′:F]δ=0. No torsion-group cancellation of r is made.

The general finite-base-change residue multiplicities are also displayed.
For residue tensor factors A_j of length t_j and normalized field components
E_i with residue l_i, their identity is
Σ_(i over j)e(E_i/E)[l_i:L_j]=r t_j. The proof compares the full lattices
S⊗R R′ and its finite normalization after reduction modulo π′. The torsion
quotient's multiplication kernel/cokernel have equal composition multiplicities; filtrations
give the identity. This accounts for residue fields larger than their
composita. The generic DVR norm and length identities are requested from
LocalFieldsRamification Layer 3, with their proofs and the required extension
beyond its standing finite-residue-field scope recorded in `upstreamNotes`.

For a DVR with finite integral closure, the semilocal CRT completion supplies
E⊗F F̂=∏Ê_w, with all lengths 1. Complete-field compatibility and unchanged
completion residue fields give the general formula. It has residue norms but
no extra ramification coefficient. No Quillen comparison is used to prove it.

**2. Ring boundary owner and module-action side.** K.3 owns the degree-one
cone/cokernel boundary ∂[s]=[R/sR] in K₀ of the torsion exact category.
DVR dévissage gives ∂[π]=[k] and ∂[f]=ord(f)[k]. K.7 supplies the RIGHT
action ∂(x·j*y)=∂x·i*y and the ordered unit product. Thus ∂{π,u}=ū;
expansion gives (−1)^(rs)v̄^r ū^(−s), the inverse of the roadmap symbol.
The stale acceptance sentence assigning this input to downstream S.3 is
removed. The exact supplier request includes the cone proof, dévissage and
the mixed-unit calculation. S.3 remains a consumer of this comparison.

**3. Mixed inseparable normalization.** AlgebraicCurves Layer 2 explicitly
owns finite normalization for every finite K/k(t), not only separable K.
Its request now gives a source-backed pure-first normal-hull argument:
embed K in finite normal M; take the maximal purely inseparable P/k(t), with
M/P separable. The pinned polynomial pure theorem makes the normalization
A′ in P finite; A′ is normal Noetherian, so the separable trace theorem makes
its normalization B in M finite. The normalization in K is a k[t]-submodule
of B and hence finite. Repeat at t⁻¹ and localize. This does not apply the
polynomial pure theorem to a nonpolynomial intermediate ring, nor confuse
Krull–Akizuki Noetherianity with module finiteness. The test
k=F₃(s), K=k(s^(1/3))(u), t=u² has degree 6, with both separable and
inseparable parts, and normalization k(s^(1/3))[u].
`weil-reciprocity` imports this Layer 2 supply before the Layer 12 dictionary.
GS 7.4.4 is cited for its smooth-projective case; the regular/imperfect
extension is the adapter proved here from normalization and GS 7.4.3.

**4. K₂(ℤ) upper generation.** Four new T.5 nodes give the actual proof:
the auxiliary finite-rank integer presentation, Silvester's monotone word
lemma, kernel containment in W_n, and stable upper generation. The auxiliary
rank-two group has Milnor Definition 10.4's conjugation relation; it is not
the ordinary presentation with only three-index relations. The reader
records the well-founded peak pair and all seven index cases, including the
actual word rewrites in Cases 4, 6 and 7 and the a=0 branches. The Case 7
inequalities are non-strict, as checked visually against printed p. 90.
The kernel proof uses norm-one prefixes, commuting last-column roots and
induction through the honest rank-two base. It never assumes stabilization
injectivity or that the rank-two auxiliary kernel has order two.

T.2's exact monomial-kernel/unit-symbol request includes the diagonal and
permutation reduction proof from Milnor §9. At rank n≥3 the only integer
unit symbol that remains is c={−1,−1}, with c²=1. This proves the upper bound
before using the real sign. The sign supplies c≠1 independently; K₂(ℚ)
does not supply any step of the integer generation proof.
Exact matrix checks verified every displayed rewrite for ε=±1, and a grid
over (a,b,c)∈[−6,6]³ checked the sufficient peak inequalities on 716 Case 4,
546 Case 5, 620 Case 6 and 508 Case 7 instances. Matrix equality alone is not
equality in a Steinberg group; the latter uses the specified defining
relations in the source proof.

**5. Higher-power local and étale Chern signs.** Milne III.3.6(a), III.4
Steps 2–4 and Remark 4.5 evaluate the positive ordered cup using Artin(b)
on an m-th root of a. The classical symbol here uses Artin(a) on a root of b;
skew symmetry gives exponent −e_m(inv β_ζ{a,b}), for every invertible m.
Root change multiplies β by u⁻¹ and cancels with ζ→ζ^u. Over Q₇ choose ζ
reducing to 2: X³−3 is irreducible mod 7, and residue Frobenius gives the
ratio 3²=2 mod 7. Reduction on μ₃ is injective, so inv β{3,7}=1/3 and the
classical symbol is ζ⁻¹. The Frobenius power computation is on the residue
field, not an assertion σ(α)=α⁷ in characteristic zero.

Soulé's **thesis** Proposition 2.2.2.3 gives coefficient −1 at
i=j=k=k′=1. The proof checks (M) for this output, pulls the external product
back along F⊗ℤF→F, and uses K.7's ordered unit product. Agreement on
Steinberg generators gives c₂,₂=−h. Prime-power coefficient naturality and
CRT give every invertible m; m=1 has zero coefficient module. M.3 remains
the owner of both maps and all arithmetic Tate/S-integer theorems. The cubic
test distinguishes the Chern invariant −1/3 from the positive cup's +1/3;
quadratic tests alone cannot fix either sign.

## Sources and baseline

The source files below were read on 6 October 2026; full SHA-256 hashes and
section lists are in the packet's `sources`/`sourceVersions`.

| Source | Sections used |
| --- | --- |
| [Gille–Szamuely, first edition 2006](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf) | 7.3.6–7.3.12, pp. 198–203; 7.4.1–7.4.4, pp. 204–206; A.6.4, p. 312; A.6.8(2), p. 313 |
| [Milnor, 1971 institutional scan](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu) | §9, pp. 71–78; §10, pp. 81–92, including the complete seven-case proof |
| [Milne, CFT v4.03](https://www.jmilne.org/math/CourseNotes/CFT.pdf) | III.3.6(a), pp. 108–109; III.4, pp. 111–114; VIII.5.6, pp. 245–246 |
| [Soulé, author-hosted typed June 1978 thesis](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf) | 2.2.1.1, pp. 34–35; 2.2.2.1–2.2.2.3, pp. 38–44 |
| [Stacks 032N](https://stacks.math.columbia.edu/tag/032N), [032O](https://stacks.math.columbia.edu/tag/032O), [032L](https://stacks.math.columbia.edu/tag/032L) | normal hull/pure-first reduction, polynomial N-2, separable trace finiteness |

The original K-book sources and version records are retained; V.1.2/1.2.1,
V.3.7.2/Ex.3.11, V.6.1.2 and V.6.6.1 were rechecked for the new contracts.
The published 1979 Soulé article and the original dissertation scan were not
compared. New source issue E12 is scoped to the author-hosted typed thesis:
the unconditional claim that a symbol-algebra class has exact order q fails
for a=b=1 over ℂ. It is recorded as a suspected author-copy error, requiring
unit inputs and “killed by q”; this is not used in the Chern proof.

Pinned baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The additional
baseline is Mathlib's actual `PresentedGroup` quotient and `toGroup` statement,
read at the pin. The existing pure polynomial normalization statement was
read in full, as were the existing separable finiteness and normalization
statements. No new library capability was inferred from a name search.
The reviewed library audit and the relevant owner roadmaps were read;
GlobalNumberFields and GlobalQuadraticForms were read end to end for density.

## Validation and remaining scope

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.3.json`:
  **0 errors, 0 warnings**. There are 68 nodes, 82 baseline declarations,
  15 planets, 32 requests and four remaining gaps. The checker counts 120
  definition/construction API items and 70 tests; the full packet totals are
  124 API items and 77 tests, as the reader records.
- JSON parsing, reader/new-node signature synchronization, `git diff --check`,
  original-node ownership/planet preservation and exact review/history
  preservation pass. The 169 internal prerequisite pairs are acyclic.
- Read-only hypothetical `build.assemble(require_distances=False)` with the
  research packet substituted for its promoted predecessor: 3,817 stages in
  both versions, and 10,208→10,211 stage-dependency pairs. No edge is removed.
  The three additions are K.7→T.7, AlgebraicCurves Layer 2→T.4 and
  LocalFieldsRamification Layer 3→T.4; none has a reverse path. The existing
  skipped CA.1→T.7 route is unchanged and remains the maintainer's ownership
  question already recorded in the packet. This check is not live promotion.
- The isolated Mathlib-only integer presentation, its APIs, three examples,
  Silvester statement and finite-kernel statement elaborate with `lean-check`
  at pinned Mathlib, with only `sorry` warnings. This isolated check excludes
  the compatible map to the companion stable Steinberg carrier.
- The isolated F₇ cubic residue computation elaborates without warnings,
  using `by decide`; the invariant-valued comparison still needs its supplier.
- **The complete suggested Lean file does not elaborate.** `lean-check` stops
  at the absent prebuilt `TauCeti/FieldTheory/FunctionField/Divisor/Eval.olean`,
  before checking declarations. Available memory exceeded 100 GB before the
  runs. No Lean server, library build, Lake update or cache download was used.
  Historical elaboration of an older file does not certify this revision.

The four retained gaps concern twisted coefficient modules, imported
arithmetic Tate/higher reciprocity supplies, the general Dennis–Stein proofs,
and the Keune–Loday relative comparison. This job resolves the five specified
older proof obligations at blueprint level; it does not complete those other
jobs or claim acceptance of the packet. Independent REV-FIX-…~2 must judge
the fixes and the supplied proof/import contracts.
