# PAPER-HE-18 — Newton cocenters and invariant distributions

Codex — `codex-7e92bd`, continuing `codex-a71f92`. Refs #1406.

This is a partial research checkpoint, not a formalization or a proof-closure certificate. The published paper has been read completely, and the extraction covers its main definitions, numbered results and proof inputs. The JSON now contains 100 items (4 library, 9 planned, 87 missing), 265 internal dependency edges, 37 definitions/constructions with 112 API entries and 111 specified tests, seven routes, eight tracked research frontiers and ten source findings awaiting independent review. G5 and G7 now have explicit conditional arguments; the actual local-group and filtration producers remain open. Every missing item has exactly one route. Every implementation status is unchecked.

The main output is a distinct continuation, **Smooth representations of local groups, Part II: Newton cocenters and invariant distributions**. It imports the existing test-function and local-group foundations and the already proposed affine-Coxeter extension. Several printed statements cannot be used in their original generality. The corrected scopes, counterexamples and proposed replacement proof are part of the extraction, not silent edits to the source.

This continuation supplies a finite Ω-normalization argument for compact Newton cores and same-level cocenter generators, and a finite-subword/affine comparison proof for Newton separation. These remove two separate defects in the proposed proof route without assuming that length detects central translations. The conditional scope is stated in Section 5.

## 1. Sources and conventions

**Current reading.** `codex-7e92bd` reread all 27 published pages, including every proof and references, on 2026-09-22. The current PDF hash is `321f4c427c92352c4a34b6dbbff93aee2b402a031e12537125ed88285b601b52`. Selected HN14 author-final passages were reread (pp.4–6,10,12–15); the exact scope and hash are in `source.continuation`. The finite/reduced HN carrier is still distinguished from the actual local-group adapter.

**Inherited source history.** The following acquisition and supporting-source record belongs to the first checkpoint; it is not a claim of fresh full rereading of each supplier.

