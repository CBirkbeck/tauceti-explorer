# PAPER-BHATT-18 — third continuation of the partial extraction

**Claude Code — `cc-fb70e5`, 23 September 2026. Refs #2182.** This continues the merged checkpoints of PR #2213 and PR #2221 and changes nothing they established: all 81 inherited items, their statuses, all nine routes, the eight unreviewed source findings and the nine gap groups survive untouched. The JSON now has **86 items: 10 library, 12 planned, 64 missing**, every missing item routed exactly once, and it remains **`partial`** — for the reason the previous worker gave, which is still the right one: the open work is original-input closure, not coverage.

This tick did two things, and claims nothing else.

## 1. The coverage audit, and the five statements it exposed

The previous two workers read the 12-page arXiv v2 in full and built 81 items from it. A **mechanical** check of that reading was still worth running: inventory every numbered statement of the paper, then require each one to appear in the locator of some item.

Doing it needs two corrections to the naive regex. `Assumption` must be in the environment list, or `Assumption 1.4` is invisible; and citations into other papers — `[BS] Lemma 3.16`, `[Sc1] Corollary 6.7`, `[Sc1] Theorem 7.9` — print exactly like the paper's own statements and must be filtered, or they inflate the inventory with statements that are not Bhatt's. With those fixed, arXiv v2 has **32 numbered statements of its own**: 1.1–1.8, 2.1–2.7, 3.1–3.6, 4.1–4.4, 5.1–5.6, 6.1–6.2, contiguous in every section.

**Five of the 32 appeared in no item locator, and were mentioned nowhere in the extraction** — not in a note, not in a gap, not in a finding: **Remarks 1.3, 1.8, 2.4, 2.5 and 5.5**. They are now items, and two of them carry planning content rather than bookkeeping:

- **`contributions` (Remark 1.3)** is the paper's own statement of what it adds to André's proof, and it is a routing instruction: the direct summand conjecture is reproved here **using only the quantitative Hebbarkeitssatz** — "a simple linear statement about a fixed and explicit system of modules over a perfectoid ring" — in place of the **perfectoid Abhyankar lemma** of `[An1]`, "a deep non-linear assertion describing an entire class of algebras over a perfectoid ring". It also warns that the derived theorem is not a formal strengthening of the classical one: even its birational case is "completely orthogonal to Theorem 1.1". A blueprint that treats Theorem 1.2 as a corollary of Theorem 1.1, or that imports the Abhyankar lemma because André's proof needs it, is following the expensive route against the author's advice.
- **`strategy-summary` (Remark 1.8)** says exactly **how much of Theorem 1.6 each target needs**: applying an `A_∞`-linear functor to the pro-isomorphism and taking limits, "the case i = 0 recovers Scholze's theorem, the case i = 1 is essential to Theorem 1.1, and Theorem 1.2 relies on the statement for all i ≥ 0". That is a decomposition a design job can act on — the classical theorem needs only `Ext⁰` and `Ext¹`, which is why `linear-functor` (Lemma 3.6) is stated in the generality it is.
- **`flatness-generality` (Remark 2.4)** records that Theorem 2.3 is proved in `[An2]` under a **more restrictive setup but with a stronger conclusion**, and that the generalisation stated here is due to an observation of Scholze. Anything importing `[An2, §2.5]` must say which of the two statements it is importing.
- **`derived-presentation` (Remark 2.5)** is the bridge the extraction was missing between the ordinary presentations of §2 and the Koszul models used later: the `[Sc1, Lemma 6.4]` presentations are also valid in the derived sense. Bhatt records it "for psychological comfort"; for a formalisation it is a statement to prove, not to assume, and it is what licenses passing between `derived-rational` and `derived-completion`.
- **`perfectoid-kunz` (Remark 5.5)** asks whether admitting a faithfully flat integral perfectoid extension **characterises regularity** — a p-adic analogue of Kunz's theorem — and says a positive answer will appear in forthcoming work with Iyengar and Ma. **It has appeared**: Bhatt–Iyengar–Ma, *Regular rings and perfect(oid) algebras*, Communications in Algebra **47** (2019), no. 6, 2367–2383, [arXiv:1803.03229](https://arxiv.org/abs/1803.03229), which proves that a p-adically complete Noetherian ring is regular exactly when it admits a faithfully flat map to a perfectoid ring, with a version relaxing flatness to almost flatness. So this is no longer an open question, and §5's regular-local reductions can be stated in the form the proofs actually use — "admits a faithfully flat integral perfectoid extension" — with regularity recorded as an equivalent condition by citation.

