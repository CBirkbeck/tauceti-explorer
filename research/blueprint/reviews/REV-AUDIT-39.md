# REV-AUDIT-39: review of AUDIT-39

**Verdict: accepted, after 72 corrections made in place.** No layer verdict changes.
- **Batch.** Four roadmaps: `RelativeFarguesFontaine`, `TropicalAndBerkovichArithmetic`, `VectorBundlesAndIsocrystals` and Tau Ceti's own `AdicSpaces`.
- **Scope.** 36 layers, 243 targets, 342 declaration citations (256 distinct) and 101 duplicates.
- **Baseline.** Tau Ceti `f790474`, Mathlib `082e2d3`. This matches the audit's `baseline` field and the pinned checkout (`BASELINE.json`).
- **Independence.** Reviewer: Claude Code, session cc-442dc5, which had no part in AUDIT-39.
- **Method.** The source reading was split across four read-only helper agents of this session, one per roadmap group. Every correction below was then re-read at the cited file and line by the reviewer before it was made.

## What the audit claims, and whether it holds

The overall picture holds:
- Tau Ceti's roughly 30,000-line, sorry-free `RingTheory/Huber` and `AlgebraicGeometry/AdicSpace` trees build most of AdicSpaces Layers 0–2.
- Layer 1 is fully built. I confirmed this target by target against the layer text (1.1–1.5).
- Nothing of Berkovich spaces, tropical geometry, the relative Fargues–Fontaine curve, Banach–Colmez spaces or Harder–Narasimhan theory exists in either library.

Final verdicts are the same as before review: 29 not built, 6 partly built, 1 built.

## 1. Citations

The mechanical checks all pass:
- **Location.** All 342 citations match `declarations.tsv` on library, name, file and line.
- **No `sorry`.** No cited file contains a `sorry` outside comments. The four files a naive grep flags have the word only in prose about AINTLIB.
- **No private declarations.**
- **One deprecated alias.** TB.4 cited Mathlib's `Tropical`, which is `@[deprecated MinTropical (since := "2026-07-24")]`. It is replaced by `MinTropical`.

Reading the statements turned up wrong or overstated citations:
- **L3 T11, rational-subset refinement.** The audit cited Lemma 7.54 (`…_of_isTateRing`), which refines covers of all of Spa over a Tate ring. The clause is `exists_finite_spaRationalFamily_refinement` (Basis.lean:364), for any Huber ring.
- **L3 T11, basis versus all opens.** `isSheaf_iff_isSheafFor_rationalCover` quantifies over rational covers of every open, so it is not "sheaves on the basis ⇔ sheaves on all opens". That equivalence is Mathlib's comparison lemma, `sheafInducedTopologyEquivOfIsCoverDense` with `TopCat.Opens.coverDense_inducedFunctor`. With it cited, T11 becomes `both`.
- **L2 T8.** Proposition 7.52(2) was cited as `isUnit_of_forall_not_vle_zero`. That theorem assumes every maximal ideal is open, which its own docstring says is vacuous for nonzero Tate rings. The usable statements are `isUnit_iff_forall_mem_spa_notMem_supp` and `exists_mem_spa_supp_eq_of_isMaximal` (Spa/Support.lean).
- **L4 T7.** `isStronglyNoetherian_completion` (fit exact for "completion preserves strong noetherianness") is about the completed rational localisation A⟨T/s⟩. Nothing states that A ↦ Â preserves the property.
- **RF0:integral-Y T3 and the RelativeFarguesFontaine summary.** They credit the completed localisation A⟨T/s⟩ with two results that Tau Ceti proves only for the uncompleted A(T/s): the ring-of-integral-elements theorem and Spa(A_U, A_U⁺) ≅ U. `Localization/Homeomorph.lean` says the completed ring "is intentionally not identified here".

Missed citations were added, including:
- Tau Ceti:
  - `ker_coeRingHom` (kernel of A → Â);
  - `LinearMap.isStrictMap_of_module_finite` (Proposition 6.18(2));
  - `toCompletionLocHomeomorphDenomOne` (A ≅ A⟨T/1⟩ as topological rings);
  - `flat_toCompletionLoc` (A → A⟨T/s⟩ flat);
  - `exists_rationalSubset_chain` (Remark 7.55);
  - the intersection graph and topological genus of a numerical type.
- Mathlib:
  - `Perfection.teichmuller`;
  - the p-typical flatness, residue ring and Teichmüller uniqueness of Witt vectors;
  - `AbsoluteValue.Completion`;
  - `Polynomial.gaussNorm_isAbsoluteValue`;
  - `FormalGroup` and `𝔾ₘ`;
  - `SheafOfModules.IsLocallyFree`.

## 2. Claims that something is present

