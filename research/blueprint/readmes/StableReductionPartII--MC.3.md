# Clutching, boundary strata and cotangent lines

This is the MC.3 continuation of the accepted design of **Stable reduction of curves and stable maps, Part II**. Its scope is exactly `StableReductionPartII:MC.3`. The [packet](../packets/StableReductionPartII--MC.3.json) is a complete target-level planning pass; the stage is **planned**, with the supplier obligations R1–R3 below, and is not closed. Every construction and theorem remains unimplemented.

The eight existing MC.3 targets in [the original design](../packets/StableReductionPartII.json) keep their ids. The six new nodes specify their missing relative and integral comparisons. In particular, the accepted R09.5 packet already supplies general stack normalization; MC.3 imports it and identifies the curve-boundary construction with it.

## Conventions and ownership

All genera and marking counts are nonnegative integers, with stability inequality `2g−2+n>0` interpreted in the integers. Markings are individually labelled. A pointed family means the parent's proper flat finitely presented nodal family with geometrically connected fibres and ordered, pairwise disjoint sections in the relative smooth locus; stability is the parent's log-dualizing ampleness predicate. Family isomorphisms preserve each marking. Base schemes are arbitrary in the final interface. Where relative duality or cohomology is used, its extension from the parent's locally Noetherian hypotheses is the explicit R3 obligation.

Write M̄_{g,n} for the stable moduli stack and M_{g,n} for its smooth open. These are the groupoid-valued moduli objects of `StableReductionPartII:key/moduli-curves`, with the DM theorem and pointed normal-crossing charts imported from `MC.2/pointed-dm-theorem`. Their construction, representability and properness are not new MC.3 targets. The universal curve permits an extra section at a node or an old marking; an additional marking is required to be smooth and disjoint.

The parent **StableReduction**, current Layers1–3, owns nodes, the relative singular scheme, weighted dual graphs, curve families and both scheme pushouts for gluing smooth sections. MC.3 owns their moduli incidence and descent. Current **AlgebraicVectorBundles** L0A–L0C and **JacobianChallenge** LayerA own ordinary tensor, dual and pullback operations on scheme line bundles. A line on a stack is specified by its lines on family bases and coherent comparison isomorphisms, using `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`. Its QCoh pushforward clauses are not used.

A graph has half-edges paired into edges, with unpaired external legs carrying the marking labels; a loop has two incident flags. A one-edge type Γ is connected, weighted by vertex genera, stable at every vertex, and taken up to isomorphisms fixing every external label. Its genus is the sum of vertex genera plus its first Betti number. For each vertex v let F(v) contain its external legs and incident edge flags. Put

PΓ = ∏ᵥ M̄_{gᵥ,F(v)}, GΓ = Aut(Γ), QΓ = [PΓ/GΓ].

GΓ is a **constant** finite group scheme. A loop has branch-exchange group C₂. A separating type has exchange group C₂ exactly when its two vertex genera agree and there are no external markings; otherwise its graph automorphism group is trivial. The quotient is a stack quotient, retaining stabilizers. No order of GΓ is inverted.

For a chosen node use **relative partial normalization at that node**, retaining all other nodes. Absolute normalization of a family’s total space changes a nonnormal base and is not this operation. The one-edge type remembers the genera and marking partition of the connected cut pieces, not the full graph of a curve with further nodes.

The boundary Δ is reduced. On a chart with r nodes its equation is a unit times ∏ⱼtⱼ. The normalization separates these *local* branches, even if several belong to one global boundary component. For a selected branch its conormal is (tⱼ)/(tⱼ²), while its normal is the dual. An arbitrary family mapping entirely into Δ still pulls back these line bundles; the inverse-image divisor need not be Cartier on that base.

Write Lᵢ=sᵢ*ω_{C/S}≅sᵢ*Ω¹_{C/S}. Use ψᵢ=c₁(Lᵢ) only when an intersection-theory consumer supplies that operation. Branch exchange on the smoothing conormal is unsigned. The residue sign and ordered Hodge determinant signs belong to MC.5.

## Existing targets and their complete interfaces

The node ids in this section are imported from `StableReductionPartII.json`, not redeclared by this part. API names retain their original namespaces. Each table is a mathematical specification; the Lean file cannot name these geometric carriers at the pins.

### Separating and nonseparating clutching

For a partition I ⊔ J of the external labels, g₁+g₂=g, and stable source types, separating clutching is

ξ_{g₁,I}: M̄_{g₁,I∪{a}} × M̄_{g₂,J∪{b}} → M̄_{g,I∪J}.

It identifies the two distinguished smooth sections and retains I ⊔ J. Both factors may already be nodal. The target genus is g₁+g₂. For stable (g−1,n+2), nonseparating clutching is

ξ_irr: M̄_{g−1,{1,…,n,a,b}} → M̄_{g,n}.

It identifies a and b on the connected input; the arithmetic genus increases by one. The target object forgets which node was created. The pushout universal property supplies the induced arrows, exchange and pullback coherence. These are `MC.3/separating-clutching` and `MC.3/nonseparating-clutching`. Knudsen II, Definition3.8 and Corollary3.9(a), printed p.190 (PDF30), are the source locators. The parent's family pushouts are the underlying constructions.

**Separating clutching morphism API.**

| Declaration | Required behavior |
| --- | --- |
| `SeparatingClutching.map` | Glue the two distinguished smooth sections over their common base. |
| `SeparatingClutching.genus` | The target arithmetic genus is g₁+g₂ with the ordered I∪J markings. |
| `SeparatingClutching.baseChange` | The construction respects pullback and the canonical exchange of the two labelled inputs. |
| `SeparatingClutching.mapIso` | Marked isomorphisms of each input induce the unique isomorphism of glued curves whose restrictions to the two inputs are the given maps; identity and composition follow from the pushout universal property. |
| `SeparatingClutching.pushout` | For any S-scheme T, maps from the glued curve to T are exactly pairs of maps from the two input curves that agree on the identified sections; the descended map is unique. |

**Checks.**

- `SeparatingClutching.rationalBoundary`: Gluing two copies of M̄₀,₃ gives a boundary point of M̄₀,₄ indexed by a2+2 partition.
- `SeparatingClutching.equalGenera`: For n=0 and equal genera, swapping the two source factors induces the same target object; the graph exchange symmetry must be retained.
- `SeparatingClutching.twoEllipticTails`: Over C let three pairwise nonisomorphic elliptic curves form a stable genus-three one-pointed tree with the mark on the middle component. Choosing either outer elliptic tail gives two nonisomorphic preimages under ξ_{1,∅}:M̄₁,₁×M̄₂,₂→M̄₃,₁.

**Nonseparating clutching morphism API.**

