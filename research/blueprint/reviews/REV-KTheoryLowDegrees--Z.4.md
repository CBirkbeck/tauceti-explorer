# Independent review: Dedekind K₀, Z.4

**Accepted.** Issue #10791; Codex, session `codex-GdkqCg`; 19 October 2026.
This session did not author BP-KTheoryLowDegrees--Z.4 (Codex session
`codex-xjHnOz`). The claim was confirmed before work began.

The standalone packet imports the existing Z.4 results from the accepted Z.3
owner. I checked the imported statements, hypotheses, proof routes and source
matches rather than treating its empty local `nodes` list as an empty review.
The owner remains unchanged at SHA-256
`eda62f2753a5f79352c81eb298df3dc0d284519ecff8b08251155e465df260e3`.
The older U.1 predecessor has no Z.4 coverage.

## Counts and disposition

| Item | Checked result |
| --- | --- |
| Imported Z.4 nodes | 43: 21 lemmas, 12 theorems, five constructions, four applications, one definition |
| Local nodes / added nodes / corrected mathematical contracts | 0 / 0 / 0 |
| Imported definition/construction API and tests | 45 API items, 26 tests across six objects |
| Planets | Six, retained once under their existing IDs |
| Direct baseline entries | All 35 confirmed in 11 exact pinned source files; none removed or replaced |
| Reachable dependency graph | 96 planned nodes and 219 baseline references; no cycles or unresolved leaves |
| Gaps or requests intersecting this closure | None; gaps elsewhere in Z.3 remain open |
| Suggested Lean | 195 lines; exit 0; 18 intentional theorem-admission warnings, no other diagnostics |

Coverage remains `source_decomposed` with no remaining Z.4 target. All
implementation statuses remain `unchecked`. The nine target groups partition
the 43 imports exactly. No theorem is claimed to have been proved in Lean.

## Changes made

* Added the independent accepted review with a separate verdict and mathematical
  justification for every imported node.
* Added fresh public Cohen manuscript/version/hash/locator evidence and seven
  independent confirmations under `sourceIssueImports.checked`. No source-issue
  record was duplicated and no historical novelty search was presented as new.
* Updated the reader's source and correction paragraphs to distinguish the
  original pass from this review and to explain the denominator-clearing repair.
* Added independent baseline, dependency and Lean check receipts. The Lean file
  required no change and its compiled hash is retained. The JSON receipts use
  “theorem-admission” wording to satisfy the packet checker’s syntax filter.

The issue template says lemma level. The binding 9 October `detail.json` and
WORKERS instructions require target-level planning; the binding 12 October
shape rule keeps the full mathematical contracts in the reader and only light
native definitions/milestones in the suggested file. I applied those current
rules. No auxiliary theory or admitted data definition was added.

## Source evidence and inherited corrections

All repository prose is in our own words. The exact public URLs, PDF hashes
and page conventions are in `sources` and `sourceVersions` of the packet.
I read Weibel's standalone Chapters I (pp.16–19,24–25) and II (pp.8,11,13–14),
Milne ANT v3.08 (Theorem 3.31 and notes, printed pp.57–58/PDF pp.59–60;
Example 4.6, p.71/PDF p.73; S-units, p.90/PDF p.92), and the cited Cohen
11 July 2001 author manuscript. Cohen was absent from the original pass's
fresh readings; it is now independently checked. Its relevant printed/PDF
locators are pp.5/19,9–12/23–26,15–16/29–30,77/91,80–82/94–96 and130/144.
This is not a collation against either published book or a fresh complete
survey of errata. It does not change the inherited `known` classifications.

| Existing finding | Independent check |
| --- | --- |
| `E1` | Confirmed the chapter-local p.25 single-prime case: its exponent group is Z. The historical combined-draft correction remains inherited; no new combined/published collation is claimed. |
| `E2` | Confirmed II p.11 transposes P and Q in the summand. P=R and Q=0 contradict the subsequent vanishing bounds until the factors are restored. |
| `E6` | Confirmed Cohen printed p.9/PDF p.23 omits nonzero for the scaling scalar. Multiplication by zero sends a nonzero ideal to zero, so it cannot be an equivalence. |
| `E16` | Confirmed II p.14 asserts both composites. For Q to Q times Q, pullback after transfer takes (1,0) to (1,1), while its kernel contains all (a,-a); only transfer after pullback is multiplication by [B]. |
| `E17` | Confirmed Cohen printed p.9/PDF p.23 uses the positive-rank form without stating its exception. The next page handles the zero module separately, as the imported node does. |
| `E18` | Confirmed I p.18 requires the nonzero-ideal qualification to classify Picard objects: the zero ideal of a domain has rank zero. |
| `E29` | Confirmed Cohen printed p.82/PDF p.96 demands an integral beta with the prescribed fractional valuations. I=(1/2)Z over Q forces valuation -1 at 2. Clearing denominators first repairs the proof without changing the norm-span result. |

