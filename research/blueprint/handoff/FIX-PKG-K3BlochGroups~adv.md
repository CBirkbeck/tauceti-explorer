# FIX-PKG-K3BlochGroups~adv — issue #11063

Worker: Codex, GPT-6, session `codex-DXquWa`; 2026-10-19.
Branch: `codex-DXquWa-fix-k3-bloch`.

The five numbered package findings are addressed below. This is a completed
package repair, not an independent review or a claim that the theorems are
formalized. The representative Lean file elaborates. The mathematical
prerequisite supplements have exact statements and proof decompositions in the
README; their ownership and registration requests are recorded separately
below, as the issue permits. No supplier packet, original review, metadata,
upstream roadmap or atlas-generated file was changed. This repair does not
change any packet's closure status: their existing gaps and requests remain
recorded until maintainer integration.

## Finding dispositions

| Finding | Changes and proof inputs | Disposition |
| --- | --- | --- |
| 1. Hopf/Whitehead and the sphere unit | README §1.5 gives `wedgeTwoSpheres_pi3`, `hopfComposition_add`, `hopfHurewicz_exact`, and `sphereUnit_eta_minusOne`, with the pinch/Whitehead coefficient, the relative-Hurewicz diagram, and the multiplicative right-unit square. Existing finite Hilton input and BG/plus/Barratt–Priddy objects retain their owners. The transposition determinant is a proved Lean control. | Addressed; exact continuation brief A/B below. |
| 2. Integral Chern, characteristic torsion and weight zero | README §2.2 distinguishes the integral all-field diagonal from a rational character; gives the Izhboldin norm-obstruction induction rather than inferring zero from divisible torsion; separates degree-zero étale comparison from diagonal norm residue; includes every prime in closure K₄-divisibility. Existing K2SymbolsBrauer tensor/relation-divisibility nodes are imported explicitly. | Addressed; exact continuation brief C/D below. |
| 3. Unstable rank-two symbols | README §4.5 gives the five symplectic-symbol relations, conjugation action, coinvariant reduction to Milnor symbols, and the ordered torus/stabilization compatibility. It uses the infinite-field branch of Hutchinson Theorem 2.9 and Suslin 1984 §§2.6–2.7, rather than stable Matsumoto alone. | Addressed; exact continuation brief C below. |
| 4. Omitted d³ and separate monomial arguments | README §4.11 supplies the eight-term homogeneous lift, fixed Shapiro sections, its reduction modulo one explicit bar boundary, the mixed swap sign and the necessary change of splitting. §4.15 uses the readable Suslin 1991 Lemmas 4.1–4.4/Sublemma 4.4.1 instead of an unread LNM proof. It retains the C₃×C₃ Tor term, handles the 5-primary term, and gives the integral D₈ change of basis. | Addressed by local targets; symbolic identities and the retained light definitions checked. |
| 5. Finite actual maps | README §§5.2–5.5 decomposes stable elements, finite duality, cyclic maps, quaternion periods and symmetric stability. It proves extension-injectivity and finite stabilization through actual subgroup maps and the root detector; Sah is no longer an input. The refined presentation, boundaries, page, d², filtration, bar comparison, odd two-primary calculation and enhanced-Tor arrow are all explicit. | Addressed; general finite-group supplement belongs to brief B. |

All previous fixes remain: integral tensor diagonals, the corrected exercise,
the distinction between modulo and genuine finite coefficients, the inverse
Chern scalar, the arbitrary-field/invertible-coefficient scope of §6.7,
ArithmeticKTheory N.7's Gaussian computation, the conditional all-curve
statement, and finite witness existence without a synthesis algorithm. Bloch's
uncleared monograph remains an unverified attribution, not a proof input.

## Maintainer routing: exact additional modules

These are mathematical briefs for registration, not invented existing stage
identifiers. The issue restricts edits to this package and its handoff and
explicitly permits a maintainer note when a new roadmap is needed. Register the
supplements below, then point the consumer packet requests at their final IDs;
do not treat this package edit as registration or mark the old packets closed.
No additional issue was claimed or supplier file edited.

**A. AlgebraicTopology continuation: oriented Hopf composition and Hurewicz.**
The existing Part II already has
`AlgebraicTopologyPartII:AT2.4/hilton-wedge`. Keep that finite Hilton theorem at
its owner; the new module adds its oriented low-degree refinement, arbitrary
wedge index sets and the H-space consequence. Do not duplicate the general
Hilton theorem or its tame-polynomial applications. Its exact targets are:

