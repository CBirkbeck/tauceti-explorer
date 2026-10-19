# Independent review: Nori motives and diagram categories, MC.5 follow-up

**Accepted after corrections.** Issue [#10802](https://github.com/CBirkbeck/tauceti-explorer/issues/10802), job
`REV-MotivesAndAlgebraicCycles--MC.5`. Reviewer: Claude, session `claude-i79B8T`, 19 October 2026. The plan under
review is `BP-MotivesAndAlgebraicCycles--MC.5` (issue #10831, Codex session `codex-HSHmgg`, merged in #11075). This
session did none of that work. The [packet](../packets/MotivesAndAlgebraicCycles--MC.5.json) now records
`independent-review-REV-MotivesAndAlgebraicCycles--MC.5`. Its [reader](../readmes/MotivesAndAlgebraicCycles--MC.5.md)
and [suggested file](../suggested/MotivesAndAlgebraicCycles--MC.5.lean) are brought in line with every correction
below.

The acceptance covers the plan, not an implementation. MC.5 stays `planned`, not `closed`: four supplier gaps and six
requests remain, and they are recorded honestly. Every target of the layer brief has a node or an existing owner: the
finite endomorphism coalgebras and filtered passage, homology of algebraic pairs with boundary maps, the universal
property, tensor and duality structures, the Betti and de Rham fibre functors, the (G_m,{1}) period, the triple
sequence checked before the universal category is used, and a sourced comparison functor from geometric motives.

## Counts

| Item | Before | After |
| --- | --- | --- |
| Nodes (constructions / theorems / applications) | 28 (7 / 19 / 2) | 28 (7 / 19 / 2); none added or removed |
| API items | 35 | 36 (`Nori.compatibleEnd.mem_iff` added) |
| Unit tests | 21 | 23 (`Nori.CellularFiltration.notVeryGood`, `Nori.AffineCover.twoRefinementMaps` added) |
| Planets | 6 | 6 (one renamed; assembly policy corrected) |
| Baseline declarations | 12 | 12, all confirmed, none removed |
| Source findings | 2 (E48, E49) | 8: E48, E49 confirmed; E70–E75 added and confirmed |
| Node verdicts | — | 18 verified, 10 corrected, 0 added, 0 unverifiable |
| `check_blueprint.py` | 0 errors, 0 warnings | 0 errors, 0 warnings |
| `lean-check` of the suggested file | 2 admitted-proof warnings | no errors; 5 admitted-proof warnings only |

## Sources

I fetched all six source versions into scratch and checked that each file's SHA-256 matches the packet's ledger:
HM17 (book, Version 6), HM25 (annotated version of 1 July 2025), VW (arXiv:1111.5146v1), Harrer (arXiv:1609.05516),
BVHP (author preprint) and HMS14 (arXiv:1105.0865v5). I read every node's locators at the page given. In both book
versions the PDF page is the printed page plus 22 near the cited chapters. HM17 and HM25 page numbers differ from
Chapter 7 on (they agree through Chapter 5), and the packet keeps them apart correctly. I also read the authors' errata landing page on 19 October 2026.
It lists the Rodriguez correction to the product structure and nothing about the later path.

Every locator is right except two, which are now corrected:

- `completion-triple-adapter`: "relative cohomology sequence (2.2), p. 32" names no equation of HM17. The pair and
  triple sequences are Proposition 2.1.4 and Corollary 2.1.5, p. 32.
- `completion-simultaneous-correspondences`: Harrer §4.9 has no Propositions 4.9.3–4.9.7. It has Definition 4.9.1,
  Proposition 4.9.2, Definition 4.9.3, Remark 4.9.5 and Theorems 4.9.6–4.9.7, pp. 149–153.

No verbatim passage, excerpt or section summary is in the packet or the reader. Statements and findings are in the
roadmap's own words.

## Baseline

I read all twelve declarations in the shared build at Mathlib 082e2d3 and Tau Ceti f790474:

- `CategoryTheory.End`: its `mul_def` is `xs * ys = ys ≫ xs`.
- `Subalgebra` is in `Subalgebra/Basic.lean`.
- `exists_finite_inj_algHom_of_fg` needs a field, a nontrivial ring and finite type. It gives an injective finite map
  from a polynomial algebra, and the number of variables is not tied to dimension.
- `Module.Dual`.
- `DerivedCategory`, defined as `HomologicalComplexUpToQuasiIso` over `ComplexShape.up ℤ`.
- `TauCeti.FGComoduleCat`, the full subcategory of finitely generated right comodules.
- `TauCeti.FGComoduleCat.tensorUnit`, which needs a commutative base and a bialgebra.
- The five `TopTriple` statements: δ goes from H_n(X,A) to H_m(A,B) when m+1=n, with the three exactness lemmas and
  naturality.

All twelve provide what the citing nodes use, so none is removed.

The packet's claims about current Tau Ceti and TauCetiRoadmap hold:

- `Comodule/Finite/Abelian.lean` is at a91d3aa and absent from the pinned build.
- RealAlgebraicGeometry excludes triangulation (README, line 80).
- AlgebraicTopology Stage 6 has Poincaré–Lefschetz duality for manifolds with boundary.
- No Nori construction exists upstream.

`data/library-coverage.json` has no entry for this roadmap. AUDIT-35 has no review object and is correctly treated as
leads only.

## Closure and suppliers

I read the statement of every cross-roadmap node the packet cites, and each supplies what the consumer uses:

- ComplexComparisonPartII `C0/repair-analytification`, `C5/repair-proper-de-rham-betti`,
  `C5/multiplicative-period-interface` and `C5/curve-residue-localization`, all accepted. The last fixes 2πi for a
  positive loop.
- MC.4 `effective-geometric-motives`, `homotopy-invariance-and-mayer-vietoris`, `tate-stabilised-motives` (perfect
  base field) and `motive-of-projective-space`, which gives M(P¹)=Q⊕Q(1)[2] and so fixes the Tate shift.
- MC.6 `fibre-functor-extension`, the abstract extension along a comparison over K.
- The canonical MC.5 nodes `diagram`, `diagram-localisation`, `effective-pairs-diagram`, `finite-comodules-abelian`,
  `nori-generators`, `nori-gysin-isomorphism` (geometrically connected), `nori-duality-morphism` and
  `rigidity-criterion`.

The requests to SchemeAndStackFoundations SF.4 and MotivicEtaleKTheory M.5a are precise. SF.4's own packet plans
de Jong alterations but not characteristic-zero resolution, so the request is needed. The four gaps name their
consuming nodes, sources and proposed owners. Every proof route follows from its prerequisites at target level. The
packet's own refinements go beyond its sources in four places, and in each the source proof has a gap that the review
now records (E71–E73, E75).

## Corrections made

1. **Cellular filtrations have very good steps** (`completion-cellular-filtration`). The old definition asked for
   dim F_i≤i, smooth differences and concentration in degree i. That accepts ∅⊆{0}⊆{0}⊆A², whose top step (A²,{0},2)
   is acyclic, hence good, but not very good, because dim{0}=0≠1. Its cellular complex would then have a term outside
   VGood, although `completion-cellular-complex` places it in C(VGood,H_B). The definition now requires every step to
   be a very good pair, as HM17 Definition 9.2.1(2) and Proposition 9.2.3 and Harrer Definition 4.2.1 do. It indexes
   up to some N≥dim X, which forces dim F_i=i for i≤dim X and allows repeated levels only above it. This adds the
   non-example test `notVeryGood`, a check, the Harrer locator and adjusted `level` and `relative` API items.
2. **The good-pair diagram is the canonical one** (`completion-excision-completion`, `completion-equivariant-filtration`).
   The plan called Good "the integral-good-pair diagram" and wrote of a "canonical integral-good diagram". But the
   canonical `effective-pairs-diagram` uses rational concentration, and HM17 Definition 9.2.1's integral goodness gives
   a full subdiagram with the same category. The wording now follows the canonical object, with HM17's variant noted.
   The second-factor product (A,B,m)×∂ is now stated: it is defined symmetrically.
3. **Refinement maps are unique only up to homotopy** (`completion-affine-cover`). The plan replaces HM17's rigidified
   full Čech complex by an ordered one but kept "refinements compose". Without rigidification a refinement is a choice
   of index map, and two choices need not agree on any refinement (HM17 Example 9.2.6). The statement and the `refine`
   API now say that two choices give comparisons that agree up to Čech prism homotopy, once filtrations compatible
   with the homotopy diagram are chosen. HM17 instead rigidifies the cover (Definition 9.2.7, Remark 9.2.8). This adds
   the test `twoRefinementMaps` and extends the locator. `completion-all-pairs-extension` already uses simultaneous
   choices for homotopies, so its proof route stands.
4. **The constructible Basic Lemma is stated in its sources' generality** (`completion-constructible-basic-lemma`).
   HM17 Theorem 2.5.7 and Harrer Theorem 4.3.8 hold over any subfield k⊆C, any coefficient ring and weakly
   constructible sheaves, with the top group a finite sum of stalks. The node had restricted all three. It now states
   the general form, with finite freeness as the consequence for free stalks. This follows the reader's own convention
   that geometric inputs are stated over k and applied at k=Q.
5. **Geometric realization on pairs is scoped to smooth pairs** (`completion-geometric-effective`). Harrer's
   realization is built on complexes of finite correspondences between smooth varieties. Its value on the cone of a
   singular very good pair is asserted in Remark 7.3.2 without proof (E75). The node now claims H_N^n(X,Y)[−n] for X
   and Y smooth. Its checks on Spec Q, A¹ and P¹ are unaffected.
6. Two locators (above).
7. **Planets** (`completion-filtered-descent` and `assembly.planetPolicy`). The node marked "Nori coalgebra" is the
   comodule-description theorem, not the coalgebra construction (the canonical `endomorphism-coalgebra`), so the
   planet is now "Diagram category as comodules". The assembly policy asked to replace the canonical six planets with
   this packet's six. That would drop the layer's key definitions, Diagram category and Nori motives. The policy now
   names a final six: those two canonical definitions, plus Nori's universal property, Nori's Basic Lemma (replacing
   the canonical Basic Lemma planet), Rigidity of Nori motives and Nori realization.
8. **API and suggested file** (`completion-finite-end-model`). The object's carrier exists at the pins, so its whole
   planning API and its three unit tests can be stated there (PROTOCOL.md section 13):
   - `compatibleEnd.mem_iff`, which holds by unfolding the definition;
   - real-bodied `compatibleEnd.eval` and `compatibleEnd.restrict`, with restriction along any functor of indexing
     categories;
   - `compatibleEnd.finiteDimensional` and `compatibleEnd.endEquiv`, renamed to the packet's names;
   - the tests `isolatedVertex` (discrete one-object category, dimension 4), `identityVersusZero` (Fin 2 with
     `ComposableArrows.mk₁` of the identity and of zero, dimensions 1 and 2) and `jordanLoop` (the one-object category
     of the natural numbers acting by the nilpotent Jordan block, dimension 2).

   The file holds no admitted data. `lean-check` at the pins: no errors; the only warnings are the five admitted
   proofs.

## Mathematics recomputed

| Statement | Instances computed | Result |
| --- | --- | --- |
| Finite dual (`finite-dual`) | Coassociativity of the coaction m↦Σe_im⊗e_i∨ against μ*(e_k∨)=Σa^k_ij e_i∨⊗e_j∨; E=Mat_2(K) | Left modules give right comodules, as stated. |
| Filtered descent | A two-index system whose transition kills a coefficient | Equations hold only at a later index; the node's step 2 is needed (E71). |
| Affine vanishing | X with an n-dimensional component inside Z; degree n+1 | Needs the reduction to X' (E72). The (A¹,{0,1}) and P¹ checks hold. |
| Triple sequence | ∅⊆{0,1}⊆A¹; Z=Y | H¹(A¹,{0,1})=coker(Q→Q²)=Q; inner term zero. |
| Cellular complexes | {0,1}⊆A¹; Spec Q; ∅⊆{0}⊆{0}⊆A² | Rank-one differential and H⁰=Q; Q[0]; the last chain is rejected after correction 1. |
| E49 counterexample | X=A¹, Y={0,1}, Z=∅, A=A², B: y²=x³−x | The endpoints are very good. H^*(S,X×B) is Q⁴ in degree 2 (good); H¹(S,Y×B)=Q, H²(S,Y×B)=Q⁶ (not good). By naturality for Y×B⊆X×B, the two-edge and three-edge composites agree. |
| Very-good product vertex | The same example | (S,T)=({0,1}×A²∪A¹×B, A¹×B): both have dimension two, so it is not very good (E74). |
| `boundaryRank` | (A¹,{0,1}) twice | δ×id: Q²⊗Q→Q⊗Q has rank one. |
| Product signs | δ(a×b)=δa×b+(−1)^{|a|}a×δb; τ⁻¹=(−1)^{nm}× | First factor (−1)^m, second none: matches HM25 Definition 8.1.3(2)–(3). The swap on L⊗L is trivial after correction. |
| Tensor of end algebras | (A⊗W)∩(V⊗B)=A⊗B over a field | End(T_F⊠T_G)=End(T_F)⊗End(T_G), as used. |
| Totalization signs | (−1)^{ij} on bidegree (i,j) | Intertwines d₁+(−1)^i d₂ with Harrer's d₂+(−1)^j d₁ (Convention 1.1.3, p. 18). |
| Tate shift | Λ_DM(1)={P¹→pt}[−2] and Lemma 1.10.12; Lemma 7.4.15 | Q(1)↦Q_N(−1)[0], Q(1)[2]↦Q_N(−1)[−2], M(P¹)↦Q_N[0]⊕Q_N(−1)[−2]. |
| Tate period | ∫_{|z|=1}dz/z; reversed loop | 2πi and −2πi; the inverse twist gives (2πi)⁻¹. |
| Correspondence trace | pt↝{y₁,y₂}, degree 2 | (a,b)↦a+b on H⁰, as in Harrer Definition 4.6.2; averaging would be wrong. |
| Equivariant quotient | Transitive G/H | H⁰(X/G) is the diagonal, equal to the invariants (Harrer Lemma 4.4.2). |

## Mistakes in the sources (PROTOCOL.md section 18)

- **E48** (HM17 Proposition 9.3.1, p. 219): confirmed. The functoriality edge used for ∂×id runs opposite to the
  inclusion. The authors' erratum of 27 June 2025 (HM25, p. 222, credited to Paul Rodriguez) adds excision edges.
- **E49** (HM25, p. 224): confirmed. The corrected composite passes through (Y×A∪X×B, Z×A∪Y×B, n+m), which is not good
  in the packet's example (computed above). The packet's two-edge repair is right. HM25 also misprints the last triple
  as "Z×A×Y×B".
- **E70, new** (misprint; HM17 Lemma 7.5.4(1) proof, p. 168, unchanged in HM25, p. 172): it says "cocommutative" for
  coassociative.
- **E71, new** (gap; HM17 Corollary 7.5.7 proof, pp. 171–172, unchanged in HM25; same step in VW Satz 5.23): a comodule
  over the colimit coalgebra is declared a comodule at the first finite stage. Coassociativity and the counit may hold
  only later, because the transitions need not be injective.
- **E72, new** (gap; HM17 Corollary 2.3.15 proof, p. 40): the pair sequence and Artin vanishing give degree n+1 only when
  dim Z<n. The statement is true, by excision to the components not contained in Z.
- **E73, new** (gap; HM17 Proposition 9.2.18 proof, p. 215, unchanged in HM25, p. 219): independence of choices is
  inferred from the Betti images, but the derived forgetful functor is not full. Harrer Proposition 7.2.3 and
  Theorem 7.2.4 supply the comparison maps.
- **E74, new** (error; HM25 corrected Proposition 9.3.1, pp. 223–224): the very-good-pair diagram does not carry the
  stated product structure, because the excision vertex has a subvariety of full dimension whenever B is nonempty.
  Theorem 9.3.4 stands: the tensor structure transfers along the equivalence of Theorem 9.2.22.
- **E75, new** (gap; Harrer Remark 7.3.2, p. 207): the value of the realization on singular very good pairs is asserted
  without proof. The main theorems, stated for smooth varieties, are unaffected.

New ids start at E70: E50–E53 are taken by the MC.0 and MC.2 packets, and the concurrent MC.6 and MC.7 reviews may add
more.

## Granularity, API, tests and planets

Target level is right for this roadmap (`detail.json`). Each construction's API serves the uses it records, and the
compatibility items name the canonical MC.5 objects they refine. Every construction has at least three tests that a
plausible wrong definition fails:

- scalar-only end algebras;
- ignoring arrows;
- a reversed restriction;
- a degree-normalized trace;
- an unnormalized Čech direction;
- the looser filtration (new);
- a unique refinement map (new).

The six planets are named from the source and are key theorems of the layer.

## Questions for the orchestrator

1. **Planets before assembly.** The whole-roadmap packet also marks six MC.5 planets. If it and this part were both
   live, `scripts/blueprints.py` would draw twelve on the layer. The packet's assembly policy names the final six.
   Until assembly, should one of the two selections be suppressed?
2. **SF.4 request.** `upstream/CaraianiNewton.md` lists SchemeAndStackFoundations as merged on TauCetiRoadmap main.
   The SF.4 request (characteristic-zero resolution and principalization, normal-crossings compactification, the
   hyperplane arrangement of HM17 Lemma 2.5.8, Jouanolou) may need to go to a Part II of that roadmap when MC.5 is
   assembled or packaged.
3. **Good pairs.** The canonical node uses rational goodness, HM17 and Harrer integral goodness. The two give the same
   diagram category, and this packet now uses the canonical one consistently. Assembly should keep one definition and
   note the other as a full subdiagram.
4. **Alternative tensor route.** BVHP builds the tensor structure from a graded tensor quiver whose edge products are
   formed in the free tensor category (Definitions 2.11–2.15, Theorem 2.18, Lemma 4.3). That route needs no product
   edges inside the diagram, so it avoids E48, E49 and E74. The plan's Good_ex route is correct as repaired. Assembly
   may prefer whichever is simpler to formalise.

No suspicious text was met: the issue thread holds only the maintainer-account claim and the claim bot's reply.