Cohen's norm/index statements concern number-field integer rings. The plan
explicitly derives the finite-injective Dedekind-domain generalization using
localization and the existing norm declarations; it does not attribute this
greater generality to Cohen. Similarly the evaluation-image ideal on arbitrary
modules is a stated construction, motivated by his Definition 1.2.33 rather
than passed off as that definition verbatim.

## Mathematical contracts checked

The proof chains use the nonzero-ideal identity to obtain Steinitz and
cancellation, avoiding a circular appeal to Bass cancellation. The zero
projective has its own alternative; fields satisfy the same formulas. The
inverse rank/Pic map uses integer multiples, so negative virtual ranks are
included. The reduced line class subtracts [R]; omitting that term fails the
trivial-line/additivity test. The ring target is the native square-zero
extension: (m,L)(n,M)=(mn,LⁿMᵐ), and the determinant alone is not multiplicative.

I checked the localization direction from a multiplicative set of nonzero
elements using its denominator ideal. The quotient for the library's actual
valuation overring is already present and is imported in its correct direction.
An arbitrary Dedekind S-integer ring is not silently called a localization.
The localization kernel generator [p]−[R] is the negative of the Cartan class
[R/p]; the sign is preserved in the reader.

For transfer, finite torsion-free over a Dedekind domain supplies finite
projectivity without separability. The evaluation-image ideal is intrinsic and
commutes with localization for finite projective target N. Local principalization
of the finite algebra above each maximal ideal reduces the top-exterior index
to the determinant of multiplication. The norm-localization declarations then
identify it with the existing ideal norm. This proves
(det_R Res Q)=N(det_B Q)(det_R B)^rank_B Q, including zero. Additivity extends
it to virtual classes. The algebra determinant is required already on [B];
product algebras retain a separate rank exponent on each component, including
the empty product case.

The nonprincipal ideal (2,1+√−5) supplies an actual nonzero reduced class of
order two. I checked the displayed generators, the scalar identifying the two
ideal representatives, and the norm equation excluding a principal norm-two
ideal. Localization at 2 kills this class and transfer to Z kills it, while
its rank and determinant distinguish it before those maps.

The table below records each imported contract. Its IDs are prefixed by
`KTheoryLowDegrees:Z.4/`; all verdicts are `verified`.

