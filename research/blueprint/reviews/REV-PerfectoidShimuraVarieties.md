# Independent review: PerfectoidShimuraVarieties

**Verdict: needs_changes. Completed review, not a checkpoint.** Codex, session `codex-pMKjxR`, 2026-10-07. Refs #469. The author was Claude Opus 5.5, session `claude-hkZHP3`, working on #972; this reviewer did none of that planning. Claim confirmed by [the swarm bot](https://github.com/CBirkbeck/tauceti-explorer/issues/469#issuecomment-6028261300).

The target-level pass is complete under Protocol §0. Its eight stages remain **planned**, with explicit remaining lists; none is closed. The review covers every node, API, test, citation, prerequisite supplier and original source issue. Thirty-five nodes receive concrete corrections, including five whose remaining proof inputs are still unverifiable. The checked ledger contains 52 verified, 30 corrected and eight unverifiable nodes. No mathematical node is added or removed.

The principal acceptance failure is Protocol §13: the suggested file offers CONTRACT comments for almost all geometric definitions, constructions, APIs, tests and named theorems. Proposed names in comments are not Lean signatures or examples. Its native fragment elaborates, but does not meet the required prototype coverage. Eight S6 nodes also cannot be justified from the existing supplier statements; the packet now identifies the missing inputs rather than claiming them implicitly. Recorded gaps alone do not make this complete review a checkpoint or require every stage to be closed.

## Counts and target coverage

| Item | Input | Reviewed |
|---|---:|---:|
| Nodes | 90 | 90 |
| Definitions / constructions | 4 / 20 | 4 / 20 |
| Theorems / comparisons / lemmas | 51 / 8 / 7 | 51 / 8 / 7 |
| API items / unit tests | 154 / 97 | 154 / 97 |
| Planets | 27 | 27 |
| Pinned baseline declarations | 21 | 21 confirmed |
| Node source citations | 184 | 184 checked |
| Primary source files | 15 | 15 exact-SHA files, plus 3 published collations |
| Source issues | 39 | 42: 40 confirmed, 2 rejected |
| Gaps / requests | 3 / 16 | 6 / 20 |
| Restructuring proposals | 3 | 3 retained |
| Planned / closed stages | 8 / 0 | 8 / 0 |

The roadmap README, every stage README, the generated reader, the original handoff, and the related reviewed library audit were read. Every stage target has its target-level realization. This review does not split target-level proof sketches into lemma-level nodes. Every definition/construction retains at least three discriminating tests; the central-cocharacter correction preserves all five tests. Every implementationStatus remains `unchecked`. Planets are named mathematical constructions/theorems, with at most six per stage; none required replacement.

| Stage | Nodes | Planets | Coverage and boundary of the claim |
|---|---:|---:|---|
| S0 | 9 | 4 | Towers, action, diamond/representative, effective kernel, components, rigidification; fixed tame-level and canonical-model requests retained. |
| S0.general | 2 | 1 | General and fixed-fan toroidal diamonds, refinement and Hecke maps; no general perfectoid representability assertion. |
| S1 | 26 | 6 | Siegel Frobenius/anticanonical tower, full perfectoid tower and period map, toroidal and elliptic cusp cases; general-radius boundary inertia remains a gap. |
| S2 | 10 | 2 | Hodge-type open, image and genuine minimal towers, quotients and comparison; universal integral perfectoidization is needed for the genuine tower, not the open/image construction. |
| S3 | 13 | 6 | Period maps, Levi torsors, twists, graph frames, formal models and elliptic/Hilbert examples; finite tensors and logarithmic comparison stay with their suppliers. |
| S4 | 7 | 3 | Property P and pre-abelian minimal representability with strong boundary closedness; an abelian-type period map is not asserted for all pre-abelian data. |
| S5 | 11 | 3 | Modular comparison and the three distinct Hilbert towers, profinite versus finite deck groups, pairing and actions; F=ℚ specialization excludes the former universal growth assertion. |
| S6 | 12 | 2 | General toroidal and abelian minimal period maps, descent and Levi reductions; effective/logarithmic, auxiliary-datum, ramified-descent and Bruhat inputs are explicitly incomplete. |

## Acceptance failures and precise revision work

1. **Suggested signatures.** Replace comment-only prototypes by actual supplier-based definition/construction signatures, API lemma signatures, test examples and named theorem statements wherever the carriers exist. Where a condition cannot yet be stated, omit that condition honestly and document the limitation, as §13 requires; never insert Prop-valued fake geometry. Renaming comments or passing a name-presence check is insufficient. The revised header now states this limitation explicitly. There are only 25 actual named declarations/instances and 15 actual examples, in four partial native fragments: integral GSp levels, the effective-kernel carrier, a Hilbert unit calculation, and graph-chart matrix identities. This count includes the two review counterexamples; it is not geometric coverage of 90 nodes.
2. **Effective tower and log-to-v bridge (S6/kummer-to-v-bridge, general-toroidal-period-map, integral-levi-reduction).** The arithmetic central kernel must be annihilated by the actual G^c pushout; the tower cannot be assumed a faithful K_p-torsor. T6’s period-sheaf evaluation on log affinoid perfectoid objects does not itself give v-covers of every perfectoid test or descent of analytic P^c torsors. The new gap/request names all three obligations and coordinates B0’s ineffective-fibre descent. Right translation carries an embedded P-torsor to its translate; it induces an intrinsic isomorphism, rather than leaving the embedded subset unchanged.
3. **Auxiliary B₁ datum and c-Levi identity (S6/abelian-auxiliary-data, torsor-fibre-product).** D4/central-isogeny-lift lifts through a specified central isogeny of whole groups. It does not supply Lovering’s auxiliary reflex-torus fibre product, its cocharacter, maps or reflex-field compatibility. Request those data and the central-character proof of the G^c/Levi fibre-product identity. Part (i) of the torsor lemma is sound with smooth surjectivity; it cannot establish part (ii)’s coefficient-group identity. The statement that this identity was “checked here” is removed.
4. **Ramified boundary descent (S6/abelian-torsor-descent).** The finite toroidal map is only generically finite étale. The coarse quotient may ramify at boundary strata, as the C3 supplier allows. Descent of the pushed-out locally free torsor requires trivial boundary inertia and a logarithmic/coarse descent theorem. Ordinary finite étale descent on the interior is insufficient. The new request is to AutomorphicBundles B3.general, coordinated with ShimuraCompactifications C3.general.
5. **Bruhat dynamics (S6/toroidal-hecke-correspondences, bruhat-levi-reduction).** Keep the existing missing flag-tube/root-normalization owner obligation. The new E41 counterexample also requires repairing the separate-vanishing inference in Lemma 4.6.20 before importing its Levi-image argument. It does not disprove the lemma’s conclusion.

A fourth new request, to DiamondsAndVStacks D6, supplies the fully faithful perfectoid-to-diamond functor with fixed base/untilt for S2/genuine-to-image-comparison. The proof now constructs a map of diamond limits and lifts it via that precise interface, rather than assuming a genuine-minimal tilde-limit already exists. D5 supplies the qcqs limit comparison. All 16 original requests were read and retained; all four additions identify the supplier, consuming nodes and exact extra statement. Cross-roadmap foundations are requested from their owners, never replanned here.

## Applied corrections

The following table records every modified node and every modified field. The full per-node ledger below supplies the mathematical reason, including remaining limitations.