- `wedgeTwoSpheres_pi3`: π₂(∨ᵢS²)=⊕ᵢℤ and π₃ generated freely by oriented
  Hopf components and unordered-pair Whitehead products, for any index set.
  README §1.5 gives a direct low-degree product-pair proof and the finite-support
  passage, avoiding dependence on the tame-bouquet application or an unread
  full Hilton proof.
- `hopfComposition_add`: for every based H-space, Whitehead products of π₂
  classes vanish and precomposition with the chosen η is an additive natural
  map π₂→π₃. Record the pinch formula before killing its Whitehead term.
- `hopfHurewicz_exact`: for a simply connected based H-space of CW type,
  π₂ —η→ π₃ → H₃ → 0 is exact, with no freeness hypothesis on π₂. Use the
  mapping-cylinder pair argument of §1.5.

Prerequisites: existing AlgebraicTopology CW pairs, products, relative
homotopy/Hurewicz (Stage 8), and covering-space interfaces. Sources: Hatcher
Examples 4.51–4.52, pp.380–381 and Exercise 37, p.392. Consumer:
K3BlochGroups §1.5, then §§2.4 and 5.3. The final ordinal/name should account
for the already registered AlgebraicTopology Part II.

**B. StableHomotopyKTheory continuation: the multiplicative unit and finite
periodic homology.** Its existing Part II is the Segal/Tate–Frobenius roadmap;
these requests must not silently be assigned to its PO stages. Two modules:

- Unit module: `sphereUnit_eta_minusOne` and
  `hopf_eq_minusOneProduct`, with StableHomotopyKTheory §§5.42, 6.3, 7.1 and
  GeneralAlgebraicKTheory §1.8 as prerequisites. The finite-set self-braiding
  maps to the transposition in GL₂(ℤ), hence [−1]; the right-unit square
  identifies stable η-action with K₂(A)×K₁(ℤ) for every associative unital A,
  including the zero ring. Source: Weibel IV.1 Exercises 1.11–1.12(a),(e),
  pp.14–15. Consumer: §1.5.
- Finite-group module: the six targets `finiteGroup_stableElements`,
  `finiteGroup_homologyDuality`, `cyclicHomology_maps`,
  `quaternionPeriodicHomology`, `finiteGroup_period_fromSylow` and
  `symmetricGroup_homology_stable` have their full hypotheses and map
  normalizations in §5.2. Stable elements is in every n≥0 over ℤ₍ᵣ₎;
  duality requires d≥1; cyclic odd-degree maps include both powers and
  different-order subgroup inclusions; quaternion groups have s≥3; Swan's
  period statement assumes r divides the group order; symmetric stability is
  n≥2i, including i=0. Build the quaternion norm-spliced complete resolution
  and Tate period class before using periodicity. Consumer: §§4.15, 5.2–5.5.

Import existing finite-index transfer, Shapiro, Sylow restriction injectivity,
and the all-degree profinite Mackey theorem. The finite discrete/ordinary
cochain comparison must preserve restriction, conjugation and corestriction.
Import Mathlib's cyclic norm-resolution homology; only its generator/map
comparison is new. The supplied proof order is stable elements → cyclic and
quaternion period classes/duality → finite SL₂ and extension maps. Symmetric
stability separately uses Kerz's injective-word complex. Neither generalized
Segal nor a new generic Mackey construction is requested.

**C. K2SymbolsBrauer continuation: symplectic symbols and characteristic-primary
Milnor torsion.** Two modules, both building on existing T.2:

- `unstableSL2_symplecticPresentation`,
  `unstableSL2_coinvariantPresentation`, `unstableSL2_orderedTorus` and
  `unstableSL2SymbolCoinvariants` as specified in §4.5. Infinite fields;
  H₂(SL₂) coinvariants under diag(c,1) conjugation; comparison to the actual
  ordered diagonal bar cycle and stabilization, not just an abstract group
  isomorphism. Source: Hutchinson Theorem 2.9/proof, pp.9–10, and Suslin 1984
  §§2.6–2.7, pp.195–196. Consumers: frame retraction/stability, §§4.5–4.8.
