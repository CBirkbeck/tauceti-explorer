# Handoff: ArithmeticKTheory roadmap package

Job `PKG-ArithmeticKTheory~codex`, issue #11064. Agent: Codex, session
`codex-iebsUU`. The claim bot confirmed this session’s claim. This is a complete
package submission for independent review, not a checkpoint or a claim that the
planned mathematics has been formalised.

## Delivered and reconciled

The eight-layer README contains the full number-field target statements,
standing hypotheses, named interfaces, discriminating Checks, worked examples
and source locators. It includes hermitian finite generation, all-integer
Bott-inverted arithmetic and the independent golden-field K₂ computation.
The 139-entry effective input inventory consists of the main packet plus its
inherited parts after all 22 contract revisions; 136 number-field entries are
covered below. The three function-field entries are expressly outside the main
packet’s inheritance policy and are listed as exclusions, not omitted silently.
ArithmeticKTheoryPartII is a separate roadmap and was not repackaged.

Suggested.lean has seven light real-bodied definitions, twelve named theorem
targets and eleven proved examples, with at most two examples for any definition.
Higher K-groups, Galois cohomology, spectral constructions and proof-bearing
certificates stay in the README and the single closing comment because their
carriers are not available at the pins. No sorry’d data definitions, invented K
carriers or weakened substitutes were used. Metadata uses `math.NT`.

The main packet’s accepted review is the independent codex-pZoKxY review dated
2026-10-19 (125 verified, 14 corrected effective entries). I consumed its revised
contracts rather than older part statements. Repeated finite-stage/stable rank
homology and finite-S-defect targets are stated together with every hypothesis
and both map ranges retained. The old `wildKernel` name is explicitly separated
as `rawWildKernel`; Weibel’s finite-symbol kernel is `symbolWildKernel`.
The special-field predicate is named `IsSpecial`, with its full accepted API.
The arithmetic Bernoulli carrier is Mathlib’s `bernoulli`, not a duplicate.

## Dependency order and reuse audit

ArithmeticKTheory and the surrounding K-theory family are outside the 94-roadmap
Caraiani–Newton tier order (the current list has 88 distinct roadmap names).
No numeric tier or bundle membership was invented. There are no known
higher-tier notions moved down in this package. Supplier contracts remain
explicit mathematical requirements, including additions not yet supplied by
an existing stage. This is not a claim that the entire inherited dependency
world is already closed or acyclic.