| Declaration | Required behavior |
| --- | --- |
| `NonseparatingClutching.map` | Glue the last two sections by the parent pushout. |
| `NonseparatingClutching.exchange` | Exchanging the two removed sections yields a canonically isomorphic target. |
| `NonseparatingClutching.graph` | The graph gains one edge and b₁ increases by one. |
| `NonseparatingClutching.baseChange` | The gluing comparison after T→S is the unique isomorphism induced by the two pushout diagrams; it preserves retained markings and satisfies identity and iterated-base-change coherence. |
| `NonseparatingClutching.pushout` | A map from the self-glued curve to an S-scheme T is uniquely determined by a map from the input curve equal on the two identified sections. |

**Checks.**

- `NonseparatingClutching.genusOne`: M̄₀,₃ maps to the rational nodal boundary of M̄₁,₁.
- `NonseparatingClutching.branchExchange`: The boundary normalization retains the branch-exchange quotient; M̄_{g−1,n+2} alone is not the unlabelled normalization.
- `NonseparatingClutching.genus`: Self-gluing two disjoint points on a connected genus-h curve gives arithmetic genus h+1.

The finite-unramified endpoint is `MC.3/clutching-finite-unramified`. For a fixed target family the fibre product is the **scheme** of decorated node choices, as established by the new relative comparison below. A choice can exist only over a closed smoothing locus. Finiteness and unramifiedness do not imply flatness or étaleness over the target moduli stack.

The global separating closed-immersion claim in Knudsen II, Corollary3.9(b), p.190, fails. Choose three elliptic curves with distinct j-invariants in a chain and one marking on the middle curve. Cutting either end node gives a distinct preimage under M̄₁,₁×M̄₂,₂→M̄₃,₁. The first elliptic factors are nonisomorphic. This is inherited confirmed finding `StableReductionPartII/E3`; the packet records the fresh scan check and bounded correction search. The two choices remain distinct after fixing the target object and its gluing isomorphism, even when other target curves have node-permuting automorphisms.

### Boundary types and normalization

`MC.3/boundary-types` uses the graph conventions above. Its PΓ is compactified: the vertex factors can contain their own boundary. `MC.3/boundary-normalization` identifies the disjoint union of QΓ with the normalization of the reduced total boundary. For unpointed genus g≥2 the types are Δ₀ and Δᵢ, 1≤i≤⌊g/2⌋. Δ₀ is the closure of the nonseparating one-node locus; its compactification can include reducible curves. The new normalization-comparison theorem gives the precise relation to the accepted general stack-normalization construction.

**Stable one-edge boundary types API.**

| Declaration | Required behavior |
| --- | --- |
| `BoundaryType.vertexProduct` | Associate the product of the pointed vertex moduli stacks. |
| `BoundaryType.automorphisms` | Graph automorphisms preserve genera and every external leg label. |
| `BoundaryType.map` | Clutching descends through the graph automorphism action to the target boundary divisor. |
| `BoundaryType.quotientDescent` | The quotient [∏_v M̄_{g_v,val(v)}/Aut(Γ)] classifies, over S, an Aut(Γ)-torsor together with an equivariant family in the vertex product. Its descended clutching is compatible with pullback; quotient by the constant group retains stabilizers, including in characteristic two. |

**Checks.**

- `BoundaryType.zeroFour`: There are exactly three one-edge types for(g,n)=(0,4).
- `BoundaryType.genusTwoUnpointed`: The unpointed genus-two types are Δ₀ and Δ₁; Δ₁ has the exchange of its two genus-one vertices.
- `BoundaryType.nonseparatingExchange`: The one-loop graph has branch-exchange automorphism, even in characteristic two; the quotient is by a constant finite group, not by μ₂.
- `BoundaryType.zeroThreeEmpty`: There is no stable one-edge genus-zero graph with three labelled legs: for two genus-zero vertices joined by an edge, stability requires at least two legs on each vertex. Thus M̄₀,₃ has empty boundary.

### Marking lines and the forgetful correction

`MC.3/cotangent-line` defines Lᵢ on each family as above. For the smooth section with ideal Iᵢ, the conormal/differential isomorphism gives Lᵢ≅sᵢ*(Iᵢ/Iᵢ²). The normal line of the section is Lᵢ^∨. Stack descent uses the family pullback cocycle, rather than a choice of universal curve over a coarse space. Knudsen III, §4, printed p.201 (PDF2), supplies the family-level definition and cocycle convention.

**Cotangent lines at the markings API.**

| Declaration | Required behavior |
| --- | --- |
| `MarkingCotangentLine.pullback` | For a family over S, the pulled-back line is sᵢ*ω_{C/S}. |
| `MarkingCotangentLine.differentials` | At a smooth marking Lᵢ≅sᵢ*Ω¹_{C/S}. |
| `MarkingCotangentLine.relabel` | Permuting marking labels permutes the corresponding line bundles. |
| `MarkingCotangentLine.pullbackCoherence` | The line comparison for composable base maps U→T→S equals the composite of their comparisons under the canonical pullback associator, and the identity comparison is the identity; isomorphisms of pointed families preserve this data. |
| `MarkingCotangentLine.conormal` | On a family, the marking ideal Iᵢ gives Lᵢ≅sᵢ*(Iᵢ/Iᵢ²), canonically, using the smooth-section conormal/differential comparison. The section normal line is its dual. |

**Checks.**

- `MarkingCotangentLine.zeroThree`: On M̄₀,₃≅Spec Z every marking cotangent line is trivial.
- `MarkingCotangentLine.zeroFour`: On M̄₀,₄≅P¹ each Lᵢ has degree1.
- `MarkingCotangentLine.sign`: The section normal line is Lᵢ∨, so its first Chern class is−ψᵢ, not ψᵢ.

For π:M̄_{g,n+1}→M̄_{g,n} and a retained label i, the divisor D_{i,n+1} has a rational tail carrying exactly i, n+1 and the attachment. The existing theorem `MC.3/forget-cotangent-line` is the line-bundle identity

π*Lᵢ ≅ Lᵢ ⊗ O(−D_{i,n+1}), equivalently Lᵢ ≅ π*Lᵢ ⊗ O(D_{i,n+1}).

All types must be stable, including the forgetful target. The comparison π*Lᵢ→Lᵢ is induced by contraction and has a simple zero on D. Knudsen III, Theorem4.1(c), printed p.202, and its proof p.203 (PDF3–4), obtains this from a transverse-section exact sequence. Pulling the resulting line-bundle isomorphism back to any family is legitimate even if its image lies in D; treating the inverse image as a Cartier embedding on that base is not.

Finally `MC.3/node-conormal` requires C≅L_a⊗L_b on a vertex-product cover of the normalized selected boundary branch. Thus the normal is L_a^∨⊗L_b^∨, with c₁=−ψ_a−ψ_b wherever defined. The new integral descent construction below supplies the nonlinear parameter, graph-equivariance and atlas comparisons needed for this endpoint. Hacking, Lemma4.2, p.814, is a characteristic-zero check; its §2 p.810 hypotheses do not prove the integral statement.