| Node | Fields corrected |
|---|---|
| `PerfectoidShimuraVarieties:S0/siegel-level-subgroups` | hypotheses, proofSteps, api |
| `PerfectoidShimuraVarieties:S0/tower-right-action` | tests |
| `PerfectoidShimuraVarieties:S0/perfectoid-representative` | statement |
| `PerfectoidShimuraVarieties:S0/tower-action-kernel` | hypotheses |
| `PerfectoidShimuraVarieties:S0/rigidified-moduli-tower` | statement, hypotheses |
| `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond` | tests |
| `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces` | statement, hypotheses, proofSteps, api |
| `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison` | statement, hypotheses |
| `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates` | proofSteps |
| `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift` | statement, proofSteps |
| `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid` | statement |
| `PerfectoidShimuraVarieties:S1/translates-cover-tower` | proofSteps |
| `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space` | statement |
| `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map` | statement, proofSteps |
| `PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients` | statement, hypotheses, api |
| `PerfectoidShimuraVarieties:S1/elliptic-cusps-at-infinite-level` | statement |
| `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison` | statement |
| `PerfectoidShimuraVarieties:S2/genuine-to-image-comparison` | proofSteps, prerequisites |
| `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety` | tests |
| `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback` | statement, hypotheses, proofSteps |
| `PerfectoidShimuraVarieties:S3/hodge-period-map-datum-functoriality` | statement, proofSteps |
| `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps` | statement, prerequisites |
| `PerfectoidShimuraVarieties:S3/hodge-tate-formal-models` | statement |
| `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1` | hypotheses |
| `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety` | proofSteps |
| `PerfectoidShimuraVarieties:S5/modular-cusp-charts-and-q-action` | statement, proofSteps |
| `PerfectoidShimuraVarieties:S5/hilbert-three-towers` | statement |
| `PerfectoidShimuraVarieties:S5/hilbert-mixed-span` | proofSteps |
| `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors` | proofSteps |
| `PerfectoidShimuraVarieties:S5/hilbert-gl2-qp-action` | tests |
| `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge` | statement, proofSteps, prerequisites |
| `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data` | hypotheses |
| `PerfectoidShimuraVarieties:S6/torsor-fibre-product` | hypotheses, proofSteps |
| `PerfectoidShimuraVarieties:S6/abelian-torsor-descent` | hypotheses, proofSteps |
| `PerfectoidShimuraVarieties:S6/integral-levi-reduction` | hypotheses |

Other changes: four baseline `provides` clauses are narrowed; all 21 `checked` fields record independent verification; three gaps and four requests are added; S2/S6 remaining lists are extended; the existing Bruhat gap records E41; the review object and 90-entry ledger are added; all original source issues receive independent verdicts; E2/E23/E30 are scoped to failures of proof, E4 loses its unsupported integral-flatness claim, E21’s equivariance qualification is corrected, E24 records its published correction, E26 receives a numerical counterexample, and three new source issues and the read-version records are added. The suggested file’s affected contracts are synchronized, its cofinality signature is corrected, intersection triviality is separated, two explicit counterexample computations are added, and matrix/unit topology imports supply the actual topology.

## Baseline and library audit

Every declaration below was opened at the exact pinned commit, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No citation is removed, and none is used as an uncited geometric theorem. Four scope clarifications are applied rather than replacing valid carriers.

| Declaration | Confirmed scope and compatibility |
|---|---|
| `mathlib:CategoryTheory.Functor` | Functor with object/map data; the level system must still supply its categories and maps. |
| `mathlib:CategoryTheory.IsCofiltered` | Cofiltered category; finite intersections of compact open levels supply the relevant witnesses. |
| `mathlib:CategoryTheory.Limits.limit` | Chosen limit under HasLimit F. It does not prove existence of v-sheaf limits; provides clause clarified. |
| `mathlib:CongruenceSubgroup.Gamma` | Kernel congruence subgroup in SL(2,ℤ), not GL₂(ℤ_p); compared through the explicit integral inclusion. |
| `mathlib:CongruenceSubgroup.Gamma0` | Lower-left congruence condition in SL₂; the packet uses the same block orientation. |
| `mathlib:CongruenceSubgroup.Gamma1` | Identity diagonal and zero lower-left modulo N; Gamma1_mem is used directly by a native example. |
| `mathlib:IsDedekindDomain.FiniteAdeleRing` | Restricted product of height-one completions for a Dedekind domain; prime-to-p factors still need their construction. |
| `mathlib:Matrix.GeneralLinearGroup` | Units of the matrix ring, with finite index type and commutative-ring assumptions. |
| `mathlib:Matrix.J` | Block form (0,−I; I,0), negative of Scholze’s form; the similitude subgroup is independent of that sign. |
| `mathlib:Matrix.det` | Determinant over a commutative ring and finite index type; graph-factor hypotheses match. |
| `mathlib:Matrix.fromBlocks` | Actual block matrices; supports the native graph identity. |
| `mathlib:Matrix.symplecticGroup` | Submonoid satisfying AJAᵀ=J. Invertibility comes from the GL carrier in the packet; not confused with all matrices. |
| `mathlib:Module.Grassmannian` | Submodule with finite projective quotient of constant rankAtStalk k; no scheme or Lagrangian closed embedding is provided. Clause clarified. |
| `mathlib:MonoidHom.ker` | Kernel defined by image equal to 1; the effective deck quotient uses this group-theoretic carrier. |
| `mathlib:MulAction.stabilizer` | Stabilizer for a left action; component right actions use the opposite group. |
| `mathlib:MulAction.toPermHom` | Permutation homomorphism for a left action. Right translation T_(gh)=T_h∘T_g uses the opposite group; clause clarified. |
| `mathlib:NumberField.RingOfIntegers` | Integral closure giving the ring of integers of a number field; no moduli space is provided. |
| `mathlib:PadicInt` | p-adic integers with norm ≤1 and prime Fact; the native level file supplies that prime hypothesis. |
| `mathlib:Subgroup.topologicalClosure` | Closure subgroup under the topological-group assumptions; no closed-kernel identity follows merely from this definition. |
| `mathlib:frobenius` | Commutative semiring and ExpChar R p, mapping x to x^p. Relative geometric Frobenius and twists need the geometric supplier; clause clarified. |
| `tauceti:TauCeti.exists_continuous_section` | Closed subgroup of a compact totally disconnected topological group; continuous coset section normalized at 1. Fits ℤ_p^×⊂𝒪_p^×, not arbitrary profinite surjections. |

The reviewed audit has no PerfectoidShimuraVarieties entry. Its related ShimuraVarieties and ShimuraCompactifications entries were read: they do not supply the new perfectoid/adic geometric theorems, and the existing group/ring carriers are imported. The two upstream comparison documents (AdicSpaces and AnalyticToricGeometry) were read in full; generic analytic foundations and finite toric/fan constructions remain upstream inputs. No upstream roadmap is replanned or modified. Generic tilde-limits, Frobenius tower criteria, finite quotients, strong closed loci and diamondification retain the P7/P8/Q4/D6 owners.

There are 162 distinct original external prerequisite references, including stage-level references, across 12 supplier roadmap directions. Their node statements and hypotheses, or the cited stage statement when no packet node exists, were read. In particular: P7 requires actual open-level containment witnesses, not just trivial intersection; P8 free quotient descent requires its separated qcqs hypotheses; D4’s isomorphism criteria use all valued-field tests rather than faithfulness of one fixed C; C3 permits boundary ramification; B0/B1 retain the ineffective arithmetic centre; and D4’s central-isogeny lift is narrower than the auxiliary torus construction. The packet now reflects these distinctions.

## Red-team findings and ownership

| Finding | Independent disposition |
|---|---|
| RT-AREA-padic-1/1 | Correctly separates universal integral perfectoidization from characteristic-p/char-zero closed-locus perfection. The late Q5/PerfectoidQuotients Part II proposal remains the single intended owner. S2/S4 record its consumers without introducing a Q2/Q4 dependency cycle. |
| RT-AREA-padic-1/4 | S6 owns the general toroidal Hodge–Tate map and Levi pullback. T6:comparison is narrowed to finite-level logarithmic comparison and its affinoid evaluations, with the additional effective/log-to-v obligation now explicit. |
| RT-AREA-padic-1/22 | S3 owns the infinite-level Hodge-type period map and Levi torsor; T2 supplies the finite-level exact sequence/tensor compatibility. The request and restructuring proposal state this boundary. |