The primary source is Xuhua He, [Cocenters of p-adic groups, I: Newton decomposition](https://doi.org/10.1017/fmp.2018.1), Forum of Mathematics, Pi 6 (2018), e2, 27 pages. All published pages, including every proof and the references, were read. The acquired Cambridge PDF has SHA-256 `9ea0eb141f3340c146e4306ebb234ee0d2cfe9abdb9a20cd4ef25f2aa3b047af`, accessed 22 September 2026. The article is open access under CC-BY; no downloaded source files or download-identifying footer are included in this submission.

The [arXiv v3](https://arxiv.org/pdf/1610.04791v3) comparison has SHA-256 `605d7e9cbf381d482969cd5ced70eb501d13df7614f91145d3986a3eb6115b7c`. Its §1.4, §2.1–2.4 opening, all §5 and §§6.3–6.4 were compared. It was not reread completely. Its 20-page numbering differs from the publication, so all main locators below use the publication. The images of published pages 9 and 24 were inspected to check the Ω assertion and graph direction independently of text extraction.

The supporting reads are:

- [Richarz, On the Iwahori Weyl group](https://www.numdam.org/item/10.24033/bsmf.2708.pdf): all eight article pages, including the actual quotient, parahoric Bruhat comparison, Frobenius descent and rank-one cardinality proof.
- [He–Nie, author-final Minimal length elements of extended affine Weyl groups](https://archive.ymsc.tsinghua.edu.cn/pacm_download/315/8989-affmin-2.pdf): introduction, all §§1–2 and §3 through Theorem 3.4, with proofs. This is not the old 2011 arXiv version used for some earlier HE21 reconnaissance.
- [Haines–Rapoport, On parahoric subgroups](https://math.umd.edu/~tjh/HRParahoric3.pdf): setup, Definition 1, Proposition 3(a)–(c), and the passage around Proposition 13 including its proof and Lemma 14's statement. Its strictly henselian field and torus/inertia hypotheses matter.

Hashes and exact read boundaries are in the JSON. Bruhat–Tits, Tits's local-group chapter, Vignéras I§2, the finite-Weyl He–Nie predecessor and He's partial-conjugation paper remain named source frontiers. They are not presented as completely read or recursively closed.

Throughout, F is a nonarchimedean local field with finite residue field of characteristic p, G is the rational-point group of a connected reductive F-group, I is the chosen Iwahori and I' its pro-p radical. R is a commutative Z[1/p]-algebra. Test-function coefficients have the discrete topology; Haar integration is an algebraic finite-sum construction normalized by μ(I')=1, not a presumed R-valued analytic measure.

The twist preserves the apartment data and I, has finite order on the apartment and Iwahori–Weyl group, and need not have finite order on all of G. The character ω:G→R× has open kernel. Our convention is
$$
T_xf(g)=\omega(x)f(x^{-1}g\theta(x)).
$$
Thus $T_xT_y=T_{xy}$, and support is transported by $U\mapsto xU\theta(x)^{-1}$. The dual action uses $x^{-1}$.

A cocenter is a module quotient by a commutator submodule, not a center and not generally an algebra quotient. At congruence level, the paper's explicit §4.2 definition is the **image in the ambient cocenter**. The introduction's shorthand must not be used to assert injectivity of an intrinsic level cocenter.

## 2. What the paper contributes

The progression is from affine Weyl combinatorics to a partition of G, then to a direct sum of test modules, and only then to the cocenter and its distribution dual. Finiteness of a compact support and finiteness of all minimal representatives in a fixed invariant fibre are different statements. The first survives the central-twist counterexample; the second needs a scope repair.

| Published result | Extraction | Exact output or restriction |
| --- | --- | --- |
| Proposition 1 | H11 | Twisted convolution commutators equal weighted action-coinvariant relations |
| Theorem 3 | N8 | Newton partition of G; actual-lattice and power-growth proof gaps retained |
| Theorem 4 | C5 | Affine twisted RedMin, importing the existing root continuation |
| Proposition 5 | N5 | Compact subsets are contained in finitely many Newton strata |
| Theorems 6 and 7 | C7, C9 | Straight-class classification and standard-triple reduction |
| Corollary 9 | C11, C12 | Finite minima remain guarded; C17 removes that guard from class fibres |
| Theorem 10(1),(2) | N13, N16 | Separate direct-sum decompositions of tests and cocenter |
| Theorem 11(1),(2) | L15, L14 | Separate level-image decomposition and minimal-cell generators |
| Corollary 12 | L16 | Global minimal-cell generators, not a free-basis assertion |
| Proposition 13 | L10 | Length-additive congruence convolution with coefficient μ(I_n) |
| Lemmas 15 and 16 | L4, L8 | Fixed-coset descent and q to the residue-split-length count |
| Lemma 17(1),(2) | L12, L13 | Equal-length equality and decreasing two-term containment |
| Theorems 18 and 20 | F4, F3 | Field-valued finiteness via C17/L18, conditional on the local producers |
| Valid primal content of the Theorem 20 proof | F2 | General-ring finite generation of the level cocenter component |
| Proposition 21 | R7 | Cover of the rigid part by twisted translates of standard parahoric cosets |
| Theorem 22 | R15 | Compatible product of local invariant distributions |
| Theorem 23 | R16 | Corrected inverse-graph presentation; direct proof proposed below |

The auxiliary inventory includes the local double Tits datum, actual Iwahori–Weyl quotient, Moy–Prasad levels, integral volumes, compact-level basis, generic library coinvariants, Newton affine axes, length-sensitive Bruhat multiplication, clopen/admissible support, zero extension, fixed-coset Lang lifting, root-depth product coordinates, reduced-word contracted products, adjacent-depth containment, standard-triple representatives, Newton Levi subgroups, standard pairs and finite clopen refinements.

The internal graph exposes these inputs instead of hiding “Bruhat–Tits theory” or “duality” inside a main theorem. It is acyclic, but acyclicity does not close G1–G8. In particular C15 records the exact partial-conjugation reduction statement and C16 the axis/parabolic factorization; neither is replaced by the conclusion of RedMin.

## 3. Library reuse and one-owner routing

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Names were not treated as evidence without reading the source statements.

Mathlib already has `CompactlySupportedContinuousMap`. With discrete R, `IsLocallyConstant.iff_continuous` identifies this with the desired compactly supported locally constant carrier. H1 is therefore a library item. Its module structure is usable, but its multiplication is pointwise. The integral Hecke convolution is still a separate construction.

Mathlib also has `Representation.Coinvariants`, its relation submodule, surjective quotient map, arbitrary-target lift and uniqueness. H7–H8 are exact library ingredients. H9–H12 supply the weighted Hecke representation and its comparison with convolution commutators; they do not recreate abstract quotient theory.

Other read ingredients include clopen indicator extension, open-subgroup topology, finite quotients under a **compact ambient group** hypothesis, Tau Ceti's compact-ambient locally constant stabilizer theorem, actual Hecke coset/decomposition carriers and abstract Tits-system Bruhat products. The stabilizer theorem does not by itself prove a uniform level for a function on noncompact G. The abstract Bruhat theorem's either/or output does not itself classify the branch by length. The square-zero ring used in the counterexample specializes Mathlib's existing `TrivSqZeroExt`; it is not another ring-construction roadmap.

The reviewed coverage file was read at blob `5e708cfc74a51b10e62149113872fe4e00eb5846`. Related AA.0, AA.1 and AF.0 entries were inspected. There were no entries with the SR, ReductiveGroupsPartII or RootSystems keys in that snapshot; an absent audit is not claimed to be an existing negative review. Direct declaration inspection supplies the positive carrier/coinvariant evidence.

The ownership read included the complete smooth-representations document and all its stages, all ReductiveGroupsPartII stage descriptions, and two complete upstream documents: root systems and reductive groups. The claim-snapshot screen inspected all 42 existing paper result JSONs for overlapping routes, then refreshed the relevant owners before publication.

| Owner | What this extraction asks it to supply |
| --- | --- |
| SmoothRepresentationsOfLocalGroups:SR.1 | Integral Hecke convolution, level modules, characteristic-function bases, uniform compact levels, finite clopen refinement and compact-test cosheaf API |
| ReductiveGroupsPartII:RG2.0 | Completed-unramified/Frobenius comparison for local rational points |
| ReductiveGroupsPartII:RG2.1 | Actual relative-root/apartment and shifted root-factorization inputs, Newton centralizer adapter |
| ReductiveGroupsPartII:RG2.3 | Barycentric levels, stable pro-unipotent models, fixed-coset lifting and adjacent-depth containment |
| ReductiveGroupsPartII:RG2.4 | Local Tits/Bruhat/parahoric cosets and residue-split length/cardinality comparisons |
| RootSystemsPartIIDominanceAndDemazure | Reused affine twisted RedMin/straight-class/standard-triple lane |
| SmoothRepresentationsPartIINewtonCocenters | New continuation containing the Newton cocenter, Howe and rigid-presentation mathematics |

The root candidate is the same one already proposed by HE21 and reused by KPZ26. Preserve the requested consolidation of Kisin–Zhou's overlapping `RootSystemsDominancePartII` alias; do not create a third copy.

The new Newton extension is not a renamed parahoric-center roadmap. KP18's `SmoothRepresentationsPartIIParahoricCenters` owns Bernstein/parahoric center comparisons; HE21's now-merged follow-up adds the generic affine-Hecke cocenter/class-polynomial branch there. That carrier is not automatically the full locally constant p-adic group algebra. A specialization theorem would be needed to connect them. This extraction preserves that boundary and does not route an introductory analogy as a new duplicate construction.

Nor are these Newton strata the Frobenius/isocrystal strata of `BunGAndNewtonStrata`. The shared word “Newton” does not provide a supplier. SR.3a's uniform admissibility is not Howe's finite-dimensionality theorem, and SR.6's late integral finiteness is not an early input to it. No late trace formula is made a prerequisite of the local theory.

Both Part II design briefs in the JSON state their imports, final statements, corrected scopes and required regression tests. No existing upstream roadmap is replanned.

## 4. Source findings and exact limits

All ten findings are unreviewed. There is no self-confirmation object. “New” in the structured field means that no correction was located in the listed searches, not a claim of priority or an exhaustive negative bibliographic result.

The correction search inspected the Cambridge publication and Volume 6 contents, arXiv history and selected v3 passages, the author's HKU selected-publications page, and targeted title/erratum/correction searches. No author was contacted.

### E1: finite order is not finite twisted Ω-orbits

Take G=F× and θ(g)=g⁻¹. Then W̃=Ω=Z, Wa is trivial and the length function is identically zero. The twist on the apartment and W̃ has order two and preserves the Iwahori O_F×. Twisted conjugation by an element of valuation k sends valuation m to m+2k. The arithmetic invariants are κ=m modulo 2 and Newton vector zero.

Consequently a single θ-conjugacy class meets infinitely many Wa-cosets, every member is minimal, and each defined X_ν is the union of all even or all odd valuation cosets. It is not compact: its continuous image in the discrete valuation group is infinite. This contradicts §2.1(a), the first assertion of Corollary 9 and the use of this X_ν as a compact subset in §5.2.

It does **not** contradict a Newton partition, finite fibres on conjugacy classes, or the existence of some different compact fundamental subset. In this example there are just two twisted valuation classes. It also does not disprove field-valued Howe finiteness for the general twist.

The guarded finite-minima theorem requires finite fibres of Ω→Ω_θ, equivalently the appropriate cosets of (1−θ)Ω to be finite. Ordinary θ=id is covered. Section 5 now supplies the different compact core and same-level generation argument needed for central twists, conditional on the stated Ω-normalizer and standard-triple producers. The finite ordinary θ-saturation used in Theorem 23's proof has the same problem: θ-stability is not stability under full twisted Ω-conjugation.

### E2: test functions use direct sums, distributions use products

For ordinary F× with ω=1, Haar integration is a valid invariant functional and is nonzero on every valuation shell. Each input function is compactly supported and hence meets only finitely many shells; no convergence of an infinite sum is involved. The family of restrictions of the functional nevertheless has infinite support.

Thus the dual of the Newton direct sum is a product, and Theorem 22 also needs a product over all standard pairs. For a torus the standard pairs already range over every integer valuation. Local compatibility imposes equations but does not impose finite support. The finite rigid/nonrigid two-factor decomposition is unaffected.

### E3: an explicit arbitrary-ring counterexample

Let V be the direct sum of countably many copies of F3, with basis e_0,e_1,…, and put R=F3⊕V with square-zero multiplication
$$
(a,v)(b,w)=(ab,aw+bv).
$$
Set t=(0,e_0). Then 2 is invertible in R, Ann(t)=0⊕V and 1+t has order three. On G=Q2× take θ=id and ω(g)=(1+t) raised to the 2-adic valuation of g. The kernel is open: it is the union of the valuation shells divisible by three. This is within the paper's stated coefficient and character hypotheses.

Let I=Z2×, which is pro-2, and normalize its Haar volume to one. For b∈Ann(t) define
$$
j_b(f)=b\int_I f.
$$
Because G is abelian, T_x acts on test functions by the scalar ω(x). Every ω(x)−1 is a multiple of t, so j_b is invariant. It is supported on the compact open I and j_b(1_I)=b.

Now fix any of the positive levels I_n⊆I. Evaluation at 1_I maps the restricted invariant-distribution module supported on I onto Ann(t). Indeed invariance under 2 forces t j(1_I)=0, and the preceding j_b realizes every element of the annihilator. No assumption that I_1=I is used.

The R-action on V factors through F3. An R-submodule generated by finitely many vectors is therefore finite-dimensional over F3, while V is not. Hence the restricted distribution module is not finitely generated, since it has V as a quotient. This refutes Theorem 20 in its printed arbitrary-ring scope, even for θ=id. “Finite dimensional” in Theorem 18 has no vector-space meaning for arbitrary R; interpreting it as finite generation is also contradicted.

The valid general-ring conclusion of the printed generator count is about the **cocenter component**. Over a field its dual has the same finite dimension. The Ω-normalized construction in Section 5 supplies the field-valued restriction bound without the finite-minima guard, once the local level producers are established. It is unnecessary to assert surjectivity of a restriction map on arbitrary R-duals.

Finite models V=F3^d, d=1,…,6, were checked only as diagnostics. Their dimensions alone cannot disprove an existential finite-generation statement; the infinite direct-sum argument above is the actual obstruction.

### E4: the overlap graph needs inverse transport

With θ=id and ω=1, take the upper Iwahori I of GL2(Q_p), x=diag(p,1), and U=I∩xIx⁻¹. The element u with rows (1,0) and (p,1) lies in U: it is in I, and x⁻¹ux has lower-left entry p². But xux⁻¹ has lower-left entry 1, so is outside I.

Therefore T_x1_U is not supported in I. The printed pair (f,−T_xf) need not lie in its declared second summand. The corrected pair is (f,−T_(x⁻¹)f). This also fixes the ω weight and the functional compatibility equation simultaneously. The publication's page image confirms the forward exponent; this is not an OCR issue. Exact matrix computations for p=2,3,5,7 agree with the general calculation.

### E5–E8: proof gaps, not blanket disproofs

Lemma 15's “pro-p, thus lift a Frobenius-fixed coset” needs a Lang argument for the actual connected intersection models. An abstract pro-p group does not imply the needed H¹ vanishing. The root-depth quotient comparison in Lemma 16 must also respect Frobenius; an abstract bijection with an affine space does not determine the number of rational points. Richarz's unshifted rank-one proof was read, but it does not automatically provide all the depth-shift and inverse-limit details.

Theorem 23's proof separates relations by R-valued duals while R is arbitrary. For R=Z[1/p] and a prime ℓ≠p, Hom_R(R/ℓR,R)=0 although the module is nonzero. Finite generation is not finite-dimensional vector-space duality. The replacement proof below avoids that passage and the finite Ω truncation entirely.

In Theorem 3's power-growth argument, the fixed conjugator has Bruhat index z∈W̃, but the displayed bound puts it in a length ball of Wa. This can miss its whole Ω-coset. A nonzero translation can also be central and have length zero, as t^(1,1) in GL2 shows. Section 5 replaces this passage by finite endpoint subwords and a full affine-vector comparison. It retains Ω factors and handles central directions directly. A separate equal-central-average lemma is no longer needed; the actual full-apartment producer remains G1.

Finally, Z_G(A) over an arbitrary local F need not be a torus. For GL_m(D) with a noncommutative central division algebra D, it is a product of D× groups. Haines–Rapoport Proposition 13 works over a strictly henselian field with a torus centralizer and inertia coinvariants. It does not directly supply the cocharacter formula printed in He18 §1.1 for all F. The actual quotient N_G(A)(F)/Z0 and Richarz's comparison are retained; the general translation adapter is a named gap, not a fictitious library theorem.

### E9–E10: twists, indices and finite sums

The decreasing-cell condition is swθ(s)<w, with s in the **affine** simple set. The rotated convolution factors in Lemma 17 retain θ(g1). A standard pair gives the automorphism Ad(τ)θ of W_P, not automatically Ad(τ) alone.

The contracted-product action uses the next factor g2 in its second entry, and the final right index is i_k. The fixed-coset expression is at level I_n. In §5.3, distributions supported on finitely many strata lie in a finite **sum**, not generally their set-theoretic union; change of level is by restriction image between different functional domains.

These are recorded as source issues even when the intended local correction is clear. None is silently converted into an untwisted theorem.

## 5. Conditional repairs for Newton separation and central twists

These arguments are derived repairs, not quotations from the paper or independent review verdicts. They use the stated standard-triple and local Bruhat/filtration producers. They do not establish the outstanding BT, Lang or actual Iwahori–Weyl source interfaces merely by assuming them.

### Finite minimal representatives modulo Ω transport

Assume `W̃=Wa⋊Ω`, with Ω abelian and `(Wa,S̃)` a Coxeter system with finite S̃. Assume θ preserves these factors, length and simple reflections, and retain the invariant map π and standard-triple theorem in their validated scope. For ν in the image of π choose `τ0∈Ω` lifting its coinvariant κ. The standard-triple theorem bounds the length of every minimal element in the fibre by

`Bν = ℓ(xν) + max_{K⊆S̃, W_K finite} max_{u∈W_K} ℓ(u)`.

The straight length `ℓ(xν)` depends on the Newton vector. There are finitely many K and each finite W_K has a longest length, so Bν is finite. In a fixed Wa-coset there are at most finitely many words of length at most Bν. Consequently

`S(ν,τ0) = {w∈W̃_min : π(w)=ν, prΩ(w)=τ0}`

is finite. Given any minimal w with π(w)=ν, write `prΩ(w)−τ0=(1−θ)η`. Then

`w′=η⁻¹wθ(η)`

has projection τ0. Its length equals that of w because both Ω factors have length zero. It is in the same twisted conjugacy class and therefore remains minimal with the same π. Thus every minimal element is Ω-twisted-conjugate to one of this **finite** set. This proves C17 and removes the finite-minima guard from C12's finiteness of conjugacy-class fibres. It does not make the entire minimal-element set finite.

Choose lifts of Ω in the normalizer that normalize I. The finite union `Y(ν,τ0)=⋃_{w∈S(ν,τ0)} IẇI` is compact open and has the same twisted saturation as X_ν. This is the replacement compact core N20. For the inverted torus it is just one valuation shell of the chosen parity; the original X_ν is still an infinite union.

For level compatibility, the actual barycentric filtration must additionally prove that these lifts and their θ-images normalize I_n. Then `T_(h⁻¹)` maps `H_R(G,I_n)_w` isomorphically to `H_R(G,I_n)_(η⁻¹wθ(η))`: it transports support by `U↦h⁻¹Uθ(h)`, preserves both level invariances and has inverse T_h. The coefficient ω(h⁻¹) is a unit. Proposition 1 identifies the two images in the ambient cocenter. This is L18; its filtration producer is explicitly assigned to A3/G2.

Theorem 11's minimal-cell generators can therefore be replaced at the **same level** by the finite set S(ν,τ0). Lemma 16 supplies rank `[I:I_n]` for each cell's level test module: the cell has `q^ℓ̆(w)[I:I_n]` right I_n-cosets and every I_n-double coset in it has `q^ℓ̆(w)` right cosets. Hence the ν-component is generated by `Nν[I:I_n]` elements, where `Nν=#S(ν,τ0)` is independent of n. Over a field the restriction image of invariant distributions has dimension at most this number. A compact X meets finitely many Newton strata; choose a common sufficiently deep I_n inside K and restrict the resulting finite sum to H_R(G,K). This supplies the central-twist part of F2–F4 without the former finite-minima guard. The local cardinality and Lang producers still require G2/G6. The arbitrary-ring distribution assertion remains false by E3.

### Finite endpoints in the Newton power argument

Write `C_w=IẇI`. For fixed finite sets A,B of extended Weyl elements, simple-cell multiplication gives finite sets A′,B′ independent of w with

`(⋃a∈A C_a) C_w (⋃b∈B C_b) ⊆ ⋃a′∈A′,b′∈B′ C_(a′ w b′)`.

Here is a direct construction. Write `a=s1⋯sr τ` and `b=τ′t1⋯tk`, with τ,τ′ in Ω. The Ω cells normalize I and multiply the middle label exactly to `τ w τ′`. Iterate the left and right rank-one upper bounds, keeping that middle label intact. A′ consists of `qτ` for subwords q of the first word; B′ consists of `τ′q′` for subwords of the second. Their Ω factors are never discarded. Take finite unions for all a,b. This is N18.

The abstract laws already exist at the Tau Ceti pin: `TauCeti.TitsSystem.bruhatCell_mul_eq_or_eq_union_of_mem_simple`, its right-handed version, and `exists_sublist_of_mem_prod_bruhatCell`. N21 records exact reuse. The local extended-group adapter is still required; a theorem about the abstract Tits-system Weyl group is not automatically a theorem about every Ω component.

Suppose two standard-triple cells have twisted-conjugate elements by a fixed g in C_z. Choose a common power n0, divisible by θ's order on W̃, so the straight factors have translation vectors λ1,λ2. N6 bounds the finite-parabolic errors in every n0m-fold twisted power. Although θ need not have finite order on G, `θ^(n0m)(g)` remains in the same fixed cell C_z. Move the second finite-parabolic error to the other side by inversion. N18 and disjointness of Bruhat cells give finite endpoint sets A′,B′ and

`t^(mλ2) = a_m t^(mλ1) b_m`

for every positive m, with a_m,b_m in those fixed finite sets.

Pass to the **full** real affine apartment, retaining central directions; faithfulness is unnecessary. One endpoint pair occurs for two distinct positive integers m,n. Write its affine maps as `a(v)=Lv+c`, `b(v)=Mv+d`. Comparing linear and translation parts gives `LM=1` and

`m(λ2−Lλ1)=c+Ld=n(λ2−Lλ1)`.

Subtracting forces `λ2=Lλ1`. The linear part L lies in W0, so distinct dominant Newton vectors are impossible. This is N19 and the revised N7. It needs neither a false length bound inside Wa nor positivity of root length on central translations. G5 is now supplied relative to the actual affine and local Bruhat producers; G1/G4 still carry their source obligations.

## 6. Direct repair of the rigid presentation

The following argument is a proposed mathematical repair, not a claim that the printed proof already supplies it or that it has been independently verified. It applies over every R once the rigid cover and local commutator comparison have been established.

Write X=G^rig and U_i=P_iτ̇_i for standard pairs. Each U_i is compact open and stable under twisted conjugation by P_i. By Proposition 21, the sets g·_θU_i form an open cover of X.

First, compact test functions have a finite clopen refinement property. The nonzero support of a locally constant function with discrete coefficients is closed as well as open; when compactly supported it is compact open. Cover it by compact open subsets subordinate to finitely many chosen charts and disjointify them by successive differences. For two refinements, intersections give a common refinement. No finite-index assumption on all charts is needed.

It follows that C_c(X,R) has the usual compact-test cosheaf presentation: the direct sum over the chart test modules surjects, and its kernel is generated by differences of zero extensions of tests on pairwise overlaps. To see the kernel statement without invoking a sheaf theorem, take a finite relation and refine all its supports simultaneously. On each refined piece its coefficients sum to zero. Express this finite relation as differences against one chosen chart containing that piece, then sum over the pieces.

Let Q be the direct sum of H_i=C_c(U_i,R), modulo:

1. the local relations f−T_pf for p∈P_i;
2. the corrected overlap pairs (f,−T_(x⁻¹)f) for chosen double-coset representatives x.

The local relations equal the local convolution commutators by Proposition 1's argument on the parahoric coset. Identify Pτ̇ with P by right translation and use Ad(τ̇)θ as the automorphism of P. Work at sufficiently small stable pro-p levels; never divide by μ(P) without proving it invertible.

Relations for **every** g∈G follow from those for the chosen x. If g=p x q, and f is supported on U_i∩g·_θU_j, first replace f by T_(p⁻¹)f using its local P_i relation. This lies on the x-overlap. Apply the x graph, then remove the local q transport in H_j. The resulting second component is
$$
T_{q^{-1}}T_{x^{-1}}T_{p^{-1}}f=T_{g^{-1}}f.
$$
The group law for T includes every character factor, so no missing ω normalization is concealed in this reduction.

For a test f supported on g·_θU_i, assign its class in Q by
$$
f\longmapsto [T_{g^{-1}}f]_i.
$$
The all-g overlap relation just proved shows that this assignment agrees for two charts containing the same test. The compact-test cosheaf presentation therefore glues these assignments to an R-linear map C_c(X,R)→Q. It is invariant under the global G-action: on a chart, transporting first by h and then back by hg is the same as transporting back by g. The generic coinvariant universal property gives a map from the rigid coinvariants to Q.

Conversely, zero extension followed by the global cocenter projection gives Q→H̄_R^rig. Its local and overlap generators vanish by invariance. The two composites are the identity on the chart generators and therefore everywhere. The identification of rigid coinvariants with the rigid image in the global cocenter uses the clopen rigid/nonrigid split.

This proves the corrected presentation from the explicitly stated cover, local relation comparison, finite refinements and double-coset descent. It uses neither an R-dual separation theorem, nor Howe finiteness, nor a finite θ-saturation of Ω labels.

For the distribution theorem, apply Hom_R(−,A) to this presentation for an arbitrary R-module A. The dual of its direct-sum domain is a product. Local relations impose P_i-invariance; graph relations impose
$$
j_i(f)=j_j(T_{x^{-1}}f).
$$
Setting A=R yields the corrected Theorem 22. Equivalently, one can glue these functionals directly on finite clopen partitions. Using arbitrary A explains why this method does not lose information in the square-zero or torsion examples.

## 7. Tests, status and continuation

The JSON's definition tests are mathematical specifications, not claimed compiled examples. They distinguish, among other things, ordinary from inverted torus Newton data, central Newton vector from zero vector, compact support from infinite constant functions, convolution from pointwise multiplication, finite from infinite parabolic subgroups, actual level images from unjustified intrinsic identifications, and inverse from forward overlap transport.

The first checkpoint recorded these diagnostics; they were not rerun by this continuation:

- 24 S3 twisted-commutator versus coinvariant row-space comparisons: six inner twists, trivial/sign characters, and F5/F7 coefficients.
- 1,681 valuation-lattice pairs for m↦m+2k, with parity fixed and Newton vector zero.
- Four exact GL2 matrix counterexamples to the printed graph direction.
- Square-zero coefficient models of dimensions 1 through 6, with Ann(t)=V and (1+t)^3=1.

They do not prove the general paper, the infinite-dimensional counterexample, or the source repairs in Lean. No Lean file was requested for this paper job, and no Lean file was created or compiled.

The checkpoint remains partial because the actual-group lattice/central-kernel adapter, BT/Moy–Prasad/Lang source closure, integral Haar foundations and finite-Weyl proof dependencies remain open. The Newton power argument and the central-twist finite-core/level argument are now explicit relative to those producers. Source findings and the direct presentation repair also require independent review.

Resume at G1/G4 for the global Newton partition and G2/G6 for level convolution and Ω-normalizer compatibility. Preserve the new conditional G5/G7 proofs rather than repeating the old proof searches. Preserve the stable item identifiers, existing owner candidates and every counterexample. The handoff lists the exact next reading and validation work; a later worker should not restart by re-extracting the already read 27-page paper.

Current validation: `scripts/check_paper.py`, intake on the three exact deliverables, and whitespace checks pass. Structural validation checks all stable IDs, exact-once routing of 87 missing items, the 265-edge acyclic graph and every definition/construction API and test. No Lean file was written or compiled.

Fresh diagnostics verify 216 protected-middle Bruhat support inclusions for S3, 405 Ω-normalizations in the model `S3×Z` with θ acting by −1 on Z, and 108 affine identities, plus a central length-zero regression. To reproduce the first, enumerate S3 reduced words by breadth-first search, multiply by a simple generator keeping the new term and keeping the old term only on a descent, and compare the product's support with `{a′ w b′}` over subwords of the fixed outside words. For the second, take the five minimal S3 elements and integers −40 through 40; use `τ0=m mod 2` and `η=(m−τ0)/2`, giving `m−2η=τ0`. For the third, use the identity/swap matrices on R², translations c,d in `{(0,0),(1,1),(1,−1)}`, slopes `(1,1),(2,0)` and powers 1,2,7. Verify the affine composition formula and check that a fixed error `(1,1)` relates slopes `(1,1)` and `(2,2)` only at power 1. These finite checks supplement the universal proofs above; they are not a formalization or an independent review.

The current pinned audit reopened H1/H7/H8 and read the exact Tits-system statements used by N21; all five inspected source files match their pinned GitHub bytes. The reviewed AA.0/AA.1/AF.0 entries and owner routes were reread. No new roadmap ID was introduced. Current source hashes, exact selected HN14 reading and owner snapshot are in the JSON; inherited records remain attributed to the first worker.
