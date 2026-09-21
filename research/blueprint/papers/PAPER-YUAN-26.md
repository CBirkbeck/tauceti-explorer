# PAPER-YUAN-26 — partial extraction checkpoint

Agent: Codex. Session: `codex-c83e7a`. Issue: #1050. Read date: 21 September 2026.

**This is not a completed paper job.** The whole 126-page author manuscript, including proofs, appendix and references, has been read. The result contains 271 initial items: 5 library substrate items, 29 planned items and 237 missing items. Four provisional Part II routes cover 231 missing items. Six items are deliberately unrouted: the ambiguous Northcott consequence `/170` and the five printed function-field claims `/262`–`/266`. Remaining work is specified in the [handoff](../handoff/PAPER-YUAN-26.md). Nothing here claims a new Lean formalization or a closed proof audit.

## Source and version

The primary text is Yuan’s [author manuscript dated 21 August 2024](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf), retrieved on 21 September 2026, SHA-256 `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`. Page locators refer to this manuscript unless otherwise specified.

The [journal entry](https://annals.math.princeton.edu/2026/203-1/p02) identifies the article as *Annals of Mathematics* 203 (2026), no. 1, 15–119, DOI `10.4007/annals.2026.203.1.2`, with revision date 21 August 2024. The [author’s publication list](http://faculty.bicmr.pku.edu.cn/~yxy/publications.html) links this manuscript for the article. This establishes the bibliographic match and revision date, but not identity with the final typeset text. A guessed Annals PDF URL returned 404; the Euclid PDF endpoint returned an HTML access response. That response was not treated as a paper. The author’s HTTPS endpoint refused the connection; its public HTTP endpoint worked.

[arXiv v4](https://arxiv.org/abs/2108.05625v4), dated 30 April 2024, is earlier. Its TeX was used to recover overbars and formulas lost in PDF extraction, with comparison against the later PDF. In particular, geometric points mean points over an algebraic closure.

## Extraction and mathematical direction

The central family result is bigness of the canonical admissible dualizing bundle and its self-pairing for a smooth genus-`g>1` curve with maximal variation over a flat normal integral quasi-projective base over `Z` or a field. Relative admissible metrics and Deligne pairings are compared with the Hodge determinant through global epsilon and phi divisors. The proof also establishes a positive lower bound for the archimedean phi invariant. Potential bigness on a family is then characterized by bigness of its relative top Deligne pairing.

The main uniform small-points theorem has constants depending only on genus, simultaneously across number fields and one-variable function fields in all characteristics. It bounds the number of `x` satisfying

`hhat(x-alpha) ≤ c1(g) (max(h_Fal(C),1) + hhat((2g-2)alpha-omega_C))`.

In the function-field case the **pair** `(C,alpha)` must not descend to the algebraic closure of the constant field. A constant curve with a nonconstant class is not automatically excluded. The extraction preserves the factor one half in the height of the symmetric twice-theta bundle and the different normalizations over `Q` and over the fixed function field.

| Manuscript portion | Original IDs | Content |
| --- | --- | --- |
| §1.6 and §2.1 | `/1`–`/34` | Curves, adelic completion, analytification, sections, volume and pairings |
| §§2.2–2.3 | `/35`–`/66` | Admissible bundles, relative Jacobians and theta identities |
| §3 | `/67`–`/112` | Moduli, Noether, compactification, epsilon/phi, Gross–Schoen and bigness |
| §§4.1–4.4 | `/113`–`/149` | Potential bigness, small points, heights, isotriviality and uniformity |
| §4.5 | `/150`–`/170` | Faltings-height comparison and arithmetic Noether |
| §4.6 | `/171`–`/189` | Non-degeneracy and scoped relative Bogomolov statements |
| Appendix A | `/190`–`/234` | Local metrics, algebraic theta formulas, graphs and assembly |
| Refinements | `/235`–`/261` | Separate parts of constructions and identities |
| Unresolved claims | `/262`–`/266` | Function-field branches of Theorem 4.19 |
| Pinned substrate | `/267`–`/271` | Actual library declarations |

This is a reading inventory, not a certificate of complete prerequisite extraction. Several items still bundle assertions or refer to inherited context. Introductory historical results and the external large-point input behind the uniform Mordell–Lang discussion still need their own coverage check.

## Source issue preventing completion

The author manuscript’s Theorem 4.19, p.101, is stated for a number field **or a one-variable function field**, with maximal variation of `X→S`. Under the definition in §1.6, variation relative to `K` does not imply the bigness over the constant field required in Proposition 4.18.

Take an algebraically closed field `k`, `K=k(t)`, a smooth projective genus-`g>1` curve `C0/k`, a degree-one class `alpha0`, and

`S=Spec K`, `X=C0×_k K`, `alpha=alpha0×_k K`.

The classifying map `Spec K→M_{g,K}` is a closed point, hence quasi-finite. Thus the printed `K`-relative variation hypothesis holds. Every point of `C0(k)` has canonical height zero in the constant Jacobian, and these points are Zariski dense in `C0×K`. Part (1), with `m=1≥dim_K S+1`, therefore cannot have a positive threshold with nondense small points. Products of constant points give the same obstruction for the other four maps.

This is an analysis of the **author manuscript**, not a claim that the inaccessible typeset article has identical wording. A model over `k` with generically finite moduli map is a possible stronger premise; silently inserting it would change the source. The number-field branches `/185`–`/189` are separated from `/262`–`/266`, which are excluded from all routes. Proposition 4.18 `/184` retains its bigness-over-`k` hypothesis. The main uniform theorem `/128` has an isotrivial-pair exclusion and is not contradicted by this example.

## Libraries and ownership

Full pinned source archives were searched: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. These actual declarations were opened and read:

- Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf`, `LineBundle/Basic.lean:78`;
- Tau Ceti `TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct`, `LineBundle/TensorProduct.lean:57`;
- Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`, `AbelianVariety/Basic.lean:94`;
- Mathlib `NumberField.prod_abs_eq_one`, `NumberTheory/NumberField/ProductFormula.lean:98`;
- Mathlib `Projectivization.logHeight`, `NumberTheory/Height/Projectivization.lean:51`.

InvertibleSheaf is a full subcategory with all module maps, so the isomorphism-only Picard groupoid needs additional packaging. AbelianVariety is over a field, not a relative abelian scheme. The projective height is relative to its admissible absolute values, without the needed degree normalization and extension comparison. The reviewed audits distinguish the existing elliptic heights from higher-dimensional canonical heights.

Searches across all `.lean` files included `adelic`, `Arakelov`, `Bogomolov`, `Faltings`, Deligne pairing, Gross–Schoen, Chambert-Loir, Picard, Poincare, theta, Jacobian, abelian schemes, canonical heights, Berkovich, admissible metrics and metrized graphs. Broad matches for the author Chambert-Loir, adelic number-field product formulas, the Poincare disk and elliptic Jacobian coordinates do not supply the requested theory. Searches were combined with the reviewed audits.

Both complete upstream documents, JacobianChallenge and StableReduction, were read. Relevant stage descriptions and reviewed library-coverage entries for curve theory, moduli, abelian schemes, Néron models, Arakelov geometry, heights and Gross–Zagier were read, with incident link/overlap entries. The inspected tree had six new roadmap files and one packet, `MordellLawrenceVenkatesh`, which supplied no exact adelic-family result here. No accepted `PAPER-YUAN-26` decomposition or draft was present. Refresh those inventories on resumption.

| Existing owner | Reused scope | Additional scope |
| --- | --- | --- |
| JacobianChallenge A–F | Field-level Picard, Jacobian, Abel–Jacobi and curve cohomology | Relative Jacobians and precise family theta identities |
| AbelianSchemes A1–3 | Groups, square/cube, duality, Poincare and torsion | Curve-specific relative Picard comparisons |
| StableReduction | Nodal curves, stabilization and DVR stable models | Curve moduli and stable compactification over larger bases |
| Arakelov R35.1–3 | Arithmetic bundles, Hodge/Faltings metrics and number-field heights | Quasi-projective adelic completion and bigness |
| GrossZagier GZ.2 | Classical admissible pairings and Green kernels | Arbitrary complete-field/family extension and global phi |
| Tropical TB.2–3, TB.6 | Skeleton, graph Laplacian, model metrics and measures | Specific invariant inequalities and globalization |
| ShimuraCompactifications C5 | Minimal PEL compactification and Hodge positivity | Compactified Torelli comparison |
| Heights RP.0, RP.5 | Height machine and ordinary Bogomolov direction | Genus-uniform bounds across fields and characteristics |

The four provisional briefs reflect these boundaries. `ArakelovGeometryAndAbelianHeightsPartII` owns the adelic theory and bigness. `JacobianChallengePartII` supplies relative algebraic identities. `StableReductionPartII` supplies curve moduli, importing general stacks. `HeightsRationalPointsAndObstructionsPartII` consumes them for uniformity. Existing classical objects remain source routes of their proposed owners, and upstream Tau Ceti stages are imported. No second general graph, abelian-scheme, stack or cycle roadmap is proposed. Final ownership is still a handoff task, especially for generic intersection and relative Picard interfaces.

## Normalization and proof checks to preserve

1. The degree-`d` Abel map is finite only for `d≠0`; at degree zero it is constant. Its construction and finiteness are separate items.
2. Stable curves require branch counts on the normalization, with self-nodes counted twice. Yuan’s nodal use of “semistable” also differs from the no-rational-tail convention in some upstream stages.
3. At genus one, the proof on p.113 cannot normalize using the degree of `omega`, which is zero. Use a positive-degree line bundle in the preceding pairing argument, then the residue isometry. The same care applies to A.5’s probability measure.
4. YZ2 Theorem 5.3.5(1) gives a non-strict inequality. To bound a set defined by `≤`, replace `M` by `M+A`, with `A` having strictly positive height or degree. An effective section of a multiple of `L-epsilon(M+A)` then gives `h_L≥epsilon(h_M+h_A)>epsilon h_M` off its divisor. The strict margin is necessary.
5. Baker–Faber’s graph function class has bounded second derivatives on a finite subdivision. Uniform convergence alone does not imply weak convergence of Laplacians. Zhang Theorem 2.4 approximates the measure first and then its Green potential.
6. Unit valuation lengths, metric factors `e_K`, Chern masses and logarithmic Green values must be distinguished. `/94` records only split normalized reduction. The arbitrary-extension formula on p.49 and division by field degree on p.116 still need ramification/residue-degree reconciliation. Raw unweighted local length cannot simply be divided by `[K′:K]`.
7. The general divisor Green equation on p.102 needs the factor `deg(D)` multiplying the probability measure. Degree one agrees with the displayed equation.
8. The lower-height proof establishes `D_tilde-c(g)Delta≥0` on p.95; retain this coefficient despite the phrase on p.94 using coefficient one.
9. Stable compactification of an arbitrary family uses graph closure in a compactification of the original base times the finite moduli cover. The original base need not embed in that cover.
10. General relative Bogomolov and general Gross–Schoen height positivity are not proved inputs. Yuan says the earlier Wil2 argument is incomplete on p.85. The usable number-field Hodge-index bound is Wil3 Theorem 1.2, checked separately.

The JSON prerequisites distinguish targeted statements read from acquisition tasks. Further exact checks include BLR relative Picard descent; DM Theorem 5.2; LMB 16.6 and CLM 7.2; MFK/van Geemen–Oort; FC V 2.3 and 4.6; Bost and Faltings–Moret-Bailly normalizations; de Jong tau; Carney’s function-field Hodge index; and the original Gross–Schoen regular-model construction. A plausible owner is not a checked proof. The complete proofs of all these secondary sources have not been read.

## Validation

The paper checker passes in partial mode. File-scope/JSON checks and a custom unique-ID/exact-once routing check are run for submission, with the six intentional unrouted items recorded. These checks certify checkpoint structure, not mathematical closure. No Lean file belongs to this paper job, and no Lean compilation was performed.

## Secondary-source acquisition record

The following PDFs were retrieved on 21 September 2026. Only the targeted portions identified in the result and report were read; this table records versions, not full-paper coverage. In particular, the downloaded Cinkir arXiv numbering differs from the published numbering cited by Yuan.

| Input | Retrieved PDF | SHA-256 |
| --- | --- | --- |
| yz2-v6 | [PDF](https://arxiv.org/pdf/2105.13587v6) | `86348af5b6f37c8ff028b4573264c23d9a35bb06e8f0006b08a7ea42e7eb4636` |
| lsw | [PDF](https://arxiv.org/pdf/2101.11593) | `d62e2a0cba65103acdd92f5a48b3db0c96aac75db1b8a71fc9b965c7a93b8629` |
| zha1 | [PDF](https://web.math.princeton.edu/~shouwu/publications/apc.pdf) | `ec17d361c9239352705f8d630198ffe4eb3ce62b185b0b038cbc6163a968a9a6` |
| zha3 | [PDF](https://arxiv.org/pdf/0812.0371) | `e01d3c31193ff442141931a1c22371d4d4d6f24d4c641bcc5fdb5336d60c2c4c` |
| cin1 | [PDF](https://arxiv.org/pdf/0901.3945) | `378def7b7451ab30e2b6e40aa6acc2abea39c3f04fb7294a0a7ffb88492efff2` |
| cin2 | [PDF](https://arxiv.org/pdf/1405.7413) | `0bd5c36bab5c714500386abdcc5ce5f6bf1bef8ad99eb47ba2bc593f0d0d7816` |
| wil3 | [PDF](https://arxiv.org/pdf/1903.12159) | `279412548e62fb16d1caa1cc0c9d0cbe1aa95c5ddbccc144e82b21b6bd00b590` |
| br | [PDF](https://arxiv.org/pdf/math/0407427) | `2f2f4cdeb472e0c6203644624a1f30c4b2ef7a0809322366d82b699a58dd0e4c` |
| bf | [PDF](https://arxiv.org/pdf/math/0407428) | `f205b04815533c3d9f5617c4095cddb5b48d551ef0ebe7051e23d0ce928b2954` |