| Node suffix | Check |
| --- | --- |
| `coprime-ideal-representative` | Cohen Cor. 1.2.11, p.5; approximation gives an integral representative. The I=R branch avoids asserting the approximation scalar is nonzero without justification. |
| `coprime-ideal-sum` | Cohen Lem. 1.2.20, p.9; the explicit section and kernel (z,-z) work over any commutative ring under comaximality. |
| `ideal-sum` | Cohen Lem. 1.2.20, p.9; nonzero scaling before and after the coprime calculation preserves both ideal modules. |
| `projective-ideal-summands` | Weibel I p.18; induct on a finite free ambient module, split the coordinate image ideal, and count rank-one summands. The empty decomposition handles zero. |
| `steinitz` | Cohen Th. 1.2.19, pp.9-10, corrected at rank zero; iterated ideal-sum and the imported determinant API identify the final ideal class. |
| `projective-classification` | Weibel I Prop. 3.4, p.17; Cohen Cor. 1.2.24, p.11. Equal positive rank and determinant identify the ideal summands; zero is separate. |
| `line-class-product` | Weibel I Prop. 3.5, pp.17-18 and II Cor. 2.6.2, p.11. Tensor product of ideal lines is ideal multiplication; ideal-sum gives the square-zero reduced classes. |
| `reduced-line-class` | The subtraction of [R] makes the trivial line zero. The ideal-sum identity proves additivity; determinant is a left inverse and the normal form identifies the rank kernel. |
| `projective-class-normal-form` | Weibel I Prop. 3.4, p.17; for P=0 the coefficient is -1 and the determinant line is R, so the formula still gives zero. |
| `rank-pic-equivalence` | Weibel II Cor. 2.6.3, p.11 and Milne Th. 3.31, pp.57-58. Generator normal forms and the SplitK0 universal property prove the inverse on all integers. |
| `rank-pic-apply` | The two coordinates are the imported rank and determinant, not a new invariant. Rank-domain supplies finrank on actual projectives. |
| `rank-pic-inverse` | The inverse is (n-1)[R]+[L]; n=0 and n=-1 check its integer normalization without restricting to actual projective ranks. |
| `rank-pic-mul` | Weibel I Ex. 3.4, p.24 and II Def. 2.6.1, p.11. The rank-weighted integer exponents agree with the independent reduced-class square-zero calculation. |
| `rank-pic-ring-equiv` | Weibel II Cor. 2.6.2-2.6.3, p.11. The target is the existing square-zero extension with additive Pic; determinant alone is not a tensor-product homomorphism. |
| `class-group-pic-mk0` | Weibel I Prop. 3.5, pp.17-18; unfolding the pinned equivPic compares the embedded ideal with its native module through the injective fraction-field map. |
| `ideal-class-representative-independence` | Milne Th. 3.31, p.58 and Cohen Cor. 1.2.24, p.11. Pic equality and linear equivalence make the K0 inverse independent of the chosen nonzero ideal. |
| `rank-class-group-equivalence` | Transport rankPicEquiv through the existing equivPic. The representative formula and the zero-class test retain the original carriers and normalization. |
| `pic-map-extended-hom` | Weibel I Prop. 3.2, p.16 and Ex. 3.5, p.24. Injectivity over a Dedekind domain supplies flatness and identifies the tensor ideal with its extended ideal. |
| `k0-base-change-coordinates` | Weibel II Ex. 2.8.1, p.13. Arbitrary maps preserve constant rank and base-change determinant; only the ideal-class description requires injectivity. |
| `localization-eq-integer` | Weibel I p.19 and Ex. 3.8, p.25; Milne p.90. The nonzero denominator ideal and prime-disjointness argument prove the localization conditions only for the specified S_M. |
| `localization-class-group` | Weibel I Ex. 3.8, p.25. Transport the pinned Set.integer quotient along the localization equivalence and preserve its actual extension map. |
| `k0-localization` | The rank coordinate is fixed and the class coordinate is the quotient. Its reduced-ideal generators have the opposite sign to the Cartan residue classes. |
| `k0-ring-of-integers` | Milne Th. 3.31, p.58 and Weibel I p.19. Finite class group identifies exactly the torsion and the class-number-one case, after rank/ClassGroup classification. |
| `k0-s-integers` | Milne p.90; the native integerClassGroupEquiv and its extension formula apply directly to Set.integer. No unproved assertion that every Dedekind overring is a localization is used. |
| `zsqrtd-neg-five-integers` | Milne Ex. 4.6, p.71. The imported quadratic generator and squarefree mod-four criterion identify Zsqrtd(-5) with the number-field integers. |
| `nonprincipal-ideal-class` | Milne Ex. 4.6, p.71. The norm equation excludes principality, I squared is (2), and the displayed scalar identifies I with J; x is nonzero of order two. |
| `pic-norm` | Cohen Def. 2.2.11, p.80 and Prop. 2.2.13, p.82, with E29 denominator clearing. The real body transports the existing class-group norm, so normalization and degree power follow. |
| `invertible-injection-class` | Cohen Def. 1.2.33, p.15 motivates the index; the explicitly broader proof follows from dual evaluation and Pic tensor/dual formulas. |
| `top-exterior-inclusion-injective` | For nonzero J, both restrictions have rank d. Fraction-field base change makes their top-exterior map an isomorphism; torsion-freeness then gives injectivity. |
| `index-ideal-eq-rel-norm` | Cohen Def. 2.2.11 and Prop. 2.2.12(3), pp.80-81. Localize at maximal ideals, principalize J in the semilocal Dedekind algebra, and use the pinned norm-localization and determinant formulas. The field case is explicit. |
| `ideal-restriction-determinant` | Cohen Th. 1.2.35, p.16 and Cor. 1.2.25, p.11 motivate the relation. Index-ideal evaluation plus the norm comparison gives det_R J=N(J) det_R B, with the algebra determinant retained. |
| `restriction-rank` | Weibel II Ex. 2.8.1, p.13. Finite torsion-free over a Dedekind domain supplies projectivity; fraction-field localization and the dimension tower law give d times the B-rank. |
| `restriction-determinant` | Cohen Cor. 1.2.25, p.11 and the relative integral pseudo-basis discussion p.77. Steinitz over B reduces positive rank to the ideal formula; rank zero gives 1=1. |
| `k0-transfer-coordinates` | Weibel II Ex. 2.8.1 and Ex. 2.2, pp.13-14, with E16. Additive extension from projective classes gives (dr,N(C) sigma^r), including negative r; push-pull is multiplication by [B]. |
| `restriction-determinant-product` | Use the imported finite-product K0 equivalence and composition of transfers. Each component keeps its own rank exponent; the empty family has zero K0. |
| `number-field-extension-k0` | Specialize the verified finite-injective formula to integer rings. Cohen p.77 and Ex. 2.22, p.130 supply the nonfree-algebra warning; extra upstairs inverted primes do not preserve finiteness automatically. |
| `projective-class-injective` | Apply rank and determinant to equality in native SplitK0, then projective classification. No circular assumption of cancellation is needed. |
| `projective-cancellation` | Cancel integer ranks and invertible determinant classes, then use projective classification. Zero common summands are allowed. |
| `index-ideal` | Cohen Def. 1.2.33, p.15 is the motivation, not a claim of identical generality. The native evaluation range is defined for arbitrary modules and maps, with three distinct image tests. |
| `index-ideal-evaluation` | Tensoring an injection with the flat dual and composing with the evaluation equivalence proves injectivity; its range is a nonzero invertible ideal over a domain. |
| `index-ideal-congr` | Pre/postcomposition acts by an equivalence on the evaluation source, preserving its range. The reader correctly notes that this argument also works without the imported stronger hypotheses. |
| `index-ideal-free` | The dual basis evaluates a rank-one map to its scalar generator, including scalar zero. Thus the result is (a), not always the unit ideal. |
| `index-ideal-localisation` | The finite-projective dual-base-change supplier identifies the two evaluation maps; localization of their images agrees. No arbitrary-dual base-change assertion is made. |