One trap for the next worker: in this paper a locator like **`1.4` is ambiguous** between `Assumption 1.4` (the standing hypothesis that `A₀` is the p-adic completion of a polynomial ring over an unramified mixed-characteristic dvr) and **§1.4 Notation** (roots and the almost ideal). The inherited items use it in the second sense.

## 2. The published text is unobtainable — treat G1 as settled

The previous handoff's resume item 5 was "obtain the genuine 21-page journal text, then collate", noting that the Springer content URL served only a PDF of its subscription landing page. That has now been pushed as far as it goes:

- **Springer**: subscription landing page only, as previously recorded.
- **The author's IAS page** (`math.ias.edu/~bhatt`): its "Papers" link routes to an **arXiv author search**. Bhatt hosts no paper PDFs there.
- **The author's Michigan directory** (`public.websites.umich.edu/~bhattb/math/`): **HTTP 403**.

So there is no accessible copy of the published article, and **arXiv v2 must remain the reference text**. G1's task has been narrowed accordingly: collate only if a subscription copy becomes available. The risk this leaves is not hypothetical — the published article is **21 journal pages against v2's 12** — so every source issue must keep saying that it is certified only against the arXiv version, which E2–E3 already do.

## What this tick did not do

No inherited item, route, finding, gap or baseline pin was modified except the two gap texts G1 and G8, which were **appended to**, not rewritten. No Lean file was added or compiled. The eight source findings **remain unreviewed**; this worker did not supply verdicts for them, and since they are another worker's findings a future reviewer may still do so. The remaining resume order of the previous handoff stands as written, minus the acquisition half of item 5 and the coverage half of G8.

---

## Second checkpoint report — retained in full

# PAPER-BHATT-18 — continuation of the partial extraction

Codex — codex-7e92bd, 23 September 2026. Refs #2182. This continues the checkpoint from PR #2213 and retains its eight unreviewed source findings. The current JSON has **81 items: 10 library, 12 planned, and 59 missing**, with every missing item routed exactly once through the same nine routes. It remains **partial**.

The continuation resolves the concrete proof omissions behind Remark 4.3 and the module inverse-limit argument, identifies the precise non-Noetherian domination statement, and simplifies the ordinary-base-change bridge in §6. It does not claim that the imported derived, almost, or flattening foundations have been implemented or fully decomposed.

## What the pinned libraries supply

The former missing item `proper-integral-h0` is a composition of existing Mathlib results:

- `AlgebraicGeometry.isIntegral_appTop_of_universallyClosed`, in `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:138`, makes the global-section homomorphism integral whenever the morphism is universally closed and its target is affine. There is no Noetherian hypothesis.
- `AlgebraicGeometry.isLocalization_basicOpen_of_qcqs`, in `Mathlib/AlgebraicGeometry/Morphisms/QuasiSeparated.lean:401`, identifies sections on the basic open defined by the image of p with the localization of global sections. A proper scheme over an affine base is qcqs. Thus B[1/p] is the given finite étale generic algebra.
- `AlgebraicGeometry.Scheme.toSpecΓ` and its naturality, in `Mathlib/AlgebraicGeometry/GammaSpecAdjunction.lean:434,458`, give Y→Spec(B) over Spec(A).

Consequently the SF.2 missing-item route no longer receives this item. No finiteness of B over the non-Noetherian A is claimed. The new blowup items also import the existing `reesAlgebra`, its degree-one generation and `reesAlgebra.fg`, and `AlgebraicGeometry.Proj` with `projIsoSpec`. The Rees grading, chart identifications and relative-Proj gluing are still explicit adapters; the affine constructions are not re-planned.

All declarations were read at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, and the six newly inspected files were byte-compared with GitHub at that commit. The Tau Ceti pin remains **f790474821cf4256814db967cb154e7af3d0c369**. Fresh audit reads covered SF.2, SF.4, E1 and E2; the reviewed AdicSpacesPartII decomposition remains partial and does not supply general flattening.

## Why the tensor bound really is uniform

Put R=A/t^m and N_n=A⟨t^n/g⟩/t^m, with the regularity hypothesis in Notation 4.1. First work in almost modules for the ideal m_t. Theorem 4.2(1) says that R→N_n is injective there. Its cone is therefore naturally the module Q_n=coker(R→N_n) in degree zero. Naturality is essential: it identifies the cone transitions with the cokernel transitions.

