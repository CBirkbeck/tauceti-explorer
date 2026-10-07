# Independent review: Igusa varieties, compactified period fibers and torsion concentration

**Verdict: needs_changes.** Job `REV-IgusaVarietiesAndTorsionConcentration`, issue #434. Reviewer: Codex, session `codex-TS3GQE`, 2026-10-07. The input was the completed plan by Claude, session `claude-5F6Set` (BP #757); this reviewer did none of that work.

This is a completed independent review, not a checkpoint. Clear defects have been corrected in the packet and suggested file. Six nodes remain unverifiable for the specific reasons below. The verdict does not reject the packet merely for recording open gaps: section 0 permits requested suppliers and recorded gaps as planning terminals. It rejects unresolved assertions and inadequate prototype contracts that still advertise more than the evidence supplies.

## Scope and counts

Read all 120 nodes, all 208 node-source records at their locators, the complete suggested file, and the reader's requests, gaps, restructuring and red-team responses. Read the statements of all 155 original distinct direct external suppliers, plus the three newly introduced contracts; 157 distinct direct suppliers remain after the corrections. These are direct-contract checks, not certification of every supplier's transitive proof. Read the reviewed library audit and the upstream Adic Spaces and Modular Curves roadmaps as models.

| Item | Submitted plan | Reviewed plan |
|---|---:|---:|
| Nodes | 120 | 120 |
| Definitions / constructions / theorems / lemmas | 12 / 28 / 72 / 8 | 12 / 28 / 72 / 8 |
| API items | 218 | 218 |
| Packet unit tests | 139 | 138 |
| Planets | 34 | 34 |
| Baseline declarations | 17 | 17 |
| Requests | 25 | 33 |
| Recorded gaps | 12 | 18 |
| Source issues | 10 | 14 |
| Inherited source issues | 29 | 32 |
| Recorded source versions | 4 | 6 |
| Restructuring proposals | 8 | 8 |

The per-node review records **83 verified, 31 corrected and 6 unverifiable**. No nodes were added or removed. The additional opaque Lean interfaces are explicitly owned by suppliers and requested there; they are not duplicate mathematical nodes. All implementation statuses remain `unchecked`.

| Stage | Nodes | Planets | Coverage |
|---|---:|---:|---|
| IG.0 | 29 | 6 | planned |
| IG.1 | 10 | 3 | planned |
| IG.2 | 21 | 6 | planned |
| IG.3 | 26 | 6 | planned |
| IG.4 | 10 | 4 | planned |
| IG.5 | 6 | 3 | planned |
| IG.6 | 7 | 2 | planned |
| IG.7 | 11 | 4 | planned |

Every stage target has a realizing node. All eight stages remain `planned`, none `closed`: their chains end in library results, supplier nodes, explicit requests or named gaps. The `remaining` lists now identify the review's unresolved contracts and reader synchronization. `complete` means one finished target-level pass under section 0. Proofs have not been split into artificial lemma nodes at this granularity.

## Six unresolved nodes

1. **IG.0/unramified-local-pel-datum.** Nondegeneracy and a finite full lattice are now explicit. The Lean carrier still lacks the unramified-centre/maximal-order conditions and a B-linear, isotropic Hodge decomposition satisfying the similitude/cocharacter condition. An arbitrary idempotent is insufficient. The source supplies a rational symmetric quasi-polarization; an integral principal-polarized, completely slope divisible representative with all G-structure is a further requested theorem. Complete the carrier and the adapter; do not infer principal polarization from a rational quasi-polarization.
2. **IG.2/ekedahl-oort-stratification.** The negative example asserts a mixed-Newton EO stratum for every datum with n≥2. General non-refinement in the cited sources does not prove that universal claim. Give a concrete PEL datum, prime, EO label and two Newton classes, or prove the universal statement. The suggested assertion is explicitly annotated unverified and is not counted as an established mathematical test.
3. **IG.4/finite-level-formal-models.** CSnc p.62 asserts integrality at sufficiently large finite level over O_C/p, not the previous blanket finiteness claim. The finite-type F_p finiteness lemma does not directly apply to these nonnoetherian models. Supply the finite-presentation descent and an enlarged nonconstructible perverse lower-bound interface with the needed continuity.
4. **IG.4/semiperversity.** The same model/perverse interface is needed here, together with geometric continuous étale tower descent. Constructible EDC.5, abstract group Hochschild–Serre and Betti finite-cover theorems do not provide this application. The incorrect edges have been removed and the precise replacements requested; the proof contract still needs reconciliation.
5. **IG.7/koshikawa-local-vanishing.** Mod-ℓ spectral action, spherical Satake compatibility and generic irrelevance are essential. Parameter assignment and the characteristic-zero GL_n/inner-form comparison do not themselves close this torsion argument. State the integral/reduction interface used in Koshikawa §§3–4.
6. **IG.7/koshikawa-generic-vanishing.** Replace the former away-p minimal-stratum proof by the actual local-spherical ordinary costalk argument. The corrected outline follows Proposition 1.7, Corollary 8.2, the support triangle in Lemma 8.3, smoothness in Lemma 6.1, the dualizing shift in Lemma 9.1 and spectral support in Lemma 3.1. The corresponding Bun_G interfaces remain requested. An away-p Hecke localization theorem cannot be substituted for localization at 𝔪_p.