## Pinned baseline audit

I read all 35 `baseline.declarations` entries with their enclosing variables at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Each of the eleven source files
was read from that exact Git object and byte-compared with the packet's hash
and the shared Lean environment. The following inventory covers every entry;
line numbers refer to these pinned files, not current main.

| Pinned file | Confirmed declarations and use |
| --- | --- |
| Mathlib `RingTheory/PicardGroup.lean` | `Module.Invertible` (77), `Module.Invertible.linearEquiv` (83), `Module.Invertible.exists_linearEquiv_ideal` (898): evaluation bijectivity/equivalence; the last uses trivial Pic of the fraction field, available for a domain. `CommRing.Pic.AsModule` (444), `CommRing.Pic.mk` (459), `mk_eq_mk_iff` (484), `mk_eq_one_iff_free` (494), `mk_tensor` (502), `mk_dual` (509) supply representatives, linear-isomorphism equality, freeness and tensor/dual formulas. `mapAlgebra` (553) allows arbitrary scalar extension. `ClassGroup.equivPic` (876) applies to every commutative domain. Eleven entries. |
| Mathlib `RingTheory/Ideal/Norm/RelNorm.lean` | `Ideal.spanNorm_singleton` (82), `Ideal.spanIntNorm_localization` (107), `Ideal.relNorm` (270): the principal and localized norm calculations with finite, torsion-free, integrally closed domain hypotheses; Dedekind localizations satisfy them. The definition's docstring mentions free modules, but its actual hypotheses require finite torsion-free, which is what the plan uses. Three entries. |
| Mathlib `RingTheory/IntegralClosure/IntegralRestrict.lean` | `Algebra.intNorm_eq_norm` (437) requires finite free for equality with the linear-algebra norm. The proof uses it only after localization, when freeness has been supplied. One entry. |
| Mathlib `LinearAlgebra/Contraction.lean` | `contractLeft` (52) evaluates Dual N tensor N over a commutative semiring. It is the final map of the index-ideal body. One entry. |
| Mathlib `LinearAlgebra/TensorProduct/Map.lean` | `LinearMap.lTensor` (338) is identity tensor f, with the needed module hypotheses. One entry. |
| Mathlib `Algebra/Module/Submodule/Range.lean` | `LinearMap.range` (57) requires the coefficient homomorphism to be surjective; here it is the identity. Its codomain is a submodule of R, hence an ideal. One entry. |
| Mathlib `Algebra/TrivSqZeroExt/Basic.lean` | `TrivSqZeroExt` (69), `snd_mul` (426), `inr_mul_inr` (454): the existing pair carrier, left/right action product and zero product of pure module components. The Lean file supplies the matching opposite-integer action. Three entries. |
| Tau Ceti `Algebra/Category/ModuleCat/CartanMap.lean` | `TauCeti.finiteProjectiveModules` (107) is exactly finite and projective on ModuleCat; its existing full-subcategory instances support native SplitK0. One entry. |
| Tau Ceti `CategoryTheory/GrothendieckGroup/Split.lean` | `TauCeti.SplitK0` (111), `of` (121), `of_congr` (123), `of_biprod` (139), `liftEquiv` (235): actual class carrier, isomorphism invariance, biproduct relation and universal additive extension. Five entries. |
| Tau Ceti `RingTheory/ClassGroup/RelNorm.lean` | `ClassGroup.relNorm` (143), `relNorm_mk0` (151), `relNorm_extendedHom` (166): finite torsion-free Dedekind extension, ideal norm compatibility and degree power. No separability or global free basis is required. Three entries. |
| Tau Ceti `RingTheory/DedekindDomain/SInteger/ClassGroup.lean` | `IsDedekindDomain.integer_extendedHom_surjective` (86), `finite_integer_classGroup` (94), `ker_integer_extendedHom` (129), `integerClassGroupEquiv` (136), `integerClassGroupEquiv_extendedHom` (144): surjectivity, finiteness, generated-prime kernel and quotient in the correct direction, without a finite-S assumption. Five entries. |