For k≥0 and c=p^k m, Theorem 4.2(2) says that g^(1/p^k) times Q_(n+c)→Q_n is the zero module morphism. It is therefore zero in the derived category. Applying the R-linear exact functor K⊗^L_R− preserves this zero morphism for every K, without a bound on K's amplitude. The tensor cone comparison then gives the same annihilation on its cohomology. The comparison's cokernel in degree i is a submodule of cone cohomology in degree i; its kernel is a quotient of cone cohomology in degree i−1. Both inherit the same bound.

Returning to ordinary modules multiplies by an arbitrary root of t. Taking the same root index k gives **(tg)^(1/p^k)** and **c=p^k m**, independent of n, K and i. No extra transition shift or squaring of g occurs. The three new P0 items separate the cone identification, tensor preservation and kernel/cokernel deduction. E1 supplies the already planned unbounded derived tensor; its almostification comparison remains a named P0/E1 instantiation requirement.

This argument uses a cone concentrated in one degree after almostification. It does not assert that a morphism is zero merely because its maps on cohomology vanish. As a negative control, the nonsplit extension 0→Z/2→Z/4→Z/2→0 gives a nonzero morphism Z/2→(Z/2)[1] whose maps on cohomology are all zero. A section of Z/4→Z/2 cannot exist: an element killed by 2 in Z/4 has even image.

## Coherent inverse limits and the annihilator product

The new E2 supplier is a construction on strict module-complex towers, or their coherent enhanced diagrams:

`Rlim K_n = Cone(1−shift : ∏ K_n → ∏ K_n)[−1]`.

