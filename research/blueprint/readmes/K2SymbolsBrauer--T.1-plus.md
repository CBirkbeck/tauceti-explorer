# Classical K₂ and the ring plus space

This layer identifies the kernel of the stable Steinberg extension with the second homotopy group of the ring plus space, and then with the second homotopy group of the projective-module K-space. Its reusable output is a specified comparison map, its normalisation, and its naturality squares. An abstract isomorphism between the groups would not determine these maps.

The classical objects and their homology comparison belong to the existing T.1 development. General classifying spaces, homotopy fibres and plus constructions belong to `StableHomotopyKTheory`. The construction of the projective-module K-space and its early plus comparison belongs to `GeneralAlgebraicKTheory:K.2:plus`. This layer assembles those inputs. It does not introduce another Steinberg group, another plus construction, or another Q-construction.

## Conventions and imported objects

Let A be an associative unital ring. Ring maps preserve the unit. Commutativity, regularity, finite generation and the inequality 0 ≠ 1 are not hypotheses. Use the **stable** groups GL(A), E(A) and St(A); no finite-rank centrality assertion is substituted for stable Steinberg theory. The group commutator is the inherited convention aba⁻¹b⁻¹. Write

\[
 s_A:\operatorname{St}(A)\longrightarrow E(A),\qquad
 C_A=\ker s_A.
\]

The node `K2SymbolsBrauer:T.1/k2-definition` supplies this kernel and its ring maps. The nodes `KTheoryLowDegrees:U.1/whitehead-lemma` and `KTheoryLowDegrees:U.1/stable-elementary-perfect` supply normality and perfectness of E(A). The node `K2SymbolsBrauer:T.1/steinberg-is-uce` supplies the universal central extension s_A. Centrality makes C_A abelian, with its group operation inherited from St(A).

We write multiplicative groups additively at the homology interface by using Mathlib's `Additive` type tag. For a group P,

\[
 \mathcal H_2(P)=H_2(P;\mathbb Z)
\]

means the underlying additive group of `groupHomology.H2` applied to `Rep.trivial ℤ P ℤ`. It does not mean homology with an implicit coefficient representation. The pinned homology files place P and ℤ in the same universe; the suggested signatures accordingly use P in `Type`. This is a size convention, not a finite-group hypothesis.

For a group homomorphism g:P→P′, the map \(\mathcal H_2(g)\) is precisely `groupHomology.map` in degree two with the identity map of trivial integral coefficients. Its identity and composition laws are the existing `groupHomology.map_id` and `groupHomology.map_comp`, including restriction of coefficients in the latter.

The inherited target `K2SymbolsBrauer:T.1/k2-h2-elementary` supplies

\[
 \kappa_A:\operatorname{Additive}(C_A)\simeq_+\mathcal H_2(E(A)).
\]

Use the canonical kernel comparison of `K2SymbolsBrauer:T.1:classical/uce-kernel-h2` and its naturality node, with the inherited Hopf transgression sign. This convention is used for **every** universal central extension appearing below. Choosing an unrelated isomorphism from a kernel to the same abstract homology group is insufficient.

Choose a CW ring plus model

\[
 i_A:B\mathrm{GL}(A)\longrightarrow X_A=B\mathrm{GL}(A)^+,
 \qquad x_A=i_A(*).
\]

The map kills E(A) on fundamental groups and preserves homology with all local coefficient modules for GL(A)/E(A). Ordinary integral homology preservation alone is not the plus hypothesis. The classifying space is pointed at its vertex. All homotopy groups carry these specified basepoints. In Lean, π₂(X,x) is `HomotopyGroup (Fin 2) X x`; its native operation is multiplicative, so the displayed additive interfaces use `Additive` here as well. Based continuous maps act by the existing `HomotopyGroup.mapHom`, with their basepoint equations supplied explicitly.

## The normalised comparison

The new construction is `K2SymbolsBrauer:T.1:plus/normalised-comparison`. Its mathematical content refines the inherited comparison target `K2SymbolsBrauer:T.1/k2-pi2` by specifying the map, rather than planning that isomorphism theorem again.

Use the homotopy fibre F_A of i_A over x_A. Its points are pairs (z,γ) where γ runs **from i_A(z) to x_A**, and its basepoint is (*,constant). This is the convention of `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`. Weibel's IV.1.2 uses paths in the other direction. Reversing the path coordinate relates the two models; it is not an instruction to silently identify their boundary maps.

Put U_A=π₁(F_A). The projection to BGL(A) induces a homomorphism whose image is E(A), giving