These are linked to named packet gaps and per-node verdicts. Other recorded gaps, including perfect-Witt formal étale invariance, are honest requested planning terminals; their presence alone is not the reason for `needs_changes`.

## Correction ledger

Node IDs below omit the common `IgusaVarietiesAndTorsionConcentration:` prefix. The packet's `review.checked` covers every node; the following records all corrections and the unresolved assertions identified during this review.

| Node | Change or review result |
|---|---|
| `IG.0/quasi-split-unitary-datum` | Suggested datum now requires a finite full self-dual lattice, rather than merely an arbitrary submodule. |
| `IG.0/hasse-principle` | Corrected false global H¹-vanishing and the determinant norm exponent; invoke the actual PEL Hasse-principle contract. |
| `IG.0/unramified-local-pel-datum` | Aligned covariant [−1,0] slopes, quasi-polarization and integral-representative requirements. Strengthened the Lean form and lattice fields. Cocharacter/unramified carrier remains unverified; see item 1. |
| `IG.0/newton-map` | Added the slope-filtration theorem as a direct prerequisite for choosing X_b; requested the missing integral G-structure compatibility. |
| `IG.0/internal-hom-p-divisible-group` | Normalized unreadable PDF control glyphs in the source excerpt; locator and mathematical content checked against the PDF. |
| `IG.0/completely-slope-divisible` | Made graded pieces actual quotients by subgroup embeddings on every finite torsion level, with positive height; categorical Mono alone is insufficient. Restored constant Newton polygon in the generic spreading API and signature. |
| `IG.0/slope-filtration-existence` | Restored the missing constant-Newton-polygon hypothesis in the statement and suggested Lean theorem; G-structured integral existence remains a supplier request. |
| `IG.0/central-leaf-dimension` | Removed the unsupported perfect-cotangent-complex dimension argument; retained Hamacher’s PEL dimension theorem. |
| `IG.0/pel-rapoport-zink-space` | Removed the purely étale/trivial-μ example, which is an EL example incompatible with nonzero polarized PEL data; three meaningful tests remain. |
| `IG.1/perfect-igusa-variety` | Removed the false perfect-base restriction and replaced the alleged reverse isogeny by a quasi-isogeny. |
| `IG.1/alternating-igusa-cohomology` | Changed invariant dimension in Lean from ℕ to Cardinal, so invariants under K^S×{1}, which is not compact open in the product, can be infinite. |
| `IG.1/harris-taylor-igusa-varieties` | Corrected first-kind level to the étale part; formal-part level belongs to Mantovan’s additional cover. |
| `IG.1/refined-strata-closures-smooth` | Recorded the two index conventions and corrected the Lean target from I_{m,h} to I_{m,n−1−h}. |
| `IG.2/ekedahl-oort-stratification` | Recorded a named witness gap and annotated the universal Lean negative assertion unverified; see item 2. |
| `IG.2/affineness-transfer-lemma` | Normalized unreadable PDF control glyphs in the source excerpt; locator and mathematical content checked against the PDF. |
| `IG.2/perfect-minimal-igusa` | Qualified the absolute Spec H⁰ formula by affineness of C^{X,*}; the general construction is relative Stein factorization. |
| `IG.2/minimal-igusa-compactification` | Made the affineness conclusion conditional on the base leaf compactification, consistent with the API and existing gaps. |
| `IG.3/flag-newton-strata-dimension` | Removed finite-type/noetherian A2 dimension contracts from perfectoid dimension arguments; use the C8 partially proper dimension formalism and local perfectoid coordinates. |
| `IG.3/local-hodge-tate-period-map` | Replaced the impossible trivial-μ polarized example by J_b-invariance; retained Lubin–Tate and non-surjectivity tests. |
| `IG.3/automorphism-group-dimension` | Removed finite-type/noetherian A2 dimension contracts from perfectoid dimension arguments; use the C8 partially proper dimension formalism and local perfectoid coordinates. |
| `IG.3/canonical-lift-of-igusa` | Separated nonnoetherian formal-site invariance from the admissible/noetherian supplier contract and requested the correct generalization. Normalized unreadable PDF control glyphs in the source excerpt; locator and mathematical content checked against the PDF. |
| `IG.3/perfect-scheme-lift-cohomology` | Separated nonnoetherian formal-site invariance from the admissible/noetherian supplier contract and requested the correct generalization. |
| `IG.3/sw-infinite-level-rz-space` | Corrected profinite to locally profinite, included geometric base change for the multiplicative tower, and excluded the stationary GL₁(𝔽₂) level-zero exception. |
| `IG.4/equivariant-sites-and-nearby-cycles` | Corrected trivial action versus trivial group and replaced the unsupported orbit argument by the cyclic classifying-topos cohomology test. Separated nonnoetherian formal-site invariance from the admissible/noetherian supplier contract and requested the correct generalization. |
| `IG.4/finiteness-from-rank-one-valuative-criterion` | Corrected the impossible algebraically-closed-fraction-field DVR argument; extend the valuation, then descend integrality. |
| `IG.4/finite-level-formal-models` | Changed finite to integral at sufficiently large finite level, corrected the ordinary-fibre example, added descent/enlarged-perversity requests and an honest Lean limitation; see item 3. |
| `IG.4/compact-perversity` | Checked source and supplier contracts; added the explicit requested enlarged-perversity prerequisite. The finite-type constructible supplier does not itself cover the nonconstructible model application. |
| `IG.4/semiperversity` | Removed inapplicable group/Betti/ℓ-group descent edges; added geometric étale descent, pro-p invariants and enlarged-perversity requests; see item 4. |
| `IG.5/concentrated-cohomology-gives-constituent` | Removed mismatched Hochschild–Serre/lowest-degree supplier contracts; requested geometric continuous étale descent and pro-p exact invariants. |
| `IG.5/genericity-forces-ordinary` | Used the semisimple local Weil parameter rather than falsely asserting that every unramified ℓ-adic lift is a direct sum of characters. |
| `IG.6/boundary-parabolic-induction` | Corrected discrete homogeneous base to compact locally profinite and explained the equality of compact and smooth induction. |
| `IG.6/boundary-comparison-map` | Restricted the point/constant-class acceptance example to imaginary quadratic F; retained the real torus factor in general. |
| `IG.6/igusa-pink-formula` | Corrected the degree-zero GL₁ specialization to require F⁺=ℚ. |
| `IG.6/parabolic-induction-derived-invariants` | Normalized unreadable PDF control glyphs in the source excerpt; locator and mathematical content checked against the PDF. |
| `IG.7/level-descent` | Removed inapplicable group/Betti/ℓ-group descent suppliers and used a good auxiliary prime for arbitrary neat level. |
| `IG.7/koshikawa-local-vanishing` | Distinguished the mod-ℓ spectral action from characteristic-zero comparison and requested integral Satake/reduction compatibility; see item 5. |
| `IG.7/koshikawa-generic-vanishing` | Replaced the inapplicable away-p Artin-bound route by the actual ordinary costalk argument and a direct BG3 request; see item 6. |

