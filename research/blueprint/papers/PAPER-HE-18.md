# PAPER-HE-18 — Newton cocenters and invariant distributions

Codex — codex-a71f92. Refs #1406.

This is a partial research checkpoint, not a formalization or a proof-closure certificate. The published paper has been read completely, and the extraction covers its main definitions, numbered results and proof inputs. The JSON contains 94 items, 249 internal dependency edges, 36 definitions/constructions with 108 API entries and 108 specified tests, seven routes, eight explicit gaps and ten source findings awaiting independent review. Every missing item has exactly one route. Every implementation status is unchecked.

The main output is a distinct continuation, **Smooth representations of local groups, Part II: Newton cocenters and invariant distributions**. It imports the existing test-function and local-group foundations and the already proposed affine-Coxeter extension. Several printed statements cannot be used in their original generality. The corrected scopes, counterexamples and proposed replacement proof are part of the extraction, not silent edits to the source.

## 1. Sources and conventions

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
| Corollary 9 | C11, C12 | Finite minimal representatives and class fibres in the explicit guarded scope |
| Theorem 10(1),(2) | N13, N16 | Separate direct-sum decompositions of tests and cocenter |
| Theorem 11(1),(2) | L15, L14 | Separate level-image decomposition and minimal-cell generators |
| Corollary 12 | L16 | Global minimal-cell generators, not a free-basis assertion |
| Proposition 13 | L10 | Length-additive congruence convolution with coefficient μ(I_n) |
| Lemmas 15 and 16 | L4, L8 | Fixed-coset descent and q to the residue-split-length count |
| Lemma 17(1),(2) | L12, L13 | Equal-length equality and decreasing two-term containment |
| Theorems 18 and 20 | F4, F3 | Field-valued distribution finiteness with the finite-minima guard |
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

The guarded finite-minima theorem requires finite fibres of Ω→Ω_θ, equivalently the appropriate cosets of (1−θ)Ω to be finite. Ordinary θ=id is covered. A proof for general finite-order central twists needs a different compact core or generation argument and its compatibility with congruence levels. The finite ordinary θ-saturation used in Theorem 23's proof has the same problem: θ-stability is not stability under full twisted Ω-conjugation.

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

The valid general-ring conclusion of the printed generator count is about the **cocenter component**. Over a field its dual has the same finite dimension, so the field-valued restriction image satisfies the stated bound under the finite-minima guard. It is unnecessary to assert surjectivity of a restriction map on arbitrary R-duals.

Finite models V=F3^d, d=1,…,6, were checked only as diagnostics. Their dimensions alone cannot disprove an existential finite-generation statement; the infinite direct-sum argument above is the actual obstruction.

### E4: the overlap graph needs inverse transport

With θ=id and ω=1, take the upper Iwahori I of GL2(Q_p), x=diag(p,1), and U=I∩xIx⁻¹. The element u with rows (1,0) and (p,1) lies in U: it is in I, and x⁻¹ux has lower-left entry p². But xux⁻¹ has lower-left entry 1, so is outside I.

Therefore T_x1_U is not supported in I. The printed pair (f,−T_xf) need not lie in its declared second summand. The corrected pair is (f,−T_(x⁻¹)f). This also fixes the ω weight and the functional compatibility equation simultaneously. The publication's page image confirms the forward exponent; this is not an OCR issue. Exact matrix computations for p=2,3,5,7 agree with the general calculation.

### E5–E8: proof gaps, not blanket disproofs

Lemma 15's “pro-p, thus lift a Frobenius-fixed coset” needs a Lang argument for the actual connected intersection models. An abstract pro-p group does not imply the needed H¹ vanishing. The root-depth quotient comparison in Lemma 16 must also respect Frobenius; an abstract bijection with an affine space does not determine the number of rational points. Richarz's unshifted rank-one proof was read, but it does not automatically provide all the depth-shift and inverse-limit details.