- `milnor_charPrimary_torsionFree`, for every characteristic-p field and all
  n≥0. Its key `artinSchreier_torsion_normKernel` is stated for the universal
  F(x)/F(xᵖ−x) base-change family used in the induction. §2.2 gives P/I,
  p-divisibility of I, logarithmic-form descent, norm-generating extensions,
  and the final shift-invariant leading coefficient. Sources: Weibel III.7.8,
  pp.67–68, Exercises 7.12–7.13, p.73, and III.6.6.2 for the restricted norm
  argument. Inputs include existing Bass–Tate, norms and
  `MotivicEtaleKTheory:M.5d/milnor-torsion-divisible`; the latter is not the
  conclusion. Consumer: §2.2 characteristic two.

Do not replan the existing
`K2SymbolsBrauer:T.2:symbols/field-proof/tensor-divisibility` or
`relation-divisibility` nodes. Their read statements already prove the
algebraically closed unique-divisibility input for n≥2, including inseparable
root multiplicities.

**D. MotivicEtaleKTheory continuation: integral full-field normalization.**
The three targets in §2.2 are:

- `integralChern_milnor_diagonal`, all fields and i≥1, with coefficient
  (−1)ⁱ⁻¹(i−1)!, hence +2 in degree three. Reuse M.6's integral universal
  Chern construction, SchemeKTheoryOperations' projective-bundle/simplicial
  inputs and the Milnor/motivic identification. Add the integral product
  normalization and continuity square over smooth prime-field models. A
  rational normalization is insufficient.
- `weightTwo_degreeZero_modTwo`, char≠2: the injection into finite étale
  degree-zero cohomology, compatible with closure, then the exact-sequence
  proof of H⁰(F,ℤ(2))/2=0. Use the early finite motivic/étale comparison;
  diagonal norm residue alone is not its statement.
- `algebraicClosure_K4_allPrimeDivisible`, every algebraically closed field
  and every prime. Reuse rigidity, Bott finite coefficients, Harris–Segal
  torsion and finite-field continuity, retaining the prime equal to the
  characteristic and r=2. GeneralAlgebraicKTheory §§13.8a–c supplies the
  finite computation, independently of unstable SL₂.

Sources: Weibel V.11.3/11.11–11.13, pp.81–87 and VI.1.3–1.6, pp.2–5.
Consumer: §2.2; the final finite Chern isomorphism remains local to §6.7.
Existing M.6 has smooth finite-type perfect-base hypotheses and a rational
higher character; this brief requests the additional integral all-field
contract, not a second universal Chern construction.

## Library and upstream audit

Compared the read-only current upstream tree at
`0d144d044dacebca17b654695b6f1ad58f159b27` with the atlas materials and
current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Inspected
AlgebraicTopology and ProfiniteArithmetic as current models and the accepted
PadicMeasuresIwasawaAlgebras exemplar. The newer roadmaps and completed tree
were searched by mathematical objects; no matching Hopf-unit or finite-period
construction was found. AlgebraicTopology Part II's finite Hilton statement
was also inspected, with the distinction in brief A preserved.

- Mathlib `Rep.FiniteCyclicGroup.groupHomologyIsoOdd` / `groupHomologyIsoEven`
  already supply the cyclic norm complex for arbitrary representations over a
  commutative coefficient ring. They are cited, not rebuilt.
- Current Tau Ceti Shapiro `indIso_inv`, transfer's index/naturality and
  transitivity, connecting-map `δ_naturality`, and finite-cyclic carry-class
  formulas keep their owners.
- `TauCeti.ContinuousCohomology.corestriction_mackey` already covers all
  degrees, open/closed subgroups of a profinite group and discrete modules.
  The needed addition is the finite discrete comparison and stable-elements
  deduction, not Mackey itself.
- GeneralAlgebraicKTheory upstream PR #1212 was read at
  `67c1f583452d1a6cf255f200a2261340490fc894`: §1.8 owns external products;
  §§13.8a–c own Quillen's finite computation. KTheoryFiniteLocalFields L.1
  owns its functorial finite-field interfaces. The README now distinguishes
  these owners.
- No higher-tier analytic or quantum comparison enters the Suslin proof.
  No generic construction was moved into K3BlochGroups, and no upstream or
  supplier file was edited. The additional modules above need maintainer
  routing; their proposed names are not baseline declarations.

## Adversarial pass on every touched family