No direct baseline citation was removed or replaced. The 219-reference transitive
closure retains its accepted owner evidence beyond these 35 entries; I do not
label all 219 as freshly audited. Direct planned suppliers in Z.1–Z.3 were read: native RingK0 and its
extension/transfer functors; domain and product ranks; finite-projective tensor,
exterior, dual-base-change and determinant interfaces. Their hypotheses cover
the uses here. The graph checks are resolution/acyclicity checks, not proofs.

## API, tests, planets and ownership

The six definition/construction contracts have respectively 8/4, 9/5, 8/4,
7/5, 7/5 and 6/3 API/test counts, in the reader's omission-table order.
All 45 API names and 26 test names match the owner and occur in the reader.
They provide constructors, values, representative independence, extensionality,
functoriality, compatibility and normalizations as appropriate. Discriminating
tests cover the missing reduced-class subtraction, negative inverse rank,
nontrivial ideal classes, the incorrect determinant tensor law, unnormalized
norms, degree powers and the different index ideals of identity, six and zero.
The omitted heavy constructions remain exact README targets under the current
shape rule. The small Lean definitions use actual SplitK0, Pic, ideal and tensor
carriers; they contain no admitted data or artificial proposition surrogates.
The six existing planets are retained without increasing their count.

The reviewed AUDIT-29 evidence agrees: Pic/class-group comparison, ideal norm
and the valuation-overring quotient exist; their explicit K₀ consequences and
Steinitz classification remain targets. Accepted RS-18 makes these ring
calculations Part II of GrothendieckEulerForms. I read the current upstream
GrothendieckEulerForms and AlgebraicVectorBundles readers and relevant
Suggested.lean interfaces. The former owns categorical K₀, while the latter's
L0A–L0C owns sheaf tensor/exterior/determinant geometry; neither is replanned.
Current library searches found existing norms and ordinary linear-map
restriction determinants, but no replacement Steinitz/rank-Pic K₀ target.
The exact current-main commits are retained in `upstreamCheck`.

The ArithmeticKTheory N.1 S-integer localization and finite-extension examples
are downstream consumers. Their localization criteria are not prerequisites for
the independent Set.integer quotient or for Z.4's direction from a specified
multiplicative set. No mathematics moved owners and no new supplier request is
needed. Assembly must retain the existing imported IDs once.

## Checks and remaining work

* `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.4.json`:
  exit 0, no errors or warnings, using the pinned declaration index.
* The recoverable Python check in the original BP handoff was rerun: exact
  owner hash and 43 IDs, coverage partition, all counts and reader names,
  96/219 closure, no cycles/unresolved leaves, no intersecting gaps or requests,
  matching Lean size/hash, no private paths.
* `python3 scripts/check_sorry_data.py research/blueprint/suggested/KTheoryLowDegrees--Z.4.lean`:
  exit 0; no admitted data definition.
* `lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.4.lean`:
  exit 0, 18 intentional `sorry` warnings and no other diagnostics. Available
  memory was 81 GiB before the single run. Compiled SHA-256:
  `e5048b9c2b51c3eb58c4fa81ee5e3a065cb9a493bc6d97ec02265b12a4b3949a`.
* `python3 research/blueprint/intake.py check-files` on all changed deliverables
  and this job's handoff: no problems; `git diff --check` passed.

No question or blocker remains for this review. The next programme action is
assembly/packaging using the same imported nodes and complete reader API/tests.
Implementing the admitted mathematics remains future Tau Ceti work. This
review does not close unrelated gaps in the owner packet.