Additional details needed to reproduce the edits:

- The Hasse-principle proof now uses the locally trivial H¹ kernel. For the dimension-2n similitude matrix, Nm(det g)=c(g)^{2n}; dividing det g by c(g)^n yields the norm-one factor. The former exponent n and global H¹-vanishing were wrong.
- `SlopeFiltration` now identifies each graded piece with the quotient by its predecessor and identifies its quotient map. Inclusions are closed subgroup embeddings at every finite torsion level, not merely categorical monomorphisms: multiplication by p is a categorical monomorphism of p-divisible groups but is not such a subgroup embedding. Graded pieces have positive height; the isoclinic one-piece test assumes nonzero height, with an empty filtration for the zero group.
- The Rapoport–Zink Lubin–Tate acceptance example now distinguishes the PEL GL_n×G_m space (components indexed by Z×Z) from the EL GL_n space (Z). The proper-isomorphism-locus test assumes positive framing height. Removing the invalid purely étale polarized example leaves three RZ tests. The replacement local Hodge–Tate test is J_b-invariance.
- The SW multiplicative example is stated after geometric base change, where all p-power roots of unity are present; its parameter set is locally profinite Q_p^×. Nonstationarity is asserted for levels n≥1, avoiding GL_1(F_2) at level zero.
- The equivariant-site negative example uses H¹(B C_ℓ,F_ℓ), compared with the geometric point. Trivial action retains group cohomology; only the trivial group gives the ordinary site. Its Lean coefficient carrier uses a universe lift, rather than forcing a universe-inconsistent signature.
- Four source-record excerpts had unreadable PDF control glyphs normalized. The affineness-transfer excerpt is the actual opening of Lemma 3.3.3, not a synthesized theorem statement.
- Every new stage request has direct prerequisite edges from its consumers. Eight added request entries cover integral G-structured representatives, p-divisible quotients, enlarged perversity, nonnoetherian formal étale invariance, geometric étale tower descent, exact pro-p invariants, mod-ℓ spectral action and ordinary costalk closure.
- The relative primitive-comparison request now names the proper finite-level toroidal-to-minimal Stein-factorization maps used on CSnc p.60, removing the ambiguous smooth-map qualification. This is a requested interface, not a claim that the proposed primitive substage exists.
- Source E9 and the level-descent outline now rechoose a good generic witness prime away from the level support, using infinitely many witnesses. They do not force hyperspecial level at a fixed bad witness prime. The corresponding pre-existing gap was made precise.
- Source E11's locator is the proof of Proposition 2.1.2. E13's wording and right-adjoint correction and E14's published p.860 locator are exact. The Li–Liu edition/version records distinguish the author-copy quotations from the independently read published proof.
- Added inherited source findings E54, E57 and E77 from the confirmed CS17 errata already relevant to the local-PEL and trace-normalization uses. All coverage lists were synchronized with the new gaps/requests. The local/global split proposal's stale node counts were corrected to IG.0=29 and IG.3=26; its scope did not change.