Six targets marked present are only partial:
- **L0, restricted series with module coefficients.** M⟨X⟩ exists only as a submodule. Neither its topology nor its universal property is constructed, and the roadmap's milestone 1 asks for both.
- **L0, Theorem 6.16 and Proposition 6.17.** Wedhorn 6.16 says any two of (a) N complete, (b) u surjective, (c) u open imply the third. Only (a)+(b)⇒(c) is proved, and only the forward direction of 6.17 (noetherian ⇒ submodules closed). The audit's stated gap, uniqueness in 6.18(1), was wrong: that is `IsTateRing.isModuleTopology`.
- **L2 T1.** No statement gives the hypotheses under which Spa(φ) is spectral, although the roadmap asks for one. The audit's own note said so.
- **L2 T5.** The roadmap states Lemma 7.54 for complete A. It is proved for Tate rings, and for Huber rings only when the cover's numerator sets generate the unit ideal. The audit had narrowed the target to Tate rings.
- **L3 T1.** Openness of A_U⁺ is not proved (Plus.lean: "Openness is still not proved here"), so (A_U, A_U⁺) is not yet a Huber pair.
- **L4 T2, Proposition 8.30.** Two cases are proved: a numerator enlargement with the same denominator (which the file calls "Proposition 8.30 in full"), and A → A⟨T/s⟩. Flatness of 𝒪(U) → 𝒪(V) for an arbitrary containment V ⊆ U is missing. For different denominators, the map itself exists only under extra hypotheses.

The AdicSpaces summary is rewritten to list these gaps layer by layer.

## 3. Claims that something is absent or partial

Every absent target was re-searched by concept over `declarations.tsv` and both source trees. The exceptions are TB.1's descent and TB.3's specialization inequality, which have no standard name.

One target moves up:
- **TB.0 T4 is now partial.** Wedhorn Remark 7.42(2), `IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`, gives each continuous analytic point a height-one generization with the same support. That is the rank-one point the Berkovich comparison needs. The map to M(A) does not exist, so the target stays short of present.

Three partial targets with nothing stated become absent:
- L3 T7 (stalks);
- TB.2 T3 (compatibility with refinement and extension);
- VB0 T3 (the Brauer invariant).

Five notes claimed absences that are false. The statuses stand, but the notes are rewritten:
- **L0 T13.** Mathlib has Weierstrass division and preparation for power series over complete local rings.
- **TB.6 T4.** Mathlib has Weil heights with Northcott, and Tau Ceti has the Néron–Tate height. The note had said neither library has Weil or Arakelov heights.
- **TB.4 T2.** Mathlib has `DivisibleHull`.
- **RF4:G-torsors.** Mathlib has a multiplicative `Torsor` class.
- **VB4 T3.** Mathlib has a pro-étale site on schemes.

Hypotheses that the notes omitted are now stated:
- **RF0:annuli T3.** Restriction flatness and base change are proved only for noetherian Tate rings.
- **RF2:untilts T0.** `surjective_fontaineTheta` also needs Frobenius to be surjective on R/p.

## 4. Duplicates

All 101 resolve to live, non-retired stages.

**22 were removed.** Each falls under one of four reasons:
- **The other stage only consumes this one**, as the audit's own note says. The cases:
  - DY.2 on TB.0 and TB.1;
  - DY.4 and SF.5 on TB.6;
  - HS0 on RF2:integral-divisors and RF4:G-torsors;
  - GS0:Witt-geometry, AI.2 and BG2:smooth-Artin;
  - AdicSpacesPartII R0 on Layer 3.
- **The stages are in the same roadmap and one depends on the other.** These are the TB.3/TB.4/TB.5 pairs.
- **The overlap is with a prerequisite or a different object.** The cases:
  - PerfectoidSpaces P3;
  - P7's Robba rings;
  - AdicEtaleGeometry A0 on Layer 3, whose plus ring comes from tensor products.
- **The other stage has no text on the shared subject.** CR.3 never mentions slopes, and VS1 has no Harder–Narasimhan stratification.

Two duplicates pointed at the wrong layer and were replaced:
- StableReduction Layer 2 → Layer 6 (Pic(T));
- AnalyticToricGeometry Layer 6 → Layer 0 (cones and fans).

Three notes misattributed the content and were rewritten:
- BG0 was credited with the Kottwitz/Newton material, which is in BG1.
- The VB4 notes for BG2 and BG3 were swapped.

**29 missed owners were added.** The main ones:
- Tau Ceti's StableReduction Layers 1, 3 and 6, and LPV.7 for semistable dual graphs;
- ClassFieldTheory Layer 5 for the local Brauer invariant;
- BunGAndNewtonStrata BG1 and BG2:uniformization;
- FarguesFontaineDiamonds F1, F2 and F4;
- RF0's own sub-stages, which its text repeats verbatim;
- GZ.2, RP.0 and DY.2 for local heights;
- C4 and R18.5 for Tate and Mumford-type uniformisation;
- AdicSpacesPartII R3 and RF0:annuli for Tate and stably uniform acyclicity.

## Most important finding

The audit had marked the Layer 4 algebra done, with "Proposition 8.30 in full". It is not. Flatness is proved only for same-denominator enlargements and for A → A⟨T/s⟩, and the Huber pair (A_U, A_U⁺) is not yet established because openness of A_U⁺ is unproved. So Tate acyclicity is blocked on more than Lemmas 8.33–8.34 and a sheafiness predicate: the general restriction maps must come first.

Lean: none.