\[
 \varepsilon_A:U_A\longrightarrow E(A).
\]

The node `StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension`, specialised to GL(A) and E(A), says that ε_A is a universal central extension. Its proof uses the acyclicity of the plus fibre, the low-degree fibre sequence, and the inherited recognition theorem. Those generic ingredients remain with those suppliers.

Use the connecting map specified by `StableHomotopyKTheory:H.2/connecting-map`: first the cubical loop-space shift, then the inclusion of ΩX_A into F_A at the vertex of BGL(A). Since BGL(A) is a K(GL(A),1), the long exact sequence corestricts it to an isomorphism

\[
 \delta_A:\operatorname{Additive}(\pi_2(X_A,x_A))
       \simeq_+\operatorname{Additive}(\ker\varepsilon_A).
\]

This is the positive loop-space connecting map in that supplier's convention. A relative-pair boundary used to prove exactness can differ by inversion, as its supplier explains. That does not change the kernel/image calculation, but it must not change the chosen δ_A in this definition.

Apply the same universal-central-extension kernel/H₂ construction to ε_A to obtain κ_F,A. Define

\[
 \rho_A=\kappa_{F,A}\circ\delta_A,
 \qquad
 \chi_A=\rho_A^{-1}\circ\kappa_A:
 \operatorname{Additive}(C_A)\simeq_+
 \operatorname{Additive}(\pi_2(X_A,x_A)).
\]

Thus the comparison is classical-to-topological. Its inverse is κ_A⁻¹∘ρ_A. The defining equation is

\[
                 \rho_A(\chi_A(z))=\kappa_A(z). \tag{1}
\]

There is also a description avoiding an arbitrary homology isomorphism. Let a_A:St(A)≃U_A be the unique isomorphism of universal central extensions over E(A). The inherited `uce-lift` and `uce-kernel-h2-natural` nodes give

\[
 \delta_A(\chi_A(z))=a_A(z)
           \quad\hbox{in }\ker\varepsilon_A. \tag{2}
\]

Equations (1) and (2) explain why one must use the same kernel/H₂ convention twice. They also give a direct acceptance check on a proposed formal comparison.

The source is Weibel, III.5, Definition 5.3.1, Lemma 5.3.3 and Example 5.3.4, p. III.37; Theorem 5.5, p. III.38; and IV.1, Homotopy Fiber 1.2, p. IV.3, Proposition 1.7 and Corollary 1.7.1, p. IV.6. The displayed composite and its named interface are the assembly specified here.

### API and checks

The proposed names share the namespace `TauCeti.K2Comparison`.

| Name | Required interface |
| --- | --- |
| `fromHomology` | Form χ_A as κ_A followed by ρ_A⁻¹. Its light form accepts an actual homomorphism s:S→E and the two established equivalences into \(\mathcal H_2(E)\). |
| `fromHomology_normalise` | Equation (1), for every kernel element. |
| `fromHomology_symm` | Evaluate the inverse as κ_A⁻¹(ρ_A(v)). |
| `fromHomology_unique` | If an additive homomorphism c satisfies ρ_A∘c=κ_A, then c=χ_A. |
| `fromHomology_fibre` | Equation (2), with the unique isomorphism over E(A). |
| `fromHomology_add` | Preserve zero, addition and negation; expose the corresponding laws for the inverse through its additive equivalence. |

These interfaces serve the inherited comparison target and the consumers `GeneralAlgebraicKTheory:K.2:low-degree-comparisons`, `GeneralAlgebraicKTheory:KU-pluscomparison` and `K2SymbolsBrauer:T.7`. This layer supplies the identification of objects; compatibility with particular residue or boundary maps requires their own squares in those consuming layers.

The construction has four unit tests.

1. **`normalisation_test`.** For every z, evaluating ρ_A on χ_A(z) gives the *specified* κ_A(z). Equality with an unspecified automorphism of \(\mathcal H_2(E(A))\) does not pass.
2. **`inverse_test`.** For every v in the target, χ_A(κ_A⁻¹(ρ_A(v)))=v. This tests both the order and direction of the equivalences.
3. **`zero_ring_test`.** In the zero ring, every stable Steinberg generator is x_ij(0)=1: the additive relation gives x_ij(0)=x_ij(0)². Hence St(A) and C_A are trivial. GL(A) and E(A) are also trivial, and the plus comparison gives π₂X_A=0. The construction is the unique equivalence between the trivial additive groups. No nontrivial-ring assumption may enter its signature.
4. **`negative_comparison_test`.** If κ_A(z)≠−κ_A(z), negating χ_A fails equation (1) at z. As an elementary test of the composite formula, take three additive groups equal to ℤ and both input equivalences equal to the identity: the composite sends 1 to 1, whereas its negative sends 1 to −1. This is a test of the normalisation formula, not a claim that K₂(ℤ)=ℤ. Identity and naturality alone would not detect a uniform sign change.