Audited the current read-only TauCetiRoadmap main at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, in addition to Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` at the build pins.
Read the reviewed ArithmeticKTheory library-coverage audit. Object searches
covered all kept families: Q rank strata/pure submodules, Steinberg homology,
S-integer valuation and class maps, actual K groups and coefficients, twisted
cyclotomic invariants, local symbol/completion kernels, ambient divisibility,
character projectors, Bernoulli denominators, genuine Poincaré structures,
relations/covolumes and explicit quadratic-field arithmetic. Quillen model
categories, Borel subgroups and Lie-theoretic Steinberg names were not counted
as higher-K implementations.

Checked all nine newer roadmap trees (including OperatorTheory’s nested
roadmaps): AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices,
LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions,
ProfiniteArithmetic and RealAlgebraicGeometry. Also checked Completed, including
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
These provide infrastructure rather than the new higher arithmetic-K targets.
IntegralLattices §2D/§2E supplies the covolume/Gram and Minkowski infrastructure;
the golden congruence specialization consumes it.

Duplication removals/deferrals made explicit in the package:

- S-integer carriers, units, Dedekind structure, height-one spectrum and class
  quotient are existing library objects. Tau Ceti’s unit finite-generation
  theorem is not mistaken for a rank formula.
- `CategoryTheory.ExactStructure`, `TauCeti.ExactK0`, its `liftEquiv`, and the
  exact finite-projective module category are existing infrastructure. The
  general higher Q/K₀ comparison is imported from GeneralAlgebraicKTheory.
- Current `TauCeti.NumberField.Sqrt5` already proves degree two, monogenicity,
  index one, discriminant five, signature (2,0), PID/class number one, the unique
  dyadic prime with e=1,f=2, fundamental-unit generation, rank one and torsion
  order two. The exact `Basic`, `Invariants`, `Units` and `RealPlace` declarations
  are named in the README supplier contract; none is a new arithmetic target.
  They postdate the build pin, so Suggested.lean does not import them.
- Existing Bernoulli conventions/von Staudt–Clausen, cyclotomic local arithmetic,
  class norms, additive-group structure, finite relations and lattice-index
  theorems are cited rather than redeveloped. Divided Bernoulli denominators
  still need Kummer congruences.
- Buildings/duality and rational Borel ranks stay with BorelRegulators R.1/R.3;
  low-degree K₀/K₁ and Matsumoto/tame-symbol facts stay with their owners;
  local/étale/Iwasawa and hermitian foundations stay with their named owners.
  K3BlochGroups consumes our arithmetic K₃ and is not an input to it.

The actual statements of cited pinned declarations were read, not inferred
from names. Particular checks included ClassGroup.relNorm’s finite-extension
hypotheses, Set.unit_fg_of_units’ finite-S hypothesis, ramification versus
inertia factors, the compactness/convexity/symmetry conditions of Minkowski,
and the surjective-solution conditions of Module.Relations. Current-library
quadratic-field declarations were read with their integral-generator/minimal-
polynomial and field-generation hypotheses.

## What the README cannot discharge

All nine accepted proof/supplier gaps remain visible as exact contracts or
restricted conclusions. Packaging a plan does not settle them:

1. **G-Homotopy:** H.1 categorical/cellular chain-coefficient comparisons and
   H.3 connected CW H-space finite type (nonzero π₁ allowed). Serre’s actual
   cover/loop argument is read and locatable; the supplier export is not present.
2. **G-Hermitian:** arithmetic Witt signature and characteristic-zero quadratic
   injection, H.6 connective C₂-orbit finite type, and the exact classical GW
   comparison in degrees 0–3. The quadratic comparison only above degree four
   is not used to fill those degrees.
3. **G-Coefficient:** K.7 localization/products and safe-modulus reduction,
   M.7 equivariant torsion-edge/colimit compatibility, real KO/BO from RT.4,
   and the one-inverted-prime Brauer computation with invariant sum. No
   arbitrary mod-3 ring structure or unnormalized Chern factor is assumed.
4. **G-HarrisSegal:** original Harris–Segal §3 proof and the detected finite-field/
   wreath-product map were not obtained. Publisher metadata/DOI is verified;
   the K-book’s report is not treated as a proof of that natural summand.
5. **G-WildHigher:** global-to-local vanishing in the divisible torsion part of
   higher local K remains unproved. Only inclusion of raw in symbol kernel
   and the degree-two equality are asserted without that extra theorem.
6. **G-WildExceptional:** the read 23 July 2004 preprint’s Lemma 4.4 allows an
   incompatible class/norm prescription. In ℚ(i), modulo 4, every odd prime
   ideal has norm 1, never 3. The specific exceptional odd dyadic application
   in Theorems 4.5/6.11 requires compatible Chebotarev data or an independent
   image theorem. This does not refute Theorem A; the publication was not
   collated. The independently supported branches are kept separate.
7. **G-RegularProofs:** exact original Kummer/Herbrand–Ribet, regularity/tower,
   reflection/cyclicity and free Bott-module proofs are supplier obligations.
   The K-book’s statements were read; they do not supply all original proofs.
   Washington is not cleared in the library index and no other copy was used.
   IntegralIwasawaTheory L0/L3 owns those general foundations and Vandiver.
8. **G-Keune:** the original injection and exact hypothesis/twist translation
   were not obtained. CGZ version 3, Lemma 3.5 and proof p.20 is the read
   evidence; invariants were not silently substituted for coinvariants.
9. **G-ChernBoundary:** the inherited cycle
   N.5→M.8→R.7→Polylogarithms P.2→K3BlochGroups V.3→V.2→N.5
   needs external owner updates. This package uses the early M.7 torsion edge;
   V.2 should use N.3 finite generation and R.3 ranks. The other packets are
   outside this issue’s allowed edits and were not changed.

The corresponding accepted request contracts are R-GN-Witt, R-H6-finite-type,
R-H3-finite-type, R-K7-coefficients, R-M7-edges, R-RT4-real, R-R02-Brauer,
R-L1-HarrisSegal and R-Iwasawa-cyclotomic. No new jobs were claimed or opened.
A reviewer can examine the full specifications without treating these as
already-proved library exports.

## Adversarial pass over every effective statement

“Pass” here means the concrete attempted falsification agrees with the stated
scope and source; it is not a proof or an independent-review verdict. Each row
identifies a statement family including its defining identities, naturality and
API laws. The README’s Checks carry the explicit computed witnesses. All
139 effective entries are accounted for; three scope exclusions are marked.

| Input statement (ArithmeticKTheory prefix omitted) | README | Instances tried | Result | Change or scope decision |
| --- | --- | --- | --- | --- |
| `N.1/S-integers-as-a-localisation` — Localization criterion | §1.1 | R=ℤ, S=∅/{(p)}/all primes; M containing 0; a nonprincipal ideal | Units are the correct denominators; every inverted prime must meet M. | Retained arbitrary S and excluded 0 through the actual unit preimage. |
| `N.1/K1-of-S-integers-and-the-determinant` — K₁ and units | §1.3 | ℤ, ℤ[1/p], F×; degree one vs degree five | Ranks 0,1 and infinite generation respectively. | Kept the real-place contribution in the S-unit rank. |
| `N.1/norms-transfers-and-pullbacks` — K₀ transfer and norm | §1.3 | Free quadratic B; nontrivial Steinitz class; degree-one extension | Transfer of (1,1) is (2,c_B); transfer–pullback is multiplication by [B]. | Retained determinant correction rather than multiplication by the degree. |
| `N.1/S-integers-localisation-of-torsion-class-group` — Torsion class-group localization | §1.1 | Finite class group; torsion infinite class group; infinite S | A power of each prime is principal; S need not be finite. | Kept torsion rather than finite as the sufficient hypothesis. |
| `N.1/S-integers-monotone` — Monotonicity in S | §1.2 | Empty S; S=T; adding (p) over ℤ | The canonical map is inclusion; denominators grow. | Specified localization maps and identity/composition. |
| `N.1/S-integers-in-a-finite-extension` — Finite S-integer extension | §1.2 | Quadratic E/F; T exactly above S vs an extra upper prime | Finite projectivity holds for the exact inverse-image set, not arbitrary T. | Made the inverse-image condition explicit. |
| `N.1/transfer-and-norm-on-units` — K₁ transfer | §1.3 | Quadratic extension and −1; identity and towers | Norm of the included −1 is 1 in degree two. | Specified unit inclusion and field norm, including the degree composite. |
| `N.2/localisation-sequence-for-a-dedekind-domain` — Dedekind localization | §2.1 | R a field, R=ℤ, empty support | Empty spectrum gives no residue summands. | Used genuine connective K/G comparison, not a fabricated boundary. |
| `N.2/finite-support` — Finite support | §2.1 | A single tame symbol; disjoint finite supports; infinitely many primes | Each element has finite support although the index set is infinite. | Retained direct sums and coordinate factorization. |
| `N.2/the-three-classical-rows` — Classical rows | §2.2 | DVR π; β{π,u}=ū and β{u,π}=ū⁻¹; unit ideal | Valuation and inverse-ideal signs agree. | Fixed β versus Tate’s inverse t explicitly. |
| `N.2/localisation-sequence-and-finite-extensions` — Transfer localization diagram | §2.3 | Totally ramified vs unramified quadratic places | Residue K₀ transfer factors are 1 vs 2. | Kept residue degree on transfer, not ramification index. |
| `N.2/S-unit-and-class-group-sequence` — S-unit and class sequence | §2.2 | ℤ and ℤ[1/p]; S=∅; nonprincipal inverted prime | Valuation quotient and class quotient have the expected kernels. | Reused existing arithmetic quotient maps; planned their K interpretation. |
| `N.2/even-degree-injectivity` — Even integral injectivity | §2.4 | n=0, n=2; a general exact sequence with a nonzero left boundary | Exactness alone does not imply injectivity; K₀ is excluded. | Kept the independent arithmetic injectivity theorem. |
| `N.3:finite-generation/finite-generation-of-K-of-S-integers` — Finite generation for finite S | §3.3 | n=0/1/2; S empty, one prime and infinite | All nonnegative degrees for finite S; F× gives a failure at infinite S. | Separated finiteness of S from arbitrary-S ring constructions. |
| `N.3:finite-generation/rank-filtration` — Rank filtration | §3.1 | Zero module; rank one over ℤ[√−5]; field | Q₀ contractible, nonfree projectives retained. | Named all rank-filter, exhaustion and stratum maps. |
| `N.3:finite-generation/layer-poset` — Proper layer poset | §3.1 | V=0; dim V=1; V=𝔽₂² | Empty, two points and eleven layers respectively. | Excluded (0,V); fixed the reverse first coordinate order. |
| `N.3:finite-generation/comma-category-is-the-layer-poset` — Comma-category comparison | §3.1 | Rank-one projective; nonfree rank-one ideal | The proper comma category has the two endpoint layers. | Specified pure-intersection inverse and equivariance. |
| `N.3:finite-generation/layer-poset-is-the-suspended-building` — Suspended building comparison | §3.2 | Ranks one and two; including the forbidden top layer | Rank one has reduced H₀=ℤ; forbidden top would contract it. | Retained unreduced suspension and reduced Steinberg convention. |
| `N.3:finite-generation/rank-spectral-sequence` — Rank spectral sequence | §3.2 | m=1,i=1; m=2,i=1/2; i<m | Relative groups use H_(i−m), with negative homology zero. | Used signed degree subtraction and isolated (0,0). |
| `N.3:finite-generation/quillen-finiteness-criterion` — Quillen criterion | §3.2 | Finite vs infinite Pic; torsion vs finitely generated Steinberg homology | Both finiteness inputs are required. | Kept the two hypotheses rather than a bare Dedekind claim. |
| `N.3:finite-generation/steinberg-homology-of-automorphism-groups` — Projective Steinberg input | §3.2 | Nonprincipal ideal over ℤ[√−5]; real GL₂ orientation | Untwisted duality cannot be substituted indiscriminately. | Imported orientation-correct R.1, not a second building theory. |
| `N.3:finite-generation/quillen-finite-generation-theorem` — Number-ring finite generation | §3.2 | n=0 and π₁BQ=K₀; BQ not simply connected | Connected H-space finite type allows nonzero π₁. | Kept the early H.3 supplier obligation. |
| `N.3:ranks/borel-rank-theorem` — Borel ranks for S-integers | §3.4 | ℚ vs ℚ(i), n=3/5; ℤ[1/p], n=1 | Ranks (0,1) vs (1,1); degree-one rank is separate. | Mirrored higher-rank parity witnesses in Lean. |
| `N.3:ranks/even-K-groups-of-S-integers-are-finite` — Finite positive even groups | §3.4 | n=2; n=0; infinite S | Finite generation plus rank zero applies only in the positive finite-S range. | Excluded K₀ and infinite S from the finiteness assertion. |
| `N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion` — Infinite torsion over F | §3.4 | K₂(ℚ); even degree vs K₁(F) | Residue direct sums are infinite torsion; F× is not torsion. | Retained positive even scope and residue-source argument. |
| `N.3/finiteness-and-ranks-combined` — Combined finite generation and ranks | §3.4 | r₁=1,r₂=0 and r₁=0,r₂=1; even n | No conclusion that finite generation means finite in odd free-rank cases. | Separated rank and torsion information. |
| `N.4/the-w-invariant` — Fixed twist W_i | §4.1 | i=0; i=1; ℚ at i=2 | W₀ is infinite; w₂(ℚ)=24. | Restricted finite-order statements to positive weight. |
| `N.4/computing-w-from-the-cyclotomic-character` — Odd-primary cyclotomic computation | §4.2 | ℓ=3, i=1/2; ℓ=2 | For ℚ the odd-primary part is trivial at i=1 and order 3 at i=2. | Excluded dyadic substitution in the odd-prime formula. |
| `N.4/exceptional-fields-at-two` — Exceptional fields | §4.3 | ℚ, ℚ(i), ℚ(√−7) | ℚ is exceptional, ℚ(i) nonexceptional; imaginary alone is insufficient. | Kept the cyclotomic-image definition distinct from specialness. |
| `N.4/w2-of-the-rationals-and-the-divisibility-tests` — Rational w-values | §4.4 | i=1,2,4,6,10 | Values 2,24,240,504,264. | Required positive weight and corrected the all-prime divisibility criterion. |
| `N.4/exponent-criterion` — Exponent criterion | §4.2 | Trivial cyclotomic image; cyclic image order dividing/not dividing i | The powered image, not just a chosen root, controls invariants. | Retained exact finite-exponent and maximality conditions. |
| `N.4/finiteness-of-the-w-invariant` — Finiteness of W | §4.1 | i=0 vs i>0; each primary and the prime support | Positive weight gives finite cyclic invariants; zero does not. | Kept the global finite-support step in addition to primary finiteness. |
| `N.4/two-primary-w-invariant` — Dyadic w-values | §4.3 | ℚ at i=1/2/4; field containing i; exceptional imaginary field | ℚ has dyadic orders 2,8,16; exceptionality changes the formula. | Separated the exceptional and nonexceptional formulas. |
| `N.5/totally-imaginary-integral-structure` — Imaginary odd integral table | §5.3 | ℚ(i), n=3/5; n=1 | K₃=ℤ⊕ℤ/24; higher formula cannot compute K₁. | Required n≥3 and retained abstract splitting language. |
| `N.5/the-real-case-modulo-eight` — Real odd integral table | §5.4 | ℚ, n=3/5/7/9; two real places | Real dyadic factors depend on n mod 8 and r₁. | Kept the nonsplit extension behind the abstract table. |
| `N.5/soule-theorem` — Soulé odd localization | §5.1 | n=1 vs n≥3; S=∅ and adding one prime | K₁ inclusion is not onto; higher odd localization is an isomorphism. | Made the degree-one exception explicit. |
| `N.5/soule-mod-l-surjectivity` — Coefficient boundary surjectivity | §5.1 | m=2,3,4,8; safe modulus then reduction | A safe product argument does not construct unsafe coefficient rings. | Retained spectrum coefficients and projection-formula supplier. |
| `N.5/e-invariant` — e-invariant | §5.2 | ℚ, n=5; totally imaginary field; inclusion to a separable closure | Actual torsion map can have dyadic cokernel with real places. | Specified equivariant Suslin normalization and transport. |
| `N.5/harris-segal-summand` — Harris–Segal detection | §5.5 | A cyclic summand abstractly vs a specified detected map | An abstract group decomposition chooses no natural summand. | Preserved the original-proof/wreath-product supplier obligation. |
| `N.5/odd-torsion-at-a-prime-where-cd-is-two` — Odd primary structure in cd two | §5.3 | Odd ℓ with real places; ℓ=2 for imaginary and real fields | Real dyadic case is outside the uncorrected formula. | Kept the prime/cohomological-dimension hypotheses. |
| `N.6/even-groups-at-odd-primes` — Even primary H² comparison | §6.1 | K₂(ℤ){3}=0; real ℚ at ℓ=2 | Odd-prime comparison works; real dyadic needs a correction. | Inverted ℓ first and distinguished integral from primary groups. |
| `N.6/the-two-primary-corrections` — Real dyadic integral groups | §6.3 | n mod 8 =0,2,4,6; K₄ of ℚ(√7) | The hidden degree-four factor can be nonzero. | Retained ρ and modified H²; did not identify all rows with H². |
| `N.6/tame-and-wild-kernels` — Tame and raw wild kernels | §6.7 | Degree two vs higher; full completion vs finite local quotient | Raw vanishing implies symbol vanishing; converse needs a theorem. | Renamed the full-completion object rawWildKernel. |
| `N.6/order-certificate` — Order certificate | §6.14 | Empty presentation; ℤ/4↠ℤ/2; K₂(ℤ) | Spanning plus relations alone gives only an upper bound. | Required an independent quotient of matched finite order. |
| `N.6/certificate-driven-computation` — Cohomological certificate constructor | §6.14 | Empty prime set; K₂(ℤ); real K₄ hidden factor | The full primary orders, not ranks, are needed. | Included 2^ρ in the real degree-four lower bound. |
| `N.6/even-groups-of-a-totally-imaginary-field` — Imaginary integral even groups | §6.1 | Gaussian field, all positive even degrees; degree zero | Finite direct sum of primary H² groups, not an infinite product. | Kept finite primary support and excluded n=0. |
| `N.6/even-groups-modulo-l` — Even mod-ℓ groups | §6.1 | ℓ=3 vs ℓ=2 with real places; principal ℓ-prime | Kummer quotient needs Brauer control. | Did not infer it from Picard data alone. |
| `N.6/l-rank-from-class-group-data` — Even ℓ-ranks from class groups | §6.1 | One vs multiple primes over ℓ; ℓ=2 | The s−1 Brauer contribution survives with multiple primes. | Retained the exact one-prime and twist hypotheses. |
| `N.6/signature-defect` — Signature defect | §6.2 | ℚ with dyadic S; eventual enlargement; ordinary vs narrow class groups | j=0 for ℚ; j can be positive, then eventually zero. | Named signatureDefect and its monotone/enlargement API. |
| `N.6/order-ratio-for-totally-real-fields` — Totally real order ratio | §6.5 | ℚ at weights 2 and 4 | Ratios are 1/12 and 1/120, including the dyadic H² factor. | Kept the corrected H² term in the six-mod-eight argument. |
| `N.6/divisible-subgroup` — Divisible elements | §6.6 | ℚ, ℤ, ℤ/4, ℚ/ℤ; an infinite 2-primary presentation | div can be finite nonzero and not divisible as a group. | Defined intersection of ambient multiplication images, not divisible hull. |
| `N.6/divisible-subgroup-and-the-wild-kernel` — Div and symbol kernel | §6.12 | ℚ; ℚ(√−14), odd i; i even | The special odd case has quotient ℤ/2. | Stated the symbol theorem and retained the raw comparison boundary. |
| `N.3:finite-generation/function-field-steinberg-finiteness` — Function-field Steinberg homology | Scope | Characteristic-p function field vs number field | Outside the main packet’s explicit inheritance policy. | Not packaged; no target silently claimed proved. |
| `N.3:finite-generation/affine-curve-finite-generation` — Affine-curve finite generation | Scope | Affine curve over a finite field | Outside number-field package scope. | Not packaged; historical packet entry retained only in this inventory. |
| `N.3:finite-generation/proper-curve-finite-generation` — Proper-curve finite generation | Scope | Proper curve over a finite field | Outside number-field package scope. | Not packaged; requires its own owner. |
| `N.6/keune-cyclotomic-picard-injection` — Keune injection | §6.13 | p=2; ramified p; twisted invariants vs coinvariants | Those substitutions do not state the required map. | Kept exact original-source/hypothesis translation as an obligation. |
| `N.2/ramified-residue-pullback` — Ramified residue pullback | §2.3 | e=2,f=1 vs e=1,f=2; 2∈𝔽₅×; two primes above v | Restriction factors are 2 vs 1; multiplicative 2↦4 at e=2. | Named coordinate, support, uniqueness and tower laws. |
| `N.2/ramification-weighted-devissage` — Ramification-weighted dévissage | §2.3 | B/vB with two filtration factors; nonreduced B/w² | It is a map on support K-theory, not a K(B/w²) decomposition. | Specified additivity on exact subquotient functors. |
| `N.2/finite-extension-restriction-compatibility` — Full restriction diagram | §2.3 | Tame symbol with e=2; unramified residue extension | Boundary square uses extension and e; transfer uses f. | Retained contravariant map direction throughout. |
| `N.2/low-degree-ramified-restriction` — Low ramified restriction | §2.2–2.3 | Uniformizer divisor; β{π,u}; rank zero class | Divisor multiplicities and tame powers both use e. | Tied all low-degree comparisons to the same dévissage square. |
| `N.2/s-integer-restriction-compatibility` — S-integer restriction in towers | §2.3 | e=2 then e=3; removal of an inverted coordinate | Weights multiply to 6; discarded coordinates stay discarded. | Kept compatible inverse-image prime sets. |
| `N.3:finite-generation/relative-rank-homology-comparison` — Relative rank comparison | §3.2 | m=1,i=1; m=2,i=1/2 | Shifts give H₀ and zero in the expected degrees. | Used integer subtraction and the mapping-cone shift. |
| `N.3:finite-generation/rank-homology-stability` — Rank homology stability | §3.2 | m=i vs m=i+1; H₀ at m=0 | Boundary is surjective at m=i, an isomorphism only at m≥i+1. | Kept both separate bounds, not GL stability bounds. |
| `N.3:finite-generation/rank-filtration-homology-finite-type` — Finite-type rank homology | §3.2 | Q₀; finitely many nonfree projective classes; total degree zero | Finite sums in each rank and induction are required. | Retained finite Pic and orientation-correct Steinberg input. |
| `N.3:finite-generation/quillen-homotopy-finite-type` — Homotopy finite type | §3.2 | π₁BQ=K₀≠0; connected H-space vs arbitrary space | A simply connected-only theorem cannot apply directly. | Specified Serre’s covering/loop route and early H.3 extension. |
| `N.3:finite-generation/s-localization-finite-defect` — Finite localization defect | §3.3 | n=0,1,2; finite vs infinite S | K₀ may lose class information; K₁ gains free units; theorem starts at n≥2. | Kept finite kernel/cokernel at the correct range. |
| `N.3/finite-rank-Q-homology` — Finite rank-Q homology | §3.2 | m=0,1; nonfree rank-one lattice | Q₀ gives ℤ in degree zero; finite Pic controls rank-one classes. | Unified overlapping finite-stage targets without losing hypotheses. |
| `N.3/rank-filtration-homology-stability` — Stable rank homology maps | §3.2 | m=i and m=i+1; finite-stage vs exhausted target | Same surjectivity/isomorphism bounds for both inclusions. | Kept the actual maps and their comparison. |
| `N.3/stable-Q-homology-finite-type` — Stable Q homology | §3.2 | Filtered union of Q_m; arbitrary filtered union of groups | Eventual stability is used; arbitrary colimits of FG groups need not be FG. | Did not infer finite type from colimits alone. |
| `N.3/finite-S-localisation-defect` — Finite-S defect | §3.3 | K₀ class quotient; K₁(ℤ[1/p]); K₂ finite | Higher-degree residue terms are finite for finite S. | Excluded n=0/1 from the finite-defect theorem. |
| `N.3/canonical-rational-S-integer-equivalence` — Rational S-integer equivalence | §3.3 | n=2, n=5 over ℚ; S=T | Even rational spaces are zero; degree-five actual localization remains specified. | Used LinearEquiv.ofBijective on the localization map. |
| `N.3/canonical-rational-equivalence-map` — Map retained by rational equivalence | §3.3 | Multiplication by 2 on the degree-five rational line | It is an abstract equivalence but not the required localization equivalence. | Added this negative control and forward/inverse uniqueness laws. |
| `N.3/rational-localisation-extension-transfer` — Rational restriction and transfer | §3.3 | Identity field extension; quadratic extension and projection formula | Naturality squares use the same maps, not arbitrary chosen isomorphisms. | Named scalar-extension and transfer compatibility. |
| `N.5/primary-bockstein-localisation` — Primary Bockstein | §5.2 | j=2 vs j=1; ℓ=2/3; coefficient degree 2j | The connecting map lowers degree by one; j≥2 is essential. | Used spectrum coefficients and finite-S transport. |
| `N.5/e-invariant-descent-edge` — Descent edge equals e | §5.2 | Imaginary dyadic vs real dyadic field; odd ℓ | Equality of maps persists when the real edge is not an isomorphism. | Retained the normalized map, not just equal cardinalities. |
| `N.5/diagonal-extension-normal-form` — Diagonal extension normal form | §5.4 | w=8,r=1/2; w odd; r=0 | Allowed cases yield ℤ/16 and ℤ/16⊕ℤ/2; hypotheses exclude the others. | Kept even w, positive r and nonsplitting. |
| `N.5/real-e-invariant-extension` — Real e extension | §5.4 | One and two real places; n=3 | Every coordinate pushout has the nontrivial extension class. | Distinguished natural exact sequence from noncanonical decomposition. |
| `N.5/e-invariant-kernel-cokernel` — e kernel/cokernel table | §5.4 | ℚ, n=3/5/7; ℚ(√−7), n=5 | At ℚ,n=5 the source torsion is zero and W₃{2}=ℤ/2; imaginary exceptional case is an isomorphism. | Removed any exceptionality criterion from this real-place table. |
| `N.5/edge-normalised-chern-torsion` — Edge-normalized Chern torsion | §5.2 | ℚ,n=5; primary W_j{ℓ} vs full W_j | Target H¹ torsion is ℤ/2 in that dyadic example and c_edge has zero image. | Identified δ on the primary subgroup, not on all of W_j. |
| `N.6/arithmetic-mod-two-dimensions` — Ordinary mod-two dimensions | §6.4 | ℚ[1/2], r₁=s=1,t=j=0 | H¹ has dimension 2, H² dimension 1. | S counts inverted finite primes; real places are separate. |
| `N.6/modified-mod-two-dimensions` — Modified mod-two dimensions | §6.4 | Same rational input; ordinary vs modified H² | Modified H¹ has dimension 1 and modified H² dimension 0. | Kept modified and positive cohomology distinct. |
| `N.6/mod-two-coefficient-orders` — Mod-two coefficient orders | §6.4 | Rational n=2/4; extensions of ℤ/2 by ℤ/2 | Log-cardinality need not be a vector-space dimension. | Kept order exponents and extension data separate. |
| `N.6/even-two-rank-function` — Numerical evenTwoRank | §6.4 | n=0, odd n; s=0 vs s≥1; real pair (r,s,t,j)=(2,1,0,1) | Numerical totalization works; arithmetic meaning requires positive even n and dyadic S. | Mirrored two arithmetic rank witnesses in Lean. |
| `N.6/even-two-ranks-from-arithmetic` — Arithmetic two-ranks | §6.4 | ℚ[1/2], n=2/4; a second inverted prime | Ranks 1/0; each extra inverted prime adds one. | Did not assign cyclic orders from a rank. |
| `N.6/finite-coefficient-divisibility-kernel` — Full finite-coefficient kernel | §6.6 | m=1; m not annihilating T; m annihilating T | Only the annihilating m≥2 statement identifies the full kernel with div. | Restored the full coefficient kernel and V.6.8.2 p.413 locator. |
| `N.6/stabilisation-of-primary-kernels` — Primary stabilization | §6.6 | Finite descending subgroup sequence; repeated values before a later drop | Stabilization exists, but a single repeated step is no stopping certificate. | Did not promise a bound from \|T\| alone. |
| `N.6/positive-even-k-subgroup` — Positive even subgroup | §6.7 | i=1 vs i=2; no real places; S-integer preimage | Real symbols enter only at i≡1 mod 4. | Kept this K-positive group separate from positive cohomology. |
| `N.6/local-symbol-family` — Finite local symbols | §6.7 | Real vs finite places; higher local divisible torsion | The finite quotient discards information in the full local K-group. | Constructed a product map first; finite support is a theorem. |
| `N.6/symbol-wild-kernel` — Symbol wild kernel | §6.7 | No real places; applicable real symbols; raw completion kernel | Symbol kernel lies in positive K and can differ from raw a priori. | Used distinct names and the exact product kernel. |
| `N.6/global-moore-sequence` — Global Moore sequence | §6.8 | i=1; real symbols included/omitted; one supported coordinate | Finite support and the final invariant-sum relation are both needed. | Corrected the source to Lemma 0.3 and Corollary 0.4. |
| `N.6/primary-s-integer-moore-sequence` — Primary S-integer Moore sequence | §6.8 | S exactly above ℓ vs an extra prime; ℓ=2 with real places | Only the specified inversion preserves the primary even group. | Kept real local factors exactly in the applicable congruence. |
| `N.6/orders-of-symbol-wild-kernels` — Wild-kernel orders | §6.8 | One inverted finite prime; ℚ at i=1; real factor 2^r₁ | Alternating products come from exactness, not an analytic assigned order. | Included the real multiplier in the alternative middle term. |
| `N.6/cohomological-wild-kernel` — Cohomological wild kernel | §6.9 | Finite vs continuous coefficients; enlarging S; ordinary vs modified H² | Strict zero local conditions define the kernel; inverse limits need control. | Named S-independence and finite-level comparison as theorems. |
| `N.6/symbol-cohomological-comparison` — Symbol/cohomological comparison | §6.9 | i≡2 mod 4 and real F; totally imaginary F | The real hidden kernel survives in the exceptional row. | Retained C_(F,i) and ρ rather than suppressing them. |
| `N.6/special-number-fields` — Special number fields | §6.10 | ℚ, ℚ(i), ℚ(√−14); exceptional vs special | ℚ is nonspecial; √−14 is a special imaginary example. | Named IsSpecial and kept dyadic local conditions. |
| `N.6/special-dyadic-decomposition` — Dyadic decomposition test | §6.10 | All proper Z_v vs some Z_v=G; small m | ρ₁ is zero vs split onto ℤ/2; m must be sufficiently large. | Excluded m=1,2 and required the nontrivial cyclotomic extension. |
| `N.6/twisted-residue-norm-test` — Twisted finite norm | §6.10 | m=4,q^i=3; m=8,q^i=3 | Norms 0 vs 4 induce zero vs an isomorphism. | Separated twisted-root norm from finite-field multiplicative norm. |
| `N.6/hilbert-local-norm-certification` — Hilbert norm certificate | §6.11 | ℝ,m=2 with (−1,−1) and (−1,+1) | First is nontrivial; positive numbers are norms from ℂ. | Used only the degree-two local-symbol supplier. |
| `N.6/cyclotomic-class-group-descent` — Cyclotomic Picard descent | §6.11 | H₁(G,M⁰) nonzero; ordinary vs narrow Pic | Coinvariant exactness has a defect term; real case uses positive H². | Retained the H² descent hypothesis and named comparison maps. |
| `N.6/cyclotomic-divisible-image` — Picard image of divisible elements | §6.11 | Odd ℓ; even twist; exceptional odd dyadic twist | The final branch requires a compatible prime prescription. | Recorded the precise source-proof obligation, not a blanket closure. |
| `N.6/imaginary-nonexceptional-comparison` — Imaginary equality branches | §6.12 | Imaginary nonexceptional; i even; odd primary | The specified branches have equality without the special odd obstruction. | Kept the independent cases separate from the defective prescription. |
| `N.6/imaginary-special-obstruction` — Imaginary special obstruction | §6.12 | ℚ(√−14), odd i; nonspecial F | Special odd quotient is ℤ/2; no splitting follows. | Retained the obstruction and image-theorem dependency. |
| `N.6/real-motivic-obstruction` — Real motivic obstruction | §6.12 | Odd vs even weight; real F; ordinary vs positive H² | Real corrections remain before comparison to K. | Kept Proposition 7.6 and the odd-weight defect separately. |
| `N.6/hidden-real-k-classes-are-divisible` — Hidden real classes | §6.12 | Degree-four class over ℚ(√7); finite subgroup of ambient div | Ambient roots do not make the finite subgroup divisible internally. | Specified C⊆div K and retained the ambient group. |
| `N.6/weibel-symbol-divisibility-theorem` — Weibel symbol theorem | §6.12 | ℚ,i=1; special imaginary odd i; even i | Only special odd case has the order-two quotient. | Kept the main target while exposing the precise missing image argument. |
| `N.6/raw-and-symbol-kernel-boundary` — Raw/symbol boundary | §6.12 | i=1 uniquely divisible local kernel; i≥2 local Q_p/Z_p | Torsion has zero image in the first kernel, not automatically the second. | Required global-to-local vanishing for higher equality. |
| `N.6/arithmetic-evidence-for-certificates` — Arithmetic certificate evidence | §6.14 | K₂(ℤ); real K₄ hidden factor; two-rank alone | Only proved full primary orders can certify the lower quotient. | Named projection, matched-cardinality and real-correction interfaces. |
| `N.7/bernoulli-conventions` — Bernoulli conventions | §7.1 | B₁; topological indices 1,2,5,6; k=0 | 1/6,1/30,5/66,691/2730; positivity excludes k=0. | Reused bernoulli and bernoulli′ rather than another arithmetic sequence. |
| `N.7/w-invariant` — Bernoulli w formula | §7.1 | B₂/4, B₄/8, B₆/12, B₁₀/20; odd i | Denominators 24,240,504,264; odd weights handled separately. | Separated even formula from all-positive-weight prime criterion. |
| `N.7/regular-prime` — Regular-prime predicate | §7.2 | p=2,3,37; p=0,1, composite | 2 and 3 regular, 37 irregular; nonprimes lack the interpretation. | Explicit prime hypotheses; no Vandiver condition in the definition. |
| `N.7/kummer-criterion` — Kummer criterion | §7.2 | p=3 empty range; p=37,k=16; p=5,k=5 for divided denominator | B₃₂ detects 37; B₁₀/5=1/66 tests cancellation. | Kept finite criterion, all-index congruences and divided denominators distinct. |
| `N.7/eigenspaces-and-herbrand-ribet` — Character projectors and Herbrand–Ribet | §7.3 | ℓ=37,k=16; ℓ=3; integral denominator | Exponent 5 mod 36, not 31; ℓ−1 invertible only in the stated coefficients. | Kept the original-proof/twist supplier and correct character direction. |
| `N.7/residue-field-units-prime-to-l` — Cyclotomic residue units | §7.4 | ℓ=2,3; unique prime above ℓ | Orders 1 and 2 are prime to ℓ. | No regularity assumed for this arithmetic input. |
| `N.7/tame-kernel-vanishing-at-a-regular-prime` — Regular cyclotomic tame vanishing | §7.4 | ℓ=3 vs irregular 37; all positive even degrees | Regular primary even groups vanish; 37 gives nonzero even groups. | Kept ring rather than field K-theory and the one-prime Brauer step. |
| `N.7/regular-prime-torsion-consequences` — Regular-prime torsion and module | §7.4 | ℓ=3 degrees 0,3,1; ℓ=5 degrees 0,7,1,5 | Generator counts are 3 and 4; ℓ=3 needs coherent operations. | Retained the separate module proof rather than a mod-3 ring assertion. |
| `N.7/vandiver-separation` — Vandiver and integral table | §7.5 | K₂,K₃,K₄; 8a+1 at a=0; global vs finite-range hypothesis | K₂=C₂,K₃=C₄₈; K₄=0 unconditionally; K₁ not rank one. | Corrected c_(2a+2) index and separated unconditional K₄. |
| `N.8/certified-example-format` — Certified example format | §8.1 | Missing lower bound; relations without span; field identification | All proof-bearing fields are required. | Separated ArithmeticData from completed CertifiedExample. |
| `N.8/k-groups-of-the-integers` — First integer K-groups | §8.2 | Degrees 0,1,2,3,4 | ℤ,C₂,C₂,C₄₈,0 agree with supplied low-degree facts. | Did not use conditional global Vandiver for these entries. |
| `N.8/tate-norm-filtration` — Tate norm filtration | §8.3 | q=2,3; split prime pair with equal norm; S₀ units | All primes of a norm enter together. | Fixed t=β⁻¹ and old/new unit conventions. |
| `N.8/tate-criterion` — Tate criterion | §8.4 | q=2 trivial residue units; missing unit generator; a premature new prime | Criterion requires all residue and quotient witnesses. | Kept the complete unit quotient; residue order alone is insufficient. |
| `N.8/gaussian-tame-kernel-vanishes` — Gaussian Tate descent | §8.5 | q=5; ε=±1,±i; 2=(1+i)(1−i) | Eight nonzero congruence pairs cover the needed residues. | Retained both tied split primes and base-unit generators. |
| `N.8/gaussian-and-imaginary-quadratic` — Gaussian K₂/K₃ | §8.5,8.10 | Restriction of {−1,−1} to ℚ(i); w₂=24 | K₂(ℤ[i])=0 and K₃(ℚ(i))=ℤ⊕C₂₄. | Kept map-based vanishing and the independent odd arithmetic table. |
| `N.8/s-integer-sequence-for-one-inverted-prime` — One inverted rational prime | §8.2 | p=2/3; degree 2 and 4; odd degrees | K₄(ℤ[1/p])=C_(p²−1), hence C₃ at p=2. | Retained all degrees and did not assume even extensions split. |
| `N.8/the-rationals-infinite-against-finite` — K₂ of ℚ | §8.2 | Finite tame kernel C₂ vs infinite residue direct sum | Field K₂ is infinite torsion with div=0. | Separated ring and field computation. |
| `N.8/golden-congruence-lattices` — Golden congruence lattices | §8.6 | s=2/3; determinant-one stretch; t=q vs t<q; compact ball | Covolume is 5^(s/2)q^(s−1); old-unit argument needs strict t<q. | Used existing Minkowski with density bound one and explicit covolume. |
| `N.8/golden-residue-section` — Small residue section | §8.7 | q′ the next strictly larger norm; equal-norm split primes | Support must use only old primes; ties do not advance q′. | Kept the strict old-unit and nonzero-denominator conditions. |
| `N.8/golden-large-prime-cutoff` — Norm-33 cutoff | §8.7 | q=33 vs q>33; prime at norm 31 | Strict cutoff leaves eleven prime ideals to certify. | Used a proved weaker packing bound rather than an unverified optimal density. |
| `N.8/golden-finite-prime-certificates` — Eleven finite prime certificates | §8.8 | All 173 rows; 23 selected minors; corrupted sign/factor/order | Exact arithmetic passed; all three negative controls failed. | Included every integer witness and tied-prime order in the README. |
| `N.8/real-quadratic-upper-generation` — Golden upper generation | §8.9 | Base units −1,ε; relation 2g=0; premature 4−ε | Two order-two symbols generate after all residue steps. | Kept both upper generators and explicit descent relations. |
| `N.8/real-quadratic-example-and-birch-tate` — Independent golden K₂ certificate | §8.9 | Signs at ε>0 and ε′<0; generators {−1,−1},{−1,ε} | Sign vectors (1,1),(0,1) are independent over 𝔽₂. | Used sign lower bound, never Birch–Tate’s predicted order. |
| `N.3:finite-generation/number-ring-l-finite-generation` — Number-ring periodic L finiteness | §3.5 | ℤ; ℤ[1/2]; both signs; characteristic two excluded | Symmetric residues ℤ,C₂,0,0 differ from quadratic ℤ,0,C₂,0. | Kept all integer degrees and finite S. |
| `N.3:finite-generation/genuine-l-finite-generation` — Every genuine L/GW flavour | §3.5 | m=0 and m=1; negative and positive n | Ranges n≤2m−2 and n≥2m−1 cover every integer. | Required connective C₂-orbit finite type, not convergence alone. |
| `N.3:finite-generation/classical-gw-finite-generation` — Classical GW finiteness | §3.5 | n=0,1,2,3; real places; 2 not inverted | A comparison only above degree four is insufficient. | Retained the actual nonnegative classical comparison obligation. |
| `N.6/bott-cohomology-slot` — Bott slot convention | §6.15 | j=0 with both signs; j=−1 with both signs | Slots (0,0)/(2,1) and (2,0)/(0,−1); total degree 2j. | Mirrored sign/negative-degree witnesses in Lean. |
| `N.6/bott-adams-edge-splitting` — Canonical Adams edge splitting | §6.15 | Odd p including 3; p=2; an abstract split extension | Dualization projectors use 1/2; source and target Adams signs force the edge. | Kept the spectrum-level operation and excluded p=2. |
| `N.6/cyclotomic-bott-cohomology` — Cyclotomic Bott table | §6.15 | j=0,−1; p^r coefficient; ordinary Pic vs Bott Pic class | Pic contribution and dualization sign are twist-dependent. | Used published FGV Lemma 2.11 and Corollary 2.12 locators. |
| `N.6/rational-bott-cohomology` — Rational Bott table | §6.15 | j=0,−1; positive/negative pieces | Parity and χ twists retain meaning at negative degrees. | Used FGV Lemma 2.14, not a connective negative-K table. |
| `N.6/ordinary-to-bott-comparison-range` — Ordinary-to-Bott ranges | §6.16 | R→R[1/p], n=0/1/>1; full Bott comparison | Ordinary degree one has the extra ℤ/q term; Bott comparison holds in all integer degrees. | Retained the n=0 injectivity range and the degree-one exception. |
| `N.8/arithmetic-k3-examples` — Arithmetic K₃ examples | §8.10 | ℚ vs ℚ(i); ring vs field; inverse S localization | K₃(ℚ)=C₄₈ and K₃(ℚ(i))=ℤ⊕C₂₄. | Exported to K3BlochGroups without importing its Bloch comparison. |

### Additional conventions, Lean signatures and certificate laws

| Statement or convention | Instances tried | Result | Change |
| --- | --- | --- | --- |
| S counts finite inverted primes | ℤ, ℤ[1/p], ℤ[1/2,1/3] | Unit ranks 0,1,2 | Real places counted separately. |
| β versus t | {π,u}, {u,π} over a DVR | ū and ū⁻¹; t is inverse β | Kept both normalizations with named comparison. |
| Primary δ target | ℚ,n=5,ℓ=2 | W₃{2}=C₂ maps to H¹ torsion; K₅ torsion=0 | No full-W injection into a single primary cohomology group. |
| `sUnitSubmonoid` body | 1 and 0; p vs another prime for S={(p)} | 1 included, 0 excluded; only p-support in denominators | Uses actual IsUnit preimage; proved Lean unit/zero example. |
| `integer_isLocalization_iff` signature | Field R; empty S; M containing zero; arbitrary S | Empty height-one spectrum reduces to units; zero fails | Same general Dedekind scope in prose and Lean. |
| `integer_isLocalization_of_torsion_classGroup` | Finite and general torsion class group; infinite S | Power-principal argument does not use finite S | No unnecessary finite-S restriction in Lean. |
| `borelRank` and even theorem | ℚ vs ℚ(i), n=3/5; n=0/1 | Numerical totalization agrees; arithmetic theorem starts at n≥2 | Two proved parity/signature examples; degree one separate. |
| `divisibleSubgroup` membership/finite/ℤ targets | ℚ, ℤ/4, ℤ, zero group | ℚ gives top; the others bottom | Ambient n-smul images, not roots required inside div; two proved Lean examples. |
| `divisibleSubgroup` direct-sum law | ℚ⊕ℤ/4; arbitrary finitely supported tuple | Roots can use the same finite support | No illicit infinite-coordinate choice used. |
| `bottCohomologySlot` and total-degree theorem | j=0,−1 with both signs | (0,j) or (2,j+1), both total degree 2j | Two proved combined examples fix dualization parity. |
| `evenTwoRank` and add-prime theorem | n=0,2,4,6,8; s=0/1; odd n | Add-prime identity uses s≥1 and even n; arithmetic excludes n=0 | Lean and README both state the numerical identity at all even inputs; arithmetic range stated separately. |
| `bernoulliTop` | k=0,1,2; arithmetic B₄ negative | k=0 totalized −1; positive sequence only for k≥1 | Two proved Lean examples fix reindexing and sign. |
| `IsRegularPrime` and Kummer | p=2,3,37,1; k endpoint (p−3)/2 | Odd criterion excludes 2; range empty for 3; B₃₂ detects 37 | All theorem prime hypotheses explicit; nonprime definition has no interpretation. |
| Small regular-prime theorem | Every prime p<37, including 2 | Finite Bernoulli/class-number calculation target | Separate from all-index Kummer congruences. |
| OrderCertificate API | P=C₄,A=C₂; empty P; matched sign quotient | First is upper bound only; matched surjections force isomorphism | All relations, spanning and lower surjection are proof fields. |
| ArithmeticData / CertifiedExample | Bare field data; missing finite-group lower bound | Data alone does not certify a K-group | Exported comparison and checks are proof-bearing. |
| GoldenCongruenceLattice | s=2/3, t>0 and t<q, determinant-one stretch | Required compact convex symmetric ball; no zero denominator | Density ≤1 suffices; no unproved optimal-packing constant. |
| GoldenResidueSection | q=4/5; tied split primes | A norm tie is introduced in the declared order | No “old” factor uses a later prime. |
| GoldenFinitePrimeCertificate | All norm-4/5/9/11/19/29/31 prime ideals | 173 relations and 23 selected determinants checked exactly | Each quotient and integer lattice witness printed in README. |
| Golden upper/lower K₂ bounds | Two real embeddings, ε>0 and ε′<0 | Sign columns (1,1),(0,1) have determinant 1 mod 2 | Lower bound independent of Birch–Tate. |
| Hypothesis/`variable` scope of all 12 Lean theorems | Inspected each signature under its section variables | No hidden number-field assumption in general Dedekind targets, no free theorem variable | No theorem has its own conclusion as a hypothesis. |
| Canonical maps / quotients / divisions | Rational localization, Adams projector, lattice density, Bernoulli fractions | Domains explicit; p odd makes 2 invertible; positive q,t avoid zero | No chosen abstract equivalence substituted for a specified map. |

## Exact finite certificate verification

An independent scratch calculation used integer pairs [a,b]=a+bε, exact norm
`a²+ab−b²`, multiplication `[a,b][c,d]=[ac+bd,ad+bc+bd]`, and exact rational
Gaussian elimination for determinants. It checked primality/norm of all eleven
prime generators, residue-polynomial roots and multiplicative orders; every
relation’s A and B factorizations, `a−b=πw`, valuation-one witness and relation
vector; membership of every factor in the declared old-prime list; and the
selected minors’ gcd equal to q−1. No floating-point comparison was used.

| Norm and prime generator | Relation rows | Selected maximal minors |
| --- | ---: | --- |
| 4, [2,0] | 4 | 6, −3 |
| 5, [−1,2] | 3 | 4 |
| 9, [3,0] | 4 | 8 |
| 11, [3,1] | 15 | 60, −30, −10 |
| 11, [4,−1] | 12 | 70, −20 |
| 19, [4,1] | 14 | −54, −36 |
| 19, [5,−1] | 16 | 216, −18 |
| 29, [5,1] | 27 | −168, −224, 420 |
| 29, [6,−1] | 20 | 56, 28 |
| 31, [5,2] | 22 | 90, 60 |
| 31, [7,−2] | 36 | −180, −240, −90 |

All 173 rows and 23 minors passed. Negative controls changed the norm-four
minor −3 to −6, corrupted a quotient factorization and introduced 4−ε before
its declared turn; all three were rejected. The permanent auditable witnesses
are in the README; no deleted scratch script is a prerequisite for using it.

## Source versions and access

The README states results in original prose. No source passage or sequential
source summary is included. Public PDF text was read as data in scratch only.
No source text was treated as an instruction or run as code. No suspicious
instruction from untrusted material was encountered. The maintainer-cleared
library index was read; Washington is not cleared and no copy was used.

All K-book locators in the README use the combined 29 August 2013 author PDF;
its PDF page number is printed page +8. Separately updated V/VI chapters were
not mixed into its pagination. In particular V.6.8.2 is p.413; VI.8.3.2 p.514;
VI.9.12 p.525; the corrected conditional table is VI.10.2.1 p.528, with
c_(2a+2) in degree 8a+6 rather than the misindexed prose formula.
The Harris–Segal publication DOI was corrected to 10.2307/1970984.

Versions read include Kahn v3 (2 July 2014), Sun v1, Serre III §1 pp.465–466,
IV §3 p.479, IV §6 p.483 and V §§1–2 pp.489–491; Quillen §1 pp.179–185;
Putman–Studenmund v4 §§1/2.1; CDH+ v4 (28 April 2026) Corollaries 2.3.16,
2.3.18–19 pp.47–48; Bass–Tate in the actual LNM342 volume, II §3 pp.403–411
and Appendix pp.429–436; Groenewegen Lemmas 6/9/12 and Proposition 10
pp.1447–1453; Weibel’s wild preprint pp.1–3,9–15,17,19–21; CGZ v3 Lemma 3.5
p.20; published FGV pp.242–248, Proposition 2.9 and Lemmas 2.10/2.11/2.14,
Corollary 2.12. Later FGV arithmetic symplectic/Galois-action sections are
Part II, outside this package. Groenewegen’s public article PDF was read
through the indexed full text when the AMS host returned 403; the article’s
primary DOI is the README reference. The Harris–Segal original proof and Keune
original proof remain the access/proof obligations listed above.

SHA-256 identifiers of the principal downloaded source versions (not copies in
the repository):

| Source artifact/version | SHA-256 |
| --- | --- |
| Kbook.pdf | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| Kahn.pdf | `71b5da651ba9feca4c1abcc58f566afbf11019dda465cbc3a95aace7cb1e2406` |
| Sun.pdf | `c0585949df902e30b7368c235210e8b20a0dea344ed88a9e7a65577ec681e793` |
| Serre.pdf | `8bae9700e92a7de8569b2d9244e2f37e56de46d2cf21706c6f37171fd3e9e7f7` |
| PutmanStudenmund.pdf | `3421bcfaffc1e05198ae8323971872ca3774bd73c067077e94f46ed5d073d7ad` |
| CDHv4.pdf | `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c` |
| BassTate.pdf | `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55` |
| QuillenVolumeI.pdf | `9e10948869fcaf64251261294efddf3f4c13ec31838d9a89a7b5b96a4f0c933b` |
| Wild.pdf | `2675756fe4e03556dac1b26538eeca0fd1b8bf0ae7d800433a3c708812f3478b` |
| RognesWeibel.pdf | `9d770c079313ccc26f29da641d301269edf12985f122fd107ab201f086e8f446` |
| Handbook.pdf | `6c6368a61982eca8b05a44d521088c61d9c890a02454766a0ff5a6c1c6c831fe` |
| CGZ.pdf | `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5` |
| FGVpublished.pdf | `5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d` |

## Validation and next action

- `lean-check research/blueprint/packages/ArithmeticKTheory/Suggested.lean`
  passed (exit 0): twelve declaration-uses-sorry warnings, no other warnings
  or errors; all eleven examples are proved. The file is 194 lines.
- `python3 scripts/check_blueprint.py` passed for the main packet and all seven
  inherited number-field part packets: zero errors and zero warnings. Their
  existing proof/supplier gaps are preserved, not misreported as closed stages.
- `python3 research/blueprint/intake.py check-files` on the four deliverables
  passed: four files, zero problems. Final staged whitespace/scope checks
  confirm only the four authorized paths and no whitespace errors.

The next action is the independent package review. No other files, packets,
source books, library checkouts or roadmaps were edited. No second job will be
claimed by this run.