## Six refinements of the existing targets

All node ids below have prefix `StableReductionPartII:MC.3/`. Their prerequisites are immediate contracts; the imported supplier graph and its remaining obligations are recorded after the targets. Small algebraic steps stay in the proof sketches.

### The stack of persistent nodes

`StableReductionPartII:MC.3/persistent-node-incidence` — construction.

For stable g,n, define N_{g,n} over M̄_{g,n}: its objects over S are stable ordered n-pointed families C/S together with a section q:S→Sing(C/S) of the scheme-theoretic relative singular locus. Arrows preserve q. Its pullback along a family C/S is canonically Sing(C/S), so N→M̄ is representable by schemes, finite and unramified, with empty pullback for a smooth family. Over N there is a finite étale degree-two scheme B→N of branches at the chosen node, and its ordering torsor is a torsor under the constant group C₂. This étaleness is over N, not over M̄ or an arbitrary smoothing base.

**Hypotheses.**

- g,n≥0, 2g−2+n>0; base schemes are arbitrary; family, singular-scheme and gluing inputs are the parent contracts R1 and R2 below.
- A chosen node is a section of Sing as a scheme, including its nilpotents. It need not exist on the whole base of a family with singular geometric fibres.

**Proof route.**

1. Pull back the parent relative singular scheme of the universal curve and use its formation under arbitrary base change to define the stack of pairs. The identification S×_{M̄}N=Sing(C/S) includes its structure sheaf.
2. The singular locus is closed in a proper curve, of finite presentation, and has finite geometric fibres. Proper and quasi-finite gives finite; nodality makes it unramified. On xy=a over R, it is Spec(R/(a)), since the relative Jacobian ideal is (x,y).
3. On the base of a chosen persistent node, use the parent local gluing/normalization contract: split xy=0 has two branches, and their permutations are étale transition data. Descend the two-element scheme and its ordering torsor. Every change of split nodal chart permutes the two branches and satisfies the cocycle.

**API.**

| Declaration | Required behavior |
| --- | --- |
| `PersistentNode.stack` | The stack N of stable curves with a chosen singular section. |
| `PersistentNode.familyPullback` | S×_{M̄}N≅Sing(C/S) as S-schemes, naturally in the family C/S and its isomorphisms. |
| `PersistentNode.baseChange` | Node incidence commutes with every base map, with identity and composition comparisons inherited from the universal curve and singular-scheme base change. |
| `PersistentNode.finiteUnramified` | The forgetful morphism to M̄ is representable finite unramified. |
| `PersistentNode.branches` | The degree-two finite étale branch scheme on N and its canonical free exchange involution. |
| `PersistentNode.branchOrdering` | The Isom({a,b},B) ordering cover is a torsor under the constant permutation group of a two-element set; its quotient is N. |

**Discriminating unit tests.**

- `PersistentNode.smoothing` (non-example): For C=Spec(k[t,x,y]/(xy−t)) over Spec k[t], the relative singular scheme is V(t), and its map to the base is not flat. This affine chart test does not require the curve to be proper.
- `PersistentNode.nilpotentParameter` (computation): For R=k[ε]/ε² and xy=ε, the node incidence is Spec k, so its geometric node does not extend to a node section over Spec R.
- `PersistentNode.splitNode` (compatibility): For xy=0 over any commutative R, incidence is Spec R and the branch scheme is Spec R ⨿ Spec R.
- `PersistentNode.smoothEmpty` (degenerate): For a smooth stable family Sing and its node-choice space are empty. In particular N_{0,3} is empty.
- `PersistentNode.charTwo` (non-example): Over F₂ the branch-ordering fibre is the constant two-element scheme, which is reduced; μ₂ is nonreduced.

**Uses.** `StableReductionPartII:MC.3/decorated-node-fibre-equivalence`: Provides the exact relative object represented by a clutching fibre product.; `StableReductionPartII:MC.3/boundary-normalization-comparison`: Provides the node-labelled stack that separates intersecting local boundary branches.

**Acceptance.**

- For xy=t over k[t], the node incidence is Spec k→Spec k[t], finite unramified and nonflat.
- The branch-ordering cover has two geometric points in characteristic two; it is not μ₂.
- A family pulled back into t=0 may have a persistent node even over a nonreduced base; use relative partial normalization rather than absolute normalization.

**Direct prerequisites.** `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.0/pullback-coherence`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`, `SchemeAndStackFoundations:SF.1/representable-stack-morphism`, `mathlib:Ideal.Quotient.mk`.

**Sources.** knudsen2, Definition3.8 and Corollary3.9(a), §3, printed p.190 (PDF30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part(b) is corrected by the recorded counterexample.; stacks-nodes, Lemma53.21.1, §53.21, tag0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.

### Clutching fibres as decorated node choices

`StableReductionPartII:MC.3/decorated-node-fibre-equivalence` — theorem.

For a stable connected one-edge graph Γ with labelled external legs, let PΓ be the existing compactified vertex product and GΓ its constant finite label-preserving automorphism group. Let NΓ⊂N_{g,n} be the open-and-closed substack where partial normalization at the chosen node, with all other nodes retained, has the connected-component genera and external marking sets prescribed by Γ. Cutting and parent gluing give an equivalence [PΓ/GΓ]≃NΓ over M̄_{g,n}. The map PΓ→NΓ is a finite étale GΓ-torsor in the sense of stacks, even when GΓ acts with fixed isomorphism classes. For any C/S, S×_{M̄}PΓ is the scheme of Γ-decorated node choices on C/S; forgetting the decoration is finite étale over the corresponding open-and-closed subspace of Sing(C/S). Consequently both ordered clutching maps are representable finite unramified, without a global closed-immersion assertion.

**Hypotheses.**

- The family-level inverse to gluing is supplied by R2: partial normalization at a persistent node, compatible with arbitrary base change and retaining every other node.
- The original definitions of PΓ, GΓ and both clutching functors are imported without new copies. Γ has exactly one edge, and all its vertex types are stable.

**Proof route.**

1. Over the branch-ordering cover use relative partial normalization, locally R[x,y]/(xy)→R[x]×R[y], with equal constants giving the original ring. Replace only the selected node. For an external edge the result has two connected components; for a loop it is connected. In either case its new smooth sections carry the two flags. The parent genus and stability formulas give exactly the vertex types.
2. The gluing universal property and the relative partial-normalization comparison provide natural unit and counit isomorphisms on objects and arrows, compatible with base change. Thus this is an equivalence of groupoids over each scheme, not a count of geometric points.
3. For families with a chosen node, its separating/nonseparating character and the genus/leg partition of the cut components are étale locally constant: the relative cut is proper flat nodal and its connected components and their genera persist in the nodal deformation charts. Equivalently smoothing the unchosen edges contracts only edges other than the chosen one and preserves these data. Use the relative component/genus contract in R2, not absolute normalization of the total space.
4. Decorations are exactly identifications of these components/flags with Γ, a simply transitive GΓ-set after an étale cover. Descend their torsor. This proves the quotient equivalence and represents the fibre product by a finite étale cover of an open-and-closed part of Sing(C/S). Finiteness and unramifiedness then follow from persistent-node incidence; no argument infers étaleness over a smoothing base.

**Acceptance.**

- The fibre-product equivalence fixes the target family and its gluing isomorphism; it therefore keeps two different chosen nodes even if an automorphism of the target exchanges them.
- For a loop GΓ=C₂; for a separating edge it is C₂ exactly when g₁=g₂ and there are no external legs, and is trivial otherwise.
- The three-elliptic-chain counterexample has two node choices of the same Γ and hence two distinct preimages in the same ordered separating source.
- Use a relative cut over the actual base. Absolute normalization of a nonnormal or nonreduced total space is not this construction.

**Direct prerequisites.** `StableReductionPartII:MC.3/persistent-node-incidence`, `StableReductionPartII:MC.3/separating-clutching`, `StableReductionPartII:MC.3/nonseparating-clutching`, `StableReductionPartII:MC.3/boundary-types`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/torsor-representability`, `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`.