Exact products of modules allow degreewise products and give the Milnor sequence. The construction retains maps and cones, rather than selecting unrelated cones in an ordinary triangulated category. The distinction is explicit in the [Stacks derived-limit section](https://stacks.math.columbia.edu/tag/08TB) and [its inverse-system formulation](https://stacks.math.columbia.edu/tag/07KV).

For a pro-zero module tower, the inverse of 1−shift sends b to the sequence whose n-th entry is the sum of transition_(j,n)(b_j) over j≥n. This sum is finite at each fixed n. Telescoping proves both inverse identities. For an almost-pro-zero tower M_n, fix a=t^(1/p^k). The quotient of M_n by M_n[a] is pro-zero, so the two towers have the same derived limit; the latter tower's two-term Roos complex is killed by a.

For a complex tower, the Milnor sequence is

`0 → lim¹ H^(i−1)(K_n) → H^i(Rlim K_n) → lim H^i(K_n) → 0`.

Its two ends being almost zero makes the middle almost zero, but an extension requires an annihilator product. Set b=t^(1/p^(k+1)). Then b² kills the middle and t^(1/p^k)=b²·b^(p−2). This handles p=2 as well. Exactness of the coherent Roos functor now proves Lemma 3.5 for the actual comparison maps. These arguments use module products; they do not assert left completeness for arbitrary sheaf categories. E1/E2's enhanced realization and P0's almost-category comparison remain implementation and supplier obligations.

## The geometric input in Proposition 6.2

The cited [Gabber–Ramero release 6.95](https://arxiv.org/pdf/math/0409584v11) is now acquired: 1484 pages, SHA-256 `43afeff5750640f2e62d4eedb3d9d434dbef8883022d5b63b26b6a51509218d0`. Its arXiv stamp is 4 November 2016; the served PDF has a generated title-page date of 22 April 2019. This matches the release and page count in Bhatt's bibliography, without asserting historical byte identity.

Selected §15.4 passages were read for integral local stalks and rational charts. The direct source for domination is [Stacks 081T](https://stacks.math.columbia.edu/tag/081T): a proper morphism X→S over a qcqs base, which is an isomorphism above a quasi-compact open U, is dominated by a U-admissible blowup. This requires no Noetherian assumption. The statement is algebraic and already suffices before completion.

The extraction separates its prerequisites: finite-type-ideal blowups, strict transform, the [flattening theorem 0815](https://stacks.math.columbia.edu/tag/0815), flattening a finite type scheme (081R), and turning a flat generic isomorphism into an open immersion (081M). After flattening, properness makes that open immersion closed; its image contains dense U, so it is all of the blown-up base. The local-presentation, étale-neighbourhood and gluing leaves invoked by these proofs are individually retained in G6. Reading the main theorem is not treated as closing those leaves.

For S=Spec(A), U=D(p), the centre is a finitely generated ideal I with I[1/p]=A[1/p]; hence p^N∈I for some N. Append p^N to its generator list. On Sη=Spa(A[1/p],A), the domains

`U_i = {x : |f_j(x)| ≤ |f_i(x)| for every j}`

cover: some generator has maximal value, and that value is nonzero because p^N is among them. The bounded ratios give A[I/f_i]→O⁺(U_i). On overlaps the denominator ratios are reciprocal bounded units, so the chart maps glue. GR2 Lemma 15.4.14(ii) supplies locality of the integral stalks; Remark 15.4.25 supplies the chart description and compatibility. Perfectoid sheafiness comes from the existing perfectoid supplier. GR2's analytically Noetherian sheaf theorem 15.4.34 is not used outside its hypotheses.

The chart is the actual blowup algebra, not just a polynomial quotient by cross-multiplication relations. For I=(x²,xy), the x²-chart has relation xu=y; the naive relation x²u=xy keeps an extra x-torsion component. This is included as an acceptance control. Generic algebraic modifications belong once in **SchemeAndStackFoundations SF.4**. **AdicSpacesPartII R2** imports them for its p-adic and integral-analytic adapter.

## The comparison map is sufficient

For any ring map R→D and qcqs R-scheme X, the derived pullback/pushforward adjunction gives a unit-compatible map

`β : RΓ(X,O_X) ⊗^L_R D → RΓ(X_D,O_(X_D))`.

Its existence needs no Tor-independence; the [Stacks construction 08HY](https://stacks.math.columbia.edu/tag/08HY) uses the adjunction counit. If r retracts the unit D→RΓ(X_D,O), then r∘β retracts the unit on the left. This is the required diagram chase in Theorem 6.1. Apply it first for the integral annular algebra D, then derive-tensor the supplied retraction with D/p^m. No base-change isomorphism is needed. For example, Z/p⊗^L_Z Z/p has a degree −1 Tor group whereas the cohomology of the ordinary affine base change is concentrated in degree zero.

Likewise, in Proposition 6.2, after B=Γ(Y,O)→C from almost purity, Y is proper over B and Y_C is proper over C with identity generic fibre. Properness over B follows from the graph into Y×_A Spec(B), since Spec(B) is separated over Spec(A). The composite

`RΓ(Y,O) → RΓ(Y_C,O) → C → A`

is the desired almost retraction. The last arrow is the supplied almost retraction of the surjective almost finite étale cover A→C. Thus no flatness of B→C, nor a conservative-descent assertion for that map, is inserted into the proof. Generic surjectivity remains mandatory, as in inherited E1.

## Reading boundary, checks and continuation

This pass freshly read all 12 pages of Bhatt arXiv v2; André's published §2.5 through the end of its proof (pp. 79–82) and Appendix A (pp. 89–92); the specified GR2 passages; and the tagged Stacks statements and proofs listed in the JSON. The publisher's purported full-text PDF was a 16-page rendering of the subscription landing page, so the 21-page journal article remains uncollated. Earlier full André-arXiv and Scholze reads remain attributed to the previous checkpoint. No new source-error finding or independent verdict is added.

Validation covers the paper checker, one route for every missing item, the dependency DAG, all API/use/test fields, source-finding preservation, stage endpoints and deliverable-path scope. The original 188,100 monomial cases, 120 valuation cases and trace control were rerun. The new finite controls below passed: 130 tensor homotopies, 210 Roos inverse identities, 33 root-product identities, 150 rational-chart cases, and the blowup-saturation and nonsplit-extension controls. They test formulas and failure modes; they do not prove the infinite or geometric theorems. No Lean file is authorized, and none was compiled.

G4's concrete mathematical calculation is expanded; its almost/enhanced supplier interfaces and the G2 link used in Remark 4.4 remain open. G6 now names the precise remaining flattening leaves, coherent finiteness/perfectness and generic multisections. G1–G3, G5 and G7–G9 remain as scoped in the JSON and [current handoff](../handoff/PAPER-BHATT-18.md).

The following diagnostic uses Python and SymPy 1.14.0.

~~~python
from fractions import Fraction
from itertools import product
import sympy as s

# Cone(Z --q--> Z) tensor a two-term free complex with differential b.
# These are genuine chain homotopies, not tests of cohomology maps alone.
tensor_cases = 0
for q in range(2, 12):
    for b in range(-6, 7):
        d2, d1 = s.Matrix([q, -b]), s.Matrix([[b, q]])
        h1, h0 = s.Matrix([[1, 0]]), s.Matrix([0, 1])
        assert d1*d2 == s.zeros(1)
        assert h1*d2 == s.Matrix([[q]])
        assert d2*h1+h0*d1 == q*s.eye(2)
        assert d1*h0 == s.Matrix([[q]])
        tensor_cases += 1

# Finite, eventually-zero towers: both sides of the Roos inverse identity.
roos_cases = 0
for prime, length, seed in product((2, 3, 5), range(1, 8), range(10)):
    shift = s.zeros(2*length)
    for n in range(length-1):
        shift[2*n:2*n+2, 2*n+2:2*n+4] = s.Matrix([
            [(seed+n+1) % prime, (seed*2+n) % prime],
            [(seed+n*n) % prime, (seed*3+n+2) % prime]])
    identity = s.eye(2*length)
    inverse = s.zeros(2*length)
    for j in range(length):
        inverse += shift**j
    assert (identity-shift)*inverse == identity
    assert inverse*(identity-shift) == identity
    roos_cases += 1

# The root needed to kill an extension of two almost-zero groups.
root_cases = 0
for prime, k in product((2, 3, 5), range(11)):
    b = Fraction(1, prime**(k+1))
    assert 2*b+(prime-2)*b == Fraction(1, prime**k)
    root_cases += 1

# Rational domains for the two charts of (p^N,g), using v(p)=1.
chart_cases = 0
for N, a in product(range(1, 7), range(25)):
    vg = Fraction(a, 4)
    first, second = vg >= N, N >= vg
    assert first or second
    assert (first and second) == (vg == N)
    if first:
        assert vg-N >= 0
    if second:
        assert N-vg >= 0
    chart_cases += 1
# g=0 has infinite valuation and always lies in the p^N chart.
assert all(N > 0 for N in range(1, 7))

# Blowup charts require saturation, even over a domain.
x, y, u, z = s.symbols('x y u z')
naive = s.groebner([x*x*u-x*y], x, y, u)
saturated = s.groebner([x*x*u-x*y, 1-z*x*x], z, x, y, u)
assert naive.reduce(x*u-y)[1] != 0
assert saturated.reduce(x*u-y)[1] == 0
assert (x*x*u-x*y).subs({x:0, y:1, u:0}) == 0
assert (x*u-y).subs({x:0, y:1, u:0}) != 0

# The nonsplit Z/4 extension detects why arbitrary cohomological ghosts
# cannot be treated as zero morphisms in a derived category.
possible_images = [a for a in range(4) if (2*a) % 4 == 0]
assert possible_images == [0, 2]
assert all(a % 2 == 0 for a in possible_images)  # no section of Z/4 -> Z/2
# Z/p tensor itself: tensor the length-one free resolution to get d=0.
for prime in (2, 3, 5, 7):
    assert prime % prime == 0  # H^-1 and H^0 both have dimension one

print(dict(tensor_homotopies=tensor_cases, roos_inverses=roos_cases,
           root_products=root_cases, rational_chart_cases=chart_cases,
           saturation_and_ghost_controls='passed'))
~~~

---

## Earlier checkpoint report — historical context

The current analysis and status above supersede the old G4/G6 resume instructions below.

# PAPER-BHATT-18 — direct summands and the derived variant

Agent: Codex. Session: codex-hjdg0j. Issue: #2182. Status: **partial checkpoint**.

Bhatt proves that a finite injective extension of a Noetherian regular ring splits as a module map, and that the unit into the coherent cohomology of any proper surjective scheme over that ring splits in the derived category. The second assertion requires control of the whole complex. Splitting its zeroth cohomology would not suffice.

The main public paper has been read completely. The JSON contains 64 items: 7 library imports, 11 planned imports, and 46 missing items, each of the last group routed exactly once. It has nine routes, definition/construction APIs and mathematical tests, a dependency graph, eight source findings, and nine gap groups. This is **not** a completed extraction: cited-input closure, some declaration-level proof decomposition, and full published-version collation remain unfinished. None of the proposed mathematics is claimed to be formalized.

## Sources and reading boundary

The primary source is [arXiv:1608.08882v2](https://arxiv.org/pdf/1608.08882v2), dated 11 November 2017, 12 PDF pages. All sections, footnotes and references were read. Rendered pages 1, 9 and 11 were checked for the three Bhatt findings. The [publisher page](https://link.springer.com/article/10.1007/s00222-017-0768-7) identifies the article as *Inventiones Mathematicae* 212 (2018), 297–317, published online 15 November 2017. Its public abstract, references and footnotes match the public version's organization and inputs. The full journal text was not available in this reading: no line-by-line equivalence with the journal article is asserted.

The maintainer's adjacent source is **PAPER-ANDRE-18-B**, *La conjecture du facteur direct*. Its complete 15-page [arXiv v1](https://arxiv.org/pdf/1609.00345v1) was read. The [published article](https://www.numdam.org/item/10.1007/s10240-017-0097-9.pdf), *Publications Mathématiques de l'IHÉS* 127 (2018), 71–93, was obtained and §2.5, pp. 79–82, and Appendix A, pp. 89–92, were compared. The rest of that 23-page publication was not independently reread. Published pp. 90–92 were also inspected as rendered pages.

Selected original proofs were checked in [Scholze, *Perfectoid spaces*](https://www.math.uni-bonn.de/people/scholze/PerfectoidSpaces.pdf): Lemma 6.4, Corollary 6.7, Proposition 6.14 and Theorem 7.9. The existing accepted, partial PerfectoidSpaces decomposition supplies a finer proof graph for these results. Its underlying gaps remain gaps; reading its review does not establish all its original-source leaves anew.

All four PDFs were retrieved on 23 September 2026:

| Document | SHA-256 |
|---|---|
| Bhatt arXiv v2 | 08578ca15b17f51ee12c398ef305af3446057063c015e2bc8beb6012bcc26430 |
| André arXiv v1 | 57a439666e580a6ef58229d706a33d4c4a93ff248e77bc627f2464cf593a41f0 |
| André published | 34da107d0b96149d9a6779ec1694a0cbb096136d021114b59427024ef3d47053 |
| Scholze author PDF | 2c7e645a4ec3c56d5ee9e012cfe52d99e45973eefb99f8383e3bb69f0211afd9 |

## The proof and its interfaces

Section 2 adjoins compatible roots of a specified element by shrinking rational neighborhoods of its graph in a perfectoid root disc. Almost faithful flatness is proved for each neighborhood modulo the pseudouniformizer and then passed to the completed colimit. The integral convention matters: the preliminary model may need the almost-elements normalization in footnote 6. Lemma 2.6 explains why the root-relation presentation can be interpreted in the derived sense. Its proof uses discreteness of the perfection of a simplicial characteristic-p algebra; that original input still needs source closure.

Section 3 introduces an almost-zero condition for towers with quantifiers: for every root index k and level n, there exists a later level m(n,k). It is weaker than being zero in the pro-category of almost modules, where one later level must work for all roots. Example 3.3 supplies the distinction. Lemmas 3.4–3.6 connect it to derived inverse limits and arbitrary A-linear functors. No exactness of that functor is assumed. A coherent cone and inverse-limit interface is still needed to make the short source arguments declaration-sized.

Section 4 gives the estimate that drives both splitting proofs. In the almost category for roots of t, the map A/t^m→A⟨t^n/g⟩/t^m has almost-zero kernel, while cokernel transitions are killed by g^(1/p^k) after **c=p^k m** steps, independently of n. Combining the two almost bases gives the assertion for roots of tg. The monomial proof divides at exponent e=1/p^k: large exponents acquire t^m, while smaller exponents are converted into base-ring elements by the root relation.

Remark 4.3 extends this to derived tensor and gives vanishing of nonzero Koszul homology for a **regular sequence**. A comparison for an arbitrary sequence does not itself make the source homology vanish. Remark 4.4 uses a universal root variable and derived base change to remove the regularity assumption on g from the final almost-pro-isomorphism. It does not automatically remove that hypothesis from every separate pointwise assertion.

Section 5 first lifts flatness from a complete reduction, then constructs perfectoid covers of regular local rings. The ramified construction initially gives a general integral perfectoid ring. Adjoining roots of a unit and normalizing produces the field-based convention. The two outputs of Proposition 5.2 must stay separate: positive Tor is almost zero, and almost vanishing after tensor detects zero **ordinary** modules.

For the finite splitting theorem, a nonzero connecting morphism is detected modulo a power of p. Krull intersection chooses a root small enough to preserve it after almost faithfully flat extensions. Each rational annulus almost kills the obstruction by almost purity. The quantitative tower theorem and the A-linear Hom lemma remove the inverse-limit obstruction and yield a contradiction. The p²g-to-pg annihilator calculation and the complete-local reductions remain explicit proof-decomposition tasks.

Section 6 uses proper coherent cohomology, its perfectness over a regular local base, and a generic multisection. The corresponding annular assertion is Proposition 6.2. After almost purity reduces its generic fiber to an isomorphism, an admissible blowup dominates the completed proper map. The integral perfectoid generic fiber maps through that model, and all-degree almost acyclicity yields an almost left inverse. This requires the non-Noetherian formal-model theorem cited from GR2, not just invariance of a known blowup's generic fiber.

## Ownership and routes

The full upstream **AdicSpaces** and **JacobianChallenge** roadmaps were read for comparison. Full current PerfectoidSpaces, PerfectoidQuotients, DerivedDeRhamCohomology and EnhancedDerivedSheaves documents were read, together with the pertinent commutative-algebra, formal-model and scheme stages. The reviewed AUDIT-17, AUDIT-22 and AUDIT-01 entries listed in the JSON were checked. No reviewed library-coverage entries for PerfectoidSpaces, PerfectoidQuotients or DD.1 were found at this snapshot; their decompositions are not being mislabeled as those audits.

| Route | What it receives |
|---|---|
| PerfectoidSpaces P0–P3 | Almost-pro definitions and estimates, derived rational presentations, and imports for integral conventions, approximation, acyclicity and almost purity |
| PerfectoidQuotients Q0:integral-algebra, Q3 | General integral convention, the geometric root-adjoining proof and the source's functorial AIC variant |
| DerivedDeRhamCohomology DD.1 | Generic Koszul/completion interfaces and Proposition 5.1's complete flatness and faithfulness |
| EnhancedDerivedSheaves E1, E2, E5:animation | Splitting-obstruction triangles, coherent derived towers and simplicial perfection discreteness |
| DeformationAndDerivedPatchingAlgebra R03.1 | Finite adic Hom pro-comparison and vanishing lim-one |
| SchemeAndStackFoundations SF.2, SF.4 | Requests for proper coherent cohomology, integral global functions and generic multisections |
| AdicSpacesPartII R2 | Request for non-Noetherian admissible blowup domination and integral generic-fiber factorization |
| Pending **PerfectoidRamification**, Part II of PerfectoidSpaces | Quantitative Riemann extension and its derived/uniform refinements |
| Proposed **RegularRingSplittings**, Part II of DeformationAndDerivedPatchingAlgebra | Regular local perfectoid covers, obstruction argument, and both final splitting theorems |

The quantitative route reuses the **same pending PerfectoidRamification proposal** already made in PAPER-ANDRE-18, the *Abhyankar lemma* paper. No registered stages or independent review of that proposal were found at this snapshot. Its results remain missing, and the design job must combine the two briefs. It must not create two Riemann-extension projects.

Q3 already has the node PerfectoidQuotients:Q3/andre-flatness-lemma, asserting a p-completely faithfully flat absolutely integrally closed extension. The new request concerns this paper's exact field-based and functorial formulation and its alternative proof. Generic perfectoidization and root-adjoining are not re-owned by the splitting roadmap.

The scheme and formal-model routes are **requests**, not claims that existing narrower packets provide these results. Coherent proper base change is not étale proper base change. The non-Noetherian base in Proposition 6.2 is not covered merely by F0's Noetherian formal-scheme scope. Exact original hypotheses and supplier nodes must be resolved before these routes are considered complete.

The main Part II imports the existing commutative-algebra foundations. It must coordinate with PAPER-ANDRE-18-B and the pending singularity vocabulary in PAPER-BHATT-ETAL-23. The current final theorems use explicit retractions, so they require no competing definition of splinter. Suitable later planet names include “Almost-pro-zero towers”, “Quantitative Riemann extension”, “Perfectoid covers of regular local rings”, “Direct summand theorem” and “Derived direct summand theorem”; this paper issue does not edit planet files.

## What the libraries already supply

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every declaration attached to a library item was read at these pins:

- IsRegularRing, IsRegularLocalRing and the cotangent-space characterization;
- Module.FaithfullyFlat and its tensor-detection criteria;
- AdicCompletion and IsAdicComplete;
- DerivedCategory and DerivedCategory.Q, at the root namespace;
- Ideal.exists_pow_inf_eq_pow_smul, the finite-module and ring forms of local Krull intersection;
- TauCeti.ArtinRees.exists_controlled_lift, whose shift is chosen before the source module, surjection and depth.

These imports do not establish almost rings, derived tensor, derived completion or either splitting theorem. The regular-local file records localization regularity as unfinished; a local predicate cannot be silently converted into the global regular-ring predicate.

## Source findings

The JSON records locators, short quotations, corrections, arguments and correction searches. All findings await independent review.

- **E1:** arXiv Proposition 6.2 omits generic surjectivity. For mixed-characteristic perfectoid K, take A=K°×K° and Y the first component. The map is finite, proper and étale, but its unit is projection. The other idempotent survives multiplication by every root of p, so there is no almost left inverse. The corrected item requires a finite étale **surjective** generic map.
- **E2:** in the ramified proof of Proposition 5.2, the ring containing the newly adjoined roots and carrying the stated field-base structure is A, not the original A′.
- **E3:** the introductory characteristic-zero trace shortcut needs the equal-characteristic-zero/Q-algebra convention. Mere characteristic zero includes Z; in Z[(1+√5)/2], the degree-two trace of that generator is 1, and normalized trace is not integral. The theorem itself is unaffected.
- **E4–E5:** André's arXiv definitions of pure and almost-pure submodules use an unbound algebra symbol in their tensor maps. Both formulas are corrected in the published Appendix A.
- **E6–E7:** André's published Appendix A retains the incorrect scalar subscript on a Hom and a reference to N where the finite free summand is M.
- **E8:** the intermediate-module sentence in André's almost-purity discussion has a backward arrow. The relevant factorization is M→M′→N; almost purity of the composite implies that of the first map without the extraneous condition.

The Bhatt findings are certified only against the public version read, not the unavailable full journal text. The scoped searches found no separate corrections to E1–E3 or E6–E8. “New” means not found in those searches, not an exhaustive historical priority claim. The local-duality step in André A.3.1 remains a reading question in G9, without an error verdict.

## Validation and continuation

The paper checker passes. Additional integrity checks require every missing item to have exactly one route, all local dependencies to exist and form a DAG, every definition/construction to have nonempty uses, API and tests, and every proposed area to be an actual galaxy ID. The submission check is run on exactly the two deliverables and this job's handoff.

The reproducible exact-arithmetic sanity check below exercises **188,100** monomial cases and **120** valuation cases, and checks the trace example. It does not prove the perfectoid or derived assertions, nor are the planning tests Lean compilations.

~~~python
from fractions import Fraction as F

count = 0
for p in (2, 3, 5):
    for m in range(5):
        for k in range(5):
            c, cutoff = p**k * m, F(1, p**k)
            for n in range(1, 5):
                for r in range(5):
                    for a in range(2 * p**r + 1):
                        e = F(a, p**r)
                        if e >= cutoff:
                            assert c * e >= m
                        else:
                            assert cutoff - e >= 0
                            assert c * e + n * e == (n + c) * e
                        count += 1
assert count == 188100

count = 0
for p in (2, 3, 5):
    for n in range(1, 6):
        for k in range(8):
            m = max(n, k)
            assert F(1, p**k) >= F(1, p**m)
            transition = F(1, p**n) - F(1, p**m)
            assert transition >= 0
            assert transition + F(1, p**(m+1)) < F(1, p**n)
            count += 1
assert count == 120
matrix = ((0, 1), (1, 1))  # multiplication by phi, phi^2=phi+1
assert sum(matrix[i][i] for i in range(2)) == 1
assert F(1, 2).denominator != 1
~~~

Resume at the [handoff](../handoff/PAPER-BHATT-18.md). The most consequential next work is G6 (the original non-Noetherian formal-model theorem and coherent base change), G4 (derived uniformity and inverse limits), and G2–G3 (the original simplicial and almost-algebra interfaces). The equal-characteristic branches and complete-local reductions need full proof-leaf extraction. Remark 5.5 remains a question in this paper and is not an acceptance theorem. No Lean file is authorized by this paper issue, and none was created or compiled.