Theorem 23's proof separates relations by R-valued duals while R is arbitrary. For R=Z[1/p] and a prime ℓ≠p, Hom_R(R/ℓR,R)=0 although the module is nonzero. Finite generation is not finite-dimensional vector-space duality. The replacement proof below avoids that passage and the finite Ω truncation entirely.

In Theorem 3's power-growth argument, the fixed conjugator has Bruhat index z∈W̃, but the displayed bound puts it in a length ball of Wa. This can miss its whole Ω-coset. A nonzero translation can also be central and have length zero, as t^(1,1) in GL2 shows. A correct proof must track Ω-cosets and equal central averages before using a norm detected by roots. Equal κ may supply the missing central argument, but the extraction does not claim to have proved it.

Finally, Z_G(A) over an arbitrary local F need not be a torus. For GL_m(D) with a noncommutative central division algebra D, it is a product of D× groups. Haines–Rapoport Proposition 13 works over a strictly henselian field with a torus centralizer and inertia coinvariants. It does not directly supply the cocharacter formula printed in He18 §1.1 for all F. The actual quotient N_G(A)(F)/Z0 and Richarz's comparison are retained; the general translation adapter is a named gap, not a fictitious library theorem.

### E9–E10: twists, indices and finite sums

The decreasing-cell condition is swθ(s)<w, with s in the **affine** simple set. The rotated convolution factors in Lemma 17 retain θ(g1). A standard pair gives the automorphism Ad(τ)θ of W_P, not automatically Ad(τ) alone.

The contracted-product action uses the next factor g2 in its second entry, and the final right index is i_k. The fixed-coset expression is at level I_n. In §5.3, distributions supported on finitely many strata lie in a finite **sum**, not generally their set-theoretic union; change of level is by restriction image between different functional domains.

These are recorded as source issues even when the intended local correction is clear. None is silently converted into an untwisted theorem.

## 5. Direct repair of the rigid presentation

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

## 6. Tests, status and continuation

The JSON's definition tests are mathematical specifications, not claimed compiled examples. They distinguish, among other things, ordinary from inverted torus Newton data, central Newton vector from zero vector, compact support from infinite constant functions, convolution from pointwise multiplication, finite from infinite parabolic subgroups, actual level images from unjustified intrinsic identifications, and inverse from forward overlap transport.

The finite scratch diagnostics check:

- 24 S3 twisted-commutator versus coinvariant row-space comparisons: six inner twists, trivial/sign characters, and F5/F7 coefficients.
- 1,681 valuation-lattice pairs for m↦m+2k, with parity fixed and Newton vector zero.
- Four exact GL2 matrix counterexamples to the printed graph direction.
- Square-zero coefficient models of dimensions 1 through 6, with Ann(t)=V and (1+t)^3=1.

They do not prove the general paper, the infinite-dimensional counterexample, or the source repairs in Lean. No Lean file was requested for this paper job, and no Lean file was created or compiled.

The checkpoint remains partial because the actual-group lattice/central-kernel adapter, BT/Moy–Prasad/Lang source closure, finite-Weyl proof dependencies, Newton power-growth repair and general central-twist Howe argument are not closed. Source findings and the direct presentation repair also require independent review.

Resume at G1/G5 for the global Newton partition and G2/G6 for the level convolution proof. Preserve the stable item identifiers, existing owner candidates and every counterexample. The handoff lists the exact next reading and validation work; a later worker should not restart by re-extracting the already read 27-page paper.

Validation completed: the current `scripts/check_paper.py` logic (including `source_issues.py`) reports no errors. The checker was loaded from the refreshed main-branch script with its root pointed at the isolated repository. The four diagnostic groups above pass. Additional structural validation checks unique identifiers, acyclicity, exact-one routing for all 82 missing items, definition API/test coverage, source-excerpt presence, gap endpoints and absence of self-review or private paths. These checks validate the extraction's structure, not its mathematical proof closure.