**Sources.** knudsen2, Definition3.8 and Corollary3.9(a), §3, printed p.190 (PDF30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part(b) is corrected by the recorded counterexample.; edidin-fulghesu, Propositions4.4–4.6 and Theorem4.7, §4, printed pp.177–180 (PDF11–14). Graph labels give finite étale covers of a fixed stratum, and the quotient of the compactified vertex product is its stack normalization. The relative one-edge comparison below includes further degenerations and labelled external markings.; stacks-nodes, Lemma53.21.1, §53.21, tag0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.

### Node incidence on pointed boundary charts

`StableReductionPartII:MC.3/node-atlas-branch-comparison` — theorem.

Let U→M̄_{g,n} be a sufficiently small étale scheme chart at a geometric stable curve with r nodes, with the independent smoothing coordinates t₁,…,tᵣ of the pointed normal-crossing chart. After further étale localization, U×_{M̄}N_{g,n}≅⨿_{j=1}^r V(tⱼ). The universal curve near the jth selected node has equation xⱼyⱼ=tⱼ after étale localization on curve and base. The chosen-node map V(tⱼ)→U is a regular codimension-one immersion and its conormal is (tⱼ)/(tⱼ²). On overlaps nodes can be permuted, and the corresponding local conormal lines identify coherently. For a map S→U, the node-incidence formula pulls back to ⨿V(tⱼ|S); that pullback need not be normal or Cartier.

**Hypotheses.**

- U is an étale chart of the moduli stack itself over Z, not an arbitrary family base.
- The pointed DM, universal-curve and normal-crossing results are imported from MC.2; the underlying unpointed versal parameters are MC.1. Parameters are local near a fixed finite set of nodes, after shrinking.

**Proof route.**

1. Start with the imported MC.1 versal node coordinates for g≥2. Extend to pointed types using the MC.2 universal-curve equivalence: adding a point at an old node replaces t by uv in the total base, while at a smooth point it adds a smooth coordinate; the new expanded curve has the corresponding two node parameters. Start separately at (0,3) and (1,1), as in the imported pointed DM proof. This is the chart form of that existing theorem, not a new moduli representability argument.
2. Use the parent arbitrary-base nodal normal form and the Jacobian calculation of incidence near each node. Finite unramified incidence can be étale locally separated into the chosen node branches, and after shrinking no additional singular points occur. Thus the jth branch is precisely V(tⱼ), with its scheme structure.
3. Since U is smooth over Z and the tⱼ are independent relative parameters, each V(tⱼ) is smooth over Z, hence regular and normal, and tⱼ is a nonzerodivisor. The unramified morphism has the displayed rank-one conormal. On a common chart refinement the chosen node determines the same local closed immersion; compare its ideal quotients and descend.

**Acceptance.**

- For r=0 the incidence is empty and the boundary equation is the unit empty product.
- At r=2 the total boundary is V(t₁t₂), while its two node branches are V(t₁) and V(t₂).
- Over S mapping into tⱼ=0, pull back the conormal line from V(tⱼ); do not replace it by the ideal quotient of the zero ideal on S.

**Direct prerequisites.** `StableReductionPartII:MC.3/persistent-node-incidence`, `StableReductionPartII:MC.1/versal-node-parameters`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `StableReductionPartII:MC.2/expansion-contraction-inverses`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `mathlib:Ideal.Cotangent`.

**Sources.** stacks-nodes, Lemma53.21.1, §53.21, tag0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.; stacks-nc, Lemma41.21.6, §41.21, tag0CBR (unpaginated HTML). The normalization of a normal-crossings divisor is étale locally the disjoint union of its regular branches, with the conormal of each selected branch of rank one.; knudsen2, Definition3.8 and Corollary3.9(a), §3, printed p.190 (PDF30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part(b) is corrected by the recorded counterexample.

### Chosen nodes and stack normalization

`StableReductionPartII:MC.3/boundary-normalization-comparison` — theorem.

Let Δ be the reduced total boundary of M̄_{g,n} over Z. Its normalization, in the sense of the imported DMNormalization construction, is canonically N_{g,n}. More explicitly, ⨿_{[Γ]}[PΓ/GΓ]≃N_{g,n}≃Δ^ν, compatibly with the maps to M̄_{g,n}. The normalization map is representable finite unramified and is an equivalence over the one-node boundary locus. The statement is about stacks: inertia that fixes a selected node remains, while automorphisms permuting distinct nodes act between different lifts. The construction agrees with R09.5 normalization on every smooth chart; no normalization/base-change claim for an arbitrary family base is included.

**Hypotheses.**

- g,n≥0 in the stable range; Δ is the reduced relative normal-crossings boundary over Z.
- Ordinary normalization means normalization of the reduction in its total rings of fractions. Z is an excellent Nagata base.

**Proof route.**

1. By node-atlas-branch-comparison, the incidence over U is ⨿V(tⱼ) and the reduced boundary has equation ∏tⱼ. These branches are normal; their disjoint union is the normalization of V(∏tⱼ), including when several j have the same global boundary type.
2. Invoke the already planned R09.5/dm-normalization and its smooth-chart characterization to glue this identification uniquely on atlas overlaps; invoke dm-normalization-finite for finiteness over Z. Do not construct stack normalization again here.
3. Use the relative decorated-node equivalence to identify the connected type pieces of N with the graph quotients. Over a one-node curve the node scheme is the base, so the incidence is an equivalence on that locus, including its stabilizers. Combine with the local branch computation to obtain the original boundary-normalization endpoint.

**Acceptance.**

- On M̄₀,₃ the boundary, N and the coproduct of graph quotients are empty.
- For (0,4), the normalization is the three boundary sections over Spec Z.
- For (1,1), the boundary normalization is [M̄₀,₃/C₂]≃BC₂, not Spec Z. For (2,0), both Δ₀ and Δ₁ have the appropriate C₂ quotients.
- At the two-tail genus-three curve N has two selected-node lifts in the same type piece; a global boundary component need not be embedded smoothly.

**Direct prerequisites.** `StableReductionPartII:MC.3/decorated-node-fibre-equivalence`, `StableReductionPartII:MC.3/node-atlas-branch-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization`, `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite`, `SchemeAndStackFoundations:SF.1/quotient-stack`.

**Sources.** edidin-fulghesu, Propositions4.4–4.6 and Theorem4.7, §4, printed pp.177–180 (PDF11–14). Graph labels give finite étale covers of a fixed stratum, and the quotient of the compactified vertex product is its stack normalization. The relative one-edge comparison below includes further degenerations and labelled external markings.; stacks-norm, Lemmas101.46.1–101.46.2 and Definition101.46.3, §101.46, tags0GMI–0GMK (unpaginated HTML). Stack normalization is characterized by normalization on smooth scheme charts and glued from the normalized groupoid. R09.5 already owns this general construction.; stacks-nc, Lemma41.21.6, §41.21, tag0CBR (unpaginated HTML). Normal crossings give an unramified normalization locally equal to the separate regular divisor branches.

### The integral smoothing conormal

`StableReductionPartII:MC.3/smoothing-conormal-descent` — construction.

For j:N_{g,n}≃Δ^ν→M̄_{g,n}, construct the invertible conormal C_j by its étale-local description (t)/(t²) for the selected node branch, and its dual normal line C_j^∨. On the vertex-product cover PΓ→NΓ, give the canonical isomorphism C_j|PΓ≅L_a⊗L_b. The graph-equivariant structure uses ordinary unsigned symmetry when the flags are exchanged. In split charts a change of branch parameters x′=u₁x+O(x²), y′=v₁y+O(y²) on the cut central curve multiplies the smoothing conormal generator by u₁v₁; general lifts across the first infinitesimal neighborhood give the same law, regardless of their higher terms. These transitions satisfy composition, base-change and atlas-refinement coherence over Z, including characteristic two.

**Hypotheses.**

- j is the finite unramified chosen-node map; its local closed-immersion charts are supplied by node-atlas-branch-comparison.
- L_a,L_b are the imported marking cotangent lines on the cut curve, using their identification with branch differentials. The coordinates are formal parameters along the two smooth sections; their linear coefficients are units in the base ring.
- This concerns the conormal of the chosen branch in the moduli stack. It is not the ideal of an arbitrary pulled-back boundary family, or the torsion differential on the singular curve.

**Proof route.**

1. On each pointed nodal moduli chart use the conormal of V(t) in U, and descend on common étale refinements. This produces a line because t is regular on the moduli chart. The native module for an affine ideal quotient is Ideal.Cotangent; scheme and stack sheafification remain supplier operations.
2. Compute the first-order smoothing class of xy=0 over any R by the relation module of the hypersurface: the map A²→A is (α,β)↦yα+xβ, and its cokernel is A/(x,y)=R, where A=R[x,y]/(xy). A perturbation of the equation contributes its value at the node; changes of lifted coordinates contribute a Jacobian term and disappear in this quotient. This computation, including nilpotents in R, shows that higher branch-parameter terms change no first-order multiplier. Comparing xy=t and x′y′=t′ gives [t′]=u₁v₁[t].
3. At each branch, [dx′]=u₁[dx] and [dy′]=v₁[dy]. Hence [t]↦[dx]⊗[dy] is independent of the split parameter choice. On overlaps with varying base coordinates use these pullback differential lines and the same relative Jacobian calculation. The product of slopes under composition is exactly the tensor transition cocycle. Polishchuk Proposition3.5 and Lemma4.6 provide an independent integral formal-coordinate check; Theorem1.2 over Q is not used.
4. For exchange x↔y, the relation xy and t are unchanged. The tensor identification exchanges the two factors by TensorProduct.comm without a sign. Descend the equivariant line along the constant GΓ-torsor and then along the moduli atlas by SF.1/stack-quasi-coherent. Invertibility and equality of maps can be checked after the faithfully flat cover. Use no averaging and no exactness claim for invariants.
5. Dualizing gives the normal line L_a^∨⊗L_b^∨; with a consumer’s integral or rational first-Chern-class API its class is −ψ_a−ψ_b. Only the class notation is imported from intersection theory, not a new Chow theory.

**API.**

| Declaration | Required behavior |
| --- | --- |
| `SmoothingConormal.line` | The invertible conormal of N→M̄ from its étale-local codimension-one immersions. |
| `SmoothingConormal.chart` | On the selected-node chart V(t)⊂U the line is the sheaf associated to (t)/(t²). |
| `SmoothingConormal.branchTensor` | On PΓ identify the conormal with L_a⊗L_b by [t]↦dx⊗dy. |
| `SmoothingConormal.changeParameters` | For arbitrary formal changes of the two branch parameters with slopes u₁,v₁, the conormal comparison multiplies by u₁v₁. Coordinate-lift errors in the Jacobian ideal do not contribute. |
| `SmoothingConormal.exchange` | The branchTensor comparison commutes with flag exchange and the unsigned symmetry of the two cotangent factors; exchange squared is the identity. |
| `SmoothingConormal.pullbackCoherence` | Pullback of the line along S→N agrees with s_a*Ω⊗s_b*Ω on an ordered cut, and the comparisons satisfy identity, composition and common-atlas-refinement coherence. |
| `SmoothingConormal.normal` | The dual line, with its canonical comparison to L_a^∨⊗L_b^∨ on every vertex cover. |

**Discriminating unit tests.**

- `SmoothingConormal.unitSlopes` (computation): For x′=ux,y′=vy,t′=uvt with u,v units in any R, both conormal and branch tensor generators scale by uv; the normal generator scales by (uv)^(−1).
- `SmoothingConormal.higherJets` (non-example): The change x′=x+cx² with inverse as a formal series, and y′=y+dy², has trivial induced multiplier on the chosen conormal. This checks more than constant rescalings.
- `SmoothingConormal.exchangeCharTwo` (compatibility): The exchange of x and y fixes [t] and gives dx⊗dy↦dy⊗dx integrally, including over F₂. The constant exchange torsor remains étale in characteristic two.
- `SmoothingConormal.twoNodes` (non-example): On V(t₁t₂)⊂U, choosing node1 gives (t₁)/(t₁²). Pulling back the total divisor conormal instead brings the other branch factor and vanishes in its comparison at t₂=0; it cannot replace the chosen conormal.
- `SmoothingConormal.constantBoundaryFamily` (non-example): A family S→N with t|S=0 still pulls back a rank-one conormal line. The ideal of its inverse-image boundary in S is zero and would give a zero conormal.

**Uses.** `StableReductionPartII:MC.3/node-conormal`: Discharges its integral higher-parameter, graph-equivariance and atlas-descent contracts.; `StableReductionPartII:MC.5/boundary-divisor`: Supplies the local smoothing branch convention; Hodge residue and determinant exchange signs are separate MC.5 data.

**Acceptance.**

- Exchange must preserve the smoothing conormal over Z. The differential x dy instead changes to y dx=−x dy on xy=0 and is a different object.
- The identification extends across extra nodes because it is made for the selected branch rather than only on the open one-node locus.
- For a change x′=x+cx² on a branch, its slope is1, hence the induced conormal multiplier is1; nonlinear terms cannot create an extra factor.

**Direct prerequisites.** `StableReductionPartII:MC.3/node-atlas-branch-comparison`, `StableReductionPartII:MC.3/decorated-node-fibre-equivalence`, `StableReductionPartII:MC.3/cotangent-line`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, `mathlib:Ideal.Cotangent`, `mathlib:TensorProduct.comm`, `mathlib:TensorProduct.map`, `mathlib:TensorProduct.map_comp`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

**Sources.** polishchuk, Proposition3.5, §3.3, p.11; Lemma4.6 and proof of Theorem1.1, §4.3, pp.15–16. Over commutative Z[q]/q^(n+1)-algebras, the boundary section is the smoothing parameter and its determinant trivialization is invariant under the gluing group, with the inverse scaling for a parameter rescaling. This supports the integral transition law; the arbitrary-pointed atlas and conormal comparison are deduced explicitly here.; hacking, §3 pp.810–811 and Lemma4.2, §4, pp.813–814 (PDF3–4,6–7). The normal space is the local node-deformation space, and the pullback of the boundary conormal is the tensor of branch cotangent lines. The source’s characteristic-zero scope is retained as a comparison check.; stacks-nodes, Lemma53.21.1, §53.21, tag0CBY (unpaginated HTML). An arbitrary-base nodal family is étale locally the pullback of xy=t. Its Jacobian calculation gives the scheme structure on node choices, not just its geometric points.

### Marking lines under clutching and forgetting

`StableReductionPartII:MC.3/marking-line-clutching-coherence` — theorem.

For every retained external label i, separating or nonseparating clutching pulls L_i on the target back canonically to the marking cotangent line on the vertex factor carrying i. These isomorphisms commute with marked-family isomorphisms, relabelling, iterated arbitrary base change, and permitted graph permutations. The marking-line conormal comparison L_i≅s_i*(I_i/I_i²) uses the smooth section; its dual is the section normal line. For π:M̄_{g,n+1}→M̄_{g,n} the imported forgetful comparison π*L_i≅L_i(−D_{i,n+1}) is the morphism induced by contraction, with a simple zero along the rational-tail divisor. Its identity away from D and divisor description are compatible with the same pullback and relabelling conventions.

**Hypotheses.**

- 2g−2+n>0 for the forgetful target; i is retained, and all source vertex types of a clutching map are stable.
- D_{i,n+1} is the rational tail with marks i,n+1 and the attaching node, a Cartier divisor on the moduli stack. The comparison is pulled back as a line-bundle isomorphism even when a family maps into D.
- The parent relative dualizing and Cartier-section inputs have locally Noetherian scope before the arbitrary-base extension R3; the final family interface requires that extension.

**Proof route.**

1. The parent gluing morphism is an isomorphism near every retained smooth section. Pull back relative differentials along that section and use the imported canonical identification s_i*ω≅s_i*Ω. This gives the retained-line comparison without choices of local coordinates.
2. Use the smooth-section conormal/differential comparison in R3; the ideal vanishes along the section, but its restriction I/I² is rank one. Parent base-change and gluing uniqueness give unit, composition, relabelling and graph-equivariance diagrams; descent uses the compatible-family formulation of stack QCoh.
3. For forgetting use the original MC.3/forget-cotangent-line endpoint with its source proof: Knudsen III Theorem4.1(c), pp.202–203, pulls the exact sequence to a section transverse to the exceptional divisor. The quotient has length one along D, so the map π*L_i→L_i has exactly that simple zero. This fixes the sign and hence L_i≅π*L_i⊗O(D). Do not reprove contraction or construct new ordinary sheaf tensor operations here.

**Acceptance.**

- For M̄₀,₄→M̄₀,₃, π*L_i is trivial and D_{i,4} is one boundary section; thus L_i has degree1 on P¹, fixing the sign.
- For retained marks on opposite sides of separating clutching, the two comparisons land on their respective factors. Self-clutching leaves every retained marking line unchanged.
- Pullback along a constant map into D preserves the line-bundle identity; it does not preserve the effective-Cartier presentation as an embedding in that base.

**Direct prerequisites.** `StableReductionPartII:MC.3/cotangent-line`, `StableReductionPartII:MC.3/forget-cotangent-line`, `StableReductionPartII:MC.3/separating-clutching`, `StableReductionPartII:MC.3/nonseparating-clutching`, `StableReductionPartII:MC.2/forget`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

**Sources.** knudsen3, Marking-line definition in §4, printed p.201 (PDF2); Theorem4.1(c) and its proof, printed pp.202–203 (PDF3–4). The contraction comparison has the negative rational-tail twist on π*L_i, proved using a transverse-section exact sequence.; knudsen2, Definition3.8 and Corollary3.9(a), §3, printed p.190 (PDF30). The two clutching maps are finite unramified; the proof passes through the relative singular scheme. Part(b) is corrected by the recorded counterexample.; hacking, §3 pp.810–811 and Lemma4.2, §4, pp.813–814 (PDF3–4,6–7). The normal space is the local node-deformation space, and the pullback of the boundary conormal is the tensor of branch cotangent lines. The source’s characteristic-zero scope is retained as a comparison check.

## Supplier contracts and the closure boundary

The new deductions do not assume that a planned supplier is already formalized. The original packet and its independent review retain the MC.0–MC.2 arbitrary-base, cohomology and algebraization obligations. This part consumes their exact target statements and records the remaining dependency boundary.

| Contract | Owner | Required output |
| --- | --- | --- |
| MC3-R1 | `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs` | Use the parent relative singular closed scheme of a finitely presented nodal curve, its arbitrary-base-change comparison and unramified map to the base; provide the arbitrary-ring étale nodal chart xy=a of Stacks53.21.1, not only the displayed DVR charts. For a proper family Sing is proper quasi-finite and hence finite. Keep its branch cover finite étale over a persistent-node base, not over an arbitrary smoothing base. |
| MC3-R2 | `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves` | Import external/self gluing and their normalization/pushout universal properties. The reverse comparison needed here is relative partial normalization at ONE chosen persistent node, retaining all other nodes, finite and compatible with arbitrary base change, with a degree-two étale preimage and smooth branch sections after ordering. For split xy=0 the local algebra is R[x]×R[y] with equal constants recovering R[x,y]/xy. Require proper flat nodal cut families, étale-local constancy of the number of their connected components and of their genera/leg partition, and unit/counit/naturality on arrows. The current layer explicitly owns gluing and normalization properties; its field-normalization statement alone does not supply this full reverse contract. |
| MC3-R3 | `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity` | Import the invertible nodal dualizing sheaf, its smooth-locus differential identification, smooth-section Cartier/conormal comparison, genus/cohomology base change and their canonical coherence. Extend the locally Noetherian construction to arbitrary family bases by finite-presentation approximation with descent independent of the Noetherian model. Ordinary scheme line tensor/dual/pullback operations must use the current AlgebraicVectorBundles L0A–L0C and Jacobian ownership; MC.3 adds only moduli descent and comparisons. |

R1 is stronger than the parent's displayed DVR normal form, and R2 spells out the reverse direction of its gluing/normalization promise. These are explicit requests to their owner, with local formulas and an exact source for R1. They are not silently treated as existing theorems. R3 retains the locally Noetherian/arbitrary-base distinction. MC.3 provides the relative groupoid and conormal deductions conditional on these contracts.

The following exact nodes replace the old opaque stack-normalization and descent requests:

| Supplier | Exact interface used |
| --- | --- |
| `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization` | The normal DM stack characterized by ordinary normalization on every smooth scheme chart, using the reduction before integral closure. |
| `AlgebraicModuliForArithmeticGeometry:R09.5/dm-normalization-finite` | Finite normalization for a finite-type DM stack over a locally Noetherian Nagata base, in particular over Z. |
| `SchemeAndStackFoundations:SF.1/quotient-stack` | Torsor description of [PΓ/GΓ] and its pullback comparison. |
| `SchemeAndStackFoundations:SF.1/torsor-representability` | Effective torsor descent and representability; finite étaleness for the constant finite group follows locally from its trivial torsor. |
| `SchemeAndStackFoundations:SF.1/affine-fpqc-descent` | Effective descent for the finite affine data of a relative cut and its decorations. |
| `SchemeAndStackFoundations:SF.1/representable-stack-morphism` | Correct scheme/algebraic-space fibre-product meaning of representability. |
| `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `qcoh-fpqc-descent` | Compatible-family QCoh and effective descent of the line maps; no exactness of invariants. |

R09.5 is an accepted plan. SF.1 is `needs_changes` at this checkout; its exact descent interfaces are specifications, and its unrelated pushforward issues are not consumed. No claim of transitive closure follows merely from citing those ids. The packet records two gaps: the parent contracts R1–R3, and these inherited geometric/foundational interfaces.

The independent MC.3 consumer checks are the original MC.5 targets `separating-hodge`, `nonseparating-hodge` and `boundary-divisor`. They need gluing naturality, graph quotients and the local smoothing convention. This part supplies unsigned conormal descent; it leaves the ordered Hodge determinant sign (−1)^{g₁g₂} and the sign of an exchanged residue to MC.5. No new external packet with a direct MC.3 prerequisite was found in the checkout; existing local roadmap stage links MC.3→MC.4 and MC.3→MC.5 remain the interface boundary.

## Worked acceptance calculations

1. **A smoothing over a reduced base.** On xy=t over k[t], Ω is presented by x dy+y dx=0. Its relative singular ideal is (x,y); quotienting the chart by that ideal gives k[t]/(t). The node exists exactly on V(t). The map k[t]→k is finite and unramified, while multiplication by t on k[t] becomes zero on its nonzero quotient, so the quotient is not flat. The two branches form an étale cover only after restricting to the node base.
2. **A geometric node over an infinitesimal smoothing.** On xy=ε over k[ε]/ε² the same quotient gives k. A section over the whole dual-number base would split k[ε]/ε²→k as an algebra over k[ε]/ε², forcing ε=0, which is impossible. Counting geometric nodes misses this obstruction. For xy=0 instead, the relative cut has local algebra R[x]×R[y], even if R is nonreduced.
3. **Empty and zero-dimensional boundaries.** M̄₀,₃≅Spec Z has empty boundary. A one-edge genus-zero graph would need two legs at each endpoint and thus at least four legs. For (0,4) the three unordered 2+2 partitions give three boundary sections. For (1,1), gluing the two unmarked flags of a three-pointed rational curve gives boundary BC₂; its graph automorphisms remain in characteristic two.
4. **Two nodes of the same type.** At the elliptic-chain example, a local chart has two chosen-node divisors V(t₁), V(t₂). Their union is V(t₁t₂), and its normalization has the two separate branches. Both nodes have the same global separating type; a normalization must distinguish them. Choosing node1 gives conormal (t₁)/(t₁²). The total boundary generator t₁t₂ maps to t₂[t₁] on that branch and vanishes at their intersection, so it cannot be a generator of the chosen conormal.
5. **Integral parameter changes.** Modulo the Jacobian ideal, first-order changes of the node equation give R. Changing branch coordinates with slopes u,v carries [t] to uv[t], exactly as dx⊗dy changes. Higher powers of x or y vanish at the node in this calculation. Interchanging x,y fixes xy=t and therefore [t]; the symmetry dx⊗dy↦dy⊗dx has no sign. The relation on torsion differentials y dx=−x dy concerns another module and cannot determine this smoothing action.
6. **Forgetful sign.** For M̄₀,₄≅P¹→M̄₀,₃, the target marking line pulls back trivially, and D_{i,4} is a single boundary point of degree1. Thus Lᵢ≅O(D_{i,4}) has degree1. The opposite sign would give degree−1 and fail this example.

## Pinned libraries and Suggested file

The pinned source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed StableReduction Layers1–3 audit reports missing geometric carriers, alongside ordinary algebraic and sheaf foundations. The current read-only roadmap and library were also checked, at roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The newer AlgebraicVectorBundles interfaces are reused; the other post-snapshot roadmaps and Completed names were screened for these targets. A name search is an ownership check, not an exhaustive theorem about absence.

The [suggested Lean file](../suggested/StableReductionPartII--MC.3.lean) follows the current `WORKERS.md` shape. Its two real-bodied abbreviations use the existing polynomial quotient carrier. Its three named theorems state the local Jacobian quotient for xy=q, the persistent-node case q=0, and the unit-parameter empty case. Six examples cover tensor slopes, unsigned exchange, exchange squared, transition composition, characteristic two, and the zero-ring base. Native tensor symmetry and composition are used as comparison tests, not proposed as new library work.

All six new geometric targets and the imported stack/marking/clutching APIs are README specifications because their carriers are absent at the pins. The file introduces no replacement stack, axiom, data hole or proposition encoding an unavailable geometric condition. Elaboration of its admitted local algebra statements does not implement the relative cut, the moduli stack, its normalization or its line descent. The handoff records the final compilation result.

The original ten added API omissions comprise seven MC.3 names, all specified in the tables above: `SeparatingClutching.mapIso`, `SeparatingClutching.pushout`, `NonseparatingClutching.baseChange`, `NonseparatingClutching.pushout`, `BoundaryType.quotientDescent`, `MarkingCotangentLine.pullbackCoherence`, and `MarkingCotangentLine.conormal`. The other three, `PointedExpansion.projLift`, `PointedExpansion.mapIso`, and `PointedExpansion.baseChangeCoherence`, belong to the imported `StableReductionPartII:MC.2/expansion` interface and remain owned there. All ten require the actual geometric carriers; the packet records each disposition. The empty-boundary test is `BoundaryType.zeroThreeEmpty`.

The six cited native declarations are:

| Declaration | Existing support and limit |
| --- | --- |
| `mathlib:Ideal.Cotangent` | The native module I/I², including its R/I-module structure; not the conormal sheaf of a stack morphism. |
| `mathlib:Ideal.Quotient.mk` | The quotient ring homomorphism R→R/I, used in the polynomial node chart prototype. |
| `mathlib:TensorProduct.comm` | The ordinary unsigned linear equivalence M⊗N≃N⊗M. These are ungraded modules. |
| `mathlib:TensorProduct.map` | Tensoring two semilinear maps with the same scalar homomorphism; supports ordinary linear transition maps as a special case. |
| `mathlib:TensorProduct.map_comp` | Tensor maps preserve composition, with the scalar homomorphism compatibility hypotheses supplied by the native statement. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | The full category of rank-one locally free modules on a scheme; it does not provide marking lines or their stack descent. |

## Planets

The five original MC.3 planets retain their ids: **Separating clutching**, **Nonseparating clutching**, **Finite unramified clutching**, **Stable boundary graphs**, and **Marking cotangent lines**. The new construction adds **Smoothing conormal line**. This is six planets across the combined stage; this part does not duplicate the existing five planet records.

## Sources and reading limits

All statements here are in our own words. The source receipts specify selected readings; a citation to an imported result retains the original packet's provenance rather than claiming that its whole proof was freshly read. No restricted book copy was needed.

- **The projectivity of the moduli space of stable curves, II: The stacks M_{g,n}**, Finn Faye Knudsen. Math. Scand. 52 (1983), 161–199; published scan. [Source](https://journals.msp.org/mscand/article/download/1622/1621/1653). Accessed 2026-10-18. Fresh visual reading of printed pp.189–190 (PDF29–30), including Definition3.8 and Corollary3.9. Other passages cited by the imported packet retain that packet’s reading provenance.
- **The projectivity of the moduli space of stable curves, III: The line bundles on M_{g,n}, and a proof of projectivity in characteristic 0**, Finn Faye Knudsen. Math. Scand. 52 (1983), 200–212; published scan. [Source](https://journals.msp.org/mscand/article/download/1623/1622/1654). Accessed 2026-10-18. Fresh visual reading of printed pp.201–203 (PDF2–4): marking-line convention, Theorem4.1(c) and its transverse-section proof; Theorem4.2. No fresh reading of the characteristic-zero projectivity proof.
- **Extended clutching construction for the moduli of stable curves**, Alexander Polishchuk. arXiv:2110.04682v3, 19 October 2024. [Source](https://arxiv.org/pdf/2110.04682v3). Accessed 2026-10-18. Introduction and Theorems1.1–1.2, pp.1–3; §2.1–2.2 through the start of Lemma2.3, pp.3–5; §3.3 Proposition3.5, p.11; §4.3 Lemma4.6 and proof of Theorem1.1, pp.15–16. These are selected passages, not a full-paper read.
- **Normalization of the 1-stratum of the moduli space of stable curves**, Dan Edidin; Damiano Fulghesu. Portugaliae Mathematica 69 (2012), 167–192; DOI10.4171/PM/1912. [Source](https://ems.press/content/serial-article-files/44698?nt=1). Accessed 2026-10-18. §2.1 opening noetherian-base convention, pp.168–169; Proposition3.7 and §4 Definitions4.1, Propositions4.4–4.6, Theorem4.7 and Remarks4.8–4.9, pp.175–180. Marked and arbitrary-ring comparison is supplied by the explicit deductions here, not by removing hypotheses from this source.
- **The moduli space of curves is rigid**, Paul Hacking. Algebra & Number Theory 2 (2008), 809–818; published version. [Source](https://msp.org/ant/2008/2-7/ant-v2-n7-p03-s.pdf). Accessed 2026-10-18. §2 characteristic-zero convention, p.810; §3 local Ext and normal-branch discussion, pp.810–811; §4 boundary covers and Lemma4.2, pp.813–814. Characteristic zero only.
- **Étale local structure of nodal families**, The Stacks Project Authors. Live HTML, stable tag 0CBY, unpaginated. [Source](https://stacks.math.columbia.edu/tag/0CBY). Accessed 2026-10-18. Lemma53.21.1, full statement and its first proof; the second proof is a sketch. Arbitrary base schemes are allowed. The approximation and Artin approximation facts cited there remain foundational imports.
- **Normalization of algebraic stacks**, The Stacks Project Authors. Live HTML, stable tags 0GMI–0GMK, unpaginated. [Source](https://stacks.math.columbia.edu/tag/0GMH). Accessed 2026-10-18. §101.46 Lemmas101.46.1–101.46.2 and Definition101.46.3, statements and groupoid construction. This is matched to the already accepted R09.5 supplier.
- **Normal crossings divisors**, The Stacks Project Authors. Live HTML, stable tag 0CBR, unpaginated. [Source](https://stacks.math.columbia.edu/tag/0CBR). Accessed 2026-10-18. Lemma41.21.6, statement and étale-local normalization argument. Local regular branches and their rank-one conormals are the input used here.

Edidin–Fulghesu gives the unpointed graph-quotient normalization over its noetherian-base setting. Its use of normalization in families is consumed here through R2's relative cut, never as absolute normalization of a nonnormal total space. Marked arbitrary-base statements require the specified family contracts and the explicit relative comparison. Polishchuk's Proposition3.5 and Lemma4.6 work over integral nilpotent-parameter rings; they support the coordinate law. His Theorem1.2 explicitly assumes Q and is not imported as an integral neighborhood-linearization result. Hacking's Lemma4.2 remains a characteristic-zero comparison. The integral conormal route above uses the relative hypersurface calculation and descent, not a change of source hypotheses.
