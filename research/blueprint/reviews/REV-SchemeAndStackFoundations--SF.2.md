# Independent review of SchemeAndStackFoundations SF.2

Review complete; verdict: **needs_changes**. Reviewer: Codex, session `codex-Q0bMav`, issue [#6284](https://github.com/CBirkbeck/tauceti-explorer/issues/6284), 2026-10-09. The input was the planning work by Claude Code, session `cc-2f3ba9`, submitted in [PR #7973](https://github.com/CBirkbeck/tauceti-explorer/pull/7973). This reviewer did not author that work.

The packet contains sound mathematics after the corrections below, but two nodes still lack a verified general gerbe-classification justification. The suggested file also lacks many required declarations and examples. These are substantive reasons for the verdict. Partial stage coverage and honestly listed future targets would not, by themselves, prevent acceptance. This submission finishes the independent review; it is not a checkpoint of unfinished review work.

## Counts and scope

- 85 nodes checked: 52 verified, 31 corrected, 2 unverifiable. The per-node verdict, locator and qualification are in the packet's `review.checked` array.
- 7 definitions, 17 constructions, 49 theorems, 5 lemmas and 7 comparisons; no nodes added or removed.
- 83 baseline references confirmed; none removed. Five `provides` descriptions were narrowed to their actual statements and conventions.
- 160 mathematical API items and 87 tests for definitions/constructions. A further test on the projective-space theorem brings the total packet test count to 88.
- 11 explicit gaps and 10 supplier requests. The unavailable-original-source gap for smooth group comparison was resolved; seven new gaps were recorded. One request for Jacobian n-torsion was added and the Jacobian-construction request was separated from it.
- Three planets in this packet, plus the three existing SF.2 key-definition planets, respect the six-per-layer limit. Their names identify Hilbert's theorem 90, the Bhatt–Scholze comparison and the Nisnevich topology. Proposed sublayers remain proposals for the maintainer.

Both packet status and SF.2 coverage now say `partial`. The remaining list distinguishes unplanned routed targets from later lemma refinement. In particular field/fppf vanishing from Česnavičius Appendix A, punctured and completion descent, equivariant derived limits/Borel constructions, torus cohomology and torsor units, the nonclosed-field dimension bound, Dedekind G_m inputs, and compact support over limits are genuine targets requiring plans. They are not already proved by the 85-node pass.

The job's three deliverables were reviewed. The reader document was read for consistency but is not an authorized edit path for this issue; its corrections are requested in the handoff. No atlas promotion, external roadmap edit or ownership change was performed.

## Corrections in place

The following records include changes to mathematical statements, proof outlines, API/tests, citations or suggested signatures. All source results are stated in the reviewer's own words.

| Node suffix | Correction |
| --- | --- |
| `site-cohomology-pullback` | Distinguished H from H' and supplied the free-source/constant-Z comparison missing from the suggested exact-functor signature. For abelian sheaves the inverse image is exact; the ringed-module statement 21.14.1 requires flatness. |
| `site-derived-pushforward` | Corrected the baseline use: rightDerived i is an abelian-category functor, not Rf_* on D^+. Recorded the total-derivation closure input. |
| `gerbe-h2-class` | UNVERIFIABLE general classification: corrected the source match and cover-lifting proof. Tag 0CJZ has cofinal-cover H^1-vanishing hypotheses absent from the claimed general theorem; a precise gap remains. |
| `projective-space-cohomology` | Separated n=0 from n≥1 using the disjoint q,d cases of 30.8.1–30.8.2; added the negative twist on P^0 test. |
| `sheaf-cohomology-with-supports` | Restricted the comparison with Mathlib Ext-colimit localCohomology to Noetherian A; the unbounded support functors themselves retain the ringed-space generality of 20.34. |
| `supports-localization-triangle` | Specified the Noetherian hypothesis for the affine sequence expressed in the pinned localCohomology convention; ringed-space localization/excision remain unrestricted. |
| `local-cohomology-module-comparison` | Added the affine D(A)–D_QCoh equivalence actually used by 51.2.1. The Noetherian Ext-colimit comparison is 47.10.1–47.10.2; finite generation alone is not that comparison. |
| `cousin-complex` | Replaced the false affine-stratum concentration assertion by the actual comparison (3.9.8), pp.63–64. Added a skyscraper-module counterexample. |
| `big-site-quasi-coherent-sheaf` | Corrected exactness to right exactness, with exactness on flat objects; added the ×2/Spec F_2 counterexample. Tags 03DT and 03OF prove the sheaf property, not big-site exactness. |
| `quasi-coherent-topology-comparison` | Removed the circular affine-acyclicity argument: use local effacement and induction with Amitsur exactness (59.22.3–59.22.4), then Leray. The Nisnevich argument uses the same affine descent. |
| `artin-schreier-sequence` | Confirmed 59.63.1–59.63.6 and added the spectral source; recorded the missing key Frobenius/top-coherent inputs and non-Noetherian vanishing as explicit gaps. |
| `etale-galois-comparison` | Pinned continuousCohomology has TopRep k G coefficients and TopModuleCat k output; specified k=Z and the discrete-module dictionary/derived-invariants comparison. ProfiniteCohomology 9–10 supply the intended bridge, not the bare baseline declaration. |
| `etale-cohomology-limits` | Restricted the separate torsor-spreading assertion to finitely presented group/torsor/action data; kept 59.51.3 for compatible systems of arbitrary abelian sheaves. |
| `curve-multiplicative-cohomology` | Made the integral curve convention explicit for the single-generic-point proof of 59.68.5. |
| `curve-roots-of-unity-cohomology` | Replaced the incorrect unit-rank proof by the divisor-pair exact sequence 59.69.3. Added the missing Jacobian torsion supplier, distinct from construction of the Jacobian in D. |
| `proetale-classical-comparison` | Matched Corollary 5.1.5 exactly: locally free finite-rank R-modules, rather than all locally constant finite-type R-modules; retained the bounded-below comparison of 5.1.6 and 5.2.6. |
| `proetale-lisse-sheaves` | Corrected the hypotheses and numbered parts of 6.8.4: finite E for (1), qcqs X for (3), étale-local lattices in (6); topological Noetherianness belongs to 6.8.5. |
| `nisnevich-points-henselization` | Corrected the conservative family on the big site to all pairs (Y,y), with Y an object of that site, as on MV p.99. |
| `nisnevich-cohomological-dimension` | Restricted the cited big-site version to Sm/S and made i>dim S explicit at the induction conclusion of MV 1.8; arbitrary full Sch/S needs a separate extension argument. |
| `brown-gersten-vanishing` | Corrected the scope to simplicial sheaves on a B.G. class and made the empty-object condition explicit for presheaves. Recorded the general spectra/qcqs consumer theorem as a remaining contract. |
| `upper-shriek-compactification-independence` | Removed the false a_j=j^* step; independence uses proper right-adjoint open base change and 48.16.2. Nagata/common-refinement registration gaps remain. |
| `upper-shriek-smooth` | Corrected the determinant sign in the smooth-embedding argument: determinant of the normal bundle, inverse determinant of the conormal bundle (48.29.2). |
| `lci-upper-shriek` | Removed the proof-level cycle with upper-shriek-smooth; use the local Koszul/polynomial computation of 48.17.11 before the global smooth formula. |
| `quasi-coherent-algebra-descent` | Restricted affine Isom representability to finite locally free modules; impose algebra equations inside Isom, not Hom. Corrected the torsor group to Aut_alg(A), a PGL_d inner form. |
| `azumaya-trivialization-gerbe` | UNVERIFIABLE general H^2 gerbe-class bridge: the Azumaya construction in GB I is appropriate, but its reduction to the arbitrary-site gerbe node inherits the unresolved classification gap. Removed the unstructured Type argument from the Lean prototype. |
| `brauer-kummer-sequence` | Added qcqs X for the cohomology/filtered-colimit step; kept the fixed-n fppf sequence on every scheme. |
| `equivariant-coinduction` | Pinned the unit to an equivariant module G, with semilinear translation maps. Induction is exact; coinduction preserves injectives by adjunction and is not assumed exact for infinite products of sheaves. |
| `smooth-group-fppf-etale-comparison` | Read the original public GB III scan: 11.7(1), pp.180–181 and 11.8(3), p.182 provide the all-degree smooth commutative comparison and nonabelian H^1 case. Removed the original-source availability gap. |
| `nisnevich-sheaf-criterion` | Removed the vacuous Lean prototype assuming every Scheme is Noetherian; the genuine criterion must use a small site or finite-type S-schemes for a fixed Noetherian finite-dimensional S. The mathematical packet statement remains correct. |
| `derived-quasi-coherent-category` | Corrected the affine-equivalence prototype domain from ModuleCat A to DerivedCategory (ModuleCat A), reusing the pinned carrier. The actual full subcategory, triangulated structure and tests remain a recorded gap. |
| `derived-tensor-internal-hom` | Corrected the internal RHom prototype to D(O_X), rather than asserting arbitrary RHom preserves D_QCoh; recorded the K-flat/K-injective and restricted preservation inputs. |
| `pushforward-right-adjoint` | Added qcqs hypotheses on both source and target to the Lean right-adjoint/adjunction/trace signatures, matching 48.3.1. The previous signature only assumed the morphism qcqs. |
| `relative-dualizing-module` | Removed the Lean module prototype lacking the Cohen–Macaulay and pure relative dimension hypotheses; completion must define H^(−d)(f^!O_Y) in the stated Noetherian finite-type setting. |

Additional reconciliation: the curve G_m signature now requires an integral quasi-compact separated smooth curve. The right-adjoint identity example has the same qcqs assumptions as its constructor. The general spectrum-descent ownership proposal now states its additional descent input and empty-scheme condition, instead of claiming a deduction from the finite-dimensional simplicial result. Source metadata distinguishes the planning pass's wider CPC reading from the three supplier documents independently rechecked here. JSON formatting retains the input's indentation.

No smaller proof-step nodes were introduced: this is a target-level review. Where a non-routine target-level input has no node or adequate supplier, it is a named gap, not an implicit routine argument.

## Baseline and reuse

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration's source statement was independently read at those commits. The shared elaboration build has the exact Mathlib pin; its imported Tau Ceti files were checked against the recorded Tau Ceti pin.

The five corrected uses are:

| Reference | What it supplies |
| --- | --- |
| `CategoryTheory.Functor.rightDerived` | Degreewise RⁿF between abelian categories with enough injectives. A total functor on D⁺ and its comparison require additional construction. |
| `CategoryTheory.Sheaf.H` | Ext from the constant abelian sheaf ULift Z. Objectwise cohomology uses H′ or the slice-site construction. |
| `CategoryTheory.Sheaf.H.equiv₀` | Evaluation after specifying a terminal object and its terminality proof. |
| `continuousCohomology` | Cohomology of the continuous cochain complex on TopRep coefficients, valued in TopModuleCat. The integer/discrete-coefficient dictionary and derived-invariants comparison are required for the field interface. |
| `localCohomology` | The module-valued Ext colimit over powers of an ideal. The identification with derived support cohomology is a further theorem, used here under Noetherian hypotheses. |

These citations are retained for precisely these uses; their target extensions are planned or recorded as gaps. The Lean quasi-coherent cohomology abbreviation now directly imports and reuses Tau Ceti's `Scheme.Modules.Cohomology`.

The reviewed library audit was checked against this division. Generic derived categories, scheme modules, quasi-coherent sheaves, sites already present, sheaf Ext/cohomology, field Brauer/Azumaya carriers and categorical Mayer–Vietoris squares are reused. Semilinear equivariance on a moving scheme is not the fixed-base `Action` category. Perfect/Koszul carriers, total sheaf-derived functors, spectral-sequence data and their interfaces need explicit ownership; an opaque D_QCoh carrier does not provide them.

For reproducibility, the full 83-reference confirmation list follows. The packet records the module and source line of every entry; this list does not reproduce Lean source text.

- [mathlib:Action](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Action/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Etale](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Etale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsAffine](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/AffineScheme.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsFinite](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Finite.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsIntegralHom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Integral.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsLocallyNoetherian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Noetherian.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsNoetherian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Noetherian.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsOpenImmersion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/OpenImmersion.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsProper](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.IsSeparated](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Separated.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Proj.toSpecZero](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.QuasiCompact](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.QuasiSeparated](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/QuasiSeparated.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.Etale](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Etale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.Hom.residueFieldMap](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ResidueField.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.Modules](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.Modules.pullback](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.Modules.pushforward](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Sheaf.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.ProEt.topology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Proetale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.etalePrecoverage](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.etaleTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.etaleTopology_le_proetaleTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Proetale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.fppfTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Fpqc.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.fpqcTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Fpqc.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.pointSmallEtale](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.residueField](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ResidueField.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Scheme.zariskiTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/BigZariski.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.Smooth](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.SmoothOfRelativeDimension](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.WeaklyEtale](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/WeaklyEtale.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:AlgebraicGeometry.tilde](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Modules/Tilde.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:BrauerGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/BrauerGroup/Defs.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Abelian.Ext](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Abelian.Ext.covariant_sequence_exact₁](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Ext/ExactSequences.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Functor.IsContinuous](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Continuous.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Functor.rightDerived](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/RightDerived.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Functor.sheafPullback](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Pullback.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Functor.sheafPushforwardContinuous](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Continuous.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/MayerVietorisSquare.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare.SheafCondition](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/MayerVietorisSquare.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare.sequence_exact](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/MayerVietoris.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.GrothendieckTopology.MayerVietorisSquare.sheafCondition_of_sheaf](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/MayerVietorisSquare.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.GrothendieckTopology.Point](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Point/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.GrothendieckTopology.over](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Over.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.IsGrothendieckAbelian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Precoverage.toGrothendieck](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/PrecoverageToGrothendieck.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Sheaf.H](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Sheaf.H.equiv₀](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Sheaf.cohomologyPresheaf](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.SimplicialObject.Augmented](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.Square](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Square.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.cechComplexFunctor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CategoryTheory.sheafHom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafHom.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:CommRing.Pic](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:DerivedCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:Field.absoluteGaloisGroup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/AbsoluteGaloisGroup.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:HenselianLocalRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:HenselianRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:IsAzumaya](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Azumaya/Defs.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:IsSepClosed](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsSepClosed.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:Matrix](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Defs.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:MvPolynomial](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:PadicInt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:SheafOfModules.IsQuasicoherent](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:TopCat.Sheaf.IsFlasque](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Sheaves/Flasque.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:Units](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Units/Defs.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:continuousCohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:groupCohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:localCohomology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/LocalCohomology.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:rootsOfUnity](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:skyscraperSheaf](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Sheaves/Skyscraper.lean) — confirmed; use qualified as recorded in the packet.
- [mathlib:topologicalKrullDim](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/KrullDimension.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/CentralSimple/FiniteSeparable.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.AlgebraicGeometry.LineBundleClass](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/LineBundle/Class.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/Cohomology/Basic.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.BrauerGroup.instCommGroup](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/Group.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.CategoryTheory.freeYonedaSheafFunctor](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Sites/SheafCohomology/FreeYoneda.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.IsSimpleRing.exists_algEquiv_matrix_of_isSepClosed](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/CentralSimple/SeparablyClosed.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.Topology.isFlasque_skyscraperSheaf](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Sheaves/Flasque.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.Topology.subsingleton_H'_succ_of_isFlasque](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Sheaves/Flasque.lean) — confirmed; use qualified as recorded in the packet.
- [tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Sheaves/Flasque.lean) — confirmed; use qualified as recorded in the packet.

## Sources and source issue

The node-level locators were checked against public Stacks pages and public paper scans. The bibliography retains version hashes for downloaded scans. The important locator corrections and hypothesis checks include:

- [Stacks 21.14](https://stacks.math.columbia.edu/tag/072X), Lemmas 21.14.1 and 21.14.5–7, with [21.7](https://stacks.math.columbia.edu/tag/01FU), Lemmas 21.7.1–4: distinguish module-flatness, exact abelian inverse image and slice cohomology.
- [Stacks 30.8](https://stacks.math.columbia.edu/tag/01XS), Lemmas 30.8.1–2: handle projective dimension zero separately.
- [Stacks 47.10](https://stacks.math.columbia.edu/tag/0BJD), Lemmas 47.10.1–2; [51.2](https://stacks.math.columbia.edu/tag/0DWQ), Lemma 51.2.1; [SGA 2](https://arxiv.org/abs/math/0511279), Exposé II, Theorem 6 and Lemma 8, pp.17–19, and Exposé III, Proposition 3.3, pp.27–28: preserve the Noetherian hypotheses in the Ext-colimit comparison and depth application.
- [BCGP v3](https://arxiv.org/abs/1812.09269v3), §3.9.5, equation (3.9.8), pp.63–64, Theorem 3.9.6 and Remark 3.9.7, p.64, Example 3.9.9, pp.64–65: affine strata give a pushforward comparison; resolution and acyclicity have their additional Cohen–Macaulay/codimension hypotheses.
- [Stacks 59.22](https://stacks.math.columbia.edu/tag/03OY), Lemmas 59.22.3–4: the topology-comparison proof uses local effacement and induction, avoiding circular use of affine acyclicity. [59.63](https://stacks.math.columbia.edu/tag/0A3J), Lemmas 59.63.2–6, also requires the spectral bound [20.22.4](https://stacks.math.columbia.edu/tag/0A3G).
- [Grothendieck, Brauer III public scan](https://webusers.imj-prg.fr/~leila.schneps/grothendieckcircle/Alltenlectures.pdf), Appendix §11, Theorem 11.7(1), printed pp.180–181, with conditions (L),(R) and smooth representable specialization; Remark 11.8(3), p.182: these supply the all-degree commutative smooth comparison and the nonabelian H¹ comparison. The public original-source gap is resolved.
- [Grothendieck, Brauer I](https://www.numdam.org/item/SB_1964-1966__9__199_0/), §5, Theorem 5.1, pp.210–211, Corollary 5.11, p.213, and §6, Theorem 6.1, p.214: Azumaya/PGL and henselian classification. [Brauer II](https://www.numdam.org/item/SB_1964-1966__9__287_0/), §1, Proposition 1.4, Lemma 1.9 and Corollaries 1.8/1.10, pp.291–293: torsion and generic injectivity, checked also against [Česnavičius v4](https://arxiv.org/abs/1711.06456v4), Lemma 3.2, p.6. Its Appendix A, pp.15–16, supplies the explicitly unplanned field targets.
- [Milne, Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §6, Definition 6.1 and Proposition 6.4, pp.42–43; §10, Example 10.1, p.70; §11, Theorem 11.4 and Remark 11.7, pp.78–80; §14, Theorem 14.9, p.96 and the curve application p.99: cochains, torsors and Hochschild–Serre. The affine roots-of-unity proof instead uses the divisor-pair sequence in [Stacks 59.69.3](https://stacks.math.columbia.edu/tag/03RN).
- [Bhatt–Scholze v2](https://arxiv.org/abs/1309.1198v2), §2.4, pp.13–14; §3.1–3.3, pp.16–19; §4.2, pp.28–30; §5.1–5.4, pp.34–39; §6.8, pp.58–60: preserve finite-free rank in Corollary 5.1.5, the classical essential image of Proposition 5.2.6, and the numbered finite-E/qcqs/lattice hypotheses of Proposition 6.8.4.
- [Morel–Voevodsky](https://www.numdam.org/item/PMIHES_1999__90__45_0/), §3.1, pp.95–102: all-object henselian points, the smooth-site finite-dimensional bound of Proposition 1.8, B.G. classes in Definition 1.12, and the simplicial criterion in Proposition 1.16/Lemma 1.18. The general spectrum/qcqs conclusion requires a further theorem.
- [Stacks 48.16](https://stacks.math.columbia.edu/tag/0A9Y), Lemma 48.16.2; [48.17](https://stacks.math.columbia.edu/tag/0ATZ), Lemma 48.17.11; [48.29](https://stacks.math.columbia.edu/tag/0E9X), Lemma 48.29.2: compactification independence, local lci computation and the normal-determinant sign.
- [Kings–Sprang v4](https://arxiv.org/abs/1912.03657v4), Appendix A.1–A.2, pp.79–81, Definitions A.1–A.3 and (A.1.1), together with [Tôhoku](https://www.jstage.jst.go.jp/article/tmj1949/9/3/9_3_185/_pdf), V §5.1, Proposition 5.1.1, p.196 and §5.2, Theorem 5.2.1, pp.200–201: semilinear modules, coinduction and equivariant spectral sequences. The Tôhoku scan's relevant pages were inspected visually because text extraction was unreliable.
- [Harpaz–Wittenberg v2](https://arxiv.org/abs/1904.06512v2), §3, (3.1) and Remark 3.1, pp.8–9: preserve the hypotheses behind the Brauer/Hochschild–Serre edge sequence.

Kedlaya–Liu and Boxer–Pilloni are cited through accepted extractions; their original papers were not independently re-read. The actual statements used here were checked against Bhatt–Scholze Proposition 6.8.4 and Stacks Definition 36.22.2/Lemma 36.22.5 respectively. No restricted book file or passage was copied into the repository.

The general A-banded gerbe node is **unverifiable from its cited input**. [Stacks 21.11.1](https://stacks.math.columbia.edu/tag/0CJZ) gives an existence criterion with cofinal-cover H¹-vanishing hypotheses; it is not the general gerbe/derived-H² classification claimed. Local objects need not have globally chosen isomorphisms on all original overlaps, and a Q-valued cocycle need not lift to B on that same cover. A general theorem or a complete hypercover/torsor proof must supply neutrality, functoriality and central-extension exactness. The Azumaya trivialization-gerbe node inherits that gap. This finding does not assert that the intended general theorems are false.

Source issue `E-SF2-1` is confirmed **as a proof gap**: [85.36.3–4](https://stacks.math.columbia.edu/tag/0DHI) use [84.8.2](https://stacks.math.columbia.edu/tag/0DGU), whose comparison requires torsion cohomology sheaves. The unrestricted conclusion in the displayed proof does not follow from that input. This review supplies no counterexample or proof of falsity. SF.2 correctly retains the torsion form in [59.102.6–7](https://stacks.math.columbia.edu/tag/0DDV). The packet's source-issue entry now has the required independent confirmed verdict and reason.

## Suppliers, closure and ownership

The nearby JacobianChallenge and StableReduction roadmaps were read, alongside the supplying portions of ModularCurves, ProfiniteCohomology and QuadraticFormInvariants. Requests remain with their existing owners; extensions of their contracts need maintainer confirmation.

| Supplier | Review result |
| --- | --- |
| JacobianChallenge A | Line-bundle/Picard group API supplies the intended Hilbert-90 interface; reuse Tau Ceti's existing line-bundle classes. |
| JacobianChallenge B/C | Current coherent-over-k and proper-flat wording does not supply arbitrary affine QCoh acyclicity or arbitrary qcqs flat base change. These exact extensions are requested and recorded as a gap, with Stacks 30.2.2 and 30.5.2 as the desired contracts. |
| JacobianChallenge D/E | D constructs the Jacobian/Pic⁰ comparison; E supplies n-torsion of abelian varieties. The rank 2g torsion formula cannot be attributed to the construction alone. |
| StableReduction 2 | Read proper coherent pushforward and relative curve duality. SF.2 owns the general scheme duality extension and proves agreement with the curve case; it does not re-plan the curve package. |
| ModularCurves 0E / SF.1 | Effective faithfully flat descent is imported. Finite locally free Isom representability is restricted correctly; arbitrary QCoh module descent belongs to its existing foundations owner. |
| ProfiniteCohomology 9–10 | Supplies the discrete coefficient dictionary, Galois interface and derived-invariants comparison in all degrees. The baseline continuous-cochain abbreviation alone is insufficient. |
| QuadraticFormInvariants 7 | Crossed products and the field Brauer/H² comparison remain imported, not rebuilt. |
| CPC head 4bd7237 | Independently read CompactSupport 1–2, EtaleBaseChange 5 and ConstructibleEtale 5–6. Their exact statements support Nagata/refinements, torsion proper base change and invertible Kummer, but the layers are not registered atlas stages. Keep these explicit gaps until registration; proper base change here does not require prime-to-characteristic torsion. |

The CPC sources are [CompactSupport](https://github.com/CBirkbeck/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/README.md), [EtaleBaseChange](https://github.com/CBirkbeck/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/README.md), and [ConstructibleEtale](https://github.com/CBirkbeck/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md).

All eleven closure gaps have concrete consumers in the packet: three CPC registration gaps; non-Noetherian qcqs constructible approximation; total derived functors/spectral sequences; general gerbe classification; Artin–Schreier spectral/Frobenius/top-coherent inputs; the qcqs spectrum-descent consumer theorem; JacobianChallenge B/C contract extensions; unbounded derived/perfect/Koszul/Brown-representability interfaces; and missing suggested signatures/examples. The gap list is not a claim that those facts are formalised or supplied by a placeholder type.

The confirmed red-team findings were checked individually:

- **RT-AREA-algebraicgeometry/18:** SF.2 is the single proposed scheme-coherent-duality owner beyond curves. The four paper routes, classical part of AnalyticStacks AS.1, A0-extension link and surface applications should import it. Those re-pointings await the orchestrator.
- **RT-AREA-etale/2:** no absolute/Brauer purity theorem is planned here. Absolute purity belongs to EtaleDualityAbsolutePurityPartII; Brauer purity to PurityForFlatCohomology; étale supports to EDC.0. SF.2 supplies the early prefix. Coherent/Zariski supports must not be substituted for étale supports.
- **RT-AREA-ktheory-2/38:** the Nisnevich site and distinguished squares have one proposed owner, SF.2. S.4 owns the additional spectrum-valued qcqs descent criterion. Its empty-scheme condition and general descent theorem are explicit, so this consumer need is not reported closed by a finite-dimensional simplicial result.

## Suggested Lean file and test inventory

The revised file **elaborates at the pinned Mathlib baseline**, exit code 0, with **94 warnings, all declarations using `sorry`**, and no other diagnostics. The original file also elaborated (102 `sorry` warnings); elaboration alone did not detect its missing mathematical assumptions or comment-only APIs. The final check used `lean-check` after the memory check, without a language server or any library build/update/cache command.

Changes include the constant-source comparison for cohomological pullback; the direct reuse of Tau Ceti's cohomology carrier; actual DerivedCategory as the affine-equivalence domain; D(O_X) as general internal RHom codomain; qcqs hypotheses on the pushforward right adjoint; closed/decreasing Cousin filtration arguments; and removal of signatures that lacked indispensable extension, Azumaya, Cohen–Macaulay, boundedness or restricted-site data. The old all-schemes-Noetherian criterion was vacuous, so it was removed rather than retained as a successfully elaborating theorem. The obsolete comment-only packet index was also removed.

The file contains 83 named `def`/`abbrev`/`theorem`/`structure` declarations, excluding instances, and 17 real `example`s. Of 160 packet API names, 57 have a declaration under that exact name and 103 do not. Of 88 packet tests, 17 have marker-associated examples and 71 do not. An alternative name or a functor-only prototype does not count as the required full API statement. Several opaque Type carriers are honestly identified as incomplete; they lack the defining fields and do not constitute adequate definition tests.

The table exhaustively covers the 24 definition/construction nodes, plus the added projective-space theorem test. Counts refer to actual uncommented declarations and examples, not occurrences of names in prose.

| Node suffix | Exact API names present / planned | Examples present / planned |
| --- | ---: | ---: |
| `site-cohomology-pullback` | 3/6 | 1/3 |
| `site-derived-pushforward` | 2/6 | 1/3 |
| `nonabelian-torsor-h1` | 2/8 | 0/4 |
| `gerbe-h2-class` | 0/6 | 0/4 |
| `godement-resolution` | 2/6 | 0/3 |
| `projective-space-cohomology` | 0/0 | 0/1 |
| `sheaf-cohomology-with-supports` | 2/9 | 2/4 |
| `cousin-complex` | 1/6 | 0/4 |
| `big-site-quasi-coherent-sheaf` | 1/8 | 0/5 |
| `multiplicative-additive-group-sheaves` | 5/7 | 2/3 |
| `topology-comparison-morphisms` | 3/7 | 0/3 |
| `proetale-etale-morphism` | 1/6 | 0/3 |
| `replete-topos` | 2/5 | 3/3 |
| `nisnevich-covering` | 6/7 | 3/4 |
| `nisnevich-topology` | 6/7 | 3/4 |
| `elementary-distinguished-square` | 4/5 | 1/3 |
| `derived-quasi-coherent-category` | 1/6 | 0/3 |
| `derived-tensor-internal-hom` | 2/7 | 0/4 |
| `derived-pullback-pushforward-qcoh` | 3/8 | 0/4 |
| `pushforward-right-adjoint` | 3/7 | 1/3 |
| `relative-dualizing-complex` | 1/6 | 0/4 |
| `relative-dualizing-module` | 0/6 | 0/4 |
| `azumaya-trivialization-gerbe` | 0/7 | 0/4 |
| `equivariant-module-category` | 3/7 | 0/4 |
| `equivariant-coinduction` | 4/7 | 0/4 |

The following missing-item lists use suffixes within each node's packet namespace. They are a concrete worklist, not elaborated declarations. Every test still requires its stated coefficient object/site, and every API must retain its mathematical hypotheses.

- **site-cohomology-pullback**. Missing API: `Sheaf.H.pullback_zero`, `Sheaf.H.pullback_comp`, `Sheaf.H.pullback_δ`. Missing examples: `Sheaf.H.test_pullback_zero_restriction`, `Sheaf.H.test_pullback_not_iso`.
- **site-derived-pushforward**. Missing API: `Sheaf.derivedPushforward`, `Sheaf.higherDirectImage_iso_sheafify`, `Sheaf.higherDirectImage_δ`, `Sheaf.derivedPushforward_comp`. Missing examples: `Sheaf.test_higherDirectImage_zero_eq`, `Sheaf.test_higherDirectImage_sepClosed_base`.
- **nonabelian-torsor-h1**. Missing API: `NonabelianH1.mk`, `NonabelianH1.mk_eq_one_iff`, `NonabelianH1.pullback`, `NonabelianH1.connecting`, `NonabelianH1.exact_sequence`, `NonabelianH1.equivSheafH`. Missing examples: `NonabelianH1.test_trivial_group`, `NonabelianH1.test_abelian_agrees`, `NonabelianH1.test_gl_n_local`, `NonabelianH1.test_not_group`.
- **gerbe-h2-class**. Missing API: `CentralExtension.boundary`, `CentralExtension.boundary_one`, `CentralExtension.exact_boundary`, `CentralExtension.boundary_pullback`, `CentralExtension.boundary_cech`, `Gerbe.class`. Missing examples: `CentralExtension.test_split`, `CentralExtension.test_matrix_algebra`, `CentralExtension.test_abelian_connecting`, `CentralExtension.test_quaternion_real`.
- **godement-resolution**. Missing API: `godementResolution_quasiIso`, `godementResolution_exact`, `godementResolution_restrict`, `sheafH_iso_godement`. Missing examples: `test_godement_point`, `test_godement_skyscraper`, `test_godement_not_injective`.
- **projective-space-cohomology**. Missing API: none. Missing examples: `test_projective_zero_negative_twist`.
- **sheaf-cohomology-with-supports**. Missing API: `supportedSubsheaf`, `localCohomologySheaf`, `cohomologyWithSupport_zero`, `cohomologyWithSupport_univ`, `rHZ_adjunction`, `localToGlobal`, `cohomologyWithSupport_pullback`. Missing examples: `test_support_affine_line_origin`, `test_support_not_restriction`.
- **cousin-complex**. Missing API: `relativeSupportCohomology`, `cousinComplex_d_comp_d`, `cousinComplex_isQuasicoherent`, `relativeSupportCohomology_iso_pushforward`, `cousinComplex_trivial`. Missing examples: `test_cousin_trivial_filtration`, `test_cousin_dvr`, `test_cousin_not_resolution`, `test_cousin_affine_stratum_not_concentrated`.
- **big-site-quasi-coherent-sheaf**. Missing API: `bigSheaf_obj`, `bigSheaf_isSheaf`, `bigSheaf_rightExact`, `bigSheaf_pullback`, `bigSheaf_structureSheaf`, `bigSheaf_fullyFaithful`, `bigSheaf_exact_on_flat`. Missing examples: `test_bigSheaf_zero`, `test_bigSheaf_spec_field`, `test_bigSheaf_zariski_restriction`, `test_bigSheaf_not_topological_pullback`, `test_bigSheaf_nonflat_monomorphism`.
- **multiplicative-additive-group-sheaves**. Missing API: `Gm_restrict_small`, `mu_eq_cpc`. Missing examples: `test_mu_p_not_etale_trivial`.
- **topology-comparison-morphisms**. Missing API: `aX`, `comparison_comp`, `comparison_baseChange`, `aX_inverseImage_obj`. Missing examples: `test_comparison_id`, `test_aX_constant`, `test_zariski_not_etale`.
- **proetale-etale-morphism**. Missing API: `nu_inverseImage_obj_affine`, `nu_directImage_obj`, `nu_unit_iso`, `nu_naturality`, `nu_pushforward_comm`. Missing examples: `test_nu_point`, `test_nu_constant_profinite`, `test_nu_not_essentially_surjective`.
- **replete-topos**. Missing API: `isReplete_of_locallyWeaklyContractible`, `IsReplete.lim_epi`, `IsReplete.derivedCategory_leftComplete`. Missing examples: none.
- **nisnevich-covering**. Missing API: `isNisnevichCovering_iff_henselization`. Missing examples: `test_covering_quadratic_split`.
- **nisnevich-topology**. Missing API: `smallNisnevich_comparison`. Missing examples: `test_nisnevich_field_global_sections`.
- **elementary-distinguished-square**. Missing API: `ElementaryDistinguishedSquare.isPullback`. Missing examples: `test_eds_affine_line`, `test_eds_not_distinguished`.
- **derived-quasi-coherent-category**. Missing API: `DQCoh.mem_iff`, `DQCoh.isTriangulated`, `DQCoh.hasCoproducts`, `DQCoh.affineEquiv`, `DCoh`. Missing examples: `test_DQCoh_structure_sheaf`, `test_DQCoh_affine_free`, `test_DQCoh_extension_by_zero_not_qc`.
- **derived-tensor-internal-hom**. Missing API: `derivedTensor_derivedHom_adj`, `derivedTensor_unit`, `derivedTensor_mem_DQCoh`, `derivedHom_mem_DQCoh`, `perfect_dual`. Missing examples: `test_derivedTensor_unit`, `test_derivedTensor_affine_tor`, `test_derivedHom_affine_ext`, `test_underived_tensor_differs`.
- **derived-pullback-pushforward-qcoh**. Missing API: `totalDirectImage_mem_DQCoh`, `totalDirectImage_coproduct`, `projectionFormula`, `totalDirectImage_comp`, `cohomology_totalDirectImage`. Missing examples: `test_pullback_identity`, `test_pushforward_projective_line`, `test_pullback_affine_tensor`, `test_underived_pullback_not_exact`.
- **pushforward-right-adjoint**. Missing API: `pushforwardRightAdjoint_comp`, `pushforwardRightAdjoint_boundedBelow`, `globalDuality`, `pushforwardRightAdjoint_affine_finite`. Missing examples: `test_rightAdjoint_closed_point`, `test_rightAdjoint_not_upperShriek`.
- **relative-dualizing-complex**. Missing API: `RelativeDualizingComplex.unique`, `RelativeDualizingComplex.exists`, `RelativeDualizingComplex.baseChange`, `RelativeDualizingComplex.homothety_iso`, `RelativeDualizingComplex.upperShriek`. Missing examples: `test_rdc_identity`, `test_rdc_projective_line`, `test_rdc_base_change`, `test_rdc_not_invertible`.
- **relative-dualizing-module**. Missing API: `relativeDualizingModule`, `upperShriek_structureSheaf_iso_shift`, `relativeDualizingModule_coherent`, `relativeDualizingModule_baseChange`, `relativeDualizingModule_invertible_iff`, `relativeDualizingModule_smooth`. Missing examples: `test_omega_smooth_curve_degree`, `test_omega_identity`, `test_omega_nodal_invertible`, `test_omega_not_canonical_for_non_cm`.
- **azumaya-trivialization-gerbe**. Missing API: `trivializationGerbe`, `trivializationGerbe_isGerbe`, `azumayaClass`, `azumayaClass_eq_zero_iff`, `azumayaClass_tensor`, `azumayaClass_eq_delta`, `azumayaClass_pullback`. Missing examples: `test_class_matrix`, `test_class_quaternion_real`, `test_class_field_agrees`, `test_class_not_module_class`.
- **equivariant-module-category**. Missing API: `EquivariantModules.abelian`, `EquivariantModules.forget_exact`, `EquivariantModules.hom_eq_invariants`, `EquivariantModules.trivialGroupEquiv`. Missing examples: `test_trivial_group`, `test_point_group_ring`, `test_hom_invariants`, `test_not_action_category`.
- **equivariant-coinduction**. Missing API: `EquivariantModules.coind_injective`, `EquivariantModules.forget_injective`, `EquivariantModules.unit_mono`. Missing examples: `test_coind_trivial_group`, `test_coind_point`, `test_coind_global_sections`, `test_ind_ne_coind_infinite`.

The named-theorem omissions also remain material: Leray and Čech spectral sequences; torsor/H¹ identification; colimit and slice comparisons; the full projective/Serre/proper-fibre formulas; support localization and module/depth/base-change comparisons; Kempf resolution; full fppf comparison/Kummer; field cohomology/limits/Hochschild–Serre/Gabber and torsion hypercover descent; finite étale pushforward; lisse and left-completion comparisons; Nisnevich points/dimension/Čech/Brown–Gersten; perfect generators and Tor-independent base change; compactification/étale/flat/smooth/lci duality and relative-dualizing/Serre/sheafified comparison; regular/field/Kummer/henselian/Brauer edge sequences; and equivariant acyclicity/Ext spectral sequence. The actual weaker examples (for instance affine Artin–Schreier vanishing and finite-field Brauer triviality) do not supply these whole target statements.

At the mathematical test level all 24 definition/construction nodes have at least three tests. The added nonexamples detect three genuine mistakes: negative twists on P⁰, nonflat failure of a big-site monomorphism, and lack of affine-stratum concentration for a skyscraper sheaf. The tests need real examples when their carriers are completed; replacing these statements by placeholders would conceal the errors again.

## Validation and orchestrator actions

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.2.json` reports **0 errors, 0 warnings**; all implementation statuses remain `unchecked`. `lean-check` passes as described above. The per-node checked list is complete, all 83 baseline references are confirmed, and no node was added or removed.

To revise the plan, first close the gerbe justification and define the actual torsor/sheaf-algebra and derived-category interfaces; then complete the listed APIs and examples against those carriers. Preserve the current partial remaining list and supplier gaps. Acceptance requires verified justification for the two unverifiable nodes and removal of the suggested-file contradictions. It does not require implementing every future target during this review.

The orchestrator should update the reader document to these corrected statements, particularly P⁰, big-site exactness, Cousin comparison, pro-étale hypotheses, affine curve Kummer proof, duality signs/compactification route and partial coverage. Confirm the requested B/C generalities, register CPC supplier layers, keep n-torsion at JacobianChallenge E, and apply the proposed downward moves/ownership re-pointings without creating an upward import. No further independent-review work is left unfinished in this submission.