## Baseline and supplier audit

All 17 baseline names and statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. **No baseline declaration was removed or replaced.** The packet already describes these results' restricted scope: the matrix unitary group has the standard star form, properness has finite-type hypotheses, and the Hecke ring is an abstract double-coset ring. None is claimed to provide the whole PEL, perfectoid or smooth-representation construction.

| Baseline declaration | Confirmed source |
|---|---|
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | [TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive.lean#L89) |
| `mathlib:Matrix.unitaryGroup` | [Mathlib/LinearAlgebra/UnitaryGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/UnitaryGroup.lean#L60) |
| `mathlib:NumberField.IsCMField` | [Mathlib/NumberTheory/NumberField/CMField.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CMField.lean#L71) |
| `mathlib:PerfectRing` | [Mathlib/FieldTheory/Perfect.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean#L44) |
| `mathlib:ValuationRing` | [Mathlib/RingTheory/Valuation/ValuationRing.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuationRing.lean#L64) |
| `mathlib:AlgebraicGeometry.Scheme.proetaleTopology` | [Mathlib/AlgebraicGeometry/Sites/Proetale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Proetale.lean#L66) |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | [Mathlib/AlgebraicGeometry/Sites/Etale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean#L50) |
| `mathlib:AlgebraicGeometry.IsAffine` | [Mathlib/AlgebraicGeometry/AffineScheme.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AffineScheme.lean#L59) |
| `mathlib:AlgebraicGeometry.IsProper` | [Mathlib/AlgebraicGeometry/Morphisms/Proper.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean#L42) |
| `mathlib:AlgebraicGeometry.IsFinite` | [Mathlib/AlgebraicGeometry/Morphisms/Finite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Finite.lean#L40) |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | [Mathlib/AlgebraicGeometry/Normalization.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Normalization.lean#L123) |
| `mathlib:WittVector` | [Mathlib/RingTheory/WittVector/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean#L52) |
| `mathlib:AlgebraicGeometry.IsProper.of_valuativeCriterion` | [Mathlib/AlgebraicGeometry/ValuativeCriterion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ValuativeCriterion.lean#L341) |
| `mathlib:AlgebraicGeometry.ValuativeCriterion` | [Mathlib/AlgebraicGeometry/ValuativeCriterion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ValuativeCriterion.lean#L88) |
| `tauceti:HeckeAntiInvolution.ofAmbient` | [TauCeti/NumberTheory/HeckeRing/Commutativity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Commutativity.lean#L135) |
| `tauceti:HeckeAntiInvolution.onHeckeCoset` | [TauCeti/NumberTheory/HeckeRing/Commutativity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Commutativity.lean#L165) |
| `tauceti:HeckeCosetModule.instRingHeckeRing` | [TauCeti/NumberTheory/HeckeRing/Associativity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Associativity.lean#L485) |

The inherited library audit contains no newly formalized Igusa target to remove. Witt-vector/isocrystal and ordinary scheme infrastructure are imported, not replanned. G-isocrystals, B(G), J_b and admissibility remain BunGAndNewtonStrata imports.

The following **supplier** citations, rather than baseline declarations, were removed or restricted:

- AdicÉtaleGeometry A2 finite-type/noetherian dimension interfaces were replaced in the two perfectoid-dimension nodes by the actual DiamondEtaleCohomology C8 partially-proper dimension and fibre-dimension contracts. Their statements were read; the new fibre-dimension edge is a fine-grained node, so it does not require an invented stage request.
- AdicSpacesPartII R2 formal-site invariance was removed from the three perfect-Witt/nonnoetherian applications. It applies to admissible/noetherian formal schemes. The SF.4 extension and a named gap now state the necessary scope.
- Abstract group Hochschild–Serre and ArithmeticLocallySymmetricSpaces Betti/ℓ-group descent inputs were removed from semiperversity, extraction of a constituent and level descent. SF.2 is requested for continuous geometric étale Cartan–Leray; SR.0 is requested for exact smooth pro-p invariants when p≠ℓ.
- EDC.5 and ES7 are not silently used outside their constructible and characteristic-zero domains. The new EDC.5, ES5 and BG3 requests expose the missing extensions.

## Source audit and confirmed source issues

All 17 primary PDFs were retrieved from the public URLs in `sources` and their SHA256 values verified. The 208 locator/excerpt records were checked against page-local source text and surrounding arguments. Seven records needed manual resolution of mathematical glyph order/subscripts after automated comparison: CS17 Lemmas 4.1.5–4.1.6, Proposition 4.2.11, Proposition 4.2.14, CSnc Theorem 2.7.2 and the two uses of Proposition 2.8.2. Their locators and mathematical content agree.

Public versions used:

- `csnc`: [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2).
- `cs17`: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf).
- `oz02`: [Families of p-divisible groups with constant Newton polygon](https://emis.muni.cz/journals/DMJDMV/vol-07/09.pdf).
- `ham15`: [The geometry of Newton strata in the reduction modulo p of Shimura varieties of PEL type](https://arxiv.org/pdf/1312.0490).
- `lil21`: [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf).
- `man05`: [On the cohomology of certain PEL type Shimura varieties](https://authors.library.caltech.edu/records/vk61j-8s282/files/PEL.pdf?download=1).
- `lil22`: [Chow groups and L-derivatives of automorphic motives for unitary groups, II.](https://par.nsf.gov/servlets/purl/10338691).
- `shi09`: [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf).
- `ls18a`: [Compactifications of subschemes of integral models of Shimura varieties](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/E26A33D14B2E77C4962AE761F6403A1C/S2050509418000208a.pdf/compactifications-of-subschemes-of-integral-models-of-shimura-varieties.pdf).
- `box15`: [Torsion in the coherent cohomology of Shimura varieties and Galois representations](https://arxiv.org/pdf/1507.05922).
- `nie15`: [Fundamental elements of an affine Weyl group](https://arxiv.org/pdf/1310.2229).
- `ls18b`: [Nearby cycles of automorphic étale sheaves](https://web.archive.org/web/2024id_/https://www-users.cse.umn.edu/~kwlan/articles/nearby-aut.pdf).
- `sw13`: [Moduli of p-divisible groups](https://arxiv.org/pdf/1211.6357).
- `kos21`: [On the generic part of the cohomology of local and global Shimura varieties](https://arxiv.org/pdf/2106.10602).
- `acc23`: [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999).
- `ltxzz`: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568).
- `cn23`: [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3).

Also read the [published Li–Liu proof](https://par.nsf.gov/servlets/purl/10338690) on pp.859–860, SHA256 `91035a5233facbed975283e1d81871c91d35c3f19f46151c4b6af01c937dfd01`. All source URLs, edition scopes and excerpts remain in the packet. The Annals typesetting of the noncompact Caraiani–Scholze paper was not read; its findings are scoped to arXiv v2. The unavailable Lan–Stroh erratum and unread minimal-p-divisible-group sources remain explicitly recorded gaps.

| Finding | Verdict and reason |
|---|---|
| `E1` | Confirmed: Confirmed at CSnc pp.44–45: the outer isomorphisms force unit similitude for an integral G-isogeny, whereas the proof modifies only the middle factor. A quasi-isogeny extension still needs proof; the proposed replacement is not treated as established. |
| `E2` | Confirmed: Confirmed at CSnc p.47: the inverse-limit Igusa map is integral, generally not finite; finite-level maps are finite. Affineness also requires an affine base. |
| `E3` | Confirmed: Confirmed at CSnc p.66 against the dual-Hecke formula on p.36: the contragredient is required in addition to the Tate twist. |
| `E4` | Confirmed: Confirmed as an omitted hypothesis in the invocation at CSnc pp.57–59: Lemma 4.4.2 requires properness. The closed compactified period fibre is indeed proper, so this fixes the reference without claiming an unproved counterexample for partial properness. |
| `E5` | Confirmed: Confirmed at CSnc p.38 and the public Lan–Stroh paper: the cited main theorem is Theorem 2.3.2; (2.3.3) is an equation number within it. |
| `E6` | Confirmed: Confirmed at CSnc pp.75–77: endoscopic algebraic coefficient systems need not be trivial and the Red normalization includes its twist. The fixed normalization is still an ET supplier requirement, not a claim of a proved trace comparison. |
| `E7` | Confirmed: Confirmed at Caraiani–Newton p.25: the quasi-split Koshikawa statement is Theorem 1.3, whereas Theorem 1.4 concerns Harris–Taylor type. |
| `E8` | Confirmed: Confirmed at CSnc p.32: Corollary 5.20 occurs in Lan–Stroh nearby cycles (ls18b), not the compactifications paper (ls18a). |
| `E9` | Confirmed: Confirmed as an omitted descent argument at CSnc Theorem 1.1 and pp.38–39, not as a counterexample to the theorem. Rechoosing a good auxiliary prime avoids the bad-p-level case; the geometric descent contract remains requested. |
| `E10` | Confirmed: Confirmed at CSnc p.82: the identity-coset fibre is stabilized by P_b, so its comparison map is P_b×P equivariant, not equivariant under all of J_b×P. |
| `E11` | Confirmed: Simply connected semisimple groups can have nontrivial real torsors. For F=ℚ(i), determinant-one hermitian forms with signatures (2,2) and (4,0) give distinct real special-unitary torsors despite equal determinant. The simply connected Hasse principle asserts injectivity, not that H¹ is zero. |
| `E12` | Confirmed: An elliptic family over a regular trait with ordinary generic fibre and supersingular closed fibre has a completely slope divisible geometric generic p-divisible group but cannot have a global complete slope filtration with constant slopes. Oort–Zink Proposition 2.3 explicitly assumes constant Newton polygon. |
| `E13` | Confirmed: The displayed support triangle uses i_*Ri!→id, the counit of the right adjunction. Calling Ri! a left adjoint reverses the six-functor adjunction. |
| `E14` | Confirmed: The preceding page states that the stratum has pure dimension n−1−j, and n=2r makes the rightmost expression correct. The first equality drops one. Independently confirmed in the published version, pp.859–860, as well as the author copy. |

E1–E10 were independently checked at their locators; E11–E14 were added by this review. E11 and E12 are mathematical errors in the printed assertions. E13 (right versus left adjoint) and E14 (n−1−j versus n−j) are misprints. E14 occurs in both the author copy and the version of record. Searches by title, author and lemma for a matching erratum/correction did not locate one; this is not a claim that no correction exists. Each entry has its own confirmed verdict and reviewer ID. A confirmed omission is not treated as a counterexample to the main theorem: in particular E4 and E9 admit the specified repair routes.

## Required red-team findings and reader check

| Finding | Packet and reader response |
|---|---|
| RT-AREA-langlands-1/8 | Correctly separates PEL central-leaf Igusa varieties from the Hilbert/Katz–Hida ordinary tower. The seven Hilbert consumer links are proposed for removal and rerouting to T5/the Hilbert owner. Unitary special-fibre consumers may remain; mixed-characteristic EHLS lifts are their consumers' responsibility. |
| RT-AREA-langlands-1/9 | IG.6 requests GL_r torsion determinants from the existing TC.4 and records the absent owner node as a gap. TC.5 is only a restructuring proposal, not a fictitious live dependency. |
| RT-AREA-padic-1/24 | The minimal-fibre argument requests the relative primitive comparison at P8 and proposes P8:primitive. It does not replace primitive comparison by a rational Hodge–Tate theorem. The request was clarified to the proper finite-level maps actually used. |
| RT-AREA-padic-2/3 | The same ownership repair remains a proposal with the advertised consumers and logarithmic route. No worker promotion or live-stage mutation was made. |
| RT-AREA-geomlanglands/32 | B(G), J_b, Newton/Kottwitz data and B(G,μ) are imported from BG0/BG1. Only the PEL-specific Newton map and μ⁻¹ adapter are planned here. The early algebraic/analytic split remains an orchestrator proposal. |

These five responses agree in the packet and the reader's red-team/restructuring sections. The reader now needs synchronization with the review's other corrections, including the primitive-request precision, first-kind indices, all-base Igusa moduli, constant Newton polygon, finite versus integral models, generic witness prime and new requests/gaps. It was not edited because issue #434's deliverable allowlist excludes `research/blueprint/readmes/IgusaVarietiesAndTorsionConcentration.md`.

Other scope handoffs remain sound proposals: Li–Liu applications belong to the arithmetic inner-product owner; compact LTXZZ results belong to the compact-unitary Part II; BCGP's higher-Hida result belongs to the abelian-surfaces owner. The IG.4/LPV.6 stage cycle still needs the proposed formal-model sublayer repair, and IG.4/IG.5→IG.6 edges still need an orchestrator action. This review does not assert that the whole atlas dependency graph is acyclic.

## API, tests, planets and checks

Every one of the 40 definition/construction nodes retains at least three unit tests. The API still has 218 items; each name resolves to a declaration in the suggested file. All 138 packet tests have corresponding named test comments and Lean examples; the file has 139 `example` declarations including an additional existing example. Mathematical test changes are recorded above, and the EO negative example is explicitly unverified. No condition was disguised as a `Prop`-valued placeholder or a `def _ : Prop := sorry`.

The 34 planet names describe key definitions, central constructions or named theorems; none is a warning, source locator or bookkeeping item. Each stage has at most six. No planet was added or renamed.

Validation on the final packet and file:

- `python3 scripts/check_blueprint.py research/blueprint/packets/IgusaVarietiesAndTorsionConcentration.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/IgusaVarietiesAndTorsionConcentration.lean`: **exit 0; 1,229 warnings, all declaration-uses-sorry**. The shared build has exactly the pinned Mathlib commit. The suggested file imports Mathlib modules only; Tau Ceti baseline declarations were separately read at the pinned Tau Ceti commit. This is elaboration of a prototype, not proof or implementation.
- A namespace-aware name/test audit found all 218 API names and all 138 packet test markers. All 17 source PDF hashes match the packet; the 14 source-issue records and six version records also pass `check_errata.py` in an errata-format projection.
- `research/blueprint/intake.py check-files` on the four deliverables: **0 problems**. `git diff --check`: **passed**.

The original suggested file also elaborated; successful elaboration did not detect the mathematical errors repaired here. No library build, update, cache download or language server was started.

## Questions and next actions for the orchestrator

1. Route a revision of the six named unverifiable contracts to the plan's author, with an independent review afterward. The next pass should validate their changed statements and consumers, rather than simply deleting `unverifiable` labels.
2. Authorize reader synchronization as a revision deliverable. The corrected packet and this ledger provide the exact changes; the unchanged reader must not override them.
3. Resolve the proposed TC.5 and P8:primitive ownership, the early algebraic BG split, the Hilbert link rerouting and the IG.4/LPV cycle before claiming the corresponding suppliers live. Apply the internal IG.4/IG.5→IG.6 links through the orchestrator.
4. Dispatch the eight precise new supplier requests to their owners. Requested EDC/SF/ES/BG extensions must provide their coefficient, finiteness and continuity hypotheses explicitly.
5. Keep source E11–E14 scoped to the versions actually checked. The Li–Liu misprint is independently confirmed in the version of record; the noncompact CS findings are not claimed to have been checked in its published typesetting.