All three existing proposals are appropriate at target level: period-map ownership; the late perfectoidization dependency; and the S1 canonical Frobenius-lift ownership versus T3/T4. They are **proposals**, not applied ownership changes. The current supplier roadmap text still contains overlapping formulations, so acceptance cannot be described as already applying these changes to the atlas. The generated reader reflects the original proposals but is stale after this review’s statement corrections. It is read-only for this issue; the revision/orchestrator must regenerate it from the corrected packet and reconcile its introduction. No other job’s files or live atlas data were edited.

## Source checks and versions

All 184 citations were checked against the 15 public files identified below, including their hypotheses and proof inputs. Every downloaded SHA256 equals the packet’s recorded hash. Normalized text matches 182 excerpts; Milne’s two symbolic formulas (S0/tower-right-action, p. 58, and component-set-of-infinite-level, p. 59) were checked visually because their PDF text layer mangles the symbols. Exact public URLs, versions and hashes are preserved in `sources` and reviewer-dated `sourceVersions`; the table lists the principal passages checked. The source issue ledger distinguishes mistakes in proof from false stated results and distinguishes preprints from print.

| Source | Public text and passages |
|---|---|
| `sch15` | [Annals of Mathematics 182 (2015), no. 3, 945–1066, published version (doi:10.4007/annals.2015.182.3.3); printed page numbers 945–1066 and the published (arabic) numbering, e.g. Theorem 3.3.18 = arXiv Theorem III.3.18](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Published Annals: p. 967; pp. 970–972, 983–1016, 1018–1020, 1029–1030. |
| `hj25` | [arXiv:2011.03951v2, 29 August 2025 (paper dated 1 September 2025; the revised version, from which the Hodge–Tate period map for pre-abelian data was removed); printed page = PDF page](https://arxiv.org/abs/2011.03951v2). arXiv v2: pp. 4–5 and 34–38; Corollary 5.21 explicitly checked, including the boundary proof. |
| `cs17` | [arXiv:1511.02418v1, 8 November 2015 (published in Ann. of Math. 186 (2017), 649–766; preprint numbering used)](https://arxiv.org/abs/1511.02418v1). arXiv v1: pp. 11–12 and 20–21; published pp. 673–674 collated separately. |
| `bp21` | [arXiv:2110.10251v1, 19 October 2021](https://arxiv.org/abs/2110.10251v1). arXiv v1: pp. 64–66, 74–85 and 87–96, including both torsor principles and §4.6 proof steps. |
| `bhw` | [arXiv:1902.03985v4, 10 May 2021 (published in Ann. Inst. Fourier 73 (2023), no. 4, 1709–1794); printed page = PDF page of the arXiv version](https://arxiv.org/abs/1902.03985v4). arXiv v4: pp. 7–14, 19–25 and 32–43; corresponding published issue passages collated separately. |
| `sw13` | [arXiv:1211.6357v2, 13 April 2013 (published in Camb. J. Math. 1 (2013), 145–237)](https://arxiv.org/abs/1211.6357v2). arXiv v2: §2.4, pp. 19–21, including Definition 2.4.1 and Proposition 2.4.5. |
| `ecd` | [arXiv:1709.07343v4](https://arxiv.org/abs/1709.07343v4). arXiv v4: §11, pp. 62–63, including inverse limits with compact open group actions. |
| `milne` | [October 23, 2004; revised September 16, 2017 (numbering unchanged from the published version in Harmonic analysis, the trace formula, and Shimura varieties, Clay Math. Proc. 4, 2005)](https://www.jmilne.org/math/xnotes/svi.pdf). Revised 2017 notes: §5, pp. 58–65, right actions, components and passage to the limit. |
| `pan22` | [arXiv:2209.06366v1, 14 September 2022 (published in Ann. of Math. 203 (2026), no. 1, 121–281; not obtained, preprint read)](https://arxiv.org/abs/2209.06366v1). arXiv v1: pp. 17–19, 34–35 and 38, exact sequence and the two graded pieces. |
| `bcgp21` | [arXiv:1812.09269v3, 28 November 2021 (published in Publ. Math. IHÉS 134 (2021), 153–501; statement numbers agree)](https://arxiv.org/abs/1812.09269v3). arXiv v3: §6.2.1, pp. 144–145, including the stated formal-model/ample-line input. |
| `ps16` | [Author's version from V. Pilloni's homepage (published in Ann. Math. Québec 40 (2016), 167–202); PDF page numbers](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf). Author copy: pp. 2, 7–10, 12–13, 21 and 27–30, formal models and toroidal appendix. |
| `pil20` | [Author's version (113 pages, dated 17 June 2019) from V. Pilloni's homepage (published in Duke Math. J. 169 (2020), no. 9, 1647–1807)](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Author copy: §12.9.1, p. 81, including references and the stronger determinant claim. |
| `heuer20` | [arXiv:2002.02488v1, 6 February 2020](https://arxiv.org/abs/2002.02488v1). arXiv v1: introduction, pp. 6–10 and 14–25, finite cusps, q-actions and Proposition 3.20 proof. |
| `bpa` | [Authors' manuscript from V. Pilloni's homepage (180 pp., PDF dated 3 March 2025), the version cited by OverconvergentAutomorphicForms O8; differs from arXiv v1 by the cyclotomic twists in §4.4 and the renumbering of §4.4.12–4.4.30](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf). March 2025 author copy: pp. 69, 74–75, 80, 90–91, 94–95 and 97–99; corrected twists, cyclotomic field hypothesis and Lemma 4.6.20. |
| `bp26` | [Authors' version from V. Pilloni's homepage (built 5 November 2025, 65 pages; published in Invent. Math. 244 (2026), 45–141); printed page = PDF page](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Author copy: §1.3.9 and §3.3, pp. 33–35, graph/frame and model conventions. |

Additional published files read on 2026-10-07:

| File | Scope | SHA256 |
|---|---|---|
| [Birkbeck–Heuer–Williams, AIF 73 (2023), 1709–1794](https://www.numdam.org/item/10.5802/aif.3560.pdf) | E24, E26–E31, E35–E36; E24 corrected in print. | `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4` |
| [Caraiani–Scholze, Annals 186 (2017), 649–766](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | Proposition 2.3.9, pp. 673–674; E21/E42 persist. | `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a` |
| [Heuer, Documenta Math. 27 (2022), 2385–2440](https://ems.press/content/serial-article-files/29310?nt=1) | Proposition 3.20 and proof, pp. 2418–2419; E40 persists. | `de9a34a70abeb2d8ccadd6cb21df4b6c19179258789a640272faa1c2d7896a67` |

Pan’s [published Annals article page](https://annals.math.princeton.edu/2026/203-1/p03) confirms the 2026 publication and DOI. A direct PDF attempt returned 404; the Project Euclid full-PDF endpoint returned an HTML access challenge. The published text was not obtained. E25 therefore accuses only the identified arXiv v1 passage. Likewise E32–E34 are scoped to the author copies read; the published Duke/Québec versions were not obtained. No new version-of-record claim is inferred from those copies. The remaining source versions and earlier register entries were inspected for known corrections; no unsupported assertion of a formal journal erratum is made.

## Independent source-issue ledger

Every original issue has `review.by = REV-PerfectoidShimuraVarieties`. E7 and E15 are rejected with reasons, retaining the original records for traceability. E2 is confirmed only as an inadequate proof for all coordinate subsets, not as a counterexample to the theorem. E4 is confirmed for generic degree only; the unsupported integral nonflatness claim is removed. E23/E30 are proof gaps. E24 was already corrected in print. E40–E42 are added by this reviewer and carry their own confirmed verdicts.

| Issue | Verdict | Independent reason and version scope |
|---|---|---|
| `E1` | confirmed | Confirmed at published p. 971. For genus 2 the block diagonal matrix diag(I₂,−I₂) has determinant 1 and multiplier −1; at odd p it satisfies the printed determinant condition but not the intended multiplier condition. |
| `E2` | confirmed | Confirmed as a proof gap, not a counterexample to every-J affinoidness: symplectic permutations take admissible Lagrangian coordinate subsets to each other, but cannot take a non-Lagrangian subset to the standard Lagrangian subset. Restricting the proof to the 2^g admissible charts supplies a covering and the needed conclusions. |
| `E3` | confirmed | Confirmed at p. 984: an admissible blow-up preserves the generic fibre, whereas this Hasse domain is a proper open chart. The intended chart of a blow-up is clear. |
| `E4` | confirmed | Confirmed only for the printed common degree. The generic base map has degree p^{g(g+1)/2}; the abelian-scheme map has the extra isogeny factor p^g. The stronger original correction asserting integral nonflatness at every positive radius has no proof here and is removed. |
| `E5` | confirmed | Confirmed at p. 986: C is a subgroup of A[p], so its canonical-subgroup level is 1, not p. |
| `E6` | confirmed | Confirmed in the square on p. 985: its source and target are compactifications, so the left-arrow Frobenius lift needs the star. |
| `E7` | rejected | Rejected. The theorem already states uniqueness of the full displayed diagram including the abelian schemes; nonuniqueness of bare base-space Frobenius lifts does not contradict that claim. The alleged use of Lemma 3.2.4 does not establish an error at this locator. |
| `E8` | confirmed | Confirmed as an application gap at pp. 999–1000. Goodness supplies injectivity for bounded sections; the proof uses idempotents, which are bounded. This does not refute the lemma under its printed unbounded injectivity hypothesis. |
| `E9` | confirmed | Confirmed as a missing boundary-strata/inertia argument at pp. 1001–1002. Generic étaleness alone does not yield étaleness along a whole boundary stratum. The general-radius higher-genus supplier obligation is retained. |
| `E10` | confirmed | Confirmed as an omitted genus-one proof, not a false conclusion. The codimension ≥2 Hartogs proof does not treat curves; Heuer Theorems 3.17 and 3.22 and Corollary 3.18 supply the cited cusp replacement. |
| `E11` | confirmed | Confirmed as an omitted plus-ring completion statement needed downstream. Normality and the trace argument of Lemma 3.2.24(iii) supply the strengthening; mere density of ordinary function rings does not state it. |
| `E12` | confirmed | Confirmed at p. 1016. GL₂ satisfies the displayed adjoint condition but has disconnected real points and noncompact real centre. Use Deligne’s actual Shimura-data hypotheses instead of the stated inference about G itself. |
| `E13` | confirmed | Confirmed as an abbreviated closed-locus/plus-ring comparison, not a disproof of Hodge-type perfectoidness. The precise finite algebraic closed-locus supplier P8 provides the needed comparison. |
| `E14` | confirmed | Confirmed in the first limit on p. 1020: the varying ambient tame subgroups are in the Siegel group G′, not G. |
| `E15` | rejected | Rejected. Revised HJ §5.3 explicitly proves the boundary claim in Corollary 5.21 on p. 38, via the finite-level closed boundary and Bhatt–Scholze Remark 7.5. The claim that §5 proves only perfectoidness is false. A separate canonical-model comparison obligation is not evidence for this accusation. |
| `E16` | confirmed | Confirmed at Definition 5.17: intersecting an arithmetic subgroup of G^ad(ℚ) with K_p in G(ℚ_p) is ill-typed unless an adjoint convention or lift is supplied. The connected proof needs the compatible choice described in the correction. |
| `E17` | confirmed | Confirmed at Proposition 5.14: the finite-level Siegel variety uses a full finite-adelic level K, while K^p belongs to the prime-to-p adeles. |
| `E18` | confirmed | Confirmed at Theorem 5.20: the tame subgroup K^p is in G(𝔸_f^p). |
| `E19` | confirmed | Confirmed at p. 37: Γ‴ is a normal core already in the adjoint rational group, so the extra π on Γ‴ has the wrong domain. |
| `E20` | confirmed | Confirmed in arXiv v1 and corrected in the authors’ March 2025 manuscript: the relative sequence contains the Tate twist, and §4.4.23 identifies the canonical torsor through μ with the cyclotomic torsor. The revised finite-field condition in Proposition 4.6.12 is essential. |
| `E21` | confirmed | Confirmed also in the published Annals text, Proposition 2.3.9 and proof, pp. 673–674. The setup is over E_𝔭; the Tate line has no canonical trivialization there. The intrinsic comparison is twisted. A chosen trivialization gives an underlying untwisted comparison, with equivariance requiring a compatible transported linearization. |
| `E22` | confirmed | Confirmed in arXiv v1 p. 80: the second factor must be P_H₃, not a second P_H₁. The two maps to P_H₂ fix the intended indices. |
| `E23` | confirmed | Confirmed as a missing comparison argument, not a counterexample to Theorem 4.4.45. The source constructs the minimal map via Hodge/abelian descent and asserts agreement with the logarithmic toroidal map; the dense-open closed-diagonal comparison is needed. |
| `E24` | confirmed | Confirmed in arXiv v4 p. 13 and corrected in print, Lemma 3.19, p. 1731. The factor multiplies s, not γ; the preprint proof already has the intended expression. |
| `E25` | confirmed | Confirmed in arXiv v1 p. 38. Fil¹D = ω on pp. 34–35 makes gr¹D = ω and gr⁰D = det(D)⊗ω⁻¹. The published Annals article page was checked but its PDF could not be obtained; this finding is scoped to the preprint. |
| `E26` | confirmed | Confirmed also in printed Lemma 8.20, p. 1775. An explicit inert-prime counterexample is F=ℚ(√5), ε=(1+√5)/2, p=7, N=4, n=1. The map ε^{16ℤ}/ε^{96ℤ} → ε^{2ℤ}/ε^{12ℤ} has kernel of order 2, represented by ε^48. This refutes the claimed injection without refuting eventual stabilization. Odd-p transition injectivity and bounded orders give an alternate proof; the p=2 stabilization claim remains unproved here. |
| `E27` | confirmed | Confirmed also in print, proof of Lemma 8.28, pp. 1779–1780. Equivariance makes the projection map noninvariant under the contracted-product action. Multiplication by diag(u,1) supplies the invariant formula; the theorem itself is not refuted. |
| `E28` | confirmed | Confirmed also in print, pp. 1769 and 1779. Replacing the chosen polarization by a positive unit changes the pairing by its inverse, so the arithmetic variety carries its unit-quotient class rather than a representative. |
| `E29` | confirmed | Confirmed also in print, Definition 8.17 p. 1773 versus Lemma 9.2 p. 1782. The scalar quotient uses all tame-congruence units, not only totally positive ones; positivity is not a condition on local p-adic units. Their norm is nevertheless 1 at N≥3. |
| `E30` | confirmed | Confirmed as a proof gap also in print, Proposition 2.6 p. 1723 versus Proposition 5.18 p. 1751. The cited discrete radius estimates do not establish the claimed interpolation over all radii. No counterexample to the stronger estimate has been proved. |
| `E31` | confirmed | Confirmed as an action-description gap also in print, Proposition 3.8 p. 1727. The limiting triangular subgroup is not normal; its coset set is not a quotient group. Heuer specifies the acting lower-unipotent subgroup and the cusp-width normalization. |
| `E32` | confirmed | Confirmed as a missing proof of the stronger k=1 statement in the author versions read. Pilloni–Stroh Theorem 1.22 proves a power; Remark 1.23 asserts the stronger form. This is not a counterexample to that form, and the unobtained published versions are not accused. |
| `E33` | confirmed | Confirmed in the author copy p. 81: reference [71] is the published Annals article, so p. 72 is preprint pagination; the argument is on printed pp. 1029–1030. |
| `E34` | confirmed | Confirmed in the author copy PDF p. 7: f is the map from the toroidal modified model, so the pushed-forward structure sheaf must be that of the toroidal model. |
| `E35` | confirmed | Confirmed also in print p. 1720. On y²=x³+1, the order-three automorphism x↦ζ₃x fixes the order-three marked point (0,1); Γ₁(3) does not give the claimed fine moduli problem. Full Γ(N), N≥3, and Γ₁(N), N≥4, are the appropriate bounds. |
| `E36` | confirmed | Confirmed as an invalid integral splitting step also in print p. 1752. At a ramified prime the integral tensor product is not the product of the embedded integer rings, although it becomes one after inverting p. The stated estimate needs a different-sensitive repair, not just the field splitting. |
| `E37` | confirmed | Confirmed for the asserted equality of connected towers: for the isotropic SU(2,1) datum over ℚ(i), take p≡1 mod12. Its rational centre is trivial but its p-adic centre is μ₃. Strong approximation makes arithmetic elements approximate these central points, so the image of Γ∩K_p differs from π(Γ)∩π(K_p). A finite central comparison replaces equality; this does not disprove the representability conclusion. |
| `E38` | confirmed | Confirmed as an omitted finite-level transitivity argument at p. 1009. Anticanonical loci are pullbacks of finite-level clopen summands, and a finite symplectic orbit covers them. This is distinct from the infinite-level fixed-Weil-pairing fibre, which is closed and generally not open. |
| `E39` | confirmed | Confirmed at p. 1008 by comparison with Lemma 3.3.6 on p. 1006: rational flags pull back to the closure of the ordinary locus. Higher-rank specializations distinguish it from the ordinary locus itself. |
| `E40` | confirmed | For γ=1, b=0 and d=1, so b/d=0 is integral but not a unit. Both the preprint and the published proof have the unit symbol; the proposition and its q-expansion formula require only integrality. |
| `E41` | confirmed | Take t=1, w=1 and a nonidentity sufficiently small element u of the indicated opposite root subgroup, lying in both required open subgroups. Set k′′=u and k′′′=u⁻¹. Their product is 1∈P_μ but neither is 1. This contradicts the displayed proof step, not the Levi-image equality. |
| `E42` | confirmed | In dimension 2g, det=c^g. The polarization identifies the similitude representation with the Tate line (with the chosen variance), while the determinant gives its g-th power. The distinction disappears only for g=1. |

### Reproducible E26 calculation

Put ε=(1+√5)/2, so ε²=ε+1. The unit group of ℚ(√5) is ±ε^ℤ and its totally positive subgroup is ε^{2ℤ}. Multiplication in the integral basis is

`(a,b)(c,d) = (ac+bd, ad+bc+bd)`.

Direct modular multiplication gives orders 6, 16 and 48 for ε modulo 4, 7 and 28. The element −1 is not in the cyclic ε-subgroup modulo 4; modulo the inert prime 7, ε^8=−1. Thus

- U₄=ε^{6ℤ}, U₇⁺=ε^{16ℤ}, U₂₈=ε^{48ℤ};
- Δ₁(4)=ε^{16ℤ}/ε^{96ℤ} has order 6;
- Δ(4)=ε^{2ℤ}/ε^{12ℤ} has order 6;
- the natural map has image of order 3 and kernel of order 2, represented by ε^48.

Equivalently η=ε^24 is tame-congruent to 1, but η≡−1 mod7, and η² represents the nonzero kernel class. The suggested Lean file checks ε^8=−1 and ε^16=1 modulo 7 with `decide`; an independent direct modular calculation checks all three orders and the image size. This is an odd inert-prime example, so the original restriction to a split-prime mechanism is unnecessary. It refutes the injection in the proof, not the stabilization conclusion. Odd-p transitions are injective and bounded, providing another stabilization argument. No numerical counterexample to eventual p=2 stabilization is claimed.

### Reproducible E41 cancellation

In the last line of BP Lemma 4.6.20 take t=w=1 and a sufficiently small nonidentity opposite-root element u in both stated congruence neighbourhoods. The factors u and u⁻¹ multiply to 1∈P_μ although neither is 1. A native integer-matrix example verifies upper-unipotent cancellation; choosing the coefficient sufficiently divisible by p gives the same example in the requisite p-adic opens (or use the lower root for the opposite pinned parabolic). This invalidates the separate-vanishing step. The desired Levi image could still follow from cancellation/conjugation control, which the supplier must prove.

## Full node ledger

“Verified” means the target-level planning statement is justified by the cited suppliers **conditional on its explicitly recorded prerequisites and gaps**. It does not mean that the mathematics has been formalized. “Unverifiable” identifies the additional unestablished proof input described above. The API and test outline of every definition/construction was checked as a mathematical interface; actual Lean coverage is the separate §13 failure.

| Node | Verdict | Check/correction |
|---|---|---|
| `PerfectoidShimuraVarieties:S0/siegel-level-subgroups` | corrected | Corrected cofinality to an open-subgroup containment witness and separated intersection triviality in Lean; specified U₀=ℤ_p^×. Multiplier-versus-determinant correction confirmed at Scholze p. 971. |
| `PerfectoidShimuraVarieties:S0/p-level-tower` | verified | Milne §5 and the canonical-model/level-tower suppliers confirm the indexing, neat finite étale transitions and cardinality-qualified complex-points comparison. Seven API items and four tests checked. |
| `PerfectoidShimuraVarieties:S0/tower-right-action` | corrected | Right translation obeys T_(gh)=T_h∘T_g; the scalar-level test now specifies K^p=K(N)^p. A left-action permutation homomorphism must use the opposite group. |
| `PerfectoidShimuraVarieties:S0/infinite-level-diamond` | verified | The diamond inverse limit uses the compact-group inverse-limit representability hypotheses of ECD Lemmas 11.21–11.22 and D5. The full similitude tower is distinguished from a fixed pairing fibre. |
| `PerfectoidShimuraVarieties:S0/perfectoid-representative` | corrected | Restricted the explicitly supplied affinoid-basis converse to finite transition maps. SW Definition 2.4.1 and Proposition 2.4.5 agree; a tilde-limit is not an ordinary analytic categorical limit. |
| `PerfectoidShimuraVarieties:S0/tower-action-kernel` | corrected | Replaced arbitrary fixed-C-point faithfulness by faithful algebraic base change at finite canonical-model levels. Milne 5.28 supplies the central closure; the native fragment only checks the topological group carrier. |
| `PerfectoidShimuraVarieties:S0/component-set-of-infinite-level` | verified | Milne 5.17/5.28 and HJ Lemmas 5.2–5.3 confirm normality/component conventions and the simply-connected restriction. D5 supplies inverse-limit component comparison; four tests checked. |
| `PerfectoidShimuraVarieties:S0/connected-component-tower` | verified | HJ Proposition 5.16 and Definition 5.17 support conjugate tame levels and opposite translation order. The infinite neutral fibre is only closed; the node makes no clopen assertion. |
| `PerfectoidShimuraVarieties:S0/rigidified-moduli-tower` | corrected | Added separated qcqs rigid analytic hypotheses required by P8 free quotient descent, and qualified unbounded Hilbert deck growth by [F:ℚ]>1. The profinite group is the inverse limit of finite deck groups, not a single finite group. |
| `PerfectoidShimuraVarieties:S0.general/general-infinite-level-diamond` | verified | BP §4.4.38 and general canonical-model suppliers support the general tower diamond. No general perfectoid representability or minimal Hodge–Tate map is claimed. |
| `PerfectoidShimuraVarieties:S0.general/toroidal-tower-diamond` | corrected | Restricted the refinement non-example to a genuine star subdivision introducing a new boundary ray. Fixed admissible fans and their level normalizations need not stay smooth; this remains distinct from the toric geometry owner. |
| `PerfectoidShimuraVarieties:S1/siegel-finite-level-spaces` | corrected | Fixed the m=0 multiplier convention. Scholze pp. 983–984 give the finite fixed-pairing spaces and Hasse chart of a blow-up, rather than a whole admissible blow-up. |
| `PerfectoidShimuraVarieties:S1/siegel-similitude-comparison` | corrected | Corrected the infinite fixed-pairing fibre to closed, generally not open; finite fibres remain clopen. U₀=ℤ_p^× replaces the erroneous level-zero unit expression. Semilinear multiplier convention retained. |
| `PerfectoidShimuraVarieties:S1/frobenius-diagram-mod-p` | verified | Scholze Lemma 3.2.14 confirms the relative Frobenius twist and base. Scalar Mathlib frobenius alone does not provide the geometric relative map; the geometric supplier is retained. |
| `PerfectoidShimuraVarieties:S1/frobenius-trace-estimates` | corrected | Corrected Frobenius freeness to R/p, not R. Scholze pp. 990–994 give τ[1/p] and the 1−2ε trace bound; no integral flatness conclusion is needed. |
| `PerfectoidShimuraVarieties:S1/canonical-frobenius-lift` | corrected | Corrected generic degrees and removed the unsupported universal integral-nonflatness assertion. Rejected E7: the source already states uniqueness of the complete abelian-scheme diagram, not arbitrary bare Frobenius lifts. |
| `PerfectoidShimuraVarieties:S1/anticanonical-open-immersions` | verified | Scholze Theorem 3.2.15(ii) gives the anticanonical open immersions; Heuer supplies the genus-one cusp replacement. Higher-level Lagrangian complements and the compactification star are retained. |
| `PerfectoidShimuraVarieties:S1/anticanonical-locus-level-p` | verified | The level-one canonical subgroup and the noncircular degree argument agree with Scholze Theorem 3.2.15(iii). Corrected source level typo is retained; the coefficient t belongs to H(S). |
| `PerfectoidShimuraVarieties:S1/anticanonical-tower` | verified | Scholze p. 988 supplies radius scaling and the high-power Hasse affinoid criterion. Four API tests distinguish the anticanonical image from a full inverse image; finite generic Frobenius is the needed map. |
| `PerfectoidShimuraVarieties:S1/gamma0-infinite-level-perfectoid` | corrected | Specified the completed perfection in the tilt-field notation. The Frobenius-controlled tower and tilt comparison are imported from their existing owners; no literal uncompleted union is identified with a complete tilt field. |
| `PerfectoidShimuraVarieties:S1/gamma0-boundary-strongly-zariski-closed` | verified | Characteristic-p strong closure followed by tilting is the supplied Q4/P8 route. This does not assume the distinct universal integral perfectoidization theorem. |
| `PerfectoidShimuraVarieties:S1/tate-normalized-traces` | verified | Scholze p. 994 and the R3 trace supplier give the bounded normalized trace and geometric-series estimates. Four tests check division by the generic degree, radius and p-adic completion conventions. |
| `PerfectoidShimuraVarieties:S1/hartogs-for-finite-covers-of-anticanonical-tower` | verified | Scholze pp. 995–997 and the normalization/Hartogs suppliers give the bounded-plus-ring finite-cover comparison. No vertical components is retained as a hypothesis; genus-one boundary handling is separate. |
| `PerfectoidShimuraVarieties:S1/anticanonical-torsion-and-tilt` | verified | Scholze pp. 997–998 identify the infinite Frobenius quotient and its finite étale tilt. The claim uses the tilting equivalence, not an identification of mixed-characteristic torsion with scalar Frobenius. |
| `PerfectoidShimuraVarieties:S1/characteristic-p-base-triples-good` | verified | Source p.998 defines exactly this normalization of the analytification of the ordinary scheme: do not confuse that analytification with the ordinary formal tube. Its Hasse section is invertible but can have nonunit norm. Remaining inputs are the finite normalization/Hartogs suppliers. |
| `PerfectoidShimuraVarieties:S1/gamma1-cover-tilt` | verified | The idempotent criterion is correct for bounded O+ sections. Source error concerns its application to an unbounded O section on a non-qc ordinary open, not the lemma itself. |
| `PerfectoidShimuraVarieties:S1/gamma1-level-perfectoid` | verified | Finite canonical cusp charts in Heuer Theorem 3.17 and Corollary 3.18 supply the genus-one repair independently of the ultimate full tower. The higher-genus bounded-section argument is the stated one. |
| `PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid` | verified | The plan records E9 as a genuine unresolved general-radius boundary-inertia obligation. Genus-one cusp replacement and plus-ring completion are separate supplied inputs; this is a verified conditional plan, not a completed proof. |
| `PerfectoidShimuraVarieties:S1/continuous-hodge-tate-map` | verified | Scholze pp. 1003–1005 and the finite Hodge–Tate supplier agree with the right-action inverse convention and semistable valued-point filtration. No equality of analytic maps is inferred solely from underlying topological maps. |
| `PerfectoidShimuraVarieties:S1/rational-flags-preimage` | verified | Scholze Lemma 3.3.6 identifies the rational-flag locus with the closure of ordinariness, with the Raynaud abelian part at the boundary. The algebraically closed valued-field hypotheses are retained. |
| `PerfectoidShimuraVarieties:S1/translates-cover-tower` | corrected | Replaced the incorrect complement-openness shortcut by Scholze p. 1009 constructible compactness for a finite quasicompact open union and classical specializations. The no-interior boundary argument is used at finite-type tower charts. |
| `PerfectoidShimuraVarieties:S1/perfectoid-siegel-space` | corrected | Infinite pairing fibre is closed, usually not open; finite-level anticanonical decomposition remains clopen and gives the finite translate cover. |
| `PerfectoidShimuraVarieties:S1/siegel-hodge-tate-period-map` | corrected | Uniqueness now uses the functorial Hodge–Tate filtration and descent, rather than the underlying topological map alone. Existence is Scholze’s analytic extension from the anticanonical charts. |
| `PerfectoidShimuraVarieties:S1/siegel-main-theorem` | verified | The 2^g admissible Lagrangian Plücker charts cover Fl and support the supplied proof. E2 is a gap for non-Lagrangian coordinate subsets, not a refutation of the theorem for all subsets. |
| `PerfectoidShimuraVarieties:S1/perfectoid-toroidal-siegel-tower` | verified | Pilloni–Stroh Appendix A supplies the toroidal extension at fixed cone decomposition. Its level-normalized charts are not assumed smooth merely because the base cone system is smooth. |
| `PerfectoidShimuraVarieties:S1/siegel-open-tower-and-level-quotients` | corrected | Corrected the infinite fixed-pairing fibre to closed and fixed U₀. The strict-Iwahori convention agrees with the downstream O8 supplier; finite anticanonical clopen summands are unchanged. |
| `PerfectoidShimuraVarieties:S1/elliptic-cusps-at-infinite-level` | corrected | Replaced the infinite coproduct of pairing components by a profinite family of closed fibres. Heuer’s left-action normalization and cusp-width formula supply the full modular tower convention. |
| `PerfectoidShimuraVarieties:S2/hodge-type-embedding-and-siegel-comparison` | corrected | Replaced an arbitrary identity neighbourhood basis by compact open neighbourhoods of the fixed K. Scholze footnote 16 and the finite canonical-model suppliers support the closed embedding after this compatible shrinking. |
| `PerfectoidShimuraVarieties:S2/image-compactification` | verified | Finite coherent image algebra yields stable image normalization; distinguish the image compactification from the genuine normal minimal compactification. |
| `PerfectoidShimuraVarieties:S2/hodge-open-perfectoid-tower` | verified | Characteristic-zero algebraic closed loci are covered by P8 and Q4’s characteristic-zero strong-closure theorem. No universal integral perfectoidization gap is needed for this open Hodge-type tower; the plan intentionally works over C. |
| `PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower` | verified | P8’s finite algebraic closed-locus plus-ring comparison supports the image-compactified good tower. This is not the genuine normal minimal tower and does not need universal integral perfectoidization. |
| `PerfectoidShimuraVarieties:S2/siegel-tame-level-removal` | verified | Tame-level removal uses finite invariant affinoids and good-tower descent; ineffective finite action must be allowed. |
| `PerfectoidShimuraVarieties:S2/hodge-genuine-minimal-perfectoid-tower` | verified | The genuine minimal limit is represented as a diamond; no unproved tilde-limit assertion is made. Universal integral perfectoidization is an explicit existing gap, with a single-owner late-stage proposal. |
| `PerfectoidShimuraVarieties:S2/hodge-good-tower-arbitrary-level` | verified | A non-product compact open has finite-index product sublevels; quotient descent is compatible with the fixed tame-level theorem. |
| `PerfectoidShimuraVarieties:S2/good-tower-base-change` | verified | P8 supplies good-affinoid base change over complete nonarchimedean extensions and the finite closed-locus compatibility. This is not a claim about arbitrary topological base change. |
| `PerfectoidShimuraVarieties:S2/genuine-to-image-comparison` | corrected | Constructed the comparison as a map of diamond limits, with D5 qcqs comparison and a precise D6 request for fully faithful perfectoid-to-diamond lifting with fixed base/untilt. No genuine-minimal tilde-limit was used. |
| `PerfectoidShimuraVarieties:S2/embedding-independence` | verified | Embedding independence on the open tower follows from its intrinsic diamond limit; compactified image towers remain embedding dependent. |
| `PerfectoidShimuraVarieties:S3/levi-torsor-over-flag-variety` | corrected | Corrected the central-μ test: FL is a point, while its Levi torsor is G→point. Retained all five tests, including the opposite-parabolic row-space non-example; the frame quotient is by the unipotent radical. |
| `PerfectoidShimuraVarieties:S3/siegel-period-map-properties` | verified | Right action and prime-to-p Hecke compatibility agree with the chosen flag convention. |
| `PerfectoidShimuraVarieties:S3/siegel-tautological-pullback` | corrected | Corrected the determinant line to π_HT*ω_FL≅ω(−g). A chosen Tate trivialization produces an untwisted underlying bundle, whose equivariance requires transported linearization; the integral-bound proof uses that choice explicitly. |
| `PerfectoidShimuraVarieties:S3/siegel-graph-chart-and-frame` | verified | The graph action and Hodge frame factor, including the similitude character, agree with explicit matrix calculations; seven discriminating tests. |
| `PerfectoidShimuraVarieties:S3/hodge-open-period-map` | verified | HT tensors give the Hodge-type parabolic/Levi reduction, relying on T2 for finite-level tensors and the separated flag equality criterion. |
| `PerfectoidShimuraVarieties:S3/hodge-levi-pullback` | verified | The mu-weight determines the Tate twist as in the revised manuscript. A P representation is restricted to the Levi as specified; do not assume every P representation has trivial unipotent action. |
| `PerfectoidShimuraVarieties:S3/hodge-period-map-datum-functoriality` | corrected | Required f∘μ₁=μ₂ for the flag map. Identity/composition now use the functorial tensor-frame construction, avoiding a false fixed-C-point or underlying-topology equality criterion. |
| `PerfectoidShimuraVarieties:S3/hodge-compactified-period-maps` | corrected | Aligned the line twist with node49 and added P8 closed-locus and T6 logarithmic comparison prerequisites for the compactified Hodge-type maps. The toroidal tensor comparison is separately requested. |
| `PerfectoidShimuraVarieties:S3/hodge-tate-formal-models` | corrected | Corrected n₀ to the least integer exceeding B(g,p), with B=g/(p−1) for odd p and B=2g at p=2. The proof and tests use the corrected bound and the weaker power-of-determinant ampleness statement. |
| `PerfectoidShimuraVarieties:S3/elliptic-hodge-tate-and-O1` | corrected | Required Γ(N), N≥3, or Γ₁(N), N≥4. Its O(1) has the explicitly modified linearization; it is not silently equated with the natural determinant line of node49. |
| `PerfectoidShimuraVarieties:S3/hecke-equivariant-hodge-tate-sequence` | verified | Pan arXiv v1 pp. 34–35 and 38 give Fil¹D=ω and gr⁰D=det(D)⊗ω⁻¹. The node uses the corrected graded piece and retains the Hecke-equivariant Tate twist. |
| `PerfectoidShimuraVarieties:S3/hilbert-res-flag-period-map` | verified | Split Hilbert coordinates are over a splitting field. The integral ramified tensor product is not a product; the rank-g unsplit bundle is correctly not called a line. |
| `PerfectoidShimuraVarieties:S3/affinoid-perfectoid-basis-of-flag-variety` | corrected | Replaced separatedness-implies-rational-intersection by explicit Plücker-chart rational inequalities. Pullback of their finite intersections supplies an intersection-stable good affinoid basis. |
| `PerfectoidShimuraVarieties:S4/property-p` | verified | Property P is a concrete representability predicate, not a placeholder theorem; its equivalence to the neutral-component criterion is supplied by node61. |
| `PerfectoidShimuraVarieties:S4/property-p-full-iff-neutral` | verified | Correctly says the infinite neutral component is only closed. Reconstruction uses finite orbits and the product with a profinite set, not an open-component coproduct. |
| `PerfectoidShimuraVarieties:S4/property-p-from-adjoint` | verified | Connected ShimuraData V6 inputs are semisimple, so the adjoint quotient is a finite central isogeny. The proof uses finite kernel/cofinal image levels, not equality of all arithmetic intersection subgroups (E37). |
| `PerfectoidShimuraVarieties:S4/hodge-adjoint-property-p` | verified | Normal core lies in the adjoint group already; finite stabilizer corrections and the comparison map are explicit. |
| `PerfectoidShimuraVarieties:S4/preabelian-minimal-perfectoid` | verified | Revised HJ Theorem 5.20 gives pre-abelian minimal representability and deliberately omits the former general period-map assertion. Universal integral perfectoidization remains an honest named dependency. |
| `PerfectoidShimuraVarieties:S4/preabelian-open-tower-and-boundary` | verified | Revised HJ Corollary 5.21 p. 38 explicitly proves strong boundary closedness; E15 is rejected. P8/Q4 supply the closed pullback and strong-closure theorem, with the separate integral-perfectoidization dependency retained. |
| `PerfectoidShimuraVarieties:S4/preabelian-reflex-bridge` | verified | The C_p/complex comparison fixes an abstract field isomorphism and then uses canonical models; no analytic field-topology compatibility is asserted. |
| `PerfectoidShimuraVarieties:S5/modular-tower-comparison` | verified | The chosen diagonal section trivializes a product with ℤ_p^×, not an infinite coproduct of open components. Finite modular-level comparison and the GL₂ action use the actual fine-level supplier hypotheses. |
| `PerfectoidShimuraVarieties:S5/modular-cusp-charts-and-q-action` | corrected | Specified the actual cusp field L_x and completed bounded-series convention. Heuer Lemma 3.21 (not Theorem 3.21), Proposition 3.20 and Theorem 3.22 provide the normalized q-root action. |
| `PerfectoidShimuraVarieties:S5/modular-anticanonical-and-period-compatibility` | verified | Only the established discrete radius bounds are used. BHW Proposition 2.6’s stronger interpolation is an unproved source claim (E30), not an imported estimate. |
| `PerfectoidShimuraVarieties:S5/hilbert-three-towers` | corrected | Qualified unbounded deck-group orders by [F:ℚ]>1. For F=ℚ the groups are trivial; the three Hilbert towers and their distinct deck systems otherwise agree with BHW §8. |
| `PerfectoidShimuraVarieties:S5/hilbert-mixed-span` | corrected | Removed a forward proof dependence on node72 by citing finite-level H4 pairing directly. The pinned coset-section theorem applies to the actual compact totally disconnected group and closed subgroup, with identity normalization. |
| `PerfectoidShimuraVarieties:S5/hilbert-weil-pairing` | verified | The pairing changes by determinant and inverse polarization unit; square-unit quotient compatibility is the essential check. |
| `PerfectoidShimuraVarieties:S5/hilbert-polarization-torsors` | corrected | Qualified deck growth by [F:ℚ]>1. The finite identity-component kernel is bounded by units modulo squares, without Leopoldt; odd-p transition injectivity gives stabilization, distinct from the false map into Δ(N) in E26. |
| `PerfectoidShimuraVarieties:S5/hilbert-level-torsors` | verified | Use the closure of all tame-congruence units, not only positive units, in the central scalar quotient; p-level n>=1 ensures anticanonical stability. |
| `PerfectoidShimuraVarieties:S5/hilbert-gl2-qp-action` | corrected | Replaced a nonexistent global generator of a nonprincipal prime by a local uniformizer in F_p with specified valuations. The lattice/isogeny calculation proves the left action and its compatibility with right translation by γ^∨. |
| `PerfectoidShimuraVarieties:S5/hilbert-period-and-domain-compatibility` | verified | The descended period map uses diag(u,1), not projection to x; ramified integral splitting cannot justify a uniform radius estimate. |
| `PerfectoidShimuraVarieties:S5/hilbert-f-equals-q-check` | verified | For F=Q, Delta_n and Z_infty are trivial, so the specialization also checks the corrected growth qualifications. |
| `PerfectoidShimuraVarieties:S6/kummer-to-v-bridge` | unverifiable | Corrected embedded-torsor translation and replaced the faithful K_p-torsor shortcut by the effective deck group. The existing suppliers do not prove central-kernel annihilation, the required log-to-v covers and analytic torsor descent; a new precise gap/request records these. |
| `PerfectoidShimuraVarieties:S6/general-toroidal-period-map` | unverifiable | General toroidal period-map descent depends on the newly exposed effective-deck/log-to-v bridge (node78). Period-sheaf evaluation alone is insufficient, so that proof obligation remains unverifiable from current supplier statements. |
| `PerfectoidShimuraVarieties:S6/toroidal-hecke-correspondences` | unverifiable | The Bruhat Hecke clause needs the explicitly missing flag-tube/root-group supplier. E41 additionally refutes the separate-vanishing step in BP Lemma 4.6.20; the Hecke statement is not disproved, but its current proof input is incomplete. |
| `PerfectoidShimuraVarieties:S6/abelian-auxiliary-data` | unverifiable | D4/central-isogeny-lift only handles a specified whole-group central isogeny, not Lovering’s reflex-torus B₁ construction. Added a precise auxiliary-datum/central-character supplier request; this application remains unverified. |
| `PerfectoidShimuraVarieties:S6/torsor-fibre-product` | unverifiable | Part (i) follows from smooth surjectivity and étale-local lifting. Removed the unsupported claim that the application’s G^c/Levi fibre-product identity was checked: its central-character proof is a new explicit gap. |
| `PerfectoidShimuraVarieties:S6/abelian-connected-towers-and-descent-group` | verified | BP Theorem 4.4.43 and Lemma 4.4.52 distinguish the finite fixed-tame quotient from the full profinite kernel. The planned statement is checked conditional on the separately requested auxiliary-datum construction. |
| `PerfectoidShimuraVarieties:S6/tilde-limit-components-and-quotients` | verified | Connected fibres use idempotents and strong closedness; finite quotients require invariant pregood cover; induction requires an actual continuous compact-profinite coset section. Ring density uses locally constant functions. |
| `PerfectoidShimuraVarieties:S6/abelian-minimal-period-map` | verified | Abelian minimal period map remains distinct from pre-abelian representability. The invariant pregood cover follows from the affinoid period map and trivial action of Delta on the flag. |
| `PerfectoidShimuraVarieties:S6/abelian-torsor-descent` | unverifiable | Replaced ordinary étale descent through a generically étale toroidal map by a precise logarithmic/coarse descent and trivial-boundary-inertia obligation. C3’s boundary ramification means the existing interior descent argument does not suffice. |
| `PerfectoidShimuraVarieties:S6/minimal-toroidal-period-map-compatibility` | verified | Agreement on the dense open plus a closed diagonal gives a closed immersion surjective on diamond points, hence an isomorphism. Density of the open in the inverse-limit topology needs finite-level basis and surjective open-tower projections. |
| `PerfectoidShimuraVarieties:S6/integral-levi-reduction` | unverifiable | Recorded effective-deck kernel compatibility before untwisted finite-level Levi descent. The Tate line cannot be treated as an étale trivialization at finite level; the log/effective comparison remains a missing proof input. |
| `PerfectoidShimuraVarieties:S6/bruhat-levi-reduction` | unverifiable | The revised manuscript’s cyclotomic containment and untwisted de Rham torsor are necessary. The Bruhat tubes/root normalization supplier is explicitly missing; E41 further requires repair of its Hecke Levi-image proof. |

## Validation and orchestrator follow-through

- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidShimuraVarieties.json`: 0 errors, 0 warnings; 90 nodes, 154 API items, 97 tests, 27 planets, eight planned stages, no closed stage.
- `source_issues.check_issues` and `check_errata.versions_checked` on this packet’s source-issue/version lists: no errors. The standalone errata CLI expects an errata-v1 file and is not the blueprint packet validator.
- `lean-check research/blueprint/suggested/PerfectoidShimuraVarieties.lean`: exit 0 in the existing shared build, Mathlib exactly `082e2d37e8`; 31 warnings, all `declaration uses sorry`. More than 20 GB was available before compilation. No build, update, cache retrieval or language server was started. This checks only the native Mathlib fragments: the shared Tau Ceti checkout is not the packet’s f790474 pin, no Tau Ceti module is imported, and no claim is made that the whole geometric roadmap or the Tau Ceti dependency elaborates.
- The original 15 source SHA256 values were independently verified; all 184 excerpts and cited locators were compared. Supplier statement inspection was completed for all 162 original external references. The two review arithmetic/matrix examples elaborate and direct modular arithmetic confirms the E26 orders.
- Name presence, minimum test counts, native/comment counts, internal dependency acyclicity, valid JSON and allowed-path checks are recorded in the handoff after the final submission checks.

The orchestrator should open a revision round, retaining this completed independent review. Revision should first replace comment-only signatures, then resolve or explicitly qualify the S6 interfaces using the four precise new supplier requests, and regenerate the reader. Route the existing three restructuring proposals through their normal review/application flow; do not describe them as already applied. The consumer issues already noted in the original handoff remain separate jobs: O8 frame linearization, O4 all-unit scalar closure, and T3/T4 Frobenius ownership. This reviewer does not promote or claim those jobs.
