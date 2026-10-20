# FIX-PKG-HabiroRings~adv — completed package repair

Issue: #11307. Worker: Codex / GPT-6, session `codex-OlyDdf`. Date: 2026-10-20.
This is a complete fix submission, with the successor-design request below;
it is not a checkpoint or an independent review of this worker's changes.

## Finding dispositions

The named `REV-PKG-HabiroRings~adv.md` is absent from this checkout. The extant
`REV-PKG-HabiroRings.md` accepts the package with explicit spectral and arithmetic
supplier qualifications. I used that report, the issue's supplier obligation,
and the maintainer's 20 October de-cycling addition. I have not invented an
unavailable adversarial report. The accepted verdict is retained with those
qualifications; no conditional construction has become unconditional.

| Finding or obligation | Change |
| --- | --- |
| Scalar suppliers must precede RefinedTraceMethods | Added named exports in HR.1, HR.2, HR.5 and HR.6, and linked them individually under Downstream consumers. They concern perfectly covered bases, completed monoidal scalars, completed relative base change and the discriminant-localized number-field comparison. |
| Perfect covering is stronger than injective Adams maps | Retained the faithful-flatness equivalences, toric quotient counterexample and perfection universal property; exported `LambdaRing.IsPerfectlyCovered.adams_flat`. |
| Solid monoidality must not be inferred from abelian solid modules | Exported `SolidHabiroCompletion.unit_idempotent`, `boundedBelow_monoidal` and `boundedBelow_tensor` under the full spectral product/tower/resolution contract. Both tensor factors remain bounded below. MW §4.1 supplies the ambient solidification input, not all the Habiro comparison hypotheses. |
| Relative base change needs a completion | Named the stage, limit and flat variants. The flat toric series check distinguishes completed base change from a bare tensor. Arbitrary morphisms of pairs retain the separate completed module pullback. |
| Number-field scalar comparison and 6-divisibility | Named the étaleness and ring comparisons, including the radical discriminant variant. Discriminant inversion suffices for the scalar ring; the GSWZ line and supported field comparisons explicitly retain positive Δ divisible by 6 and the relevant discriminants. |
| HabiroRings/HabiroCohomologyFoundations cycle | Removed every HQ supplier reference. Moved the entire étale Habiro–Hodge comparison, including its filtration, naturality and quotient/completion compatibilities, to the downstream owner **HabiroRingsPartII, after HabiroCohomologyFoundations**. The old anchor and full statement remain. |
| Earlier completion or prismatic results do not identify smooth q-Witt forms | Checked DerivedDeRhamCohomology DD.1 and §4.4 and the prismatic Hodge–Nygaard targets. Ordinary derived de Rham–Witt/Nygaard and general completion are different inputs. No earlier smooth derived q-de Rham–Witt supplier was substituted. |
| Abstract descent omitted its overlap compatibility | Made the unit-compatible identity `L_i L_S ≃ L_(S∪{i})` explicit, gave a counterexample to using conservativity alone, and supplied the cyclotomic verification by iterated finite Koszul completion. Named `CyclotomicCompletionDiagram.iteratedCompletion`. This repairs the abstract statement without restricting the actual cyclotomic application. |
| Arithmetic fracture formula had lost a completion | Restored the post-localization completions in Q, Remark 2.5, pp.14–15. Named `CyclotomicDescent.completedArithmeticFracture`. The bounded-denominator example shows why localization cannot be assumed complete. |
| Local prerequisite cycles inside finite descent | Reconstruction and mapping-space targets now use the general localization principle and verified finite contract, before the final descent equivalence. Their former forward dependencies on that equivalence were removed. All local Needs links form an acyclic graph. |
| Legacy suggested file developed unavailable theory with admitted data | Replaced it by a compact file on genuine pinned carriers: four admitted milestone theorems, one real evaluator-based definition, two proved discriminating examples and one proved negative control. Heavy enhanced/arithmetic definitions and their full APIs stay in the README. |
| Required roadmap shape and tests | Reorganized all seven layers into numbered prose subsections, with Examples and Dependencies in each; moved already owned Witt interfaces to Exact supplier contracts. Preserved all 89 target anchors, all 294 original API specifications and all 131 original named checks. Added 20 named interfaces and further degenerate, normalization and negative-control checks. |