## Ring maps and based naturality

The new theorem `K2SymbolsBrauer:T.1:plus/comparison-naturality` states that for every unital f:A→B,

\[
 \rho_B\circ\pi_2(f^+)=\mathcal H_2(E(f))\circ\rho_A,
 \qquad
 \chi_B\circ C(f)=\pi_2(f^+)\circ\chi_A. \tag{3}
\]

All maps in (3) are written additively. The map C(f) is the restriction of the inherited Steinberg map to the kernel. The homology map is for **E(f)**, not GL(f).

The first square is the GL/E specialisation of `StableHomotopyKTheory:H.3/plus-pi2-natural`, using the selected connecting map. Naturality of the universal-central-extension kernel comparison gives κ_B C(f)=\(\mathcal H_2(E(f))\)κ_A. Substituting the definition of χ and cancelling the injective ρ_B gives the second square. This proof imports generic plus naturality; it does not give a second construction of plus functoriality.

A plus map comes with a homotopy between its composite with i_A and i_B∘BGL(f). If the square is based, it induces the displayed based group maps directly. For a free homotopy one first retains the track of the basepoint. The existing `TauCeti.homotopyGroupTransport_map` identifies the maps only after transport along that track. The early ring/plus model is a connected H-space, and `StableHomotopyKTheory:H.3/hspace-is-abelian` makes the target π₁-action on π₂ trivial. Only then can the transported group map be treated as independent of the track.

The group maps obey identity and composition. The space maps need only obey these laws up to the supplied homotopies. A strictly functorial choice of point-set plus construction is not a hypothesis. This follows the distinction in Weibel IV.1, Functoriality 1.1.2, p. IV.3. The explicit squares are the authored consequence of natural fibre boundaries and the inherited UCE naturality.

**Checks.** At f=id_A, both squares are identities. For A→B→D, the square for the composite is the composite of the two squares, using the actual coefficient-restriction law for group homology. A purported proof that drops a free-homotopy track before establishing triviality of the target action fails the basepoint check.

## Independence of compatible models

The new theorem `K2SymbolsBrauer:T.1:plus/comparison-model-independence` takes two ring plus maps i_A:BGL(A)→X_A and i′_A:BGL(A)→X′_A, and a homotopy equivalence u:X_A→X′_A **under BGL(A)**. With a based comparison homotopy, or the tracked free-homotopy convention above, it asserts

\[
              u_*\chi_A=\chi'_A,
 \qquad       \rho'_A u_*=\rho_A. \tag{4}
\]

These are equations through specified carrier comparisons. They are not literal equalities of elements in different homotopy groups. The same rule applies when changing the classifying-space or fibre model, or the free presentation used for the inherited Hopf formula.

Apply (3) to the identity map on E(A), allowing different plus models. The fibre maps are morphisms of universal central extensions over the identity. Their uniqueness fixes the map on kernels; the boundary and homology comparisons give (4). The uniqueness of the ring plus models under their source comes from `StableHomotopyKTheory:H.3/plus-construction-uniqueness`, applied to the abelian ring targets. This uses the actual permitted target class, not an unrestricted uniqueness theorem for nonabelian targets.

For u homotopic to the identity under BGL(A), (4) returns χ_A itself. An arbitrary automorphism of the bare group π₂X_A, or an arbitrary self-equivalence of the bare space X_A, is not a permitted model comparison. The map under BGL(A) and normalisation equation remain part of the contract. The sources for this deduction are Weibel III.5, Definition 5.3.1 and Lemma 5.3.3, p. III.37, and IV.1, Definition 1.1, p. IV.2, Theorem 1.5, p. IV.5, and Corollary 1.7.1, p. IV.6.

## Transport to the projective-module K-space

The new construction `K2SymbolsBrauer:T.1:plus/quillen-pi2-comparison` uses the early ring/plus supplier to obtain

\[
 K_Q(A)=\Omega BQ(\operatorname{Proj}_{\mathrm{fg}}(A)),
 \qquad
 \eta_A:X_A\simeq K_Q(A)_0.
\]

