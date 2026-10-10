# Independent review of NC.0 — #6298

**Verdict: accepted.** Reviewer: Codex (GPT-6), session `codex-S6JnVF`, 2026-10-10. The reviewed blueprint was written by the distinct session `codex-Vohif4` for #6341. This completes the review pass; NC.0 remains **planned**, with six explicit gaps and eight supplier requests.

Reviewed files: [packet](../packets/AnabelianGeometryAndNonabelianChabauty--NC.0.json) and [suggested Lean file](../suggested/AnabelianGeometryAndNonabelianChabauty--NC.0.lean). I also read the existing [reader](../readmes/AnabelianGeometryAndNonabelianChabauty--NC.0.md), the accepted parent, its inherited targets, the relevant supplier statements, reviewed library audit and ownership decision. The geometric signatures omitted from the suggested file remain explicit in the packet; successful elaboration certifies signatures with admitted proofs.

## Counts and corrections

The packet has 12 nodes: four constructions, five theorems, one comparison and two definitions. Five nodes have verdict `corrected` and seven `verified`; none were added or left unverifiable. The six definitions/constructions now have 27 API items and 19 named tests. Three further examples exercise the existing Kummer map. All 12 baseline citations were confirmed; none were removed or replaced. All three source findings are independently confirmed.

The accepted parent's 26 exact target identifiers remain imports, disjoint from these 12 new identifiers. The parent's five planets and this packet's Arithmetic path torsor give six planets in the combined layer.

Changes made in this review:

1. Added `ArithmeticPath.ext` to the packet and suggested file: equality of the underlying natural isomorphisms determines equality of the subtype. The restriction proof contributes no extra data.
2. Corrected three test categories to those permitted by PROTOCOL section 12: `pathCocycle_distinct_sections` is a non-example, `inertiaOrbit_degree_three` a computation, and `goodPath_ordered_relation` a compatibility test. Their mathematical statements are unchanged.
3. Expanded the existing geometric-signature gap to name both `path-section-comparison` and `reference-section-change`. Their coordinate equations are typed; the actual scheme torsor's neutral-class and twisting comparisons still require the imported NC.3 carriers.
4. Clarified the source scope of section transport. Kim's 2005 Proposition 1 treats unipotent torsors and motivates the right-torsor convention. Backward transport and conjugacy of arithmetic endpoint sections are derived from the arithmetic extension; that source is not asserted to prove the general section statement.
5. Located and collated Kim's published 2010 article, updated the source receipt and node locators, and confirmed the gauge-order finding in its version of record. The stable source and finding identifiers are retained for consumers.
6. Added pinned declaration receipts, independent source-finding verdicts and a verdict for every node.

## Node checks

The identifiers in this table have prefix `AnabelianGeometryAndNonabelianChabauty:NC.0/`.