Rows include the named APIs, hypotheses, quotient/field maps and their
identity/composition cases. Statements about fields retain nontriviality;
q=1 is excluded. Zero rings occur only in ring-level claims. There is no DVR,
compactness or unit-ideal hypothesis in these algebraic field statements.

| Statement family / interfaces | Instances and obstruction tested | Result / change |
| --- | --- | --- |
| External product supplier and finite Quillen owner | General noncommutative unital A; zero ring; positive degrees; actual current PR outputs | Product is the external right ℤ-unit product; finite computation precedes all finite unstable comparisons. |
| Wedge π₂/π₃ and oriented Hopf components | Empty index set, one sphere, two spheres, infinite index set | Empty gives zero; one gives ℤη; two gives ℤ³ including the Whitehead generator. Compact source maps/homotopies pass through finite subwedges. |
| Hopf additivity/naturality | Fold of S²∨S²; negative class; arbitrary based H-space | Pinch has Whitehead coefficient +1; multiplication kills that term, then η is additive and natural. No homotopy commutativity is assumed. |
| Hopf–Hurewicz and elementary cover | π₂=0, X=K(ℤ,2), K(ℤ,3); nonfree π₂ | Exact relative diagram yields the kernel and surjection; no free π₂ hypothesis was inserted. Cover's zero-ring/unit checks retained. |
| Sphere-unit η and minus-one product | Integral transposition; characteristic two; zero ring | det transposition=−1 is proved in Lean. Scalar is +1 in characteristic two, hence its K₁ class is zero. Uses the actual right-unit square. |
| Integral Chern diagonal / continuity | i=1,2,3; symbol {2,3,5}; imperfect characteristic-p fields | Coefficients +1,−1,+2; smooth perfect-prime-field models and integral product continuity, not rational inversion of two. |
| Characteristic-primary Milnor torsion and norm kernel | n=0/1/2; F₂(t₁,t₂,t₃); Prüfer 2-group negative control | K₀=ℤ and Fˣ cases elementary; higher proof uses P/I and leading coefficient. Divisible primary torsion alone is never used to imply zero. Universal Artin–Schreier family stated without assuming the later general Hilbert 90 result. |
| Imported Milnor unique divisibility | n=0/1 excluded; n≥2; repeated roots in characteristic p | Existing relation-divisibility node, rather than an unowned exercise, supplies injectivity as well as surjectivity. |
| Degree-zero comparison and closure K₄ | char≠2; Ω=F̄₂; characteristic zero r=2; r=char Ω | Closure comparison on µ₂² is the identity; all-prime K₄-divisibility kills the quotient without assuming Milnor injectivity. |
| Motivic quotient edge | Zero representative, decomposable class, identity/composite field embedding | Existing representative formula and natural quotient equivalence retained; right exactness alone suffices. |
| Unstable symplectic presentation / coinvariants | a=1 or b=1; inverse swap; Steinberg relation; infinite real field | Coinvariants force bilinearity and Steinberg; real {-1,-1,-1} normalization is one, not two. Does not apply the infinite SL₂ presentation to a small finite field. |
| Frame retraction and ordered torus | n=1, n=2, multiply a Steinberg-null class by further units | Actual ordered torus map supplies the rank-two step before stability; no circular use of stable Matsumoto. |
| Face matrices and bar lift | a=2,3 over ℚ; a=0/1 excluded; a=2 over F₃; characteristic two | Determinants 1−a,a(1−a),a; Lean examples include the exclusions and F₃. Generic eight-term boundary verified as an equality of chains modulo the stated diagonal transport. |
| Shapiro/bar reduction and mixed sign | Fixed (∞,0); 15 Shapiro terms; seven commutator cycles; one degree-three boundary | Symbolic reduction verified. Swap on H₁⊗H₁ is minus flip. Integral diagonal relation is 2t=0, not t=0. |
| d³ splitting / `rankTwoBoundarySplit` | Raw (−alt(t),t); t=0; alt=0; valuation at a=3 | Total-complex d³ is (−w,t), then shear gives (0,t). Lean proves inverse/cancellation and the numeric two-term (1,−1)→(0,−1); zero alt fixes the full pair. |
| Stable mixed H₃ and relative monomial generators | m=n=1; pure factors; Tor₁(C₃,C₃)=C₃ | Determinant sections lift the mixed Tor term to the diagonal image. Stable-colimit target avoids an unspecified finite-rank bound. |
| D₈/permutation vanishing and basis API | Integral determinant/inverse; all three conjugations; reduction mod2 | Γ has det +1 and the stated inverse; all identities proved in Lean. Off-block entries retained, so the Levi is T₂×M₂. |
| Symmetric homology primes and stable range | i=0/1/3; Σ₁→Σ₂; 2-,3-,5-primary parts of Σ₆ | n≥2i includes Σ₆ for H₃. C₃×C₃ mixed Tor killed by diagonal image, not set to zero; C₅ normalizer power two kills its stable H₃. |
| Stable elements and duality | n=0; d=0 excluded; trivial Sylow; nontrivial fusion | H⁰ identity; positive-degree restriction has prime-to-r index; restriction dualizes inclusion, not transfer. Swan period requires r∣|G|. |
| Cyclic and quaternion homology/maps | C₇ power two; C₂→C₄; Q₈ degree1/3; degree0 | Power acts by four on H₃; inclusion sends 1 to2 and is injective. Q₈ H₁=C₂² versus H₃=C₈; H₀=ℤ. |
| Finite SL₂ periods, subgroup and extension maps | q=2/3/4; each r≠ℓ; identity and quadratic extension; characteristic exceptions | Localized groups have orders 3,8,15. Period-class restriction proves actual subgroup injections; Sylow images give extension injection. All seven characteristic-primary exceptions retained separately. |
| GL₂ conjugation | Nonsquare a in Fˣ; extension to Fq², including char2 | a becomes a square, so conjugation becomes inner; extension-injectivity descends the equality. No characteristic-zero defining representation is assumed. |
| Actual finite stabilization / quadratic torus factorization | F₂⊂F₄ (3 in15); F₃⊂F₉ (8 in80); zero kernel; field-map composites | Equal-image argument concerns already injective subgroup maps. Root-cycle detector proves σ injective before cyclic orders prove surjectivity. Closure stabilization is a colimit output, not Sah input. |
| Refined presentation, λ₁/λ₂ and forgetful API | F₄ square classes trivial; F₅ λ₁[2]=0, λ₁[3]=2(1−ε); relation (2,3) | Presentation, quotient universal property and both boundary maps explicit. The character count produces J=I², Ī=C₂ and RB coinvariants=B by the cyclic sign-module calculation; RP itself need not equal P in odd characteristic. |
| Refined cross-ratio | Normalized tuple; (0,∞,a,b); nonsquare scaling; repeated point | Values [x], ⟨a⟩[b/a]; square-class coefficient essential. Repeated point excluded, not assigned an inadmissible reduced symbol. |
| Finite configuration exactness and general bar comparison | q=4 boundary range; adjacent repeats; distinct quadruple; transitive C₅ in SL₂(F₄) | Degree-three comparison valid at q=4. Explicit βx,y requires y outside the orbit; general free-resolution lifting exists even for the transitive C₅. Homotopy through degree3 proves choice independence and naturality. |
| Refined pages, d² and central module sign | Four Shapiro diagonal coordinates; µ₂ trivial in char2; cyclic Fˣ | The d² source is Ī=I/J, with a≠0,1 for its tuple lift. Generic matrix check gives weights (1,+1),(1,−1),(a,−1),(1,+1), hence a⁻¹, class a mod squares. Central module sign and SL₂→GL₂ tensor coefficient −2 fixed by the raw pair (2w,−2t) and the shear; the (2,−2)→(0,−2) Lean witness pins it. |
| Refined edge filtration and forgetful equivalence | q=4 versus q≥5; Λ²Fˣ=0; Ī⊗µ₂; Borel characteristic summand | At q=4 the problematic term vanishes on E¹; no out-of-range degree-four truncation used. Borel image kills characteristic torsion before localization/order calculations. Every remaining total-degree-three term accounted for. |
| Finite odd two-primary calculation | q≡1 or−1 mod4; quaternion Sylow versus C₄; q=5/7 | Actual β images vanish by h(square)=0 or 2h(−1/y²)=0, distinguishing q+1 from (q+1)/2. |
| Enhanced Tor arrow, exactness and field maps | char2; odd q; q=4/5/7; closure µ₂ and Tor injections; q=2/3 excluded | Actual monomial arrow injects by closure naturality. Only after λ/σ and injection proofs do subgroup orders identify the kernel. Kernel orders are 3,8,12. No untwisted root inclusion is substituted. |
| Representative variable blocks | Arbitrary fields for face matrices; arbitrary abelian V,T and additive alt; integral Γ; finite field/prime characteristic for localized H₃ | README and Lean hypotheses agree. No extra result hypothesis or admitted carrier was introduced. Old theorem variable blocks unchanged. |

