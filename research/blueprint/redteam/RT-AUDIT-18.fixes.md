# RT-AUDIT-18: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #4013, job FIX-RT-AUDIT-18).
- **Findings and verdicts.** `RT-AUDIT-18.result.json` and `RT-AUDIT-18.review.json`. The red team made 40 findings: 0 high, 14 medium and 26 low. The review confirmed 36 and rejected 4 (/7, /10, /26, /35).
- **Scope.** This job covers the 13 confirmed findings of medium severity: /1, /8, /11–/14, /21–/24, /27, /34, /36. The rejected medium finding /35 (a DWP.8 duplicate on EDC.7) is not applied: the review calls it a declared supplier–consumer relationship. The 23 confirmed low-severity findings are outside the fix job (PROTOCOL.md section 17).
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-18.result.json`; no other file changes. The audit's `review` object is unchanged.
- **Library values.** They change only where a finding says so:
  - L5 "Generic smoothness": `mathlib` → `partial`.
  - H0 "Torsion local systems…": `absent` → `partial`.
  - "Finite-level ordinary duals…", in both EDC.1 and EDC.1:biduality: `absent` → `partial`.
- **Layer verdicts.** One changes: `AdicCoefficientsAndComparisons:L5` goes from `partly built` to `not built`, because of /11 (see below). Every other verdict is unchanged.

**Verification.**
- I read every added declaration at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line, together with its section `variable` lines and namespace. Each one resolves in the pinned `declarations.tsv` under the stated full name.
- Every layer id added to a `duplicates` list is an atlas stage.
- Every target has at most five declarations. Where a finding adds more, the displaced citations are named in the note with file and line.

## RT-AUDIT-18/1 (medium, library-claim): Gauss and Jacobi sums are finite-field statements (CA.1)

In the target "Gauss sums and Jacobi sums…":
- **Note.** The claim "Over any finite commutative ring…" is replaced. The note now says that `gaussSum` is defined over any finite commutative ring, but the identities are proved only for a finite field F with a primitive additive character. It gives each identity with its hypotheses:
  - g(χ)g(χ⁻¹) = #F for χ ≠ 1, with values in a domain;
  - g² = χ(−1)#F for **nontrivial** quadratic χ, with values in a domain;
  - J(χ,φ) = g(χ)g(φ)/g(χφ) for χφ ≠ 1, with values in a field in which #F ≠ 0;
  - the Jacobi-product formula for gⁿ, with values in a domain.

  It also says there is no norm identity over ZMod N for composite N.
- **Review correction.** As the review asks, the square identity keeps its nontrivial-character hypothesis rather than saying just "quadratic".
- **Library value.** Stays `mathlib`, because the target is the finite-field statement. The layer stays `partly built`. I read the review's remark that "the broader character-sum target remains partial" as being about the layer.

## RT-AUDIT-18/8 (medium, duplicate): number-field orders (CA.7)

- **Duplicate added.** GlobalNumberFields layer 11.
- **Note.** It says that layer 11 owns NumberFieldOrder, the conductor, invertible proper fractional ideals and Pic/NarrowPic, and that CA.7's order carrier for semisimple ℚ-algebras must specialise to it.
- **Review corrections.**
  - The note says that ClassFieldTheory layer 13 already routes orders to layer 11, so ownership is settled.
  - It says that the locally free class group of a noncommutative order such as ℤ[G] is not a Picard or narrow class group, so only the commutative case overlaps.

## RT-AUDIT-18/11 (medium, library-claim): generic smoothness (L5)

In the target "Generic smoothness":
- **Library value.** `mathlib` → `partial`.
- **Citations.** `Scheme.Hom.dense_smoothLocus_of_perfectField` changes fit from exact to special case. `Scheme.Hom.genericPoint_mem_smoothLocus_of_perfectField` (Morphisms/Smooth.lean:333) is added as a special case.
- **Note.** It says Mathlib proves only the absolute case over a perfect field. It then states what is missing, with its hypotheses, as the review asks: a dominant morphism of integral schemes, locally of finite presentation, with separably generated function-field extension, is smooth on a dense open subset of the source. This does not follow from the absolute case, since K(Y) is imperfect in characteristic p.
- **Review correction.** The note also says that, without the separability hypothesis, this does not give smooth generic fibres or smooth fibres over a dense open of the base.

**Layer verdict: L5 `partly built` → `not built`.** Generic smoothness was L5's only target in the libraries. After this finding every L5 target is `partial` or `absent`, and the review asks for the verdict to be recomputed. By the audit rule ("partly built" means at least one target is present), L5 is `not built`.

## RT-AUDIT-18/12 (medium, library-claim): finiteness of normalization (L5, summary)

In the target "Normalization of schemes…" (stays `partial`):
- **Citations added.**
  - `IsIntegralClosure.finite` (DedekindDomain/IntegralClosure.lean:175, special case).
  - `exists_finite_inj_algHom_of_fg` (NoetherNormalization.lean:287, related).
  - Tau Ceti `TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable` (IntegralClosure/PurelyInseparable.lean:167, special case).
  - Tau Ceti `TauCeti.IsIntegralClosure.finite_of_injective` (IntegralClosure/Transfer.lean:65, related).
- **Citations kept.** `Scheme.Hom.normalization`.
- **Citations displaced.** `Scheme.Hom.normalizationDesc` (Normalization.lean:373) and `normalizationPullback` (:584) move into the note with their locations, to stay within five.
- **Review corrections.**
  - Following the review, Krull–Akizuki (`TauCeti.IsIntegralClosure.isNoetherianRing`, NormalizationFinite.lean:400) is not cited as a declaration. The note names it and says that it gives noetherianity, not module finiteness.
  - The note says the Japanese, Nagata and excellent notions, N-2 for finite-type algebras, and finiteness of the relative normalization are still missing. It does not claim excellence.
- **Summary.** After "relative normalization" it adds "finiteness of integral closures in the separable case (Mathlib) and the purely inseparable polynomial case (Tau Ceti)".

## RT-AUDIT-18/13 (medium, duplicate): L5 duplicates

Four entries are added, with the review's narrower notes:
- **`MotivicEtaleKTheory:M.5`.** It overlaps on the common geometric alterations, which M.5 should import.
- **`PadicDifferentialEquationsAndRigidCohomology:RD.5`.** Only the geometric alterations are shared. RD.5's descent is for rigid cohomology of F-isocrystals and stays separate from L5's étale-coefficient descent.
- **StableReduction layer 9.** Following the review, it is recorded as a **supplier**: the proved marked-curve input that L5's curve-fibration task consumes. The note says it is not a second construction and does not give alterations in arbitrary dimension.
- **`EtaleDualityAndPerverseSheaves:EDC.3`.** It overlaps on the smooth-pair purity component only. L5's Kummer, nearby-cycle and normal-crossing calculations are not in EDC.3.

## RT-AUDIT-18/14 (medium, duplicate): the tame quotient of inertia (L6)

- **Review correction: no duplicates added.** The review confirms the finding "as a missing upstream reuse route, not as two new duplicate constructions", and says to "add the owner route in the target note, not the proposed unqualified duplicate pair". I added no duplicate entries.
- **Note.** The note of the target "Explicit Galois-cohomology calculation with the inertia group…" now does three things:
  - It names LocalFieldsRamification layer 4 as the supplier of I_K/P_K ≅ ∏_{ℓ≠p} ℤ_ℓ(1) with its cyclotomic equivariance.
  - It leaves L6 only the extension to perfect residue fields and the cohomology calculation. It says that layer 4's Iwasawa presentation assumes a finite residue field.
  - It records LPV.1 as a compatibility partner built on the same supplier.
- **Library value.** Stays `absent`.

## RT-AUDIT-18/21 (medium, library-claim): RΓ and Rf_* by instantiation (H0)

In the target "Injective resolutions, D⁺, derived global sections and derived direct image…":
- **Citations added.** `CategoryTheory.Sheaf.Γ` (Sites/GlobalSections.lean:64) with fit **related**, as the review asks, not "more general". `CategoryTheory.Functor.rightDerived` (Abelian/RightDerived.lean:109, more general).
- **Citations displaced.** `Sheaf.isGrothendieckAbelian_of_essentiallySmall` (GrothendieckAxioms/Sheaf.lean:77) and `Functor.sheafPushforwardContinuous` (Sites/Continuous.lean:362) move into the note with their locations. `Sheaf.H` is kept.
- **Note.** "Missing: RΓ and Rf_* as functors on D⁺" is replaced. RΓ and Rf_* are obtained by instantiating `rightDerivedFunctorPlus`, and R^nΓ is `Functor.rightDerived`. Per the review, the note states the applicability conditions:
  - Γ exists when the constant-sheaf functor has a right adjoint.
  - Γ is additive through `constantSheafΓAdj`, Sites/Abelian.lean:51 and Adjunction/Additive.lean:38.
  - The pushforward needs an Additive instance supplied from the pointwise maps.
- **What is still missing.** The triangulated structure (a Mathlib TODO), the Sheaf.H ≅ R^nΓ comparison, the geometric packaging of these functors, and the composition (Leray) comparison.
- **Library value.** Stays `partial`. The red team's compilation claims are not relied on: the review did not reproduce them.

## RT-AUDIT-18/22 (medium, library-claim): slice-site extension by zero (H0, summary)

In the target "Torsion local systems, constructible sheaves…, Tate twists and supports…":
- **Library value.** `absent` → `partial`.
- **Citations added.** `CategoryTheory.Functor.sheafPullback` (Sites/Pullback.lean:55) and `CategoryTheory.GrothendieckTopology.overPullback` (Sites/Over.lean:279). Both have fit **related**, per the review, not "more general" as the finding proposed.
- **Note.**
  - It describes restriction to J.over X and its left adjoint as extension by zero for the slice site (Stacks 03DH/03DI), available where that adjoint exists.
  - It says this gives j_! for adic spaces only once the missing slice-site equivalence X_ét/U ≅ U_ét exists, and that it is not a general Rf_!.
  - The absence list now reads: no locally constant or constructible Λ-sheaves, μₙ^{⊗r} sheaves or Tate twists, and no i^!, Γ_Z, closed-complement supports or stalk description of j_!.
- **Summary.** "constructible sheaves and supports" becomes "constructible sheaves, sections with support and i^! (only the abstract restriction/extension-by-zero adjunction of a slice site exists)".
- **Layer verdict.** H0 stays `not built`: none of its targets is in the libraries.

## RT-AUDIT-18/23 (medium, error): étale sheaves over valuation rings exist (H1, H1:valuation-nearby-cycles)

The nearby-cycle target appears in both the parent H1 and the child H1:valuation-nearby-cycles. In both copies:
- **Note.** "there are no étale sheaves on schemes over valuation rings" is replaced. Mathlib has the small étale site of any scheme, whose abelian and module sheaf categories are Grothendieck abelian, with enough injectives and D⁺ derived functors.
- **Review correction.** The missing part is stated as the review asks: the packaged geometric small-site functors i^*, Rj_*, j^* for the valuation spectrum, their Galois actions and base-change comparisons, and nearby cycles. The note does not say that no functor exists: it says that the generic categorical sheaf pushforward and pullback exist and must be reused.
- **Citation added.** `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` (Sites/AffineEtale.lean:149, related).
- **Library value.** Stays `absent`.

## RT-AUDIT-18/24 (medium, duplicate): a consumer and a supplier removed (H4, H3)

- **Removed.** `DiamondEtaleCohomology:C6` from H4's duplicates, and `EtaleDualityAndPerverseSheaves:EDC.2` from H3's duplicates.
- **Provenance kept in target notes, as the review asks.**
  - H4 "Prime-to-p étale cohomology… of discs…" says C6 consumes these calculations.
  - H3 "Henselian comparison…" says EDC.2 supplies the scheme trace, purity and pairing, which H3 transfers to analytic curves.

## RT-AUDIT-18/27 (medium, library-claim): étale sheaf cohomology exists (DWP.1, DWP.4, DWP.6, DWP.8, summary)

- **DWP.4, "Weil I Lemma 7.1…".** The note says étale cohomology exists only as Sheaf.H on the small étale site, with no Leray spectral sequence, no blowup and no cohomology comparison for blowups.
- **DWP.6, "Weil II 3.2.3…".**
  - The note says Hⁱ(C_ét, F) is definable as Sheaf.H on `smallEtaleTopology`, with a long exact sequence in Tau Ceti.
  - Per the review, "no j_*" is narrowed: no packaged geometric j_* for U₀ ↪ C₀, only the generic sheaf pushforward along a continuous functor. The note also says there are no lisse ℚ_ℓ-sheaves, no Frobenius action and no finiteness or purity.
  - Citations added, all related:
    - `AlgebraicGeometry.Scheme.smallEtaleTopology` (Sites/Etale.lean:50);
    - `CategoryTheory.Sheaf.H` (SheafCohomology/Basic.lean:59);
    - `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` (Sites/AffineEtale.lean:149);
    - Tau Ceti `TauCeti.CategoryTheory.Sheaf.H.δ` (SheafCohomology/LongExactSequence.lean:75).
- **DWP.1, "Tate modules…".** "Mathlib only defines pro-étale Hⁿ(X, ℤ_ℓ)" becomes "Mathlib defines pro-étale Hⁿ(X, ℤ_ℓ) and étale sheaf cohomology Sheaf.H, but no comparison with a Tate module".
- **DWP.8, "Mixed complexes…".** "only abstract t-structures" becomes "only abstract t-structures and the derived category of the Grothendieck abelian category of étale sheaves, with no constructible subcategory".
- **Summary.** It now says that Mathlib supplies the small étale site with geometric points, Grothendieck-abelian étale sheaves with Sheaf.H, and pro-étale Hⁿ(X, ℤ_ℓ). It adds that there is no curve comparison, constructibility, Frobenius purity or Leray.
- **Verdicts.** All four layers stay `not built`, and the target library values are unchanged.

## RT-AUDIT-18/34 (medium, library-claim): finite-level ordinary duality (EDC.1, EDC.1:biduality)

The target "Finite-level ordinary duals over the self-injective rings ℤ/ℓⁿ…" appears in both EDC.1 and EDC.1:biduality. In both copies:
- **Library value.** `absent` → `partial`.
- **Citations added.** `MonoidHom.domRestrict_surjective` (GroupTheory/FiniteAbelian/Duality.lean:107) and `CommGroup.monoidHomMonoidHomEquiv` (:151), both related. The two existing citations are kept.
- **Note.** It adds duality for finite commutative groups with values in a monoid with enough roots of unity: characters extend from subgroups, and the double-dual map is an isomorphism. With values in ℂ and μ_{ℓⁿ} ≅ ℤ/ℓⁿ, this is finite-level ordinary duality in character form. With Baer's criterion (`Module.Baer.injective`, Algebra/Module/Injective.lean:401, named in the note), it would give self-injectivity of ℤ/ℓⁿ.
- **Review correction.** The note lists these as still missing and unformalized: the transport to the ℤ/ℓⁿ-linear statement, the Baer instantiation, sheaf-complex duality and the derived dual over ℤ_ℓ. It makes no claim that the bridge compiles.
- **Layer verdicts.** Both stay `not built`: no target in either layer is in the libraries.

## RT-AUDIT-18/36 (medium, duplicate): GS.3 cohomological correspondences (EDC.8)

- **Duplicate added.** `GlobalShtukasAndFunctionFieldLanglands:GS.3`.
- **Note.** Following the review, it is limited to the common correspondence API, which GS.3 should consume from EDC.8. GS.3's stack/shtuka setting, bounded truncations, transition maps and filtered-colimit compatibility remain its own work.

## Not applied

- **RT-AUDIT-18/35 (medium, rejected).** The proposed DWP.8 duplicate on EDC.7 is not added. The review finds that EDC.7 declares DWP.8 as a supplier and does not reconstruct its formalism.

## Checks

- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-18.result.json`: 1 file, 0 problems. The file parses, and every target has at most five declarations.
- **Citations.** All 10 citations that are new to the file resolve in the pinned `declarations.tsv`, as do the citations that are new to a target but already cited elsewhere in the file (`smallEtaleTopology`, `Sheaf.H`, `isGrothendieckAbelian_sheaf_smallEtaleTopology`, `Sheaf.H.δ`, `Functor.sheafPullback`). Four citations in the file do not resolve, and all four were already in it: `IsAdicComplete.henselianRing`, `PrincipalIdealRing.to_uniqueFactorizationMonoid`, `fermatLastTheoremFour` and `not_fermat_42`. They are not changes of this job.
- **Edits.** Every text substitution was asserted to match exactly once. Every target was located by roadmap, layer and target prefix, and asserted unique. The `review` object was asserted unchanged.
- **Diff.** The file is re-dumped with `indent=1, ensure_ascii=False` and its trailing newline. `git diff --stat` shows only this file (174 insertions, 52 deletions).
- No Lean file is involved, so nothing was compiled.