The zero basepoint is the constant loop. The subscript 0 denotes its path component, with its actual subspace inclusion j_A into K_Q(A). The supplier gives the natural zero-component equivalence and its compatibility with ring maps and block sum. It also supplies the induced isomorphism on based π₂ for the component inclusion. Geometrically, connected sphere domains and their based homotopies stay in that component. This layer does not introduce another topology or another definition of the component.

Define

\[
 \Xi_A=(j_A)_*\circ(\eta_A)_*\circ\chi_A:
 \operatorname{Additive}(C_A)\simeq_+
 \operatorname{Additive}(\pi_2(K_Q(A),0)). \tag{5}
\]

Its inverse applies the three inverse maps in the opposite order. Equation (3), followed by the naturality square for η_A and j_A, gives

\[
          K_Q(f)_*\Xi_A=\Xi_B C(f). \tag{6}
\]

Compatible changes of Q, group-completion and plus models preserve (5) after the specified transports. An arbitrary choice of an equivalence to the zero component, without its comparison square, is not sufficient.

The supplier proves the comparison using finitely generated projectives, their projective complements, group completion, and the split-exact plus-equals-Q theorem. The source locators are Weibel IV.4, Theorem 4.11 and Corollary 4.11.1, pp. IV.44–45; IV.7, Theorem 7.1, Corollary 7.2 and the proof through Theorem 7.8, pp. IV.61–64. These results are imported, rather than re-planned here.

Scalar extension along every unital ring homomorphism preserves finite projectivity and split exact sequences: a finite projective is a summand of a finite free module, and the splitting persists after tensoring. Flatness is unnecessary. Nor is freeness of every projective module needed. The naturality is at the zero component; representatives of other K₀-classes play no role. A space-level product description with K₀(A) does not supply a natural splitting of infinite-loop spaces, as Weibel IV.1.1.2, p. IV.3, cautions.

### API and checks

| Name in `TauCeti.K2Comparison` | Required interface |
| --- | --- |
| `toQuillen` | Compose χ_A with the actual η_A* and j_A*. Its light form transports a kernel-to-π₂ equivalence through an actual homotopy equivalence. |
| `toQuillen_apply` | Evaluate Ξ_A(z) as j_A*(η_A*(χ_A(z))). |
| `toQuillen_symm` | Evaluate Ξ_A⁻¹(v) as χ_A⁻¹(η_A*⁻¹(j_A*⁻¹(v))). |
| `toQuillen_natural` | Equation (6), with identity and composition on groups. |
| `toQuillen_model_independent` | Transport Ξ_A through compatible Q and plus model comparisons, retaining the zero-component square. |

The consumers are the late low-degree-comparison and plus-comparison stages of `GeneralAlgebraicKTheory`. Neither stage is an input to this construction.

The construction has four unit tests.

1. **`quillen_formula_test`.** For each z, the right side of (5) evaluates to Ξ_A(z), and applying the displayed inverse recovers z.
2. **`quillen_zero_ring_test`.** The category of finitely generated projectives over the zero ring is equivalent to the zero exact category. Its K-space has trivial π₂, and Ξ_A is the unique equivalence from the trivial classical kernel.
3. **`quillen_nonflat_test`.** For ℤ→ℤ/2ℤ, equation (6) holds. The map is not flat, so a signature requiring flat scalar extension fails this test.
4. **`quillen_component_test`.** Changing a representative of a nonzero K₀-class cannot affect Ξ_A, since such representatives are not inputs. The codomain remains π₂ at zero; no natural global product splitting is inferred.

## Dependencies, boundaries and suggested signatures

| Input | Owner and exact use |
| --- | --- |
| Stable classical kernel and κ_A | The inherited T.1 nodes named above, together with `uce-kernel-h2`, `uce-kernel-h2-natural` and `uce-lift`. |
| Normal perfect E(A) | `KTheoryLowDegrees:U.1/whitehead-lemma` and `stable-elementary-perfect`. |
| Classifying spaces and π₂BGL=0 | `StableHomotopyKTheory:H.1/classifying-space-of-group-is-KG1`. |
| Fibre, positive boundary and exactness | `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`, `connecting-map`, and `long-exact-sequence`. |
| Fibre UCE and its naturality | `StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension` and `plus-pi2-natural`. |
| Plus maps, compatible model equivalences and trivial action | H.3 `plus-construction-functoriality`, `plus-construction-uniqueness`, `hspace-is-abelian`, and the early ring/plus H-space structure. |
| Projective-module K-space and natural zero component | `GeneralAlgebraicKTheory:K.2:plus`, including the component inclusion on π₂ and its ring-map square. |