| Node | Verdict | Mathematical check and boundary |
| --- | --- | --- |
| `arithmetic-geometric-paths` | corrected | Restricting an ordinary natural isomorphism to constants gives the displayed arithmetic-path subtype. Surjectivity in the arithmetic sequence allows correction of this restriction to the identity. The resulting closed fibre is a nonempty profinite torsor for the geometric kernel, with right action `p h` and Galois action `s_x(σ) p s_b(σ)⁻¹`. Added extensionality. The actual scheme instance remains an IG.0/IG.1 input. |
| `transferred-endpoint-section` | corrected | Backward transport is `p⁻¹ s_x p`. Native `Aut` multiplication reverses categorical arrow order, so changing `p` to `p h` gives `h⁻¹ t h`. Identity, composition and the noncommuting discriminator agree with this convention. Clarified the unipotent source's role. |
| `arithmetic-path-cocycle` | corrected | `c_p(σ)=p⁻¹σ(p)` obeys `c_p(στ)=c_p(σ) α_σ(c_p(τ))`. Changing the path to `p h` gives `h⁻¹ c_p(σ) α_σ(h)`. The native kernel-valued continuous map and its semilinear action have these identities; NC.3 supplies the generic cocycle/H1 construction. Corrected one test category and the published source locator. |
| `path-section-comparison` | verified | The transported section satisfies `t_p=c_p s_b`. A fixed arithmetic path is equivalent to kernel conjugacy of the sections. If `c_p(σ)=h α_σ(h)⁻¹`, then `p h` is fixed. This proves the neutral-class criterion once the geometric torsor is instantiated; no uniqueness follows. |
| `reference-section-change` | verified | Changing the reference section changes the action to `Int(c) α`. The imported NC.3 twisting equivalence changes the action and sends the new distinguished point to the original class `[c]`. An equality of the original pointed H1 sets would be wrong and is not used. |
| `arithmetic-path-functoriality` | verified | Whiskering along a pointed scheme map commutes with restriction to constants, endpoint lifts and cocycles. The group-coordinate map preserves both sections. Finite separable base extension uses compatible separable-closure embeddings and restriction. The tangent identifications and geometric instances are explicitly requested. |
| `rational-tangential-kummer` | verified | At `λ∂z` over zero on the three-punctured line, the `z` power cover gives the root-ratio class of `a/λ`, and the `1−z` cover gives that of `1−a`. With `λ=1,a=2`, the square classes of `2` and `−1` obstruct neutrality. Existing Kummer signatures test nontriviality of `2`, triviality of `4`, and exponent one. The geometric projection theorem remains a named gap. |
| `local-inertia-orbit-model` | corrected | The native carrier is the dependent sum of the positive-modulus `ZMod(e_y)` fibres. The actual permutation adds one within each fibre; its cyclic subgroup preserves the branch and acts transitively there. Thus the actual orbit quotient maps bijectively to branch labels, with fibre cardinality `e_y`. Corrected one test category. |
| `tangential-inertia-specialization` | verified | On normalized finite covers, the local graded power map `z=s^e` gives a natural map from the tangent fibre to the underlying point fibre. Its inertia-image orbits are precisely the branches, also for disconnected covers. Finiteness and regular local branches require the exact SF.0/SF.3 contracts. Injectivity of local inertia into the global group is unnecessary. |
| `chen-good-path` | corrected | Both clauses survive: the conjugated peripheral elements topologically generate, and a path through the third endpoint gives the ordered infinity–one–zero relation. The native categorical order agrees with functional group multiplication. The reversed-order non-example catches a plausible incorrect definition. Corrected one test category. |
| `chen-symmetric-path` | verified | The inversion functor and specified endpoint isomorphisms produce the reversed path. Symmetry allows integer peripheral powers at both ends. With trivial inertia and identity inversion, the condition is exactly `δ²=1`; the unit and non-involution examples discriminate it. |
| `symmetric-good-path-existence` | verified | The analytic detour around the third puncture yields goodness and inversion symmetry with the prescribed tangents. Algebraically closed characteristic-zero transfer needs the whole compatible root system and the normalized tangent-germ comparison. The latter is requested from IG.1, rather than presumed from ordinary Riemann existence. The statement asserts existence, with no canonicity or Galois-fixedness. |

The source proofs underlying these checks were read at Chen, Sections 4.2–4.3, printed pp. 362–366, particularly Definition 4.2.1, Proposition 4.2.3(b) and Definition 4.3.1; Kim, 2005 Section 1, Proposition 1 and proof, preprint PDF pp. 5–7; Kim, 2010 pp. 637–642; and Stacks Theorem 58.6.2 and Lemmas 58.14.1 and 58.14.3, including their proofs. The section calculations and cyclic finite model are elementary deductions on the imported native carriers, rather than new claims attributed to those sources.

## Source collation and independently confirmed findings

Sources were read from public copies, on 2026-10-10. URLs, editions and hashes are recorded in the packet. No cleared book was needed. The report and packet state results and corrections in my own words.