## Source work and reproducibility

Public original/author copies were read at the cited locations. Mathematical
formulas and proof plans in the package are in the worker's own words; no
source passage or section-by-section digest was added. Only the indicated
chain calculation of Mirzaii is used. Sah's paper was not obtained and is not
an input. Swan's original publisher page did not yield readable text; the
exact Theorems 1–2 statement used here was checked as reproduced in Hutchinson
Theorem 3.1, p.12. This is not a claim to have read Swan's original proof.
No uncleared book copy was obtained or used.

| Source / version | Locations used in this repair | SHA-256 of public PDF read |
| --- | --- | --- |
| Hatcher, author Algebraic Topology PDF | Examples 4.51–4.52 pp.380–381, Exercise37 p.392 | `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618` |
| Weibel author chapter III | §§6.4/6.6/7.8 and Exercises7.3/7.12/7.13 | `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307` |
| Weibel author chapter IV | IV.1 Exercises1.11–1.12 | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| Weibel author chapter V | V.11.3/11.11–11.13 | `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8` |
| Weibel author chapter VI | VI.1.3–1.6, VI.4.3, VI.5 | `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1` |
| Suslin 1991, public journal scan | §§2/4/5; especially Lemmas4.1–4.4/Sublemma4.4.1 pp.227–229 and Lemma5.7 p.236 | `ef16d5d93f6f9f6509f93e9b748f5cf06bda2a2a2da852404375638bab12994c` |
| Hutchinson arXiv:1107.0264v2 | §§2–4,6–7; exact refinements and maps | `057ce8a6ae5548fd9f6279514adfa3afa5a6554ad1e58f9ca34bb4c62df52e94` |
| Mirzaii arXiv:0807.2039v2 | Lemma4.1 pp.8–10 only | `840a11b01a716af1d5d016152725bb020d7842340f53968d9f9b8704102a7012` |
| Kerz arXiv:math/0410261v1 | Theorems1–2 pp.1–3, full five-page argument inspected | `0337c78d59bcfcc6ccb6acd4d22f7b7e930ebf0ac2cd00d48abed7114b6fef0d` |