The packet requests the last supplier interface explicitly, including the ring-model H-space structure, and imports the existing upstream Hurewicz interface for the retained cover proof below. These are early-model outputs. The inherited classical and topological suppliers retain responsibility for their own recorded proof gaps; this supplement does not certify their implementation or erase those boundaries.

The inherited comparison target also has its stated **cover/Hurewicz proof**. This proof remains attached to the inherited node, with its exact inputs recorded in the packet's `inheritedTargets`; it does not become another node. Take the actual universal cover p_A:Y_A→X_A and the map q_A:BE(A)→Y_A furnished by the H=P case of `StableHomotopyKTheory:H.3/plus-universal-cover`. The pullback description and the regular quotient local system ℤ[GL(A)/E(A)], using H.3 `twisted-homology-via-cover`, make H₂(q_A) an isomorphism. Ordinary integral preservation on the base alone would not justify that assertion.

Let b_A:H₂(BE(A);ℤ)≃H₂(E(A);ℤ) be `StableHomotopyKTheory:H.1/bar-complex-comparison`, and let h_A:Additive(π₂Y_A)≃H₂(Y_A;ℤ) be the natural absolute Hurewicz map. Since Y_A is simply connected, the existing Tau Ceti `AlgebraicTopology` roadmap, Stage 8, supplies that isomorphism with its cubical/sphere orientation convention. The completed `UniversalCovers` roadmap and pinned `IsCoveringMap.homotopyGroupMulEquiv` supply p_A* on π₂. The retained comparison has all arrows specified by

\[
 \rho_{\mathrm{cov},A}
 =b_A\circ H_2(q_A)^{-1}\circ h_A\circ(p_A*)^{-1},
 \qquad
 \chi_{\mathrm{cov},A}=\rho_{\mathrm{cov},A}^{-1}\circ\kappa_A.
\]

For based ring-map squares, covering lifts and homotopy lifting give the corresponding squares upstairs. Natural Hurewicz and the natural bar comparison then give the naturality of this composite; the ring H-space argument handles free basepoint tracks. The bar comparison uses its supplier's coordinatewise inversion convention for `SingleObj`, not reversal of the tuple. This fulfils the inherited Hurewicz route without re-planning its topology. Hurewicz is applied on Y_A, not on the possibly nonsimply connected X_A: the torus, with π₂=0 but H₂ nonzero, detects the latter mistake. Covering isomorphisms are used only in degree at least two.

The source locators are Weibel IV.1, Lemma 1.6 with proof, pp. IV.5–6 and Exercise 1.8, pp. IV.14–15; Hatcher §4.1, Proposition 4.1, p. 342; §4.2, Theorem 4.32 and proof, pp. 366–367, and the absolute Hurewicz map and its naturality, p. 370. The packet's second request names the existing upstream Hurewicz stage and its precise interface. No new Hurewicz or covering theory is owned here. Equality of this composite with the independently normalised fibre map χ_A is not asserted: such an equality would require matching the two boundary and orientation conventions, beyond the inherited natural-isomorphism target.

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. They already provide kernel subgroups, additive transports, integral group homology, cubical homotopy groups, based induced maps, homotopy-equivalence maps and the basepoint-track formula. The current Tau Ceti library and current roadmap tree also preserve ownership of those general constructions. They do not provide this stable Steinberg/plus comparison.

The suggested file therefore contains only real-bodied light compositions over actual kernel, homology and homotopy-group carriers, the normalisation and naturality composition milestones, and representative checks. Its parameters κ and ρ are the precise equivalences constructed above, not substitute definitions of the missing theories. The full ring naturality proof, UCE/fibre compatibility, model independence, zero-ring tests and nonflat Q-space test are reader targets because their ring and space carriers are absent at the pins. The final comment of the suggested file enumerates these omissions. No carrier is replaced by an unspecified proposition or an unconstructed data definition.

The two planets are **Classical and homotopy K₂** and **The plus and Q comparison**.

## Sources

- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), Proposition 4.1, p. 342; Theorem 4.32 and proof, pp. 366–367; absolute Hurewicz and naturality, p. 370.
- Charles A. Weibel, [*The K-book*, Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), §5, pp. III.36–38, with the precise locators above. The stable theorem is the input; no finite-rank conclusion from Proposition 5.5.1 is used.
- Charles A. Weibel, [*The K-book*, Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), §1, pp. IV.2–7 and Exercise 1.8, pp. IV.14–15; §4, pp. IV.44–45; §7, pp. IV.61–64. Pagination is the author-hosted chapter pagination. The packet records the downloaded versions' hashes and access date.