- Chen's [author-hosted published article](https://www.williamyunchen.com/s/Chen-Nonabelian-level-structures-Nielsen-equivalence-and-Markoff-triples.pdf), *Annals of Mathematics* 199 (2024), 301–443: Sections 4.2–4.3, printed pp. 362–366, were read with their arguments. I compared Definition 4.2.1 and Proposition 4.2.3 against [arXiv v2](https://arxiv.org/pdf/2011.12940v2), the latest listed preprint. The published cotangent statement controls the packet; an additional preprint clause absent from the publication is not imported.
- Kim's [2005 preprint](https://arxiv.org/pdf/math/0409456v1), published in *Inventiones Mathematicae* 161 (2005), 629–656: Section 1, Proposition 1 and proof, PDF pp. 5–7, were read. Its unipotent torsor theorem is not enlarged into a theorem about every profinite topological torsor; that general interface belongs to NC.3.
- Kim's [published 2010 article](https://d-nb.info/1372511016/34), *Central European Journal of Mathematics* 8 (2010), 633–645, DOI `10.2478/s11533-010-0047-y`: printed pp. 637–642, PDF pp. 5–10, were read and collated with [arXiv:0804.1008v1](https://arxiv.org/pdf/0804.1008v1), PDF pp. 4–9. The source is *Fundamental groups and Diophantine geometry*. The German National Library's public copy resolves the original packet's failure to retrieve the published version. I also inspected the rendered published p. 642.
- Stacks [Theorem 58.6.2, tag 0BQ8](https://stacks.math.columbia.edu/tag/0BQ8), [Lemma 58.14.3, tag 0BTX](https://stacks.math.columbia.edu/tag/0BTX), and [Lemma 58.14.1, tag 0BTV](https://stacks.math.columbia.edu/tag/0BTV): checked the fibre-functor/Galois equivalence, arithmetic exact sequence with its qcqs hypotheses, and descent of finite covers along the affine transition system.

All three finding records have `review.verdict: confirmed` and this review's exact job identifier.

1. **Local inertia injectivity**, Chen Definition 4.2.1, published p. 364. Removing only infinity from `P¹_C` gives `A¹_C`, whose global finite-étale fundamental group is trivial, whereas the punctured tangent has nontrivial profinite cyclic group. Independently, a connected degree-`d` finite étale cover of `A¹_C` compactifies with ramification only at infinity. If there are `r≥1` points above infinity, Riemann–Hurwitz gives `2g−2=−d−r`, forcing `d=1`. The proposed injectivity cannot hold generally. Using the inertia **image** leaves Proposition 4.2.3(b)'s branch-orbit theorem intact.
2. **Deleted tangent point**, Chen Definition 4.2.1, published p. 364. The punctured tangent deletes the zero vector. After normalizing the specified nonzero tangent to coordinate one, that point is the basepoint, not the puncture. The affine presentation deleting one is a misprint; the adjacent power-cover calculation uses the intended object.
3. **Gauge-order reversal**, Kim published p. 642 and preprint PDF p. 9. For the right-torsor law `c(στ)=c(σ)σ(c(τ))`, changing the point by `l` gives `l⁻¹ c(σ) σ(l)`. The source's reversed order need not yield a cocycle. I recomputed the finite example with functional permutation composition: let `a=(123)`, `l=(234)`, let `C₃` act on `S₄` by conjugation by `a`, and set `c(g^j)=a^(−j)`. The reversed formula gives `d(g)=(143)` and `d(g²)=(243)`, whereas `d(g) g(d(g))=(123)`. The original cocycle and corrected gauge satisfy all nine products in `C₃`. The same display occurs in the published version. The stable finding id ending `preprint-gauge-order` now records both versions accurately.

I rechecked the authors' publication pages, the Annals article page, listed arXiv versions and title/DOI correction searches; no existing correction was located. The searches and retrieval receipts are recorded per finding. These findings refine this review's source evidence; they do not open a separate errata job.

## Pinned baseline receipts

Read the declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Paths below are relative to the corresponding library root. The packet retains all 12 references and now records the checks.

| Declaration | Module and lines at the pin | Confirmed contract |
| --- | --- | --- |
| `CategoryTheory.Aut` | `Mathlib/CategoryTheory/Endomorphism.lean`, 119–140 | Native isomorphisms; multiplication `trans y x` acts by functional composition. |
| `CategoryTheory.Functor.isoWhiskerLeft` | `Mathlib/CategoryTheory/Whiskering.lean`, 218–229 | Restriction of natural isomorphisms with their actual hom/inv components. |
| `CategoryTheory.PreGaloisCategory.autEmbedding_isClosedEmbedding` | `Mathlib/CategoryTheory/Galois/Topology.lean`, 107–127 | Closed evaluation embedding and compact, T2, totally disconnected topological-group instances. A scheme Galois-category instance is still required. |
| `ContinuousMonoidHom` | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean`, 57 | Native monoid homomorphism and continuous map, used for continuous sections. |
| `MulAction.orbitRel.Quotient` | `Mathlib/GroupTheory/GroupAction/Defs.lean`, 349–350 | Quotient of the actual action's orbit setoid. |
| `Subgroup.topologicalClosure` | `Mathlib/Topology/Algebra/Group/Subgroup.lean`, 40–43 | Topological closure as a subgroup under the enclosing topological-group assumptions. |
| `ZMod` | `Mathlib/Data/ZMod/Defs.lean`, 142–144 | Modulus zero gives integers; a successor modulus gives its finite residue carrier. |
| `ZMod.card` | `Mathlib/Data/ZMod/Defs.lean`, 166–169 | Cardinality equals the modulus when a `Fintype` instance is available; positive branch indices supply it. |
| `TauCeti.AbsoluteGaloisGroup` | `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup.lean`, 230 | Galois group of the separable closure with existing Krull topology. |
| `TauCeti.kummerMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`, 187–189 | Units to multiplicative first cohomology with Kummer coefficients; exponent is invertible in the field. |
| `TauCeti.kummerMap_eq_kummerCocycleClass` | same module, 215–217 | The existing root cocycle represents the connecting class, with the declared additive/multiplicative conversion. |
| `TauCeti.kummerMap_eq_one_iff` | same module, 268–269 | Neutral class exactly when the base-field unit is an nth power. |

## Supplier closure, inherited targets and ownership

Read AUDIT-08's reviewed NC.0 entry in `data/library-coverage.json` and the accepted RS-29 ownership result. The library supplies abstract Galois machinery and affine finite-étale algebra fibres, but the full scheme/tangential instances needed here remain missing. RS-29 assigns concrete arithmetic path torsors to NC.0; IG.0 owns ordinary paths and their topology, IG.1 the arithmetic sequence and rational/tame tangential fibres, and NC.3 generic topological torsors, H1, cocycles and twisting. IG.6 imports NC.0. PS.9's motivic path regularization does not supply this finite-étale tangent functor.

I read the relevant current upstream README and Suggested files for ProfiniteArithmetic, PeripheralActions and BelyiMaps Layer 12 at TauCetiRoadmap commit `81207c7f16d5abf770f13a7d2bdcdb465c030787`. Their existing profinite, continuous-action, peripheral and finite-cover comparison targets are imported. In particular BelyiMaps' geometric Riemann-existence/free-group comparisons do not provide the normalized tangent-germ interface or a canonical arithmetic lift.

I read each of the 26 inherited parent contracts and the actual named supplier statements in SF.0, SF.2, SF.3, IG.0, IG.1 and NC.3. Generic Leray, finite pushforward and curve/Picard results are legitimate inputs but do not automatically give the specialized coefficient dictionary, canonical comparison map, direct-image formula or nonproper external-product map. The packet's grouped `supplierAudit` and eight requests preserve those distinctions. No inherited declaration was duplicated or strengthened.

Current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has:

- `TauCeti.ContinuousCohomology.exists_openSubgroup_res_eq_zero`, `TauCeti/RepresentationTheory/Homological/ContCohomology/ClosedSubgroup.lean`, 273–279: positive-degree classes for smooth discrete representations of profinite groups vanish on an open subgroup. Its finite-index normal core gives the open-normal refinement required by the parent.
- `TauCeti.ContinuousCohomology.subsingleton_continuousCohomology_succ_of_subsingleton`, `TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialGroup.lean`, 39–41: positive-degree cohomology vanishes for a subsingleton group, with the declared topological-representation coefficients.

These are imported through current ProfiniteCohomology Layer 10. They postdate the compilation pin; interface reconciliation is required, rather than new proofs of existing library results.

The six remaining gap groups are precise: geometric arithmetic-path/H1 signatures; global tangent specialization and Kummer geometry; normalized analytic tangent comparison; inherited finite-coefficient/canonical comparison interfaces; curve and geometric-product assembly inputs; and raw étale homotopy/elementary-fibration suppliers. The eight requests name three separate SF.2 coefficient/direct-image/dévissage contracts, IG.0's pointed geometric product/refinement contract, SF.2's nonproper Künneth contract, SF.3's curve/branch geometry contract, IG.1's arithmetic/analytic tangent contract and BelyiMaps' comparison import. Arithmetic pi1 exactness alone cannot supply higher homotopy; the absent supplier is honestly a gap. Coverage `planned`, rather than `closed`, is therefore appropriate.

## Validation and orchestration

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.0.json`: exit 0, zero errors and zero warnings.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.0.lean`: exit 0 at the pinned shared build; 61 warnings, all admitted-declaration (`sorry`) warnings. Memory was checked first. The only Lean addition is the extensionality signature.
- Checked that all 27 API items have corresponding native declarations and that all 19 named packet tests and three additional Kummer examples occur in the suggested file. All six definitions/constructions have at least three tests. The geometric omitted signatures are named gaps rather than opaque proposition placeholders.
- Checked complete node-verdict coverage, all three source-finding verdicts, inherited/new identifier disjointness, the six-planet limit, authorized paths, JSON validity and the intake's completion predicate.

No question blocks this acceptance. The issue authorizes edits to the packet and suggested file, this report and the handoff. Its existing reader was inspected but is outside the issue's named editable deliverables: it omits the new extensionality API and cites Kim's preprint without the new published-version evidence. A subsequent assembly/package should incorporate this report's reviewed source scope and the packet's 27-item API. The packet and this report contain the current review evidence. No supplier or upstream file was changed.