## Exact downstream move and maintainer requests

Open a design job for **HabiroRingsPartII, after HabiroCohomologyFoundations**.
Its first target is `hr-6-the-degree-zero-identification`, now retained in this
README's Downstream consumers: for every perfectly covered A and étale R/A,
the Habiro–Hodge complex is the static algebra H_(R/A), naturally in pairs,
with the empty-framing filtration identified with the (q−1)-adic filtration,
and with multiplicative cyclotomic quotient/completion compatibility.
The source is Q, Corollary 3.13, p.27, using Corollary 3.31 and Theorem 3.11(b),
p.25; the printed reference to 3.11(a) does not identify the derived forms.
Its statement and three checks have not been narrowed or discarded.

Point RefinedTraceMethods' scalar suppliers at the named HR.1/HR.2/HR.5/HR.6
exports. Point any cohomological comparison it needs at the eventual Part II.
HabiroCohomologyFoundations, especially Layer 6, consumes the earlier scalar
interfaces; it cannot supply those interfaces back to this package. Its own
introductory HR.6 comparison references need reconciliation with this move.
No other package, order file, packet or upstream checkout was changed here.

The five solid spectral targets remain conditional on the full SA.1 spectral
contract, and the arithmetic line statements on HB.7's effective global
descent, inverse-tensor, integral linear-jet and supported naturality
certificates. These were already accepted qualifications. This fix names
their exports and retains their precise scope; it does not certify that those
supplier packages have implemented them.

## Mathematical adversarial pass

The table covers all 89 original mathematical specifications, including their
attached API laws and checks. Imported interfaces are tested as contracts of
their existing owner, not replanned. “Retained” means the calculation agrees
with the mathematical statement and its hypotheses; it does not mean a Lean
proof was supplied. Zero rings/modules and empty generator/index sets are
allowed wherever the statement allows them. Positive indices and primes are
not silently extended to 0 or 1. Noncompactness and topological groups do not
enter these algebraic statements; spectral boundedness does, and is recorded.

Links below point to the preserved specification anchors in the package.