Suslin 1984 §§2.6–2.7, pp.195–196 were read from the public MathNet version of
record linked in the README. All source URLs are listed there. The local
library INDEX was inspected; it does not clear Bloch's monograph. Exploratory
papers that did not supply a used theorem are not listed as proof inputs.

Two independent scratch calculations used exact rational functions, not
floating-point testing: (1) the generic eight-term GL₂ boundary, its 15-term
Shapiro image, reduction to seven commutators modulo one bar boundary, and
integral coinvariant reduction; (2) the four SL₂ Shapiro coordinates for d².
Both passed. An independent exterior-coordinate check gives the diagonal-torus raw pair (2w,−2t), hence coefficient −2 after the shear. Exact finite computations over prime fields q=3,5,7,11,13,17 also check the nonsquare-pair count and that λ₁ kills every admissible refined relation (the q=3 computation only tests the algebra; the finite Bloch construction remains q≥4). The complete finite formulas needed to repeat them are in README
§§4.11 and 5.4, so no scratch artifact is needed by the next worker. These
computations do not replace the general source/target proofs.

## Validation

- `lean-check research/blueprint/packages/K3BlochGroups/Suggested.lean`:
  exit 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with the
  pinned Tau Ceti environment `f790474821cf4256814db967cb154e7af3d0c369`.
  Only 23 theorem `sorry` warnings; no tactic lints or other warnings.
  The file has 453 lines, 23 theorem targets and 26 proved examples. Three
  added light definitions have real bodies; no heavy or admitted data carrier.
  Available memory exceeded 20 GiB (77 GiB before the final run). No Lean
  language server, project setup, cache command or package build was started.
- `python3 scripts/check_blueprint.py` on K3BlochGroups and V.1–V.6:
  all seven give 0 errors and 0 warnings. They were validated read-only;
  their existing gaps/requests are not discharged by passing the checker.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  4 files, 0 problems.
- `git diff --check`: passed.