| Statement | Instances and boundary calculation | Result/change |
| --- | --- | --- |
| [Torsion-free Adams data](../packages/HabiroRings/README.md#hr-1-lambda-rings-with-commuting-adams-operations) | ℤ: δ₂(3)=−3; toric ℤ[x]: ψ²(x)=x²; identity on ℤ[x] fails mod 2. | Retained QW supplier; prime congruence is essential. |
| [Dwork criterion](../packages/HabiroRings/README.md#hr-1-dwork-ghost-image) | Ghosts (1,3) give second coordinate 1; (1,2) would require 1/2. At p² retain p²-divisibility. | Retained integral criterion, not just mod-p agreement. |
| [Frobenius polynomials](../packages/HabiroRings/README.md#hr-1-universal-frobenius-polynomials) | First coordinate of F₂ is a₁²+2a₂; finite weighted degree and reduction mod 2 agree. | Retained QW supplier. |
| [Witt-ring congruence](../packages/HabiroRings/README.md#hr-1-witt-ring-frobenius-congruence) | Specialize universal integral identities to ℤ/4; ghosts there are not injective. | Retained Witt-ring divisibility; no torsion ghost argument. |
| [Comultiplication](../packages/HabiroRings/README.md#hr-1-big-witt-comonad) | Zero and Teichmüller vectors, including W(ℤ/4); outer ghosts take values in W(A). | Retained actual coaction, not arbitrary ghost data. |
| [Comonad laws](../packages/HabiroRings/README.md#hr-1-big-witt-comonad-laws) | Outer gh₁ and W(gh₁) have different maps; mixed indices 2,3 give gh₆. | Both counits and associativity retained. |
| [Coalgebras with torsion](../packages/HabiroRings/README.md#hr-1-lambda-coalgebra) | Zero ring and the cofree coalgebra W(ℤ/4); equality is equality of coaction maps. | Retained; no reconstruction from torsion ghosts. |
| [Coalgebra Adams laws](../packages/HabiroRings/README.md#hr-1-coalgebra-adams-laws) | ψ¹=id; ψ²(a)=c₁(a)²+2c₂(a), and indices 2,3 commute. | Retained for actual coalgebras, including torsion. |
| [Adams to Witt section](../packages/HabiroRings/README.md#hr-1-adams-to-witt-section) | Identity Adams on ℤ: s(2)₂=−1, s(2)₃=−2; zero maps to zero. | Torsion-freeness retained for division and uniqueness. |
| [Section laws](../packages/HabiroRings/README.md#hr-1-adams-witt-section-laws) | n=1 and prime n recover a and δ_p(a); a map into a torsion target cannot use ghost injectivity. | Retained naturality with torsion-free target. |
| [Coalgebra–Adams equivalence](../packages/HabiroRings/README.md#hr-1-wilkerson-comparison) | Identity binomial structure on ℤ and toric polynomial data; torsion is excluded from the converse. | Retained equivalence at its stated generality. |
| [Cofree adjunction](../packages/HabiroRings/README.md#hr-1-big-witt-cofree-adjunction) | Identity and zero maps; composition with gh₁ inverts W(f)s. | Retained on arbitrary-ring coalgebras. |
| [Generating series](../packages/HabiroRings/README.md#hr-1-witt-product-addition) | Precision 0 gives 1; precision 2 gives the first two Witt addition coordinates. | Retained finite-support coefficient calculation. |
| [Exterior operations](../packages/HabiroRings/README.md#hr-1-exterior-operations) | λ²(2)=1 but c₂(2)=−1; λ³(−1)=−1; λ⁰=1. | Retained exterior sign convention. |
| [Free Λ-ring](../packages/HabiroRings/README.md#hr-1-free-lambda-ring) | Empty generators give ℤ; singleton has ψ²(x)=x²+2c₂; infinite sets use finite monomials. | Retained free arithmetic object, not toric surrogate. |
| [Free adjunction](../packages/HabiroRings/README.md#hr-1-free-lambda-universal-property) | Empty/singleton generators and identity substitutions; all coordinates forced by coaction. | Retained arbitrary-ring target coalgebras. |
| [Free Adams presentations](../packages/HabiroRings/README.md#hr-1-free-adams-local-presentations) | p=2 exponents 0,1; empty generators; finite-support passage to infinite sets. | Retained twisted scalar action and prime-local split. |
| [Free perfect cover](../packages/HabiroRings/README.md#hr-1-free-lambda-perfect-cover) | Empty case is identity on ℤ; basis contains 1; away-p polynomial fibers are nonempty. | Retained faithful flatness, not just injectivity. |
| [Truncated big Witt](../packages/HabiroRings/README.md#hr-4-truncated-big-witt-vectors) | Div(1) is one coordinate; Div(2) has two; p-typical length k has k coordinates. | Retained QW convention and indexing distinction. |
| [Absolute q-Witt](../packages/HabiroRings/README.md#hr-4-q-witt-vectors) | m=1 gives R; m=2 over ℤ distinguishes FV=2 from an inverse pair. | Retained q-FV quotient, not ordinary Witt operations alone. |
| [s_m and c_m](../packages/HabiroRings/README.md#hr-4-the-lambda-ring-comparison-maps) | Toric A=ℤ[T], m=2: relative self-ring contains T; absolute comparison need not. | Retained domains, scalar actions and distinct maps. |
| [Relative q-Witt](../packages/HabiroRings/README.md#hr-4-relative-q-witt-rings) | R=A gives A[q]/(qᵐ−1); R=0 gives zero; A=ℤ agrees with absolute case. | Retained base twist and ordinary tensor convention under flatness. |
| [Étale q-Witt maps](../packages/HabiroRings/README.md#hr-4-q-witt-vectors-of-etale-maps) | Identity and zero étale algebras; d=m gives identity Frobenius square. | Retained étale and derived-flat pushout hypotheses. |
| [Relative ghosts](../packages/HabiroRings/README.md#hr-4-ghost-maps-and-etale-base-change) | m=2 self-pair gives q±1 quotients; characteristic-2 ghost injectivity cannot be assumed. | Retained joint injectivity only under standing torsion-free input. |
| [No restriction](../packages/HabiroRings/README.md#hr-4-there-is-no-restriction-map) | Truncation 2→1 conflicts with the Verschiebung relation; Frobenius has the required scalar behavior. | Retained obstruction, with specified proposed map. |
| [Naive quotient obstruction](../packages/HabiroRings/README.md#hr-4-an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift) | Cubic coefficient ring at 5 has no global lift, although its completion does. | Retained marked q-algebra hypothesis. |
| [Perfection](../packages/HabiroRings/README.md#hr-1-the-colimit-perfection) | ℤ and zero are fixed; toric x at stage m maps to x^(1/m). | Retained universal property and finite monomials. |
| [Perfect covering](../packages/HabiroRings/README.md#hr-1-perfectly-covered) | Toric ℤ[x] is free over x↦x²; ℤ[x,y]/xy has injective but nonflat Adams maps. | Exported faithful flatness explicitly. |
| [Relative Frobenius](../packages/HabiroRings/README.md#hr-1-relative-frobenius-of-an-etale-algebra) | S=B=𝔽₂[t]: twisted map is an isomorphism although absolute Frobenius is not. | Retained relative tensor and étaleness. |
| [Completed Frobenius](../packages/HabiroRings/README.md#hr-1-the-etale-frobenius-lift) | Self-pair toric ψ² is noninvertible; inverted p gives zero completion; cubic at 5 has only completed lift. | Added ordinary-completion existence/uniqueness milestone; no automorphism claim. |
| [Pairs](../packages/HabiroRings/README.md#hr-1-morphisms-of-pairs) | Identity, composite and zero base change; second map must commute with base maps. | Retained actual compatible ring maps. |
| [Habiro completion](../packages/HabiroRings/README.md#hr-2-habiro-complete-modules) | Zero, polynomial unit and R_r: completions are zero, H, zero respectively. | Retained completion/localization distinction. |
| [Two-term telescope](../packages/HabiroRings/README.md#hr-2-the-two-term-resolution) | d(e₀)=e₀−(1−q)e₁; augmentation is 1−(1−q)/P₁=0. | Corrected source sign/index convention retained. |
| [Completion adjunction](../packages/HabiroRings/README.md#hr-2-completeness-via-the-factorial-tower) | Already complete M is fixed; R_r is killed; unit is initial among maps to complete objects. | Retained reflector, not bare group-level limit. |
| [Homotopy completeness](../packages/HabiroRings/README.md#hr-2-completeness-on-homotopy-groups) | Static and shifted modules; both Hom and Ext¹ from the length-one resolution occur. | Retained unbounded statement with enhanced convergence input. |
| [Cyclotomic Nakayama](../packages/HabiroRings/README.md#hr-2-the-derived-nakayama-lemma) | Zero object passes; nonzero R_r has every reduction zero but is not complete. | Completeness and all factors retained. |
| [Staticity detection](../packages/HabiroRings/README.md#hr-2-the-detection-results) | ℤ with q=1 has derived (q−1)-quotient ℤ⊕Σℤ. | Retained only the valid direction from static reductions. |
| [Completed tensor](../packages/HabiroRings/README.md#hr-2-the-monoidal-structure) | Unit and zero tensors; q²−1/q³−1 intersection has a degree-one Tor term. | Retained derived tensor and completed unit. |
| [Spherical localization](../packages/HabiroRings/README.md#hr-2-spherical-rational-localization) | π₀ is R_r; sphere homotopy is not discarded by replacing it with HR_r. | Retained spherical carrier. |
| [Spectral completion](../packages/HabiroRings/README.md#hr-2-spectral-habiro-completion) | Unit and zero; restricting HR-modules is lax monoidal while HR-relative tensor comparison is strong. | Retained correct monoidal base. |
| [Solid embedding](../packages/HabiroRings/README.md#hr-2-habiro-complete-solid-spectra) | Completed discrete unit and zero recover their points; uncompleted discrete products need separate comparison. | Full spectral supplier retained. |
| [Solid unit](../packages/HabiroRings/README.md#hr-2-solid-habiro-unit-idempotence) | P₁ and P₂ have degrees 1 and 3 with unit constant term; splittings are sphere-linear. | Named idempotence under tower and balanced-tensor contract. |
| [Completed countable sums](../packages/HabiroRings/README.md#hr-2-completed-countable-free-solid-modules) | Empty blocks give zero; constant 1 does not decay; P_n-weighted blocks do. | Retained reverse profile order and fiber ideals. |
| [Countable solid tensor](../packages/HabiroRings/README.md#hr-2-countable-solid-habiro-tensor) | Empty factor gives zero; P₁² divides P₂; radial and separable proper weights give both comparisons. | Retained product/colimit hypotheses. |
| [Bounded-below closure](../packages/HabiroRings/README.md#hr-2-the-solid-comparison-is-bounded-below) | Connective unit and zero; arbitrarily negative shifts fail uniform boundedness. | Named monoidal and closure exports with both bounds. |
| [Cyclotomic intersections](../packages/HabiroRings/README.md#hr-3-the-divisor-poset-and-its-intersections) | {1,2} gives radical (2,q−1); {1,6} gives unit; {1,4} is a surviving redundant overlap. | Retained ideals/radicals distinction. |
| [Finite index](../packages/HabiroRings/README.md#hr-3-finite-descent-index) | m=1,4,6,12 give 1,4,8,11 vertices; {1,4} is absent from P(4). | Retained subset order and maximal chains. |
| [Height one](../packages/HabiroRings/README.md#hr-3-finite-index-height-one) | P(1) has no edge; P(6) has an undirected cycle but no composable nonidentity edges. | Retained coherent, not discrete, mapping data. |
| [Prime edges](../packages/HabiroRings/README.md#hr-3-prime-edge-factorisation) | 1→2→4 and 3→6→12 sit in unique 2-chains; composites follow their unique paths. | Retained marked composition coherence. |
| [Abstract descent](../packages/HabiroRings/README.md#hr-3-the-general-descent-principle) | Identity cover, disjoint product, and two identity restrictions with zero overlap. Last example contradicts descent without compatibility. | Added necessary coherent overlap identity and negative control. |
| [Completion diagram](../packages/HabiroRings/README.md#hr-3-coherent-completion-diagram) | m=1 is one completion; chain {1,2,4} gives (2,q−1); unit overlap gives zero category. | Retained transition direction and straightening input. |
| [Finite contract](../packages/HabiroRings/README.md#hr-3-finite-localisation-contract) | Repeated ideal, (q−1,q+1)=(q−1,2), and (q−1,Φ₆)=1. | Added named iterated completion and finite-Koszul proof. |
| [Reconstruction](../packages/HabiroRings/README.md#hr-3-reconstruction-functor) | Single vertex reconstructs itself; m=4 recovers redundant {1,4}; zero local data reconstruct zero. | Removed circular dependency; kept marked unit/counit. |
| [Mapping spaces](../packages/HabiroRings/README.md#hr-3-prime-edge-mapping-spaces) | m=1 has no edge product; m=6 retains four paths, not strict equality of vertices. | Removed circular prerequisite; homotopy equalizer retained. |
| [Descent equivalence](../packages/HabiroRings/README.md#hr-3-the-morphism-level-statement) | Identity/zero data and redundant prime-power subsets; both reconstruction and maps recovered. | Retained enhanced full faithfulness. |
| [Complete gluing](../packages/HabiroRings/README.md#hr-3-the-complete-descent-corollary) | m=1, zero algebra, and m=6 with its four marked edge equivalences. | Retained contractible marked solution space. |
| [Arithmetic pieces](../packages/HabiroRings/README.md#hr-3-the-fracture-square-pieces) | m=1 identity; m=2 has series Σt^r/2^r outside the uncompleted localization; m=12,p=2 has two chains. | Restored localization-then-completion; named comparisons. |
| [Marked deformation](../packages/HabiroRings/README.md#hr-4-marked-etale-deformation) | Identity/zero deformation and conjugated markings; maps must preserve the chosen marking. | Retained actual marking data. |
| [Quotient lift](../packages/HabiroRings/README.md#hr-4-etale-quotient-lift) | I=0 and I=B; nonnilpotent I does not give uniqueness of lifts. | Retained existence for arbitrary ideals only. |
| [Nilpotent rigidity](../packages/HabiroRings/README.md#hr-4-nilpotent-deformation-rigidity) | Zero and square-zero ideal; an arbitrary nonnilpotent ideal is outside the equivalence. | Nilpotence retained on full faithfulness. |
| [Completed lift](../packages/HabiroRings/README.md#hr-4-completed-etale-deformation) | I=0 gives D; I=B gives zero; principal complete lift need not be finite-presentation étale over B. | Finite generation retained; no extra flatness claim. |
| [Completed mapping property](../packages/HabiroRings/README.md#hr-4-completed-deformation-map-equivalence) | Identity, zero and complete power-series targets; nilpotent-level maps are unique. | Completeness of target and ordinary convention retained. |
| [Principal universality](../packages/HabiroRings/README.md#hr-4-complete-principal-deformation-universality) | f unit gives zero deformation; B/f itself has extra derived f-Tor when nonzero. | Regular f and derived marked reduction retained. |
| [Finite relative stage](../packages/HabiroRings/README.md#hr-4-the-finite-relative-habiro-rings) | m=1 gives R[[q−1]]; R=0 gives zero; self-pair retains all cyclotomic pieces. | Retained twisted coefficients and inverse-system direction. |
| [Ghost lift coherence](../packages/HabiroRings/README.md#hr-4-cyclotomic-ghost-lift-coherence) | Singleton and prime edge; two marking-preserving finite-level lifts coincide. | Retained maps and paths before taking π₀. |
| [Finite Habiro/q-Witt](../packages/HabiroRings/README.md#hr-4-the-etale-lift) | m=1, R=A and R=0; nonétale R is excluded from the deformation argument. | Explicit étaleness and regularity retained. |
| [Frobenius transitions](../packages/HabiroRings/README.md#hr-4-the-transitions-are-frobenius) | d=m identity and e divides d divides m; Frobenius and restriction have different reduced behavior. | Retained Frobenius, not restriction. |
| [Static inverse limit](../packages/HabiroRings/README.md#hr-4-the-limit-of-the-finite-stages-is-static) | Fixed d on the divisible tail gives a constant static Φ_d-reduction, including d=1. | Retained finite-cofiber argument; no general exact inverse-limit claim. |
| [Relative ring](../packages/HabiroRings/README.md#hr-5-the-relative-habiro-ring) | Self-pair ℤ, zero R and first finite projection; q−1 is not a unit. | Retained completed limit and ordinary universal property. |
| [Roots and substitutions](../packages/HabiroRings/README.md#hr-5-roots-choices-and-substitutions) | m=1; compatible 3/6 roots versus usual incompatible choices; Gaussian order-four coefficient has two factors. | Retained full tensor algebra and root-change action. |
| [Taylor comparison](../packages/HabiroRings/README.md#hr-5-the-ell-adic-taylor-comparison) | m=5,ℓ=11 gives four linear factors; ℓ dividing m is excluded. | Retained full finite étale algebra, not irreducibility over finite fields. |
| [Taylor equalizer](../packages/HabiroRings/README.md#hr-5-the-equaliser-presentation) | Zero, classical ℤ and cubic constants at 5; root values alone lose higher coefficients. | Retained every prime edge and full Taylor expansion. |
| [Untwisting](../packages/HabiroRings/README.md#hr-5-untwisted-relative-habiro-rings) | R=A and ℤ[1/p] work; cubic ring without global lift does not meet hypothesis. | Global compatible linearizations retained. |
| [Completed base change](../packages/HabiroRings/README.md#hr-5-completed-base-change) | Identity, zero target, toric flat extension with ΣP_n(q)t^n of unbounded t-degree. | Named stage/limit/flat exports; completion retained. |
| [Classical comparison](../packages/HabiroRings/README.md#hr-5-number-field-comparison-the-classical-ring) | A=R=ℤ and first Taylor projection agree with HC; coefficients are integral. | Named compatibility, classical theory remains HC's. |
| [Discriminant localization](../packages/HabiroRings/README.md#hr-5-number-field-comparison-the-inverted-discriminant-ring-is-etale) | ℚ,Δ=1; ℚ(i),Δ=2; Δ=1 fails for ℚ(i). | Named multiple and radical forms; no 6 hypothesis for this ring theorem. |
| [GSWZ ring](../packages/HabiroRings/README.md#hr-5-number-field-comparison-the-number-field-ring) | ℚ,Δ=1 and 2; ℚ(i) retains both fourth-root factors; p dividing Δ gives zero completion. | Named ℤ[q]-equivalence; no assumed R-constants. |
| [Completed scalar extension](../packages/HabiroRings/README.md#hr-6-completed-scalar-extension) | Identity/composite maps of pairs and zero modules; tensor unit maps to target unit. | Retained actual complete module categories and coherences. |
| [Transported lines](../packages/HabiroRings/README.md#hr-6-the-transported-regulator) | ξ=0 and ξ plus −ξ; Δ=6 times absolute discriminant; local rank one alone is insufficient. | Named actual HB.7 pullback with all certificates. |
| [q−1 map](../packages/HabiroRings/README.md#hr-6-the-q-minus-one-completion-is-not-injective) | ℤ injective; ℤ[1/2] has killed idempotents; q² maps to 1+2X+X². | Named map; third sign check added. |
| [Order-one fiber](../packages/HabiroRings/README.md#hr-6-order-one-fibre) | Tensor-unit evaluator sends 1⊗r to r; negative evaluator sends 1⊗3 to −3; zero has no unit preimage. | Real light definition and two proved Lean examples plus proved negative control. |
| [Completed line](../packages/HabiroRings/README.md#hr-6-completed-regulator-triviality) | R=0 and ℤ×ℤ; lifts 1 and 1+X have same fiber but different bases. | General arbitrary-R theorem retained, no locality or Noetherianity. |
| [Completed Picard class](../packages/HabiroRings/README.md#hr-6-the-regulator-dies-after-q-minus-one-completion) | ξ=0 and inverse pair; integral fiber marking supplies Nakayama. | Named conditional vanishing; no nonzero regulator claim. |
| [Field scalar square](../packages/HabiroRings/README.md#hr-6-regulator-scalar-square) | Identity and two successive field embeddings; common Δ must invert 6 and both discriminants. | Named supported pullback; no tensor over nonexistent R-action on H. |
| [Φ₅ over 𝔽₁₁](../packages/HabiroRings/README.md#hr-7-phi-five-over-f-eleven) | Roots 3,4,5,9 are distinct; all four stated lifts satisfy Φ₅=0 modulo 11⁴. | Four factors retained. |
| [Inverted prime](../packages/HabiroRings/README.md#hr-7-inverting-a-prime) | p=2: valuation-of-order factors are nonzero and give idempotents killed at q=1. | Retained ℤ[1/p], not ℤ_(p). |
| [Cubic constants](../packages/HabiroRings/README.md#hr-7-constant-families-do-not-glue) | Mod 5 factor (x−3)(x²+3x+4); quadratic discriminant 3 is nonsquare. | Completed Frobenius moves quadratic factor; constant generator fails gluing. |
| [Finite-stage obstruction](../packages/HabiroRings/README.md#hr-7-the-stage-is-not-the-naive-completion) | Cubic ring and m divisible by 5 would force the absent global Frobenius. | Retained marked ℤ[q]-algebra nonisomorphism only. |
| [Later Habiro–Hodge comparison](../packages/HabiroRings/README.md#hr-6-the-degree-zero-identification) | Self-pair ℤ, zero R and ℤ[1/2] components; dimension-zero forms still need the full smooth theorem. | Moved intact to Part II; corrected source reference to 3.11(b). |

## Libraries, sources and verification

Read the package audit and existing independent review before the repair.
The pinned Mathlib inputs remain 082e2d37e8b0463410cdb532e111cd43d5a66174
and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The light definition uses
the existing invertible-module surjectivity criterion rather than replanning
it; completion, localization, tensor, Picard and discriminant declarations are
cited as library interfaces, not newly owned definitions.

The current read-only upstream roadmap commit checked was
0d144d044dacebca17b654695b6f1ad58f159b27, and current Tau Ceti was
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches by Habiro/cyclotomic
completion, q-Witt/q-Hodge, perfect-cover/Adams, Frobenius lifting,
discriminant-localized étaleness and invertible power-series modules found no
additional positive supplier for the new targets. Existing ordinary tensor,
Picard and polynomial factorization infrastructure remains cited. The newer
roadmaps do not supply these missing arithmetic or solid spectral carriers.
I read the current AdicSpaces and SemisimpleAlgebras roadmaps and their suggested
files as upstream structural references. No build was run in those checkouts.

Source versions read for the changed assertions, all public, accessed 2026-10-20:

| Source | Locators used | PDF SHA-256 |
| --- | --- | --- |
| [Wagner, Habiro v2](https://arxiv.org/pdf/2510.04782v2) | Notation 1.22(e), p.12; Setup 2.1/Lemma 2.2 and Remark 2.5, pp.13–15; 2.7–2.14, pp.15–19; Theorem 3.11(b), p.25 and Corollary 3.13, p.27; Appendix B, pp.77–80. | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [GSWZ v2](https://arxiv.org/pdf/2412.04241v2) | Definition 1.1 and (11)–(13), pp.6–7; Theorem 1, p.9; Definition 1.4/Theorem 2, p.10; Proposition 1.5(f), p.11; §3.3, pp.43–45. | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| [Meyer–Wagner, q-Hodge complexes and refined TC−](https://ferdinand-wagner.github.io/papers/q-Hodge.pdf), 5 February 2026 | §4.1, 4.1, pp.41–42; ambient light solid spectra and monoidal solidification. | `74b8a5c122cc54f5b347a49c895fdafc12e36f376fdd7165036b0c80277b3538` |
| [Wagner, q-Witt v5](https://arxiv.org/pdf/2410.23078v5) | §§2.4–2.6, pp.26–35; relative base change, étale ghosts and restriction obstruction. | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |
| [Stacks, Tag 0920](https://stacks.math.columbia.edu/tag/0920) | Lemma 15.93.18 and its finite-Koszul description of completion; used with DD.1 §1.3 to derive iterated completion. | Web statement, stable tag. |

All repository prose is authored mathematical specification, without source
passages. No restricted book was copied or needed. No suspicious instruction
was encountered in the untrusted material.

Validation completed:

- `lean-check` on the final Suggested.lean: exit 0, zero errors, exactly four
  warnings, all declaration uses `sorry`. Mathlib is the only import. This is
  elaboration of four milestone signatures, not proofs of the roadmap or a
  native Tau Ceti integration build. The real trivialization, both examples
  and the zero-evaluation negative control elaborate without admissions.
- `scripts/check_sorry_data.py`: exit 0; no admitted data definitions. The file
  has one module docstring and is below 5,000 lines. No language server or
  package build was started.
- `scripts/check_blueprint.py` on all six original HabiroRings packets: zero
  errors and zero warnings for each. Existing packet gaps and requests are
  unchanged; package acceptance has its explicitly conditional meaning.
- Structural cross-check against the initial README: all 89 distinct anchors,
  all 294 API names and all 131 named checks retained; 20 additional named
  interfaces. Seven numbered layers each have Examples and Dependencies.
  All local Needs anchors resolve, and their directed graph has no cycles.
  No HQ supplier reference remains. There is no callable `mech_check` tool or
  script in this environment; these concrete checks cover the mechanical
  requirements without claiming a nonexistent checker ran.

- `research/blueprint/intake.py check-files` on the four deliverables: four
  files, zero problems. `git diff --check`: clean. All four displayed lifted
  roots of Φ₅ were also checked directly modulo 11⁴.

Only the three named package files and this handoff are changed.
The maintainer's Part II design job is the remaining programme action; no
work in another package or a second claim was taken by this worker.
